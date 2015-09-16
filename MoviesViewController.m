//
//  MoviesViewController.m
//  
//
//  Created by Ambuj Punn on 9/15/15.
//
//

#import "MoviesViewController.h"
#import "UIImageView+AFNetworking.h"
#import "MovieTableViewCell.h"
#import "MovieDetailsViewController.h"

@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSDictionary *responseDictionary;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSURL *url = [NSURL URLWithString:@"https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [self.tableView reloadData];
        //NSLog(@"%@", self.responseDictionary);
        //[self.refreshControl endRefreshing];
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.title = @"Movies";
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    NSDictionary *currentMovie = self.responseDictionary[@"movies"][(int)indexPath.row];
    cell.movieName.text = currentMovie[@"title"];
    cell.movieDescription.text = currentMovie[@"synopsis"];
    NSURL *url = [NSURL URLWithString:currentMovie[@"posters"][@"thumbnail"]];
    [cell.movieImage setImageWithURL:url];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.responseDictionary[@"movies"] count];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    MovieDetailsViewController *movieDetailsViewController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    NSLog(@"%@", self.responseDictionary[@"movies"][(int)indexPath.row][@"posters"][@"thumbnail"]);
    movieDetailsViewController.movie = self.responseDictionary[@"movies"][(int)indexPath.row];
}

@end
