//
//  File.swift
//  Onroad
//
//  Created by Francisco Morales on 01/03/22.
//

import Foundation
class logViewModel :ObservableObject{
    @Published var loginData : loginModel!
    
    
    var nameUser=InicioSesionView().correo
    var passw=InicioSesionView().contraseña
    func requestvoid(pass:String,mail:String){
        nameUser=mail
        passw=pass
        let url=URL(string:"https://avocado-cloud.com/WS-phoenixApiPROD/login/loginApp")!
        var request = URLRequest (url: url)
        
       
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod="POST"
        request.timeoutInterval=20;
        let parameters: [String: AnyHashable]=[
            "password":passw,
            "user":nameUser
        ]
//        guard let finalBody=try? JSONEncoder().encode(parameters)else{
//            return
//        }
        request.httpBody=try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
      
        
        let task = URLSession.shared.dataTask(with: request) { data,_, error in
            guard let data=data,error == nil else{
                return
            }
            do{
                let response=try JSONSerialization.jsonObject(with: data, options: .allowFragments)
              //  print ("Success: \(response)")
                
                let decoder = JSONDecoder()
                let json = try decoder.decode(loginModel.self, from: data)
                
                DispatchQueue.main.async {
                
                    self.loginData=json
                    print("  res: \(self.loginData.responseCode).......+\(String(describing: self.loginData.data?.token)).......+\(self.loginData.message)")
                }
//                if let jsonData=data{
//                    let decodeData=try
//                    JSONDecoder().decode(loginModel.self, from: jsonData)
//                    DispatchQueue.main.async {
//                        self.loginData.message.append(contentsOf: decodeData)
//                    }
//                }
                
            }catch{
                print("error catch : \(error )")
            }
        
        
        }
        task.resume()
    }
}
