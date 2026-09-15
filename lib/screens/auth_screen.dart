import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget { const AuthScreen({super.key}); @override State<AuthScreen> createState()=>_AuthScreenState(); }
class _AuthScreenState extends State<AuthScreen>{
  final email=TextEditingController(), pass=TextEditingController(); bool login=true, busy=false; String error='';
  Future<void> submit() async {
    setState(()=>busy=true);
    try { if(login) { await AuthService().signIn(email.text.trim(), pass.text); } else { await AuthService().signUp(email.text.trim(), pass.text); } }
    catch(e){ setState(()=>error=e.toString()); } finally { if(mounted) setState(()=>busy=false); }
  }
  @override Widget build(BuildContext context)=>Scaffold(body: SafeArea(child: Center(child: SingleChildScrollView(padding:const EdgeInsets.all(24),child:Column(children:[
    const Icon(Icons.public,size:70), const SizedBox(height:12), const Text('Bharat Social',style:TextStyle(fontSize:30,fontWeight:FontWeight.bold)),
    const Text('Connect India. Share India.'), const SizedBox(height:30),
    TextField(controller:email,keyboardType:TextInputType.emailAddress,decoration:const InputDecoration(labelText:'Email',border:OutlineInputBorder())),
    const SizedBox(height:12), TextField(controller:pass,obscureText:true,decoration:const InputDecoration(labelText:'Password',border:OutlineInputBorder())),
    if(error.isNotEmpty) Padding(padding:const EdgeInsets.all(8),child:Text(error,style:const TextStyle(color:Colors.red))),
    const SizedBox(height:12), SizedBox(width:double.infinity,child:FilledButton(onPressed:busy?null:submit,child:Text(busy?'Please wait...':(login?'Login':'Create account')))),
    TextButton(onPressed:()=>setState(()=>login=!login),child:Text(login?'New here? Create account':'Already have an account? Login')),
  ])))));
}
