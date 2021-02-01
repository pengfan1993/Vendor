//
//  AlamofireUtilities.swift
//  Test
//
//  Created by coderP on 2021/1/7.
//  Copyright © 2021 coderP. All rights reserved.
//

import Foundation
import Alamofire

//发送请求的相关方法
public protocol ZZAlamofireUtilities {
}

fileprivate struct JSONParameterEncoding: ParameterEncoding {
    
    //设置超时默认为60
    var timeoutInterval: TimeInterval = 60
    var json: Any?
    
    //自定义请求头参数
    var headerFields: [String : String]?
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        guard let json = json else { return request }
        
        
       
        //设置请求超时
        request.timeoutInterval = self.timeoutInterval
        
        //设置默认的请求头
        if request.value(forHTTPHeaderField: "Content-Type") == nil {
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        //设置其它请求头信息
        if let header = headerFields{
            for (key, value) in header {
                 request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let data = try? JSONSerialization.data(withJSONObject: json, options: []) {
             request.httpBody = data
        }
       
        return request
    }
    
    
}

fileprivate struct RawDataParameterEncoding: ParameterEncoding {
    
    //设置超时默认为60
    var timeoutInterval: TimeInterval = 60
    var data: Data?
    
    //自定义请求头参数
    var headerFields: [String : String]?
       
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
       
        //设置请求超时
        request.timeoutInterval = self.timeoutInterval
        
        //设置默认的请求头
        if request.value(forHTTPHeaderField: "Content-Type") == nil {
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
         //设置其它请求头信息
        if let header = headerFields{
           for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
        }
        }
        
        request.httpBody = data
        return request
    }
    
    
}

public extension ZZAlamofireUtilities {
    
    /// 发送一个post请求
    /// - Parameters:
    ///   - url: 请求路径
    ///   - parameter: 参数
    ///   - headerFields: 请求头参数
    ///   - timeoutInterval: 超时
    /// - Returns: DataRequest实例对象
    static func post(_ url: URLConvertible, parameter: Parameters?, headerFields: [String:String]?, timeoutInterval: TimeInterval = 60) -> DataRequest {
        return Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONParameterEncoding.init(timeoutInterval: timeoutInterval, json: parameter, headerFields: headerFields))
      
    }
    
    
    /// 发送一个post请求
    /// - Parameters:
    ///   - url: 请求路径
    ///   - parameter: 参数
    ///   - headerFields: 请求头参数
    ///   - timeoutInterval: 超时
    /// - Returns: DataRequest实例对象
    static func post<T: Encodable>(_ url: URLConvertible, parameter: T?, headerFields: [String:String]?, timeoutInterval: TimeInterval = 60) -> DataRequest {
        return Alamofire.request(url, method: .post, encoding: RawDataParameterEncoding.init(timeoutInterval: timeoutInterval, data: try? JSONEncoder.init().encode(parameter), headerFields: headerFields))
    }
    
    /// 发送一个get请求
    /// - Parameters:
    ///   - url: 路径
    ///   - parameter: 参数
    ///   - headerFields: 请求头自定义参数
    ///   - timeoutInterval: 自定义超时参数
    /// - Returns: 返回一个DataRequest实例
    static func get(_ url: URLConvertible, parameter: Parameters?, headerFields: [String:String]?, timeoutInterval: TimeInterval = 60) -> DataRequest {
        return Alamofire.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: headerFields ?? [:])
    
    }
    
    /// 发送一个get请求
    /// - Parameters:
    ///   - url: 路径
    ///   - parameter: 参数
    ///   - headerFields: 请求头自定义参数
    ///   - timeoutInterval: 自定义超时参数
    /// - Returns: 返回一个DataRequest实例
    static func get<T: Encodable>(_ url: URLConvertible, parameter: T?, headerFields: [String:String]?, timeoutInterval: TimeInterval = 60) -> DataRequest {
        return Alamofire.request(url, method: .get, encoding: RawDataParameterEncoding.init(timeoutInterval: timeoutInterval, data: try? JSONEncoder.init().encode(parameter), headerFields: headerFields))
    }
    
    static func method(_ method: HTTPMethod, url: URLConvertible, parameter: Parameters?, timeoutInterval: TimeInterval, headerFields:[String : String]?) -> DataRequest {
        return Alamofire.request(url, method: method, parameters: parameter, encoding: JSONParameterEncoding.init(timeoutInterval: timeoutInterval, json: parameter, headerFields: headerFields))
        
    }
    
    static func method<T: Encodable>(_ method: HTTPMethod, url: URLConvertible, parameter: T?, timeoutInterval: TimeInterval, headerFields:[String : String]?) -> DataRequest {
        return Alamofire.request(url, method: method,  encoding: RawDataParameterEncoding.init(timeoutInterval: timeoutInterval, data: try? JSONEncoder.init().encode(parameter), headerFields: headerFields))
    }
}
