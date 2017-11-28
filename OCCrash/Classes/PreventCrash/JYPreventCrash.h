//
//  JYPreventCrash.h
//  Environment
//
//  Created by sh-lx on 2017/11/3.
//Copyright © 2017年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

/* 重写NSLog,Debug模式下打印日志和当前行数 */
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

/* 具体操作提示 */
#define JYPreventCrashReturnNil @"返回nil"
#define JYPreventCrashIgnore    @"忽略此操作"

@interface JYPreventCrash : NSObject
/**
 * 启动预防奔溃
 */
+(void)startPreventCrash;
/**
 * 交互对象方法
 *
 *  @param onClass        (方法所在类)
 *  @param currentMethod  (原本的方法)
 *  @param exchangeMethod (要替换成的方法)
 */

+(void)preventCrashExchangeMethodWithClass:(Class)onClass CurrentMethod:(SEL)currentMethod ExchangeMethod:(SEL)exchangeMethod;
/**
 * 交互实例方法
 *
 *  @param onClass        (方法所在类)
 *  @param currentMethod  (原本的方法)
 *  @param exchangeMethod (要替换成的方法)
 */
+(void)preventCrashExchangeInterfaceMethodWithClass:(Class)onClass CurrentMethod:(SEL)currentMethod ExchangeMethod:(SEL)exchangeMethod;
/**
 * 奔溃日志
 *
 * @param exception (错误)
 * @param promptStr (错误原因提示)
 */
+(void)preventCrashErrorWithException:(NSException*)exception promptStr:(NSString*)promptStr;

@end
