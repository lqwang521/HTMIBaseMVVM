//
//  HTMILoginButton.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTMILoginButton : UIButton <HTMIViewProtocol>

/**
 开始加载动画
 */
- (void)startLoadingAnimation;

/**
 结束加载动画
 */
- (void)stopLoadingAnimation;

@end
