//
//  HTMILoginPwdInputTableViewCell.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginPwdInputTableViewCell.h"
#import "HTMILoginViewModel.h"

@interface HTMILoginPwdInputTableViewCell()<UITextFieldDelegate>
@end

@implementation HTMILoginPwdInputTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)fk_createViewForView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.textLabel.font = [UIFont systemFontOfSize:17];
    self.separatorInset = UIEdgeInsetsMake(0, 25, 0, 25);
    // 设置textfield属性
    self.inputTextFiled.font = [UIFont systemFontOfSize:17];
    self.inputTextFiled.spellCheckingType = UITextSpellCheckingTypeNo;
    self.inputTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    self.inputTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.inputTextFiled.keyboardType = UIKeyboardTypeASCIICapable;
    // 密码样式
    self.inputTextFiled.secureTextEntry = YES;
    self.inputTextFiled.returnKeyType = UIReturnKeyDone;
    
    // 图片
    [self.accessoryButton setImage:[UIImage imageNamed:@"login_hide_pwd"] forState:UIControlStateNormal];
    [self.accessoryButton setImage:[UIImage imageNamed:@"login_show_pwd"] forState:UIControlStateSelected];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

#pragma mark - Bind ViewModel
- (void)bindViewModel:(id<HTMIViewModelProtocol>)viewModel withParams:(NSDictionary *)params
{
    
    if ([viewModel isKindOfClass:[HTMILoginViewModel class]]){
        
        HTMILoginViewModel *_viewModel = (HTMILoginViewModel *)viewModel;
        @weakify(self);
        // 密码显示和切换
        [[self.accessoryButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            @strongify(self);
            self.accessoryButton.selected = !self.accessoryButton.selected;
            self.inputTextFiled.secureTextEntry = !self.accessoryButton.selected;
        }];
        
        // 绑定密码
        RAC(_viewModel, password) = [[self.inputTextFiled.rac_textSignal takeUntil:self.rac_prepareForReuseSignal] map:^id _Nullable(NSString * _Nullable account) {

            @strongify(self);
            // 限制密码长度
            if (account.length > 25) {
                self.inputTextFiled.text = [account substringToIndex:25];
            }
            return self.inputTextFiled.text;
        }];

        // 监听done事件
        [[self rac_signalForSelector:@selector(textFieldShouldReturn:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(RACTuple * _Nullable x) {
            @strongify(self);
            RACTupleUnpack(UITextField *field) = x;
            [field resignFirstResponder];
            if (_viewModel.isLoginEnable)
            {
                // 执行登录事件
                [_viewModel.loginCommand execute:nil];
            }
        }];
        self.inputTextFiled.delegate = self;
    }
}

@end
