//
//  MovieListCell.m
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import <EGOImageLoading/EGOImageView.h>
#import "MovieListCell.h"
#import "MAPGenre.h"
@implementation MovieListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


// Movie Setter to Set Values in View
-(void)setMovie:(MAPMovie *)movie{
    _movie = movie;

    self.imageViewCover.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",API_BASE_IMAGE_URL,movie.poster_path]];
    self.labelReleaseDate.text = movie.release_date;
    self.labelTitle.text = movie.title;
    
    [[MAPGenre sharedMAPGenre] getGenreWithIds:movie.genre_ids onComplete:^(NSArray *genres) {
        NSString *stringGenres = @"";
        for (MAPGenre *genre in genres) {
            stringGenres = [NSString stringWithFormat:@"%@,%@",stringGenres,genre.name];
        }
        if (stringGenres.length > 0) {
            stringGenres = [stringGenres substringFromIndex:1];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.labelGenres.text = stringGenres;
        });
    }];
}

@end
