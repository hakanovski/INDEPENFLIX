import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            // Background image or color
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(Color.black.opacity(0.3)) // Add slight opacity for better text visibility
            
            VStack(spacing: 20) {
                // Logo
                Image("appLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 40)
                
                // Email and Password Input Fields with darker placeholders
                VStack(spacing: 20) {
                    TextField("Username", text: $email)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .foregroundColor(.white) // Text color
                        .accentColor(.green) // Cursor color
                        .placeholder(when: email.isEmpty) {
                            Text("Username")
                                .foregroundColor(Color.gray) // Darker color for better contrast
                        }
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .foregroundColor(.white) // Text color
                        .accentColor(.green) // Cursor color
                        .placeholder(when: password.isEmpty) {
                            Text("Password")
                                .foregroundColor(Color.white) // Darker color for better contrast
                        }
                }
                .padding(.horizontal, 40)
                
                // Forgot Password and Login Button
                VStack(spacing: 15) {
                    Button(action: {
                        // Perform login action here
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
                
                // Social Login Buttons
                VStack(spacing: 10) {
                    Button(action: {
                        // Log in with Google action
                    }) {
                        HStack {
                            Image(systemName: "globe")
                            Text("Log in with Google")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Log in with Apple action
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Log in with Apple")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Log in with Facebook action
                    }) {
                        HStack {
                            Image(systemName: "f.square")
                            Text("Log in with Facebook")
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 40)
                
                // Sign Up Button
                Button(action: {
                    // Sign up action
                }) {
                    Text("Sign Up with Email")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                .padding(.horizontal, 40)
            }
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
