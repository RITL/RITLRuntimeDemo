//
//  RITLPeople.m
//  RITLRuntime
//
//  Created by YueWen on 2016/10/28.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "RITLPeople.h"
#import <objc/objc-runtime.h>

@implementation RITLPeople


void speakChinese(id self,SEL _cmd)
{
    NSLog(@"%@只会说中文哇！",((RITLPeople *)self).name);
}


+(BOOL)resolveInstanceMethod:(SEL)sel
{
    //如果是speakEnglish方法
    if ([NSStringFromSelector(sel) isEqualToString:@"speakEnglish"])
    {
        class_addMethod([self class], sel, (IMP)speakChinese, "v@:");
        return true;
    }
    
    
    return [super resolveInstanceMethod:sel];
}

@end
