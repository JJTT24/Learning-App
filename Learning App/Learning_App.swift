//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Jontrell Foster II on 10/20/21.
//

import SwiftUI

@main
struct Learning_App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
