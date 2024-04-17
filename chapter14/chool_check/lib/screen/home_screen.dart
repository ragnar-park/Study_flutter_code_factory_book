import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng(37.5233273, 126.921252);

  // 회사 위치 마커 선언
  static final Marker marker =
      Marker(markerId: MarkerId('company'), position: companyLatLng);

  static final Circle circle = Circle(
    circleId: CircleId('choolCheckCircle'),
    center: companyLatLng,
    fillColor: Colors.blue.withOpacity(0.5), // 원의 색상
    radius: 100, // 원의 반지름(미터단위)
    strokeColor: Colors.blue, // 원의 테두리 색
    strokeWidth: 1, // 원의 테두리 둒[
  );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: renderAppBar(),
        body: FutureBuilder<String>(
          future: checkPermission(),
          builder: (context, snapshot) {
            // 로딩 상태
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == '위치 권한이 허가 되었습니다.') {
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: GoogleMap(
                      initialCameraPosition:
                          //  CameraPosition은 카메라의 위치와 방향을 나타내는 클래스
                          CameraPosition(
                              target: companyLatLng, zoom: 16 // 확대 정도
                              ),
                      myLocationEnabled: true,
                      markers: Set.from([marker]), // Set로 Marker 제공
                      circles: Set.from([circle]), // Set로 Circle 제공
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timelapse_outlined,
                        color: Colors.blue,
                        size: 50.0,
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                          onPressed: () async {
                            final curPosition =
                                await Geolocator.getCurrentPosition(); // 현재 위치

                            final distance = Geolocator.distanceBetween(
                              curPosition.latitude, // 현재 위치 위도
                              curPosition.longitude, // 현재 위치 경도
                              companyLatLng.latitude, // 회사 위치 위도
                              companyLatLng.longitude, // 회사 위치 경도
                            );

                            bool canCheck =
                                distance < 100; // 100미터 이내에 있으면 출근 기능

                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: Text('출근하기'),

                                    // 출근 가능 여부에 따라 다른 메시지 제공
                                    content: Text(
                                      canCheck
                                          ? '출근을 하시겠습니까?'
                                          : '출근할 수 없는 위치입니다.',
                                    ),
                                    actions: [
                                      TextButton(
                                        // 취소를 누르면 false 반환
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text('취소'),
                                      ),
                                      if (canCheck) // 출근 가능한 상태일 떄만  [출근하기] 버튼 제공
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                          child: Text('출근하기'),
                                        ),
                                    ],
                                  );
                                });
                          },
                          child: Text('출근하기!')),
                    ],
                  ))
                ],
              );
            }

            // 권한 없는 상태
            return Center(
              child: Text(
                snapshot.data.toString(),
              ),
            );
          },
        ));
  }

  AppBar renderAppBar() {
    // AppBar를 구현하는 함수
    return AppBar(
      centerTitle: true,
      title: Text(
        '오늘도 출첵',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    // 위치 서비스 활성화 여부 확인

    if (!isLocationEnabled) {
      // 위치 서비스 활서오하 안 됨
      return '위치 서비스를 확성화해주세요.';
    }

    // 위치 권한 확인
    LocationPermission checkedPerMission = await Geolocator.checkPermission();

    // 위치 권한 거절됨
    if (checkedPerMission == LocationPermission.denied) {
      // 위치 권한 요청
      checkedPerMission = await Geolocator.requestPermission();

      if (checkedPerMission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    // 위치 권한 거절됨 (앱에서 재요청 불가);
    if (checkedPerMission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 설정에서 허가해주세요.';
    }

    // 위 모든 조건이 통과되면 위치 권한 허가 완료
    return '위치 권한이 허가 되었습니다.';
  }
}
