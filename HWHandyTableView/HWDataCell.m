//
//  HWDataCell.m
//  HWHandyTableView
//
//  Created by huangwei on 2019/10/28.
//  Copyright © 2019年 huangwei. All rights reserved.
//

#import "HWDataCell.h"

@implementation HWDataCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
#pragma mark --HWCellProtocol--

-(void)hwhd_setCellConfig:(id<HWCellConfigProtocol>)config{
    HWDataModel *model = (HWDataModel *)config;
    self.textLabel.text = model.name;
}
+ (float)hwhd_heightForCellWithConfig:(id<HWCellConfigProtocol>)config reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath{
        return UITableViewAutomaticDimension;
}

@end
