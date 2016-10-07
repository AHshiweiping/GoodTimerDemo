//
//  CutDown.m
//  GoddsTimerDemo
//
//  Created by iMac-jianjian on 16/9/22.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "CutDown.h"

@interface CutDown ()

@property(nonatomic,strong) dispatch_source_t timer;

@end

@implementation CutDown
-(void)creatTimerWit:(void(^)())completeBlock{

    if (_timer == nil) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 0.1*NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(_timer, ^{
           dispatch_async(dispatch_get_main_queue(), ^{
               completeBlock();
           });
        });
        dispatch_resume(_timer);
    }
}

-(void)destroyTimer{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
    
}

@end
