//
//  MovieDetailViewController.m
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MAPGenre.h"
@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageViewCover.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",API_BASE_IMAGE_URL,self.movie.poster_path]];
    self.labelReleaseDate.text = self.movie.release_date;
    self.labelTitle.text = self.movie.title;
    self.labelOverview.text = self.movie.overview;
    
    [[MAPGenre sharedMAPGenre] getGenreWithIds:self.movie.genre_ids onComplete:^(NSArray *genres) {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
