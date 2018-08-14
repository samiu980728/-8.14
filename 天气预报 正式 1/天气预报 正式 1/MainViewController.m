//
//  MainViewController.m
//  天气预报 正式 1
//
//  Created by 萨缪 on 2018/8/14.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "MainViewController.h"
#import "JPXFirstViewController.h"
#import "JPXFirstUIView.h"
#import "JPXSecondUIView.h"


@interface MainViewController ()
//屏幕宽

#define kScreenW [UIScreen mainScreen].bounds.size.width

//屏幕高

#define kScreenH [UIScreen mainScreen].bounds.size.height
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.jpg"]];
    
    
//    self.bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    self.bottomButton.frame = CGRectMake(kScreenW - 35, kScreenH - 35, 30, 30);
//
//    [self.bottomButton setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
//
//    [self.bottomButton addTarget:self action:@selector(onTapLiveBtn) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:self.bottomButton];
    
    //创建滚动界面
    UIScrollView * mainScrollView = [[UIScrollView alloc] init];
    mainScrollView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    //是否整页滚动
    mainScrollView.pagingEnabled = YES;
    //是否可以开启滚动效果
    mainScrollView.scrollEnabled = YES;
    
    //设置画布大小
    //刚好能滑动6个
    mainScrollView.contentSize = CGSizeMake(kScreenW*11, kScreenH);
    mainScrollView.bounces = NO;
    
    //横向 纵向弹动效果
   // mainScrollView.alwaysBounceVertical = YES;
   // mainScrollView.alwaysBounceHorizontal = YES;
    //显示水平滚动条
    mainScrollView.showsHorizontalScrollIndicator = YES;
    
    mainScrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.jpg"]];
    
    //添加UIView
    JPXFirstUIView * firstUIView = [[JPXFirstUIView alloc] init];
    firstUIView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [mainScrollView addSubview:firstUIView];
    
    [self.view addSubview:mainScrollView];
    
    //加第二个UIView
    JPXSecondUIView * secondUIView = [[JPXSecondUIView alloc] init];
    secondUIView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [mainScrollView addSubview:secondUIView];
    
    
    self.bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.bottomButton.frame = CGRectMake(kScreenW - 35, kScreenH - 35, 30, 30);
    
    [self.bottomButton setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    
    [self.bottomButton addTarget:self action:@selector(onTapLiveBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.bottomButton];
}

- (void)onTapLiveBtn

{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
