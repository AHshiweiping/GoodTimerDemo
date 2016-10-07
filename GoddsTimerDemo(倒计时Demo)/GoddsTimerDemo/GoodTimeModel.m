//
//  GoodTimeModel.m
//  GoddsTimerDemo
//
//  Created by iMac-jianjian on 16/9/22.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "GoodTimeModel.h"

@implementation GoodTimeModel


+(instancetype)initWithDic:(NSDictionary*)dic{
    
    return [[self alloc] initWithDic:dic];
}

-(instancetype)initWithDic:(NSDictionary*)dic{
    
    if (self = [super init]) {
        self.number = [dic[@"number"] description];
        self.time = dic[@"endTime"];
        self.beginTime = dic[@"beginTime"];
        self.minSecond = @"9";
    }
    return self;
}

@end
