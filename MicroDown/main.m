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

//        BlankLineFragment *blank = [[BlankLineFragment alloc] initWithContent:@"    \n   \n"];
//        NSLog(@"%@", [blank toHTML]);
//        
//        HeadingFragment *heading = [[HeadingFragment alloc] initWithContent:@"## bacdefg"];
//        NSLog(@"%@", [heading toHTML]);
//        
//        TextFragment *text = [[TextFragment alloc] initWithContent:@"![alt text][https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png] <http://baidu.com>"];
//        NSLog(@"%@", [text toHTML]);
//
//        NSLog(@"==========================");
        
        Document *doc = [[Document alloc] initWithContent:@"### ~~yep~~ [hello world](http://google.com)\
                         \nI am the heading\n\nnew paragraph\n    some space\n~~yep~~\n\nnew p"];
        
        Parser *parser = [[Parser alloc] initWithDocument:doc];
        [parser parse];
        NSLog(@"%@", [parser render]);
    }
    
    return 0;
}

