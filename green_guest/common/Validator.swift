//
//  Validator.swift
//  green_guest
//
//  Created by İbrahim Alakbarov on 22.06.26.
//

class Validator {
    
    static func isValidPhone(_ phone: String) -> Bool {
        let cleaned = phone.filter { $0.isNumber }
        return cleaned.count == 9
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        return password.count >= 8
    }
}
