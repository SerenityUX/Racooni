//
//  ViewModel.swift
//  Racooni
//
//  Created by Thomas Stubblefield on 6/4/23.
//

import Foundation

//This is the view model
class ViewModel: ObservableObject {
    @Published private var model = Model()

    var posts: [Post?] {
        return model.posts
    }

    func addPost() {
        //Add post

        //Update posts
        model.getPosts()

        //Return complete post
    }

}
