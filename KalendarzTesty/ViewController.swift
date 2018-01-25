//
//  ViewController.swift
//  KalendarzTesty
//
//  Created by Paweł Liczmański on 24.01.2018.
//  Copyright © 2018 Paweł Liczmański. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	
	@IBOutlet weak var e1textLabel: NSTextField!
	@IBOutlet weak var e2textLabel: NSTextField!
	@IBOutlet weak var e3textLabel: NSTextField!
	
	@IBAction func EventsLoading(_ sender: NSButton) {
		eventsConfigure()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
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


}

