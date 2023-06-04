import Foundation
import Firebase
import FirebaseFirestore

struct Model {
    @Published var posts: [Post] = []

    init() {
        FirebaseApp.configure()
        getPosts()
    }

    func getPosts() {
        let db = Firestore.firestore()
        let collection = db.collection("posts")

        collection.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching posts: \(error.localizedDescription)")
                return
            }

            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }

            self.posts = documents.compactMap { document in
                try? document.data(as: Post.self)
            }
        }
    }
}

struct Post: Codable, Identifiable {
    var id: String?
    var thumbnail: String
    var latitude: Double
    var longitude: Double
}
