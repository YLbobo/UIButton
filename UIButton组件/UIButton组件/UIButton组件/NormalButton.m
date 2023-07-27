//
//  NormalButton.m
//  BaseDemo
//
//  Created by 闫博 on 2023/7/10.
//  Copyright © 2023 XiaoBo. All rights reserved.
//

#import "NormalButton.h"
#define NormalCOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@implementation NormalButton

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0;
        self.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

- (void)setNormalButtonStyle:(NormalButtonStyle)style whetherEnableBool:(BOOL)whetherEnableBool
{
    switch (style) {
        case NormalButtonStyleMain:
        {
            if(whetherEnableBool == YES)
            {
                self.enabled = NO;
                self.backgroundColor = NormalCOLOR(148, 196, 255, 1);
                [self setTitleColor:NormalCOLOR(189, 221, 255, 1) forState:UIControlStateNormal];
                break;
            }
            self.enabled = YES;
            [self setTitleColor:NormalCOLOR(255, 255, 255, 1) forState:UIControlStateNormal];
            self.backgroundColor = NormalCOLOR(26, 106, 255, 1.0);
            [self setBackgroundImage:[self imageWithColor:NormalCOLOR(11, 76, 217, 1)] forState:UIControlStateHighlighted];
        }
            break;
        case NormalButtonStyleSecondary:
        {
            if(whetherEnableBool == YES)
            {
                self.enabled = NO;
                [self setTitleColor:NormalCOLOR(21, 24, 29, 0.24) forState:UIControlStateNormal];
                self.backgroundColor = [UIColor whiteColor];
                self.layer.borderWidth = 1.0;
                self.layer.borderColor = NormalCOLOR(99, 102, 108, 0.20).CGColor;
                break;
            }
            self.backgroundColor = [UIColor whiteColor];
            self.layer.borderWidth = 1.0;
            [self setTitleColor:NormalCOLOR(21, 24, 29, 1) forState:UIControlStateNormal];
            self.layer.borderColor = NormalCOLOR(99, 102, 108, 0.20).CGColor;
            [self setBackgroundImage:[self imageWithColor:NormalCOLOR(99, 102, 108, 0.12)] forState:UIControlStateHighlighted];
            self.enabled = YES;
        }
            break;
        case NormalButtonStyleAlert:
        {
            if(whetherEnableBool == YES)
            {
                self.enabled = NO;
                self.backgroundColor = NormalCOLOR(249, 169, 170, 1);
                [self setTitleColor:NormalCOLOR(252, 201, 200, 1) forState:UIControlStateNormal];
                break;
            }
            self.enabled = YES;
            self.backgroundColor = NormalCOLOR(239, 80, 99, 1);
            [self setTitleColor:NormalCOLOR(255, 255, 255, 1) forState:UIControlStateNormal];
            [self setBackgroundImage:[self imageWithColor:NormalCOLOR(198, 50, 72, 1)] forState:UIControlStateHighlighted];
        }
            break;
        default:
            break;
    }
}

// 创建纯色图片的方法
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
