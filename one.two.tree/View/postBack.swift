//
//  postBack.swift
//  one.two.tree
//
//  Created by rbwo on 2022/04/13.
//

import SwiftUI

struct postBack: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(red: 250 / 255, green: 242 / 255, blue: 218 / 255))
            .frame(width: 360, height: 150)
            .padding()
    }
}

struct postBack_Previews: PreviewProvider {
    static var previews: some View {
        postBack()
    }
}
