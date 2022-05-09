#version 410

// in 키워드는 이전 렌더링 파이프라인 단계에서 데이터를 전달받을 변수를 명시할 때 사용함.  
// 이전 단계의 데이터? 즉, ofApp 객체의 setup() 함수에서 보내주는 vec3 버텍스 위치 데이터를 의미함!
in vec3 position;

void main() {
  gl_Position = vec4(position, 1.0);
}