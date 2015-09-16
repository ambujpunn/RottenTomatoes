//
//  MovieDetailsViewController.m
//  RottenTomatoes
//
//  Created by Ambuj Punn on 9/15/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "MovieDetailsTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieDetail" forIndexPath:indexPath];
    self.title = self.movie[@"title"];
    NSURL *url = [NSURL URLWithString:self.movie[@"posters"][@"thumbnail"]];
    [cell.detailImage setImageWithURL:url];
    cell.movieDescription.text = self.movie[@"synopsis"];
    return cell;
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
