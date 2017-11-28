//
//  NSMutableArray+JYPreventCarsh.h
//  Environment
//
//  Created by sh-lx on 2017/11/8.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYPreventCrashProtocol.h"

@interface NSMutableArray (JYPreventCarsh)<JYPreventCrashProtocol>

/**
 具体交互方法
 1. setObject
 2. insertObject
 3. removeObjectAtIndex
 4. objectAtIndex
 5. getObjects
 */

@end
