//
//  LandingPageViewController+CollectionViewDelegate.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

enum CollectionViewHeightAndWidth {
    static let width: CGFloat = UIScreen.main.bounds.width - 20
    static let height: CGFloat = (UIScreen.main.bounds.height * 30) / 100
}

// MARK: CollectionView delegates and datasource
extension LandingPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.totalVehicle().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CVCellReuseIdentifier.bannerCollectionCell, for: indexPath) as? BannerCollectionViewCell
        bannerCell?.loadBannerImageCell(vehicle: viewModel?.totalVehicle()[safe: indexPath.row])
        return bannerCell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: CollectionViewHeightAndWidth.width, height: CollectionViewHeightAndWidth.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if !scrollView.isPagingEnabled { return }
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        viewModel?.updateVehicleBrands(for: index)
        pageControl?.currentPage = viewModel?.selectedIndex ?? 0
        tblViewHomePage.reloadSections(IndexSet(integer: 1), with: .automatic)
        textFieldView?.text = ""
    }
}
