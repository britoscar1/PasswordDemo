//
//  PasswordViewModelTest.swift
//  PasswordStrengthDemoTests
//
//  Created by Oscar Artemio Brito Ortiz on 21/05/26.
//

import XCTest

@testable import PasswordDemo

final class PasswordViewModelTest: XCTestCase {

    private var sut:PasswordViewModel!

    override func setUp() {
        super.setUp()
        sut = PasswordViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_EmptyPasswordReturnsInvalid(){
        
        //Arrange
        let emptyPassword:String = ""
        
        //Act(execute)
        sut.password = emptyPassword
        sut.checkStrength()
        
        //Assert(if is expected)
        // Result   ,   Expected result
        
        XCTAssertEqual(sut.passwordStrength,.invalid)
    }
    
    func test_ShortPasswordReturnsWeak() {
        
        // Arrange
        let shortPassword = "abc"
        
        // Act
        sut.password = shortPassword
        
        // Assert
        XCTAssertEqual(sut.passwordStrength, .weak)
    }
    
    func test_PasswordWithoutNumberReturnsMedium() {
        
        // Arrange
        let mediumPassword = "password"
        
        // Act
        sut.password = mediumPassword
        
        // Assert
        XCTAssertEqual(sut.passwordStrength, .medium)
    }
    
    func test_LongPasswordWithNumberReturnsStrong() {
        
        // Arrange
        let strongPassword = "password1"
        
        // Act
        sut.password = strongPassword
        
        // Assert
        XCTAssertEqual(sut.passwordStrength, .strong)
    }

}
