//
//  StoryboardUtility.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation
import UIKit

enum Storyboard: String {
    case main = "Main"
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func instantiateVC<T: UIViewController>(_ objectClass: T.Type) -> T {
        let storyBoard = self.instance
        return storyBoard.instantiateViewController(withIdentifier: objectClass.className) as! T
    }
}
