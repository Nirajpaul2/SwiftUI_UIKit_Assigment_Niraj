//
//  MainCoordinator.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigator: UINavigationController
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        let teamList = LandingPageViewController.create(navigation: self)
        navigator.pushViewController(teamList, animated: true)
    }
}

extension MainCoordinator: HomeNavigationProtocol {
    func presentVehicleDetails(vehicles: [Vehicle]) {
        let bottomSheetViewController = BottomSheetViewController.create(vehicles: vehicles)
        navigator.present(bottomSheetViewController, animated: true)
    }
}
