//
//  UITableView+Extension.swift
//  CodeVault
//
//  Created by Rattanakoudom Sambath on 12/9/23.
//

import UIKit

extension UITableView {
    func register<T: Identifier>(_ viewType: T.Type) {
        self.register(viewType.xib(), forCellReuseIdentifier: viewType.identifierView)
    }
    
    func registerOf(_ cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.identifierView)
    }
    
    func register(of cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.identifierView)
    }
    
    func registerHeaderFooterView<T: Identifier>(_ viewType: T.Type) {
        self.register(viewType.xib(), forHeaderFooterViewReuseIdentifier: viewType.identifierView)
    }

    var lastIndexPath: IndexPath? {
        get {
            let lastSectionIndex = self.numberOfSections - 1
            let lastRowIndex = self.numberOfRows(inSection: lastSectionIndex) - 1
            
            if lastRowIndex >= 0 && lastSectionIndex > 0 {
                return IndexPath.init(row: lastRowIndex, section: lastSectionIndex)
            }
            
            return nil
        }
    }
    
    func dequeue<Cell>(_ cellType: Cell.Type, for indexPath: IndexPath) -> Cell where Cell : UITableViewCell {
        return dequeueReusableCell(withIdentifier: cellType.identifierView, for: indexPath) as! Cell
    }
}
