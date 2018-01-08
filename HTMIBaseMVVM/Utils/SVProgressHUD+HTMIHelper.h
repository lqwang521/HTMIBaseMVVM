//
//  SVProgressHUD+Helper.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 fkao. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>

@interface SVProgressHUD (HTMIHelper)

/// 显示不带文字的overflow
+ (void)htmi_displayOverFlowActivityView;
+ (void)htmi_displayOverFlowActivityView:(NSTimeInterval)maxShowTime;

/// 显示成功状态
+ (void)htmi_displaySuccessWithStatus:(NSString *)status;

/// 显示失败状态
+ (void)htmi_displayErrorWithStatus:(NSString *)status;

/// 显示提示信息
+ (void)htmi_dispalyInfoWithStatus:(NSString *)status;

/// 显示提示信息
+ (void)htmi_dispalyMsgWithStatus:(NSString *)status;

/// 显示加载圈 加文本
+ (void)htmi_dispalyLoadingMsgWithStatus:(NSString *)status;

/// 显示进度，带文本
+ (void)htmi_dispalyProgress:(CGFloat)progress status:(NSString *)status;

/// 显示进度，不带文本
+ (void)htmi_dispalyProgress:(CGFloat)progress;


@end
