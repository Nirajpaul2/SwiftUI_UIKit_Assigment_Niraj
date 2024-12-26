//
//  BottomSheetView.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import SwiftUI

struct BottomSheetView: View {
    var vechicles: [Vehicle]
    @ObservedObject var viewModel = BottomSheetViewModel()
    var body: some View {
        Spacer()
        List(viewModel.bottomSheetData, id: \.totalNoOfItems) { data in
            VStack(alignment: .leading) {
                Text(data.headerTitle)
            }.listRowBackground(Color.red.opacity(0.2))
            ForEach(data.characterCounts, id: \.value) { value in
                Text(value.title)
            }
        }.onAppear {
            viewModel.setUpData(vehicles: vechicles)
        }
    }
}
