//
//  TableListView.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import SwiftUI

struct TableListView: View {
    let brands: [Brand]
    @Binding var searchTxt: String
    var body: some View {
        LazyVStack(pinnedViews: [.sectionHeaders]) {
            Section {
                ForEach(brands, id: \.brandName) { data in
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 5) {
                            Text(data.brandName)
                        }
                        Divider()
                    }
                    .padding(10)
                }
            } header: {
                SearchView(searchText: $searchTxt)
            }
        }
    }
}
