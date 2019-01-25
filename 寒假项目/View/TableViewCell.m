//
//  TableViewCell.m
//  寒假项目
//
//  Created by 康思婉 on 2019/1/22.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _queryLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_queryLabel];
        
        _phoneticLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_phoneticLabel];
        
        _exam_typeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_exam_typeLabel];
        
        _translationLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_translationLabel];
    }
    return self;
}
-(void)layoutSubviews{
    _queryLabel.frame = CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height / 2);
    _queryLabel.backgroundColor = [UIColor redColor];
    _queryLabel.tintColor = [UIColor blackColor];
//    [_queryLabel sizeToFit];
    
    _phoneticLabel.frame = CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width / 2, self.frame.size.height / 2);
    _phoneticLabel.backgroundColor = [UIColor purpleColor];
    _phoneticLabel.tintColor = [UIColor darkGrayColor];
    
    _translationLabel.frame = CGRectMake(0, self.frame.size.height / 2, self.frame.size.width / 2, self.frame.size.height / 2);
    _translationLabel.backgroundColor = [UIColor yellowColor];
    _translationLabel.tintColor = [UIColor darkGrayColor];
    
    _exam_typeLabel.frame = CGRectMake(self.frame.size.width / 2, self.frame.size.height / 2, self.frame.size.width / 2, self.frame.size.height / 2);
    _exam_typeLabel.backgroundColor = [UIColor blueColor];
    _exam_typeLabel.tintColor = [UIColor darkGrayColor];
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
