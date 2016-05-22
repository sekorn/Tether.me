//
//  TableViewFetchedResultsDisplayer.swift
//  WhaleTale
//
//  Created by Scott on 4/13/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewFetchedResultsDisplayer {
    func configureCell(cell:UITableViewCell, atIndexPath indexPath: NSIndexPath)
}