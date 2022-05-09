#version 410

// in 키워드는 이전 렌더링 파이프라인 단계에서 데이터를 전달받을 변수를 명시할 때 사용함.  
// 이전 단계의 데이터? 즉, ofApp 객체의 setup() 함수에서 보내주는 vec3 버텍스 위치 데이터를 의미함!

/*
  layout 키워드

  오픈프레임웍스의 setup() 함수에서 위치와 색상, 
  즉 여러 개의 버텍스 속성(vertex attibute)를 지정했기 때문에

  in 키워드로 받아오는 데이터들의 종류들을 각각 구분해줘야 함!

  ofApp.cpp 에서 setup() 함수들을 보면, 모든 버텍스들은 각각
  addVertex() 로 위치 데이터를 먼저 추가하고, 
  그 다음에 addColor() 로 색상 데이터를 추가하고 있음.

  따라서, 버텍스 셰이더에는 이런 식으로 오픈프레임웍스에서
  버텍스 속성을 저장한 순서를 알려주는 게 필요한데,
  이 때 사용하는 키워드가 layout 임.

  layout()의 location 값에 위치데이터는 0번, 
  색상데이터는 1번이라고 지정함으로써,

  "각 버텍스에 먼저 들어오는 데이터를 position 변수에 넣고,
  그 다음에 들어오는 데이터를 color 변수에 넣어주세요" 
  라고 선언한 것과 같음.
*/
layout(location = 0) in vec3 position;
// layout(location = 1) in vec4 color; // 프래그먼트 셰이더에서 유니폼 변수를 사용해서 색상을 지정하므로, 더 이상 컬러값을 이전 파이프라인에서 받을 필요가 없지.

/*
  버텍스마다 색상데이터를 받아왔으면,
  걔내을 프래그먼트 셰이더로 전송하기 위해서
  out 키워드로 다음 파이프라인에 넘겨줄 변수를 지정해야 함.

  원래 이 작업을 varying 이라는 키워드로 해줬었는데,
  in/out 으로 구현해도 동일하게 작동함. 둘 다 똑같은 기능임.

  이 때, 버텍스 셰이더에서 out 해주는 변수의 이름과
  프래그먼트 셰이더에서 in 해주는 변수의 이름이 동일해야
  GPU가 두 변수를 연결해줄 수 있음. -> 아주 중요하므로 주의할 것!
  이거는 varying 변수를 사용할 때에도 마찬가지 사항임!
*/
// out vec4 fragCol; // 프래그먼트 셰이더에서 유니폼 변수를 사용해서 색상을 지정하므로, 더 이상 컬러값을 다음 파이프라인으로 전달할 필요없음.

void main() {
  gl_Position = vec4(position, 1.0);
  // fragCol = color; // 프래그먼트 셰이더에서 유니폼 변수를 사용해서 색상을 지정하므로, 더 이상 컬러값을 다음 파이프라인으로 전달할 필요없음.
}