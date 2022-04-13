//
//  Home.swift
//  prototype
//
//  Created by 김혜수 on 2022/04/07.
//

import SwiftUI


// journey part

// Custom Half Sheet Modifier.....
extension View {
    
    // Binding Show Variable...
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>,@ViewBuilder sheetView: @escaping ()->SheetView)->some View {
        
        // why we using overlay or background
        // bcz it will automatically use the swiftui frame Size only....
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(),showSheet: showSheet)
            )
    }
}

// UIkit Intergration...
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    
    let controller = UIViewController()
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        if showSheet {
            // Pressentin Modal View....
            
            let sheetController = UIHostingController(rootView: sheetView)
            
            uiViewController.present(sheetController, animated: true) {
                
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}

//

struct Home: View {
  // @EnvironmentObject var imgs : imggData
  // var imgData : [imgg]
  // let imgCount = 5
    
    var imggs = [
        "IMG_002", "IMG_0003","IMG_0114","IMG_0165","IMG_0320"
    ]
    
    @StateObject var pageData = PageViewModel()
    //Slide Animation
    @Namespace var animation
    //LongPressGesture
    @State var isComplete: Bool = false
   // @State var showSheet: Bool = false
    
    //Columns..
    let columns = Array(repeating: GridItem(.flexible(), spacing: 45), count: 3)
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Rectangle()
                    .path(in: CGRect(x:0, y: 0 - geometry.safeAreaInsets.top,
                                     width:geometry.size.width,
                                     height: geometry.size.height * 1.3))
                    .foregroundColor(Color(red: 81 / 255, green: 146 / 255, blue: 89 / 255))
            }
        VStack {

            NavigationLink(destination: treeInformation()){
                VStack{
                    Image("logo")
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 2)
                        }
                        .background(Color(red: 244 / 255, green: 238 / 255, blue: 169 / 255))
                        .clipShape(Circle())
                        .shadow(radius: 3)
                    Text("Tree Title")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(red: 226 / 255, green: 143 / 255, blue: 131 / 255))
                    
                }
                
            }
                
            Spacer()
            
            ScrollView {
                VStack() {
                    ForEach(imggs, id: \.self){i in
                        postRowReal()
                    }.contextMenu {
                        Button{
                            print("Update selected")
                        } label:{
                            Label("Update", systemImage: "pencil")
                        }
                        
                        Button{
                            print("Delete selected")
                        }label:{
                            Label("Delete", systemImage: "trash")
                        }
                    }


//                    postRowReal()
//                    postRowReal()
//                    postRowReal()
//                        .contextMenu {
//
//                            Button{
//                                print("Update selected")
//                            } label:{
//                                Label("Update", systemImage: "pencil")
//                            }
//
//                            Button{
//                                print("Delete selected")
//                            }label:{
//                                Label("Delete", systemImage: "trash")
//                            }
//                        }
                        
//                LazyVGrid(columns: columns, spacing: 20, content: {
//                    ForEach(pageData.urls){page in
//                        WebView(url: page.url)
//                            .frame(width:130, height: 200)
//                            .cornerRadius(15)
//                            .contextMenu {
//
//                                Button{
//                                    print("Update selected")
//                                } label:{
//                                    Label("Update", systemImage: "pencil")
//                                }
//
//                                Button{
//                                    print("Delete selected")
//                                }label:{
//                                    Label("Delete", systemImage: "trash")
//                                }
//                            }
//
//                    }
//                })
               
                }
            }
            
            NewPostButton()
            /*
                HStack {
                    Spacer()
                    Button(action: {
                        // show Sheet toggle
                        showSheet.toggle()
                        
                        
                    }, label: {
                        Image("plus.app")
//                        Image(systemName: "plus")
//                            .font(.largeTitle)
//                            .frame(width: 40, height: 40)
//                            .background(Color.brown)
//                            .clipShape(Circle())
//                            .foregroundColor(.white)
                    })
                        .padding()
                    .shadow(radius: 5)
                    .halfSheet(showSheet: $showSheet) {
                        
                        // Your Half Sheet View....
                        VStack {
                            Text ("게시글 작성 화면")
                                .font(.title.bold())
                        }
                        
                    }
                */
            
            
        }.navigationBarTitleDisplayMode(.inline)

          
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        //.background(Color.green.ignoresSafeArea(.all, edges: .all))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
