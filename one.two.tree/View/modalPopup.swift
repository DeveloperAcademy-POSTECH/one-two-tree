//
//  test.swift
//  team3_prototype2
//
//  Created by rbwo on 2022/04/11.
//

import SwiftUI

struct ViewControllerHolder {
    weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder {
        return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
    }
}

extension EnvironmentValues {
    var viewController: UIViewController? {
        get { return self[ViewControllerKey.self].value }
        set { self[ViewControllerKey.self].value = newValue }
    }
}


extension UIViewController {
    func present<Content: View>(style: UIModalPresentationStyle = .automatic, transitionStyle: UIModalTransitionStyle = .coverVertical, @ViewBuilder builder: () -> Content) {
        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
        toPresent.modalPresentationStyle = style
        toPresent.modalTransitionStyle = transitionStyle
        toPresent.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, toPresent)
        )
        self.present(toPresent, animated: true, completion: nil)
    }
}

struct ModalPopUpView: View {
    @Binding var txt : String
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        VStack(alignment: .center) {
            HStack{
                Spacer()
                TextField("내용을 입력해 주세요", text: $txt)
                    .disableAutocorrection(true)
                Spacer()
            }
            
            HStack{
                Button(action: {
                    self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                }) {
                    Text("Cancel")
                }.foregroundColor(.red).padding(.bottom)
                Spacer()
                Button(action: {
                    self.viewControllerHolder?.dismiss(animated: true, completion: nil)
                }) {
                    Text("Change")
                }.foregroundColor(.blue).padding(.bottom)
            }
           
            
        }.background(Color.white).clipShape(RoundedRectangle(cornerRadius: 3.0)).frame(width: UIScreen.main.bounds.size.width - 32)
            .shadow(radius: 5)
    }
}

struct modalPopup : View {
    var body: some View {
        Text("hi")
    }
}
