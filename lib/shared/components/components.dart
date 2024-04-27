import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/get_trainings/get%20_trainings_page.dart';
import 'package:tadrebk/get_trainings/training_details_screen.dart';
import 'package:tadrebk/home_screen/about_us_screen/about_us_screen.dart';
import 'package:tadrebk/home_screen/contact%20_us/contact_us_screen.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/shared/styles/colors.dart';
import 'package:tadrebk/shared/styles/fonts.dart';
import 'package:tadrebk/sign_up_screen/cubit.dart';
import 'package:url_launcher/url_launcher.dart';
// reusable
///------------------------[defaultButton/*----------------------------Start--
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = const Color(0xFF3D5A98), // اللون الذي تريده
  bool isUpperCase = true,
  double radius = 5.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
///------------------------[defaultButton/*----------------------------Start--
////////---------------------------------------------------------------------------
///------------------------[defaultTextButton/*----------------------------Start--

Widget defaultTextButton({ required Function function , required String text }) =>TextButton(
  onPressed: () => function() ,
  child: Text(text.toUpperCase(),
    style: TextStyle(fontWeight: FontWeight.w900),
  ),

);
///------------------------[defaultTextButton/*----------------------------End--
//---------------------------------------------------------------------------
///------------------------[defaultFormField/*----------------------------Start--

Widget defaultFormField({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  bool isPassword = false,
  required String? Function(String?) validate,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  String? hintText,
  required bool obscureText, // إضافة المعامل هنا
}) =>
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextFormField(
        keyboardType: type,
        controller: controller,
        obscureText: obscureText, // استخدام المعامل هنا
        onFieldSubmitted: onSubmit as void Function(String)?,
        onChanged: onChanged as void Function(String)?,
        enabled: isClickable,
        onTap: onTap as void Function()?,
        validator: validate,
        decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          suffixIcon: suffix != null
              ? InkWell(
            onTap: () {
              suffixPressed?.call();
            },
            child: Icon(suffix, color: Colors.grey, size: 16),
          )
              : null,
        ),
      ),
    );


///------------------------[DefaultFormFieldValidator/*--------------------start--
//-----------------------------------------------------------------------
class defaultFormFieldValidator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
      return 'Password must contain uppercase and lowercase letters, numbers, and special characters';
    }
    return null;
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
      return 'Please enter a valid Egyptian phone number';
    }
    return null;
  }

  static void showPasswordSnackbar(BuildContext context, String? errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage ?? 'Please enter a strong password',
          style: TextStyle(color: errorMessage != null ? Colors.red : Colors.green),
        ),
      ),
    );
  }
}

///------------------------[DefaultFormFieldValidator/*--------------------End--


///------------------------[headerPage/*--------------------start--

Widget headerPage(context) => Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset('assets/images/img.png'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 18,
                            color: mainColor,
                            fontFamily: "Poppins",
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetTrainings()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Training',
                          style: TextStyle(
                            fontSize: 18,
                            color: mainColor,
                            fontFamily: "Poppins",
                              fontWeight: FontWeight.w900

                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsScreen()),
                          );
                        },
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 18,
                            color: mainColor,
                            fontFamily: "Poppins",
                              fontWeight: FontWeight.w900

                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutUsScreen()),
                          );
                        },
                        child: Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: 18,
                            color: mainColor,
                            fontFamily: "Poppins",
                              fontWeight: FontWeight.w900

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

//
///------------------------[headerPage/*--------------------end--

///------------------------[navigateAndFininsh/*--------------------End--
//-----------------------------------------------------------------------


Widget verticalSpace() => SizedBox(height: 30,);
Widget horthontalSpace() => SizedBox(width: 30,);

