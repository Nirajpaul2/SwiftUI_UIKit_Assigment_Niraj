//
//  Constants.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation

struct Constants {
    static let enterVehicleName = "Enter vehicle brand"
    
    struct TVCellReuseIdentifier {
        static let bannerCell = "BannerCell"
        static let listCell = "ListCell"
        static let headerCell = "HeaderCell"
        static let titleCell = "TitleCell"
    }
  
    struct CVCellReuseIdentifier {
        static let bannerCollectionCell = "BannerCollectionCell"
    }
    
    struct TVCellNibName {
        static let bannerTableViewCell = "BannerTableViewCell"
        static let listTableViewCell = "ListTableViewCell"
    }
    
    struct NibName {
        static let bottomSheetViewController = "BottomSheetViewController"
    }
    
    struct JsonFileConstants {
        static let fileName = "DataResponse"
        static let type = "json"
    }
}
