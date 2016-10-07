//
//  GoodTimeModel.h
//  GoddsTimerDemo
//
//  Created by iMac-jianjian on 16/9/22.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodTimeModel : NSObject
@property(nonatomic,copy) NSString *number;//序号
@property(nonatomic,copy) NSString *beginTime;//开始时间
@property(nonatomic,copy) NSString *time;//时间
@property(nonatomic,copy) NSString *minSecond;//毫秒

+(instancetype)initWithDic:(NSDictionary*)dic;
-(instancetype)initWithDic:(NSDictionary*)dic;

@end
