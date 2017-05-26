//
//  ViewController.swift
//  Baby Name Generator
//
//  Created by sarcrates on 5/4/17.
//  Copyright © 2017 sarcrates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var BabyNameGenerator: UILabel!
	@IBOutlet weak var NameLabel: UILabel!
	@IBOutlet weak var AnotherNameButton: UIButton!
	@IBOutlet weak var GirlorBoyButton: UIButton!

	var copyGirlNames : NSArray = NSArray()
	var copyBoyNames : NSArray = NSArray()
	
	var isGirl : Int = 1
	var randomBoy : Int = 0
	var randomGirl : Int = 0
		
		
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		var copiedGirlNames: GirlNames = GirlNames()
		var copiedBoyNames: BoyNames = BoyNames()
		copyGirlNames = copiedGirlNames.girlnames
		copyBoyNames = copiedBoyNames.boynames
		
		
	}
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func AnotherNameAction() {
		
		chooseName()
	}
	
	@IBAction func GirlBoyButtonAction() {
		chooseGirlOrBoy()
	}

	func chooseGirlOrBoy(){
		
		if isGirl == 0 {
			GirlorBoyButton.setTitle("Girl", for: .normal)
		}
		
		if isGirl == 1{
			GirlorBoyButton.setTitle("Boy", for: .normal)
			
		}
		
		isGirl = isGirl + 1
		
		if isGirl == 2{
			isGirl = 0
			
		}
		
		chooseName()
	}
	func chooseName(){
		
		if isGirl == 0{
			randomGirl = Int(arc4random_uniform(UInt32(copyGirlNames.count)))
			NameLabel.text = "\(copyGirlNames[randomGirl])"
		}
		
		if isGirl == 1{
			randomBoy = Int(arc4random_uniform(UInt32(copyBoyNames.count)))
			NameLabel.text = "\(copyBoyNames[randomBoy])"
			
		}
		
	}
}

