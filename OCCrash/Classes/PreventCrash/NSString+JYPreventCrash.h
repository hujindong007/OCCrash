//
//  NSString+JYPreventCrash.h
//  Environment
//
//  Created by sh-lx on 2017/11/10.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYPreventCrashProtocol.h"

@interface NSString (JYPreventCrash)<JYPreventCrashProtocol>

/**
 具体交互方法
 1. characterAtIndex
 2. substringFromIndex
 3. substringToIndex
 4. substringWithRange:
 5. stringByReplacingOccurrencesOfString:
 6. stringByReplacingOccurrencesOfString:withString:options:range:
 7. stringByReplacingCharactersInRange:withString:
 */

@end
