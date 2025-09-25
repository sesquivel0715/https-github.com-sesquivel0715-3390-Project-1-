//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Stephanie Esquivel on 9/24/25.

import SwiftUI

struct Habit: Identifiable {
    let name: String
    let date: Date
    let id = UUID()
    
    //date display
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        return formatter.string(from: date)
    }
}

struct ContentView: View {
    //list of habits and text input
    @State private var habits: [Habit] = []
    @State private var newHabitName = ""
    
    var body: some View {
        VStack(spacing: 10) {
            
            HStack(spacing: 10) {
                TextField("Enter habit", text: $newHabitName)
                    .frame(width: 300)
                
                Button(action: addHabit) {
                    Text("Add Habit")
                        
                }
                .buttonStyle(.borderedProminent)
                .background(Color.pink)
                .cornerRadius(5)
            }
            .padding()
            
            //table
            HStack(spacing: 0) {
                
                
                Table(habits) {
                    TableColumn("Habit", value: \.name)
                }
                
                //divider
                Divider()
                    .frame(width: 2)
                    .overlay(.pink)
                
                Table(habits) {
                    TableColumn("Date/Time") { habit in
                        Text(habit.formattedDate)
                    }
                }
            }
        
        }
        .padding()
    }
    //if button is pressed
    private func addHabit() {
        guard !newHabitName.isEmpty else { return }
        let habit = Habit(name: newHabitName, date: Date())
        habits.append(habit)
        //clear
        newHabitName = ""
    }
}

#Preview {
    ContentView()
}
