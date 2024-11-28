import SwiftUI

struct CategoryListView: View {

    @State private var showingAddCategoryView: Bool = false
    @State private var animateArrow: Bool = false // Track animation state
    @State private var hideArrowAndText: Bool = false // Track if the arrow and text should be hidden

    var body: some View {
        NavigationStack {
            ZStack {
                // Background color for the entire screen
                Color(UIColor.systemGray6)
                    .ignoresSafeArea() // Ensures the background fills the entire screen

                VStack {
                    // Top content (Categories and Add Category button)
                    VStack {
                        Text("Categories")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding(.top, 20) // Padding from the top

                        // Add some space between the "Categories" text and the "Add Category" button
                        Button {
                            showingAddCategoryView.toggle()
                            hideArrowAndText = true // Hide the arrow and text when the button is clicked
                        } label: {
                            Text("Add Category")
                                .font(.headline)
                        }
                        .padding(.top, 10) // Added padding to push the button down
                        .padding(.bottom, 10) // Spacing between button and categories

                        // Arrow animation below the button (only show if not hidden)
                        if !hideArrowAndText {
                            Image(systemName: "arrow.up.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.blue)
                                .scaleEffect(animateArrow ? 1.2 : 1) // Pulsating scale effect
                                .opacity(animateArrow ? 1 : 0) // Fade in/out the arrow
                                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateArrow)
                                .padding(.top, 10) // Position arrow just under the button
                                .onAppear {
                                    // Start animation when view appears
                                    animateArrow = true
                                }
                        }

                        Divider().padding(.bottom)
                    }
                    .padding(.horizontal) // Padding for the top section

                    Spacer()

                    // Centered Text (only show if not hidden)
                    if !hideArrowAndText {
                        Text("Welcome to Your TODO LIST  Category List Page")
                            .font(.subheadline) // Smaller font size for instructions
                            .fontWeight(.regular) // Regular weight to make it feel more like instructions
                            .foregroundColor(.gray) // Lighter color to make it feel more like a subtle instruction
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 50)
                    }

                    // Content below the centered text (CategoryGridView)
                    CategoryGridView()

                    Spacer() // To ensure the content doesn't overlap with bottom
                }

                // Sheet for adding category
                .sheet(isPresented: $showingAddCategoryView) {
                    AddTodoCategoryView()
                }
            }
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
