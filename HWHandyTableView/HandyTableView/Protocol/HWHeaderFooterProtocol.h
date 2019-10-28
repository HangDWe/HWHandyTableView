//
//  HWHeaderFooterProtocol.h
//  ZQReader
//
//  Created by huangwei on 2019/9/10.
//  Copyright © 2019年 www.tyyd.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HWHeaderFooterConfigProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol HWHeaderFooterProtocol <NSObject>

@required
/**
 传递配置对象给 header/footer (根据配置对象拿到数据更新UI)
     
 @param config 配置对象
*/
- (void)hwhd_setHeaderFooterConfig:(id<HWHeaderFooterConfigProtocol>)config;

/**
 获取 header/footer 的高度
     
 @param config 配置对象
 @param reuseIdentifier 复用标识
 @param section section
 @return 高度
*/
+ (float)hwhd_heightForHeaderFooterWithConfig:(id<HWHeaderFooterConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier section:(NSInteger)section;
@optional
    
/**
 刷新 tableView
 */
@property (nonatomic, copy) void(^hwhd_reloadTableView)(void);

@end

NS_ASSUME_NONNULL_END
