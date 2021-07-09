//
//  WrapperViewModel.swift
//  CrownStackDemo
//
//  Created by Gurwinder singh on 08/07/21.
//

import Foundation

class WrappperViewModel{
    
    static let shared = WrappperViewModel()
    
    func onClickAPI(_ name: String, _ type: String, completion: @escaping (_ success : String?, _ failure: String?, _ response : Wrapper?) -> Void){
            guard let path = Bundle.main.path(forResource: name, ofType: type) else{
                return completion("", "url not exist", nil)}
                let url = URL(fileURLWithPath: path)
        do{
                  let data = try Data(contentsOf: url)
                  let response = try JSONDecoder().decode(Wrapper.self, from: data)
                    completion("Success", "", response)
              }catch{
                completion("", "Something went wrong", nil)
                
              }
            }
        }



