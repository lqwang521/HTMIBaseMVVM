//
//  NSObject+NonBase.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "NSObject+NonBase.h"
#import <objc/runtime.h>

static const void *kParamsKey = &kParamsKey;

@implementation NSObject (NonBase)

- (void)setParams:(NSDictionary *)params
{
    objc_setAssociatedObject(self, kParamsKey, params, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)params
{
    return objc_getAssociatedObject(self, kParamsKey);
}

- (instancetype)initWithParams:(NSDictionary *)params
{
    if (self = [self init]) {
        [self setParams:params];
    }
    return self;
}

@end
