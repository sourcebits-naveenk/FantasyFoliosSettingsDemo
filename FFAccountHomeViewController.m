//
//  FFAccountHomeViewController.m
//  FantasyFoliosSettingsDemo
//
//  Created by Naveen Katari on 28/01/16.
//  Copyright © 2016 Sourcebits. All rights reserved.
//

#import "FFAccountHomeViewController.h"
#import "UserDetailsCell.h"
#import "UserEarningsCell.h"

@interface FFAccountHomeViewController ()
{
    UIView *customHeaderView;
}

@end

@implementation FFAccountHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"UserDetailsCell" bundle:nil] forCellReuseIdentifier:@"UserNameCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"UserEarningsCell" bundle:nil] forCellReuseIdentifier:@"EarningsCell"];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
        UserDetailsCell *userDetailsCell = (UserDetailsCell *)[tableView dequeueReusableCellWithIdentifier:@"UserNameCell" forIndexPath:indexPath];
        return userDetailsCell;
        }
        else if (indexPath.row == 1)
        {
            UserEarningsCell *userEarningsCell = (UserEarningsCell *)[tableView dequeueReusableCellWithIdentifier:@"EarningsCell" forIndexPath:indexPath];
            return userEarningsCell;
        }
        else if (indexPath.row == 2)
        {
            UserEarningsCell *userEarningsCell = (UserEarningsCell *)[tableView dequeueReusableCellWithIdentifier:@"EarningsCell" forIndexPath:indexPath];
            userEarningsCell.userBalanceLabel.text = @"Total Winnings";
            userEarningsCell.userBalanceNumericsLabel.text = @"$22,350.00";
            return userEarningsCell;
        }
    }
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
    customHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"CustomHeaderView" owner:self options:nil] objectAtIndex:0];
}
    return customHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 200.0f;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            return 70.0f;
        }
        else if (indexPath.row == 1)
        {
            return 44.0f;
        }
        else if (indexPath.row == 2)
        {
            return 44.0f;
        }
    }
    return 0;
}
@end
