//
//  Model.swift
//  Racooni
//
//  Created by Thomas Stubblefield on 6/4/23.
//

import Foundation

struct Model {
    var posts: [Post?] = [Post(thumbnail: "https://file-examples.com/storage/fe21cc883e647d01698633c/2017/10/file_example_PNG_1MB.png", latitude: 44.472968, longitude: -73.212767, id: UUID().uuidString)]

    mutating func getPosts() {
        //Make an API call to get all the posts

        //Format the posts in the Post data type

        //Set equal to the posts data type

        posts = []
    }
}

struct Post: Codable {
    var thumbnail: String
    var latitude: Double
    var longitude: Double
    var id: String
}
