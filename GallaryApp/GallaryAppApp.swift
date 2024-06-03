//
//  GallaryAppApp.swift
//  GallaryApp
//
//  Created by student on 27/05/24.
//

import SwiftUI

@main
struct GallaryAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(picsViewModel: PicsviewModel())
        }
    }
}
