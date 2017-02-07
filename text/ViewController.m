//
//  ViewController.m
//  text
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 dony. All rights reserved.
//

#import "ViewController.h"
#import "CDViewController.h"
#import "CDTextLabelCell.h"


#define mDeviceWidth [UIScreen mainScreen].bounds.size.width        //屏幕宽
#define mDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *textTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.textTable.tableFooterView =[[UIView alloc]init];
    self.navigationItem.title =@"自适应文字的列表";
    [self setUp];
}


-(void)setUp{
    //
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mDeviceWidth, mDeviceHeight) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;

    tableView.backgroundColor = [UIColor clearColor];
    self.textTable=tableView;
    [self.view addSubview:tableView];

}
#pragma mark ----------UITabelViewDataSource----------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return  [<#parameter#> count];
    return  4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    CDTextLabelCell *cell =[CDTextLabelCell cellToTableView:tableView];
    //配置数据

    if (indexPath.row==0) {
        [cell setCellTextLabelText:@"天空灰的像哭过离开你以后并没有更自由"];
    }else if (indexPath.row==1){
        [cell setCellTextLabelText:@"酸酸的空气,守住我们的距离,一幕醉心的结局,像呼吸般无法停息,抽屉泛黄的日记找到了回忆那笑容是傻气你我的过去"];
    }else {
        [cell setCellTextLabelText:@"酸酸的空气,守住我们的距离,一幕醉心的结局,像呼吸般无法停息,抽屉泛黄的日记找到了回忆那笑容是傻气你我的过去酸酸的空气,守住我们的距离,一幕醉心的结局,像呼吸般无法停息,抽屉泛黄的日记找到了回忆那笑容是傻气你我的过去酸酸的空气,守住我们的距离,一幕醉心的结局,像呼吸般无法停息,抽屉泛黄的日记找到了回忆那笑容是傻气你我的过去酸酸的空气,守住我们的距离,一幕醉心的结局,像呼吸般无法停息,抽屉泛黄的日记找到了回忆那笑容是傻气你我的过去"];
    }
    
    
    return cell;
}


#pragma mark ----------UITabelViewDelegate----------
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDViewController *textVC =[[CDViewController alloc]init];
    [self.navigationController pushViewController:textVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return 60;
    
    CDTextLabelCell *textCell =(CDTextLabelCell *)[self tableView:self.textTable cellForRowAtIndexPath:indexPath];
    
    return textCell.frame.size.height;
}



@end
