//
//  Model.swift
//  Göteborg Tid
//
//  Created by Ahamd Al-Said Ahamd on 2017-07-01.
//  Copyright © 2017 Ahamd Al-Said Ahamd. All rights reserved.
//

import Foundation

class prayername {
    var _Fajer: String!
    var _Shuruq:String!
    var _Dhuhur:String!
    var _Asr:String!
    var _Magrib:String!
    var _Isha:String!
    
    var Fajer: String {
        if _Fajer == nil {
            _Fajer = ""
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "hh:mm"
        dateformatter.timeStyle = .medium
        return _Fajer
        
    }
    var Shuruq: String {
        if _Shuruq == nil {
            _Shuruq = ""
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "hh:mm"
        dateformatter.timeStyle = .medium
        return _Shuruq
        
    }
    
    var Dhuhur: String {
        if _Dhuhur == nil {
            _Dhuhur = ""
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "hh:mm"
        dateformatter.timeStyle = .medium
        return _Dhuhur
        
    }
    
    var Asr: String {
        if _Asr == nil {
            _Asr = ""
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "hh:mm"
        dateformatter.timeStyle = .medium
        return _Asr
        
    }
    var Magrib: String {
        if _Magrib == nil {
            _Magrib = ""
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "hh:mm"
        dateformatter.timeStyle = .medium
        
        return _Magrib
    }
    
    var Isha: String {
        if _Isha == nil {
            _Isha = ""
        }
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "hh:mm"
        dateformatter.timeStyle = .medium
        return _Isha
        
    }
    
    init (Fajer:String,Shuruq:String,Dhuhur:String,Asr:String,Magrib:String,Isha:String){
        self._Fajer = Fajer
        self._Shuruq = Shuruq
        self._Dhuhur = Dhuhur
        self._Asr = Asr
        self._Magrib = Magrib
        self._Isha = Isha
        
        
        
    }
    
}
