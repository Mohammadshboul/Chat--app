import 'package:chatapplication/firebase_options.dart';
import 'package:chatapplication/pages/auth_cubit/cubit/auth_cubit.dart';
import 'package:chatapplication/pages/chat_cubit/chat_cubit.dart';
import 'package:chatapplication/pages/chat_page.dart';
import 'package:chatapplication/pages/login_page.dart';
import 'package:chatapplication/pages/resgister_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => RegseterCubit()),
        BlocProvider(create: (context)=>AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),

      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage()
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
