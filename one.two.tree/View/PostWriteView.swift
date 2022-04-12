//
//  PostWriteView.swift
//  ravenhongki
//
//  Created by KiWoong Hong on 2022/04/11.
//

import SwiftUI

struct PostWriteView: View {
    @State private var showPhotoSheet = false
    @State private var image: UIImage? = nil
    @Binding var showingSheet: Bool
    @Binding var title: String
    @Binding var contents: String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showingSheet = false
                }, label: {
                    Text("취소")
                })
                Spacer()
                Text("Tree Name")
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("등록")
                })
            }
            
            TextField("제목", text: $title)
                .font(.largeTitle)
            TextEditor(text: $contents)
                .font(.body)
            Spacer()
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200)
            }
            
            HStack {
                Button(action: { showPhotoSheet = true }) {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                .padding()
                .fullScreenCover(isPresented: $showPhotoSheet) {
                    PhotoPicker(filter: .images, limit: 2) { results in
                        PhotoPicker.convertToUIImageArray(fromResults: results) { (imagesOrNil, errorOrNil) in
                            if let error = errorOrNil {
                                print(error)
                            }
                            if let images = imagesOrNil {
                                if let first = images.first {
                                    print(first)
                                    image = first
                                }
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                
            }
                
        }
    }
}

struct PostWriteView_Previews: PreviewProvider {
    @State static var showingSheet: Bool = true
    @State static var title: String = ""
    @State static var contents: String = ""
    static var previews: some View {
        PostWriteView(showingSheet: $showingSheet, title: $title, contents: $contents)
        
    }
}
