//
//  NormalButtonViewController.m
//  BaseDemo
//
//  Created by 闫博 on 2023/7/10.
//  Copyright © 2023 XiaoBo. All rights reserved.
//

#import "NormalButtonViewController.h"
#import "NormalButton.h"
#import "UIButton+JKSubmitting.h"
#import "LoadingUIButton.h"
#import "GradientButton.h"

@interface NormalButtonViewController ()

@property(nonatomic ,strong)UIScrollView *scrollView;

@end

@implementation NormalButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ListNormalColor;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNaviBarHeight)];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, 1.5 * kScreenHeight);
    [self.view addSubview:self.scrollView];
    self.title = @"UIButton组件";
    //设置normalBtn
    [self setNormalBtnData];
}
#pragma mark 设置normalBtn
-(void)setNormalBtnData
{
    UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, kScreenWidth / 2, 24)];
    mainLabel.text = @"主要按钮";
    [self.scrollView addSubview:mainLabel];
#pragma mark 主要按钮
    NormalButton *norBtn = [[NormalButton alloc] initWithFrame:CGRectMake(8, mainLabel.bottom + 10, 150, 48) title:@"移动端大按钮"];
    [norBtn setNormalButtonStyle:NormalButtonStyleMain whetherEnableBool:NO];
    [self.scrollView addSubview:norBtn];
    
    NormalButton *notTwoBtn = [[NormalButton alloc] initWithFrame:CGRectMake(norBtn.right + 8, norBtn.top + 6, 108, 36) title:@"主要按钮"];
    [notTwoBtn setNormalButtonStyle:NormalButtonStyleMain whetherEnableBool:NO];
    [self.scrollView addSubview:notTwoBtn];
    
    NormalButton *notThreeBtn = [[NormalButton alloc] initWithFrame:CGRectMake(notTwoBtn.right + 8, notTwoBtn.top + 2, 88, 32) title:@"主要按钮"];
    [notThreeBtn setNormalButtonStyle:NormalButtonStyleMain whetherEnableBool:NO];
    [self.scrollView addSubview:notThreeBtn];
    
    //禁用按钮
    NormalButton *enableOneBtn = [[NormalButton alloc] initWithFrame:CGRectMake(8, norBtn.bottom + 10, 150, 48) title:@"移动端大按钮"];
    [enableOneBtn setNormalButtonStyle:NormalButtonStyleMain whetherEnableBool:YES];
    [self.scrollView addSubview:enableOneBtn];
    
    NormalButton *enableTwoBtn = [[NormalButton alloc] initWithFrame:CGRectMake(enableOneBtn.right + 8, enableOneBtn.top + 6, 108, 36) title:@"主要按钮"];
    [enableTwoBtn setNormalButtonStyle:NormalButtonStyleMain whetherEnableBool:YES];
    [self.scrollView addSubview:enableTwoBtn];
    
    NormalButton *enableThreeBtn = [[NormalButton alloc] initWithFrame:CGRectMake(enableTwoBtn.right + 8, enableTwoBtn.top + 2, 88, 32) title:@"主要按钮"];
    [enableThreeBtn setNormalButtonStyle:NormalButtonStyleMain whetherEnableBool:YES];
    [self.scrollView addSubview:enableThreeBtn];
    
    //加载按钮
    LoadingUIButton *loadingBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(8, enableOneBtn.bottom + 10, 150, 48) title:@"点击加载"];
    [[loadingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [loadingBtn beginSubmitting:@"加载中"];
    }];
    [loadingBtn setNormalButtonStyle:LoadingButtonStyleMain];
    
    [self.scrollView addSubview:loadingBtn];
    
    LoadingUIButton *loadingTwoBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(loadingBtn.right + 8, loadingBtn.top + 6, 108, 36) title:@"点击加载"];
//    [loadingTwoBtn beginSubmitting:@""];
    [[loadingTwoBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [loadingTwoBtn beginSubmitting:@""];
    }];
    [loadingTwoBtn setNormalButtonStyle:LoadingButtonStyleMain];
    
    [self.scrollView addSubview:loadingTwoBtn];
    
    LoadingUIButton *loadingThreeBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(loadingTwoBtn.right + 8, loadingTwoBtn.top + 2, 88, 32) title:@"点击加载"];
    [loadingThreeBtn beginSubmitting:@""];
    [[loadingThreeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [loadingThreeBtn beginSubmitting:@""];
    }];
    [loadingThreeBtn setNormalButtonStyle:LoadingButtonStyleMain];
    
    [self.scrollView addSubview:loadingThreeBtn];
    
    //次要按钮
