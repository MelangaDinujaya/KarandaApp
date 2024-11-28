
import SwiftUI

@main
struct TodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
