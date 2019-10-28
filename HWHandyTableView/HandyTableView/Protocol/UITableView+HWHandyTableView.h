//
//  UITableView+HWHandyTableView.h
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWSection.h"
NS_ASSUME_NONNULL_BEGIN

@interface UITableView (HWHandyTableView)
    
/** 一个 section 情况 ，cell配置数组*/
@property (nonatomic, strong, readonly) NSMutableArray<id<HWCellConfigProtocol>> *hwhd_rowArray;
    
/** 一个 section 情况，header 配置 */
@property (nonatomic, strong, nullable) id<HWHeaderFooterConfigProtocol> hwhd_headerConfig;
    
/** 一个 section 情况，footer 配置 */
@property (nonatomic, strong, nullable) id<HWHeaderFooterConfigProtocol> hwhd_footerConfig;
    
/** 多个 section 情况，每个 YBHTSection 实例包含 cell/header/footer 配置*/
@property (nonatomic, strong, readonly) NSMutableArray<HWSection *> *hwhd_sectionArray;
    
@end

NS_ASSUME_NONNULL_END
