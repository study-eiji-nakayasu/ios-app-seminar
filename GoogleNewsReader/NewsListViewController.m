//
//  NewsListViewController.m
//  GoogleNewsReader
//
//  Created by 中安英治 on 2013/12/19.
//  Copyright (c) 2013年 中安英治. All rights reserved.
//

#import "NewsListViewController.h"
#import "News.h"
#import "NewsLoader.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

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
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UITableView *tblView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tblView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tblView];
    [self.view sizeToFit];
    
    //APIを試しにたたいてみる
    NSArray *newsArray = [NewsLoader load:self.keyword pageNum:1];
    
    for (News *news in newsArray) {
        NSLog(@"%@", news.title);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickBtnBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
