//
//  ViewController+NonBase.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMIViewControllerProtocol.h"

@interface UIViewController (NonBase)

/**
 去Model&&表征化参数列表
 */
@property (nonatomic, strong) NSDictionary *params;

/**
 ViewModel 属性
 */
@property (nonatomic, strong) id <HTMIViewControllerProtocol> viewModel;

#pragma mark - 通用类

/**
 返回Controller的当前bounds
 
 @param hasNav 是否有导航栏
 @param hasTabBar 是否有tabbar
 @return 坐标
 */
- (CGRect)fk_visibleBoundsShowNav:(BOOL)hasNav showTabBar:(BOOL)hasTabBar;

/**
 隐藏键盘
 */
- (void)fk_hideKeyBoard;

@end
