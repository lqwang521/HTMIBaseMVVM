//
//  HTMILoginRequest.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/11.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginRequest.h"

// 登录token key
NSString *HTMILoginAccessTokenKey = @"accessToken";

@implementation HTMILoginRequest
{
    NSString *_usr;
    NSString *_pwd;
    
}

- (id)initWithUsr:(NSString *)usr pwd:(NSString *)pwd
{
    self = [super init];
    if (self) {
        _usr = usr;
        _pwd = pwd;
    }
    return self;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}

- (BOOL)statusCodeValidator
{
    return YES;
}

//// 可以在这里对response 数据进行重新格式化， 也可以使用delegate 设置 reformattor
//- (id)reformJSONResponse:(id)jsonResponse
//{
//
//}

- (NSString *)requestUrl {
    
    return @"";
}


- (id)requestArgument {
    
    return  @{
              @"username":_usr,
              @"password":_pwd,
              };
}

@end
