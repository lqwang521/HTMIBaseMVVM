//
//  HTMIViewModelProtocol.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/10.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTMIViewModelProtocol <NSObject>

@required

/**
 viewModel 初始化属性
 */
- (void)fk_initializeForViewModel;

@end
