//
//  HWCellConfigProtocol.h
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HWCellProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol HWCellConfigProtocol <NSObject>

@required

/**
 获取 cell 的类型

 @return 类型
 */
-(Class<HWCellProtocol>)hwhd_cellClass;
@optional

/**
 获取 cell 复用标识

 @return 复用标识
 */
-(nullable NSString *)hwhd_cellReuseIdentifier;
@end

NS_ASSUME_NONNULL_END
