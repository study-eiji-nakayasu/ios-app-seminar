//
//  ConditionViewController.m
//  GoogleNewsReader
//
//  Created by 中安英治 on 2013/12/19.
//  Copyright (c) 2013年 中安英治. All rights reserved.
//

#import "ConditionViewController.h"
#import "NewsListViewController.h"

@interface ConditionViewController ()

@end

@implementation ConditionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // 背景を赤に設定
    self.view.backgroundColor = [UIColor redColor];
    
    // 検索ボタン
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnSearch.frame = CGRectMake(200, 100, 100, 50);
    [btnSearch setTitle:@"検索ボタン" forState:UIControlStateNormal];
    [btnSearch addTarget:self action:@selector(clickBtnSearch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSearch];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickBtnSearch
{
    NewsListViewController *vcNewsList = [[NewsListViewController alloc] init];
    [self.navigationController pushViewController:vcNewsList animated:YES];
}

@end
