# SwiftUI + CleanArvhitecture

## Data 흐름
- View가 ViewModel의 method 호출
- ViewModel이 UseCase 실행
- UseCase가 Repository의 data를 조합
- Repository는 Remote/Local에서 data 받아와 리턴
- View에 Information 표시