//
//  postModel.swift
//  one.two.tree
//
//  Created by rbwo on 2022/04/13.
//

// JSON 파일을 가져오는 뷰모델

import Foundation
import SwiftUI
import CoreData

struct PostData: Hashable, Codable{
    let postNo : String
    let userNo : String
    let treeNo : String
    let postContent : String
    let postImage : String
    let postCreatedAt : String
    let postTitle : String
}

class ViewModel : ObservableObject {
    @Published var posts: [PostData] = []
    
    // saving JSON to Core Data
    
//    func saveDate(context: NSManagedObjectContext) {
//        posts.forEach { (data) in
//            let entity = PostData()
//            entity.postTitle = data.postTitle
//            entity.postImage = data.postImage
//        }
//    }
    
    func fetch() {
        guard let url = URL(string: "https://jsondata~~") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert to JSON
            do {
                let posts = try JSONDecoder().decode([PostData].self, from: data)
                DispatchQueue.main.async {
                    self?.posts = posts
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
