//
//  NewsDetailsViewController.m
//  Rubako2
//
//  Created by Shahin Katebi on 10/5/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import "NewsDetailsViewController.h"
#import "UIImageView+WebCache.h"

@interface NewsDetailsViewController ()

@end

@implementation NewsDetailsViewController
@synthesize itemData = _itemData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = [self.itemData objectForKey:@"title"];
    self.textView.text = [self.itemData objectForKey:@"teaser"];
    self.dateLabel.text = [self.itemData objectForKey:@"recieve_time"];
    self.websiteLabel.text = [self.itemData objectForKey:@"website_name"];
    NSArray *images = (NSArray *)[self.itemData objectForKey:@"image"];
    
    NSDictionary *img = (NSDictionary *)[images objectAtIndex:0];
    NSString *url = [img objectForKey:@"url"];
    if(![url isEqual:[NSNull null]])
    {
        UIImage *placeHolderImage = [UIImage imageNamed:@"loading"];
        [self.imageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeHolderImage];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDateLabel:nil];
    [self setImageView:nil];
    [self setTextView:nil];
    [self setWebsiteLabel:nil];
    [super viewDidUnload];
}
@end
