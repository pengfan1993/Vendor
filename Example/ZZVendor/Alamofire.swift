//
//  Alamofire.swift
//  ZZVendor_Example
//
//  Created by coderP on 2021/2/1.
//  Copyright © 2021 pengfan. All rights reserved.
//

import UIKit
import ZZVendor
import Alamofire

@objc class Alamofire: NSObject,ZZAlamofireUtilities {
    @objc static func request(url: String) {
        post(IHURL.init(rawValue: url)!, parameter: nil, headerFields: nil, timeoutInterval: 10).responseJSON { (response) in
            print(response.result)
           
        }
    }
}

@objc class IHURL: NSObject,URLConvertible,RawRepresentable{
    typealias RawValue = String
    var rawValue: String
    required init?(rawValue: String) {
        self.rawValue = rawValue
    }
    func asURL() throws -> URL {
        return URL.init(string: rawValue)!
    }
}
