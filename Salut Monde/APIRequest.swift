//
//  APIRequest.swift
//  Salut Monde
//
//  Created by Ariana Esquivel on 25/03/21.
//

import UIKit

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct APIRequest {
    let resourceURL: URL
    
    init(endpoint: String) {
        let baseURL = "http://127.0.0.1:3333/v1/auth/\(endpoint)"
        guard let resourceURL = URL(string: baseURL) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func save(_ dataToSave: Registro, completion: @escaping(Result<Registro, APIError>) -> Void){
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(dataToSave)
            
            let task = URLSession.shared.dataTask(with: urlRequest){
                data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 , let JSONData = data  else {
                    completion(.failure(.responseProblem))
                    let gege = String(data: data!, encoding: String.Encoding.utf8)
//                    print(gege)
                    do {
                        let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                        print(result?.index(forKey: "errors"))
                        let title = result?.index(forKey: "errors")
                        print(title)
                        print("Result -> \(String(describing: result))")

                            } catch {
                                print("Error -> \(error)")
                            }
//                    print(response?.index(ofAccessibilityElement: "Errors"))
                    return
                }
//                print("str",String(data: data!, encoding: String.Encoding.utf8))
                
                
                do {
                    let contentData = try JSONDecoder().decode(Registro.self, from: JSONData)
                    completion(.success(contentData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            task.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
}
