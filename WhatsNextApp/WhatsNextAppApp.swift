//
//  WhatsNextAppApp.swift
//  WhatsNextApp
//
//  Created by Frederico Kuckelhaus on 30.01.22.
//

import SwiftUI

@main
struct WhatsNextAppApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        
            Settings {
                EmptyView()
            }

    }
}
