//
//  ViewController.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tblViewHomePage: UITableView!
    @IBOutlet weak var btnFloatingOutlet: UIButton!
    
    // MARK: - Properties
    var viewModel: HomeViewModelProtocol?
    var pageControl: UIPageControl?
    var bannerCollectionView: UICollectionView?
    var textFieldView: TextFieldView?
    
    //MARK: Initializers
    static func create(navigation: HomeNavigationProtocol) -> LandingPageViewController {
        let viewController = Storyboard.main.instantiateVC(LandingPageViewController.self)
        viewController.viewModel = HomeViewModel(navigation: navigation, viewController: viewController)
        return viewController
    }
    
    // MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupListView()
        setupSearchBar()
        viewModel?.fetchVehicles()
    }
    
    // MARK: Button Action
    @IBAction func btnFloatingAction(_ sender: UIButton) {
        viewModel?.moveToOtherConroller()
    }
}

// MARK: Setup Search bar and TableView
private extension LandingPageViewController {
    func setupSearchBar() {
        textFieldView = TextFieldView()
        textFieldView?.setBorder(borderWidth: 2)
        textFieldView?.setRoundedCorner(radius: 5)
        textFieldView?.placeholder = Constants.enterVehicleName
        textFieldView?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textFieldView?.textFieldShouldReturn = { [weak self] () -> Bool in
            self?.view.endEditing(true)
            return true
        }
        textFieldView?.textDidChange = { [weak self] (text) -> Bool in
            self?.viewModel?.filterBrands(searchText: text ?? "")
            self?.tblViewHomePage.reloadData()
            return true
        }
    }
    
    func setupListView() {
        tblViewHomePage.register(UINib(nibName: Constants.TVCellNibName.bannerTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TVCellReuseIdentifier.bannerCell)
        tblViewHomePage.register(UINib(nibName: Constants.TVCellNibName.listTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TVCellReuseIdentifier.listCell)
        tblViewHomePage.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 50, right: 0)
    }
}

extension LandingPageViewController: HomeViewProtocol {
    func loadVehicles() {
        DispatchQueue.main.async {
            self.tblViewHomePage.reloadData()
            self.bannerCollectionView?.reloadData()
        }
    }
}
