# tictok_clone_flutter

글로벌 숏폼 비디오 플랫폼 틱톡을 클론 코딩 한 프로젝트

## 사용한 위젯

### Continer() - 레이아웃을 할당해주는 기본 위젯

- color, width, height, decoretion, key, alignment, padding, magin 등을 파라미터로 가지고 있다.

### Row(), Column() - 위을 행 과 열로 묶어주는 위젯

- mainAxisAligment, mainAxisSize, crossAxisAlignment, verticalDirection 등을 파라미터로 가지고 있다.

- verticalDirection로 정렬 순서를 바꿀수 있고 mainAxisAligment, crossAxisAlignment 로 위치를 정렬 할 수 있다. 

### CustomScrollView()

- slivers 슬리버 위젯을 담을 수 있다.

    - SliverAppBar() 스크롤이 가능한 앱바 위젯

        -  floating, stretch, pinned, backgroundColor, collapsedHeight, expandedHeight, flexibleSpace
        - floating, stretch, pinned 등으로 애니매이션 효과를 줄 수 있다.