import 'package:emailjs/emailjs.dart' as emailjs;

class MailService {
  final String SERVICE_ID = 'thantmonnaing';
  final String TEMPLATE_ID = 'template_khqlie9';
  final String PUBLIC_KEY = 'fGMwU1_BkSZXr3s_N';
  final String PRIVATE_KEY = 'u46x2sQALE0sDmd_FLRBJ';

  Future<bool> sentMail(
      {required String name,
      required String email,
      required String projectType,
      required String projectBudget,
      required String description}) async{
    Map<String, dynamic> templateParams = {
      'name': name,
      'email': email,
      'projectType': projectType,
      'projectBudget':projectBudget,
      'description':description
    };
    try {
      await emailjs.send(
        SERVICE_ID,
        TEMPLATE_ID,
        templateParams,
        emailjs.Options(
          publicKey: PUBLIC_KEY,
          privateKey: PRIVATE_KEY
        ),
      );
      print('Success!');
      return true;
    } catch (error) {
      if (error is emailjs.EmailJSResponseStatus) {
        print('ERROR... ${error.status}: ${error.text}');
      }
      print(error.toString());
      return false;
    }
  }
}
