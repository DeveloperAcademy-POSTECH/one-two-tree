//
//  treeInformation.swift
//  team3_prototype2
//
//  Created by rbwo on 2022/04/07.
//

import SwiftUI

struct treeInformation: View {
    @State private var treeTitle: String = "Food & Drink"
    @State private var treeDescription: String = "먹는거 올리는 나무"
    @State private var treeUsers: String = "Hongki, Dale, Raven"
    
    @State private var showingTextEdit = false
    
    @State var showSheet: Bool = false
    
    @State var showAlert = true
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Rectangle()
                    .path(in: CGRect(x:0, y: 0 - geometry.safeAreaInsets.top,
                                     width:geometry.size.width,
                                     height: geometry.size.height * 1.3))
                    .foregroundColor(Color(red: 250 / 255, green: 242 / 255, blue: 218 / 255))
                    .ignoresSafeArea()
//                    .fill(
//
//                        .linearGradient(
//                            Gradient(colors: [.green, .mint]),
//                            startPoint: .init(x: 0, y: 0),
//                            endPoint: .init(x: 1, y: 1)
//                        )
//                    )
            }
            VStack{
                Spacer()
                    //Image("Polycount Forum")

                        GeometryReader { geomerty in
                            VStack( alignment: .center, spacing: 20){
                                Spacer()

                                Spacer()
                                Spacer()
                                HStack{
                                    Spacer()
                                    
                                    Image("l.circle")
                                    Text("36")
                                        .foregroundColor(.red)
                                    
                                    Spacer()
                                    
                                    Image("p.circle")
                                    Text("3421")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                    
                                    Image("x.circle")
                                    Text("59%")
                                        .foregroundColor(.purple)
                                    Spacer()
                                }
                                ZStack{
                                    Text(treeTitle)
                                         .font(.title)
                                         .bold()
                                         .foregroundColor(Color(red: 142 / 255, green: 151 / 255, blue: 117 / 255))
                                    HStack{
                                        Spacer()
                                        if showingTextEdit {
                                            Image("pencil 2")
                                                .onTapGesture {
                                                    self.viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                                                        ModalPopUpView(txt:$treeTitle)
                                                    }
                                                }
                                        } else {
                                            Image("pencil 2")
                                                .hidden()
                                        }
                                        
                                    }.padding(.trailing)
                                   
                                }

                                Image("k식물-7")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geomerty.size.width, height: geomerty.size.height*0.6)
                                //Spacer()
                                
                                VStack{
                                    HStack{
                                        Text("Users: ")
                                            .font(.title2)
                                            .foregroundColor(Color(red: 142 / 255, green: 151 / 255, blue: 117 / 255))
                                        Text(treeUsers)
                                            .font(.title2)
                                            .foregroundColor(Color(red: 142 / 255, green: 151 / 255, blue: 117 / 255))
                                        Spacer()
//                                        if showingTextEdit {
//                                            Image("pencil-1")
//                                                .onTapGesture {
//                                                    self.viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
//                                                        ModalPopUpView(txt:$treeUsers)
//                                                    }
//                                                }
//                                               .padding(.trailing)
//                                        } else {
//                                            Image("pencil-1")
//                                                .hidden()
//                                        }
                                        
                                    }.padding(.leading)
                                    
                                    HStack{
                                        Text("Description : ")
                                            .font(.title2)
                                            .foregroundColor(Color(red: 142 / 255, green: 151 / 255, blue: 117 / 255))
                                        Text(treeDescription)
                                            .font(.title2)
                                            .foregroundColor(Color(red: 142 / 255, green: 151 / 255, blue: 117 / 255))
                                        Spacer()
                                        if showingTextEdit {
                                            Image("pencil 2")
                                                .onTapGesture {
                                                    self.viewControllerHolder?.present(style: .overCurrentContext, transitionStyle: .crossDissolve) {
                                                        ModalPopUpView(txt:$treeDescription)
                                                    }
                                                }
                                               .padding(.trailing)
                                        } else {
                                            Image("pencil 2")
                                                .hidden()
                                        }
                                        
                                    }.padding(.leading)
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Button(action: {
                                            if showingTextEdit {
                                                self.showingTextEdit = false
                                            } else {
                                                self.showingTextEdit = true
                                            }
                                        }){
                                            Image("gear.circle")
                                        }

                                    }.padding()
                                }
                        }
                        
                }
                //.navigationBarHidden(true)
                
            }
            .edgesIgnoringSafeArea(.top)
        } 
       
    }
}


struct treeInformation_Previews: PreviewProvider {
    static var previews: some View {
        treeInformation()
    }
}
