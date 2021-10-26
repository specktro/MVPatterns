//
//  MessageView.swift
//  Arch
//
//  Created by Miguel Angel Gómez Rivero on 25/10/21.
//  Copyright © 2021 specktro. All rights reserved.
//

import SwiftUI

// MARK: SimpleMessageView struct
struct SimpleMessageView: View {
  // MARK: - Properties
  @ObservedObject var viewModel: MessageViewModel
  
  // MARK: - Body
  var body: some View {
    ZStack {
      Color.gray
        .ignoresSafeArea()
      
      VStack {
        Button {
          viewModel.showGreeting()
        } label: {
          Label("TAP", systemImage: "hand.tap.fill")
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(.white)
        }
        Text(viewModel.greeting)
          .font(.system(.body, design: .rounded))
          .padding()
      }
    }
  }
}

// MARK: - Preview
struct MessageView_Previews: PreviewProvider {
  static var previews: some View {
    let person: Person = Person(firstName: "Sprieto", lastName: "Moreno")
    let viewModel: MessageViewModel = MessageViewModel(person: person)
    SimpleMessageView(viewModel: viewModel)
  }
}
