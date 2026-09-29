import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../constants/app_colors.dart';

/// شاشة الـ Search: نفس شكل التصميم بالظبط.
/// - صف فوق فيه اسم المستخدم (ثابت "joe") وجنبه أيقونة بحث للشكل فقط،
///   من غير أي وظيفة أو إمكانية تعديل.
/// - خريطة OpenStreetMap تحته (من غير API Key).
/// - الدوس على الخريطة بيحط عليها علامة (Marker).
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // إحداثيات ابتدائية (القاهرة كمثال) - غيّرها للمكان اللي محتاجه
  static const LatLng _initialPosition = LatLng(30.0444, 31.2357);

  // اسم المستخدم ثابت في الكود - عايز تغيّره تبدّل القيمة هنا بس
  static const String _username = 'joe';

  final MapController _mapController = MapController();

  // العلامات الظاهرة على الخريطة (بتتزود لما تدوس على الخريطة)
  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _addMarker(_initialPosition);
  }

  // الدوس على أي نقطة في الخريطة بيحط عليها علامة جديدة
  void _onMapTap(TapPosition tapPosition, LatLng point) {
    _addMarker(point);
  }

  void _addMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          point: point,
          width: 40,
          height: 40,
          child: const Icon(
            Icons.location_on,
            color: AppColors.primary,
            size: 40,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildTopBar(),
          ),
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _initialPosition,
                    initialZoom: 13,
                    onTap: _onMapTap,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.khabar_app',
                    ),
                    MarkerLayer(markers: _markers),
                  ],
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 24,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // هنا تحط اللوجيك بتاعك
                      },
                      child: const Text('Get Started'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// الصف الثابت زي التصميم: اسم المستخدم + أيقونة بحث للشكل فقط
  /// (مفيش أي onTap أو Logic، دور الأيقونة هنا بصري بس).
  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.person_outline, color: AppColors.grey),
          SizedBox(width: 10),
          Text(_username),
          Spacer(),
          Icon(Icons.search, color: AppColors.grey),
        ],
      ),
    );
  }
}
