//
//  MenuController.m
//  PoleStarAppDemo
//
//  Created by Pole Star on 26/11/2019.
//  Copyright © 2019 Pole Star. All rights reserved.
//

#import "MenuController.h"
#import "MenuOptionCell.h"
#import "NAOSDK.h"

@interface MenuController () <UITableViewDelegate,UITableViewDataSource>

// MARK: - Properties
@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray     *content;
@property (strong,nonatomic) MenuOptionCell     *customCell;
@property (strong,nonatomic) NSDictionary     *versions;
@end

@implementation MenuController


// MARK: - Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.content = @[@"", @"About"];
    
    [self configureTableView];
}


// MARK: - Handler

- (void) configureTableView {
//    self.versions = [[NSDictionary alloc]init];
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.table.bounds.size.width, 0.01f)];
    
    [self.table contentInsetAdjustmentBehavior];
    [self.view addSubview:self.table];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _content.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *menuTableIdentifier = @"MenuOptionCell";
    
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:menuTableIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuTableIdentifier];
        
    }
    cell.textLabel.text =  [self.content objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)view didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"[%tu] title of cell %@", indexPath.row, [self.content objectAtIndex:indexPath.row]);
    
    // The first row is empty for the style
    if (indexPath.row == 1) {
        NSString* title = [self.content objectAtIndex:indexPath.row];
        NSString* message = [NSString stringWithFormat:@"NAOSDK: %@", [NAOServicesConfig getSoftwareVersion]];
        [self showAlertView:title  actionInfo:message];
    }
}

-(void)showAlertView: (NSString*) title actionInfo:(NSString*) msgInfo{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                        message:msgInfo
                                                        preferredStyle:UIAlertControllerStyleAlert];
    
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
}
@end

