//
//  HTMIRouterConstant.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 HTMIao. All rights reserved.
//

#import <Foundation/Foundation.h>

// 路由默认控制器参数名
FOUNDATION_EXTERN NSString *const HTMIControllerNameRouteParam;

#pragma mark - 路由模式 Schema
/**
 模式 Native：AppSchema://url/:param
 */

// 默认路由
FOUNDATION_EXTERN NSString *const HTMIDefaultRouteSchema;
// 网络跳转路由模式
FOUNDATION_EXTERN NSString *const HTMIHTTPRouteSchema;
FOUNDATION_EXTERN NSString *const HTMIHTTPsRouteSchema;
// WEB交互路由跳转模式
FOUNDATION_EXTERN NSString *const HTMIWebHandlerRouteSchema;
// 回调通信
FOUNDATION_EXTERN NSString *const HTMIComponentsCallBackHandlerRouteSchema;
// 未知路由
FOUNDATION_EXTERN NSString *const HTMIUnknownHandlerRouteSchema;


#pragma mark - 路由表

// 导航栏 Push
FOUNDATION_EXTERN NSString *const HTMINavPushRoute;

// 导航栏 Present
FOUNDATION_EXTERN NSString *const HTMINavPresentRoute;

// StoryBoard Push
FOUNDATION_EXTERN NSString *const HTMINavStoryBoardPushRoute;

// 组件通信回调
FOUNDATION_EXTERN NSString *const HTMIComponentsCallBackRoute;
