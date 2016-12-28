//
//  MAPGenre.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAPObjectModel.h"


@interface MAPGenre : MAPObjectModel

+ (instancetype)sharedMAPGenre;

@property (strong, nonatomic) NSNumber *identifier;
@property (strong, nonatomic) NSString *name;

- (id) initWithJSONDictionary:(NSDictionary *)dic;
- (void) parseJSONDictionary:(NSDictionary *)dic;

- (void)getGenreWithIds:(NSArray *)pIds onComplete:(void (^)(NSArray *genres))onComplete ;

@end
