//
//  MoveView.m
//  寒假项目
//
//  Created by 康思婉 on 2019/1/23.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import "MoveView.h"

@implementation MoveView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _longTableView = [[UITableView alloc]init];
        [self addSubview:_longTableView];
        _longTableView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _longTableView.tag = 101;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
