//
//  UICollectionViewExt.swift
//  EveningMovie
//
//  Created by Alex Schnapps on 10.05.2023.
//

import UIKit

extension UICollectionView {
    func register<C: UICollectionViewCell>(cellType: C.Type) where C: ClassIdentifiable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseId)
    }
    
    func dequeueReusableCell<C: UICollectionViewCell>(withCellType type: C.Type = C.self, for indexPath: IndexPath) -> C where C: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseId, for: indexPath) as? C
        else { return UICollectionViewCell() as! C }
        
        return cell
    }
}

protocol ClassIdentifiable {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    
    static var reuseId: String {
        return String(describing: self)
    }
}
