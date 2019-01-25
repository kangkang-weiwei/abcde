//
//  YModel.m
//  寒假项目
//
//  Created by 康思婉 on 2019/1/19.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import "YModel.h"
#import <CommonCrypto/CommonDigest.h>
#import "AFNetworking.h"

@implementation YModel

-(void)initWithModel{
    _allDataDic = [[NSDictionary alloc]init];
    _postSimpleDict = [[NSDictionary alloc]init];
    _simpleDic = [[NSDictionary alloc]init];
}
-(void)changeName:(NSDictionary *)dic{
    self.postSimpleDict = dic;
}
//request//q:要翻译的文本////from源语言////to目标语言////salt随机数////appKey应用ID////sign签名md5产生//
-(void)requestTranslation:(BOOL)translation Text:(NSString *)textString showTheView:(BOOL)showTheView{
    NSString *appKey = @"21b561135fddf97e";
    NSString *salt = @"2";
    NSString *key = @"JQHkTNdBlnBEDYC5SOGV6ESDibPFaasf";
    NSString *from;
    NSString *to;
    if (translation) {
        from = @"EN";
        to = @"zh-CHS";
    }else{
        from = @"zh-CHS";
        to = @"EN";
    }
    NSString *String = [NSString stringWithFormat:@"%@%@%@%@",appKey,textString,salt,key];
    NSString *sign = [self getMD5HashWithMessage:String];
    NSString *urlString = [NSString stringWithFormat:@"https://openapi.youdao.com/api?q=%@&from=%@&to=%@&appKey=%@&salt=%@&sign=%@",textString,from,to,appKey,salt,sign];
    NSLog(@"------- %@",urlString);
//    [self AnalysisJSON:urlString showTheView:showTheView];
    [self testAFGet:urlString showTheView:showTheView];
}
-(NSString *)getMD5HashWithMessage:(NSString *)message{
    //MD5加密，网络请求需要
    const char *cStr = [message UTF8String];
    unsigned char result[16];
    CC_MD5(cStr,(unsigned)strlen(cStr),result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",result[0], result[1], result[2], result[3],result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11],result[12], result[13], result[14], result[15]];
}

- (void)AnalysisJSON:(NSString *)urlString showTheView:(BOOL)showTheView{
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *urlRequest;
    urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *sessionDataTask;
    sessionDataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            id objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"---%@",objc);
            self->_allJson = [[AllJson alloc]initWithDictionary:objc error:nil];
            NSLog(@"%@",self->_allJson);
            NSMutableArray *exam_typeArray = [NSMutableArray array];
            if (self->_allJson.basic[@"exam_type"] != nil) {
                exam_typeArray = self->_allJson.basic[@"exam_type"];
            }else{
                [exam_typeArray addObject:@"四级"];
                NSLog(@"==%@",exam_typeArray[exam_typeArray.count - 1]);
            }
            NSMutableArray *phoneticArray = [NSMutableArray array];
            if (self->_allJson.basic[@"phonetic"] != nil) {
                phoneticArray = self->_allJson.basic[@"phonetic"];
            }else{
                [phoneticArray addObject:@"无音标"];
            }
            NSMutableArray *uk_phoneticArray = [NSMutableArray array];
            if (self->_allJson.basic[@"uk-phonetic"] != nil) {
                uk_phoneticArray = self->_allJson.basic[@"uk-phonetic"];
            }else{
                [uk_phoneticArray addObject:@"无英式音标"];
            }
            NSMutableArray *us_phoneticArray = [NSMutableArray array];
            if (self->_allJson.basic[@"us-phonetic"] != nil) {
                us_phoneticArray = self->_allJson.basic[@"uk-phonetic"];
            }else{
                [us_phoneticArray addObject:@"无美式音标"];
            }
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                NSLog(@"%@--%@--%@--%@",self->_allJson.query,self->_allJson.translation,phoneticArray,exam_typeArray[exam_typeArray.count - 1]);
                NSDictionary *testDic = @{@"query":self->_allJson.query , @"translation":self->_allJson.translation , @"phonetic":phoneticArray , @"exam_type":exam_typeArray[exam_typeArray.count - 1]};
                if (showTheView) {
                    [self changeName:testDic];
                }
                NSDictionary *part1 = @{@"query":self->_allJson.query , @"translation":self->_allJson.translation , @"phonetic":phoneticArray , @"uk-phonetic":uk_phoneticArray , @"us-phonetic":us_phoneticArray , @"exam_type":exam_typeArray};
                NSDictionary *part2 = @{@"explains":self->_allJson.basic[@"explains"]};
                NSDictionary *part3 = @{@"web":self->_allJson.web , @"webdict":self->_allJson.webdict};
                self->_allDataDic = @{@"part1":part1 , @"part2":part2 , @"part3":part3};
//                [[NSNotificationCenter defaultCenter]postNotificationName:@"allData" object:nil userInfo:self->_allDataDic];
            }];
        }
    }];
    [sessionDataTask resume];
}

