import SwiftUI

struct URLImage: View {
    @StateObject private var imageLoader: ImageLoader

    init(url: URL) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Loading image...")
            }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil

    private let url: URL

    init(url: URL) {
        self.url = url
        loadImage()
    }

    private func loadImage() {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }

            guard let data = data else {
                print("Invalid image data")
                return
            }

            DispatchQueue.main.async {
                if let loadedImage = UIImage(data: data) {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}