#pragma mark 次要按钮
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, loadingBtn.bottom + 10, kScreenWidth / 2, 24)];
    secondLabel.text = @"次要按钮";
    [self.scrollView addSubview:secondLabel];
    
    NormalButton *secondBtn = [[NormalButton alloc] initWithFrame:CGRectMake(8, secondLabel.bottom + 10, 150, 48) title:@"移动端大按钮"];
    [secondBtn setNormalButtonStyle:NormalButtonStyleSecondary whetherEnableBool:NO];
    [self.scrollView addSubview:secondBtn];
    
    NormalButton *secondTwoBtn = [[NormalButton alloc] initWithFrame:CGRectMake(norBtn.right + 10, secondBtn.top + 6, 108, 36) title:@"次要按钮"];
    [secondTwoBtn setNormalButtonStyle:NormalButtonStyleSecondary whetherEnableBool:NO];
    [self.scrollView addSubview:secondTwoBtn];
    
    NormalButton *secondThreeBtn = [[NormalButton alloc] initWithFrame:CGRectMake(secondTwoBtn.right + 8, secondTwoBtn.top + 2, 88, 32) title:@"次要按钮"];
    [secondThreeBtn setNormalButtonStyle:NormalButtonStyleSecondary whetherEnableBool:NO];
    [self.scrollView addSubview:secondThreeBtn];
    
    //禁用按钮
    NormalButton *secondEnableBtn = [[NormalButton alloc] initWithFrame:CGRectMake(8, secondBtn.bottom + 10, 150, 48) title:@"移动端大按钮"];
    [secondEnableBtn setNormalButtonStyle:NormalButtonStyleSecondary whetherEnableBool:YES];
    [self.scrollView addSubview:secondEnableBtn];
    
    NormalButton *secondTwoEnableBtn = [[NormalButton alloc] initWithFrame:CGRectMake(secondEnableBtn.right + 10, secondEnableBtn.top + 6, 108, 36) title:@"次要按钮"];
    [secondTwoEnableBtn setNormalButtonStyle:NormalButtonStyleSecondary whetherEnableBool:YES];
    [self.scrollView addSubview:secondTwoEnableBtn];
    
    NormalButton *secondThreeEnableBtn = [[NormalButton alloc] initWithFrame:CGRectMake(secondTwoEnableBtn.right + 8, secondTwoEnableBtn.top + 2, 88, 32) title:@"次要按钮"];
    [secondThreeEnableBtn setNormalButtonStyle:NormalButtonStyleSecondary whetherEnableBool:YES];
    [self.scrollView addSubview:secondThreeEnableBtn];
    //加载按钮
    LoadingUIButton *secondloadingBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(8, secondEnableBtn.bottom + 10, 150, 48) title:@"点击加载"];
    [secondloadingBtn setNormalButtonStyle:LoadingButtonStyleSecondary];
    [[secondloadingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [secondloadingBtn beginSubmitting:@"加载中"];
    }];
    [secondloadingBtn beginSubmitting:@"加载中"];
    [self.scrollView addSubview:secondloadingBtn];
    
    LoadingUIButton *secondloadingTwoBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(secondloadingBtn.right + 8, secondloadingBtn.top + 6, 108, 36) title:@"点击加载"];
//    [loadingTwoBtn beginSubmitting:@""];
    [secondloadingTwoBtn setNormalButtonStyle:LoadingButtonStyleSecondary];
    [[secondloadingTwoBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [secondloadingTwoBtn beginSubmitting:@""];
    }];
    [self.scrollView addSubview:secondloadingTwoBtn];
    
    LoadingUIButton *secondloadingThreeBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(secondloadingTwoBtn.right + 8, secondloadingTwoBtn.top + 2, 88, 32) title:@""];
    [secondloadingThreeBtn setNormalButtonStyle:LoadingButtonStyleSecondary];
    [secondloadingThreeBtn beginSubmitting:@""];
    [[secondloadingThreeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [secondloadingThreeBtn beginSubmitting:@""];
    }];
    [self.scrollView addSubview:secondloadingThreeBtn];
    
