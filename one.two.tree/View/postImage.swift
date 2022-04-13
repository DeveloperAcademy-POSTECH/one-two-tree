//
//  postImage.swift
//  one.two.tree
//
//  Created by rbwo on 2022/04/13.
//

import SwiftUI

struct postImage: View {
 //   let imggs : imgg
    let Images = ["IMG_002", "IMG_0003","IMG_0114","IMG_0165","IMG_0320"]
    
    var body: some View {
        //NavigationLink
        
       
//        ZStack {
//            Circle()
//                .fill(Color(.gray))
//                .aspectRatio(4/3, contentMode: .fit)
//
//            Image("post1")
//                .resizable()
//                .clipShape(Circle())
//                .scaledToFit()
//                .aspectRatio(contentMode: .fit)
//                .layoutPriority(-1)
//        }
        
//        Image("post1")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 100, height: 100)
//            .clipShape ( Circle ())
//            .shadow ( radius: 10 )
//            .overlay ( Circle () .stroke ( Color .green , lineWidth : 2 ))
//        imggs.image
//            .resizable()
//            .frame(width: 100, height: 100)
//            .clipShape(Circle())
//            .shadow(radius: 10)
//            .overlay(Circle().stroke(Color.green, lineWidth: 2))
        
        Image(Images[Int.random(in: 0...4)])
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.green, lineWidth: 2))
    }
}
//
//struct postImage_Previews: PreviewProvider {
//    static var previews: some View {
//        postImage()
//    }
//}
