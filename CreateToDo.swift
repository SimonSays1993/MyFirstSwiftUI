import SwiftUI

struct CreateToDo: View {
    @State var toDoTitle = ""
    @State var important = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var toDoStorage: ToDoStorage
    
    var body: some View {
        List {
            Section {
                TextField("Ex. Walk The Dog", text: $toDoTitle)
            }
            Section {
                Toggle(isOn: $important) {
                    Text("This is the Important Toggle")
                }
            }
            Section {
                HStack {
                    Spacer()
                    Button("Save") {
                        self.toDoStorage.toDos.append(ToDoItem(title: toDoTitle, important: important))
                        //This lets us move to the previous view.
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(toDoTitle.isEmpty)
                    Spacer()
                }
            }
        }
        .listStyle(.grouped)
    }
}

struct CreateToDo_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDo().environmentObject(ToDoStorage())
    }
}
