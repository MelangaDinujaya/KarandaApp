import SwiftUI

// Splash Screen View
struct SplashScreenView: View {
    @State private var isActive = false // Controls the transition to the main screen
    @State private var logoScale: CGFloat = 0.5 // Starting scale for the logo

    var body: some View {
        if isActive {
            // Main View after splash screen
            CategoryListView() // Replace with your actual main view (like CategoryListView)
        } else {
            // Splash Screen
            VStack {
                // Your app's logo
                Image("Image") // Replace with your actual logo asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .scaleEffect(logoScale) // Scaling effect on the logo
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: logoScale) // Animation to grow/shrink the logo

                // App Intro Text
                Text("Put It On Before You Forget")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 20)
            }
            .onAppear {
                // Timer to simulate splash screen duration
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Show splash for 2 seconds
                    withAnimation {
                        self.isActive = true // Transition to main view
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
