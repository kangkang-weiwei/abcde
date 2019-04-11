//
//  DJSSentenceModel.h
//  寒假项目
//
//  Created by 康思婉 on 2019/4/10.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJSSentenceModel : NSObject

@property(nonatomic , strong)NSArray *wordArray;

-(void)initWithModel;
-(NSMutableArray *)buttonWithWidth:(NSMutableArray *)wordArray;

@end