///------------------------[trainingID/*--------------------Start--------------
//-----------------------------------------------------------------------
Widget trainingID({
  required String city,
  required String image,
  required String street,
  required String companyName,
  required BuildContext context,
  required String trainingSpecialization,
  required String trainingCost,
  required String trainingDescription,
  required String startDate,
  required String endDate,
  required String trainingName,
}) =>
    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 15 / 8,
              child: image.isEmpty
                  ? Image.asset(
                'assets/images/img_20.png',
                fit: BoxFit.cover,
              )
                  : Image.network(
                '$image',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainingSpecialization,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'mainFont',
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    companyName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mainFont',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16),
                  Text(
                    trainingDescription,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'mainFont',
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '$trainingCost.LE',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'mainFont',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        trainingCost,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'mainFont',
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.date_range_outlined,
                        color: Colors.grey.withOpacity(0.5),
                        size: 16,
                      ),
                      Text(
                        '$startDate',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'mainFont',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrainingDetailsPage(
                              image: image,
                              companyName: companyName,
                              trainingName: trainingName,
                              trainingSpecialization: trainingSpecialization,
                              trainingCost: trainingCost,
                              trainingDescription: trainingDescription,
                              startDate: startDate,
                              endDate: endDate,
                              city: '',
                              street: '',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: HexColor('#1B3358'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'View details',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'mainFont',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget buildTrainingCard(Map<String, dynamic> data, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TrainingDetailsPage(
            image: data['image'] ?? '',
            companyName: data['companyName'] ?? '',
            trainingName: data['trainingName'] ?? '',
            trainingSpecialization: data['trainingSpecialization'] ?? '',
            trainingCost: data['trainingCost'] ?? '',
            trainingDescription: data['trainingDescription'] ?? '',
            startDate: data['startDate'] ?? '',
            endDate: data['endDate'] ?? '', city: '', street: '',

          ),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              data['image'] ?? '',
              height: 70,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            data['companyName'] ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            data['trainingName'] ?? '',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}

///------------------------[trainingID/*--------------------End--
//-------------------------------------------------------------


///------------------------[introComponents]/*--------------------start--
// Widget introComponents(BuildContext context, String image, String text1, String text2) {
//   return Expanded(
//     child: Padding(
//       padding: const EdgeInsets.only(left: 20, top: 60),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.23,
//         height: MediaQuery.of(context).size.height * 0.6,
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.14,
//               height: MediaQuery.of(context).size.height * 0.26,
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               text1,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: mainFont,
//                 color: mainColor,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: Text(
//                 text2,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: mainFont,
//                   color: Colors.white,
//                   letterSpacing: 1.5,
//                 ),
//                 textAlign: TextAlign.start,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 3, // Limiting to 3 lines for better UI
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

//-------------------------------------------------------------

///------------------------[introComponents]/*--------------------End--
Widget introComponents(
    BuildContext context,
    String image,
    String text1,
    String text2,
    ) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(left: 20, top: 60),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.23,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).size.height * 0.26,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: mainFont,
                color: mainColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView( // للتعامل مع النص الطويل
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    text2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: mainFont,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
///----------------------------------------------------------------------
Widget introContentComponents(BuildContext context) {
  return Container(
    color: Colors.black,
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        introComponents(
          context,
          'assets/images/img_18.png',
          'Training',
          'Explore the realm of knowledge and gain new skills through our innovative platform for course delivery. Embark on an exciting learning journey and acquire life-changing',
        ),
        const SizedBox(width: 8),
        introComponents(
          context,
          'assets/images/img_19.png',
          'Certificate',
          'We provide certified credentials upon successfully completing courses, enhancing job opportunities and personal professional development',
        ),
        const SizedBox(width: 8),
        introComponents(
          context,
          'assets/images/img_20.png',
          'Find your training',
          'The search feature enables users to easily find relevant courses based on their interests and needs',
        ),
        const SizedBox(width: 8),
        introComponents(
          context,
          'assets/images/img_21.png',
          'Add Training',
          'The platform enables companies to provide customized training and effectively track participant progress',
        ),
      ],
    ),
  );
}



//-------------------------------------------------------------
///------------------------[_launchUrl]/*--------------------start--


void _launchUrl(
    link,
    ) async {
  String? url = link;
  if (await canLaunch(url??'')) {
    await launch(url??'');
  } else {
    throw 'Could not launch $url';
  }
}

///------------------------[trainingID/*--------------------End--
//-------------------------------------------------------------
///------------------------[footerPage/*--------------------start--


Widget footerPage(context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.45,
    decoration:BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          HexColor('#1B3358'),
          mainColor
        ],
      ),
    ),
    child: Column(

      children:[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.05,
        ),
        Row(

          children: [
            Image.asset('assets/images/img_14.png',
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.2,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.25,
              height: MediaQuery.of(context).size.height*0.35,
              padding: EdgeInsets.only(left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text('Contact Us',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                        fontWeight: FontWeight.bold,
                        color:Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                        child: Icon(Icons.email_outlined,color: mainColor,size: 20,),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (){

                          _launchUrl('https://mail.google.com/mail/u/0/');
                        },
                        child: Text('support@gmail.com',

                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: mainFont,
                              color:Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.25,
              height: MediaQuery.of(context).size.height*0.35,

              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('About',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: mainFont,
                          color:Colors.white

                      ),

                    ),
                    Text('Features',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    Text('Pricing',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    Text('Gallery',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: mainFont,
                          color:Colors.white


                      ),

                    ),
                    Text('Team',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: mainFont,
                          color:Colors.white

                      ),

                    ),

                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.25,
              height: MediaQuery.of(context).size.height*0.35,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text('Subscribe',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                        fontWeight: FontWeight.bold,
                        color:Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: mainColor,
                    width: MediaQuery.of(context).size.width * 0.18,
                    height: MediaQuery.of(context).size.height*0.04,

                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: TextEditingController(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'this field is empty';
                        }
                      },
                      decoration: InputDecoration(


                        hintText: '  Email',


                        hintStyle: TextStyle(color: Colors.white,fontSize: 10),


                        enabledBorder: OutlineInputBorder(

                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: mainColor,


                    child:   Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.height*0.04,
                      color: HexColor('#B5C9E7'),
                      child: Center(
                        child: Text('Subscribe',
                          style: TextStyle(
                            color: mainColor,
                            fontFamily: 'Poppins',
                            fontSize: 15,

                          ),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  ),
                  Text('Follow Us',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: mainFont,
                        fontWeight: FontWeight.bold,
                        color:Colors.white
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Row(

                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor('#B5C9E7'),
                        child: Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundColor: HexColor('#B5C9E7'),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundColor: HexColor('#B5C9E7'),
                        child: Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundColor: HexColor('#B5C9E7'),
                        child: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100,right: 100),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.05,
            child: Row(
              children: [
                Text('© 2023 All Rights Reserved',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
                Spacer(),
                Text('Privacy Policy',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Terms of Use',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Sales and Refunds',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Legal',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Site Map',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),

              ],
            ),
          ),
        ),
      ],

    ),
  );
}

//-------------------------------------------------------------
///------------------------[footerPage/*--------------------End--

//-------------------------------------------------------------
///------------------------[showToast/*--------------------start--
void showToast({required String msg, required ToastStates state})=>Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0);

enum ToastStates{ERORR, SUCCESS, WARNING}

Color chooseToastColor(ToastStates test){
  Color color;
  switch(test){

    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERORR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.orange;
      break;



  }

  return color;
}

//-------------------------------------------------------------
///------------------------[showToast/*--------------------End--
//--------------------------------------------------------------











