//
//  StorageType.swift
//  multiProgress
//
//  Created by Baiaman Apsamatov on 15/10/21.
//

import UIKit
enum StorageType: Int {
  case app, message, media, photo, other

  static var allTypes: [StorageType] = [.app, .message, .media, .photo, .other]

  var description: String {
    switch self {
    case .app:
      return "Apps"
    case .message:
      return "Messages"
    case .media:
      return "Media"
    case .photo:
      return "Photos"
    case .other:
        return "Other"
    }
  }

  var color: UIColor {
    switch self {
    case .app:
      return UIColor.red
    case .message:
      return UIColor.green
    case .media:
      return UIColor.blue
    case .photo:
      return UIColor.yellow
    case .other:
        return UIColor.black
    }
  }
}
