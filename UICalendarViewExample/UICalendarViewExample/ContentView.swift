//
//  ContentView.swift
//  UICalendarViewExample
//
//  Created by SwiftMan on 2022/09/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Color.pink.ignoresSafeArea()
      CalendarView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
