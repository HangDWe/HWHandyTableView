//
//  HWCellProtocol.h
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HWCellConfigProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol HWCellProtocol <NSObject>

@required

/**
 传递配置对象给 cell （根据配置对象拿到数据更新UI）

 @param config 配置对象
 */
-(void)hwhd_setCellConfig:(id<HWCellConfigProtocol>)config;

/**
 获取 cell 高度

 @param config 配置对象
 @param reuseIdentifier 复用标识
 @param indexPath indexPath
 @return 高度
 */
+(float)hwhd_heightForCellWithConfig:(id<HWCellConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;

@optional

@property (nonatomic, copy) void(^hwhd_reloadTableView)(void);

@end

NS_ASSUME_NONNULL_END
