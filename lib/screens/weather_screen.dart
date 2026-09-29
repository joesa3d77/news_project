import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// الشاشة دي شكلها Static دلوقتي (بيانات ثابتة).
/// لو حبيت توصلها بـ API حقيقي (زي OpenWeatherMap)، هتستبدل
/// القيم الثابتة تحت بقيم جايه من الـ Response بتاع الـ API.
///
/// ملحوظة عن الشكل (Design):
/// الشاشة فيها لونين خلفية زي التصميم بالظبط:
/// - الجزء العلوي (الترحيب) خلفيته لافندر فاتح (AppColors.background).
/// - باقي الشاشة (Cairo - EG وباقي البيانات) خلفيته أبيض.
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // الحاوية دي بتغطي كل الشاشة بلون أبيض، عشان تبقى مختلفة عن
      // خلفية الـ MainScreen اللافندر اللي بتتشارك فيها كل الشاشات.
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cairo - EG',
                        style: TextStyle(color: AppColors.grey, fontSize: 16)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('27',
                            style: TextStyle(
                                fontSize: 64, fontWeight: FontWeight.bold)),
                        Icon(Icons.wb_sunny, color: Colors.amber, size: 40),
                      ],
                    ),
                    const Text('Clear - Clear Sky',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const Text('Feels like 28',
                        style: TextStyle(color: AppColors.grey)),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        _statBox(Icons.thermostat, '72°', 'Fahrenheit'),
                        const SizedBox(width: 16),
                        _statBox(Icons.air, '134 mp/h', 'Pressure'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _statBox(Icons.wb_sunny_outlined, '0.2', 'UV Index'),
                        const SizedBox(width: 16),
                        _statBox(Icons.water_drop_outlined, '48%', 'Humidity'),
                      ],
                    ),
                    const Spacer(),
                    _buildChangeLocationButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// الجزء العلوي بخلفية اللافندر الفاتح، بالظبط زي التصميم.
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good Morning,', style: TextStyle(color: AppColors.grey)),
              Text('joe,menna', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text('Sun 9 April, 2023',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.wb_sunny, color: Colors.amber, size: 18),
              SizedBox(width: 4),
              Text('Sunny 32°C'),
            ],
          ),
        ],
      ),
    );
  }

  /// زرار "Change Location" وأيقونة البين بعد النص، زي ترتيبها في التصميم.
  Widget _buildChangeLocationButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {
          // لاحقاً: افتح شاشة اختيار مكان تانية
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Change Location'),
            SizedBox(width: 8),
            Icon(Icons.location_on_outlined, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _statBox(IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,



        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(label, style: const TextStyle(color: AppColors.grey, fontSize: 11)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
