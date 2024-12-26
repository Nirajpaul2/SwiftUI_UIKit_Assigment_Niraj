//
//  HomeViewModel.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation

final class DefaultVehicleFiltering: VehicleFiltering {
    func filterBrands(_ brands: [Brand], searchText: String) -> [Brand] {
        guard !searchText.isEmpty else { return brands }
        return brands.filter { $0.brandName.localizedCaseInsensitiveContains(searchText) }
    }
}

final class HomeViewModel {
    
    // MARK: - Dependencies
    private let homeViewService: HomeViewServiceProtocol
    private let vehicleFiltering: VehicleFiltering
    private let viewController: HomeViewProtocol
    private let navigation: HomeNavigationProtocol
    
    // MARK: - Properties
    var selectedIndex: Int = 0
    var arrFilteredVehicleBrandsData: [Brand] = []
    var showBottomSheet: Bool = false
    
    // MARK: - Private Properties
    private var arrVehicles: [Vehicle] = []
    private var arrVehicleBrands: [Brand] = []
    
    
    // MARK: - Computed Properties
    var totalVehicles: [Vehicle] {
        arrVehicles
    }
    
    /// Initializer for `HomeViewModel`, injecting dependencies for services, filtering, and navigation.
    ///
    /// - Parameters:
    ///   - homeViewService: Service responsible for fetching home-related data. Defaults to `HomeViewService`.
    ///   - vehicleFiltering: Object responsible for filtering vehicle data. Defaults to `DefaultVehicleFiltering`.
    ///   - wireframe: Object responsible for navigation.
    ///   - viewController: Protocol defining view interactions with the home screen.
    init(
        homeViewService: HomeViewServiceProtocol = HomeViewService(),
        vehicleFiltering: VehicleFiltering = DefaultVehicleFiltering(),
        navigation: HomeNavigationProtocol,
        viewController: HomeViewProtocol
    ) {
        self.homeViewService = homeViewService
        self.vehicleFiltering = vehicleFiltering
        self.navigation = navigation
        self.viewController = viewController
    }

}

extension HomeViewModel: HomeViewModelProtocol {
    
    func totalVehicle() -> [Vehicle] {
        return arrVehicles
    }
    
    func moveToOtherConroller() {
        navigation.presentVehicleDetails(vehicles: arrVehicles)
    }
    
    /// Find no of section in tableview
    func noOfSection() -> Int {
        2
    }
    
    /// Fetches vehicle data from the service.
    func fetchVehicles() {
        homeViewService.getVehiclesData(file: Constants.JsonFileConstants.fileName, type: Constants.JsonFileConstants.type) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                self.arrVehicles = success.vehicles
                self.updateVehicleBrands(for: self.selectedIndex)
                self.viewController.loadVehicles()
            case .failure(let error):
                print("Error fetching vehicle data: \(error)")
            }
        }
    }
    
    /// Filters brands based on the search text.
    func filterBrands(searchText: String) {
        arrFilteredVehicleBrandsData = vehicleFiltering.filterBrands(arrVehicleBrands, searchText: searchText)
    }
    
    /// Updates the filtered vehicle brands based on the selected index.
    func updateVehicleBrands(for index: Int) {
        selectedIndex = index
        arrVehicleBrands = arrVehicles[safe: index]?.brands ?? []
        filterBrands(searchText: "")
    }
    
    /// Get list count based on search
    func getListCount() -> Int {
        return arrFilteredVehicleBrandsData.count
    }
}
