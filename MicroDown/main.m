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

        BlankLineFragment *blank = [[BlankLineFragment alloc] initWithContent:@"    \n   \n"];
        NSLog(@"%@", [blank toHTML]);
        
        HeadingFragment *heading = [[HeadingFragment alloc] initWithContent:@"## bacdefg"];
        NSLog(@"%@", [heading toHTML]);
        
        TextFragment *text = [[TextFragment alloc] initWithContent:@"![alt text]   [https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png]"];
        NSLog(@"%@", [text toHTML]);
        
        NSLog(@"==========================");
        
        Document *doc = [[Document alloc] initWithContent:@"line1\nline2\n\nnew paragraph\n    some space\nsame paragraph\n\nnew p"];
        
        Parser *parser = [[Parser alloc] initWithDocument:doc];
        [parser parse];
    }
    
    return 0;
}

