//
//  BottomSheetViewController.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

final class BottomSheetViewController: UIViewController {
    //MARK: IBOutlet
    @IBOutlet weak var tblViewBottomSheet: UITableView!
    //MARK: Properties
    var viewModel: BottomSheetViewModel?
    
    static func create(vehicles: [Vehicle]) -> BottomSheetViewController {
        let controller = BottomSheetViewController(nibName: Constants.NibName.bottomSheetViewController, bundle: nil)
        controller.viewModel = BottomSheetViewModel(vehicles: vehicles)
        return controller
    }
    
    //MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        reloadData()
    }
    
    //MARK: Methods
    private func setUpTableView() {
        tblViewBottomSheet.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        tblViewBottomSheet.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
    }
    
    private func reloadData() {
        tblViewBottomSheet.reloadData()
    }
}

// MARK: Tableview Delegate & Datasource
extension BottomSheetViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
          return viewModel?.bottomSheetData.count ?? 0
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 1 + (viewModel?.bottomSheetData[section].characterCounts.count ?? 0)
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = viewModel?.bottomSheetData[indexPath.section] else {
            return UITableViewCell() // Handle the case where data is nil
        }
        if indexPath.row == 0 {
            return configureHeaderCell(for: tableView, with: data, at: indexPath)
        } else {
            return configureTitleCell(for: tableView, with: data, at: indexPath)
        }
    }
}

//MARK: - Cell Configuration
private extension BottomSheetViewController {
    
    func configureHeaderCell(for tableView: UITableView, with data: BottomSheetModel, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
            return UITableViewCell() // Handle the fallback case
        }
        cell.configure(with: data.headerTitle)
        return cell
    }
    
    func configureTitleCell(for tableView: UITableView, with data: BottomSheetModel, at indexPath: IndexPath) -> UITableViewCell {
        guard let characterData = data.characterCounts[safe: indexPath.row - 1] else {
            return UITableViewCell() // Handle the fallback case
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.identifier, for: indexPath) as? TitleCell else {
            return UITableViewCell() // Handle the fallback case
        }
        cell.configure(with: characterData.title)
        return cell
    }
}
