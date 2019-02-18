//
//  YWebView.h
//  寒假项目
//
//  Created by 康思婉 on 2019/2/13.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface YWebView : UIView

@property(nonatomic , strong)UILabel *youdaoLabel;
@property(nonatomic , strong)UIButton *backButton;
@property(nonatomic , strong)WKWebView *wkWebView;
@property(nonatomic , strong)UIProgressView *progressView;

@end
