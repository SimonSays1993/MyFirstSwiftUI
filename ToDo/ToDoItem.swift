import Foundation

struct ToDoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var important: Bool
    
    init(title: String, important: Bool) {
        self.title = title
        self.important = important
    }
}

//What we want to do here is store a place for are ToDo items
class ToDoStorage: ObservableObject {
    @Published var toDos = [ToDoItem]() {
        didSet {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(toDos), forKey: "toDos")
        }
    }
    
    init() {
        if let data = UserDefaults.standard.object(forKey: "toDos") as? Data {
            if let userDefaultToDos = try? PropertyListDecoder().decode(Array<ToDoItem>.self, from: data) {
                toDos = userDefaultToDos
            }
        }
    }
}
