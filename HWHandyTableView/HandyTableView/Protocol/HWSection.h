//
//  HWSection.h
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWCellConfigProtocol.h"
#import "HWCellProtocol.h"
#import "HWHeaderFooterProtocol.h"
#import "HWHeaderFooterConfigProtocol.h"
#import "HWFunctionCellDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface HWSection : NSObject
/** UITableView 的 header 配置 */
@property (nonatomic, strong, nullable) id<HWHeaderFooterConfigProtocol> headerConfig;
    
/** UITableView 的 footer 配置 */
@property (nonatomic, strong, nullable) id<HWHeaderFooterConfigProtocol> footerConfig;
    
/** UITableView 的 cell 配置数组 */
@property (nonatomic, strong) NSMutableArray<id<HWCellConfigProtocol>> *rowArray;
@end

NS_ASSUME_NONNULL_END
