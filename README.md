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

    - SliverFixedExtentList() 리스트 위젯

        - delegate, itemExtent 
    
    - SliverGrid() Grid 를 담을 수 있는 위젯
        
        - delegate, gridDelegate
    
    - SliverToBoxAdapter() 모든 위젯을 담을수 있는 레이아웃 위젯

    - SliverPersistentHeader()

### newstedScrollView()

    - 안의 모든 scroll position 들을 연결 한다.

### ListWheelScrollView()

    -wheel 모양 scroll view 를 만들어 준다.

### CircularProgressIndicator.adaptive()

    - os 에 맞는 로딩위젯을 보여준다. (android = CircularProgressIndicator, ios = CupertinoActivityIndicator)


### aboutListTile()

    - showAboutDialog를 보여주는 listTile을 만든다.

### showCupertinoDialog() , showCupertinoModalPopup()

    - ios 모양의 다이아로그를 보여준다. showCupertinoModalPopup() 는 modal 밖을 눌러 나갈 수 있다.

### MediaQuery , LayoutBuilder 

    - MediaQuery 는 현재 앱을 사용하고 있는 기기에 대한 정보를 제공한다. 

    - LayoutBuilder 는 화면 크기가 아닌 layout 크기에 대한 정보를 제공한다.

