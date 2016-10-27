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


-(instancetype)initWithDictionart:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        for (NSString * key in dictionary)
        {
            SEL setter = [self __propertySetterByKey:key];
            
            if (setter != nil)
            {
                //进行赋值
                ((void(*)(id,SEL,id))objc_msgSend)(self,setter,[dictionary valueForKey:key]);
            }
        }
    }
    
    return self;
}

-(NSDictionary *)coverToDicationary
{
    unsigned int propertyCount;
    
    //获得所有的属性
    objc_property_t * properties = class_copyPropertyList([self class], &propertyCount);
    
    
    if (propertyCount != 0)
    {
        //初始化返回字典
        NSMutableDictionary * result = [@{} mutableCopy];
        
        //
        for (NSUInteger i = 0; i < propertyCount; i++)
        {
            //get name
            const void * propertyName = property_getName(properties[i]);
            
            NSString * name = [NSString stringWithUTF8String:propertyName];
            
            SEL getter = [self __propertyGetterByKey:name];
            
            if (getter != nil)
            {
                id value = ((id(*)(id,SEL))objc_msgSend)(self,getter);
                
                if (value != nil)
                {
                    result[name] = value;
                }
                
                else
                {
                    result[name] = @"字典的key对应的value不能为nil哇";
                }
            }
        }
        
        free(properties);
        
        return [result mutableCopy];
    }
    
    free(properties);
    
    return nil;
}


#pragma mark - private function

- (SEL)__propertySetterByKey:(NSString *)key
{
    //首字母大写
    NSString * propertySetterName = [NSString stringWithFormat:@"set%@%@:",[key substringToIndex:1].uppercaseString,[key substringFromIndex:1]];
    
    //
    SEL setter = NSSelectorFromString(propertySetterName);
    
    if ([self respondsToSelector:setter])
    {
        return setter;
    }
    
    return nil;
}


- (SEL)__propertyGetterByKey:(NSString *)key
{
    SEL getter = NSSelectorFromString(key);
    
    if ([self respondsToSelector:getter])
    {
        return getter;
    }
    
    return nil;
}


@end
