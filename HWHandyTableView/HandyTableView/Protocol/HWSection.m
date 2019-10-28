//
//  HWSection.m
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import "HWSection.h"

@implementation HWSection
-(NSMutableArray<id<HWCellConfigProtocol>> *)rowArray{
    if (!_rowArray) {
        _rowArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _rowArray;
}
@end
