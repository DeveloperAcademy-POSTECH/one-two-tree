//
//  PageViewModel.swift
//  prototype
//
//  Created by 김혜수 on 2022/04/07.
//

import SwiftUI

class PageViewModel: ObservableObject{

    //Selected tab
    @Published var selectedTab = "tabs"
    
    @Published var urls = [
        Page(url: URL(string: "https://www.naver.com")!),
        Page(url: URL(string: "https://www.naver.com")!),
        Page(url: URL(string: "https://www.naver.com")!),
        Page(url: URL(string: "https://www.naver.com")!),
        Page(url: URL(string: "https://www.naver.com")!),
        Page(url: URL(string: "https://www.naver.com")!),
        Page(url: URL(string: "https://www.naver.com")!),
        Page(url: URL(string: "https://www.naver.com")!),
        Page(url: URL(string: "https://www.naver.com")!),
    ]
}
