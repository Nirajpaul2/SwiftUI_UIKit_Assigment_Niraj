//
//  NavigationStackView.swift
//  ILABankDemo_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation
import SwiftUI

struct NavigationStackView: View {
    @StateObject var router = Router()
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            HomeView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .homeView:
                        HomeView()
                    }
                }
        }.environmentObject(router)
    }
}
