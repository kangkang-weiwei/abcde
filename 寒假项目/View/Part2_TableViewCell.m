//
//  Part2_TableViewCell.m
//  寒假项目
//
//  Created by 康思婉 on 2019/1/23.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import "Part2_TableViewCell.h"
#import "Masonry.h"

@implementation Part2_TableViewCell{
    UILabel *label;
    NSInteger numberOfLabel;
    NSMutableArray *heightWithArray;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        label = [[UILabel alloc]init];
        [self.contentView addSubview:label];
        
        _labelArray = [NSMutableArray array];
//        numberOfLabel = 1;
//        heightWithArray = [NSMutableArray array];
        
    }
    return self;
}

-(void)layoutSubviews{
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.height.mas_equalTo(@60);
    }];
    label.backgroundColor = [UIColor purpleColor];
    label.text = @"网络释义";
    
    for (int i = 0; i < numberOfLabel; i++) {
        if (numberOfLabel > 10) {
            break;
        }
        UILabel *downLabel = [[UILabel alloc]init];
        [self.contentView addSubview:downLabel];
        [downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.top.equalTo(self->label.mas_bottom);
            make.height.mas_equalTo(self->heightWithArray[i]);
        }];
        downLabel.backgroundColor = [UIColor colorWithRed:0.93f green:0.83f blue:0.88f alpha:1.00f];
        [_labelArray addObject:downLabel];
        
    }
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
