import UIKit
import MobileCoreServices
import ManagedSettings
import DeviceActivity

class MyMonitor: DeviceActivityMonitor {
    let store = ManagedSettingsStore()
    override func intervalDidStart(for activity: DeviceActivityName) {
        super.intervalDidStart(for: activity)
        print("Started Restrictions")
        let model = Restrictions.shared
        let applications = model.selectionToDiscourage.applicationTokens
        store.shield.applications = applications.isEmpty ? nil : applications
        store.dateAndTime.requireAutomaticDateAndTime = true
        
    }

    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        print("Restrictions have been lifted")
        store.shield.applications = nil
        store.dateAndTime.requireAutomaticDateAndTime = false
    }
}
