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
            Path { path in
            path.move(to: CGPoint(x: 0, y: -100))
            path.addLine(to: CGPoint(x: 0, y: 1000))
            path.addLine(to: CGPoint(x: 490, y: 1000))
            path.addLine(to: CGPoint(x: 490, y: -100))
            }
            .fill(
            .linearGradient(
            Gradient(colors: [.yellow, .mint]),
            startPoint: .init(x: 0, y: 0),
            endPoint: .init(x: 1, y: 0.5)
            )
            )
            }
        VStack {
            // header
            
            NavigationLink(destination: treeinfo()){
                VStack{
                    Image("logo")
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 2)
                        }
                       // .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                    Text("tree title")
                        .font(.title2)
                        .foregroundColor(.black)
                    
                }
                
            }
                
            Spacer()
            
            ScrollView {
                VStack() {
                LazyVGrid(columns: columns, spacing: 20, content: {
                    ForEach(pageData.urls){page in
                        WebView(url: page.url)
                            .frame(width:130, height: 200)
                            .cornerRadius(15)
                            .contextMenu {
                                
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
                            
                    }
                })
                .padding()
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
