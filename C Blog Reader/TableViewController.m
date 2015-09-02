//
//  TableViewController.m
//  C Blog Reader
//
//  Created by Benedict Aluan on 26/08/15.
//  Copyright (c) 2015 Pencil Rocket. All rights reserved.
//

#import "TableViewController.h"
#import "WebViewController.h"
#import "BlogPost.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *blogUrl = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogUrl];
    NSError *dataDictionaryError = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&dataDictionaryError];
    
    self.posts = [NSMutableArray array];
    NSArray *postsArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *postDictionary in postsArray) {
        BlogPost *post = [BlogPost blogPostWithTitle:[postDictionary objectForKey:@"title"]];
        post.author = [postDictionary objectForKey:@"author"];
        post.thumbnail = [postDictionary objectForKey:@"thumbnail"];
        post.date = [postDictionary objectForKey:@"date"];
        post.url = [NSURL URLWithString:[postDictionary objectForKey:@"url"]];
        
        [self.posts addObject:post];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DisplayCell" forIndexPath:indexPath];
    
    BlogPost *post = self.posts[indexPath.row];
    
    if ([post.thumbnail isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:post.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    }
    
    cell.textLabel.text = post.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", post.author, [post formattedDate]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [segue.identifier isEqualToString:@"showBlogPost"] ) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *post = [self.posts objectAtIndex:indexPath.row];
        
        WebViewController *webViewController = (WebViewController *)segue.destinationViewController;
        webViewController.blogPostURL = post.url;
        
        // [segue.destinationViewController setBlogPostURL:post.url];
    }
}



@end
