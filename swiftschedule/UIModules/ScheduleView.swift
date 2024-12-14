//
//  ScheduleView.swift
//  swiftschedule
//
//  Created by artem alanov on 16.11.2024.
//

import SwiftUI

struct ScheduleView: View {
    let scheduleWeek: ScheduleWeek = ScheduleWeek.example()
    var body: some View {
        let scheduleDays: [ScheduleGroup] = scheduleWeek.daySlots
        let adaptive = [
            GridItem(.adaptive(minimum: 10, maximum: 300))
        ]
        NavigationStack {
            LazyHGrid(rows: adaptive, alignment: .center, spacing: 15) {
                    Text("#")
                    Text("Тип")
                    Text("Название предмета")
                    Text("Преподаватель")
                    Text("Кабинет")
                    Text("Время")
            }
            .frame(width: .infinity, height: 10)
            .foregroundColor(Color(.controlAccentColor))
            .font(.caption)
            .padding(.top, 8)
            List(scheduleDays) { day in
                VStack(alignment: .leading) {
                    Text(day.dayName)
                        .font(.headline)
                        .padding(.leading, 5)
                        .padding(.top, 7)
                    Divider()
                    ForEach(day.lessonsTable){ lesson in
                        HStack {
                            LazyVGrid(columns: adaptive, alignment: .leading) {
                                LazyHGrid (rows: adaptive, alignment: .center, spacing: 30) {
                                    Text("\(lesson.itemid)")
                                        .font(.subheadline)
                                    Text(lesson.lessonType.rawValue)
                                        .font(.subheadline)
                                    Text(lesson.subjectName)
                                        .font(.subheadline)
                                    Text(lesson.teacherName)
                                        .font(.caption)
                                    Text(lesson.classRoom)
                                        .font(.caption)
                                    if let timeSlot = lesson.timeSlot {
                                        Text("\(timeSlot.startTime, formatter: timeFormatter) - \(timeSlot.endTime, formatter: timeFormatter)")
                                                .font(.caption)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical, 5)
                }
                .background(Color(.controlBackgroundColor), in: RoundedRectangle(cornerRadius: 10))
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("SwiftSchedule")
    }
}

private let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}()

#Preview {
    ScheduleView()
}
