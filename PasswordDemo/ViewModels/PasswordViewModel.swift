//
//  PasswordViewModel.swift
//  PasswordDemo
//
//  Created by Oscar Artemio Brito Ortiz on 21/05/26.
//

import Foundation
import Combine

class PasswordViewModel: ObservableObject{
    
    @Published var password:String = "" {
        didSet {
            checkStrength()
        }
    }
    @Published var passwordStrength:PasswordStrength = .invalid
    
    func checkStrength(){
        if password.isEmpty {
            
            passwordStrength = .invalid
            
        }else if password.count < 6{
            
            passwordStrength = .weak
            
        }else if password.count >= 8 && containsNumber(password){
            
            passwordStrength = .strong
            
        }else{
            
            passwordStrength = .medium
        }
        
    }
    
    
    private func containsNumber(_ text:String) -> Bool{
        
        for char in text{
            if char.isNumber{
                return true
            }
        }
        
        return false
    }
}
