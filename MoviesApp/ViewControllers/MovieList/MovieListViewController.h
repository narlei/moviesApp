//
//  MovieListViewController.h
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import "MAPBaseViewController.h"

@interface MovieListViewController : MAPBaseViewController<UIScrollViewDelegate,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>


// Outlets
@property (weak, nonatomic) IBOutlet UITableView *tableViewMovies;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

// Properties
@property (strong, nonatomic) NSMutableArray *arrayValues;
@property (strong, nonatomic) NSMutableArray *arrayAllValues;

@end
