//
//  HWHandyTableViewIMP.m
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import "HWHandyTableViewIMP.h"
#import <UIKit/UIKit.h>
//#import "UIView+NIM.h"
@interface HWHandyTableViewIMP()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation HWHandyTableViewIMP
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HWSection *htSection = self.sectionArray[indexPath.section];
    id<HWCellConfigProtocol> config = htSection.rowArray[indexPath.row];
    
    if ([config.hwhd_cellClass respondsToSelector:@selector(hwhd_heightForCellWithConfig:reuseIdentifier:indexPath:)]) {
       return [config.hwhd_cellClass hwhd_heightForCellWithConfig:config reuseIdentifier:[self reuseIdentifierForCellConfig:config]indexPath:indexPath];
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    HWSection *htSection = self.sectionArray[section];
    id<HWHeaderFooterConfigProtocol> config = htSection.headerConfig;
    
    return [self heightForHeaderFooterWithTableView:tableView config:config section:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    HWSection *htSection = self.sectionArray[section];
    id<HWHeaderFooterConfigProtocol> config = htSection.footerConfig;
    
    return [self heightForHeaderFooterWithTableView:tableView config:config section:section];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HWSection *htSection = self.sectionArray[section];
    id<HWHeaderFooterConfigProtocol> config = htSection.headerConfig;
    
    return [self viewForHeaderFooterWithTableView:tableView config:config section:section];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    HWSection *htSection = self.sectionArray[section];
    id<HWHeaderFooterConfigProtocol> config = htSection.headerConfig;
    
    return [self viewForHeaderFooterWithTableView:tableView config:config section:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HWSection *htSection = self.sectionArray[indexPath.section];
    id<HWCellConfigProtocol> config = htSection.rowArray[indexPath.row];
    UITableViewCell<HWCellProtocol> *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIViewController<HWFunctionCellDelegate> *vc = (UIViewController<HWFunctionCellDelegate> *)[self hw_viewController:cell];
    if ([vc respondsToSelector:@selector(hwhd_functionCell:didSelectRowAtIndexPath:withModel:)]) {
        [vc hwhd_functionCell:cell didSelectRowAtIndexPath:indexPath withModel:config];
    }
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sectionArray[section].rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HWSection *section = self.sectionArray[indexPath.section];
    id<HWCellConfigProtocol> config = section.rowArray[indexPath.row];
    NSString *identifier = [self reuseIdentifierForCellConfig:config];
    UITableViewCell<HWCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSString *path = [[NSBundle mainBundle]pathForResource:NSStringFromClass(config.hwhd_cellClass) ofType:@"nib"];
        if (path) {
            [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(config.hwhd_cellClass) bundle:nil] forCellReuseIdentifier:identifier];
        }else{
            [tableView registerClass:config.hwhd_cellClass forCellReuseIdentifier:identifier];
        }
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    }
    [cell hwhd_setCellConfig:config];
    if ([cell respondsToSelector:@selector(setHwhd_reloadTableView:)]) {
        __weak typeof(tableView) weakTableView = tableView;
        [cell setHwhd_reloadTableView:^{
            __strong typeof(weakTableView) strongTableView = weakTableView;
            [strongTableView reloadData];
        }];
    }
    return cell;
}

#pragma mark - private
-(NSString *)reuseIdentifierForCellConfig:(id<HWCellConfigProtocol>)config{
    NSString *identifier;
    if (config && [config respondsToSelector:@selector(hwhd_cellReuseIdentifier)]) {
        identifier = [config hwhd_cellReuseIdentifier];
    }
    return identifier?:NSStringFromClass(config.hwhd_cellClass);
}
- (NSString *)reuseIdentifierForHeaderFooterConfig:(id<HWHeaderFooterConfigProtocol>)config {
    NSString *identifier;
    if (config && [config respondsToSelector:@selector(hwhd_headerFooterReuseIdentifier)]) {
        identifier = [config hwhd_headerFooterReuseIdentifier];
    }
    return identifier ?: NSStringFromClass(config.hwhd_headerFooterClass);
}
- (CGFloat)heightForHeaderFooterWithTableView:(UITableView *)tableView config:(id<HWHeaderFooterConfigProtocol>)config section:(NSInteger)section {
    if (config && [config.hwhd_headerFooterClass respondsToSelector:@selector(hwhd_heightForHeaderFooterWithConfig:reuseIdentifier:section:)]) {
        return [config.hwhd_headerFooterClass hwhd_heightForHeaderFooterWithConfig:config reuseIdentifier:[self reuseIdentifierForHeaderFooterConfig:config] section:section];
    }
    return tableView.style == UITableViewStylePlain ? 0 : CGFLOAT_MIN;
}
- (__kindof UIView *)viewForHeaderFooterWithTableView:(UITableView *)tableView config:(id<HWHeaderFooterConfigProtocol>)config section:(NSInteger)section {
    if (!config) return nil;
    
    Class headerFooterClass = config.hwhd_headerFooterClass ?: UIView.self;
    NSString *identifier = [self reuseIdentifierForHeaderFooterConfig:config];
    
    UIView *view = nil;
    if ([headerFooterClass isSubclassOfClass:UITableViewHeaderFooterView.class]) {
        view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
        if (!view) {
            NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass(headerFooterClass) ofType:@"nib"];
            if (path) {
                [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(headerFooterClass) bundle:nil] forHeaderFooterViewReuseIdentifier:identifier];
            } else {
                [tableView registerClass:headerFooterClass forHeaderFooterViewReuseIdentifier:identifier];
            }
            view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
        }
    } else {
        view = [headerFooterClass new];
    }
    
    if ([view conformsToProtocol:@protocol(HWHeaderFooterProtocol)]) {
        UIView<HWHeaderFooterProtocol> *tmpView = (UIView<HWHeaderFooterProtocol> *)view;
        
        [tmpView hwhd_setHeaderFooterConfig:config];
        
        if ([tmpView respondsToSelector:@selector(setHwhd_reloadTableView:)]) {
            __weak typeof(tableView) wTableView = tableView;
            [tmpView setHwhd_reloadTableView:^{
                __strong typeof(wTableView) sTableView = wTableView;
                if (sTableView) {
                    [sTableView reloadData];
                }
            }];
        }
    }
    
    return view;
}
- (UIViewController *)hw_viewController:(UIView *)viewSelf{
    for (UIView* next = viewSelf; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
