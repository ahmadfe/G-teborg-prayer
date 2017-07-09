//
//  prayerCell.swift
//  Göteborg Tid
//
//  Created by Ahamd Al-Said Ahamd on 2017-07-01.
//  Copyright © 2017 Ahamd Al-Said Ahamd. All rights reserved.
//

import UIKit

class prayCell: UITableViewCell {

    @IBOutlet weak var FajerTime: UILabel!

    @IBOutlet weak var ShuruqTime: UILabel!
    
    @IBOutlet weak var DuhurTime: UILabel!
    
    @IBOutlet weak var AserTime: UILabel!
    
    @IBOutlet weak var MaghribTime: UILabel!
    
    @IBOutlet weak var IshaTime: UILabel!
    
    
    var pray : prayername!
    
    func updateCell (pray:prayername) {
    self.pray = pray
        FajerTime.text = self.pray.Fajer.capitalized
        ShuruqTime.text = self.pray.Shuruq.capitalized
        DuhurTime.text = self.pray.Dhuhur.capitalized
        AserTime.text = self.pray.Asr.capitalized
        MaghribTime.text = self.pray.Magrib.capitalized
        IshaTime.text = self.pray.Isha.capitalized
    }
    

}
