//
//  ViewController.m
//  GoddsTimerDemo
//
//  Created by iMac-jianjian on 16/9/22.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)turnToNextView:(id)sender {
    
    NextViewController *viewController = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:nil];
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
