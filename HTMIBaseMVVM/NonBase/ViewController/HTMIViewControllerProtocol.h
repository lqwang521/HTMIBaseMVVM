//
//  HTMIViewControllerProtocol.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 为 ViewController 绑定方法协议
 */
@protocol HTMIViewControllerProtocol <NSObject>

#pragma mark - 方法绑定
@required
/// 初始化数据
- (void)htmi_initialDefaultsForController;

/// 绑定 vm
- (void)htmi_bindViewModelForController;

/// 创建视图
- (void)htmi_createViewForConctroller;

/// 配置导航栏
- (void)htmi_configNavigationForController;

@end
