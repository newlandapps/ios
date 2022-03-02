//
//  MenumainView.swift
//  Onroad
//
//  Created by Francisco Morales on 25/02/22.
//

import SwiftUI

struct MenumainView: View {
   
    @State var tabSeleccionado:Int = 0
    var body: some View {
        TabView(selection:$tabSeleccionado) {
        
                  ProfileView().tabItem {
                      Image(systemName: "person")
                      Text("Perfil")
                  }
        }
    }
}

struct MenumainView_Previews: PreviewProvider {
    static var previews: some View {
        MenumainView()
    }
}
