//
//  NewsDetailsViewController.h
//  Rubako2
//
//  Created by Shahin Katebi on 10/5/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailsViewController : UIViewController
@property (nonatomic, strong) NSDictionary *itemData;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@end
