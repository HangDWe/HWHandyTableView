//
//  HWHeaderFooterConfigProtocol.h
//  ZQReader
//
//  Created by huangwei on 2019/9/10.
//  Copyright © 2019年 www.tyyd.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HWHeaderFooterProtocol;

NS_ASSUME_NONNULL_BEGIN

@protocol HWHeaderFooterConfigProtocol <NSObject>

@required
    
/**
 获取 header/footer 类类型
     
 @return 类类型
*/
- (Class<HWHeaderFooterProtocol>)hwhd_headerFooterClass;
    
@optional
    
/**
 获取 header/footer 的复用标识
     
 @return 复用标识
*/
- (nullable NSString *)hwhd_headerFooterReuseIdentifier;
    
@end

NS_ASSUME_NONNULL_END
