//
//  InterfaceController.swift
//  Dices WatchKit Extension
//
//  Created by Sergey Garazha on 3/3/16.
//  Copyright © 2016 self. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var picker: WKInterfacePicker!
    var selectedItem = 20
    let variants = [4,6,8,9,12,20,100]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        
        var items = [WKPickerItem]()
        for i in variants {
            let item = WKPickerItem()
            item.title = "\(i)"
            item.caption = "caption \(i)"
            items.append(item)
        }
        picker.setItems(items)
        picker.setSelectedItemIndex(5)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func roll() {
        let i = randInRange(1...selectedItem)
        resultLabel.setText("\(i)")
    }
    
    func randInRange(range: Range<Int>) -> Int {
        return  Int(arc4random_uniform(UInt32(range.endIndex - range.startIndex))) + range.startIndex
    }

    @IBAction func pickerUpdated(value: Int) {
        selectedItem = variants[value]
    }
}
