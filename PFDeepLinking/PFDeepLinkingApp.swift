//
//  PFDeepLinkingApp.swift
//  PFDeepLinking
//
//  Created by Vid Tadel on 06/09/2023.
//

import SwiftUI

@main
struct PFDeepLinkingApp: App {
  var body: some Scene {
    WindowGroup {
      FirstView(
        model: FirstViewModel(
          destination: .detail(
            SecondViewModel(
              destination: .detail
            )
          )
        )
      )
    }
  }
}

