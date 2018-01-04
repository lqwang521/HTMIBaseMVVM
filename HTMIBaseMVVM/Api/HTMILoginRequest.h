//
//  HTMILoginRequest.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/11.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIBaseRequest.h"

/* 大多时候Api只需要一种解析格式，所以此处跟着request走，其他情况下常量字符串建议跟着reformer走， */
// 登录token key
FOUNDATION_EXTERN NSString *HTMILoginAccessTokenKey;
// 也可以写成 局部常量形式
static const NSString *HTMILoginAccessTokenKey2 = @"accessToken";

@interface HTMILoginRequest : HTMIBaseRequest

- (id)initWithUsr:(NSString *)usr pwd:(NSString *)pwd;

@end
