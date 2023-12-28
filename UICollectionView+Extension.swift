//
//  UITableView+Extension.swift
//  CodeVault
//
//  Created by Rattanakoudom Sambath on 12/9/23.
//

import UIKit

extension UICollectionView {
        
    /// Helper register cell
    /// The View must conform Identifier protocol
    func registerCell<T: Identifier>(_ viewType: T.Type) {
        self.register(viewType.xib(), forCellWithReuseIdentifier: viewType.identifierView)
    }
        
    /// Register Supplementary
    func registerSupplementaryView<T: Identifier>(_ supplementaryType: T.Type, kind: String) {
        self.register(supplementaryType.xib(), forSupplementaryViewOfKind: kind, withReuseIdentifier: supplementaryType.identifierView)
    }
    
    func dequeue<Cell>(_ cellType: Cell.Type, for indexPath: IndexPath) -> Cell where Cell : UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: cellType.identifierView, for: indexPath) as! Cell
    }
}