-(void)testAFGet:(NSString *)urlString showTheView:(BOOL)showTheView{
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *dict = @{@"STORIES":@"wei"};
    [manager GET:urlString parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"success--%@--%@--%@",[responseObject class],responseObject,responseObject[@"basic"][@"exam_type"]);
        
        NSDictionary *basic = responseObject[@"basic"];
        
//        NSMutableArray *exam_type = [NSMutableArray array];
//        if (basic[@"exam_type"] == nil){
//            [exam_type addObject:@"四级"];
//        }else{
//            exam_type = basic[@"exam_type"];
//        }
        NSString *exam_type = [[NSString alloc]init];
        if (basic[@"exam_type"] == nil) {
            exam_type = @"四级";
        }else{
            NSArray *examArray = [NSArray array];
            examArray = basic[@"exam_type"];
            for (int i = 0; i < examArray.count; i++) {
                NSString *string = examArray[i];
                exam_type = [exam_type stringByAppendingString:string];
                NSLog(@"%@",exam_type);
                if (i != examArray.count - 1) {
                    exam_type = [exam_type stringByAppendingString:@"/"];
                }
            }
        }
        
        NSMutableArray *phonetic = [NSMutableArray array];
        if (basic[@"phonetic"] == nil) {
            [phonetic addObject:@"无标准音标"];
        }else{phonetic = basic[@"phonetic"];}
        NSMutableArray *us_phonetic = [NSMutableArray array];
        if (basic[@"us-phonetic"] == nil) {
            [us_phonetic addObject:@"无美式音标"];
        }else{us_phonetic = basic[@"us-phonetic"];}
        NSMutableArray *uk_phonetic = [NSMutableArray array];
        if (basic[@"uk-phonetic"] == nil) {
            [uk_phonetic addObject:@"无英式音标"];
        }else{uk_phonetic = basic[@"uk-phonetic"];}
        NSMutableArray *explains = [NSMutableArray array];
        if (basic[@"explains"] == nil) {
            [explains addObject:@"无基本释义"];
        }else{explains = basic[@"explains"];}
        
        NSString *query = responseObject[@"query"];
        
        NSString *translation = [[NSString alloc]init];
        if (responseObject[@"translation"] == nil) {
            translation = @"无翻译";
        }else{
            NSMutableArray *transArray = [NSMutableArray array];
            transArray = responseObject[@"translation"];
            for (int i = 0; i < transArray.count; i++) {
                NSString *string = transArray[i];
                translation = [translation stringByAppendingString:string];
                NSLog(@"%@",translation);
                if (i != transArray.count - 1) {
                    translation = [translation stringByAppendingFormat:@"，"];
                }
            }
        }
        
        NSMutableArray *web = [NSMutableArray array];
        if (responseObject[@"web"] == nil) {
            [web addObject:@"无网络释义"];
        }else{ web = responseObject[@"web"]; }
        
        NSString *webdict = responseObject[@"webdict"][@"url"];
        NSLog(@"%@",translation);
        self->_simpleDic = @{@"query":query,@"translation":translation,@"phonetic":phonetic,@"exam_type":exam_type};//tableview显示部分
        
        NSDictionary *part1 = @{@"query":query,@"translation":translation,@"phonetic":phonetic,@"us-phonetic":us_phonetic,@"exam_type":exam_type,@"explains":explains};
        NSDictionary *part2 = @{@"web":web,@"webdict":webdict};
        self->_allDataDic = @{@"part1":part1,@"part2":part2};
        NSLog(@"=====%@",self->_allDataDic);
        if (showTheView) {
            [self changeName:self->_allDataDic];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure--%@",error);
    }];
}
-(void)postAllData{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"allData" object:nil userInfo:_simpleDic];
}
//添加方法，点击cell返回allDataDic，通知或返回值


@end
