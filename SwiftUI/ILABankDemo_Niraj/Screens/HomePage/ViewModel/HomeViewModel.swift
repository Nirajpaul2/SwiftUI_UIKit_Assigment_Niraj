//
//  HomeViewModel.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    // MARK: - Dependencies
    private let homeViewService: HomeViewServiceDelegate
    
    // MARK: - Published Properties
    @Published var selectedIndex: Int = 0
    @Published var searchTxt: String = ""
    @Published var arrFilteredVehicleBrandsData: [Brand] = []
    @Published var showBottomSheet: Bool = false
    
    // MARK: - Private Properties
    private var arrVehicles: [Vehicle] = []
    private var arrVehicleBrands: [Brand] = []
    
    // MARK: - Computed Properties
    var totalVehicles: [Vehicle] {
        arrVehicles
    }
    
    // MARK: - Initializer
    init(homeViewService: HomeViewServiceDelegate = HomeViewService()) {
        self.homeViewService = homeViewService
    }
    
    // MARK: - Methods
    
    /// Fetches vehicle data from the service.
    func fetchVehicles() {
        homeViewService.getVehiclesData(fileName: Constants.JsonFileConstants.fileName, fileType: Constants.JsonFileConstants.type) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.arrVehicles = success.vehicles
                self.arrVehicleBrands = success.vehicles.first?.brands ?? []
                self.updateVehicleBrands()
            case .failure(let error):
                print("Error fetching vehicle data: \(error)")
            }
        }
    }
    
    /// Updates the filtered vehicle brands based on the selected index.
    func updateVehicleBrands() {
        arrVehicleBrands = arrVehicles[safe: selectedIndex]?.brands ?? []
        filterBrands(searchText: "")
    }
    
    /// Filters brands based on the search text.
    func filterBrands(searchText: String) {
        if searchTxt.isEmpty {
            arrFilteredVehicleBrandsData = arrVehicleBrands
        } else {
            arrFilteredVehicleBrandsData = arrVehicleBrands.filter { $0.brandName.localizedCaseInsensitiveContains(searchTxt)
            }
        }
    }
}
