import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

 Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> SignIn({String email , String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException 
    catch (e){
      return e.message;
    }
    
  }
  Future<void> Signout() async {
    await _firebaseAuth.signOut();
  }
  Future<String> SignUp({String email , String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException 
    catch (e){
      return e.message;
    }
  }
   
  }