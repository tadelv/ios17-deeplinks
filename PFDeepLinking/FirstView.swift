//
//  ContentView.swift
//  PFDeepLinking
//
//  Created by Vid Tadel on 06/09/2023.
//

import SwiftUI
import SwiftUINavigation

final class FirstViewModel: ObservableObject {
  internal init(destination: FirstViewModel.Destination? = nil) {
    self.destination = destination
  }
  
  enum Destination {
    case detail(SecondViewModel)
  }

  @Published var destination: Destination?
}

struct FirstView: View {
  @ObservedObject var model: FirstViewModel
  var body: some View {
    NavigationStack {
      VStack {
        Image(systemName: "globe")
          .imageScale(.large)
          .foregroundStyle(.tint)
        Text("Hello, world!")
        Button("Go deeper") {
          model.destination = .detail(SecondViewModel())
        }
        .navigationDestination(
          unwrapping: $model.destination,
          case: /FirstViewModel.Destination.detail
        ) { $model in
          SecondView(model: model)
        }
      }
      .padding()
    }
  }
}

#Preview {
  FirstView(
    model: FirstViewModel()
  )
}
