//
//  HTMIViewControllerIntercepter.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIViewControllerIntercepter.h"
#import "Aspects.h"

@implementation HTMIViewControllerIntercepter

+ (void)load
{
    [super load];
    
    [HTMIViewControllerIntercepter sharedInstance];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static HTMIViewControllerIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HTMIViewControllerIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        /* 方法拦截 */
        
        // 拦截 viewDidLoad 方法
        [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            
            
            [self _viewDidLoad:aspectInfo.instance];
        }  error:nil];
        
        // 拦截 viewWillAppear:
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
            
            [self _viewWillAppear:animated controller:aspectInfo.instance];
        } error:NULL];
    }
    return self;
}

#pragma mark - Hook Methods
- (void)_viewDidLoad:(UIViewController <HTMIViewControllerProtocol>*)controller
{
    
    if ([controller conformsToProtocol:@protocol(HTMIViewControllerProtocol)]) {
        // 只有遵守 HTMIViewControllerProtocol 的 viewController 才进行 配置
        controller.edgesForExtendedLayout = UIRectEdgeAll;
        controller.extendedLayoutIncludesOpaqueBars = NO;
        controller.automaticallyAdjustsScrollViewInsets = NO;
        
        // 背景色设置为白色
        controller.view.backgroundColor = [UIColor whiteColor];
        
        // 执行协议方法
        [controller fk_initialDefaultsForController];
        [controller fk_bindViewModelForController];
        [controller fk_configNavigationForController];
        [controller fk_createViewForConctroller];
    }
}

- (void)_viewWillAppear:(BOOL)animated controller:(UIViewController <HTMIViewControllerProtocol>*)controller
{
    
}


@end
