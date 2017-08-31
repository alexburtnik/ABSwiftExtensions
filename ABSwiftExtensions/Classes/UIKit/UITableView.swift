//
//  UITableView.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation

public extension UITableViewDataSource {
    public func lastIndexPath(_ tableView: UITableView) -> IndexPath? {
        guard let sections = self.numberOfSections?(in: tableView) else { return nil }
        for section in stride(from: sections-1, through: 0, by: -1) {
            let rows = self.tableView(tableView, numberOfRowsInSection: section)
            if rows > 0 {
                return IndexPath(row: rows - 1, section: section)
            }
        }
        return nil
    }
    
    public func allIndexPaths(_ tableView: UITableView, section: Int) -> [IndexPath]? {
        let sections = self.numberOfSections?(in: tableView) ?? 1
        guard section < sections else { return nil }
        let numberOfRows = self.tableView(tableView, numberOfRowsInSection: section)
        return (0..<numberOfRows).map { IndexPath(row: $0, section: section) }
    }
}
