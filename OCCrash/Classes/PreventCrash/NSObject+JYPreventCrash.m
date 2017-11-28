//
//  NSObject+JYPreventCrash.m
//  Environment
//
//  Created by sh-lx on 2017/11/9.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import "NSObject+JYPreventCrash.h"
#import "JYPreventCrash.h"
#import "JYPreventCrashAuxiliaryClass.h"

@implementation NSObject (JYPreventCrash)

+(void)preventCrashExchangeMethod
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /* setValue:forKey: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(setValue:forKey:) ExchangeMethod:@selector(preventCrashSetValue:forKey:)];
        
        /* setValue:forKeyPath: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(setValue:forKeyPath:) ExchangeMethod:@selector(preventCrashSetValue:forKeyPath:)];
 
        /* setValue:forUndefinedKey: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(setValue:forUndefinedKey:) ExchangeMethod:@selector(preventCrashSetValue:forUndefinedKey:)];
        
        /* setValuesForKeysWithDictionary: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(setValuesForKeysWithDictionary:) ExchangeMethod:@selector(preventCrashSetValuesForKeysWithDictionary:)];
        
        /* unrecognized selector sent to instance */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(methodSignatureForSelector:) ExchangeMethod:@selector(preventCrashMethodSignatureForSelector:)];
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(forwardInvocation:) ExchangeMethod:@selector(preventCrashForwardInvocation:)];
    });
}

#pragma mark - unrecognized selector sent to instance

- (NSMethodSignature *)preventCrashMethodSignatureForSelector:(SEL)aSelector {
    
    NSMethodSignature *ms = [self preventCrashMethodSignatureForSelector:aSelector];
    
    if (ms == nil) {
        // 创建一个非nil的方法签名，否则，不会进入forwardInvocation:方法进行消息转发
        ms = [JYPreventCrashAuxiliaryClass instanceMethodSignatureForSelector:@selector(sendMessageToMethod)];
    }
    return ms;
}

- (void)preventCrashForwardInvocation:(NSInvocation *)anInvocation {
    
    @try {
        [self preventCrashForwardInvocation:anInvocation];
        
    } @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
        
    } @finally {
        
    }
    
}

#pragma mark - setValue:forKey:

- (void)preventCrashSetValue:(id)value forKey:(NSString *)key {
    @try {
        [self preventCrashSetValue:value forKey:key];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
    }
    @finally {
        
    }
}

#pragma mark - setValue:forKeyPath:

- (void)preventCrashSetValue:(id)value forKeyPath:(NSString *)keyPath {
    @try {
        [self preventCrashSetValue:value forKeyPath:keyPath];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally {
        
    }
}

#pragma mark - setValue:forUndefinedKey:

- (void)preventCrashSetValue:(id)value forUndefinedKey:(NSString *)key {
    @try {
        [self preventCrashSetValue:value forUndefinedKey:key];
    }
    @catch (NSException *exception)
    {
       [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally {
        
    }
}

#pragma mark - setValuesForKeysWithDictionary:

- (void)preventCrashSetValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    @try {
        [self preventCrashSetValuesForKeysWithDictionary:keyedValues];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally {
        
    }
}


@end
