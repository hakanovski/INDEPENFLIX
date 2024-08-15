import SwiftUI
import AVKit

struct INDEPENFLIXApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            MainContentView()
        } else {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    VStack(spacing: 20) {
                        TextField("Username", text: $email)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .foregroundColor(.white)
                            .accentColor(.green)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .accentColor(.green)
                    }
                    .padding(.horizontal, 40)
                    
                    VStack(spacing: 15) {
                        Button(action: {
                            if email == "test" && password == "test" {
                                isLoggedIn = true
                            }
                        }) {
                            Text("Log In")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Forgot password action
                        }) {
                            Text("Forgot Password?")
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                    }
                    .padding(.horizontal, 40)
                }
            }
        }
    }
}

struct MainContentView: View {
    let videos = ["Bostanli.MP4", "Breakfast.mov", "Dukkanda.MOV", "Fast Plane.MOV", "Kebap Family.mov", "Kusadasi.mov", "Mila's World in 7 Seconds.mov", "Portal.MP4", "Slow Mo Jump.mov", "Turkish Girl.MOV"]
    
    var body: some View {
        VStack {
            Text("Your Films")
                .font(.largeTitle)
                .padding(.top, 50)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(videos, id: \.self) { video in
                        VideoThumbnailView(videoName: video)
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 200)
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct VideoThumbnailView: View {
    let videoName: String
    
    var body: some View {
        VStack {
            Image(systemName: "video") // Placeholder image; replace with actual thumbnail images.
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
                .cornerRadius(10)
            Text(videoName)
                .foregroundColor(.white)
                .padding(.top, 5)
        }
        .onTapGesture {
            // Handle different file extensions
            if videoName.contains(".MP4") {
                playVideo(named: videoName.replacingOccurrences(of: ".MP4", with: ""), withExtension: "MP4")
            } else if videoName.contains(".mov") {
                playVideo(named: videoName.replacingOccurrences(of: ".mov", with: ""), withExtension: "mov")
            } else if videoName.contains(".MOV") {
                playVideo(named: videoName.replacingOccurrences(of: ".MOV", with: ""), withExtension: "MOV")
            } else {
                print("Unsupported video format")
            }
        }
    }
    
    func playVideo(named: String, withExtension: String) {
        guard let url = Bundle.main.url(forResource: named, withExtension: withExtension) else {
            print("Video not found: \(named).\(withExtension)")
            return
        }
        
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        if let rootVC = UIApplication.shared.windows.first?.rootViewController {
            rootVC.present(playerViewController, animated: true) {
                player.play()
            }
        }
    }
}

