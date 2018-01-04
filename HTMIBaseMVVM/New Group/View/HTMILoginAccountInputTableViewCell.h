//
//  HTMILoginAccountInputTableViewCell.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTMILoginAccountInputTableViewCell : UITableViewCell <HTMIViewProtocol>

/**
 标题
 */
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

/**
 输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *inputTextFiled;

@end
