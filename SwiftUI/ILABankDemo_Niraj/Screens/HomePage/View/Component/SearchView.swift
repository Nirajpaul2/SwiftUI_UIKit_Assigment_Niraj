//
//  SearchView.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: Constants.SystemImageIcons.searchIcon)
                TextField(Constants.textFieldPlaceHolder, text: $searchText)
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.leading, 5)
        }
       
    }
}
