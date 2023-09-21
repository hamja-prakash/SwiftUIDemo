import SwiftUI
import CoreData

struct CoreDataDemo: View {
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var email: String = ""
    @State var phoneno: String = ""
    @State var isActive = false
    @State private var selectedUser: User?
    @State private var isAddUserSheetPresented = false
    @State var SearchText:String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    public var Users: FetchedResults<User>
    @EnvironmentObject private var vm : CoreDataViewModel
    
    private var filteredUsers: [User] {
        let searchTextLowercased = SearchText.lowercased()
        
        if searchTextLowercased.isEmpty {
            return Array(Users)
        } else {
            let filtered = Users.filter { user in
                let userFirstname = (user.firstname ?? "").lowercased()
                let userLastname = (user.lastname ?? "").lowercased()
               
                return userFirstname.contains(searchTextLowercased) ||
                       userLastname.contains(searchTextLowercased)
            }
            
            if filtered.isEmpty {
                return []
            } else {
                return Array(filtered)
            }
        }
    }

    
    var body: some View {
//        NavigationView {
            ZStack(alignment: .bottomTrailing){
                VStack {
                    SearchBar(searchText: $SearchText,searchType: "User")

                    List {
                        ForEach(filteredUsers) { user in
                            VStack(alignment: .leading, spacing: 5) {
                                HStack{
                                    Text("First Name:")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.black)
                                    Text(user.firstname ?? "")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.black)
                                }
                                
                                HStack{
                                    Text("Last Name:")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.black)
                                    Text(user.lastname ?? "")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.black)
                                }
                                
                                HStack{
                                    Text("Email:")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.black)
                                    Text(user.email ?? "")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.black)
                                }
                                
                                HStack{
                                    Text("Phone no:")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.black)
                                    Text(user.mobileno ?? "")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.vertical,10)
                            .sheet(isPresented: $isAddUserSheetPresented) {
                                AddUser(usr: selectedUser)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    PersistenceController.shared.deleteUser(user)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                
                                Button(role: .none) {
                                    selectedUser = user
                                    isAddUserSheetPresented = true
                                } label: {
                                    Label("Edit", systemImage: "square.and.pencil")
                                }
                            }
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                                .background(.clear)
                                .foregroundColor(.white)
                                .padding(
                                    EdgeInsets(
                                        top: 10,
                                        leading: 10,
                                        bottom: 10,
                                        trailing: 10
                                    )
                                )
                        )
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .background(Color.white)
                    .overlay(
                        Users.isEmpty || filteredUsers.isEmpty ?
                        Text("No record found")
                            .bold()
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white)
                        : nil
                    )
                }
                Button(action: {
                    isAddUserSheetPresented.toggle()
                    selectedUser = nil
                }) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 60, alignment: .center)
                        .overlay(
                            Image("add")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal,10)
                }
                .sheet(isPresented: $isAddUserSheetPresented) {
                    AddUser(usr: selectedUser)
                }
                Spacer()
            }
           .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
        }
//    }
    
    private func deleteUser(_ user: User) {
        viewContext.delete(user)
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occurred: \(error)")
        }
    }
}

struct CoreDataDemo_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
