//
//  HWHandyTableViewProxy.h
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWHandyTableViewProxy : NSObject
- (void)addTarget:(id)target;
- (void)removeTarget:(id)target;

@property (nonatomic, strong) NSPointerArray *targets;
@end

NS_ASSUME_NONNULL_END
