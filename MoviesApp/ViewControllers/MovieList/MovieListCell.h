//
//  MovieListCell.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAPMovie.h"

@class EGOImageView;

@interface MovieListCell : UITableViewCell

// Outlets
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet EGOImageView *imageViewCover;
@property (weak, nonatomic) IBOutlet UILabel *labelReleaseDate;
@property (weak, nonatomic) IBOutlet UILabel *labelGenres;

// Properties
@property (strong, nonatomic) MAPMovie* movie;
@end
