//
//  Loans.swift
//  MyUtilityApp
//
//  Created by matias on 2017-01-16.
//  Copyright © 2017 matias Kahr. All rights reserved.
//

import UIKit

class Loan : NSObject, NSCoding {

    //MARK: properties
    var name : String
    var amount : Double
    
    //MARK: Paths for archiving data across sessions
    static var DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    static let ArchiveURL = DocumentsDirectory[0].appendingPathComponent("Loans")
    
    //MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let amountKey = "amounts"
        
    }
    
    //This is what allows an instance of a loan to be initialized with the name and amount owed
     init(name: String, amount: Double) {
        
        self.name = name
        self.amount = amount
        
    }
    
    //This lets me save information about a loan on a disk
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(amount, forKey: PropertyKey.amountKey)
    }
    
    //This function allows me to load information
    required convenience init?(coder aDecoder : NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let amount = aDecoder.decodeObject(forKey: PropertyKey.amountKey) as! Double
        
        self.init(name: name, amount: amount)
    }
    
    
}
