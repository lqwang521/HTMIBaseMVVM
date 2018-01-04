//
//  HTMILoginInputFooterView.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMILoginButton.h"

@interface HTMILoginInputFooterView : UITableViewHeaderFooterView<HTMIViewProtocol>

/**
 登录按钮
 */
@property (nonatomic, strong) HTMILoginButton *loginBtn;

/**
 查询按钮
 */
@property (nonatomic, strong) UIButton *queryBtn;

@end
