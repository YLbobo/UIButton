//
//  LoadingUIButton.h
//  BaseDemo
//
//  Created by 闫博 on 2023/7/10.
//  Copyright © 2023 XiaoBo. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
typedef enum {
    LoadingButtonStyleMain,//主要button
    LoadingButtonStyleSecondary,//次要button
    LoadingButtonStyleAlert,//警示button
}LoadingButtonStyle;

@interface LoadingUIButton : UIButton


- (id)initWithFrame:(CGRect)frame title:(NSString *)title;

/**
 *  @author 闫博 on 2023/7/10.
 *
 *  @brief  按钮点击后，禁用按钮并在按钮上显示SVIndefiniteAnimatedView，以及title
 *
 *  @param title 按钮上显示的文字
 */
- (void)beginSubmitting:(NSString *)title;

@property (nonatomic,assign) LoadingButtonStyle style;

- (void)setNormalButtonStyle:(LoadingButtonStyle)style;
@end

NS_ASSUME_NONNULL_END
