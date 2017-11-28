//
//  NSArray+JYPreventCarsh.m
//  Environment
//
//  Created by sh-lx on 2017/11/6.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import "NSArray+JYPreventCrash.h"
#import "JYPreventCrash.h"

@implementation NSArray (JYPreventCrash)

+(void)preventCrashExchangeMethod
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /************************ 对象方法 ************************/
        
        /* arrayWithObjects */
        
        [JYPreventCrash preventCrashExchangeMethodWithClass:[self class] CurrentMethod:@selector(arrayWithObjects:count:) ExchangeMethod:@selector(preventCrashArrayWithObjects:count:)];
        
        /************************ 实例方法 ************************/
        /*
         NSArray 是个抽象类 具体实现不在这里
         1、未初始化的数组叫__NSPlaceHolderArray;
         2、初始化后的可变数组类名都叫__NSArrayM;
         3、初始化后的不可变数组类名都叫__NSArrayI、__NSArray0、__NSSingleObjectArrayI;
         */
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");
        
        /**** objectsAtIndexes ****/
        
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSArray CurrentMethod:@selector(objectsAtIndexes:) ExchangeMethod:@selector(__NSArrayPreventCrashObjectsAtIndexes:)];
        
        /**** ObjectAtIndex ****/
        
        //__NSArrayI
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSArrayI CurrentMethod:@selector(objectAtIndex:) ExchangeMethod:@selector(__NSArrayIPreventCrashObjectAtIndex:)];
        //__NSSingleObjectArrayI
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSSingleObjectArrayI CurrentMethod:@selector(objectAtIndex:) ExchangeMethod:@selector(__NSSingleObjectArrayIPreventCrashObjectAtIndex:)];
        //__NSArray0
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSArray0 CurrentMethod:@selector(objectAtIndex:) ExchangeMethod:@selector(__NSArray0PreventCrashObjectAtIndex:)];
        
        /**** ObjectAtIndexedSubscript ****/
        
        //__NSArrayI 直接 array = @[@"",@""] 通过array[1]取值会进入以下方法
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSArrayI CurrentMethod:@selector(objectAtIndexedSubscript:) ExchangeMethod:@selector(__NSArrayIPreventCrashObjectAtIndexedSubscript:)];
        
        /**** GetObjects ****/
        
        //__NSArray
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSArray CurrentMethod:@selector(getObjects:range:) ExchangeMethod:@selector(__NSArrayPreventCrashGetObjects:range:)];
        //__NSArrayI
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSArrayI CurrentMethod:@selector(getObjects:range:) ExchangeMethod:@selector(__NSArrayIPreventCrashGetObjects:range:)];
        //__NSSingleObjectArrayI
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSSingleObjectArrayI CurrentMethod:@selector(getObjects:range:) ExchangeMethod:@selector(__NSSingleObjectArrayIPreventCrashGetObjects:range:)];
    });
}

#pragma mark 初始化 ArrayWithObjects
+(instancetype)preventCrashArrayWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{
    id instance = nil;
    @try {
        instance = [self preventCrashArrayWithObjects:objects count:cnt];
    }
    @catch(NSException *exception)
    {
        NSString *promptStr = @"NSArray内为nil的对象移除 并返回没有空值的NSArray";
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:promptStr];
        
        /* 筛选出不为nil的对象赋值 */
        int atIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        for (int i=0; i<cnt; i++) {
            if (objects[i]!=nil) {
                newObjects[atIndex] = objects[i];
                atIndex++;
            }
        }
        instance = [self preventCrashArrayWithObjects:newObjects count:atIndex];
    }
    @finally {
        return instance;
    }
}
#pragma mark 获取多个下标 ObjectAtIndex
-(NSArray *)__NSArrayPreventCrashObjectsAtIndexes:(NSIndexSet *)indexes
{
    id object = nil;
    @try
    {
        object = [self __NSArrayPreventCrashObjectsAtIndexes:indexes];
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

#pragma mark 获取单个下标 ObjectAtIndex
-(id)__NSArrayIPreventCrashObjectAtIndex:(NSUInteger)index
{
    id object = nil;
    @try
    {
        object = [self __NSArrayIPreventCrashObjectAtIndex:index];
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

-(id)__NSSingleObjectArrayIPreventCrashObjectAtIndex:(NSUInteger)index
{
    id object = nil;
    @try
    {
        object = [self __NSSingleObjectArrayIPreventCrashObjectAtIndex:index];
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
-(id)__NSArray0PreventCrashObjectAtIndex:(NSUInteger)index
{
    id object = nil;
    @try
    {
        object = [self __NSArray0PreventCrashObjectAtIndex:index];
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

#pragma mark 获取单个下标 ObjectAtIndexedSubscript
-(id)__NSArrayIPreventCrashObjectAtIndexedSubscript:(NSUInteger)idx
{
    id object = nil;
    @try
    {
        object = [self __NSArrayIPreventCrashObjectAtIndexedSubscript:idx];
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

#pragma mark 获取下标对象 getObjects
-(void)__NSArrayPreventCrashGetObjects:(__unsafe_unretained id  _Nonnull [])objects range:(NSRange)range
{
    @try
    {
        [self __NSArrayPreventCrashGetObjects:objects range:range];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally{}
}

-(void)__NSArrayIPreventCrashGetObjects:(__unsafe_unretained id  _Nonnull [])objects range:(NSRange)range
{
    @try
    {
        [self __NSArrayIPreventCrashGetObjects:objects range:range];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally{}
}

-(void)__NSSingleObjectArrayIPreventCrashGetObjects:(__unsafe_unretained id  _Nonnull [])objects range:(NSRange)range
{
    @try
    {
        [self __NSSingleObjectArrayIPreventCrashGetObjects:objects range:range];
    }
    @catch (NSException*exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashIgnore];
    }
    @finally{}
}


@end
