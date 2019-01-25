//
//  YModel.h
//  寒假项目
//
//  Created by 康思婉 on 2019/1/19.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JModel.h"

@interface YModel : NSObject

@property(nonatomic , strong)NSDictionary *postSimpleDict;
@property(nonatomic , strong)NSDictionary *allDataDic;
@property(nonatomic , strong)NSDictionary *simpleDic;

@property(nonatomic , strong)AllJson *allJson;

-(void)initWithModel;
-(void)requestTranslation:(BOOL)translation Text:(NSString *)textString showTheView:(BOOL)showTheView;
-(void)postAllData;

@end
