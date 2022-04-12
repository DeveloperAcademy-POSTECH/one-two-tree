//
//  ShowLicenseAgreement.swift
//  prototype
//
//  Created by 김혜수 on 2022/04/11.
//

import SwiftUI

struct TreeCreate: View {
    @State private var showingSheet: Bool = false
    
    @State var name: String = ""
    @State var content: String = ""
    enum Category: String, CaseIterable, Identifiable {
        case health, life, culture
        var id: Self { self }
    }
    
    enum Range: String, CaseIterable, Identifiable {
        case 전체공개, 그룹내공개, 비공개
        var id: Self { self }
    }

    @State private var selectedCategory: Category = .life
    @State private var selectedRange: Range = .그룹내공개
    
    var treeData = ["cactus", "palmTree", "tree"]
    
    @State var i: Int = 1
    
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("ground의 나무생성하기(+)")
        }
        .fullScreenCover(isPresented: $showingSheet) {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.showingSheet = false
                    }, label: {
                        Image(systemName: "clear")
                            .frame(width: 100, height: 8)
                    })
                }
                
                HStack{
                    Button(action: {
                        if i > 0 {
                            self.i -= 1
                        } else {
                            i = treeData.count - 1
                        }
                        
                    }, label: {
                        Image(systemName: "arrowtriangle.left.fill").resizable()
                            .frame(width: 50, height: 50)
                    })
                    Image(treeData[i])
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 2)
                        }
                        .background(Color.yellow)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                    
                    Button(action: {
                        if i < treeData.count - 1 {
                            self.i += 1
                        } else {
                            i = 0
                        }
                        
                    }, label: {
                        Image(systemName: "arrowtriangle.right.fill").resizable()
                            .frame(width: 50, height: 50)
                    })
                }
                .padding()
                
                TextField("나무에게 이름을 지어주세요.", text: $name)
                .multilineTextAlignment(.center)
                //.textFieldStyle(.roundedBorder)
                .clipShape(Rectangle())
                .frame(width: 230, height: 50, alignment:.center)
                .foregroundColor(Color.black)
                .background(Color.brown)
                .cornerRadius(15)
                
                
                //Category
                Text("나무의 카테고리를 선택해주세요.")
                Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue.capitalized)
                        }
                    }.pickerStyle(.segmented)
                    .padding()
                
                Text("나무의 공개범위를 선택해주세요.")
                Picker("Range", selection: $selectedRange) {
                        ForEach(Range.allCases) { range in
                            Text(range.rawValue.capitalized)
                        }
                    }.pickerStyle(.segmented)
                    .padding()
                
                
                

                
                
                TextField("우리들 나무는 무엇인가요?", text: $content)
                    .multilineTextAlignment(.center)
                    .clipShape(Rectangle())
                    .frame(width: 300, height: 150, alignment:.center)
                    .foregroundColor(Color.white)
                    .background(Color.mint)
                    .cornerRadius(15)
                    .padding()
                
                Button(action: {
                    self.showingSheet = false
                }, label: {
                    Image("shovel")
                        .resizable().frame(width: 40, height: 40)
                    .frame(width: 50, height: 50).padding()
                }).overlay{
                    Circle().stroke(.yellow, lineWidth: 3)
                }
                
            }
        }
    }

    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct TreeCreate_Previews: PreviewProvider {
    static var previews: some View {
        TreeCreate()
    }
}
