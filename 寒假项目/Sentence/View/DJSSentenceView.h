//
//  DJSSentenceView.h
//  寒假项目
//
//  Created by 康思婉 on 2019/4/10.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJSSentenceView : UIView

@property(nonatomic , strong)NSMutableArray *buttonArray;
@property(nonatomic , strong)UITextView *sentTextView;
@property(nonatomic , strong)UIButton *reloadButton;
@property(nonatomic , strong)UIButton *downButton;

-(void)typeSettingWordArray:(NSMutableArray *)wordArray WithbuttonWidth:(NSMutableArray *)buttonWidthArray;
-(void)ButtonremoveFromSuperView:(NSInteger)number WithAll:(BOOL)isRemove;

@end
