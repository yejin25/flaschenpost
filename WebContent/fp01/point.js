export class Point {

  constructor(index, x, y) {
    this.x = x;
    this.y = y;
    this.fieldY = y; // 기본 Y 중심
    this.speed = 0.08;
    this.cur = index;
    this.max = Math.random() * 100 + 150;
  }

  update() {
    
    this.cur += this.speed;
    
    this.y = this.fieldY + Math.sin(this.cur) * this.max * 2;
  }
}