import 'package:flutter/material.dart';
import 'package:glowvy/Utils/app_assets.dart';
import 'package:glowvy/Utils/app_theme.dart';
import '../Utils/app_text.dart';
import '../models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: 'Various Collections Of The Latest Products',
      description: 'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: 'Complete Collection Of Colors And Sizes',
      description:
      'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    ),
    OnboardingModel(
      image: AppAssets.onboarding3,
      title: 'Find The Most Suitable Outfit For You',
      description:
      'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: SafeArea(
        child: Column(
          children: [
            // PAGES
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onboardingList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: Image.asset(
                            item.image,
                            height: screenSize.height * 0.45,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: AppFontStyles.titleSemiBold(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: AppFontStyles.titleRegular(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingList.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: currentIndex == index ? 16 : 6,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppTheme.appColor
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Create Account',
                    style: AppFontStyles.titleSemiBold(
                      color: AppTheme.white,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text(
                'Already Have an Account',
                style: AppFontStyles.titleMedium(
                  color: AppTheme.appColor,
                  fontSize: 16
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}