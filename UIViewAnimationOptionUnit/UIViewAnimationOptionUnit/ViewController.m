//
//  ViewController.m
//  UIViewAnimationOptionUnit
//
//  Created by zhw on 15/9/18.
//  Copyright (c) 2015年 zhw. All rights reserved.
//

#import "ViewController.h"
#import "DetailTableViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dataArray;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray = [NSMutableArray arrayWithObjects:@"UIViewAnimationOptionCurveEaseInOut //时间曲线函数，由慢到快",@"UIViewAnimationOptionCurveEaseIn //时间曲线函数，由慢到特别快",@"UIViewAnimationOptionCurveEaseOut //时间曲线函数，由快到慢",@"UIViewAnimationOptionCurveLinear //时间曲线函数，匀速", nil];
    

    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContentCell"];
    }
    
    
    cell.textLabel.text = dataArray[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DetailTableViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    detailVC.animationType = indexPath.row;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
