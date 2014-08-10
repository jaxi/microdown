//
//  main.m
//  MicroDown
//
//  Created by Jingkai He on 30/06/2014.
//  Copyright (c) 2014 Jingkai He. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        NSMutableString *content = [[NSMutableString alloc] init];
        for (int i = 0; i < 10000; ++i) {
            [content appendString:@"## Hello world\nHello world\n---\nHello World\n\nefgh\n\n1. *abcde*\n- b\n* c\n\n---\n<jaxihe@gmail.com><https://google.com>![http://image.com][your image]!v[https://www.youtube.com/embed/slNHuM4X-8M][500x400]"];
        }
        
        NSDate *start = [NSDate date];
        for (int i = 0; i < 10; ++i) {
            Document *doc = [[Document alloc] initWithContent:content];
            
            Parser *parser = [[Parser alloc] initWithDocument:doc];
            [parser parse];
            [parser render];
            
        }
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        double seconds = fabs(timeInterval);
        NSLog(@"%lf", seconds);
    }
    return 0;
}

