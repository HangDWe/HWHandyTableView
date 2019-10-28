//
//  UITableView+HWHandyTableView.m
//  MyTest
//
//  Created by huangwei on 2019/8/30.
//  Copyright © 2019年 天翼文化. All rights reserved.
//

#import "UITableView+HWHandyTableView.h"
#import <objc/runtime.h>
#import "HWHandyTableViewIMP.h"
#import "HWHandyTableViewProxy.h"
static const void *HWHDSectionArrayKey = &HWHDSectionArrayKey;
static const void *HWHDIMPKey = &HWHDIMPKey;
static const void *HWHDProxyKey = &HWHDProxyKey;

@interface UITableView()
@property (nonatomic, strong) HWHandyTableViewIMP *hwhd_IMP;
@property (nonatomic, strong) HWHandyTableViewProxy *hwhd_proxy;
@end

@implementation UITableView (HWHandyTableView)
#pragma mark - getter && setter (syntactic sugar)
    
-(NSMutableArray<id<HWCellConfigProtocol>> *)hwhd_rowArray{
    return self.hwhd_firstSection.rowArray;
}
-(HWSection *)hwhd_firstSection{
    if (self.hwhd_sectionArray.count>0) {
        return self.hwhd_sectionArray[0];
    }
    HWSection *section = [HWSection new];
    [self.hwhd_sectionArray addObject:section];
    return section;
}
- (void)setHwhd_headerConfig:(id<HWHeaderFooterConfigProtocol>)hwhd_headerConfig {
    self.hwhd_firstSection.headerConfig = hwhd_headerConfig;
}
    
- (id<HWHeaderFooterConfigProtocol>)hwhd_headerConfig {
    return self.hwhd_firstSection.headerConfig;
}
    
- (void)setHwhd_footerConfig:(id<HWHeaderFooterConfigProtocol>)hwhd_footerConfig {
    self.hwhd_firstSection.footerConfig = hwhd_footerConfig;
}
    
- (id<HWHeaderFooterConfigProtocol>)hwhd_footerConfig {
    return self.hwhd_firstSection.footerConfig;
}
#pragma mark --getter && setter (data source)
-(void)setHwhd_sectionArray:(NSMutableArray<HWSection *> * _Nonnull)hwhd_sectionArray{
    objc_setAssociatedObject(self, HWHDSectionArrayKey, hwhd_sectionArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSMutableArray<HWSection *> *)hwhd_sectionArray{
    NSMutableArray *array = objc_getAssociatedObject(self, HWHDSectionArrayKey);
    if (!array) {
        array = [NSMutableArray array];
        self.hwhd_sectionArray = array;
        self.hwhd_IMP.sectionArray = array;
//        [self.hwhd_proxy addTarget:self.hwhd_IMP];
//        self.delegate = (id<UITableViewDelegate>)self.hwhd_proxy;
//        self.dataSource = (id<UITableViewDataSource>)self.hwhd_proxy;
        self.delegate = (id<UITableViewDelegate>)self.hwhd_IMP;
        self.dataSource = (id<UITableViewDataSource>)self.hwhd_IMP;
    }
    return array;
}
#pragma mark - getter & setter (proxy / IMP)
    
-(void)setHwhd_IMP:(HWHandyTableViewIMP *)hwhd_IMP{
    objc_setAssociatedObject(self, HWHDIMPKey, hwhd_IMP, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(HWHandyTableViewIMP *)hwhd_IMP{
    HWHandyTableViewIMP *imp = objc_getAssociatedObject(self, HWHDIMPKey);
    if (!imp) {
        imp = [[HWHandyTableViewIMP alloc]init];
        self.hwhd_IMP = imp;
    }
    return imp;
}
- (void)setHwhd_proxy:(HWHandyTableViewProxy *)hwhd_proxy {
    objc_setAssociatedObject(self, HWHDProxyKey, hwhd_proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HWHandyTableViewProxy *)hwhd_proxy {
    HWHandyTableViewProxy *proxy = objc_getAssociatedObject(self, HWHDProxyKey);
    if (!proxy) {
        proxy = [HWHandyTableViewProxy new];
        self.hwhd_proxy = proxy;
    }
    return proxy;
}
@end
