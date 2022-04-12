//
//  newPostButton.swift
//  ravenhongki
//
//  Created by KiWoong Hong on 2022/04/12.
//

import SwiftUI

struct NewPostButton: View {
    @State private var showingSheet: Bool = false
    @State private var title: String = ""
    @State private var contents: String = ""
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.showingSheet.toggle()
            }, label: {
                Image(systemName: "plus.app")
                    .resizable()
                    .frame(width: 35, height: 35)
                
            })
            .padding()
            .shadow(radius: 5)
            .fullScreenCover(isPresented: $showingSheet) {
                PostWriteView(showingSheet: $showingSheet, title: $title, contents: $contents)
            }
            .padding()
        }
    }
}

struct NewPostButton_Previews: PreviewProvider {
    static var previews: some View {
        NewPostButton()
    }
}
