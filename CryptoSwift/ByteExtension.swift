//
//  ByteExtension.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 07/08/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

import Foundation

extension Byte {
    
    /** array of bits */
    internal func bits() -> [Bool] {
        let totalBitsCount = sizeof(Byte) * 8
        
        var bitsArray:[Bool] = [Bool](count: totalBitsCount, repeatedValue: false)
        
        for j in 0..<totalBitsCount {
            let bitVal:Byte = 1 << UInt8(totalBitsCount - 1 - j)
            let check = self & bitVal
            
            if (check != 0) {
                bitsArray[j] = true;
            }
        }
        return bitsArray
    }
    
    internal func bits() -> String {
        var s = String()
        let arr:[Bool] = self.bits()
        for (idx,b) in enumerate(arr) {
            s += (b ? "1" : "0")
            if ((idx + 1) % 8 == 0) { s += " " }
        }
        return s
    }
}