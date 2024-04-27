import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tadrebk/get_trainings/get%20_trainings_page.dart';
import 'package:tadrebk/home_screen/about_us_screen/about_us_screen.dart';
import 'package:tadrebk/home_screen/contact%20_us/contact_us_screen.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/shared/components/components.dart';

import '../shared/styles/colors.dart';
import '../shared/styles/fonts.dart';

class GetAllTrainings extends StatefulWidget {
  const GetAllTrainings({Key? key}) : super(key: key);

  @override
  State<GetAllTrainings> createState() => _GetAllTrainingsState();
}

class _GetAllTrainingsState extends State<GetAllTrainings> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                ],
              ),
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
                                onTap:(){
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()), (route) => false,
                                  );
                                },
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap:(){
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => GetTrainings()), (route) => false,
                                  );
                                },
                                child: Text(
                                  'Training',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ContactUsScreen()),
                                  );
                                },
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AboutUsScreen()),
                                  );
                                },
                                child: Text(
                                  'About Us',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mainColor,
                              width: 2,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: Colors.grey.withOpacity(0.5),
                            size: 20,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color:Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      children: [
                        Text(
                          'All',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Training',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontFamily: mainFont,
                              color: mainColor),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Of',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Tadrebk',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: mainFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100,right: 100, top: 20,bottom: 40),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.08,
                    width: MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                        color: HexColor('#B5C9E7'),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 80,),
                        category(context, 'programming'),
                        category(context, 'Contracting'),
                        category(context, 'Marketing'),
                        category(context, 'Accounting'),
                        category(context, 'Communication'),
                        SizedBox(width: 80,),
                      ],
                    ),
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.only(
                    left:100.0,
                    right: 100.0,
                  ),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<DocumentSnapshot> documents = snapshot.data!.docs;

                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 0.88,
                          ),
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            var data = documents[index].data() as Map<String, dynamic>;
                            String companyName = data['companyName'] ?? 'No Company Name';

                            return trainingID(
                              image: data['image'] ?? '',
                              companyName: companyName,
                              trainingName: data['trainingName'] ?? '',
                              city: data['city'] ?? '',
                              street: data['street'] ?? '',
                              trainingSpecialization: data['trainingSpecialization'] ?? '',
                              trainingCost: data['trainingCost'] ?? '',
                              trainingDescription: data['trainingDescription'] ?? '',
                              startDate: data['startDate'] ?? '',
                              endDate: data['endDate'] ?? '',
                              context: context,
                            );
                          },
                        );
                      },
                    )

                ),
                SizedBox(
                  height: 60,
                ),
                footerPage(context),
              ],
            ),
          ],
        ),
      ),
    );


  }
}


Widget category (
    context,
    name,

    ){
  return Container(
    height: MediaQuery.of(context).size.width * 0.04,
    width: MediaQuery.of(context).size.width * 0.1,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
    ),
    child: Center(
      child: Text(
        '$name',
        style: TextStyle(
            fontFamily: mainFont,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: mainColor
        ),
      ),
    ),
  );
}
