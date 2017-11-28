//
//  NSMutableDictionary+JYPreventCrash.m
//  Environment
//
//  Created by sh-lx on 2017/11/9.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import "NSMutableDictionary+JYPreventCrash.h"
#import "JYPreventCrash.h"

@implementation NSMutableDictionary (JYPreventCrash)

+(void)preventCrashExchangeMethod
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSDictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        /* dictionaryWithObjects:forKeys:count: */
        [JYPreventCrash preventCrashExchangeMethodWithClass:__NSDictionaryM CurrentMethod:@selector(dictionaryWithObjects:forKeys:count:) ExchangeMethod:@selector(preventCrashDictionaryWithObjects:forKeys:count:)];
        
        /* setObject:forKey: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSDictionaryM CurrentMethod:@selector(setObject:forKey:) ExchangeMethod:@selector(__NSDictionaryMPreventCrashSetObject:forKey:)];
        
        /* setObject:forKeyedSubscript: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSDictionaryM CurrentMethod:@selector(setObject:forKeyedSubscript:) ExchangeMethod:@selector(__NSDictionaryMSetObject:forKeyedSubscript:)];
        
        /* removeObjectForKey: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSDictionaryM CurrentMethod:@selector(removeObjectForKey:) ExchangeMethod:@selector(__NSDictionaryMPreventCrashRemoveObjectForKey:)];
    });
}

#pragma mark DictionaryWithObjects:forKeys:count:
+(instancetype)preventCrashDictionaryWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt
{
    id instance = nil;
    @try
    {
        instance = [self preventCrashDictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException*exception)
    {
        NSString *promptStr = @"Dictionary内 key或者value为nil 直接移除key 并返回没有空值的Dictionary";
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:promptStr];
        /* 筛选出不为nil的key和value */
        NSInteger index = 0;
        id _Nonnull __unsafe_unretained newObjects[cnt];
        id _Nonnull __unsafe_unretained newKeys[cnt];
        for (int i = 0; i<cnt; i++) {
            if (newObjects[i]&&newKeys[i]) {
                newObjects[index] = newObjects[i];
                newKeys[index] = newKeys[i];
                index++;
            }
        }
        instance = [self preventCrashDictionaryWithObjects:newObjects forKeys:newKeys count:index];
    }
    @finally
    {
        return instance;
    }
}


#pragma mark setObject:forKey:
-(void)__NSDictionaryMPreventCrashSetObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    @try
    {
        [self __NSDictionaryMPreventCrashSetObject:anObject forKey:aKey];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally
    {
        
    }
}

#pragma mark setObject:forKeyedSubscript:
-(void)__NSDictionaryMSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
    @try
    {
        [self __NSDictionaryMSetObject:obj forKeyedSubscript:key];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally
    {
        
    }
}

#pragma mark removeObjectForKey:
-(void)__NSDictionaryMPreventCrashRemoveObjectForKey:(id)aKey
{
    @try
    {
        [self __NSDictionaryMPreventCrashRemoveObjectForKey:aKey];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally
    {
        
    }
}

@end
