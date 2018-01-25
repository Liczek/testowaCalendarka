//
//  ViewController.swift
//  KalendarzTesty
//
//  Created by Paweł Liczmański on 24.01.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import Cocoa
import EventKit

class ViewController: NSViewController {
	
	let eventStore = EKEventStore()
	var calendars: [EKCalendar] = [EKCalendar]()
	
	
	@IBOutlet weak var e1textLabel: NSTextField!
	@IBOutlet weak var e2textLabel: NSTextField!
	@IBOutlet weak var e3textLabel: NSTextField!
	
	@IBAction func EventsLoading(_ sender: NSButton) {
		eventsConfigure()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
	}
	
	override func viewDidAppear() {
		super.viewDidAppear()
		
		checkPermission()
		
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	func eventsConfigure() {
		e1textLabel.stringValue = "Urodziny Dura"
		e2textLabel.stringValue = "Wyjazd do Albani"
		e3textLabel.stringValue = "Wakacje w Gdyni"
	}
	
	func checkPermission() {
		switch EKEventStore.authorizationStatus(for: .event) {
		case .authorized:
			print("User agree with therms")
			self.loadData()
		case .notDetermined:
			print("You need to ask for permission")
			eventStore.requestAccess(to: .event, completion: { (isAllowed, error) in
				if let error = error {
					print(error.localizedDescription)
				} else {
					if isAllowed {
						self.loadData()
					}
				}
			})
		case .restricted, .denied:
			print("Not alowed")
		}
	}
	
	func loadData() {
		print("Start Loading Calendar")
		calendars = eventStore.calendars(for: .event)
		
		
		for calendar in calendars {
			print("\nCalendar name: \(calendar.title)\nCalendar color: \(calendar.color) \nCalendar identifier: \(calendar.calendarIdentifier)\n\n")

		}
		if  calendars.count > 1 {
			let secondCalendarIdentifier = calendars[1].calendarIdentifier
			let testowyCalendar = eventStore.calendar(withIdentifier: secondCalendarIdentifier)
			
			print("Second Calendar Name: \(testowyCalendar!.title)")
			print(testowyCalendar!)
		} else {
			print("There is less calendars than 2")
		}
		

		
	}
	
	


}

