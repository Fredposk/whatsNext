//
//  ContentView.swift
//  WhatsNextApp
//
//  Created by Frederico Kuckelhaus on 30.01.22.
//

import SwiftUI
import EventKit

struct ContentView: View {

    @State private var eventStore = EKEventStore()
    @State private var storeAccessGranted = false

    @State private var todayEvents = [EKEvent]()
    @State private var tomorrowEvents = [EKEvent]()
    @State private var laterEvents = [EKEvent]()

    var body: some View {
        List {
            EventSection(name: "Today", events: todayEvents)
            EventSection(name: "Tomorrow", events: tomorrowEvents)
            EventSection(name: "Later", events: laterEvents)
        }
            .onAppear {
                eventStore.requestAccess(to: .event) { granted, error in
                    storeAccessGranted = granted

                    if granted {
                        todayEvents = events(from: Date.now, to: Date.endOfToday)
                        tomorrowEvents = events(from: Date.startOfTomorrow, to: Date.endOfTomorrow)
                        laterEvents = events(from: Date.startOfLater, to: Date.endOfLater)
                        

                    }
                }
            }
    }

    func events(from: Date, to: Date) -> [EKEvent] {
        let predicate = eventStore.predicateForEvents(withStart: from, end: to, calendars: nil)
        return eventStore.events(matching: predicate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
