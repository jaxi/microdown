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

        while (1) {
            Document *doc = [[Document alloc] initWithContent:@"## Hello world\nHello world\n---\nHello World\n\nefgh\n\n1. *abcde*\n- b\n* c\n<jaxihe@gmail.com><https://google.com>![http://image.com][your image]!v[https://www.youtube.com/embed/slNHuM4X-8M][500x400]"];
            Parser *parser = [[Parser alloc] initWithDocument:doc];
            [parser parse];
            [parser render];
        }
    }
    
    return 0;
}

