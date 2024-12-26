//
//  BottomSheetModel.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation

/// Model representing the bottom sheet data.
struct BottomSheetModel: Identifiable {
    let id: Int
    let characterCounts: [StringCharacterModel]
    let totalNoOfItems: Int

    /// Computed property for the header title.
    var headerTitle: String {
        "List \(id) (\(totalNoOfItems))"
    }
}

/// Model representing a character count.
struct StringCharacterModel: Identifiable {
    let id = UUID()
    let value: String
    let count: Int

    /// Computed property for the display title.
    var title: String {
        "\(value) = \(count)"
    }
}
