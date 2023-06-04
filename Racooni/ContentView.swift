import SwiftUI
import UIKit

struct ContentView: View {

    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            Text("Burrow")
                .onTapGesture {
                    print(viewModel.posts)
                }
            ForEach(viewModel.posts, id: \.self?.thumbnail) { post in
                URLImage(url: URL(string: post!.thumbnail)!)
                    .onTapGesture {
                        openMaps(latitude: post!.latitude, longitude: post!.longitude)
                    }
            }

        }
        .padding()
    }
}


func openMaps(latitude: Double, longitude: Double) {
    let coordinates = "\(latitude),\(longitude)"
    if let url = URL(string: "maps://?q=\(coordinates)") {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
