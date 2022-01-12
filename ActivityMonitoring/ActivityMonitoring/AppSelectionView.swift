//
//  ContentView.swift
//  ActivityMonitoring
//
//  Created by macMini_Mansa on 12/01/22.
//
import FamilyControls
import SwiftUI

struct FamilyView: View {
    
    @State var selection = FamilyActivitySelection()
    
    var body: some View {
    
        ZStack {
            Color(UIColor.green)
            NavigationView{
            VStack {
                FamilyActivityPicker(selection: $selection).onSubmit {
                    print("DASD")
                }
            }
            .onChange(of: selection) { newSelection in
                let applications = selection.applications
                let categories = selection.categories
                let webDomains = selection.webDomains
          
                print("Apps \(applications) , Categories \(categories) , Websites \(webDomains) \(newSelection.applications.description)")
                
                NavigationLink(destination: UnlockAccess()) {
                    
                }
            }
            
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
