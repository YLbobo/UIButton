//
//  UIColor+Extension.h
//  BaseDemo
//
//  Created by 闫博 on 2019/12/25.
//  Copyright © 2019 闫博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

@end
