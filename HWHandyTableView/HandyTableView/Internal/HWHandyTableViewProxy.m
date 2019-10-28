//
//  HWHandyTableViewProxy.m
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import "HWHandyTableViewProxy.h"
#import <pthread.h>
@interface HWHandyTableViewProxy(){
    pthread_mutex_t lock;
}

@end
@implementation HWHandyTableViewProxy
#pragma mark life cycle

- (void)dealloc {
    pthread_mutex_destroy(&lock);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        pthread_mutex_init(&lock, NULL);
        _targets = [NSPointerArray weakObjectsPointerArray];
    }
    return self;
}

#pragma mark public

- (void)addTarget:(id)target {
    pthread_mutex_lock(&lock);
    [_targets addPointer:NULL];
    [_targets compact];
    for (id t in _targets) {
        if (t == target) {
            pthread_mutex_unlock(&lock);
            return;
        }
    }
    [_targets addPointer:(__bridge void * _Nullable)(target)];
    pthread_mutex_unlock(&lock);
}

- (void)removeTarget:(id)target {
    pthread_mutex_lock(&lock);
    [_targets addPointer:NULL];
    [_targets compact];
    for (NSUInteger i = 0; i < _targets.count; i++) {
        if ([_targets pointerAtIndex:i] == (__bridge void * _Nullable)(target)) {
            [_targets removePointerAtIndex:i];
            pthread_mutex_unlock(&lock);
            return;
        }
    }
    pthread_mutex_unlock(&lock);
}

#pragma mark forwarding methods

- (BOOL)respondsToSelector:(SEL)aSelector {
    for (id target in _targets) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return [super respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature;
    for (id target in _targets) {
        signature = [target methodSignatureForSelector:aSelector];
        if (signature) break;
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for (id target in _targets) {
        if ([target respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}

@end
