//
//  GradesTableViewController.m
//  FirstApp
//
//  Created by Shahin on 5/8/15.
//  Copyright (c) 2015 Plan Group. All rights reserved.
//

#import "GradesTableViewController.h"
#import "StudentInfoViewController.h"
#import "AddStudentViewController.h"

@interface GradesTableViewController () <addStudentViewControllerDelegate>
@property (nonatomic,strong) NSMutableArray *marks;
@property (nonatomic,strong) NSMutableArray *students;
@end

@implementation GradesTableViewController
- (NSMutableArray *)students{
    if(!_students)
    {
        _students = [@[@"Ali", @"Hamid", @"Roya", @"Samira"] mutableCopy];
    }
    return _students;
}
- (NSMutableArray *)marks{
    if(!_marks)
    {
        _marks = [@[ @"14.5",@"19",@"20", @"5" ] mutableCopy];
    }
    return _marks;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.marks = [@[ @"14.5",@"19",@"20", @"5" ] mutableCopy];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.students.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.students objectAtIndex:indexPath.row];
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.students removeObjectAtIndex:indexPath.row];
        [self.marks removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"go to studentinfo"])
    {
        StudentInfoViewController *dest = segue.destinationViewController;
        UITableViewCell *cell = sender;
        NSInteger idx = [self.tableView indexPathForCell:cell].row;
        dest.studentName = [self.students objectAtIndex:idx];
        dest.studentMark = [self.marks objectAtIndex:idx];
    }else if([segue.identifier isEqualToString:@"go to newstudent"])
    {
        AddStudentViewController *adds = segue.destinationViewController;
        adds.addStudentDelegate = self;
    }
}

- (void)addStudentViewControllerDidCancel:(AddStudentViewController *)vc
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)addStudentViewController:(AddStudentViewController *)vc didFinishWithStudentName:(NSString *)name andMark:(NSString *)mark
{
    [self.marks addObject:mark];
    [self.students addObject:name];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}
@end
