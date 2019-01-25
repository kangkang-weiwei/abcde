//
//  Part1_TableViewCell.m
//  寒假项目
//
//  Created by 康思婉 on 2019/1/23.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import "Part1_TableViewCell.h"
#import "Masonry.h"

@implementation Part1_TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _queryLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_queryLabel];
        
        _voiceButton = [[UIButton alloc]init];
        [self.contentView addSubview:_voiceButton];
        
        _collectionButton = [[UIButton alloc]init];
        [self.contentView addSubview:_collectionButton];
        
        _phoneticLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_phoneticLabel];
        
        _translationLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_translationLabel];
        
        _uk_phoneticLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_uk_phoneticLabel];
        
        _exam_typeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_exam_typeLabel];
        
        _explainsLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_explainsLabel];
    }
    return self;
}
-(void)layoutSubviews{
    CGFloat height = self.frame.size.height/5;
    //    CGFloat weight = self.frame.size.width;
    
    [self.queryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self->_voiceButton.mas_left);
        make.height.mas_equalTo(height);
    }];
    _queryLabel.backgroundColor = [UIColor purpleColor];
//    _queryLabel.frame = CGRectMake(0, 0, self.frame.size.width, 60);
    
    [self.voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self->_queryLabel.mas_right);
        make.height.mas_equalTo(self->_queryLabel.mas_height);
    }];
    _voiceButton.backgroundColor = [UIColor yellowColor];
    [_voiceButton setImage:[UIImage imageNamed:@"voice.png"] forState:UIControlStateNormal];
    
    [self.collectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self->_voiceButton.mas_right);
        make.height.mas_equalTo(self->_queryLabel.mas_height);
        make.right.equalTo(self);
    }];
    _collectionButton.backgroundColor = [UIColor blueColor];
    [_collectionButton setImage:[UIImage imageNamed:@"collection1.png"] forState:UIControlStateNormal];
    
    [self.phoneticLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_queryLabel.mas_bottom);
        make.left.equalTo(self);
        make.height.mas_equalTo(self->_queryLabel.mas_height);
        make.right.equalTo(self->_translationLabel.mas_left);
    }];
    _phoneticLabel.backgroundColor = [UIColor greenColor];
    _phoneticLabel.text = @"666666";
    
    [self.translationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_queryLabel.mas_bottom);
        make.left.mas_equalTo(self->_phoneticLabel.mas_right);
        make.height.mas_equalTo(self->_queryLabel.mas_height);
        make.right.equalTo(self);
    }];
    _translationLabel.backgroundColor = [UIColor redColor];
    
    [self.exam_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_phoneticLabel.mas_bottom);
        make.left.equalTo(self);
        make.height.mas_equalTo(self->_queryLabel.mas_height);
        make.right.equalTo(self);
    }];
    _exam_typeLabel.backgroundColor = [UIColor yellowColor];
    
    [self.explainsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_exam_typeLabel.mas_bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.mas_equalTo(self);
    }];
    _explainsLabel.backgroundColor = [UIColor blackColor];
    
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
