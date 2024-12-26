//
//  BannerCollectionViewCell.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadBannerImageCell(vehicle: Vehicle?) {
        bannerImgView.image = UIImage(named: vehicle?.img ?? "")
    }
}
