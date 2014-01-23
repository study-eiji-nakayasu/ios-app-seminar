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
}

@end

@implementation DetailViewController

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
    [self.view addSubview:webView];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:self.url];
    
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
