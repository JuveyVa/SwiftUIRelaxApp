import SwiftUI



struct HomeView: View {
    let emoji = ["😄", "🙂", "😐", "🙁", "😢"]
    
    let exercises = [
            ("Exercise 1", "https://via.placeholder.com/150", "A short description of Exercise 1."),
            ("Exercise 2", "https://via.placeholder.com/150", "A short description of Exercise 2."),
            ("Exercise 3", "https://via.placeholder.com/150", "A short description of Exercise 3."),
            ("Exercise 4", "https://via.placeholder.com/150", "A short description of Exercise 4.")
        ]
    
    var body: some View {
        VStack (spacing: 0)
        {
            HStack
            {
                Image("relaxlogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("Relax App")
                    .padding(20)
                    .font(.system(size: 30))
                    .bold()
                
                Image (systemName: "person.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.horizontal)
            }
        }
        Text("How are you feeling today?")
            .font(.system(size: 25))
            .foregroundColor(Color.gray)
            .bold()
        
        HStack{
            ForEach(emoji, id: \.self) {
                emojis in
                Button(action: {
                    print("OK")
                }){
                    Text(emojis)
                        .font(.system(size: 30))
                        .foregroundColor(Color.gray)
                        .padding()
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        }
        
        Text("Recommended Exercises")
            .font(.system(size: 25))
            .foregroundColor(Color.gray)
            .bold()
            .fixedSize(horizontal: false, vertical: true)
        
        HStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(exercises, id: \.0) { exercise in
                        ExerciseCard(title: exercise.0, imageUrl: exercise.1, shortDescription: exercise.2)
                    }
                }
                .padding(.horizontal)
            }
        }
        Spacer()
    }
}

#Preview {
    HomeView()
}
