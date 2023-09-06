//
//  ContentView.swift
//  DeepLinking
//
//  Created by Vid Tadel on 05/09/2023.
//

import SwiftUI

final class FirstViewModel: ObservableObject {
  enum Destination {
    case detail(SecondViewModel)
  }
  internal init(destination: Destination? = nil) {
    self.destination = destination
  }
  
  @Published var destination: Destination?
}

struct FirstView: View {
  @ObservedObject var viewModel: FirstViewModel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
          Button("Detail") {
            viewModel.destination = .detail(SecondViewModel())
          }
          .navigationDestination(
            isPresented: Binding(get: {
              viewModel.destination != nil
            }, set: { _ in
              viewModel.destination = nil
            }),
            destination: {
              if case let .detail(model) = viewModel.destination {
                SecondView(model: model)
              }
            }
          )
        }
        .padding()
    }
}

#Preview {
  NavigationStack {
    FirstView(viewModel: FirstViewModel())
  }
}
