//
//  SecondView.swift
//  PFDeepLinking
//
//  Created by Vid Tadel on 06/09/2023.
//

import SwiftUI
import SwiftUINavigation

final class SecondViewModel: ObservableObject {
  internal init(destination: SecondViewModel.Destination? = nil) {
    self.destination = destination
  }
  
  enum Destination {
    case detail
  }

  @Published var destination: Destination?
}

struct SecondView: View {
  @ObservedObject var model: SecondViewModel
  var body: some View {
    VStack {
      Text("Second level")
      Button("Go deeper") {
        model.destination = .detail
      }
    }
    .navigationDestination(unwrapping: $model.destination) { _ in
      Text("Third level")
    }
  }
}
