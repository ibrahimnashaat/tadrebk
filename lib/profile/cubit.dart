



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadrebk/profile/states.dart';
import 'package:tadrebk/profile/user_model.dart';

class ProfileCubit extends Cubit<ProfileStatus> {
  ProfileCubit() : super(ProfileInitialStates());
  static ProfileCubit get(context) => BlocProvider.of(context);




  UserModel? userModel;


  Future<void> getUserData()
  async {
    emit(ProfileGetUserLoadingStates());
    final uId = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel=UserModel.fromJson(value.data()!);
      print(userModel!.uId);

      emit(ProfileGetUserSuccessStates());
    }).catchError((e){
      emit(ProfileGetUserErrorStates());
    });


  }



}