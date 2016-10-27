//
//  main.m
//  RITLRuntimeCreateClass
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-runtime.h>

void RITLSay(id self,SEL _cmd,id any)
{
    NSLog(@"Hello, I am %@,I am %@ years old; note = %@",[self valueForKey:@"_name"],object_getIvar(self,class_getInstanceVariable([self class], "_age")),class_getProperty([self class], "note"));
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //create a RITL Class
        Class RITL = objc_allocateClassPair([NSObject class], "RITL", 0);
        
        //add ival
        class_addIvar(RITL, "_name", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
        class_addIvar(RITL, "_age", sizeof(int), sizeof(int), @encode(int));
        
        //state property
//        objc_property_attribute_t property;
        
        //add property
//        class_addProperty(RITL, "note", &property, 0);
        
        //state method
        SEL sel = sel_registerName("RITLSay");
        
        //add method
        class_addMethod(RITL, sel, (IMP)RITLSay, "v@:@");
        
        //register class
        objc_registerClassPair(RITL);
        
        //create a instance class
        id ritl = [[RITL alloc]init];
        
        //set ivar
        [ritl setValue:@"Yue" forKey:@"_name"];
//        [ritl setValue:@"Note" forKey:@"note"];
        
        //get int ivar
        Ivar ivar = class_getInstanceVariable([ritl class], "_age");
        
        //set ivar
        object_setIvar(ritl, ivar, @22);
        
        
        //print
//        objc_msgSend(ritl,sel,@"Hello");
        
        ((void(*)(id,SEL,id))objc_msgSend)(ritl,sel,@"Hello");
        
        ritl = nil;
        
        //dispose
        objc_disposeClassPair(RITL);
        
    }
    return 0;
}
