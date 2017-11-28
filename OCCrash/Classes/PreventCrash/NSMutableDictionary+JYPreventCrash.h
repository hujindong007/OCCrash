//
//  NSMutableDictionary+JYPreventCrash.h
//  Environment
//
//  Created by sh-lx on 2017/11/9.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYPreventCrashProtocol.h"

@interface NSMutableDictionary (JYPreventCrash)<JYPreventCrashProtocol>

/**
 具体交互方法
 1. dictionaryWithObjects:forKeys:count:
 2. setObject:forKey:
 3. setObject:forKeyedSubscript:
 4. removeObjectForKey:
 */

@end
