//
//  HWFunctionCellDelegate.h
//  ZQReader
//
//  Created by huangwei on 2019/9/10.
//  Copyright © 2019年 www.tyyd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWCellConfigProtocol.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol HWFunctionCellDelegate <NSObject>

- (void)hwhd_functionCell:(UITableViewCell *)cell didSelectRowAtIndexPath:(NSIndexPath *)indexPath withModel:(id<HWCellConfigProtocol>)model;

@end

NS_ASSUME_NONNULL_END
