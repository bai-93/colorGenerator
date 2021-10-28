//
//  ProgressViewSecon.swift
//  multiProgress
//
//  Created by Baiaman Apsamatov on 15/10/21.
//

import Foundation
import UIKit
import MultiProgressView

class StorageProgressSection: ProgressViewSection {
    private let rightBorder: UIView = {
        let border = UIView()
        border.backgroundColor = .white
        return border
      }()

    func configure(withStorageType storageType: StorageType,uniqueColor:UIColor = .red) {
        addSubview(rightBorder)
//        rightBorder.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, width: 1)
        backgroundColor = uniqueColor //storageType.color
      }
}
