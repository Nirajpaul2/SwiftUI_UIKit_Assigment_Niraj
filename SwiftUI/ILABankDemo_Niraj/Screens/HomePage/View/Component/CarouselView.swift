//
//  CarouselView.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import SwiftUI

struct ImgScrollView: View {
    @Binding var selectedIndex: Int
    var vehicles: [Vehicle]
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(0..<vehicles.count, id: \.self) { index in
                    let model = vehicles[index]
                    ZStack(alignment: .topLeading) {
                        Image(model.img)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(12)
                            .tag(index)
                    }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
             .ignoresSafeArea()
            
            /// Navigation Dots
            HStack {
                ForEach(0..<vehicles.count, id: \.self) { index in
                    Circle()
                        .fill(index == selectedIndex ? Color.blue : Color.gray.opacity(0.5))
                        .frame(width: 8, height: 8)
                        .onTapGesture {
                            selectedIndex = index
                        }
                }.offset(y: 120)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.height / 4)
        .padding(.bottom)
    }
}
