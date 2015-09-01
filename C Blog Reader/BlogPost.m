//
//  BlogPost.m
//  C Blog Reader
//
//  Created by Benedict Aluan on 1/09/15.
//  Copyright (c) 2015 Pencil Rocket. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *) title {
    self = [super init];
    
    if (self) {
        self.title = title;
    }
    
    return self;
}

+ (id) blogPostWithTitle:(NSString *) title {
    return [[self alloc] initWithTitle:title];
}

@end
