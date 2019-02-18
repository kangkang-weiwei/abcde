//
//  YSegleHand.h
//  寒假项目
//
//  Created by 康思婉 on 2019/1/29.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import <Foundation/Foundation.h>//单例，存储

@interface YSegleHand : NSObject

+(instancetype)sharedSegleHandle;
-(void)initDataBase;

-(void)insertIntoMainCell:(NSDictionary *)dic;
-(void)deleteMainCellTable:(NSDictionary *)dic;
-(void)deleteMainCellTable;
-(NSMutableArray *)getMainCellTable;
-(BOOL)searchMainCellTable:(NSDictionary *)dic;

-(void)insertIntoMoveColl:(NSDictionary *)dic;
-(void)deleteMoveCollTable:(NSDictionary *)dic;
-(BOOL)searchMoveCollTable:(NSString *)query;

@end
