import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerStatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignupScreen> {
  //final _formKey = GlobalKey<FormState>();

  Future<bool> proceed(BuildContext context) async {
    //if (_formKey.currentState!.validate()) {
    //  return true;
    //}
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(child: Text("Signup form")),
    );
  }
}
