import SwiftUI

struct TodoRow: View {
    var todo: TodoItem
    var toggleCompletion: () -> Void
    var deleteAction: () -> Void

    var body: some View {
        HStack {
            // Toggle button for completing/uncompleting the todo item
            Button(action: toggleCompletion) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.isCompleted ? .green : .blue)
            }
            .buttonStyle(PlainButtonStyle())  // Prevent the button from being styled like a link

            // Display title of todo item
            Text(todo.title ?? "Untitled")
                .strikethrough(todo.isCompleted, color: .gray)
                .foregroundColor(todo.isCompleted ? .gray : .primary)

            Spacer()

            // Delete button
            Button(action: deleteAction) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .swipeActions {
            // Delete action for swiping to delete
            Button(role: .destructive, action: deleteAction) {
                Label("Remove", systemImage: "trash")
            }
        }
    }
}
