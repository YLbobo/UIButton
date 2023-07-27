//
//  NormalButton.h
//  BaseDemo
//
//  Created by 闫博 on 2023/7/10.
//  Copyright © 2023 XiaoBo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NormalButtonStyleMain,//主要button
    NormalButtonStyleSecondary,//次要button
    NormalButtonStyleAlert,//警示button
}NormalButtonStyle;

NS_ASSUME_NONNULL_BEGIN

@interface NormalButton : UIButton

//初始化
- (id)initWithFrame:(CGRect)frame title:(NSString *)title;

//设置样式
- (void)setNormalButtonStyle:(NormalButtonStyle)style whetherEnableBool:(BOOL)whetherEnableBool;


@end

NS_ASSUME_NONNULL_END
