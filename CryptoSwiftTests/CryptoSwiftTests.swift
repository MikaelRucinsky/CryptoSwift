//
//  CryptoSwiftTests.swift
//  CryptoSwiftTests
//
//  Created by Marcin Krzyzanowski on 06/07/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

import XCTest
import CryptoSwift

class CryptoSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOverflow() {
        var b:Byte = 128
        var shifted = (Byte)(b << 24)
    }
    
    func testIntExtension() {
        let i1:Int = 1024
        let i1Array = i1.bytes(32 / 8) // 32 bit
        let i1recovered = Int.withBytes(i1Array)
        
        XCTAssertEqual(i1, i1recovered, "Bytes conversion failed")
        
        let i2:Int = 1024
        let i2Array = i2.bytes(160 / 8) // 160 bit
        let i2recovered = Int.withBytes(i1Array)
        
        XCTAssertEqual(i2, i2recovered, "Bytes conversion failed")
    }
    
    func testMD5() {
        var data:NSData = NSData(bytes: [49, 50, 51] as [Byte], length: 3)
//        var data:NSData = NSData(bytes: [49, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 49, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50] as [Byte], length: 40)
        var md5data = data.md5()
        XCTAssertNotNil(md5data, "MD5 calculation failed")
        
        if let data = md5data {
            XCTAssertEqual(data.hexString, "202CB962AC59075B964B07152D234B70", "MD5 calculation failed");
        }
    }
    
//    func testSHA1() {
//        var data:NSData = NSData(bytes: [49, 50, 51] as [Byte], length: 3)
//        var sha1:NSData = data.sha1()
//        XCTAssertNotNil(sha1, "SHA1 calculation failed")
//        
//        var sha1String:String = sha1.toHexString()
//        XCTAssertEqualObjects(sha1String, "40BD001563085FC35165329EA1FF5C5ECBDBBEEF", "SHA1 calculation failed");
//    }
//
//    func testSHA512() {
//        var data:NSData = NSData(bytes: [49, 50, 51] as [Byte], length: 3)
//        var sha512:NSData = data.sha512()
//        XCTAssertNotNil(sha512, "SHA512 calculation failed")
//        
//        var sha512String:String = sha512.toHexString()
//        XCTAssertEqualObjects(sha512String, "3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2", "SHA512 calculation failed");
//    }
//
//    func testHashEnum() {
//        var data:NSData = NSData(bytes: [49, 50, 51] as [Byte], length: 3)
//        let md5 = CryptoHash.md5.hash(data);
//        var md5String:String = md5.toHexString();
//        XCTAssertEqualObjects(md5String, "202CB962AC59075B964B07152D234B70", "MD5 calculation failed");
//    }
    
}
