//
//  JYPreventCrashProtocol.h
//  Environment
//
//  Created by sh-lx on 2017/11/6.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>
/* 预防崩溃协议 */
@protocol JYPreventCrashProtocol <NSObject>
@required
+(void)preventCrashExchangeMethod;
@end
