//
//  HTMIBaseRequestIntercepter.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIBaseRequestIntercepter.h"
#import "Aspects.h"

@implementation HTMIBaseRequestIntercepter

+ (void)load
{
    [super load];
    
    [HTMIBaseRequestIntercepter sharedInstance];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static HTMIBaseRequestIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HTMIBaseRequestIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        // 添加额外参数
        //        [XZWBaseRequest aspect_hookSelector:@selector(requestArgument) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
        //
        //            NSInvocation *invocation = aspectInfo.originalInvocation;
        //            // 调用方法
        //            [invocation invoke];
        //
        //            // 获取返回值
        //            id returnValue = nil;
        //            if (invocation.methodSignature.methodReturnLength) {
        //                // 有返回值类型，才去获得返回值
        //                [invocation getReturnValue:&returnValue];
        //            }
        //
        //            [self _requestArgumentWithInstance:aspectInfo.instance originReturnValue:returnValue];
        //        } error:nil];
    }
    return self;
}

#pragma mark - Public
- (void)hookRequestArgumentWithInstance:(HTMIBaseRequest *)request HTMIDeprecated("Do not use any more")
{
    // 添加额外参数
    @weakify(self);
    [request aspect_hookSelector:@selector(requestArgument) withOptions:AspectPositionInstead | AspectOptionAutomaticRemoval  usingBlock:^(id<AspectInfo>aspectInfo){
        
        @strongify(self);
        
        NSInvocation *invocation = aspectInfo.originalInvocation;
        // 调用方法
        [invocation invoke];
        // 获取返回值
        id returnValue = nil;
        if (invocation.methodSignature.methodReturnLength) {
            // 有返回值类型，才去获得返回值
            [invocation getReturnValue:&returnValue];
            returnValue = [self _requestArgumentWithInstance:aspectInfo.instance originReturnValue:returnValue];
            // 重新设置返回值
            [invocation setReturnValue:&returnValue];
        }
    } error:nil];
}

#pragma mark - Hook Methods
// hook 你所想
- (id)_requestArgumentWithInstance:(HTMIBaseRequest *)instance originReturnValue:(id)originReturnValue HTMIDeprecated("Do not use any more")
{
    id extraArgeument =  [instance extraRequestArgument];
    if (originReturnValue &&
        [originReturnValue isKindOfClass:[NSDictionary class]] &&
        extraArgeument &&
        [extraArgeument isKindOfClass:[NSDictionary class]]) {
        
        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:originReturnValue];
        [mDict addEntriesFromDictionary:extraArgeument];
        return [mDict copy];
    }
    return originReturnValue;
}

@end
