//
//  DetailTableViewController.m
//  UIViewAnimationOptionUnit
//
//  Created by zhw on 15/9/18.
//  Copyright (c) 2015年 zhw. All rights reserved.
//

#import "DetailTableViewController.h"

@interface DetailTableViewController ()

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    NSLog(@"======%ld",self.animationType);
    
    NSString *titleStr;
    switch (self.animationType) {
        case 0:
            titleStr = @"由慢到快";
            break;
            
            case 1:
            titleStr = @"由慢到特别快";
            break;
            
            case 2:
            titleStr = @"由快到慢";
            break;
            
            case 3:
            titleStr = @"匀速";
            
            break;
            
        default:
            break;
    }
    
    
    self.navigationItem.title = titleStr;
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
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailCell"];
//    }
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell.contentView.backgroundColor = [UIColor redColor];
            break;
            case 1:
            cell.contentView.backgroundColor = [UIColor yellowColor];
            
            break;
            case 2:
            cell.contentView.backgroundColor = [UIColor blueColor];
            
            break;
            
            case 3:
            cell.contentView.backgroundColor = [UIColor orangeColor];
            
            break;
            
        default:
            cell.contentView.backgroundColor = [UIColor purpleColor];
            break;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    cell.backgroundColor = indexPath.row % 2
//    
//    
//    
//    ? [UIColor colorWithRed: 234/255.0f green: 235/255.0f blue: 239/255.0f alpha: 1.0]
//    
//    
//    
//    : [UIColor colorWithRed: 226/255.0f green: 226/255.0f blue: 232/255.0f alpha: 1.0];
    
    cell.alpha = 0;
    cell.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 50);
    UIViewAnimationOptions tempAnmation;
    
    switch (self.animationType) {
        case 0:
            tempAnmation = UIViewAnimationOptionCurveEaseInOut;
            break;
            
            case 1:
            tempAnmation = UIViewAnimationOptionCurveEaseIn;
            break;
            
            case 2:
            tempAnmation = UIViewAnimationOptionCurveEaseOut;
            break;
            
            case 3:
            tempAnmation = UIViewAnimationOptionCurveLinear;
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:0.5 delay:0.5 * indexPath.row options:tempAnmation animations:^{
        //        NSLog(@"XXXX");
        cell.alpha = 1.0;
        cell.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    } completion:^(BOOL finished) {
        //        NSLog(@"XXXX");
        
        
    }];
    
//    [tableView reloadData];
    
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
