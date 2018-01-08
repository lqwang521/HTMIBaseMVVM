//
//  HTMILoginAccountInputTableViewCell.m
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMILoginAccountInputTableViewCell.h"
#import "HTMILoginViewModel.h"

@implementation HTMILoginAccountInputTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)htmi_createViewForView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.textLabel.font = [UIFont systemFontOfSize:17];
    //设置textfield属性
    self.inputTextFiled.font = [UIFont systemFontOfSize:17];
    self.inputTextFiled.spellCheckingType = UITextSpellCheckingTypeNo;
    self.inputTextFiled.autocorrectionType = UITextAutocorrectionTypeNo;
    self.inputTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.inputTextFiled.keyboardType = UIKeyboardTypeASCIICapable;
    self.inputTextFiled.secureTextEntry = NO;
    // 账户样式
    self.inputTextFiled.returnKeyType = UIReturnKeyNext;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Bind ViewModel
- (void)bindViewModel:(id<HTMIViewModelProtocol>)viewModel withParams:(NSDictionary *)params
{
    
    if ([viewModel isKindOfClass:[HTMILoginViewModel class]]){
        
        HTMILoginViewModel *_viewModel = (HTMILoginViewModel *)viewModel;
        // 绑定账号 View -> ViewModel 传递数据 
        @weakify(self);
        RAC(_viewModel, userAccount) = [[self.inputTextFiled.rac_textSignal takeUntil:self.rac_prepareForReuseSignal] map:^id _Nullable(NSString * _Nullable account) {
            
            @strongify(self);
            // 限制账号长度
            if (account.length > 25) {
                self.inputTextFiled.text = [account substringToIndex:25];
            }
            return self.inputTextFiled.text;
        }];
    }
}

@end
