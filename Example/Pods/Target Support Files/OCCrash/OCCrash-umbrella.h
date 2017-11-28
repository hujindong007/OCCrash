#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "JYPreventCrash.h"
#import "JYPreventCrashAuxiliaryClass.h"
#import "JYPreventCrashProtocol.h"
#import "NSArray+JYPreventCrash.h"
#import "NSDictionary+JYPreventCrash.h"
#import "NSMutableArray+JYPreventCarsh.h"
#import "NSMutableDictionary+JYPreventCrash.h"
#import "NSObject+JYPreventCrash.h"
#import "NSString+JYPreventCrash.h"

FOUNDATION_EXPORT double OCCrashVersionNumber;
FOUNDATION_EXPORT const unsigned char OCCrashVersionString[];

