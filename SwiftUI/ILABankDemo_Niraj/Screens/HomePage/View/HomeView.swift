//
//  ContentView.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var isViewLoaded: Bool = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                // Image Scroll View
                ImgScrollView(selectedIndex: $viewModel.selectedIndex, vehicles: viewModel.totalVehicles)
                // Listing View
                TableListView(brands: viewModel.arrFilteredVehicleBrandsData, searchTxt: $viewModel.searchTxt)
            }.padding()
            
            // Floating button
            FloatingButton(showBottomSheet: $viewModel.showBottomSheet)
                .offset(y: UIScreen.main.bounds.height/2 - 100)
        }
        .onAppear {
            if !isViewLoaded {
                viewModel.fetchVehicles()
                isViewLoaded = false
            }
        }.onChange(of: viewModel.selectedIndex) {
            viewModel.searchTxt = ""
            viewModel.updateVehicleBrands()
            hideKeyboard()
        }
        .onChange(of: viewModel.searchTxt) {
            viewModel.filterBrands(searchText: viewModel.searchTxt)
            
        }.sheet(isPresented: $viewModel.showBottomSheet) {
            BottomSheetView(vechicles: viewModel.totalVehicles).presentationDetents([.medium,.large])
        }.navigationBarTitle(Text(Constants.headerTitle))
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension HomeView {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    HomeView()
}

// MARK: - Notes
/*
1. For asynchronous calls that depend on a property value change, it is preferred to use `task(id:)`.
   Example:
   .task(id: viewModel.searchTxt, priority: .background) {
       // Your asynchronous task here
   }

2. For general asynchronous tasks, it is recommended to use `Task(priority:)`.
   Example:
   Task(priority: .background) {
       await funcName()
   }
*/
