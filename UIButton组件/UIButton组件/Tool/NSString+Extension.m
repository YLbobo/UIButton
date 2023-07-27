//
//  NSString+Extension.m
//  BaseDemo
//
//  Created by 闫博 on 2019/12/25.
//  Copyright © 2019 闫博. All rights reserved.
//

#import "NSString+Extension.h"


@implementation NSString (Extension)

+ (BOOL)validateMobile:(NSString *)mobile
{
    if (!mobile || mobile.length != 11) return NO;
    NSString* m = @"(1)\\d{10}$";
    NSPredicate *rm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",m];
    if ([rm evaluateWithObject:mobile]) {
        return YES;
    } else {
        return NO;
    }
}

- (CGSize)sizeWithMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}



- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

@end
