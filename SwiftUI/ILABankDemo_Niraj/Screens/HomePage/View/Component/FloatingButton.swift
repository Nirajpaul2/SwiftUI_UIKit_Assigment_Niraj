//
//  FloatingButton.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import SwiftUI

struct FloatingButton: View {
   @Binding var showBottomSheet: Bool
    var body: some View {
        VStack {
            Spacer()
            /// Circular Button with three dots
            Button(action: {
                showBottomSheet.toggle()
            }) {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .overlay(
                        VStack(spacing: 3) {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                            Circle()
                                .fill(Color.white)
                                .frame(width: 8, height: 8)
                        }
                    )
            }.buttonStyle(PlainButtonStyle())
            Spacer()
        }.padding()
    }
}
