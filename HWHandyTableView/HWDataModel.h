//
//  HWDataModel.h
//  HWHandyTableView
//
//  Created by huangwei on 2019/10/28.
//  Copyright © 2019年 huangwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWCellConfigProtocol.h"
#import "HWDataCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface HWDataModel : NSObject<HWCellConfigProtocol>
@property (nonatomic, copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
