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
    @IBOutlet weak var SymbolsLabel: UILabel!
    @IBOutlet weak var secondnamelabel: UILabel!
    @IBOutlet weak var secondnameswitch: UISwitch!
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var shareSheet: UIBarButtonItem!
    
	var copyGirlNames : NSArray = NSArray()
	var copyBoyNames : NSArray = NSArray()
	
	var isGirl : Int = 1
	var randomBoy : Int = 0
	var randomGirl : Int = 0
		
		
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let copiedGirlNames: GirlNames = GirlNames()
		let copiedBoyNames: BoyNames = BoyNames()
		copyGirlNames = copiedGirlNames.girlnames
		copyBoyNames = copiedBoyNames.boynames
        secondnamelabel.isHidden = true
        secondnameswitch.isOn = false
        self.view.addSubview(toolbar)
 
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
            GirlorBoyButton.setTitleColor(UIColor.magenta, for: .normal)
		}
		
		if isGirl == 1{
			GirlorBoyButton.setTitle("Boy", for: .normal)
            GirlorBoyButton.setTitleColor(UIColor.blue, for: .normal)
			
		}
		
		isGirl = isGirl + 1
		
		if isGirl == 2{
			isGirl = 0
			
		}
		
		chooseName()
        symbols()
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
    func symbols(){
        if isGirl == 0 {
            SymbolsLabel.text = "♀"
            SymbolsLabel.textColor = UIColor.magenta
        }
        else {
            SymbolsLabel.text = "♂"
            SymbolsLabel.textColor = UIColor.blue
        }
    }
    
    @IBAction func switchuse(_ sender: UISwitch) {
        if (sender.isOn == true){
            secondnamelabel.isHidden = false
            secondName()
        }
        else {
            secondnamelabel.isHidden = true
        }
    }
        func secondName(){
            if isGirl == 0{
                randomGirl = Int(arc4random_uniform(UInt32(copyGirlNames.count)))
                secondnamelabel.text = "\(copyGirlNames[randomGirl])"
            }
            
            if isGirl == 1{
                randomBoy = Int(arc4random_uniform(UInt32(copyBoyNames.count)))
                secondnamelabel.text = "\(copyBoyNames[randomBoy])"
            }
        }
    
    @IBAction func shareSheet(_ sender: AnyObject) {
        
        
        let firstActivityItem = "Text you want"
        let secondActivityItem : NSURL = NSURL(string: "http//:urlyouwant")!
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)
        
        
        // Anything you want to exclude
        activityViewController.excludedActivityTypes = [
            UIActivityType.postToWeibo,
            UIActivityType.print,
            UIActivityType.saveToCameraRoll,
            UIActivityType.addToReadingList,
            UIActivityType.postToFlickr,
            UIActivityType.postToVimeo,

        ]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}
