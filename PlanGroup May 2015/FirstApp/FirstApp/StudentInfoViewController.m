//
//  StudentInfoViewController.m
//  FirstApp
//
//  Created by Shahin on 5/8/15.
//  Copyright (c) 2015 Plan Group. All rights reserved.
//

#import "StudentInfoViewController.h"

@interface StudentInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *markLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation StudentInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = [NSString stringWithFormat:@"Name: %@", self.studentName];
    self.markLabel.text = [NSString stringWithFormat:@"Student Mark: %@ / 20",self.studentMark];
    self.dateLabel.text = [[NSDate date] description];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
