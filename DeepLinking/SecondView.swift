//
//  SecondView.swift
//  DeepLinking
//
//  Created by Vid Tadel on 05/09/2023.
//

import SwiftUI

final class SecondViewModel: ObservableObject {
  internal init(showDetail: Bool = false) {
    self.showDetail = showDetail
  }
  
  @Published var showDetail: Bool
}

struct SecondView: View {
  @ObservedObject var model: SecondViewModel

  var body: some View {
    VStack {
      Image(systemName: "globe")
      Text("Second view")
      Button("Drill down") {
        model.showDetail = true
      }
      .navigationDestination(isPresented: $model.showDetail) {
        Text("hello, 3rd level!")
      }
    }
  }
}

#Preview {
  SecondView(model: SecondViewModel())
}
