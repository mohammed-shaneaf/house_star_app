import 'package:flutter/material.dart';
import 'package:house_star_app/core/gen/assets.gen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:house_star_app/core/routing/route_names.dart';
import 'package:house_star_app/core/styles/app_colors.dart';
import 'dart:math';

import 'package:house_star_app/features/on_boarding/presentation/views/on_boarding_view.dart';

/// ================================
/// HOME STAR Premium Splash Screen
/// Child-Friendly Task Completion App
/// ================================
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _scaleAnimation;
  late AnimationController _fadeAnimation;
  late AnimationController _starRotateController;
  late AnimationController _sparklesController;
  late AnimationController _illustrationController;

  // Animations
  late Animation<double> _scale;
  late Animation<double> _fade;
  late Animation<double> _starRotate;
  late Animation<double> _sparkles;
  late Animation<double> _illustrationFade;
  late Animation<Offset> _illustrationSlide;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _navigateToOnboarding();
  }

  void _initAnimations() {
    // Main fade controller
    _fadeAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeAnimation, curve: Curves.easeIn));

    // Star scale with bounce
    _scaleAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _scale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _scaleAnimation, curve: Curves.elasticOut),
    );

    // Star rotation
    _starRotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    _starRotate = Tween<double>(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: _starRotateController, curve: Curves.linear),
    );

    // Sparkles animation
    _sparklesController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
    _sparkles = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _sparklesController, curve: Curves.linear),
    );

    // Illustration fade and slide
    _illustrationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _illustrationFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _illustrationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );
    _illustrationSlide =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _illustrationController,
            curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    // Start animation sequence
    _fadeAnimation.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _scaleAnimation.forward();
      _illustrationController.forward();
    });
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingView()),
        );
      }
    });
  }

  @override
  void dispose() {
    _scaleAnimation.dispose();
    _fadeAnimation.dispose();
    _starRotateController.dispose();
    _sparklesController.dispose();
    _illustrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _scaleAnimation,
          _fadeAnimation,
          _starRotateController,
          _sparklesController,
          _illustrationController,
        ]),
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFFF3E0), // Warm cream
                  const Color(0xFFFFE0B2), // Soft orange
                  const Color(0xFFFFF9C4), // Light yellow
                ],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  // Floating sparkles background
                  _buildSparklesBackground(),

                  // Main content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),

                        // Hero illustration with star and children
                        _buildHeroIllustration(),

                        SizedBox(height: 40.h),

                        // App title and tagline
                        _buildTitleSection(),

                        const Spacer(flex: 2),

                        // Loading indicator
                        _buildLoadingIndicator(),

                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ===================================
  // SPARKLES BACKGROUND EFFECT
  // ===================================
  Widget _buildSparklesBackground() {
    return Positioned.fill(
      child: CustomPaint(
        painter: SparklesPainter(
          animationProgress: _sparkles.value,
          opacity: _fade.value,
        ),
      ),
    );
  }

  // ===================================
  // HERO ILLUSTRATION
  // ===================================
  Widget _buildHeroIllustration() {
    return FadeTransition(
      opacity: _illustrationFade,
      child: SlideTransition(
        position: _illustrationSlide,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Soft glow behind star
            Container(
              width: 320.w,
              height: 320.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFFFD54F).withOpacity(0.3 * _fade.value),
                    const Color(0xFFFFD54F).withOpacity(0.0),
                  ],
                ),
              ),
            ),

            // Main star icon with scale animation
            ScaleTransition(
              scale: _scale,
              child: Transform.rotate(
                angle: _starRotate.value * 0.05, // Gentle rotation
                child: _buildMainStar(),
              ),
            ),

            // Decorative elements around star
            _buildDecorativeElements(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainStar() {
    return Container(
      width: 200.w,
      height: 200.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFD54F), // Golden yellow
            Color(0xFFFFB300), // Amber
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB300).withOpacity(0.5),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(40.w),
        child: Assets.images.logo.image(fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildDecorativeElements() {
    return SizedBox(
      width: 280.w,
      height: 280.w,
      child: Stack(
        children: [
          // Small task icons around the star
          _buildTaskIcon(
            icon: Icons.cleaning_services_rounded,
            angle: 0,
            color: const Color(0xFF66BB6A),
          ),
          _buildTaskIcon(
            icon: Icons.book_rounded,
            angle: pi / 3,
            color: const Color(0xFF42A5F5),
          ),
          _buildTaskIcon(
            icon: Icons.brush_rounded,
            angle: 2 * pi / 3,
            color: const Color(0xFFEC407A),
          ),
          _buildTaskIcon(
            icon: Icons.pets_rounded,
            angle: pi,
            color: const Color(0xFFAB47BC),
          ),
          _buildTaskIcon(
            icon: Icons.recycling_rounded,
            angle: 4 * pi / 3,
            color: const Color(0xFF26A69A),
          ),
          _buildTaskIcon(
            icon: Icons.local_florist_rounded,
            angle: 5 * pi / 3,
            color: const Color(0xFFFF7043),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskIcon({
    required IconData icon,
    required double angle,
    required Color color,
  }) {
    final radius = 140.w;
    final x = radius * cos(angle);
    final y = radius * sin(angle);

    return Positioned(
      left: 140.w + x - 20.w,
      top: 140.w + y - 20.w,
      child: FadeTransition(
        opacity: _illustrationFade,
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, size: 22.sp, color: color),
        ),
      ),
    );
  }

  // ===================================
  // TITLE SECTION
  // ===================================
  Widget _buildTitleSection() {
    return FadeTransition(
      opacity: _fade,
      child: Column(
        children: [
          // App name
          Text(
            'Home Star',
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF5D4037), // Warm brown
              letterSpacing: 1.5,
              height: 1.2,
            ),
          ),

          SizedBox(height: 12.h),

          // Tagline
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              'Where kids shine by completing tasks',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF8D6E63), // Light brown
                letterSpacing: 0.5,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 16.h),

          // Decorative line
          Container(
            width: 100.w,
            height: 3.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Color(0xFFFFD54F),
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }

  // ===================================
  // LOADING INDICATOR
  // ===================================
  Widget _buildLoadingIndicator() {
    return FadeTransition(
      opacity: _fade,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24.w,
            height: 24.w,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFFFB300),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            'Loading fun tasks...',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF8D6E63),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ===================================
// SPARKLES PAINTER
// ===================================
class SparklesPainter extends CustomPainter {
  final double animationProgress;
  final double opacity;

  SparklesPainter({required this.animationProgress, required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final random = Random(123);

    // Draw sparkles
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final baseY = random.nextDouble() * size.height;

      // Floating animation
      final floatOffset = sin(animationProgress * 2 * pi + i * 0.3) * 15;
      final y = (baseY + floatOffset) % size.height;

      // Twinkling effect
      final twinkle = (sin(animationProgress * 4 * pi + i) + 1) / 2;

      final colors = [
        const Color(0xFFFFD54F),
        const Color(0xFFFFB300),
        const Color(0xFFFF6F00),
      ];

      paint.color = colors[i % 3].withOpacity(twinkle * 0.4 * opacity);

      // Draw four-point sparkle
      final path = Path();
      final sparkleSize = random.nextDouble() * 3 + 2;

      path.moveTo(x, y - sparkleSize);
      path.lineTo(x + sparkleSize * 0.3, y - sparkleSize * 0.3);
      path.lineTo(x + sparkleSize, y);
      path.lineTo(x + sparkleSize * 0.3, y + sparkleSize * 0.3);
      path.lineTo(x, y + sparkleSize);
      path.lineTo(x - sparkleSize * 0.3, y + sparkleSize * 0.3);
      path.lineTo(x - sparkleSize, y);
      path.lineTo(x - sparkleSize * 0.3, y - sparkleSize * 0.3);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
