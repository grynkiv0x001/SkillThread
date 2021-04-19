import 'package:firebase_auth/firebase_auth.dart';

import 'package:skill_thread/models/User.dart';
import 'package:skill_thread/services/DatabaseService.dart';


class AuthService {

	final FirebaseAuth _auth = FirebaseAuth.instance;

	// Create user using received data from Firebase
	User _newUserFromDB(FirebaseUser user) {
		return user != null ? User(uid: user.uid, email: user.email) : null;
	}

	// Create auth stream of user object
	Stream<User> get user {
		return _auth.onAuthStateChanged.map(_newUserFromDB);
	}

	// Anonymous sign-in
	Future signInAnon() async {

		try {
			// Try to sign in anonymously and get result
			AuthResult result = await _auth.signInAnonymously();

			// Get user data from result above
			FirebaseUser user = result.user;

			// Return user data after successful sign-in
			return _newUserFromDB(user);

		} catch (e) {
			// Print error message if failed and return null-value
			print(e.toString());

			return null;
		}
	}

	// Email & password sign-in 
	Future emailPasswordSignIn(String email, String password) async {

		try {
			// Sign in to existing Firebase user using email & password
			AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);

			// Store user before adding it to stream (current user)
			FirebaseUser user = result.user;

			// Convert user data from DB to my User-model and add it to the User-stream
			return _newUserFromDB(user);

		} catch (e) {
			print(e.toString());

			return null;
		}
	}

	// Registration
	Future emailPasswordSignUp(String email, String password, String name) async {

		try {
			// Add new user to DB and update the auth stream
			AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

			// Store just added user
			FirebaseUser user = result.user;

			// Create a record in DB for the new user by userID
			await DatabaseService(uid: user.uid).updateUserData(name, null, null, null);

			// Executing method that actually add new user
			return _newUserFromDB(user);

		} catch (e) {
			print(e.toString());

			return null;
		}
	}

	// Sign out
	Future signOut() async {

		try {
			// Logout
			return await _auth.signOut();

		} catch (e) {
			// In case if unable to logout
			print(e.toString());

			return null;
		}
	}
}