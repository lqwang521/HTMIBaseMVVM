//
//  HTMIBaseRequestIntercepter.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTMIBaseRequest.h"

@interface HTMIBaseRequestIntercepter : NSObject

- (void)hookRequestArgumentWithInstance:(HTMIBaseRequest *)request HTMIDeprecated("Do not use any more");

@end
