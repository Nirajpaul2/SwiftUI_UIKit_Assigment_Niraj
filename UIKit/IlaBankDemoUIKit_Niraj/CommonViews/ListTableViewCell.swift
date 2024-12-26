//
//  ListTableViewCell.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadDataInCell(brand: Brand?) {
        titleLbl.text = brand?.brandName
    }
}
