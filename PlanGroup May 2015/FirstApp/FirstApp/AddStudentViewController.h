//
//  AddStudentViewController.h
//  FirstApp
//
//  Created by Shahin on 5/8/15.
//  Copyright (c) 2015 Plan Group. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddStudentViewController;
@protocol addStudentViewControllerDelegate

-(void) addStudentViewController: (AddStudentViewController *)vc didFinishWithStudentName: (NSString *) name andMark: (NSString *) mark;
- (void) addStudentViewControllerDidCancel: (AddStudentViewController *)vc;
@end
@interface AddStudentViewController : UIViewController
@property (nonatomic, assign) id<addStudentViewControllerDelegate> addStudentDelegate;
@end
