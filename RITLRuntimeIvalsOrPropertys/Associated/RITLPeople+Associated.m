//
//  RITLPeople+Associated.m
//  RITLRuntime
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "RITLPeople+Associated.h"
#import <objc/objc-runtime.h>

@implementation RITLPeople (Associated)

#pragma mark - bust

- (void)setAssociatedBust:(NSNumber *)bust
{
   //set associated bust
    objc_setAssociatedObject(self, @selector(associatedBust), bust, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)associatedBust
{
    return objc_getAssociatedObject(self, @selector(associatedBust));
}

#pragma mark - block
-(void)setAssociatedBlock:(RITLAssociatedBlock)associatedBlock
{
    objc_setAssociatedObject(self, @selector(associatedBlock), associatedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(RITLAssociatedBlock)associatedBlock
{
    return objc_getAssociatedObject(self, @selector(associatedBlock));
}


@end
