import 'package:flutter/material.dart';
import 'package:tadrebk/get_trainings/get%20_trainings_page.dart';
import 'package:tadrebk/home_screen/about_us_screen/about_us_screen.dart';
import 'package:tadrebk/home_screen/contact%20_us/contact_us_screen.dart';
import 'package:tadrebk/home_screen/home_page.dart';
import 'package:tadrebk/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainingDetailsPage extends StatelessWidget {
  final String image;
  final String companyName;
  final String trainingName;
  final String city;
  final String street;
  final String trainingSpecialization;
  final String trainingCost;
  final String trainingDescription;
  final String startDate;
  final String endDate;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  TrainingDetailsPage({
    required this.image,
    required this.companyName,
    required this.trainingName,
    required this.city,
    required this.street,
    required this.trainingSpecialization,
    required this.trainingCost,
    required this.trainingDescription,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                              (route) => false,
                        );
                      },
                      child: Image.asset('assets/images/img.png'),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.2),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            height: 500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildDetail('Company Name', companyName),
                              ],
                            ),
                            _buildDetail('Training Name', trainingName),
                            _buildDetail('City', city),
                            _buildDetail('Street', street),
                            _buildDetail('Training Specialization', trainingSpecialization),
                            _buildDetail('Training Cost', '$trainingCost LE'),
                            _buildDetail('Start Date', startDate),
                            _buildDetail('End Date', endDate),
                            _buildDetail('Description', trainingDescription),

                            SizedBox(height: 20),


                            Text('*Enter your email to receive training payment details',
                              style: TextStyle(fontSize : 25 ,fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),

                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                _handlePayment(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                              ),
                              child: Text(
                                'Pay Now',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
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
  }

  Widget _buildDetail(String title, String value) {
    if (value.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void _handlePayment(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _processPayment(context, 'Cash');
                },
                child: Text('Cash'),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  _processPayment(context, 'Credit Card');
                },
                child: Text('Credit Card'),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  _processPayment(context, 'Electronic Wallet');
                },
                child: Text('Electronic Wallet'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _processPayment(BuildContext context, String paymentMethod) {
    final String fullName = fullNameController.text;
    final String email = emailController.text;
    final String courseDetails = '''
    Training Name: $trainingName
    Company Name: $companyName
    City: ${city.isNotEmpty ? city : 'Not available'}
    Street: ${street.isNotEmpty ? street : 'Not available'}
    Training Specialization: $trainingSpecialization
    Start Date: $startDate
    End Date: $endDate
    Training Cost: $trainingCost LE
    Description: $trainingDescription
  ''';

    final String mailtoLink = 'mailto:$email?subject=Course Registration&body=$courseDetails';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Payment Successful via $paymentMethod!'),
              SizedBox(height: 12),
              Text('Training Details:'),
              Text(courseDetails),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the Payment Confirmation dialog
                  Navigator.of(context).pop(); // Close the Payment Method selection dialog
                  launch(mailtoLink); // Launch email client with the pre-filled details
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
