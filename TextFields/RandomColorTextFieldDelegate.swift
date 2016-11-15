//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Mike Huffaker on 11/15/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit
import GameKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate
{
    func randomColor() -> UIColor
    {
        // Use Game Kit random number generator because its more interesting than arc4 random and
        // getting random floats will result in a lot of different possible color combinations
        let randomSource = GKMersenneTwisterRandomSource()
        
        let randomGenerator = GKRandomDistribution( randomSource: randomSource, lowestValue: 1, highestValue: 100 )
        let redValue = CGFloat( randomGenerator.nextUniform() )
        let greenValue = CGFloat( randomGenerator.nextUniform() )
        let blueValue = CGFloat ( randomGenerator.nextUniform() )

        print ( "Red: ", redValue )
        print ( "Green: ", greenValue )
        print ( "Blue: ", blueValue )
        
        return UIColor( red: redValue, green: greenValue, blue: blueValue, alpha: 1.0 )
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String ) -> Bool
    {
        textField.textColor = randomColor()
        return true
    }
}
