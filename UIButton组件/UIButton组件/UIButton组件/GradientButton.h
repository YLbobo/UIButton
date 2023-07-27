//
//  GradientButton.h
//  BaseDemo
//
//  Created by 闫博 on 2023/7/13.
//  Copyright © 2023 XiaoBo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradientButton : UIButton

- (id)initWithFrame:(CGRect)frame title:(NSString *)title startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

@end

NS_ASSUME_NONNULL_END
