//
//  RITLDog.m
//  RITLRuntime
//
//  Created by YueWen on 2016/10/28.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "RITLDog.h"
#import "RITLPeople.h"

@implementation RITLDog


+(BOOL)resolveInstanceMethod:(SEL)sel
{
    return false;
}


-(id)forwardingTargetForSelector:(SEL)aSelector
{
    return nil;
}


-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"speakEnglish"])
    {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}


-(void)forwardInvocation:(NSInvocation *)anInvocation
{
    //改变对象
//    RITLPeople * people = [[RITLPeople alloc]init];
//    people.name = @"Yue";
//    [anInvocation invokeWithTarget:people];
//    
    //设置方法
    [anInvocation setSelector:@selector(dance)];
    
    [anInvocation invokeWithTarget:self];
    
    
}


-(void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"消息无法处理哇:%@",NSStringFromSelector(aSelector));
}


- (void)dance
{
    NSLog(@"跳舞啦!");
}


@end
