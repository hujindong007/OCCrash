//
//  NSMutableArray+JYPreventCarsh.m
//  Environment
//
//  Created by sh-lx on 2017/11/8.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import "NSMutableArray+JYPreventCarsh.h"
#import "JYPreventCrash.h"

@implementation NSMutableArray (JYPreventCarsh)

+(void)preventCrashExchangeMethod
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        /**** setObject:atIndexedSubscript: ****/
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:arrayMClass CurrentMethod:@selector(setObject:atIndexedSubscript:) ExchangeMethod:@selector(preventCarshSetObject:atIndexedSubscript:)];
        
        /**** insertObject:atIndex: ****/
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:arrayMClass CurrentMethod:@selector(insertObject:atIndex:) ExchangeMethod:@selector(preventCarshInsertObject:atIndex:)];
        
        /**** removeObjectAtIndex: ****/
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:arrayMClass CurrentMethod:@selector(removeObjectAtIndex:) ExchangeMethod:@selector(preventCarshRemoveObjectAtIndex:)];
        
        /**** objectAtIndex ****/
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:arrayMClass CurrentMethod:@selector(objectAtIndex:) ExchangeMethod:@selector(preventCarshObjectAtIndex:)];

        /**** getObjects:range: ****/
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:arrayMClass CurrentMethod:@selector(getObjects:range:) ExchangeMethod:@selector(preventCarshGetObjects:range:)];
    });
}

#pragma mark setObject:atIndexedSubscript:
-(void)preventCarshSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    @try
    {
        [self preventCarshSetObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally
    {
        
    }
}

#pragma mark insertObject:
-(void)preventCarshInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    @try
    {
        [self preventCarshInsertObject:anObject atIndex:index];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally
    {
        
    }
}

#pragma mark removeObjectAtIndex:
-(void)preventCarshRemoveObjectAtIndex:(NSUInteger)index
{
    @try
    {
        [self preventCarshRemoveObjectAtIndex:index];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally
    {
        
    }
}

#pragma mark objectAtIndex:
-(id)preventCarshObjectAtIndex:(NSUInteger)index
{
    id object = nil;
    @try
    {
        object = [self preventCarshObjectAtIndex:index];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
    }
    @finally
    {
        return object;
    }
}

#pragma mark getObjects
-(void)preventCarshGetObjects:(__unsafe_unretained id  _Nonnull [])objects range:(NSRange)range
{
    @try
    {
        [self preventCarshGetObjects:objects range:range];
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
