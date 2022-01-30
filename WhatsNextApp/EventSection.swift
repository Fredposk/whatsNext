//
//  EventSection.swift
//  WhatsNextApp
//
//  Created by Frederico Kuckelhaus on 30.01.22.
//

import SwiftUI
import EventKit

struct EventSection: View {

    let name: String
    let events: [EKEvent]

    var body: some View {
        Section(name) {
            if events.isEmpty {
                Text("Empty")
            } else {
                ForEach(events, id: \.calendarItemIdentifier, content: EventRow.init)
            }
        }
    }
}

//struct EventSection_Previews: PreviewProvider {
//    static var previews: some View {
//        EventSection()
//    }
//}
