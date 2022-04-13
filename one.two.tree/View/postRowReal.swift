//
//  postRowReal.swift
//  one.two.tree
//
//  Created by rbwo on 2022/04/13.
//

import SwiftUI

struct postRowReal: View {
    var body: some View {
        ZStack{
            postBack()
            postRow()
            HStack{
                Spacer()
                postImage()
                    .padding(.trailing, 35)

            }
        }
    }
}

struct postRowReal_Previews: PreviewProvider {
    static var previews: some View {
        postRowReal()
    }
}
