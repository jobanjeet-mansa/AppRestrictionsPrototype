
import FamilyControls
import SwiftUI

struct AppSelection: View {
    
    @StateObject var restrictions = Restrictions.shared
    @State var isPresented = false
    @State var showMainScreen = false
    var body: some View {
        
        VStack {
            let isSelected = UserDefaults.standard.bool(forKey: "appSelected")
            if !isSelected {
            Button("Select Apps To Restrict") {
                isPresented.toggle()
            }.font(.system(size: 30))
                .foregroundColor(.white)
            .familyActivityPicker(isPresented: $isPresented, selection: $restrictions.selectionToDiscourage)
            Divider()
            }
            Button("Start Monitoring") {
                showMainScreen.toggle()
                
               // restrictions.initiateMonitoring()
            }.font(.system(size: 30))
                .foregroundColor(.white)
                .sheet(isPresented: $showMainScreen) {
                    UnlockAccess()
                }
        }
        
            
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
            
            for app in applications {
                
                print(app.localizedDisplayName)
                
            }
            
            for category in categories {
                print(category.localizedDisplayName)
            }
            
            
            print("Old")
            print("Apps \(applications.description) , Categories \(categories.description) , Websites \(webDomains) \(webDomains.description)")
            
            print("NEW")
            print("Apps \(newSelection.applications.description)   Categories \(newSelection.categories.description)  WebDomains \(newSelection.webDomains.description)")
            
          
        }
    }
}
