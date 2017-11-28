//
//  NSDictionary+JYPreventCrash.m
//  Environment
//
//  Created by sh-lx on 2017/11/8.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import "NSDictionary+JYPreventCrash.h"
#import "JYPreventCrash.h"

@implementation NSDictionary (JYPreventCrash)

+(void)preventCrashExchangeMethod
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /* dictionaryWithObjects:forKeys:count: */
        [JYPreventCrash preventCrashExchangeMethodWithClass:[self class] CurrentMethod:@selector(dictionaryWithObjects:forKeys:count:) ExchangeMethod:@selector(preventCrashDictionaryWithObjects:forKeys:count:)];
    });
}

#pragma mark dictionaryWithObjects:forKeys:count:
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

@end
