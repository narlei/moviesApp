//
//  MovieDetailViewController.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import "MAPBaseViewController.h"
#import "MAPMovie.h"
#import "EGOImageView.h"

@interface MovieDetailViewController : MAPBaseViewController


// Outlets
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet EGOImageView *imageViewCover;
@property (weak, nonatomic) IBOutlet UILabel *labelReleaseDate;
@property (weak, nonatomic) IBOutlet UILabel *labelGenres;
@property (weak, nonatomic) IBOutlet UILabel *labelOverview;

// Properties
@property (strong, nonatomic) MAPMovie *movie;

@end
