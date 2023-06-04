//
//  ContentView.swift
//  Racooni
//
//  Created by Thomas Stubblefield on 6/4/23.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onTapGesture {
                    print(viewModel.posts)
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
