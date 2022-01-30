//
//  EventRow.swift
//  WhatsNextApp
//
//  Created by Frederico Kuckelhaus on 30.01.22.
//

import SwiftUI
import EventKit

struct EventRow: View {

    let event: EKEvent

    var body: some View {
        HStack {
            Text(event.title)
            Spacer()
            Text(eventDate)
        }
    }

    var eventDate: String {
        if Calendar.current.isDateInToday(event.startDate) || Calendar.current.isDateInTomorrow(event.startDate) {
            return event.startDate.formatted(date: .omitted, time: .shortened)
        } else {
            return event.startDate.formatted(.dateTime.weekday(.wide).hour().minute())
        }
    }
}

//
//struct EventRow_Previews: PreviewProvider {
//    static var previews: some View {
//        EventRow()
//    }
//}
