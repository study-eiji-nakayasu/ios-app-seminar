//
//  NewsLoader.m
//  GoogleNewsReader
//
//  Created by 中安英治 on 2014/01/09.
//  Copyright (c) 2014年 中安英治. All rights reserved.
//

#import "NewsLoader.h"

@implementation NewsLoader

+(NSArray*)load:(NSString *)keyword pageNum:(int)page
{
    //イケてないURLエンコード
    NSString *encodeKeyword = [keyword stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    int start = (page - 1) * 4;
    
    //URLを生成
    NSString *urlStr = [NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/news?v=1.0&start=%d&q=%@", start, encodeKeyword];
    
    NSLog(@"%@", urlStr);
    
    return nil; //後で消す
}

@end
