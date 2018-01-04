//
//  HTMILoginViewModel.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMILoginViewModel : NSObject<HTMIViewModelProtocol>

#pragma mark - 业务数据

/**
 tableView 标题列表
 */
@property (nonatomic, strong, readonly) NSArray <NSString *>*cellTitleArray;


/**
 判断是否可以登录
 */
@property (nonatomic, assign) BOOL isLoginEnable;

/**
 用户名
 */
@property (nonatomic, copy) NSString *userAccount;

/**
 密码
 */
@property (nonatomic, copy) NSString *password;

#pragma mark - 命令
/**
 登录
 */
@property (nonatomic, strong) RACCommand *loginCommand;

@end
