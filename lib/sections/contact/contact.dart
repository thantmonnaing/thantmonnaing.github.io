import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:tmn_portfolio/services/mail_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import 'social_card.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For Project inquiry and information",
            color: kTextLightColor,
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({
    Key? key,
  }) : super(key: key);


  Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String linkedinUrl = 'https://www.linkedin.com/in/thant-mon-naing-694784265/';
    String whatsappUrl = 'https://wa.me/959793449588';
    String telegramUrl = 'https://t.me/thantmonnaing';
    String viberUrl = 'viber://chat?number=%2B959793449588';

    return Container(
      constraints: const BoxConstraints(maxWidth: 1110),
      margin: const EdgeInsets.only(top: kDefaultPadding * 2),
      padding: const EdgeInsets.all(kDefaultPadding * 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Wrap(
            children: [
              SocalCard(
                color: const Color(0xFFD9FFFC),
                iconSrc: "assets/images/linkin_logo.png",
                name: 'LinkedIn',
                press: () async => await launchURL(linkedinUrl),
              ),
              const SizedBox(width: 10,),
              SocalCard(
                color: const Color(0xFFE4FFC7),
                iconSrc: "assets/images/whatsapp_logo.png",
                name: 'WhatsApp',
                press: () async => await launchURL(whatsappUrl),
              ),
              const SizedBox(width: 10,),
              SocalCard(
                color: const Color(0xFFE4FFC7),
                iconSrc: "assets/images/telegram_logo.png",
                name: 'Telegram',
                press: () async => await launchURL(telegramUrl),
              ),
              const SizedBox(width: 10,),
              Visibility(
                visible: !kIsWeb,
                child: SocalCard(
                  color: const Color(0xFFE8F0F9),
                  iconSrc: "assets/images/viber_logo.png",
                  name: 'Viber',
                  press: () async => await launchURL(viberUrl),
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final GlobalKey<FormState> myForm = GlobalKey();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: myForm,
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 470),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Your Name*",
                hintText: "Enter Your Name",
              ),
              validator: (value) {
                if (value == null || value
                    .trim()
                    .isEmpty) {
                  return '*required';
                }
                return null;
              },
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 470),
            child: TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value
                    .trim()
                    .isEmpty) {
                  return '*required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Email Address*",
                hintText: "Enter your email address",
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 470),
            child: TextFormField(
              controller: typeController,
              validator: (value) {
                if (value == null || value
                    .trim()
                    .isEmpty) {
                  return '*required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Project Type*",
                hintText: "Select Project Type",
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 470),
            child: TextFormField(
              controller: budgetController,
              validator: (value) {
                if (value == null || value
                    .trim()
                    .isEmpty) {
                  return '*required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Project Budget*",
                hintText: "Select Project Budget",
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery
                .of(context)
                .size
                .width),
            child: TextFormField(
              controller: descController,
              validator: (value) {
                if (value == null || value
                    .trim()
                    .isEmpty) {
                  return '*required';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Description*",
                hintText: "Write some description",
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Center(
              child: InkWell(
                onHover: (value) {
                  setState(() {
                    isHover = value;
                  });
                },
                onTap: () async {
                  if (myForm.currentState!.validate()) {
                    SmartDialog.showLoading();
                    await MailService().sentMail(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        projectType: typeController.text.trim(),
                        projectBudget: budgetController.text.trim(),
                        description: descController.text.trim()).then((value){
                          SmartDialog.dismiss();
                          if(value){
                            _showThankYouAlert();
                          }else{
                            _showTryAgainAlert();
                          }
                    });
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: kMainColor.withOpacity(0.9),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                      boxShadow:  [
                        (isHover) ? const BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                            blurStyle:
                            BlurStyle.inner // changes position of shadow
                        ) : const BoxShadow(
                            color: kNameTextColor,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                            blurStyle:
                            BlurStyle.outer // changes position of shadow
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/contact_icon.png", width: 30,),
                      const SizedBox(width: 10,),
                      const Text(
                        "Contact Me!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }

  _showThankYouAlert(){
    SmartDialog.show(
      builder: (context) {
        Timer(const Duration(seconds: 2), () {
          SmartDialog.dismiss();
        });

        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Thank You! 😺"),
              TextButton(
                child: const Icon(Icons.close_rounded),
                onPressed: () => SmartDialog.dismiss(),
              )
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/thankyou.gif',
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              const Text(
                "Your support means a lot!",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  _showTryAgainAlert(){
    SmartDialog.show(
      builder: (context) {
        Timer(const Duration(seconds: 3), () {
          SmartDialog.dismiss();
        });

        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Apology 😔"),
              TextButton(
                child: const Icon(Icons.close_rounded),
                onPressed: () => SmartDialog.dismiss(),
              )
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/tryagain.gif',
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              const Text(
                "Sorry for the inconvenience. 🙇‍",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}