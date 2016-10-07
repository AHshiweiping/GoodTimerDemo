//
//  TimerCollectionViewCell.m
//  GoddsTimerDemo
//
//  Created by iMac-jianjian on 16/9/22.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "TimerCollectionViewCell.h"

@interface TimerCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *numerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *minSecondLabel;//毫秒label

@end

@implementation TimerCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(GoodTimeModel *)model{
    
    _model = model;
    self.numerLabel.text = model.number;
    self.minSecondLabel.text = model.minSecond;
    [self setTimeWithLastTime:model.time beginTime:model.beginTime];
}

/**
 *  开始进行倒计时
 *
 *  @param time 结束时间
 */
-(void)setTimeWithLastTime:(NSString*)time beginTime:(NSString*)beginTime{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *endDate = [formatter dateFromString:time];
    NSDate *nowDate = [NSDate date];
    
    NSDate *beginDate = [formatter dateFromString:beginTime];
    NSTimeInterval beginTimeInterval = [beginDate timeIntervalSinceDate:nowDate];
    
    //剩余时间
    NSTimeInterval timeInterval = [endDate timeIntervalSinceDate:nowDate];
    self.minSecondLabel.hidden = YES;
    if (timeInterval <=0) {
        //活动结束
        self.timerLabel.text = @"活动结束";
    }else if (beginTimeInterval > 0){
         //活动未开始
          self.timerLabel.text = @"活动未开始";
    }else{
        self.minSecondLabel.hidden = NO;
        int day = (int)timeInterval/(3600*24);
        int hours = (int)(timeInterval - day*3600*24)/3600;
        int minus = (timeInterval - day*24*3600 - hours*3600)/60;
        int second = (timeInterval - day*3600*24 - hours*3600- minus*60);
        
        //小时
        NSString *finalHours = [NSString stringWithFormat:@"%d",day*24 + hours];
        if ([finalHours intValue] <10) {
            finalHours = [NSString stringWithFormat:@"0%@",finalHours];
        }
        //分钟
        NSString *finalMinutes = [NSString stringWithFormat:@"%d",minus];
        if ([finalMinutes intValue] <10) {
            finalMinutes = [NSString stringWithFormat:@"0%@",finalMinutes];
        }
        //秒
        NSString *finalSeconds = [NSString stringWithFormat:@"%d",second];
        if ([finalSeconds intValue] < 10) {
            finalSeconds = [NSString stringWithFormat:@"0%@",finalSeconds];
        }
        self.timerLabel.text = [NSString stringWithFormat:@"%@:%@:%@",finalHours,finalMinutes,finalSeconds];
    }
}

@end
