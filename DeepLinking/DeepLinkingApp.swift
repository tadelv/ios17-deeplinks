//
//  DeepLinkingApp.swift
//  DeepLinking
//
//  Created by Vid Tadel on 05/09/2023.
//

import SwiftUI

enum Path: Hashable {
  case first
  case second
  case third
}

@main
struct DeepLinkingApp: App {
  // Use to demonstrate issue with NavigationPath
  @State var path: [Path] = [.second, .third]
    var body: some Scene {
        WindowGroup {
          NavigationStack {
            FirstView(
              viewModel: FirstViewModel(
                destination: .detail(
                  SecondViewModel(
                    showDetail: true
                  )
                )
              )
            )
          }
        }
        .onChange(of: self.path) {
          print($0)
        }
    }
}
