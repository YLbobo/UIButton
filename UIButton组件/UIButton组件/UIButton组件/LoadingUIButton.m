//
//  LoadingUIButton.m
//  BaseDemo
//
//  Created by 闫博 on 2023/7/10.
//  Copyright © 2023 XiaoBo. All rights reserved.
//
/**
 用到的三方组件为
 pod 'SVProgressHUD'
 */

#import "LoadingUIButton.h"
#import "SVIndefiniteAnimatedView.h"
#import "NSString+Extension.h"

#define NormalCOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define LoadingStringEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]) || [(_ref)isEqualToString:@"<null>"] || [(_ref)isEqualToString:@"(null)"]|| [(_ref)isEqualToString:@"null"])

@interface LoadingUIButton ()

@property(nonatomic,strong) UIView *loadingView;

@property (nonatomic,strong) SVIndefiniteAnimatedView *animationView;//点击接听按钮的动画
//加载loading label文案
@property(nonatomic,strong)UILabel *loadingLabel;

@end

@implementation LoadingUIButton

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0;
        self.titleLabel.font = [UIFont systemFontOfSize:17.0];
        [self setTitle:title forState:UIControlStateNormal];
        
        self.loadingView = [[UIView alloc] initWithFrame:self.bounds];
        self.loadingView.hidden = YES;
        self.loadingView.userInteractionEnabled = YES;
        [self addSubview:self.loadingView];
        //设置加载文案
        self.loadingLabel = [[UILabel alloc] init];
        self.loadingLabel.font = [UIFont systemFontOfSize:17.0];
        self.loadingLabel.userInteractionEnabled = YES;
        self.loadingLabel.hidden = YES;
        [self.loadingView addSubview:self.loadingLabel];
        
        //设置loadingView
        self.animationView = [[SVIndefiniteAnimatedView alloc] init];
        self.animationView.backgroundColor = [UIColor clearColor];
        self.animationView.strokeThickness = 2;
        self.animationView.hidden = YES;
        [self.loadingView addSubview:self.animationView];
    }
    return self;
}

//CGRectMake(0, 12, 25, 24)

- (void)beginSubmitting:(NSString *)title
{
    self.loadingLabel.text = title;
    CGSize loadingSize = [title sizeWithMaxSize:CGSizeMake(self.frame.size.width - 33, 24) font:[UIFont systemFontOfSize:17.0]];
    self.animationView.frame = CGRectMake((self.frame.size.width - loadingSize.width - 33) / 2, (self.frame.size.height - 24) / 2, 25, 24);
    if(LoadingStringEmpty(title))
    {
        self.animationView.frame = CGRectMake((self.frame.size.width - 20) / 2, (self.frame.size.height - 20) / 2, 20, 20);
        self.animationView.radius = 10;
    }else
    {
        //设置动画的半径
        self.animationView.radius = 12;
    }
    
    self.loadingLabel.frame = CGRectMake(self.animationView.right + 8, (self.frame.size.height - 24) / 2, loadingSize.width, 24);
    switch (self.style) {
        case LoadingButtonStyleMain:
            self.loadingView.backgroundColor = NormalCOLOR(26, 106, 255, 1);
            self.loadingLabel.textColor = [UIColor whiteColor];
            self.animationView.strokeColor = [UIColor whiteColor];
            break;
        case LoadingButtonStyleSecondary:
            self.loadingView.backgroundColor = [UIColor whiteColor];
            self.loadingLabel.textColor = RGBACOLOR(21, 24, 29, 1);
            self.animationView.strokeColor = [UIColor redColor];
            break;
        case LoadingButtonStyleAlert:
            self.loadingView.backgroundColor = NormalCOLOR(239, 80, 99, 1);
            self.loadingLabel.textColor = [UIColor whiteColor];
            self.animationView.strokeColor = [UIColor whiteColor];
            break;
        default:
            break;
    }
    self.loadingLabel.hidden = NO;
    self.animationView.hidden = NO;
    self.loadingView.hidden = NO;
    
}

- (void)setNormalButtonStyle:(LoadingButtonStyle)style
{
    _style = style;
    switch (style) {
        case LoadingButtonStyleMain:
        {
            self.enabled = YES;
            [self setTitleColor:NormalCOLOR(255, 255, 255, 1) forState:UIControlStateNormal];
            self.backgroundColor = NormalCOLOR(26, 106, 255, 1.0);
            [self setBackgroundImage:[self imageWithColor:NormalCOLOR(11, 76, 217, 1)] forState:UIControlStateHighlighted];
        }
            break;
        case LoadingButtonStyleSecondary:
        {
            self.backgroundColor = [UIColor whiteColor];
            self.layer.borderWidth = 1.0;
            [self setTitleColor:NormalCOLOR(21, 24, 29, 1) forState:UIControlStateNormal];
            self.layer.borderColor = NormalCOLOR(99, 102, 108, 0.20).CGColor;
            [self setBackgroundImage:[self imageWithColor:NormalCOLOR(99, 102, 108, 0.12)] forState:UIControlStateHighlighted];
            self.enabled = YES;
        }
            break;
        case LoadingButtonStyleAlert:
        {
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
