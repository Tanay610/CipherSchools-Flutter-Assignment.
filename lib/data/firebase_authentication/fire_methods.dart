
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _prefsUserIdKey = 'user_id';

  Future<User?> signUp(String email, String password, String name) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = authResult.user;

      if (user != null) {
        //! Store user details in Firestore database 
        await _storeUserDetails(user.uid, name, email);

        await getUserDetailsFromFirestore(user.uid);

        //! Save user id in local storage of the phone
        await _saveUserIdInPrefs(user.uid);

      }

      return user;
    } catch (e) {
      
      print('Error in sign up: $e');
      return null;
    }
  }


  Future<User?> login(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = authResult.user;

      if (user != null) {
        await _saveUserIdInPrefs(user.uid);
      }

      return user;
    } catch (e) {
      print('Error in login: $e');
      return null;
    }
  }


  Future<User?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        UserCredential authResult = await _auth.signInWithCredential(credential);
        User? user = authResult.user;

        if (user != null) {
          //! Store user details in Firestore
          await _storeUserDetails(user.uid, user.displayName ?? '', user.email ?? '');

          await getUserDetailsFromFirestore(user.uid);

          //! Save user id in local storage
          await _saveUserIdInPrefs(user.uid);
        }

        return user;
      }
    } catch (e) {
      print('Error in sign in with Google: $e');
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _clearUserIdInPrefs();
  }

  Future<void> _storeUserDetails(String userId, String name, String email) async {
    await _firestore.collection('users1234').doc(userId).set({
      'name': name,
      'email': email,
    });
  }

   Future<Map<String, dynamic>?> getUserDetailsFromFirestore(String userId) async {
  final doc = await _firestore.collection('users1234').doc(userId).get();
  return doc.data();
}



  Future<void> _saveUserIdInPrefs(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_prefsUserIdKey, userId);
  }

  Future<String?> getUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_prefsUserIdKey);
  }

  Future<void> _clearUserIdInPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_prefsUserIdKey);
  }
}
