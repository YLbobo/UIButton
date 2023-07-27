//
//  NSString+Extension.h
//  BaseDemo
//
//  Created by 闫博 on 2019/12/25.
//  Copyright © 2019 闫博. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString (Extension)

+ (BOOL)validateMobile:(NSString *)mobile;

- (CGSize)sizeWithMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize;

- (CGSize)sizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

@end
