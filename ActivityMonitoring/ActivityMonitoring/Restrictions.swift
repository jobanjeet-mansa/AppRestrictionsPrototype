
import Foundation
import FamilyControls
import DeviceActivity
import ManagedSettings

class Restrictions: ObservableObject {
    static let shared = Restrictions()
    let store = ManagedSettingsStore()

    private init() {}

    var selectionToDiscourage = FamilyActivitySelection() {
        willSet {
            
            UserDefaults.standard.setValue(true, forKey: "appSelected")
            
            print ("got here \(newValue)")
            
            for category in newValue.categories {
                print(category.localizedDisplayName)
            }
            
            let applications = newValue.applicationTokens
            let categories = newValue.categoryTokens
            //let webCategories = newValue.webDomainTokens
            store.shield.applications = applications.isEmpty ? nil : applications
            store.shield.applicationCategories = ShieldSettings.ActivityCategoryPolicy.specific(categories, except: Set())
            store.shield.webDomainCategories = ShieldSettings.ActivityCategoryPolicy.specific(categories, except: Set())
        }
    }

    func initiateMonitoring() {
        let schedule = DeviceActivitySchedule(intervalStart: DateComponents(hour: 0, minute: 0), intervalEnd: DateComponents(hour: 23, minute: 59), repeats: true, warningTime: nil)

        let center = DeviceActivityCenter()
        do {
            try center.startMonitoring(.daily, during: schedule)
        }
        catch {
            print ("Could not start monitoring \(error)")
        }
        
        store.dateAndTime.requireAutomaticDateAndTime = true
        store.account.lockAccounts = true
        store.passcode.lockPasscode = true
        store.siri.denySiri = true
        store.appStore.denyInAppPurchases = true
        store.appStore.maximumRating = 200
        store.appStore.requirePasswordForPurchases = true
        store.media.denyExplicitContent = true
        store.gameCenter.denyMultiplayerGaming = true
        store.media.denyMusicService = false
    }
}

extension DeviceActivityName {
    static let daily = Self("daily")
}

