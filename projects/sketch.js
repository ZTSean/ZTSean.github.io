function setup() {
	crreateCanvas(800, 600, 'webgl');
}

function draw() {
	background(200);

	orbitControl();
}

// 3Dstroke class
function 3dStroke(pos_x, pos_y, pos_z, length, width, height) {
	this.x = pos_x;
	this.y = pos_y;
	this.z = pos_z;
	this.l = length;
	this.w = width;
	this.h = height;
	this.diffuse = ; 
	this.ambient = ;
	this.specular = ;
	this.shiness = ;



	// functionalities for blending !! incomplete
	this.detectIntersect(3dStroke s) {
		var front1 = this.z - this.w/2;
		var back1 = this.z + this.w/2;
		var left1 = this.x - this.l.2;
		var right1 = this.x + this.l/2;
		var top1 = this.z - this.h/2;
		var bottom1 = this.z + this.h/2;

		var front2 = s.getZ() - s.getWidth()/2;
		var  back2 = s.getZ() + s.getWidth()/2;
		var  left2 = s.getX() - s.getLength()/2;
		var  right2 = s.getX() + s.getLength()/2;
		var  top2 = s.getY() - s.getHeight()/2;
		var  bottom2 = s.getY() + s.getHeight()/2;

		var leftSurface = 0;
		var rightSurface = 0;
		var topSurface = 0;
		var bottomSurface = 0;
		var backSurface = 0;
		var frontSurface = 0;

		var isOverlapped = true;

		if (front1 < back2 || front2 < back1) {
		}

	}

	// drawing function
	this.draw() {
		push();
		translate(w/2, l/2, h/2);
		pop();
	}

	// --------- accessor ----------
	this.getX() {
		return x;
	}

	this.getY() {
		return y;
	}

	this.getZ() {
		return z;
	}

	this.getWidth() {
		return w;
	}

	this.getLength() {
		return l;
	}

	this.getHeight() {
		return h;
	}

	// --------- mutator -----------

	this.setX(float px) {
		this.x = px;
	}

	this.setY(float py) {
		this.y = py;
	}

	this.setZ(float pz) {
		this.z = pz;
	}

	this.setWidth(float width) {
		this.w = width;
	}

	this.setLength(float length) {
		this.l = length;
	}

	this.setHeight(float height) {
		this.h = height;
	}

}