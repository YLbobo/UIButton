//
//  GradientButton.m
//  BaseDemo
//
//  Created by 闫博 on 2023/7/13.
//  Copyright © 2023 XiaoBo. All rights reserved.
//

#import "GradientButton.h"

@implementation GradientButton

- (id)initWithFrame:(CGRect)frame title:(NSString *)title startColor:(UIColor *)startColor endColor:(UIColor *)endColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0;
        self.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [self setTitle:title forState:UIControlStateNormal];
        
        // 创建渐变图层
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds; // 渐变图层的尺寸和位置
        gradientLayer.colors = @[(id)startColor.CGColor, (id)endColor.CGColor]; // 渐变颜色数组
        gradientLayer.startPoint = CGPointMake(0, 0); // 渐变起点
        gradientLayer.endPoint = CGPointMake(1, 0); // 渐变终点

        // 设置渐变图层作为按钮的背景层，并将按钮的标题颜色设为白色
        [self.layer insertSublayer:gradientLayer atIndex:0];
        self.titleLabel.textColor = [UIColor whiteColor];

        // 将按钮的背景颜色设为透明，以便显示渐变色
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

@end
