
import SwiftUI

let YOUR_NAME = "YOU"

struct ContentView: View {
    @State var myBurpeeCount = 0
    @State var entries: [Score] = []

    let gradient = LinearGradient(colors: [
        Color(red: 0.0, green: 0.5, blue: 0.6),
        Color(red: 0.2, green: 0.6, blue: 0.7),
    ], startPoint: .top, endPoint: .bottom)

    var body: some View {
        VStack {
            Button(action: {
                myBurpeeCount += 1
                updateEntries()
            }) {
                Text("BURPEE")
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        ZStack {
                            Circle()
                                .fill(gradient)

                            Circle()
                                .strokeBorder(lineWidth: 50)
                                .foregroundColor(Color(red: 0.7, green: 0.9, blue: 0.9))
                        })
            }

            .padding()
            Spacer()
            VStack(alignment: .leading, spacing: 1) {
                Divider()
                    .background(.black)
                ForEach(entries) {
                    e in
                    if e.name == YOUR_NAME {
                        ScoreView(score: e)
                            .foregroundColor(.white)
                            .background(gradient)
                    }
                    else {
                        ScoreView(score: e)
                    }
                    Divider()
                        .background(.black)
                }

            }.padding(.horizontal, 40.0)
                .padding(.bottom, 70)
            Spacer()
        }
        .onAppear(perform: {
            updateEntries()
        })
    }

    func updateEntries() {
        entries = [
            Score(name: "Jonny John", count: 71, rank: 46),
            Score(name: "Dave Douglas", count: 41, rank: 47),
            Score(name: YOUR_NAME, count: myBurpeeCount, rank: 48),
            Score(name: "Mike Moose", count: 12, rank: 49),
            Score(name: "Steven Seagal", count: 5, rank: 50),
        ]
    }
}

struct Score: Identifiable {
    let name: String
    let count: Int
    let rank: Int

    var id: String { name }
}

struct ScoreView: View {
    var score: Score

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Text("\(score.rank)")
                .font(.system(size: 25))

            VStack(alignment: .leading) {
                Text("\(score.name)")
                    .font(.system(size: 25))
                Text("\(score.count) burpees")
                    .font(.system(size: 15))
            }
            Spacer()
        }
        .padding(.horizontal, 9)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
