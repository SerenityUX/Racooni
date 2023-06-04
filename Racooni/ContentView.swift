import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            ForEach(viewModel.posts, id: \.self?.thumbnail) { post in
                Text("test")
            }
            Text("Hello, world!")
                .onTapGesture {
                    print(viewModel.posts)
                }
        }
        .padding()
    }
}
