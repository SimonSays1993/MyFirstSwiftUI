import SwiftUI

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoList().environmentObject(ToDoStorage())
        }
    }
}
