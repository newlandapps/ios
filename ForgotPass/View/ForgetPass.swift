//
//  ForgetPass.swift
//  Onroad
//
//  Created by Francisco Morales on 25/02/22.
//

import SwiftUI

struct ForgetPass: View {
    var body: some View {
        forgetPasss()
    }
}
struct forgetPasss:View{
    @State var correoOlvidado:String = ""
    var body: some View {
   //     NavigationView{
        ZStack   {
            VStack{
                Text("Restablece tu contraseña").padding(.top, 10.0)
                Image("logoLogin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90,  alignment: .top)
                    .padding(.top, 40.0)
                Text("¿con que correo te diste de alta?").padding(.top, 40.0)
                VStack(alignment: .leading){
                    TextField("", text: $correoOlvidado)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .foregroundColor(.black)
                        .overlay(    RoundedRectangle(cornerRadius: 6)
                                     .stroke(Color.black, lineWidth: 3)
                                     .shadow(color: .white, radius: 6))
                }.padding(EdgeInsets(top: 10, leading: 15, bottom: 1, trailing: 15))
          
                Button(action: enviarCorreo) {
                                    Text("Enviar")
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue)
                                        .frame( maxWidth: .infinity, alignment: .center)
                                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                        .overlay(RoundedRectangle(cornerRadius: 6)
                                                     .stroke(Color.blue, lineWidth: 3).shadow(color: .white, radius: 6))
                                }.padding(EdgeInsets(top: 10, leading: 15, bottom: 1, trailing: 15))
                Spacer()
            }
            
        }
    //}.navigationBarHidden(true)
    }
    func enviarCorreo() {
            
             print("Enviar Correo")
     
        }
}
struct ForgetPass_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPass()
    }
}
