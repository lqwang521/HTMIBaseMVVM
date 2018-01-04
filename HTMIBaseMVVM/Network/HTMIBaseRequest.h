//
//  HTMIBaseRequest.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

// 获取服务器响应状态码 key
FOUNDATION_EXTERN NSString *const HTMI_BaseRequest_StatusCodeKey;
// 服务器响应数据成功状态码 value
FOUNDATION_EXTERN NSString *const HTMI_BaseRequest_DataValueKey;
// 获取服务器响应状态信息 key
FOUNDATION_EXTERN NSString *const HTMI_BaseRequest_StatusMsgKey;
// 获取服务器响应数据 key
FOUNDATION_EXTERN NSString *const HTMI_BaseRequest_DataKey;


@class HTMIBaseRequest;
@protocol HTMIBaseRequestFeformDelegate <NSObject>

/**
 自定义解析器解析响应参数

 @param request 当前请求
 @param jsonResponse 响应数据
 @return 自定reformat数据
 */
- (id)request:(HTMIBaseRequest *)request reformJSONResponse:(id)jsonResponse;

@end

@interface HTMIBaseRequest : YTKRequest

/**
 数据重塑代理
 */
@property (nonatomic, weak) id <HTMIBaseRequestFeformDelegate> reformDelegate;

#pragma mark - Override

/**
 自定义解析器解析响应参数
 
 @param jsonResponse json响应
 @return 解析后的json
 */
- (id)reformJSONResponse:(id)jsonResponse;

#pragma mark - Subclass Ovrride

/**
 添加额外的参数

 @return 额外参数
 */
- (id)extraRequestArgument;
@end
