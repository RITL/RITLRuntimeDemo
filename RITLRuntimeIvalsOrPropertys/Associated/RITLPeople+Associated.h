//
//  RITLPeople+Associated.h
//  RITLRuntime
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "RITLPeople.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^RITLAssociatedBlock)();

@interface RITLPeople (Associated)

/// 胸围
@property (nonatomic, strong) NSNumber * associatedBust;

/// 
@property (nonatomic, copy)RITLAssociatedBlock associatedBlock;

@end

NS_ASSUME_NONNULL_END
