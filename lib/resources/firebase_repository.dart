import 'package:connect/resources/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMetods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMetods.getCurrentUser();



}
