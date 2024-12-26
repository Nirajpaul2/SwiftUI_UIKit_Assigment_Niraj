//
//  HomeProtocols.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation

protocol HomeNavigationProtocol {
    func presentVehicleDetails(vehicles: [Vehicle])
}

protocol HomeViewModelProtocol {
    func fetchVehicles()
    func filterBrands(searchText: String)
    func updateVehicleBrands(for index: Int)
    func getListCount() -> Int
    func noOfSection() -> Int
    func moveToOtherConroller()
    func totalVehicle() -> [Vehicle]
    var selectedIndex: Int { get set}
    var arrFilteredVehicleBrandsData: [Brand] { get set}
}

protocol HomeViewProtocol {
    func loadVehicles()
}

protocol VehicleFiltering {
    func filterBrands(_ brands: [Brand], searchText: String) -> [Brand]
}
