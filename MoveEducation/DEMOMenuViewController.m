//
//  DEMOMenuViewController.m
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOMenuViewController.h"
#import "DEMOHomeViewController.h"
#import "DEMOSecondViewController.h"
#import "TableViewCell.h"
#import "UIViewController+REFrostedViewController.h"

@implementation DEMOMenuViewController
{
    NSMutableArray *arr;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.separatorInset = UIEdgeInsetsMake(0,0, 0, 0);
    self.tableView.backgroundColor = [UIColor clearColor];
    arr=[NSMutableArray arrayWithCapacity:10];
    for (int i=0; i<7;i++) {
    
        NSString *ss=[NSString stringWithFormat:@"1_%dm",i];
        [arr addObject:ss];
        
        
    }
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 134.0f)];
        view.backgroundColor=[UIColor blackColor];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 27, 80, 80)];
      //  imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"head.jpg"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 40.0;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 40, 0, 24)];
        label.text = @"王宁辉";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:24];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.textAlignment=1;
        [label sizeToFit];
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 64, 0, 24)];
        label1.text = @"初级产品经理";
        label1.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
        label1.backgroundColor = [UIColor clearColor];
        label1.textColor = [UIColor whiteColor];
        [label1 sizeToFit];

    //    label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [view addSubview:label1];
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width,10)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.3f];
    
    
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        DEMOHomeViewController *homeViewController = [[DEMOHomeViewController alloc] init];
        navigationController.viewControllers = @[homeViewController];
    } else {
        DEMOSecondViewController *secondViewController = [[DEMOSecondViewController alloc] init];
        navigationController.viewControllers = @[secondViewController];
    }
    
    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
       return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    if (sectionIndex==0) {
        return 7;
    }
        return 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:1 reuseIdentifier:cellIdentifier];
    }
   // cell.textLabel.center=CGPointMake(cell.textLabel.center.x+50, cell.textLabel.center.y);
       if (indexPath.section == 0) {
        NSArray *titles = @[@"我的岗位课", @"我的培训班", @"我的选修课", @"选课中心", @"我的考试", @"学习地图", @"卓越团队绩效力测评"];
        cell.textLabel.text = titles[indexPath.row];
        cell.imageView.image=[UIImage imageNamed:arr[indexPath.row]];
        if (indexPath.row==5) {
            cell.detailTextLabel.text=@"初级产品经理";
        }
        
        
    } else if(indexPath.section==1){
        NSArray *titles = @[@"学习情况总汇", @"学习档案"];
       NSArray *arr1=@[@"2_0m",@"2_1m"];
         cell.imageView.image=[UIImage imageNamed:arr1[indexPath.row]];
        cell.textLabel.text = titles[indexPath.row];
    }else{
         NSArray *arr1=@[@"3_0m",@"3_1m"];
        NSArray *titles = @[@"消息中心", @"设置"];
          cell.imageView.image=[UIImage imageNamed:arr1[indexPath.row]];
        cell.textLabel.text = titles[indexPath.row];
    }
    
    return cell;
}

@end
