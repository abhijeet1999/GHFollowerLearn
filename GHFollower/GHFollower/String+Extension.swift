//
//  String+Extension.swift
//  GHFollower
//
//  Created by Abhijeet Cherungottil on 1/20/25.
//

import Foundation

extension String  {
    
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATHSES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordFormat = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
        let passwordPredicate = NSPredicate(format: "SELF MATHSES %@", passwordFormat)
        return passwordPredicate.evaluate(with: self)
    }
}
