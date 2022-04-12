//
//  one_two_treeApp.swift
//  one.two.tree
//
//  Created by KoJeongseok on 2022/04/12.
//

import SwiftUI

@main
struct one_two_treeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
