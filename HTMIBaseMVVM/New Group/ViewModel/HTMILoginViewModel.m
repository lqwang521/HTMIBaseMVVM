//
//  HTMILoginViewModel.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginViewModel.h"
#import "HTMILoginRequest.h"

@interface HTMILoginViewModel()<HTMIBaseRequestFeformDelegate, YTKRequestDelegate>

@end
@implementation HTMILoginViewModel

- (instancetype)initWithParams:(NSDictionary *)params
{
    if (self = [super initWithParams:params]) {
        
    }
    return self;
}

/**
 viewModel 初始化属性
 */
- (void)fk_initializeForViewModel
{
    _cellTitleArray = @[
                        @"账户",
                        @"密码",
                        ];
    
    
    
    // 是否可以登录
    RAC(self, isLoginEnable) =  [[RACSignal combineLatest:@[
                                                            RACObserve(self, userAccount),
                                                            RACObserve(self, password)]
                                  ]
                                 map:^id _Nullable(RACTuple * _Nullable value) {
                                     RACTupleUnpack(NSString *account, NSString *pwd) = value;
                                     return @(account && pwd && account.length && pwd.length);
                                 }];
    
}

#pragma mark - Getter
- (RACCommand *)loginCommand
{
    if (!_loginCommand) {
        @weakify(self);
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            
            HTMILoginRequest *loginRequest = [[HTMILoginRequest alloc] initWithUsr:self.userAccount pwd:self.password];
            // 数据返回值reformat代理
            // loginRequest.reformDelegate = self;
            // 数据请求响应代理 通过代理回调
            // loginRequest.delegate = self;
            return [[[loginRequest rac_requestSignal] doNext:^(id  _Nullable x) {
                
                
                // 解析数据
                [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"isLogin"];
                
            }] materialize];
        }];
    }
    return _loginCommand;
}

#pragma mark - HTMIBaseRequestFeformDelegate
- (id)request:(HTMIBaseRequest *)request reformJSONResponse:(id)jsonResponse
{
    if([request isKindOfClass:HTMILoginRequest.class]){
        // 在这里对json数据进行重新格式化
        return @{
                 HTMILoginAccessTokenKey : jsonResponse[@"token"],
                 // HTMILoginAccessTokenKey : DecodeStringFromDic(jsonResponse, @"token"),
                 };
    }
    return jsonResponse;
}

#pragma mark - YTKRequestDelegate
- (void)requestFinished:(__kindof YTKBaseRequest *)request
{
    // 解析数据
    [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:@"isLogin"];
}

- (void)requestFailed:(__kindof YTKBaseRequest *)request
{
    // do something
}
@end
