import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/src/authentication.dart';
import '../../firebase_options.dart';

final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
});

final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});
