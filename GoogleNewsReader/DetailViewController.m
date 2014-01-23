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
    UIBarButtonItem* btnBack = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:101 target:self action:@selector(clickBtnBack)];
    btnBack.enabled = NO;
    
    // 進むボタン
    UIBarButtonItem* btnForward = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:102 target:self action:@selector(clickBtnForward)];
    btnForward.enabled = NO;
    
    // スペース
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    btnForward.enabled = NO;
    
    NSArray* btnArray = [NSArray arrayWithObjects:btnBack, space, btnForward, nil];

    toolbar.items = btnArray;
    
    
    // NSURLRequestを生成
    NSURLRequest* request = [NSURLRequest requestWithURL:self.url];
    
    [webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    ((UIBarButtonItem*)[toolbar.items objectAtIndex:0]).enabled = webView.canGoBack;
    ((UIBarButtonItem*)[toolbar.items objectAtIndex:2]).enabled = webView.canGoForward;
}

- (void)clickBtnBack
{
    [webView goBack];
}

- (void)clickBtnForward
{
    [webView goForward];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
