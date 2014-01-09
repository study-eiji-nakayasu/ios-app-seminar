//
//  NewsLoader.m
//  GoogleNewsReader
//
//  Created by 中安英治 on 2014/01/09.
//  Copyright (c) 2014年 中安英治. All rights reserved.
//

#import "NewsLoader.h"
#import "News.h"

@implementation NewsLoader

+(NSArray*)load:(NSString *)keyword pageNum:(int)page
{
    //イケてないURLエンコード
    NSString *encodeKeyword = [keyword stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    int start = (page - 1) * 4;
    
    //URLを生成
    NSString *urlStr = [NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/news?v=1.0&start=%d&q=%@", start, encodeKeyword];
    
    NSLog(@"%@", urlStr);
    
    //リクエスト用のオブジェクトを生成
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSHTTPURLResponse *response;
    NSError *error;
    //今回は同期処理で
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //JSONをDictionary型に変換
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSDictionary *responseData = [json objectForKey:@"responseData"];
    NSArray *resultsArray = [responseData objectForKey:@"results"];
    
    //Newsのインスタンスを生成
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSDictionary *resultDic in resultsArray) {
        News *news = [[News alloc] init];
        news.title = [resultDic objectForKey:@"titleNoFormatting"];
        news.content = [resultDic objectForKey:@"content"];
        news.url = [NSURL URLWithString:[resultDic objectForKey:@"unescapedUrl"]];
        
        NSDictionary *imageDic = [resultDic objectForKey:@"image"];
        if (imageDic != nil) {
            news.imageHeight = [[imageDic objectForKey:@"tbHeight"] floatValue];
            news.imageUrl = [NSURL URLWithString:[imageDic objectForKey:@"tbUrl"]];
            news.imageWidth = [[imageDic objectForKey:@"tbWidth"] floatValue];
        }
        [result addObject:news];
    }
    
    
    if (error != nil)
    {
        return nil;
    }
    
    return result;
}

@end
