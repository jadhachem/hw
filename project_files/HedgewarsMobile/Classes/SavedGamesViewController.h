/*
 * Hedgewars-iOS, a Hedgewars port for iOS devices
 * Copyright (c) 2009-2010 Vittorio Giovara <vittorio.giovara@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 * File created on 22/09/2010.
 */


#import <UIKit/UIKit.h>
#import "EditableCellView.h"

@interface SavedGamesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, EditableCellViewDelegate>  {
    UITableView *tableView;
    NSMutableArray *listOfSavegames;
}

@property (nonatomic,retain) IBOutlet UITableView *tableView;
@property (nonatomic,retain) NSMutableArray *listOfSavegames;

-(IBAction) buttonPressed:(id) sender;
-(IBAction) toggleEdit:(id) sender;
-(IBAction) clearAll:(id) sender;

@end
