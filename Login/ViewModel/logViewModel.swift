//
//  File.swift
//  Onroad
//
//  Created by Francisco Morales on 01/03/22.
//

import Foundation
class logViewModel :ObservableObject{
    @Published var loginData = [loginModel]()
    var nameUser=InicioSesionView().correo
    var passw=InicioSesionView().contraseña
    func requestvoid(pass:String,mail:String){
        nameUser=mail
        passw=pass
        let url=URL(string:"https://avocado-cloud.com/WS-phoenixApiPROD/login/loginApp")!
        var request = URLRequest (url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod="POST"
        let parameters: [String: String]=[
            "password":passw,
            "user":nameUser
        ]
        guard let finalBody=try? JSONEncoder().encode(parameters)else{
            return
        }
        request.httpBody=finalBody
      
        
        URLSession.shared.dataTask(with: request) { data, response, error in
        
            do{
                if let jsonData=data{
                    print("tamaño de JSON\(jsonData)")
                    let decodeData = try
                    JSONDecoder().decode([loginModel].self, from: jsonData)
                    DispatchQueue.main.async {
                        self.loginData.append(contentsOf: decodeData)
                    }
                }
            }catch{
                print("error catch : \(error )")
            }
        
        
        }.resume()
    }
}
