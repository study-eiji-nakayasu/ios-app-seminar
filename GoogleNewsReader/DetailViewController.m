//
//  DetailViewController.m
//  GoogleNewsReader
//
//  Created by 中安英治 on 2014/01/23.
//  Copyright (c) 2014年 中安英治. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController (){
    UIWebView* webView;
    UIToolbar* toolbar;
}

@end

@implementation DetailViewController

int const TOOL_BAR_HEIGHT = 48;

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
    
    // webViewを生成
    webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    // toolbarを生成
    toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - TOOL_BAR_HEIGHT, self.view.frame.size.width, TOOL_BAR_HEIGHT)];
    [self.view addSubview:toolbar];
    
    // 戻るボタン
    UIBarButtonItem* btnBack = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:10 target:self action:@selector(clickBtnBack)];
    btnBack.enabled = NO;
    
    NSArray* btnArray = [NSArray arrayWithObjects:btnBack, nil];
    toolbar.items = btnArray;
    
    
    // NSURLRequestを生成
    NSURLRequest* request = [NSURLRequest requestWithURL:self.url];
    
    [webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%@", @"読み込み完了");
}

- (void)clickBtnBack
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
