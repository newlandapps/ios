//
//  ContentView.swift
//  Onroad
//
//  Created by Francisco Morales on 01/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate = false
    @State var endSplash = false
    var body: some View {
        ZStack {
            Home()
            ZStack{
                Color("splashColor")
                
                Image ("onRoadLogo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width : animate ? nil: 54 ,height: animate ? nil: 54)
                    
                    .scaleEffect(animate ? 3 :1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0:1)
            
        }
    }
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            withAnimation(Animation.easeOut(duration: 0.35)){
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.35)){
                endSplash.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("onRoadLogo")
        ContentView()
    }
}

struct Home: View{
    var body : some View{
//        Text("Splash Correcta")
//        .padding()
        NavigationView{
            ZStack{
                Color.white
                    .ignoresSafeArea()
            VStack{
                
                Image("logoLogin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90)
                    .padding(.top, 60.0)
                Spacer()
                InicioSesionView()
            }
           
        }
        }.navigationBarHidden(true)
        }
        
    }

struct InicioSesionView: View{
  //  @ObservedObject var binddata = logViewModel()
    @ObservedObject var lModel = loginModel
   @StateObject var request = logViewModel()
  
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var isPantallaHomeActive:Bool = false
    @State var isForgetPassActive:Bool = false
        var body: some View {
            
            ZStack{
               VStack(alignment: .leading){
                   Text("Iniciar sesión")
                       .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                       .foregroundColor(Color.black)
                   
                   Text("Correo")
                       .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                       .foregroundColor(Color.black)
                   ZStack(alignment: .leading){
                       if correo.isEmpty { Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color.black).padding(15) }
                                      
                       TextField("", text: $correo)
                           .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                           .foregroundColor(.black)
                           .overlay(    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.black, lineWidth: 3)
                                        .shadow(color: .white, radius: 6))
                   }.padding(EdgeInsets(top: 1, leading: 15, bottom: 1, trailing: 15))
                
                   
                   Text("Contraseña")
                       .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                       .foregroundColor(Color.black)
                   ZStack(alignment: .leading){
                       if contraseña.isEmpty { Text("Introduce tu contraseña").font(.caption).foregroundColor(Color.black).padding(15) }
                                  
                   SecureField("", text: $contraseña)
                           .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                           .foregroundColor(.black)
                           .overlay(    RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.black, lineWidth: 3)
                                    .shadow(color: .white, radius: 6))
                   }.padding(EdgeInsets(top: 1, leading: 15, bottom: 1, trailing: 15))
                   Button(action: forgotPass) {
                   Text("¿Olvidaste tu contraseña?")
                                      .font(.footnote)
                                      .frame(width: 370,  alignment: .trailing)
                                      .foregroundColor(Color.black)
                                      .padding(.bottom,82)
                   }.frame(width: 370, alignment: .leading)
                                      
                   Spacer()
                   
                   Button(action: iniciarSesion) {
                                       Text("Iniciar Sesión")
                                           .fontWeight(.bold)
                                           .foregroundColor(.blue)
                                           .frame( maxWidth: .infinity, alignment: .center)
                                           .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                           .overlay(RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color.blue, lineWidth: 3).shadow(color: .white, radius: 6))
                   }.padding(EdgeInsets(top: 1, leading: 15, bottom: 1, trailing: 15))
               
               
                   Spacer()
                   
               }
            
            }
          
            VStack{
                        NavigationLink(
                                       destination: MenumainView(),
                                       isActive: $isPantallaHomeActive,
                                       label: { EmptyView()
                                       })
            }
            VStack{
                        NavigationLink(
                                       destination: ForgetPass(),
                                       isActive: $isForgetPassActive,
                                       label: { EmptyView()
                                       })
                    }
                
            
                               
        }
    func iniciarSesion() {
            
             print("Mi correo es \(correo) y mi contraseña es \(contraseña)")
        
     //   isPantallaHomeActive=true
       
        request.requestvoid(pass: contraseña, mail: correo)
        print("data del output   \(String(describing: request.loginData))")
        let respCode : Int? =  self.lModel.
        if respCode != nil {
            if(respCode == 100)
            {
                isPantallaHomeActive = true
            }else{
                print("respuesta del servidor incorrecta")
            }
        }

        
        }
    func forgotPass(){
        print("Olvide la contraseña")
        isForgetPassActive=true
    }
            
      
    }
