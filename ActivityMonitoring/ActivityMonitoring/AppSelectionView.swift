//
//  ContentView.swift
//  ActivityMonitoring
//
//  Created by macMini_Mansa on 12/01/22.
//
import FamilyControls
import SwiftUI

struct AppSelection: View {
    
    @StateObject var restrictions = Restrictions.shared
    @State var isPresented = false
    
    var body: some View {
        Button("Select Apps To Restrict") {
            isPresented = true
        }.font(.system(size: 30))
            .foregroundColor(.white)
        .familyActivityPicker(isPresented: $isPresented, selection: $restrictions.selectionToDiscourage)
        Divider()
        Button("Start Monitoring") {
            restrictions.initiateMonitoring()
        }.font(.system(size: 30))
            .foregroundColor(.white)
    }
}

struct AppSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AppSelection()
    }
}

struct RestrictAppsPickerView: View {
    
    @State var selection = FamilyActivitySelection()
    
    var body: some View {
        VStack {
            FamilyActivityPicker(selection: $selection)
                .navigationTitle("Please select")
                .onAppear {
                
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
}
