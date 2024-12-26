//
//  CustomCell.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

// MARK: - Custom HeaderCell

class HeaderCell: UITableViewCell {
    static let identifier = Constants.TVCellReuseIdentifier.headerCell
    
    func configure(with title: String) {
        textLabel?.text = title
        textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
}

// MARK: - Custom TitleCell

class TitleCell: UITableViewCell {
    static let identifier = Constants.TVCellReuseIdentifier.titleCell
    
    func configure(with title: String) {
        textLabel?.text = title
        textLabel?.font = UIFont.systemFont(ofSize: 14)
    }
}
