//
//  forest.swift
//  prototype
//
//  Created by apple developer academy on 2022/04/07.
//

import SwiftUI

struct ForestView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Home()) {
                Text("Forest sample view")
            }.navigationTitle("")
        }
    }
}



struct ForestView_Previews: PreviewProvider {
    static var previews: some View {
        ForestView()
    }
}
