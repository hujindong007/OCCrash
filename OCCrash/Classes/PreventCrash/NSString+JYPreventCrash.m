//
//  NSString+JYPreventCrash.m
//  Environment
//
//  Created by sh-lx on 2017/11/10.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import "NSString+JYPreventCrash.h"
#import "JYPreventCrash.h"

@implementation NSString (JYPreventCrash)

+(void)preventCrashExchangeMethod
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSCFConstantString = NSClassFromString(@"__NSCFConstantString");
        
        /* characterAtIndex */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(characterAtIndex:) ExchangeMethod:@selector(preventCrashCharacterAtIndex:)];
        
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSCFConstantString CurrentMethod:@selector(characterAtIndex:) ExchangeMethod:@selector(__NSCFConstantStringPreventCrashCharacterAtIndex:)];
        
        /* substringFromIndex */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(substringFromIndex:) ExchangeMethod:@selector(preventCrashSubstringFromIndex:)];
        
        /* substringToIndex */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(substringToIndex:) ExchangeMethod:@selector(preventCrashSubstringToIndex:)];
        
        /* substringWithRange: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(substringWithRange:) ExchangeMethod:@selector(preventCrashSubstringWithRange:)];
        
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:__NSCFConstantString CurrentMethod:@selector(substringWithRange:) ExchangeMethod:@selector(__NSCFConstantStringPreventCrashSubstringWithRange:)];
        
        /* stringByReplacingOccurrencesOfString: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(stringByReplacingOccurrencesOfString:withString:) ExchangeMethod:@selector(preventCrashStringByReplacingOccurrencesOfString:withString:)];
        
        /* stringByReplacingOccurrencesOfString:withString:options:range: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) ExchangeMethod:@selector(preventCrashStringByReplacingOccurrencesOfString:withString:options:range:)];
        
        /* stringByReplacingCharactersInRange:withString: */
        [JYPreventCrash preventCrashExchangeInterfaceMethodWithClass:[self class] CurrentMethod:@selector(stringByReplacingCharactersInRange:withString:) ExchangeMethod:@selector(preventCrashStringByReplacingCharactersInRange:withString:)];
    });
}

#pragma mark - characterAtIndex:

- (unichar)preventCrashCharacterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self preventCrashCharacterAtIndex:index];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
    }
    @finally {
        return characteristic;
    }
}

- (unichar)__NSCFConstantStringPreventCrashCharacterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self __NSCFConstantStringPreventCrashCharacterAtIndex:index];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
    }
    @finally {
        return characteristic;
    }
}

#pragma mark - substringFromIndex:

- (NSString *)preventCrashSubstringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self preventCrashSubstringFromIndex:from];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - substringToIndex

- (NSString *)preventCrashSubstringToIndex:(NSUInteger)to {
    
    NSString *subString = nil;
    
    @try {
        subString = [self preventCrashSubstringToIndex:to];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - substringWithRange:

- (NSString *)preventCrashSubstringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self preventCrashSubstringWithRange:range];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

- (NSString *)__NSCFConstantStringPreventCrashSubstringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self __NSCFConstantStringPreventCrashSubstringWithRange:range];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

#pragma mark - stringByReplacingOccurrencesOfString:

- (NSString *)preventCrashStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self preventCrashStringByReplacingOccurrencesOfString:target withString:replacement];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)preventCrashStringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self preventCrashStringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)preventCrashStringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self preventCrashStringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception)
    {
        [JYPreventCrash preventCrashErrorWithException:exception promptStr:JYPreventCrashReturnNil];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

@end
