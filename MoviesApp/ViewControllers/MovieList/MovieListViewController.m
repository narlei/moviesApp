//
//  MovieListViewController.m
//  MoviesApp
//
//  Created by Narlei A Moreira on 27/12/16.
//  Copyright © 2016 Narlei A Moreira. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieListCell.h"
#import "MovieDetailViewController.h"

@interface MovieListViewController ()

@end

@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.placeholder = @"Pesquisar";
    // Botão cancelar
    self.searchBar.showsCancelButton = YES;
    
    self.searchBar.hidden = NO;
    self.tableViewMovies.tableHeaderView = self.searchBar;
    
    
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Esconde
    [self.tableViewMovies setContentOffset:CGPointMake(0, 44)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - SearchBar Delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self filterDataWithText:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self filterDataWithText:searchBar.text];
    [self.searchBar resignFirstResponder];
    [self.tableViewMovies setContentOffset:CGPointMake(0, -20) animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self filterDataWithText:searchBar.text];
}

#pragma mark - FilterData

- (void)filterDataWithText:(NSString *)pText {
    if (pText.length < 1) {
        self.arrayValues = [[NSMutableArray alloc] initWithArray:self.arrayAllValues];
        [self reloadData];
        return;
    }
    self.arrayValues = [[NSMutableArray alloc] initWithArray:[self.arrayAllValues filteredArrayUsingPredicate:[Global predicateWithSearch:pText]]];
    [self reloadData];
}

#pragma mark - Load Data
-(void) loadData{
    [MAPMovie getAllMovies:^(NSArray *values) {
        self.arrayAllValues = [[NSMutableArray alloc] initWithArray:values];
        self.arrayValues = [[NSMutableArray alloc] initWithArray:self.arrayAllValues];
        [self reloadData];
    }];
}

-(void) reloadData{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableViewMovies reloadData];
    });
}

#pragma TableView Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MAPMovie* movie =  [self.arrayValues objectAtIndex:indexPath.row];
    MovieDetailViewController *viewController = [[UIStoryboard storyboardWithName:@"MovieDetail" bundle:nil] instantiateInitialViewController];
    viewController.movie = movie;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell = [tableView dequeueReusableCellWithIdentifier:@"MovieListCell"];
    MovieListCell *currentCell = (MovieListCell *) cell;
    currentCell.movie = [self.arrayValues objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayValues.count;
}



@end
