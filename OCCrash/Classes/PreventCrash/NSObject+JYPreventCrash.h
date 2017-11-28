//
//  NSObject+JYPreventCrash.h
//  Environment
//
//  Created by sh-lx on 2017/11/9.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYPreventCrashProtocol.h"

@interface NSObject (JYPreventCrash)<JYPreventCrashProtocol>

/**
 具体交互方法
 1. unrecognized selector sent to instance
 2. setValue:forKey:
 3. setValue:forKeyPath:
 4. setValue:forUndefinedKey:
 5. setValuesForKeysWithDictionary:
 */

@end
