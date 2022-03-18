//
//  p06_runny_widget.swift
//  p06-runny-widget
//
//  Created by Bailey Van Wormer on 3/17/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), milesRan: 0.0)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), milesRan: 0.0)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let numMilesRan: Double = MilesRanStore.fetchMiles()
        
        let entry = SimpleEntry(date: Date(), milesRan: numMilesRan)
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    var milesRan: Double
}

struct p06_runny_widgetEntryView: View {
    var entry: SimpleEntry

    var body: some View {
        Text("\(entry.milesRan) mi.")
    }
}

@main
struct p06_runny_widget: Widget {
    let kind: String = "p06_runny_widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            p06_runny_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct p06_runny_widget_Previews: PreviewProvider {
    static var previews: some View {
        p06_runny_widgetEntryView(entry: SimpleEntry(date: Date(), milesRan: 0.0))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
