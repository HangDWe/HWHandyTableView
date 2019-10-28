//
//  ViewController.m
//  HWHandyTableView
//
//  Created by huangwei on 2019/10/28.
//  Copyright © 2019年 huangwei. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+HWHandyTableView.h"
#import "HWDataModel.h"
@interface ViewController ()
@property (nonatomic, strong) UITableView *scrollTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollTableView];
    HWDataModel *model1 = [[HWDataModel alloc]init];
    model1.name = @"第一个cell";
    HWDataModel *model2 = [[HWDataModel alloc]init];
    model2.name = @"第二个cell";
    HWDataModel *model3 = [[HWDataModel alloc]init];
    model3.name = @"第三个cell";
    HWDataModel *model4 = [[HWDataModel alloc]init];
    model4.name = @"第四个cell";
    HWDataModel *model5 = [[HWDataModel alloc]init];
    model5.name = @"第五个cell";
    [self.scrollTableView.hwhd_rowArray addObjectsFromArray:@[model1,model2,model3,model4,model5]];
    [self.scrollTableView reloadData];
    
}

- (UITableView *)scrollTableView {
    if (!_scrollTableView) {
        _scrollTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _scrollTableView.frame = CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _scrollTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _scrollTableView.backgroundColor = [UIColor whiteColor];
        _scrollTableView.tableFooterView = [UIView new];
        _scrollTableView.estimatedRowHeight = 44;
        _scrollTableView.estimatedSectionFooterHeight = 0;
        _scrollTableView.estimatedSectionHeaderHeight = 0;
        if (@available(iOS 11.0, *)) {
            _scrollTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _scrollTableView;
}
@end
