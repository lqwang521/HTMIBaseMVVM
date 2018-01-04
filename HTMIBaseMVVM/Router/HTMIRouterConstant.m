//
//  HTMIRouterConstant.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 HTMIao. All rights reserved.
//

#import "HTMIRouterConstant.h"

NSString *const HTMIControllerNameRouteParam = @"viewController";

#pragma mark - 路由模式

NSString *const HTMIDefaultRouteSchema = @"HTMIXKBaseMVVM";
NSString *const HTMIHTTPRouteSchema = @"http";
NSString *const HTMIHTTPsRouteSchema = @"https";
// ----
NSString *const HTMIComponentsCallBackHandlerRouteSchema = @"AppCallBack";
NSString *const HTMIWebHandlerRouteSchema = @"yinzhi";
NSString *const HTMIUnknownHandlerRouteSchema = @"UnKnown";

#pragma mark - 路由表

NSString *const HTMINavPushRoute = @"/com_htmi_navPush/:viewController";
NSString *const HTMINavPresentRoute = @"/com_htmi_navPresent/:viewController";
NSString *const HTMINavStoryBoardPushRoute = @"/com_htmi_navStoryboardPush/:viewController";
NSString *const HTMIComponentsCallBackRoute = @"/com_htmi_callBack/*";
