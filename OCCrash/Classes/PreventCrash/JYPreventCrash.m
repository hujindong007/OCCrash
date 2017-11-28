//
//  JYPreventCrash.m
//  Environment
//
//  Created by sh-lx on 2017/11/3.
//Copyright © 2017年 sh-lx. All rights reserved.
//

#import "JYPreventCrash.h"

#import "NSObject+JYPreventCrash.m"

#import "NSString+JYPreventCrash.h"

#import "NSArray+JYPreventCrash.h"
#import "NSMutableArray+JYPreventCarsh.h"

#import "NSDictionary+JYPreventCrash.h"
#import "NSMutableDictionary+JYPreventCrash.h"

#define JYPreventCrashLogString @"====================== JYPreventCrash ======================"


#define JY_Key_ErrorName @"Key_ErrorName"
#define JY_Key_ErrorReason @"Key_ErrorReason"
#define JY_Key_ErrorLocationMessage @"Key_ErrorLocationMessage"



@implementation JYPreventCrash

#pragma mark ---------- Life Cycle ----------

#pragma mark ---------- Delegate ----------

#pragma mark ---------- Private Method ----------
#pragma mark 启动预防奔溃
+(void)startPreventCrash
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [NSObject preventCrashExchangeMethod];
        
        [NSString preventCrashExchangeMethod];
        
        [NSArray preventCrashExchangeMethod];
        [NSMutableArray preventCrashExchangeMethod];
        
        [NSDictionary preventCrashExchangeMethod];
        [NSMutableDictionary preventCrashExchangeMethod];
    });
}

#pragma mark 交换对象方法
+(void)preventCrashExchangeMethodWithClass:(Class)onClass CurrentMethod:(SEL)currentMethod ExchangeMethod:(SEL)exchangeMethod
{
    Method methodOne = class_getClassMethod(onClass, currentMethod);
    Method methodTwo = class_getClassMethod(onClass, exchangeMethod);
    method_exchangeImplementations(methodOne, methodTwo);
}

#pragma mark 交换实例方法
+(void)preventCrashExchangeInterfaceMethodWithClass:(Class)onClass CurrentMethod:(SEL)currentMethod ExchangeMethod:(SEL)exchangeMethod
{
    /*
     要先尝试添加原 selector 是为了做一层保护，因为如果这个类没有实现 originalSelector ，但其父类实现了，
     那 class_getInstanceMethod 会返回父类的方法。这样 method_exchangeImplementations 替换的是父类的那个方法，
     这当然不是你想要的。所以我们先尝试添加 orginalSelector ，如果已经存在，再用 method_exchangeImplementations
     把原方法的实现跟新的方法实现给交换掉。
     */
    /* 获取 Method */
    Method methodOne =  class_getInstanceMethod(onClass, currentMethod);
    Method methodTwo =  class_getInstanceMethod(onClass, exchangeMethod);
    /* 添加currentMethod方法 */
    BOOL didAddMethod = class_addMethod(onClass, currentMethod, method_getImplementation(methodTwo), method_getTypeEncoding(methodTwo));
    if (didAddMethod)
    {
        /* 交互替换 */
        class_replaceMethod(onClass, exchangeMethod, method_getImplementation(methodOne), method_getTypeEncoding(methodOne));
    }
    else
    {
        /* 交互方法 */
        method_exchangeImplementations(methodOne, methodTwo);
    }
}

#pragma mark 获取错误位置信息
+(NSString*)getErrorLocationMessage
{
    __block NSString *locationString = nil;
    NSArray *symbols = [NSThread callStackSymbols];
    /* 匹配出来的格式为 +[类名 方法名]  或者 -[类名 方法名] */
    NSString *regularExpStr = @"[-\\+]\\[.+\\]";
    NSRegularExpression *regularExp = [[NSRegularExpression alloc] initWithPattern:regularExpStr options:NSRegularExpressionCaseInsensitive error:nil];
    
    /* i = 3 (跳过错误发生后进入的方法 比如：preventCrashErrorWith、getErrorLocation) */
    for (int i = 3; i<symbols.count; i++)
    {
        NSString *callStackSymbol = symbols[i];
        [regularExp enumerateMatchesInString:callStackSymbol options:NSMatchingReportProgress range:NSMakeRange(0, callStackSymbol.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            if (result) {
                NSString* tempCallStackSymbolMsg = [callStackSymbol substringWithRange:result.range];
                //获取类名
                NSString *className = [tempCallStackSymbolMsg componentsSeparatedByString:@" "].firstObject;
                className = [className componentsSeparatedByString:@"["].lastObject;
                
                NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(className)];
                
                // 过滤不是mainBundle里的类
                if (![className hasSuffix:@")"] && bundle == [NSBundle mainBundle]) {
                    locationString = tempCallStackSymbolMsg;
                }
                *stop = YES;
            }
        }];
        
        if (locationString.length) {
            break;
        }
    }
    return locationString;
}

#pragma mark 奔溃日志
+(void)preventCrashErrorWithException:(NSException*)exception promptStr:(NSString*)promptStr
{
    NSString *errorName = exception.name;
    NSString *errorReason = exception.reason;
    NSString *errorLocationMessage= [self getErrorLocationMessage];
    NSString *logString = [NSString stringWithFormat:@"\n错误名 : %@\n错误详情 : %@\n具体操作 : %@\n错误定位信息: %@\n",errorName,errorReason,promptStr,errorLocationMessage];
    logString = [NSString stringWithFormat:@"\n\n%@\n%@\n%@\n\n.",JYPreventCrashLogString,logString,JYPreventCrashLogString];
    NSLog(@"%@",logString);
}

#pragma mark ---------- Getters and Setters ----------

@end
