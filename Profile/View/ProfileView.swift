//
//  ProfileView.swift
//  Onroad
//
//  Created by Francisco Morales on 24/02/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var isNotificationsON=false
     var body: some View {
          ZStack{
              Color.white
                  .ignoresSafeArea()
          VStack{
              Text("perfil").foregroundColor(Color.black)
                Image("ic_defaultprofileimage_profile")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 90)
                  .padding(.top, 10.0)
              Text("userName").foregroundColor(Color.black)
              Text("e-mail").foregroundColor(Color.black)
             
              Text("General").foregroundColor(Color.black)
                      .frame(width: 350,  alignment: .leading)
                      .padding(.top, 15)
             
              VStack{
                  HStack{
                      Image("ic_notification_profile")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 40)
                      .padding(.leading,55)
//                      Text("Habilitar notificaciones").foregroundColor(Color.black)
//                          .frame(width: 350,  alignment: .leading)
//                          .padding(.top, 2)
                      
                      Toggle(isOn: self.$isNotificationsON){
                          Text("Habilitar notificaciones").padding(.leading, 15)
                      }.padding(.trailing,55)
                      
                  }.padding(.top, 15)
                  HStack{
                      Image("ic_helpicon_profile")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 40)
                      .padding(.leading,55)
                      Text("Ayuda").foregroundColor(Color.black)
                          .frame(width: 350,  alignment: .leading)
                          .padding(.leading, 15)
                      
                      
                      
                  }.padding(.top, 15)
                  HStack{
                      Image("ic_closesession_profile")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 40)
                      .padding(.leading,55)
                      Text("Cerrar sesión").foregroundColor(Color.red)
                          .frame(width: 350,  alignment: .leading)
                          .padding(.leading, 15)
                      
                  }.padding(.top, 15)
              }
              Spacer()
              
              
          }
         
      }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }    
}
