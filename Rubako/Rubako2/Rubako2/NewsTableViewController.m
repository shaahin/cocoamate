//
//  NewsTableViewController.m
//  Rubako2
//
//  Created by Shahin Katebi on 10/4/12.
//  Copyright (c) 2012 Shahin Katebi. All rights reserved.
//

#import "NewsTableViewController.h"
#import "DSActivityView.h"
#import "NewsDetailsViewController.h"

@interface NewsTableViewController ()
@property (nonatomic, strong) NSArray *news;
@end

@implementation NewsTableViewController

@synthesize news = _news;

- (NSArray *)news
{
    
    if(!_news)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"news.json"];
        
        if([[NSFileManager defaultManager] fileExistsAtPath:fileName])
        {
            _news = [[NSArray alloc] initWithContentsOfFile:fileName];
            NSLog(@"found");
        }
        [DSBezelActivityView newActivityViewForView:self.view withLabel: @"در حال بارگذاری"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // OTHER THREAD
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://bit.ly/SGTS8m"]];
            NSURLResponse *response;
            NSError *error = nil;
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request
                                                         returningResponse:&response
                                                                     error:&error];
            NSDictionary *data = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
            // END: Other Thread
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // MAIN THREAD
                [_news writeToURL:[NSURL URLWithString:fileName] atomically:NO];
                [DSBezelActivityView removeViewAnimated:YES];
                self.news = (NSArray *)[data objectForKey:@"items"];
            
                // Write Document to a file.
                
                
                
                [self.tableView reloadData];
            });
        });
    }
    return _news;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self data];
    


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *rowData = [self.news objectAtIndex:indexPath.row];
    cell.textLabel.text = [rowData objectForKey:@"title"];
    cell.detailTextLabel.text = [rowData objectForKey:@"category_name"];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"go to details"])
    {
        NewsDetailsViewController *newsDetailsVC = (NewsDetailsViewController *)segue.destinationViewController;
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSInteger row = [self.tableView indexPathForCell:cell].row;
        newsDetailsVC.itemData = [self.news objectAtIndex:row];
    }
}

- (IBAction)refresh:(UIBarButtonItem *)sender {
    self.news = nil;
    [self.tableView reloadData];
}
@end
