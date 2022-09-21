//
//  CalendarViewController.swift
//  UICalendarViewExample
//
//  Created by SwiftMan on 2022/09/21.
//

import UIKit

class CalendarViewController: UIViewController {
  let calendarView = UICalendarView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCalendar()
  }
  
  private func setupCalendar() {
    calendarView.translatesAutoresizingMaskIntoConstraints = false
    calendarView.calendar = .current
    calendarView.locale = .current
    calendarView.fontDesign = .rounded
    calendarView.delegate = self
    calendarView.layer.cornerRadius = 12
    calendarView.backgroundColor = .systemBackground
    calendarView.availableDateRange = DateInterval(start: .now, end: .distantFuture)
    
    calendarView.selectionBehavior = UICalendarSelectionSingleDate(delegate: self)
    
    view.addSubview(calendarView)
    
    NSLayoutConstraint.activate([
      calendarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
      calendarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
      calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    ])
  }
}

extension CalendarViewController: UICalendarViewDelegate {
  func calendarView(_ calendarView: UICalendarView,
                    decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
    print("\(#function) dateComponents: \(dateComponents)")
    return nil
  }
}

extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
  func dateSelection(_ selection: UICalendarSelectionSingleDate,
                     didSelectDate dateComponents: DateComponents?) {
    print("\(#function) dateComponents: \(String(describing: dateComponents))")
  }
}

extension CalendarViewController: UICalendarSelectionMultiDateDelegate {
  func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                          didSelectDate dateComponents: DateComponents) {
    print("\(#function) selection: \(selection) dateComponents: \(dateComponents)")
  }
  
  func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                          didDeselectDate dateComponents: DateComponents) {
    print("\(#function) selection: \(selection) dateComponents: \(dateComponents)")
  }
}
