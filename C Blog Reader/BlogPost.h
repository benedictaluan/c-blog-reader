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
@property(strong, nonatomic) NSString *thumbnail;
@property(strong, nonatomic) NSString *date;
@property(strong, nonatomic) NSURL *url;

// Designated initializer
- (id) initWithTitle:(NSString *) title;
+ (id) blogPostWithTitle:(NSString *) title;

- (NSURL *) thumbnailURL;
- (NSString *) formattedDate;
@end
