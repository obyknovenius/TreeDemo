//
//  MasterViewController.m
//  TreeDemo
//
//  Created by Vitaly Dyachkov on 16/06/16.
//  Copyright © 2016 Vitaly Dyachkov. All rights reserved.
//

#import "EBFArchiveKit.h"

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "File.h"
#import "Folder.h"

@implementation MasterViewController

#pragma mark - Accessors

- (void)setFolder:(Folder *)folder {
    if (![_folder isEqual:folder]) {
        _folder = folder;
        
        [self configureView];
    }
}

#pragma mark - UI

- (void)configureView {
    if (self.folder) {
        self.title = self.folder.name;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self configureView];
}

#pragma mark - Actions

- (IBAction)refresh:(id)sender {
    NSURL *dataFileURL = [[NSBundle mainBundle] URLForResource:@"Data" withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:dataFileURL];
    
    EBFJSONUnarchiver *unarchiver = [[EBFJSONUnarchiver alloc] initForReadingWithData:data];
    
    [unarchiver setClass:[Folder class] forClassName:@"folder"];
    [unarchiver setClass:[File class] forClassName:@"file"];
    
    self.folder = [unarchiver unarchiveRootObject];
    
    self.title = self.folder.name;
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.folder.children.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    File *file = self.folder.children[indexPath.row];
    
    NSString *cellIdentifier = nil;
    if ([file isKindOfClass:[Folder class]]) {
        cellIdentifier = @"FolderCell";
    } else {
        cellIdentifier = @"FileCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];;
    cell.textLabel.text = file.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"GET %@", file.path];
    
    return cell;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowFolder"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Folder *folder = (Folder *)self.folder.children[indexPath.row];
        
        MasterViewController *controller = (MasterViewController *)segue.destinationViewController;
        controller.folder = folder;
    } else if ([segue.identifier isEqualToString:@"ShowFile"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        File *file = self.folder.children[indexPath.row];
        
        DetailViewController *controller = (DetailViewController *)[segue.destinationViewController topViewController];
        controller.file = file;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end
