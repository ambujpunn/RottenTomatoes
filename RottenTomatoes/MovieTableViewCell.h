//
//  MovieTableViewCell.h
//  RottenTomatoes
//
//  Created by Ambuj Punn on 9/15/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UILabel *movieDescription;

@end
