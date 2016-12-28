//
//  Global.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject

+ (instancetype)sharedGlobal;

+ (NSString *)getWordNum:(NSString *)texto indice:(int)indice delimitador:(NSString *)delimitador;
+ (int)getWordCount:(NSString *)texto delimitador:(NSString *)delimitador;

#pragma mark - Filter Helpers

+ (NSPredicate *)predicateWithSearch:(NSString *)pSearch ;
@end