#pragma mark 警示按钮
    
    UILabel *threeLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, secondloadingBtn.bottom + 10, kScreenWidth / 2, 24)];
    threeLabel.text = @"警示按钮";
    [self.scrollView addSubview:threeLabel];
    
    NormalButton *alertBtn = [[NormalButton alloc] initWithFrame:CGRectMake(8, threeLabel.bottom + 10, 150, 48) title:@"移动端大按钮"];
    [alertBtn setNormalButtonStyle:NormalButtonStyleAlert whetherEnableBool:NO];
    [self.scrollView addSubview:alertBtn];
    
    NormalButton *alertTwoBtn = [[NormalButton alloc] initWithFrame:CGRectMake(alertBtn.right + 10, alertBtn.top + 6, 108, 36) title:@"次要按钮"];
    [alertTwoBtn setNormalButtonStyle:NormalButtonStyleAlert whetherEnableBool:NO];
    [self.scrollView addSubview:alertTwoBtn];
    
    NormalButton *alertThreeBtn = [[NormalButton alloc] initWithFrame:CGRectMake(alertTwoBtn.right + 8, alertTwoBtn.top + 2, 88, 32) title:@"次要按钮"];
    [alertThreeBtn setNormalButtonStyle:NormalButtonStyleAlert whetherEnableBool:NO];
    [self.scrollView addSubview:alertThreeBtn];
    
    
    //禁用按钮
    NormalButton *alertEnableBtn = [[NormalButton alloc] initWithFrame:CGRectMake(8, alertBtn.bottom + 10, 150, 48) title:@"移动端大按钮"];
    [alertEnableBtn setNormalButtonStyle:NormalButtonStyleAlert whetherEnableBool:YES];
    [self.scrollView addSubview:alertEnableBtn];
    
    NormalButton *alertTwoEnableBtn = [[NormalButton alloc] initWithFrame:CGRectMake(alertEnableBtn.right + 10, alertEnableBtn.top + 6, 108, 36) title:@"次要按钮"];
    [alertTwoEnableBtn setNormalButtonStyle:NormalButtonStyleAlert whetherEnableBool:YES];
    [self.scrollView addSubview:alertTwoEnableBtn];
    
    NormalButton *alertThreeEnableBtn = [[NormalButton alloc] initWithFrame:CGRectMake(alertTwoEnableBtn.right + 8, alertTwoEnableBtn.top + 2, 88, 32) title:@"次要按钮"];
    [alertThreeEnableBtn setNormalButtonStyle:NormalButtonStyleAlert whetherEnableBool:YES];
    [self.scrollView addSubview:alertThreeEnableBtn];
    
    //加载按钮
    LoadingUIButton *alertloadingBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(8, alertEnableBtn.bottom + 10, 150, 48) title:@"点击加载"];
    [alertloadingBtn setNormalButtonStyle:LoadingButtonStyleAlert];
    [[alertloadingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [alertloadingBtn beginSubmitting:@"加载中"];
    }];
    [alertloadingBtn beginSubmitting:@"加载中"];
    [self.scrollView addSubview:alertloadingBtn];
    
    LoadingUIButton *alertloadingTwoBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(alertloadingBtn.right + 8, alertloadingBtn.top + 6, 108, 36) title:@"点击加载"];
//    [loadingTwoBtn beginSubmitting:@""];
    [alertloadingTwoBtn setNormalButtonStyle:LoadingButtonStyleAlert];
    [[alertloadingTwoBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [alertloadingTwoBtn beginSubmitting:@""];
    }];
    
    
    [self.scrollView addSubview:alertloadingTwoBtn];
    
    LoadingUIButton *alertloadingThreeBtn = [[LoadingUIButton alloc] initWithFrame:CGRectMake(alertloadingTwoBtn.right + 8, alertloadingTwoBtn.top + 2, 88, 32) title:@""];
    [alertloadingThreeBtn setNormalButtonStyle:LoadingButtonStyleAlert];
    [alertloadingThreeBtn beginSubmitting:@""];
    [[alertloadingThreeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [alertloadingThreeBtn beginSubmitting:@""];
    }];
    [self.scrollView addSubview:alertloadingThreeBtn];
    
#pragma mark 渐变色按钮
    GradientButton *gradientBtn = [[GradientButton alloc] initWithFrame:CGRectMake(8, alertloadingBtn.bottom + 10, 150, 48) title:@"渐变色按钮" startColor:RGBACOLOR(254, 38, 112, 1) endColor:RGBACOLOR(254, 115, 155, 1)];
    [self.scrollView addSubview:gradientBtn];
#pragma mark 底部按钮
    
}



@end
