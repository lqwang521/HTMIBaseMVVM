//
//  HTMIViewModelIntercepter.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIViewModelIntercepter.h"
#import "NSObject+NonBase.h"
#import "HTMIViewModelProtocol.h"
#import "Aspects.h"

@implementation HTMIViewModelIntercepter

+ (void)load
{
    [super load];
    [HTMIViewModelIntercepter sharedInstance];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static HTMIViewModelIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HTMIViewModelIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        [NSObject aspect_hookSelector:@selector(initWithParams:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo, NSDictionary *param){
            
            [self _initWithInstance:aspectInfo.instance params:param];
        } error:nil];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_initWithInstance:(NSObject <HTMIViewModelProtocol> *)viewModel
{
    if ([viewModel respondsToSelector:@selector(htmi_initializeForViewModel)]) {
        [viewModel htmi_initializeForViewModel];
    }
}

- (void)_initWithInstance:(NSObject <HTMIViewModelProtocol> *)viewModel params:(NSDictionary *)param
{
    if ([viewModel respondsToSelector:@selector(htmi_initializeForViewModel)]) {
        [viewModel htmi_initializeForViewModel];
    }
}

@end
