import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LightShareFirebaseUser {
  LightShareFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

LightShareFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LightShareFirebaseUser> lightShareFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<LightShareFirebaseUser>(
            (user) => currentUser = LightShareFirebaseUser(user));
