//
//  ViewController.m
//  寒假项目
//
//  Created by 康思婉 on 2019/1/18.
//  Copyright © 2019年 康思婉. All rights reserved.
//

#import "ViewController.h"
//#import <CommonCrypto/CommonDigest.h>
#import "YView.h"
#import "Masonry.h"
#import "YModel.h"
#import "TableViewCell.h"
#import "MoveView.h"
#import "Part1_TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController{
    BOOL translation;//1位英->中，0位中->英
    BOOL moveUpDown;//1在下，可以升，0在下，可以降
    YView *mainView;
    YModel *model;
    MoveView *moveView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self->model = [[YModel alloc]init];
    [model initWithModel];
    [self->model addObserver:self forKeyPath:@"postSimpleDict" options:NSKeyValueObservingOptionNew context:nil];
    
    moveView = [[MoveView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 70)];
    
//    moveView.alpha = 0.8;
    moveView.backgroundColor = [UIColor whiteColor];
    
    translation = 1;
    moveUpDown = 1;
    mainView = [[YView alloc]init];
    [self.view addSubview:mainView];
    [self.view addSubview:moveView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];    NSInteger i = arc4random()%6;
    NSLog(@"随机图片：%ld",i);
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpeg",(long)i]]];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
//    label.layer.masksToBounds = YES;
//    label.layer.cornerRadius = 25;
//    label.backgroundColor = [UIColor blackColor];
    
    [mainView.exchangeButton addTarget:self action:@selector(translationBetweenChineseAndEnglish:) forControlEvents:UIControlEventTouchUpInside];
    mainView.searchBar.delegate = self;
    [mainView.cancelButton addTarget:self action:@selector(moveViewDown) forControlEvents:UIControlEventTouchUpInside];
    
    mainView.tableView.delegate = self;
    mainView.tableView.dataSource = self;
    [mainView.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    
    moveView.longTableView.delegate = self;
    NSLog(@"moveView:%@",[moveView class]);
    moveView.longTableView.dataSource = self;
    [moveView.longTableView registerClass:[Part1_TableViewCell class] forCellReuseIdentifier:@"cellL"];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(allDataFromModel:) name:@"allData" object:nil];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 2019) {
        TableViewCell *Cell = nil;
        Cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        //存放历史记录
        return Cell;
    }else{
        NSLog(@"%ld",(long)tableView.tag);
        Part1_TableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellL" forIndexPath:indexPath];
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 2019) {
        return (self.view.frame.size.height * 0.165) ;
    }else{
        return (self.view.frame.size.height * 0.5);
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc]init];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc]init];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(void)allDataFromModel:(NSNotification *)notification{
    NSDictionary *allData = notification.userInfo;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    id newData = [change objectForKey:NSKeyValueChangeNewKey];
    NSLog(@"newData --- %@",newData);
    
    if ([keyPath isEqualToString:@"name"] && object == self->model) {
//        NSLog(@"===%@",keyPath);
    }
}

-(void)translationBetweenChineseAndEnglish:(UIButton *)button{
    if (translation == 1){
//        translation = 0;
        [mainView.exchangeButton setTitle:@"中->英" forState:UIControlStateNormal];
    }else{
//        translation = 1;
        [mainView.exchangeButton setTitle:@"英->中" forState:UIControlStateNormal];
    }
    translation = !translation;
    //改变接口参数
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"searchText---%@",searchText);
    [self->model requestTranslation:translation Text:searchText showTheView:1];
    //升moveView
    if (moveUpDown) {
        [UIView animateWithDuration:0.5 animations:^{
            self->moveView.frame = CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 70);
        } completion:^(BOOL finished) {
            self->moveUpDown = !self->moveUpDown;
        }];
        //点击取消按钮moveUpDown改变
    }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [self->model removeObserver:self forKeyPath:@"postSimpleDict" context:nil];
}


@end
