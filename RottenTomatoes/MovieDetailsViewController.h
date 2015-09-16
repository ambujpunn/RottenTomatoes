//
//  MovieDetailsViewController.h
//  RottenTomatoes
//
//  Created by Ambuj Punn on 9/15/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) NSDictionary *movie;

@end
