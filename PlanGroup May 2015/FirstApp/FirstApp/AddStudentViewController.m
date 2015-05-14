//
//  AddStudentViewController.m
//  FirstApp
//
//  Created by Shahin on 5/8/15.
//  Copyright (c) 2015 Plan Group. All rights reserved.
//

#import "AddStudentViewController.h"

@interface AddStudentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentName;
@property (weak, nonatomic) IBOutlet UITextField *studentMark;
@end

@implementation AddStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
- (IBAction)save:(id)sender {
    [self.addStudentDelegate addStudentViewController:self didFinishWithStudentName:self.studentName.text andMark:self.studentMark.text];
}
- (IBAction)cancel:(id)sender {
    [self.addStudentDelegate addStudentViewControllerDidCancel:self];
}

@end
