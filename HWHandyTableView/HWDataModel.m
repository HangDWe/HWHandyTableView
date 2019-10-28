//
//  HWDataModel.m
//  HWHandyTableView
//
//  Created by huangwei on 2019/10/28.
//  Copyright © 2019年 huangwei. All rights reserved.
//

#import "HWDataModel.h"

@implementation HWDataModel
#pragma mark --HWCellConfigProtocol--
-(Class<HWCellProtocol>)hwhd_cellClass{
    return [HWDataCell class];
}
@end
