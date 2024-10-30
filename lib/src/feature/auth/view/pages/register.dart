import 'package:edu_auxiliary/src/core/server/firebase/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:edu_auxiliary/src/core/constants/context_extension.dart';
import '../../../../core/constants/all_library.dart';
import '../../../../core/routes/app_route_name.dart';
import '../../../../core/storage/sheared_preferens.dart';
import '../../../../core/widgets/text_widget.dart';
import '../widgets/auth_main_button.dart';
import '../widgets/auth_terms_of_use_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();
  String title = "";

  @override
  void didChangeDependencies() async{
    await findRule();
    super.didChangeDependencies();
  }

  Future<void> findRule()async{
    String? result = await StorageService.loadData(key: SharedPrefKey.student);
    if(result != null){
      title = result;
      setState(() {});
    }else{
    String?  result2 = await StorageService.loadData(key: SharedPrefKey.teacher);
      if(result2 != null){
        title = result2;
        setState(() {});
      }
    }
  }

  Future<void>register()async{
    String name = nameCtr.text;
    String email = emailCtr.text;
    String pass = passCtr.text;
    if(name.isEmpty || name.length < 2){
      Utils.fireSnackBar("Name is not filled", context);
    }else if(email.isEmpty || email.length < 2 || !email.contains("@")){
      Utils.fireSnackBar("Email is badly formatted", context);
    }else if(pass.isEmpty || pass.length < 5){
      Utils.fireSnackBar("Password should be more than 6 char", context);
    }else{
      User? user = await AuthService.registerUser(context, fullName: name, email: email, password: pass);
      if(user != null){
        if(mounted){
          Utils.fireSnackBar("Successfully registered", context);
          StorageService.storeData(key: SharedPrefKey.fullName, value: name);
          if (title == "teacher") {
            context.go(AppRouteName.teacher);
          } else if(title == "student"){
            context.push(AppRouteName.home);
          }
        }
      }
    }

  }

  @override
  void dispose() {
    nameCtr.dispose();
    emailCtr.dispose();
    passCtr.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        centerTitle: true,
        title: CustomTextWidget("Register as a $title", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 16),
        leading: IconButton(onPressed: ()=> context.pop(), icon: const Icon(Icons.arrow_back_ios, size: 18)),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: context.appTheme.primary, width: 1),
                image: const DecorationImage(image: AssetImage("assets/images/edu_helper_logo.png")),
              ),
            ),
            const Spacer(flex: 1),
            CustomTextWidget("Create a Edu Auxiliary Account", textColor: context.appTheme.secondary, fontWeight: FontWeight.w600, fontSize: 18),
            const SizedBox(height: 10),
            CustomTextWidget(
              "You are just one step away from joining the world's simplest and smartest Education platform",
              textColor: context.appTheme.secondary,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            const Spacer(flex: 1),
            AuthMainTextField(controller: nameCtr, hintText: "Name"),
            const SizedBox(height: 5),
            AuthMainTextField(controller: emailCtr, hintText: "Email"),
            const SizedBox(height: 5),
            AuthMainTextField(controller: passCtr, hintText: "Password", isPassword: true),
            const Spacer(flex: 1),
            AuthMainButton(
              onPressed: () async => register(),
              title: "Register via Email",
              backgroundColor: Colors.green,
            ),
            const Spacer(flex: 1),
            TermsOfUseWidget(onPressed: () {}, onTap: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.go(AppRouteName.login),
                  child: const CustomTextWidget("Have an account? Sign In", textColor: Colors.blue, fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
            const Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}
