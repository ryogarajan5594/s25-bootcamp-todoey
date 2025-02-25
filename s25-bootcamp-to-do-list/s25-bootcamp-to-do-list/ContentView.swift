import SwiftUI

struct Todo: Identifiable {
        var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    // Replace with todos @State variable
    @State private var todos: [Todo] = [
        Todo(item:"Finish homework", isDone:false),
        Todo(item:"Go Grocery Shopping", isDone: false)
    ]
    
    var body: some View {
        VStack{
            
            Text("Todoey")
                .font(.largeTitle)
                .foregroundColor(.yellow)
            
            List {
                
                
                
                ForEach($todos) { $todo in
                    
                    HStack{
                        
                        Button(action: {todo.isDone.toggle()}){
                            Image(systemName: todo.isDone ? "circle":"circle.fill")
                                .foregroundColor(.yellow)
                            
                        }
                        TextField("Enter To-Do task", text: $todo.item)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(.title3)
                            .foregroundColor(.yellow)
                    }
                    
                }
                
                
            }
            .listStyle(.plain)
            HStack{
                Button {
                    
                    todos.append(Todo(item: " ", isDone: true))
                    
                } label: {
                    
                    Image(systemName:"plus.circle")
                    .foregroundColor(.yellow)
                    Text("New Reminder")
                    .foregroundColor(.yellow)
                    
                
                }
            }
            
        }
        .preferredColorScheme(.dark)
    }
    
}

#Preview {
    ContentView()
}
