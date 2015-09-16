//
//  MovieDetailsTableViewCell.h
//  RottenTomatoes
//
//  Created by Ambuj Punn on 9/15/15.
//  Copyright (c) 2015 Ambuj Punn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (weak, nonatomic) IBOutlet UITextView *movieDescription;

@end
