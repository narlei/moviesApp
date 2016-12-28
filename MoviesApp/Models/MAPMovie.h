//
//  MAPMovie.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPObjectModel.h"

@class NSArray;

@interface MAPMovie : MAPObjectModel


@property(strong, nonatomic) NSString *poster_path;
@property(assign, nonatomic) BOOL adult;
@property(strong, nonatomic) NSString *overview;
@property(strong, nonatomic) NSString *release_date;
@property(strong, nonatomic) NSArray *genre_ids;
@property(strong, nonatomic) NSNumber *identifier;
@property(strong, nonatomic) NSString *original_title;
@property(strong, nonatomic) NSString *original_language;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *backdrop_path;
@property(strong, nonatomic) NSNumber *popularity;
@property(strong, nonatomic) NSNumber *vote_count;
@property(assign, nonatomic) BOOL video;
@property(strong, nonatomic) NSNumber *vote_average;

- (id)initWithJSONDictionary:(NSDictionary *)dic;

- (void)parseJSONDictionary:(NSDictionary *)dic;


// Return all movies From API
+(void) getAllMovies:(void (^)(NSArray *values))onComplete;

@end
