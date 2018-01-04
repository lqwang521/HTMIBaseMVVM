//
//  HTMILoginInputFooterView.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginInputFooterView.h"

@implementation HTMILoginInputFooterView

- (void)fk_createViewForView
{
    [self addSubview:self.loginBtn];
    [self addSubview:self.queryBtn];
}

#pragma mark - Layout
- (void)updateConstraints
{
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(8);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
    }];
    
    [self.queryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.loginBtn);
        make.size.mas_equalTo(self.loginBtn);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(10);
    }];
    
    [super updateConstraints];
}

#pragma mark - Getter
- (HTMILoginButton *)loginBtn
{
    if (!_loginBtn) {
        
        _loginBtn = [[HTMILoginButton alloc] initWithFrame:CGRectZero];
        _loginBtn.enabled = NO;
    }
    return _loginBtn;
}

- (UIButton *)queryBtn
{
    if (!_queryBtn) {
        
        _queryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_queryBtn setTitle:@"登录遇到问题？" forState:UIControlStateNormal];
        [_queryBtn setTitleColor:HTMITHEMECOLOR forState:UIControlStateNormal];
        _queryBtn.titleLabel.font =  [UIFont systemFontOfSize:17];
    }
    return _queryBtn;
}

@end
