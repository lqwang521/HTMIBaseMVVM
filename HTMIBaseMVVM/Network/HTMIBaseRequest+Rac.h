//
//  HTMIBaseRequest+Rac.h
//  HTMIXKBaseMVVM
//
//  Created by wlq on 2017/12/9.
//  Copyright © 2017年 htmi. All rights reserved.
//

#import "HTMIBaseRequest.h"

@interface HTMIBaseRequest (Rac)


- (RACSignal *)rac_requestSignal;

@end
