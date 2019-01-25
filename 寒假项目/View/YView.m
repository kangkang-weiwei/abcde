//
//  YView.m
//  寒假项目
//
//  Created by 康思婉 on 2019/1/19.
//  Copyright © 2019年 康思婉. All rights reserved.
//
#import "Masonry.h"
#import "YView.h"

@implementation YView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc]init];
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(50);
            make.left.equalTo(self);
            make.bottom.equalTo(self);
            make.right.equalTo(self);
        }];
        _tableView.alpha = 0.5;
        _tableView.tag = 2019;
        
        _cancelButton = [[UIButton alloc]init];
        [self addSubview:_cancelButton];
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.width.mas_equalTo(50);
            make.bottom.equalTo(self->_tableView.mas_top);
        }];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.backgroundColor = [UIColor colorWithRed:0.89f green:0.55f blue:0.50f alpha:1.00f];
        _cancelButton.alpha = 0.5;
        
        _searchBar = [[UISearchBar alloc]init];
        [self addSubview:_searchBar];
        [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self->_cancelButton.mas_right);
            make.bottom.equalTo(self->_tableView.mas_top);
            make.right.equalTo(self).offset(-80);
        }];
        _searchBar.alpha = 0.5;
        
        _exchangeButton = [[UIButton alloc]init];
        [self addSubview:_exchangeButton];
        [_exchangeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self->_searchBar.mas_right);
            make.right.equalTo(self);
            make.bottom.equalTo(self->_tableView.mas_top);
        }];
        [_exchangeButton setTitle:@"英->中" forState:UIControlStateNormal];
        _exchangeButton.backgroundColor = [UIColor colorWithRed:0.89f green:0.55f blue:0.50f alpha:1.00f];
        _exchangeButton.alpha = 0.5;
        
        
    }
    return self;
}

@end
