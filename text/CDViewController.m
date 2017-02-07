//
//  CDViewController.m
//  text
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 dony. All rights reserved.
//

#import "CDViewController.h"
#import "CDTextView.h"

@interface CDViewController ()
@property (nonatomic,strong)CDTextView *texView;
@end

@implementation CDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"textViewde的边框自适应高度";
    self.view.backgroundColor=[UIColor whiteColor];
    [self setUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setUp
{
    CDTextView *texView =[[CDTextView alloc]init];
    texView.frame=CGRectMake(10, 79, 320, 30);
    self.texView =texView;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.texView.placeholder=@"就是这个测试";
    self.texView.placeholderColor=[UIColor colorWithWhite:0.7 alpha:0.5];
    [self.view addSubview:self.texView];

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
