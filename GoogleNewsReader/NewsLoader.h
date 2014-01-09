//
//  NewsLoader.h
//  GoogleNewsReader
//
//  Created by 中安英治 on 2014/01/09.
//  Copyright (c) 2014年 中安英治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsLoader : NSObject

+(NSArray*)load:(NSString *)keyword pageNum:(int)page;

@end
