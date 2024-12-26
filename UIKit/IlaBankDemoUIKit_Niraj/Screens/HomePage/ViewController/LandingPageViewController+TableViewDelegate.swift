//
//  ListViewController+TableViewDelegate.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

// Define an enum for row heights
enum TableViewHeight {
    static let banner: CGFloat = UIScreen.main.bounds.height / 3
    static let defaultRow: CGFloat = 50
    static let headerHeight: CGFloat = 43
}

// MARK: Tableview delegates and datasource
extension LandingPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.noOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return TableViewHeight.headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil }
        return textFieldView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        return viewModel?.getListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Use enum for row heights
        if indexPath.section == 0, indexPath.row == 0 {
            return TableViewHeight.banner
        }
        return TableViewHeight.defaultRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0, indexPath.row == 0 {
            return configureBannerCell(for: tableView, at: indexPath)
        } else {
            return configureListCell(for: tableView, at: indexPath)
        }
    }
}

//MARK: Cell configuration
private extension LandingPageViewController {
    
    func configureBannerCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let bannerCell = tableView.dequeueReusableCell(withIdentifier: Constants.TVCellReuseIdentifier.bannerCell) as? BannerTableViewCell else {
            return UITableViewCell() // Return a default cell to handle unexpected cases
        }
        
        // Configure banner cell
        bannerCell.bannerCollectionView.dataSource = self
        bannerCell.bannerCollectionView.delegate = self
        pageControl = bannerCell.bannerPageControl
        bannerCollectionView = bannerCell.bannerCollectionView
        
        let bannerCount = viewModel?.totalVehicle().count ?? 0
        let selectedIndex = viewModel?.selectedIndex ?? 0
        bannerCell.loadTableviewCellData(bannerCount: bannerCount, index: selectedIndex)
        
        return bannerCell
    }
    
    func configureListCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let listCell = tableView.dequeueReusableCell(withIdentifier: Constants.TVCellReuseIdentifier.listCell) as? ListTableViewCell else {
            return UITableViewCell() // Return a default cell to handle unexpected cases
        }
        
        // Configure list cell
        let brand = viewModel?.arrFilteredVehicleBrandsData[safe: indexPath.row]
        listCell.loadDataInCell(brand: brand)
        
        return listCell
    }
}
