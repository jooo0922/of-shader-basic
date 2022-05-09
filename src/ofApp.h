#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void mouseEntered(int x, int y);
		void mouseExited(int x, int y);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);
    ofMesh triangle; // ofApp의 draw() 함수에서도 triangle 에 접근하려고 헤더파일에 해당 변수를 선언함.
    ofShader shader; // bin/data 디렉토리에 작성한 셰이더 파일들을 ofApp의 setup() 및 draw() 함수에서 로드 및 바인딩하기 위해 필요한 ofShader 객체를 담은 변수를 헤더파일에 선언함.
    glm::vec4 curColor; // uniform 변수에 쏴줄 컬러값을 저장해두는 변수 curColor 를 해더파일에서 선언함으로써, setup()에서 초기화, keyPressed()에서 컬러값 변경, draw() 에서 setUniform4f() 함수로 전달할 수 있도록 함.
};
