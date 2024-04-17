import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng(37.5233273, 126.921252);

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
                      ElevatedButton(onPressed: () {}, child: Text('출근하기')),
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
