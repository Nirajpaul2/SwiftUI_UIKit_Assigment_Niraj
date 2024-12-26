//
//  Router.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case homeView
}

final class Router: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    func pushView(route: Route) {
        navigationPath.append(route)
    }
    
    func popToRootView() {
        navigationPath = .init()
    }
    
    func popToSpecificView(k: Int) {
        navigationPath.removeLast(k)
    }
    
}
