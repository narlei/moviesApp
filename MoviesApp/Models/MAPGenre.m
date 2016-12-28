//
//  MAPGenre.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

// Import
#import "MAPGenre.h"


@implementation MAPGenre {
    NSMutableArray *__arrayAllMovies;
}

+ (instancetype)sharedMAPGenre {
    static MAPGenre *_sharedMAPGenre = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedMAPGenre = [MAPGenre new];
    });

    return _sharedMAPGenre;
}

- (void)getGenreWithIds:(NSArray *)pIds onComplete:(void (^)(NSArray *genres))onComplete {
    if (__arrayAllMovies) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(identifier IN %@)", pIds];
        NSArray *genres = [__arrayAllMovies filteredArrayUsingPredicate:predicate];
        onComplete(genres);
    } else {

            [MAPGenre getAllGenres:^(NSArray *values) {
                __arrayAllMovies = [[NSMutableArray alloc] initWithArray:values];
                if (!__arrayAllMovies) {
                    __arrayAllMovies = [NSMutableArray new];
                }
                [self getGenreWithIds:pIds onComplete:onComplete];
            }];
    }
}


#pragma mark - API Communication

+ (void)getAllGenres:(void (^)(NSArray *values))onComplete {

    NSString *baseUrl = [NSString stringWithFormat:@"%@genre/movie/list?api_key=%@&language=pt-br", API_BASE_URL, API_TOKEN];

    [self callGetWithUrl:baseUrl parameters:nil onComplete:^(UNIJsonNode *values) {
        NSMutableArray *arrayReturn = [NSMutableArray new];
        for (NSDictionary *dicData in [values.object objectForKey:@"genres"]) {
            MAPGenre *movie = [[MAPGenre alloc] initWithJSONDictionary:dicData];
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
    id id_ = [dic objectForKey:@"id"];
    if ([id_ isKindOfClass:[NSNumber class]]) {
        self.identifier = id_;
    }

    id name_ = [dic objectForKey:@"name"];
    if ([name_ isKindOfClass:[NSString class]]) {
        self.name = name_;
    }
}

@end
