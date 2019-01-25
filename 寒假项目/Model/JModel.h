//
//  JModel.h
//  寒假项目
//
//  Created by 康思婉 on 2019/1/20.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

//@interface JModel : JSONModel

//@end

@interface AllJson:JSONModel

@property(nonatomic , copy)NSString *tSpeakUrl;//翻译结果发音地址,一定存在
@property(nonatomic , copy)NSString *query;//源语言，查询正确有
@property(nonatomic , copy)NSArray *translation;//翻译结果，查询正确有
@property(nonatomic , strong)NSString *errorCode;//错误返回码,一定存在
@property(nonatomic , strong)NSDictionary *dict;//词典deeplink,存在
@property(nonatomic , strong)NSDictionary *webdict;//webdeeplink，存在
@property(nonatomic , strong)NSDictionary *basic;//基本词典,查词时才有
@property(nonatomic , copy)NSString *l;//源语言和目标语言,一定存在
@property(nonatomic , copy)NSString *speakUrl;//源语言发音地址,一定存在
@property(nonatomic , strong)NSArray *web;//网络释义，该结果不一定存在

@end
NS_ASSUME_NONNULL_END
