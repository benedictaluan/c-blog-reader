//
//  BlogPost.h
//  C Blog Reader
//
//  Created by Benedict Aluan on 1/09/15.
//  Copyright (c) 2015 Pencil Rocket. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *author;

// Designated initializer
- (id) initWithTitle:(NSString *) title;
+ (id) blogPostWithTitle:(NSString *) title;

@end
