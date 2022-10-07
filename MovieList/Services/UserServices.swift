//
//  UserServices.swift
//  MovieList
//
//  Created by mac 2019 on 10/7/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
    case put = "PUT"
}

final class UserServices {
    static let shared = UserServices()
    
    /*func getHeaders() -> HTTPHeaders {
        var headers: HTTPHeaders = ["Accept": "application/json"]
        let secreteToken = AppManager.shared.getAuthorizationToken()
        if secreteToken != nil {
            headers[APIConstants.bearerKey] = "Bearer " + secreteToken!
        }
        
        return headers
    }*/
    
    func getHeaders() -> [String: String]? {
        return nil
    }
    
    func getFullUrl(endPoint: String) -> String {
        let url = APIConstants.baseUrl + endPoint
        return url
    }
    
    private func apiRequest<T: Decodable>(type: T.Type, method: HTTPMethod, urlStr: String, params: [String: String], completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        
        var components = URLComponents(string: urlStr)!
        components.queryItems = params.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let data = data,                              // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
                error == nil                                  // was there no error
            else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            
            let decoder = JSONDecoder()
            let decodedData = try? decoder.decode(type, from: data)
            DispatchQueue.main.async {
                completionHandler(decodedData, nil)
            }
        }
        task.resume()
    }
    
    
    func getRequest<T: Decodable>(type: T.Type, endPoint: String, params: [String: String], completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let url = getFullUrl(endPoint: endPoint)
        apiRequest(type: type, method: .get, urlStr: url, params: params) { value, error in
            completionHandler(value, error)
        }
    }
    
    func postRequest<T: Decodable>(type: T.Type, endPoint: String, params: [String: String], completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let url = getFullUrl(endPoint: endPoint)
        apiRequest(type: type, method: .post, urlStr: url, params: params) { value, error in
            completionHandler(value, error)
        }
    }
    
    func putRequest<T: Decodable>(type: T.Type, endPoint: String, params: [String: String], completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let url = getFullUrl(endPoint: endPoint)
        apiRequest(type: type, method: .put, urlStr: url, params: params) { value, error in
            completionHandler(value, error)
        }
    }
    
    func patchRequest<T: Decodable>(type: T.Type, endPoint: String, params: [String: String], completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let url = getFullUrl(endPoint: endPoint)
        apiRequest(type: type, method: .patch, urlStr: url, params: params) { value, error in
            completionHandler(value, error)
        }
    }
    
    func deleteRequest<T: Decodable>(type: T.Type, endPoint: String, params: [String: String], completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void) {
        let url = getFullUrl(endPoint: endPoint)
        apiRequest(type: type, method: .delete, urlStr: url, params: params) { value, error in
            completionHandler(value, error)
        }
        
    }
    
    /*func upload<T: Decodable>(type: T.Type, endPoint: String, image: Data, params: [String: Any], completionHandler: @escaping (_ value: T?, _ error: Error?) -> Void, uploadProgress: @escaping (_ progress: Double) -> Void) {
        guard let url = URL(string: getFullUrl(endPoint: endPoint)) else {
            return
        }
        let decoder = JSONDecoder()
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in params {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                        if let num = element as? Int {
                            let value = "\(num)"
                            multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            multiPart.append(image, withName: "profile_image", fileName: "profile_image.jpeg", mimeType: "image/jpeg")
        }, to: url, method: .post, headers: getHeaders())
            .uploadProgress(queue: .main, closure: { progress in
                print("Upload Progress: \(progress.fractionCompleted)")
                uploadProgress(progress.fractionCompleted)
            })
            .validate(statusCode: 200..<206)
            .responseDecodable(of: type, decoder: decoder) { response in
                completionHandler(response.value, response.error)
            }
    }*/
}
