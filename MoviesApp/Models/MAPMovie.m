//
//  MAPMovie.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

// Import
#import "MAPMovie.h"


@implementation MAPMovie


#pragma mark - API Communication

+(void) getAllMovies:(void (^)(NSArray *values))onComplete{
    
    // First page [page=1] returns only 20 results
    NSString *baseUrl = [NSString stringWithFormat:@"%@discover/movie?api_key=%@&language=pt-br&sort_by=popularity.desc&include_adult=false&include_video=false&page=1",API_BASE_URL,API_TOKEN];
    
    [self callGetWithUrl:baseUrl parameters:nil onComplete:^(UNIJsonNode *values) {
        NSMutableArray *arrayReturn = [NSMutableArray new];
        for (NSDictionary *dicData in [values.object objectForKey:@"results"]) {
            MAPMovie *movie =[[MAPMovie alloc] initWithJSONDictionary:dicData];
            [arrayReturn addObject:movie];
        }
        onComplete(arrayReturn);
    }];
}

- (id)initWithJSONDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        [self parseJSONDictionary:dic];
    }

    return self;
}

- (void)parseJSONDictionary:(NSDictionary *)dic {
    // PARSER
    id poster_path_ = [dic objectForKey:@"poster_path"];
    if ([poster_path_ isKindOfClass:[NSString class]]) {
        self.poster_path = poster_path_;
    }

    id adult_ = [dic objectForKey:@"adult"];
    if ([adult_ isKindOfClass:[NSNumber class]]) {
        self.adult = [adult_ boolValue];
    }

    id overview_ = [dic objectForKey:@"overview"];
    if ([overview_ isKindOfClass:[NSString class]]) {
        self.overview = overview_;
    }

    id release_date_ = [dic objectForKey:@"release_date"];
    if ([release_date_ isKindOfClass:[NSString class]]) {
        self.release_date = release_date_;
    }

    id genre_ids_ = [dic objectForKey:@"genre_ids"];
    if ([genre_ids_ isKindOfClass:[NSArray class]]) {
        self.genre_ids = genre_ids_;
    }

    id id_ = [dic objectForKey:@"id"];
    if ([id_ isKindOfClass:[NSNumber class]]) {
        self.identifier = id_;
    }

    id original_title_ = [dic objectForKey:@"original_title"];
    if ([original_title_ isKindOfClass:[NSString class]]) {
        self.original_title = original_title_;
    }

    id original_language_ = [dic objectForKey:@"original_language"];
    if ([original_language_ isKindOfClass:[NSString class]]) {
        self.original_language = original_language_;
    }

    id title_ = [dic objectForKey:@"title"];
    if ([title_ isKindOfClass:[NSString class]]) {
        self.title = title_;
    }

    id backdrop_path_ = [dic objectForKey:@"backdrop_path"];
    if ([backdrop_path_ isKindOfClass:[NSString class]]) {
        self.backdrop_path = backdrop_path_;
    }

    id popularity_ = [dic objectForKey:@"popularity"];
    if ([popularity_ isKindOfClass:[NSNumber class]]) {
        self.popularity = popularity_;
    }

    id vote_count_ = [dic objectForKey:@"vote_count"];
    if ([vote_count_ isKindOfClass:[NSNumber class]]) {
        self.vote_count = vote_count_;
    }

    id video_ = [dic objectForKey:@"video"];
    if ([video_ isKindOfClass:[NSNumber class]]) {
        self.video = [video_ boolValue];
    }

    id vote_average_ = [dic objectForKey:@"vote_average"];
    if ([vote_average_ isKindOfClass:[NSNumber class]]) {
        self.vote_average = vote_average_;
    }
}

#pragma mark - Getters

-(NSString *)searchTerm{
    return [NSString stringWithFormat:@"%@ &@",self.title,self.overview];
}

@end
