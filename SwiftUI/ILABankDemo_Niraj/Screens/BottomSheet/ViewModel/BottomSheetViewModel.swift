//
//  BottomSheetViewModel.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import SwiftUI

class BottomSheetViewModel: ObservableObject {
    // Dependencies
    private let targetCharacters: Set<Character>

    // Published property for UI updates
    @Published var bottomSheetData: [BottomSheetModel] = []

    // Initializer with dependency injection
    init(targetCharacters: Set<Character> = ["a", "e", "r"]) {
        self.targetCharacters = targetCharacters
    }
    
    /// Sets up data for the bottom sheet using vehicles.
    func setUpData(vehicles: [Vehicle]) {
        bottomSheetData = vehicles.enumerated().map { index, vehicle in
            let characterCounts = countTargetCharacters(in: vehicle.brands.map(\.brandName))
            let stringCharacters = characterCounts.map { StringCharacterModel(value: "\($0.key)", count: $0.value) }
            return BottomSheetModel(id: index + 1, characterCounts: stringCharacters, totalNoOfItems: vehicle.brands.count)
        }
    }

    /// Counts occurrences of target characters in an array of strings.
    private func countTargetCharacters(in strings: [String]) -> [Character: Int] {
        strings
            .joined() // Combine all strings into one
            .reduce(into: [:]) { counts, char in
                if targetCharacters.contains(char) {
                    counts[char, default: 0] += 1
                }
            }
    }
}
