//
//  RITLPeople.m
//  RITLRuntime
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "RITLPeople.h"
#import <objc/objc-runtime.h>

@implementation RITLPeople

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int ivarCount;
    
    Ivar * ivars = class_copyIvarList([self class], &ivarCount);
    
    for (NSUInteger i = 0; i < ivarCount; i++)
    {
        //get ivar
        Ivar ivar = ivars[i];
        
        //encode
        NSString * name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        [aCoder encodeObject:[self valueForKey:name] forKey:name];
    }
    
    free(ivars);
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        unsigned int ivarCount;
        
        Ivar * ivars = class_copyIvarList([self class], &ivarCount);
        
        for(NSUInteger i = 0; i < ivarCount; i++)
        {
            Ivar ivar = ivars[i];
            
            //decoder
            NSString * name = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //
            id value = [aDecoder decodeObjectForKey:name];
            
            //set
            [self setValue:value forKey:name];
        }
        
        free(ivars);
    }
    
    return self;
}


@end
