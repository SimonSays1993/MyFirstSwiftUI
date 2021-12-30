import SwiftUI

struct ToDoList: View {
    
    @EnvironmentObject var toDoStorage: ToDoStorage

    var body: some View {
        NavigationView {
            List {
                ForEach(self.toDoStorage.toDos) { toDo in
                    if toDo.important {
                        Text(toDo.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Rectangle()
                                            .foregroundColor(.red)
                                            .cornerRadius(5))
                    } else {
                        Text(toDo.title)
                    }
                }
                .onDelete { indexSet in
                    //index tells us which item in the array we need to go to
                    if let index = indexSet.first {
                        self.toDoStorage.toDos.remove(at: index)
                    }
                }
            }
            .navigationTitle("To Dos")
            .navigationBarItems(trailing: NavigationLink(destination: CreateToDo()) {
                Text("Add")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList().environmentObject(ToDoStorage())
    }
}
