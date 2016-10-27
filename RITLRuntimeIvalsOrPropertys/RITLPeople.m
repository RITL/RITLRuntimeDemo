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


-(NSDictionary *)allPropertys
{
    //the number of the properies
    unsigned int propertyCount;
    
    //get all propertys,if there are not any property,the count is zero.
    objc_property_t * proerties = class_copyPropertyList([self class], &propertyCount);
    
    //
    NSMutableDictionary * result = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < propertyCount; i++)
    {
        //handle the property
        const char * propertyName = property_getName(proerties[i]);
        
        //name
        NSString * name = [NSString stringWithUTF8String:propertyName];
        
        //value
        id value = [self valueForKey:name];
        
        //
        if (value == nil)
        {
            result[name] = @"当前属性没有值哦";
        }
        
        else
        {
            result[name] = value;
        }
    }
    
    free(proerties);
    
    return  [result mutableCopy];
}


-(NSDictionary *)allIvars
{
    //the number of ivars
    unsigned int ivarCount;
    
    //get all ivars,if there are not any ivar,the count is zero.
    Ivar * ivars = class_copyIvarList([self class], &ivarCount);
    
    NSMutableDictionary * result = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < ivarCount; i++)
    {
        //get ivar
        Ivar ivar = ivars[i];
        
        //name
        NSString * name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //value
        id value = [self valueForKey:name];
        
        if (value == nil)
        {
            result[name] = @"当前实例变量没有值哦";
        }
        
        else
        {
            result[name] = value;
        }
    }
    
    free(ivars);
    
    return [result mutableCopy];
}


-(NSDictionary *)allMethods
{
    unsigned int methodCount;
    
    NSMutableDictionary * result = [@{} mutableCopy];
    
    //get all methods,if there are not any method,the count is zero.
    Method * methods = class_copyMethodList([self class], &methodCount);
    
    for (NSUInteger i = 0; i < methodCount; i++)
    {
        //method
        Method method = methods[i];
        
        //name
        NSString * name = [NSString stringWithUTF8String:sel_getName(method_getName(method))];
        
        //arguments
        int arguments = method_getNumberOfArguments(method);
        
        result[name] = @(arguments - 2);
    }
    
    free(methods);
    
    return [result mutableCopy];
}


@end
