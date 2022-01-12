//
//  ContentView.swift
//  ActivityMonitoring
//
//  Created by macMini_Mansa on 12/01/22.
//
import FamilyControls
import SwiftUI

struct AppSelection: View {
    
    @State var selection = FamilyActivitySelection()
    
    var body: some View {
    
        ZStack {
            Color(UIColor.green)
            NavigationView{
            VStack {
                FamilyActivityPicker(selection: $selection).onAppear {
                  
                }
            }
            .onChange(of: selection) { newSelection in
                let applications = selection.applications
                let categories = selection.categories
                let webDomains = selection.webDomains
          
                print("Old")
                print("Apps \(applications.description) , Categories \(categories.description) , Websites \(webDomains) \(webDomains.description)")
                
                print("NEW")
                print("Apps \(newSelection.applications.description)   Categories \(newSelection.categories.description)  WebDomains \(newSelection.webDomains.description)")
                
                NavigationLink(destination: UnlockAccess()) {
                    
                }
            }
            
            }
        }.ignoresSafeArea()
            
    }

}

struct AppSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AppSelection()
    }
}
