//
//  NextViewController.m
//  GoddsTimerDemo
//
//  Created by iMac-jianjian on 16/9/22.
//  Copyright © 2016年 iMac-jianjian. All rights reserved.
//

#import "NextViewController.h"
#import "TimerCollectionViewCell.h"
#import "GoodTimeModel.h"
#import "CutDown.h"
#import "OtherViewController.h"

@interface NextViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollection;
@property(nonatomic,strong) NSMutableArray * dataArray;//数据源数组
@property(nonatomic,strong) CutDown *cutDown;//倒计时辅助工具

@end

@implementation NextViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.myCollection.backgroundColor = [UIColor whiteColor];
    self.dataArray = [NSMutableArray array];
    [self.myCollection registerNib:[UINib nibWithNibName:@"TimerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"timeCell"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"GoodsTimes" ofType:@".plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dic in array) {
        GoodTimeModel *model = [GoodTimeModel initWithDic:dic];
        [self.dataArray addObject:model];
    }
    //开始进行计时
    self.cutDown = [[CutDown alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.cutDown creatTimerWit:^{
        [weakSelf updateVisialCells];
    }];
}
/**
 *  更新cell
 */
-(void)updateVisialCells{
    
    NSArray *cells = self.myCollection.visibleCells;
    for (TimerCollectionViewCell *cell in cells) {
        GoodTimeModel *model = self.dataArray[cell.tag];
        int minSec = [model.minSecond intValue];
        if (minSec <=0) {
            minSec = 9;
        }else{
            minSec --;
        }
        model.minSecond = [NSString stringWithFormat:@"%d",minSec];
        cell.model = model;
    }
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.dataArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TimerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"timeCell" forIndexPath:indexPath];
    GoodTimeModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.tag = indexPath.row;
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(floorf(([UIScreen mainScreen].bounds.size.width - 3)/2), 200);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark - action
- (IBAction)backBtnClicked:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)nextPageBtnClicked:(id)sender {
    
    OtherViewController *controller = [[OtherViewController alloc] initWithNibName:@"OtherViewController" bundle:nil];
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}

-(void)dealloc{
    
    NSLog(@"class = %s",object_getClassName(self));
    [_cutDown destroyTimer];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
