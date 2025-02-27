import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.primary,
              AppTheme.primary.withOpacity(0.8),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              // لوجو التطبيق
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.emergency,
                  size: size.width * 0.2,
                  color: AppTheme.primary,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              // عنوان التطبيق
              Text(
                'أسعفني',
                style: TextStyle(
                  fontSize: size.width * 0.12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'خدمة إسعاف فورية تصلك أينما كنت',
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // مربع الأزرار
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildButton(
                      context: context,
                      text: 'دخول كمسعف',
                      icon: Icons.medical_services,
                      isPrimary: true,
                      onPressed: () => _navigateToParamedicHome(context),
                    ),
                    const SizedBox(height: 16),
                    _buildButton(
                      context: context,
                      text: 'طلب مساعدة',
                      icon: Icons.emergency,
                      isPrimary: false,
                      onPressed: () => _navigateToPatientHome(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required bool isPrimary,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppTheme.primary : Colors.white,
        foregroundColor: isPrimary ? Colors.white : AppTheme.primary,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isPrimary ? Colors.transparent : AppTheme.primary,
          ),
        ),
        elevation: isPrimary ? 2 : 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToParamedicHome(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).setUserType('paramedic');
    Navigator.pushReplacementNamed(context, '/paramedic_home');
  }

  void _navigateToPatientHome(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).setUserType('patient');
    Navigator.pushReplacementNamed(context, '/patient_home');
  }
}
