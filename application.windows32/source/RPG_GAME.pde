
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer player;
AudioSample cursor;
AudioSample kettei;
AudioSample cancel;
AudioSample magicDrain;
AudioSample punch;
AudioSample darkness;
AudioSample reflection;
AudioSample ice3;
AudioSample drain2;
AudioSample skill;
AudioSample elect;
AudioSample sword;
AudioSample charge;
AudioSample cure1;
AudioSample cure2;
AudioSample statusUp1;
AudioSample statusUp2;
AudioSample stateCure;
AudioSample chant;
AudioSample load;
Minim minim;

int y;
String a = "防御";
String b = "復活のお札";
int[] char1 = {322, 140, 361, 160, 39, 63, 102};
int[] char2 = {283, 127, 285, 179, 27, 202, 100};
int[] char3 = {308, 173, 474, 100, 49, 233, 98};
int[] Boss  = {10000, 75, 55, 65};
int[] char1St = {322, 140};
int[] char2St = {283, 127};
int[] char3St = {308, 173};
int[] atackDamage = {361, 285, 474};
int[] setupX1, setupX2;
int frame2;
int posX, posY, speed1, speed2, startTime, endTime, serectY, charct, battleTime, menuTime, frame, dot;
int serectX2, serectY2;
int alpha, dc, alpha2, dc2;
int BossSerect, charSel1, charSel2, charSel3;
int fill1;
int dy1, dy2, dy3, dy4, dy5;
float titleM;
float x;
boolean keyPress, right, left, up, down, battle, text, playerSerect, System, menu, title;
boolean backalpha, One, kamae, One2, enter, One3, One4, One5, One6;
boolean[] atack = {false, false, false};
boolean[] gard = {false, false, false};
boolean[] item = {false, false, false};
boolean[] skillAtackReimu = {false, false, false, false, false, false, false};
boolean[] skillAtackMarisa = {false, false, false, false, false};
boolean[] skillAtackYoumu = {false, false, false, false};
boolean[] BossAtack = {false, false, false, false, false, false, false};
boolean[] skillMenu = {false, false, false};
boolean char1Ded, char2Ded, char3Ded, BossDed, turn;
boolean noroi, BossNoroi;
boolean MP1, MP2, MP3;
PFont font;
String[] serif;
PImage image1, image2, image3, image4, marisa, image5, imageBack;
PImage[] dotReimu;
char[] serif2 = {'こ', 'ん', 'な', 'に', '月', 'も', '赤', 'い', 'か', 'ら', '　', '本', '気', 'で', '殺', 'す', 'わ', 'よ'};

String[][] skill1 = {{"霊符　「夢想封印」                                 8", "霊符　「夢想封印　散」                        18"}, 
  {"霊符　「夢想封印　集」                        26", "霊符　「封魔陣」                                     2"}, 
  {"霊符　「夢想妙珠」                               10", "宝符　「陰陽宝玉」                               14"}, 
  {"神技　「八方鬼縛陣」                           15", ""}}; 

String[][] skill2 = {{"恋符　「マスタースパーク」                        8", "恋符　「ノンディレクショナルレーザー」      16"}, 
  {"魔符　「スターダストレヴァリエ」                 8", "魔砲　「ファイナルスパーク」                     18"}, 
  {"魔符　「ミルキーウェイ」                            5", ""}}; 

String[][] skill3 = {{"人界剣　「悟入幻想」                           18", "人世剣　「大悟顕晦」                           24"}, 
  {"人神剣　「俗諦常住」                           30", "瞑斬　「桜観から弾をも断つ心の眼」     10"}}; 

String[] BossSkill = {"通常攻撃", "神術「吸血鬼幻想」", "呪詛「ブラド・ツェペシュの呪い」", 
  "神槍「スピア・ザ・グングニル」", "魔符「全世界ナイトメア」", "悪魔「レミリアストレッチ」", 
  "運命「ミゼラブルフェイト」"};

String[] ReimuSkill = {"霊符　「夢想封印」", "霊符　「夢想封印　散」", "霊符　「夢想封印　集", 
  "霊符　「封魔陣」", "霊符　「夢想妙珠」", "宝符　「陰陽宝玉」", "神技　「八方鬼縛陣」"};

String[] MarisaSkill = {"恋符　「マスタースパーク」", "恋符　「ノンディレクショナルレーザー」", 
  "魔符　「スターダストレヴァリエ」", "魔砲　「ファイナルスパーク」", "魔符　「ミルキーウェイ」"};

String[] YoumuSkill = {"人界剣　「悟入幻想」", "人世剣　「大悟顕晦」", 
  "人神剣　「俗諦常住」", "瞑斬　「桜観から弾をも断つ心の眼」"};

void title() {
  image(imageBack, 0, 0, width, height);
  fill(255);
  textSize(30);
  text("レクイエム", 330, 70);
  textSize(75);
  text("東方最終課題曲", 50, 150);
  textSize(30);
  text("～Prοcessing 0f Prοcessing～", 300, 220);
  fill(0, alpha2);
  textSize(50);
  text("ENTERを押して始める", 350, height - 100);
  if (alpha2 > 200) dc2 = - dc2;
  if (alpha2 < 100) dc2 = - dc2;
  alpha2 += dc2;
  if (backalpha == true) {
    fill(0, fill1);
    noStroke();
    rect(0, 0, width, height);
    fill1+=7;
    if (millis() - titleM > 6000) {
      title = false;
    }
  }
}
void setup() {
  size(1200, 1000);
  smooth();
  posX = 0;
  posY = 0;
  speed1 = 4;
  speed2 = 1;
  alpha = 140;
  alpha2 = 140;
  dc = 2;
  dc2 = 30;
  fill1 = 0;
  frame2 = 0;
  dy1 = height / 3 - 50;
  dy2 = height / 3 - 50;
  dy3 = height / 3 - 50;
  dy4 = height / 3 - 50;
  dy5 = height / 3 - 50;
  y = 255;
  keyPress = false;
  right = false;
  left = false;
  up = false;
  down = false;
  battle = false;
  text=true;
  playerSerect = false;
  System = false;
  backalpha = false;
  menu = true;
  title = true;
  One = true;
  One2 = false;
  kamae = false;
  enter = true;
  char1Ded = false;
  char2Ded = false;
  char3Ded = false;
  BossDed = false;
  turn = false;
  noroi = false;
  BossNoroi = false;
  MP1 = false;
  MP2 = false;
  MP3 = false;
  One6 = true;
  charct = 0;
  font = loadFont("MeiryoUI-48.vlw");
  textFont(font, 30);
  serif = loadStrings("BossText.txt");
  minim = new Minim(this);
  player = minim.loadFile("septet.mp3");
  cursor = minim.loadSample("cursor-01.wav");
  kettei = minim.loadSample("kettei-02.wav");
  cancel = minim.loadSample("cancel-02.wav");
  magicDrain = minim.loadSample("magic-drain1.mp3");
  punch = minim.loadSample("punch-high1.mp3");
  darkness = minim.loadSample("magic-attack-darkness1.mp3");
  reflection = minim.loadSample("magic-reflection1.mp3");
  ice3 = minim.loadSample("magic-ice3.mp3");
  drain2 = minim.loadSample("magic-drain2.mp3");
  skill = minim.loadSample("skill.wav");
  elect = minim.loadSample("magic-electron2.mp3");
  sword =  minim.loadSample("sword-clash3.mp3");
  charge = minim.loadSample("magic-charge1.mp3");
  cure1 = minim.loadSample("magic-cure1.mp3");
  cure2 = minim.loadSample("magic-cure3.mp3");
  statusUp1 = minim.loadSample("magic-statusup1.mp3");
  statusUp2 = minim.loadSample("magic-statusup1.mp3");
  stateCure = minim.loadSample("magic-status-cure2.mp3");
  chant = minim.loadSample("magic-chant1.mp3");
  load = minim.loadSample("load.wav");
  dotReimu = new PImage[12];
  image1=loadImage("potr_thremilia.png");
  image2=loadImage("Boss.png");
  image3=loadImage("logo.png");
  image4=loadImage("reim.jpg");
  image5=loadImage("youm.jpg");
  imageBack=loadImage("d1110-232-155483-0.jpg");
  marisa = loadImage("marisa.jpg");
  dotReimu[0] = loadImage("dotReimDown1.png");
  dotReimu[1] = loadImage("reimuDown2.png");
  dotReimu[2] = loadImage("reimuDown3.png");
  dotReimu[3] = loadImage("dotLeft.png");
  dotReimu[4] = loadImage("dotLeft2.png");
  dotReimu[5] = loadImage("dotLeft3.png");
  dotReimu[6]=loadImage("dotRight1.png");
  dotReimu[7]=loadImage("dotRight2.png");
  dotReimu[8]=loadImage("dotRight3.png");
  dotReimu[9]=loadImage("dotUp1.png");
  dotReimu[10]=loadImage("dotUp2.png");
  dotReimu[11]=loadImage("dotUp3.png");
  setupX1=new int[8];
  setupX2=new int[8];
  for (int i = 0; i <8; i++) {
    setupX1[i] = -200+i*200;
    setupX2[i] = -200+i*200;
  }
  serectY = 0;
}

void draw() {
  if (char1Ded == true && char2Ded == true && turn == true) {
    charct = 2;
    turn = false;
  } else if (char1Ded == true && turn == true) {
    charct = 1;
    turn = false;
  }
  background(0);
  coliderBoss();
  if (title == true) {
    title();
  }
  if (battle == false && title == false) {
    startTime = millis();
    backImage();
    drawChar();
  }

  if (battle == true && title == false) {
    battleScene();
    battleUI();
    battleSystem();
    charHP();
  }
}
void keyPressed() {
  keyPress = true;
  if (title == true) {
    if (key == ENTER) {
      load.trigger();
      titleM = millis();
      backalpha = true;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) right = true;
    else if (keyCode == LEFT) left = true;
    else if (keyCode == UP) up = true;
    else if (keyCode == DOWN) down = true;
  }
  if (playerSerect == true) {
    if (key == CODED && skillMenu[charct] == false) {
      if (keyCode == UP) {
        serectY -= 1;
        cursor.trigger();
      }
      if (keyCode == DOWN) {
        serectY += 1;
        cursor.trigger();
      }
      if (serectY > 0) serectY = serectY % 4;
      if (serectY < 0) serectY = serectY + 4;
    }
    if (skillMenu[charct] == true) {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          serectX2 += 1;
          cursor.trigger();
        } else if (keyCode == LEFT) {
          serectX2 -= 1;
          cursor.trigger();
        } else if (keyCode == UP) {
          serectY2 -= 1;
          cursor.trigger();
        } else if (keyCode == DOWN) {
          serectY2 += 1;
          cursor.trigger();
        }
      }
    }
    if (skillMenu[0] == true) {
      if (serectX2 > 0 && serectY2 != 3) serectX2 = serectX2 % 2;
      if (serectX2 < 0) serectX2 = serectX2 + 2;
      if (serectY2 > 0 && serectX2 == 0) serectY2 = serectY2 % 4;
      if (serectY2 < 0&& serectX2 == 0) serectY2 = serectY2 + 4;
      if (serectY2 > 0 && serectX2 == 1 ) serectY2 = serectY2 % 3;
      if (serectY2 == 3 && serectX2 == 0) serectX2 = 0;
      if (serectY2 < 0 && serectX2== 1) serectY2 = serectY2 + 3;
    }
    if (skillMenu[1] == true) {
      if (serectX2 > 0 && serectY2 != 2) serectX2 = serectX2 % 2;
      if (serectX2 < 0) serectX2 = serectX2 + 2;
      if (serectY2 > 0 && serectX2 == 0) serectY2 = serectY2 % 3;
      if (serectY2 < 0&& serectX2 == 0) serectY2 = serectY2 + 3;
      if (serectY2 > 0 && serectX2 == 1) serectY2 = serectY2 % 2;
      if (serectY2 == 2 && serectX2 == 0) serectX2 = 0;
      if (serectY2 < 0 && serectX2== 1) serectY2 = serectY2 + 2;
    }
    if (skillMenu[2] == true) {
      if (serectX2 < 0) serectX2 = serectX2 + 2;
      if (serectY2 > 0) serectY2 = serectY2 % 2;
      if (serectY2 < 0) serectY2 = serectY2 + 2;
      if (serectX2 > 0) serectX2 = serectX2 % 2;
    }
    if ((key == 'X'|| key == 'x') && menu == false) {
      skillMenu[charct] = false;
      menu = true;
      serectX2 = 0;
      serectY2 = 0;
      cancel.trigger();
    } else if ((key == 'X'|| key == 'x') && charct > 0 && charct < 3 && System == false && menu == true) {
      if (charct == 1) {
        if (char1Ded == true) {
          charct+=1;
        }
      }
      if (charct == 2) {
        if (char2Ded == true && char1Ded == false) {
          charct-=1;
        }
        if (char2Ded == true && char1Ded == true) {
          charct-=0;
        }
      }
      if (charct == 1) {
        for (int i = 0; i < 7; i++) {
          gard[0] = false;
          atack[0] = false;
          item[0] = false;
          skillAtackReimu[i] = false;
        }
      } else if (charct == 2) {
        for (int i = 0; i < 5; i++) {
          gard[1] = false;
          atack[1] = false;
          item[1] = false;
          skillAtackMarisa[i] = false;
        }
      }
      cancel.trigger();
      charct -= 1;
    }
    if (key == ENTER && serectY == 0 && skillMenu[charct] == false) {
      if (charct != 0 && charct % 2 == 0 && System == false) {
        kettei.trigger();
        battleTime = millis();
        atack[charct] = true;
        charct += 0;
        System = true;
        playerSerect = false;
        One2 = true;
        One5 = true;
      } else if (charct == 0 || charct % 2 != 0 && System == false) {
        if (charct == 0 ) One3 = true;
        else if (charct == 1) One4 = true;
        atack[charct] = true;
        if (charct == 0) {
          if (char2Ded == true && char3Ded == true) {
            battleTime = millis();
            atack[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          } else if (char2Ded == true && char3Ded == false) {
            charct += 1;
          }
        }
        if (charct == 1) {
          if (char2Ded == true && char3Ded ==true) {
            battleTime = millis();
            atack[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          } else if (char3Ded == true) {
            battleTime = millis();
            atack[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          }
        }
        kettei.trigger();
        charct++;
      }
    } 
    if (key == ENTER && serectY == 2 && skillMenu[charct] == false) {
      if (charct != 0 && charct % 2 == 0 && System == false) {
        gard[charct] = true;
        kettei.trigger();
        battleTime = millis();
        charct += 0;
        System = true;
        playerSerect = false;
        One2 = true;
        One5 = true;
      } else if (charct == 0 || charct % 2 != 0 && System == false) {
        if (charct == 0 ) One3 = true;
        else if (charct == 1) One4 = true;
        gard[charct] = true;
        if (charct == 0) {
          if (char2Ded == true && char3Ded == true) {
            battleTime = millis();
            gard[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          } else if (char2Ded == true && char3Ded == false) {
            charct += 1;
          }
        }
        if (charct == 1) {
          if (char2Ded == true && char3Ded ==true) {
            battleTime = millis();
            gard[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          } else if (char3Ded == true) {
            battleTime = millis();
            gard[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          }
        }
        kettei.trigger();
        charct++;
      }
      serectY = 0;
    }
    if (key == ENTER && serectY == 3 && skillMenu[charct] == false && One6 == true) {
      if (charct != 0 && charct % 2 == 0 && System == false) {
        item[charct] = true;
        kettei.trigger();
        battleTime = millis();
        charct += 0;
        System = true;
        playerSerect = false;
        One2 = true;
        One5 = true;
      } else if (charct == 0 || charct % 2 != 0 && System == false) {
        if (charct == 0 ) One3 = true;
        else if (charct == 1) One4 = true;
        item[charct] = true;
        if (charct == 0) {
          if (char2Ded == true && char3Ded == true) {
            battleTime = millis();
            item[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          } else if (char2Ded == true && char3Ded == false) {
            charct += 1;
          }
        }
        if (charct == 1) {
          if (char2Ded == true && char3Ded ==true) {
            battleTime = millis();
            item[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          } else if (char3Ded == true) {
            battleTime = millis();
            item[charct] = true;
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          }
        }
        kettei.trigger();
        charct++;
      }
      serectY = 0;
    } else if (key == ENTER && serectY == 1 && menu == true) {
      skillMenu[charct] = true;
      menu = false;
      kettei.trigger();
    } else if (key == ENTER && skillMenu[charct] == true) {
      //霊夢
      if (skillMenu[0] == true && serectY2 == 0 && serectX2 == 0) {
        if (char1St[1] >= 8) {
          MP1 = true;
          skillAtackReimu[0] = true;
        }
      }
      if (skillMenu[0] == true && serectY2 == 0 && serectX2 == 1) {
        if (char1St[1] >= 18) {
          MP1 = true;
          skillAtackReimu[1] = true;
        }
      }
      if (skillMenu[0] == true && serectY2 == 1 && serectX2 == 0) {
        if (char1St[1] >= 26) {
          MP1 = true;
          skillAtackReimu[2] = true;
        }
      }
      if (skillMenu[0] == true && serectY2 == 1 && serectX2 == 1) {
        if (char1St[1] >= 2) {
          MP1 = true;
          skillAtackReimu[3] = true;
        }
      }
      if (skillMenu[0] == true && serectY2 == 2 && serectX2 == 0) {
        if (char1St[1] >= 10) {
          MP1 = true;
          skillAtackReimu[4] = true;
        }
      }
      if (skillMenu[0] == true && serectY2 == 2 && serectX2 == 1) {
        if (char1St[1] >= 14) {
          MP1 = true;
          skillAtackReimu[5] = true;
        }
      }
      if (skillMenu[0] == true && serectY2 == 3 && serectX2 == 0) {
        if (char1St[1] >= 15) {
          MP1 = true;
          skillAtackReimu[6] = true;
        }
      }
      if (skillMenu[0] == true && MP1 == true) {
        One3 = true;
      }
      //魔理沙
      if (skillMenu[1] == true && serectY2 == 0 && serectX2 == 0) {
        if (char2St[1] >= 8) {
          MP2 = true;
          skillAtackMarisa[0] = true;
        }
      }
      if (skillMenu[1] == true && serectY2 == 0 && serectX2 == 1) {
        if (char2St[1] >= 16) {
          MP2 = true;
          skillAtackMarisa[1] = true;
        }
      }
      if (skillMenu[1] == true && serectY2 == 1 && serectX2 == 0) {
        if (char2St[1] >= 8) {
          MP2 = true;
          skillAtackMarisa[2] = true;
        }
      }
      if (skillMenu[1] == true && serectY2 == 1 && serectX2 == 1) {
        if (char2St[1] >= 18) {
          MP2 = true;
          skillAtackMarisa[3] = true;
        }
      }
      if (skillMenu[1] == true && serectY2 == 2 && serectX2 == 0) {
        if (char2St[1] >= 5) {
          MP2 = true;
          skillAtackMarisa[4] = true;
        }
      }
      if (skillMenu[1] == true && MP2 == true) {
        One4 = true;
      }
      //妖夢
      if (skillMenu[2] == true && serectY2 == 0 && serectX2 == 0) {
        if (char3St[1] >= 18) {
          MP3 = true;
          skillAtackYoumu[0] = true;
        }
      }
      if (skillMenu[2] == true && serectY2 == 0 && serectX2 == 1) {
        if (char3St[1] >= 24) {
          MP3 = true;
          skillAtackYoumu[1] = true;
        }
      }
      if (skillMenu[2] == true && serectY2 == 1 && serectX2 == 0) {
        if (char3St[1] >= 30) {
          MP3 = true;
          skillAtackYoumu[2] = true;
        }
      }
      if (skillMenu[2] == true && serectY2 == 1 && serectX2 == 1) {
        if (char3St[1] >= 10) {
          MP3 = true;
          skillAtackYoumu[3] = true;
        }
      }
      if (skillMenu[2] == true && MP3 == true) {
        One5 = true;
      }

      //共通
      if (charct != 0 && charct % 2 == 0 && System == false && MP3 == true) {
        kettei.trigger();
        skillMenu[charct] = false;
        serectX2 = 0;
        serectY2 = 0;
        serectY = 0;
        battleTime = millis();
        charct += 0;
        playerSerect = false;
        One2 = true;
        System = true;
      } else if ((charct == 0 && MP1 == true) || (charct % 2 != 0 && MP2 == true)) {
        skillMenu[charct] = false;
        menu = true;
        serectX2 = 0;
        serectY2 = 0;
        serectY = 0;
        if (charct == 0) {
          if (char2Ded == true && char3Ded == true) {
            battleTime = millis();
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          } else if (char2Ded == true && char3Ded == false) {
            charct += 1;
          }
        }
        if (charct == 1) {
          if (char2Ded == true && char3Ded ==true) {
            battleTime = millis();
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          } else if (char3Ded == true) {
            battleTime = millis();
            charct += 0;
            System = true;
            playerSerect = false;
            One2 = true;
          }
        }
        kettei.trigger();
        charct++;
      } else {
      }
    }
  }
}

void keyReleased() {
  keyPress = false;
  right = false;
  left = false;
  up = false;
  down = false;
  serectY -= 0;
  serectY += 0;
  charct += 0;
}

void backImage() {
  image(image2, 50 + posX, 50 + posY, 100, 100);
  fill(0);
  rect(posX, posY, 1200, 1000);

  fill(147, 119, 105, 200);
  rect(0, 20, width, 50);
  for (int i = 0; i < 8; i++) {
    image(image3, setupX1[i] -= speed2, 0, 200, 100);
    if (setupX1[i] + 200 < 0) {
      setupX1[i] = 1400;
    }
  }

  rect(0, height-70, width, 50);
  image(image2, 50 + posX, 50 + posY, 100, 100);
  for (int i = 0; i < 8; i++) {
    image(image3, setupX2[i] += speed2, height - 90, 200, 100);
    if (setupX2[i]-200 > width) {
      setupX2[i] = -200;
    }
  }
  fill(255);
  text("謎の空間", width-  textWidth("謎の空間") - 50, height - 80);
}
void drawChar() {
  frame++;
  fill(255, 0, 0);
  if (keyPress == true && right == true) {
    posX -= speed1;
    if (frame < 10 && frame >= 0)dot = 6;
    else if (frame < 20 && frame >= 10)dot = 7;
    else if (frame < 30 && frame >=  20) dot = 8;
  }
  if (keyPress == true && left == true) {
    posX += speed1;
    if (frame < 10 && frame >= 0)dot = 3;
    else if (frame < 20 && frame >= 10)dot = 4;
    else if (frame < 30 && frame >=  20) dot = 5;
  }
  if (keyPress == true && up == true) {
    posY += speed1;
    if (frame < 10 && frame >= 0)dot = 9;
    else if (frame < 20 && frame >= 10)dot = 10;
    else if (frame < 30 && frame >=  20) dot =11;
  }
  if (keyPress == true && down == true) {
    if (frame < 10 && frame >= 0)dot = 0;
    else if (frame < 20 && frame >= 10)dot = 1;
    else if (frame < 30 && frame >=  20) dot = 2;
    posY -= speed1;
  }
  if (keyPress == false) dot = 0;
  if (frame == 30) frame = 0;
  image(dotReimu[dot], width / 2, height / 2, 100, 100);
}

void coliderBoss() {
  if (50 + posX + 100 > width / 2 && 50 + posX < width /2 )
    if (50 + posY < height / 2 + 50 && 50 + posY > height / 2 || 50 + posY + 100 > height / 2 && 50 + posY < height / 2) battle=true;
  if (50 + posX < width / 2 + 50 && 50 + posX + 100 > width / 2 )
    if (50 + posY + 100 > height / 2 && 50 + posY < height / 2 || 50 + posY < height / 2 + 50 && 50 + posY > height /2 ) battle=true;
}

void battleScene() {
  endTime = millis() - startTime;
  if (endTime >= 3000 && text == true) {
    fill(255);
    textSize(30);
    for (int i = 0; i < 18; i++) {
      if (endTime >= 3000 + i * 25) {
        text(serif2[i], 100 + i * 30, height / 3 * 2);
      }
    }
  }
  if (endTime >= 4000) {
    text = false;
    player.play();
  }
  if (endTime >= 5000) {
    strokeWeight(0);
    stroke(0);
    fill(20, 20, 200, 50);
    rect(0, height / 3 * 2, width, height / 3, 2);
    fill(0);
    for (int i = 0; i < 3; i++) {
      if (skillMenu[i] == true) tint(255, 100);
    }
    if (BossDed == true) {
      tint(255, y);
      y-=3;
      image(image1, width / 2 -  150, height / 5 - 50, 300, 300);
    }
    if (BossDed == false) {
      image(image1, width / 2 -  150, height / 5 - 50, 300, 300);
    }
    noTint();
  }
}
void battleUI() {
  if (endTime >= 7000) {
    if (endTime >= 8000) {
      playerSerect = true;
      if (char1Ded == false)image(image4, 25, height / 3 * 2 + 50, 300, 400);
      if (char2Ded == false)image(marisa, 420, height / 3 * 2 + 50, 300, 400);
      if (char3Ded == false)image(image5, 820, height / 3 * 2 + 50, 300, 400);
      //キャラ１の体力バー
      fill(255, 0, 0);
      rect(220, height - 150, 150, 13, 2);
      rect(220, height - 110, 150, 13, 2);
      fill(0, 0, 255);
      rect(220, height - 150, map(char1St[0], 0, char1[0], 0, 150), 13, 2);
      fill(0, 255, 255);
      rect(220, height - 110, map(char1St[1], 0, char1[1], 0, 150), 13, 2);
      textSize(20);
      fill(255);
      text(char1St[0] +  " / " + char1[0], 270, height - 150);
      text(char1St[1] +  " / " + char1[1], 270, height - 110);
      //キャラ２の体力バー
      fill(255, 0, 0);
      rect(630, height - 150, 150, 13, 2);
      rect(630, height - 110, 150, 13, 2);
      fill(0, 0, 255);
      rect(630, height - 150, map(char2St[0], 0, char2[0], 0, 150), 13, 2);
      fill(0, 255, 255);
      rect(630, height - 110, map(char2St[1], 0, char2[1], 0, 150), 13, 2);
      textSize(20);
      fill(0, 0, 255);
      text(char2St[0] +  " / " + char2[0], 680, height - 150);
      text(char2St[1] +  " / " + char2[1], 680, height - 110);

      //キャラ3の体力バー
      fill(255, 0, 0);
      rect(1040, height - 150, 150, 13, 2);
      rect(1040, height - 110, 150, 13, 2);
      fill(0, 0, 255);
      rect(1040, height - 150, map(char3St[0], 0, char3[0], 0, 150), 13, 2);
      fill(0, 255, 255);
      rect(1040, height - 110, map(char3St[1], 0, char3[1], 0, 150), 13, 2);
      textSize(20);
      fill(120);
      text(char3St[0] +  " / " + char3[0], 1090, height - 150);
      text(char3St[1] +  " / " + char3[1], 1090, height - 110);

      textSize(30);
      strokeWeight(2);
      stroke(255);
      fill(255, 35);
      if (skillMenu[0] == true) {
        strokeWeight(2);
        fill(255, 30); 
        rect(0, 0, width-1, 99, 2);
        fill(255);
        if (serectY2 == 0 && serectX2 == 0) {
          text("封印的ダメージ少し与える", 45, 65);
        }
        if (serectY2 == 0 && serectX2 == 1) {
          text("封印的ダメージを与える", 45, 65);
        }
        if (serectY2 == 1 && serectX2 == 0) {
          text("大威力の封印的ダメージを与える", 45, 65);
        }
        if (serectY2 == 1 && serectX2 == 1) {
          text("相手を異常状態にする。ついでに少しのダメージ。", 45, 65);
        }
        if (serectY2 == 2 && serectX2 == 0) {
          text("攻撃力を上げる。重複はしない。", 45, 65);
        }
        if (serectY2 == 2 && serectX2 == 1) {
          text("味方全体のHPを少し回復。異常状態も完治！", 45, 65);
        }
        if (serectY2 == 3 && serectX2 == 0) {
          text("味方全体の防御力を大幅に上げる。重複はしない。", 45, 65);
        }
      }
      if (skillMenu[1] == true) {
        strokeWeight(2);
        fill(255, 30); 
        rect(0, 0, width-1, 99, 2);
        fill(255);
        if (serectY2 == 0 && serectX2 == 0) {
          text("小威力の雷を与える", 45, 65);
        }
        if (serectY2 == 0 && serectX2 == 1) {
          text("中威力の雷を与える", 45, 65);
        }
        if (serectY2 == 1 && serectX2 == 0) {
          text("攻撃力を上げる。重複はしない。", 45, 65);
        }
        if (serectY2 == 1 && serectX2 == 1) {
          text("大威力の雷を与える。", 45, 65);
        }
        if (serectY2 == 2 && serectX2 == 0) {
          text("スキルの威力がアップ。重複はしない", 45, 65);
        }
      }
      if (skillMenu[2] == true) {
        strokeWeight(2);
        fill(255, 30); 
        rect(0, 0, width-1, 99, 2);
        fill(255);
        if (serectY2 == 0 && serectX2 == 0) {
          text("味方全体を小回復", 45, 65);
        }
        if (serectY2 == 0 && serectX2 == 1) {
          text("味方全体を中回復", 45, 65);
        }
        if (serectY2 == 1 && serectX2 == 0) {
          text("死んだ味方を生き返らせる。小回復", 45, 65);
        }
        if (serectY2 == 1 && serectX2 == 1) {
          text("「…妖怪が鍛えたこの桜観剣に、斬れぬものなど、あんまりない！」", 45, 65);
        }
      }
      if (playerSerect == true && System == false && menu == true) {
        rect(50 + 400 * charct, height / 3, 250, 280, 2);
        strokeWeight(1);
        fill(220, 220, 255, alpha);
        noStroke();
        rect(60 + 400 * charct, 23 + height/3 + 59 * serectY, 220, 50, 2);
        fill(255);
        text("攻撃", 70 + 400 * charct, height / 3 + 60);
        text("スペルカード", 70 + 400 * charct, height / 3 + 120);
        text("防御", 70 + 400 * charct, height / 3 + 180);
        text("復活のお札", 70 + 400 * charct, height / 3 + 240);
      }
      if (noroi == true && BossDed == false) {
        fill(255, alpha);
        text("封印状態", width / 2 +  50, height / 5 - 50);
      }
      if (BossNoroi == true) {
        text("「毒」", 320, height - 35);
        text("「毒」", 730, height - 35);
        text("「毒」", 1140, height - 35);
      }
      for (int i = 0; i < 3; i++) {
        if (playerSerect == true && System == false && skillMenu[i] == true) {
          fill(255, 30); 
          rect(0, 100, width-1, 500, 2);
          noStroke();
          fill(220, 220, 255, alpha);
          rect(30 + 615 * serectX2, 140 + 75 * serectY2, 515, 38, 2);
          if (skillMenu[0] == true) {
            for (int j = 0; j < 4; j ++) {
              for (int k = 0; k < 2; k++) {
                textSize(30);
                fill(255);
                text(skill1[j][k], 40 + k * 610, 170 + j * 75);
              }
            }
          }
          if (skillMenu[1] == true) {
            for (int j = 0; j < 3; j ++) {
              for (int k = 0; k < 2; k++) {
                textSize(30);
                fill(255);
                text(skill2[j][k], 40 + k * 610, 170 + j * 75);
              }
            }
          }
          if (skillMenu[2] == true) {
            for (int j = 0; j < 2; j ++) {
              for (int k = 0; k < 2; k++) {
                textSize(30);
                fill(255);
                text(skill3[j][k], 40 + k * 610, 170 + j * 75);
              }
            }
          }
        }
      }
    }
    if (alpha > 150) dc = - dc;
    if (alpha < 130) dc = - dc;
    alpha += dc;
  }
}
void battleSystem() {
  if (System == true) {
    menuTime = millis() - battleTime;
    //霊夢
    if (menuTime >= 0 && menuTime <= 900) {
      if (char1Ded==false) {
        fill(255, 30); 
        rect(1, 3, width, 150);
        fill(255);
        textSize(30);
      }
      if (menuTime >= 0 && menuTime <= 200) dy1-=5;
      if (menuTime >= 200 && menuTime <= 400) dy1-=4;
      if (menuTime >= 400 && menuTime <= 600) dy1-=3;
      if (menuTime >= 600 && menuTime <= 800)dy1-=2;
      if (menuTime >= 800 && menuTime <= 900)dy1-=1;

      if (atack[0] == true) {
        text(BossSkill[0], width / 2 - textWidth(BossSkill[0]) / 2, 78);
        fill(255, 0, 0);
        text(int(atackDamage[0] / 2) - Boss[1], width / 2 + 50, dy1);
      }
      if (gard[0] == true) {
        text(a, width / 2 - textWidth(a) / 2, 78);
      }
      if (item[0] == true) {
        text(b, width / 2 - textWidth(b) / 2, 78);
      }
      if (skillAtackReimu[0] == true) {
        text(ReimuSkill[0], width / 2 - textWidth(ReimuSkill[0]) / 2, 78);
        fill(255, 0, 0);
        text((((18 + int(atackDamage[0] * 0.6)) * (((char1[5] * 1) + 100) / 100)) / 2) - Boss[1], width / 2 + 50, dy1);
      }

      if (skillAtackReimu[1] == true) {
        text(ReimuSkill[1], width / 2 - textWidth(ReimuSkill[0]) / 2, 78);
        fill(255, 0, 0);
        text((((70 + int(atackDamage[0] * 0.6)) * (((char1[5] * 1) + 100) / 100)) / 2) - Boss[1], width / 2 + 50, dy1);
      }
      if (skillAtackReimu[2] == true) {
        text(ReimuSkill[2], width / 2 - textWidth(ReimuSkill[0]) / 2, 78);
        fill(255, 0, 0);
        text((((160 + int(atackDamage[0] * 0.6)) * (((char1[5] * 1) + 100) / 100)) / 2) - Boss[1], width / 2 + 50, dy1);
      }
      if (skillAtackReimu[3] == true) {
        text(ReimuSkill[3], width / 2 - textWidth(ReimuSkill[0]) / 2, 78);
        fill(255, 0, 0);
        text(20, width / 2 + 50, dy1);
      }
      if (skillAtackReimu[4] == true) {
        text(ReimuSkill[4], width / 2 - textWidth(ReimuSkill[0]) / 2, 78);
      }
      if (skillAtackReimu[5] == true) {
        text(ReimuSkill[5], width / 2 - textWidth(ReimuSkill[0]) / 2, 78);
      }
      if (skillAtackReimu[6] == true) {
        text(ReimuSkill[6], width / 2 - textWidth(ReimuSkill[0]) / 2, 78);
      }
    }
    if (menuTime >= 500 && One3 == true) {
      if (atack[0] == true) {
        punch.trigger();
        Boss[0] = Boss[0] - (int(atackDamage[0] / 2) - Boss[1]);
      }
      if (gard[0] == true) {
        char1[3] *= 2;
      }
      if (item[0] == true) {
        char1St[0] += 330;
        char2St[0] += 330;
        char3St[0] += 330;
        char1Ded = false;
        char2Ded = false;
        char3Ded = false;
        One6 = false;
      }
      if (skillAtackReimu[0] == true) {
        skill.trigger();
        Boss[0] = Boss[0] - ((((18 + int(atackDamage[0] * 0.6)) * (((char1[5] * 1) + 100) / 100)) / 2) - Boss[1]);
        char1St[1] -= 8;
      }
      if (skillAtackReimu[1] == true) {
        skill.trigger();
        Boss[0] = Boss[0] - ((((70 + int(atackDamage[0] * 0.6)) * (((char1[5] * 1) + 100) / 100)) / 2) - Boss[1]);
        char1St[1] -= 18;
      }
      if (skillAtackReimu[2] == true) {
        skill.trigger();
        Boss[0] = Boss[0] - ((((160 + int(atackDamage[0] * 0.6)) * (((char1[5] * 1) + 100) / 100)) / 2) - Boss[1]);
        char1St[1] -= 26;
      }
      if (skillAtackReimu[3] == true) {
        noroi = true;
        Boss[0] = Boss[0] - 20;
        char1St[1] -= 2;
        chant.trigger();
      }
      if (skillAtackReimu[4] == true) {
        char1[5] = 88;
        char1St[1] -= 10;
        statusUp1.trigger();
      }
      if (skillAtackReimu[5] == true) {
        char1St[0] += 20;
        char2St[0] += 20;
        char3St[0] += 20;
        BossNoroi = false;
        char1St[1] -= 14;
        stateCure.trigger();
      }
      if (skillAtackReimu[6] == true) {
        char1[3] = 320;
        char2[3] = 358;
        char3[3] = 200;
        char1St[1] -= 15;
        statusUp2.trigger();
      }
      if (noroi == true) {
        fill(255, 30); 
        text(100, width / 2 + 50, dy5);
      }
      One3 = false;
    }
    //魔理沙
    if (menuTime >= 1000 && menuTime <= 1900) {
      if (char2Ded==false) {
        fill(255, 30); 
        rect(1, 3, width, 150);
        fill(255);
        textSize(30);
      }
      if (menuTime >= 1000 && menuTime <= 1200) dy2-=5;
      if (menuTime >= 1200 && menuTime <= 1400) dy2-=4;
      if (menuTime >= 1400 && menuTime <= 1600) dy2-=3;
      if (menuTime >= 1600 && menuTime <= 1800)dy2-=2;
      if (menuTime >= 1800 && menuTime <= 1900)dy2-=1;
      if (atack[1] == true) {
        text(BossSkill[0], width / 2 - textWidth(BossSkill[0]) / 2, 78);
        fill(255, 0, 0);
        text(int(atackDamage[1] / 2) - Boss[1], width / 2 + 50, dy2);
      }
      if (gard[1] == true) {
        text(a, width / 2 - textWidth(a) / 2, 78);
      }
      if (item[1] == true) {
        text(b, width / 2 - textWidth(b) / 2, 78);
      }
      if (skillAtackMarisa[0] == true) {
        text(MarisaSkill[0], width / 2 - textWidth(MarisaSkill[0]) / 2, 78);
        fill(255, 0, 0);
        text((((60 + int(atackDamage[1] * 0.5)) * (((char2[5] * 1) + 100) / 100)) / 2) - int(Boss[1] * 0.3), width / 2 + 50, dy2);
      }
      if (skillAtackMarisa[1] == true) {
        text(MarisaSkill[1], width / 2 - textWidth(MarisaSkill[1]) / 2, 78);
        fill(255, 0, 0);
        text((((130 + int(atackDamage[1] * 0.4)) * (((char2[5] * 1) + 100) / 100)) / 2) - int(Boss[1] * 0.3), width / 2 + 50, dy2);
      }
      if (skillAtackMarisa[2] == true) {
        text(MarisaSkill[2], width / 2 - textWidth(MarisaSkill[2]) / 2, 78);
      }
      if (skillAtackMarisa[3] == true) {
        text(MarisaSkill[3], width / 2 - textWidth(MarisaSkill[3]) / 2, 78);
        fill(255, 0, 0);
        text((((200 + int(atackDamage[1] * 0.6)) * (((char2[5] * 1) + 100) / 100)) / 2) - int(Boss[1] * 0.5), width / 2 + 50, dy2);
      }
      if (skillAtackMarisa[4] == true) {
        text(MarisaSkill[4], width / 2 - textWidth(MarisaSkill[4]) / 2, 78);
      }
    }
    if (menuTime >= 1500 && One4 == true) {
      if (atack[1] == true) {
        punch.trigger();
        Boss[0] = Boss[0] - (int(atackDamage[1] / 2) - Boss[1]);
      }
      if (gard[1] == true) {
        char2[3]*=2;
      }
      if (item[1] == true) {
        char1St[0] += 330;
        char2St[0] += 330;
        char3St[0] += 330;
        char1Ded = false;
        char2Ded = false;
        char3Ded = false;
        One6 = false;
      }
      if (skillAtackMarisa[0] == true) {
        elect.trigger();
        Boss[0] = Boss[0] - ((((60 + int(atackDamage[1] * 0.5)) * (((char2[5] * 1) + 100) / 100)) / 2) - int(Boss[1] * 0.3));
        char2St[1] -= 8;
      }
      if (skillAtackMarisa[1] == true) {
        elect.trigger();
        Boss[0] = Boss[0] - ((((130 + int(atackDamage[1] * 0.4)) * (((char2[5] * 1) + 100) / 100)) / 2) - int(Boss[1] * 0.3));
        char2St[1] -= 16;
      }
      if (skillAtackMarisa[2] == true) {
        atackDamage[1] = 399;
        char2St[1] -= 8;
        statusUp1.trigger();
      }
      if (skillAtackMarisa[3] == true) {
        elect.trigger();
        Boss[0] = Boss[0] - ((((200 + int(atackDamage[1] * 0.6)) * (((char2[5] * 1) + 100) / 100)) / 2) - int(Boss[1] * 0.5));
        char2St[1] -= 18;
      }
      if (skillAtackMarisa[4] == true) {
        char2[5] = 303;
        char2St[1] -= 5;
        statusUp1.trigger();
      }
      One4 = false;
    }
    //妖夢
    if (menuTime >= 2000 && menuTime <= 2900) {
      if (char3Ded==false) {
        fill(255, 30); 
        rect(1, 3, width, 150);
        fill(255);
        textSize(30);
      }
      if (menuTime >= 2000 && menuTime <= 2200) dy3-=5;
      if (menuTime >= 2200 && menuTime <= 2400) dy3-=4;
      if (menuTime >= 2400 && menuTime <= 2600) dy3-=3;
      if (menuTime >= 2600 && menuTime <= 2800) dy3-=2;
      if (menuTime >= 2800 && menuTime <= 2900) dy3-=1;
      if (atack[2] == true) {
        text(BossSkill[0], width / 2 - textWidth(BossSkill[0]) / 2, 78);
        fill(255, 0, 0);
        text(int(atackDamage[2] / 2) - Boss[1], width / 2 + 50, dy3);
      }
      if (gard[2] == true) {
        text(a, width / 2 - textWidth(a) / 2, 78);
      }
      if (item[2] == true) {
        text(b, width / 2 - textWidth(b) / 2, 78);
      }
      if (skillAtackYoumu[0] == true) {
        text(YoumuSkill[0], width / 2 - textWidth(YoumuSkill[0]) / 2, 78);
      }
      if (skillAtackYoumu[1] == true) {
        text(YoumuSkill[1], width / 2 - textWidth(YoumuSkill[1]) / 2, 78);
      }
      if (skillAtackYoumu[2] == true) {
        text(YoumuSkill[2], width / 2 - textWidth(YoumuSkill[2]) / 2, 78);
      }
      if (skillAtackYoumu[3] == true) {
        text(YoumuSkill[3], width / 2 - textWidth(YoumuSkill[3]) / 2, 78);
        fill(255, 0, 0);
        text((((160 + int(atackDamage[2] * 1)) * (((char3[5] * 1) + 100) / 100)) / 2) - int(Boss[1] * 0.5), width / 2 + 50, dy3);
      }
    }
    if (menuTime >= 2500 && One5 == true) {
      if (atack[2] == true) {
        punch.trigger();
        Boss[0] = Boss[0] - (int(atackDamage[2] / 2) - Boss[1]);
      }
      if (gard[2] == true) {
        char3[3]*=2;
      }
      if (item[2] == true) {
        char1St[0] += 330;
        char2St[0] += 330;
        char3St[0] += 330;
        char1Ded = false;
        char2Ded = false;
        char3Ded = false;
        One6 = false;
      }
      if (skillAtackYoumu[0] == true) {
        cure1.trigger();
        char1St[0] += char3[5] / 2;
        char2St[0] += char3[5] / 2;
        char3St[0] += char3[5] / 2;
        char3St[1] -= 18;
      }
      if (skillAtackYoumu[1] == true) {
        cure1.trigger();
        char1St[0] += char3[5];
        char2St[0] += char3[5];
        char3St[0] += char3[5];
        char3St[1] -= 24;
      }
      if (skillAtackYoumu[2] == true) {
        cure2.trigger();
        char1St[0] += char3[5] / 2;
        char2St[0] += char3[5] / 2;
        char3St[0] += char3[5] / 2;
        char1Ded = false;
        char2Ded = false;
        char3Ded = false;
        char3St[1] -= 30;
      }
      if (skillAtackYoumu[3] == true) {
        sword.trigger();
        Boss[0] = Boss[0] - ((((160 + int(atackDamage[2] * 1)) * (((char3[5] * 1) + 100) / 100)) / 2) - int(Boss[1] * 0.5));
        char3St[1] -= 10;
      }
      One5 = false;
    }

    //ボス
    if (menuTime >= 3000 && menuTime <= 3500) {
      if (One2 == true) {
        int kakuritu = int(random(0, 1.9));
        if (kamae == false) {
          if (kakuritu == 0) {
            BossSerect= int(random(0, 3.9));
          }
          if (kakuritu == 1) {
            if (One == true &&  Boss[0] < 4000) {
              BossSerect= int(random(5.0, 6.9));
            }
            if (One == false) {
              BossSerect= 5;
            }
          }
        }
        if (kamae == true) {
          if (kakuritu == 0) {
            BossSerect= int(random(0, 4.9));
          }
          if (kakuritu == 1) {
            if (One == true && Boss[0] < 4000) {
              BossSerect= 6;
            }
            if (One == false) {
              BossSerect= int(random(0, 4.9));
            }
          }
        }
        BossAtack[BossSerect] = true;
        One2 = false;
      }
      fill(255, 30); 
      rect(1, 3, width, 150);
      fill(255);
      textSize(30);
      if (menuTime >= 3000 && menuTime <= 3100) dy4-=5;
      if (menuTime >= 3100 && menuTime <= 3200) dy4-=4;
      if (menuTime >= 3300 && menuTime <= 3400) dy4-=3;
      if (menuTime >= 3400 && menuTime <= 3500) dy4-=2;
      if (menuTime >= 3000 && menuTime <= 3100) dy5-=5;
      if (menuTime >= 3100 && menuTime <= 3200) dy5-=4;
      if (menuTime >= 3300 && menuTime <= 3400) dy5-=3;
      if (menuTime >= 3400 && menuTime <= 3500) dy5-=2;
      if (noroi == true) {
        fill(255, 0, 0);
        text(100, width / 2 + 50, dy5);
        fill(255);
      }
      if (BossAtack[0]  == true) {
        text(BossSkill[0], width / 2 - textWidth(BossSkill[0]) / 2, 78);
      }
      if (BossAtack[1]  == true) {
        text(BossSkill[1], width / 2 - textWidth(BossSkill[1]) / 2, 78);
      }
      if (BossAtack[2]  == true) {
        text(BossSkill[2], width / 2 - textWidth(BossSkill[2]) / 2, 78);
      }
      if (BossAtack[3]  == true) {
        text(BossSkill[3], width / 2 - textWidth(BossSkill[3]) / 2, 78);
      }
      if (BossAtack[4]  == true && kamae == true) {
        text(BossSkill[4], width / 2 - textWidth(BossSkill[4]) / 2, 78);
      }
      if (BossAtack[5]  == true &&  kamae == false) {
        text(BossSkill[5], width / 2 - textWidth(BossSkill[5]) / 2, 78);
      }
      if (BossAtack[6]  == true && One == true) {
        text(BossSkill[6], width / 2 - textWidth(BossSkill[6]) / 2, 78);
        fill(0, 255, 0);
        text(3500, width / 2 + 50, dy4);
      }
    }
    if (menuTime >= 3500) {
      if (BossNoroi == true) {
        char1St[0] -= 100;
        char2St[0] -= 100;
        char3St[0] -= 100;
      }
      if (noroi == true) {
        Boss[0] -= 100;
      }
      if (BossAtack[0]  == true) {
        punch.trigger();
        int bossTarget = int(random(0, 2.9));
        if (bossTarget == 0) char1St[0] -= (200 - (char1[3] / 4));
        if (bossTarget == 1) char2St[0] -= (200 - (char2[3] / 4));
        if (bossTarget == 2) char3St[0] -= (200 - (char3[3] / 4));
      }
      if (BossAtack[1]  == true) {
        magicDrain.trigger();
        int bossTarget = int(random(0, 2.9));
        if (bossTarget == 0) char1St[0] -= (175 - (char1[3] / 4));
        if (bossTarget == 1) char2St[0] -= (175 - (char2[3] / 4));
        if (bossTarget == 2) char3St[0] -= (175 - (char3[3] / 4));
        bossTarget = int(random(0, 2.9));
        if (bossTarget == 0) char1St[0] -= (175 - (char1[3] / 4));
        if (bossTarget == 1) char2St[0] -= (175 - (char2[3] / 4));
        if (bossTarget == 2) char3St[0] -= (175 - (char3[3] / 4));
      }
      if (BossAtack[2]  == true) {
        reflection.trigger();
        char1St[0] -= (100 - (char1[3] / 4));
        char2St[0] -= (100 - (char2[3] / 4));
        char3St[0] -= (100 - (char3[3] / 4));
        BossNoroi = true;
      }
      if (BossAtack[3]  == true) {
        ice3.trigger();
        int bossTarget = int(random(0, 2.9));
        if (bossTarget == 0) char1St[0] -= (250 - (char1[3] / 4));
        if (bossTarget == 1) char2St[0] -= (250 - (char2[3] / 4));
        if (bossTarget == 2) char3St[0] -= (250 - (char3[3] / 4));
        bossTarget = int(random(0, 2.9));
        if (bossTarget == 0) char1St[0] -= (250 - (char1[3] / 4));
        if (bossTarget == 1) char2St[0] -= (250 - (char2[3] / 4));
        if (bossTarget == 2) char3St[0] -= (250 - (char3[3] / 4));
      }
      if (BossAtack[4]  == true && kamae == true) {
        darkness.trigger();
        char1St[0] -= (400 - (char1[3] / 4));
        char2St[0] -= (400 - (char2[3] / 4));
        char3St[0] -= (400 - (char3[3] / 4));
        kamae = false;
      }
      if (BossAtack[5]  == true &&  kamae == false) {
        charge.trigger();
        kamae = true;
      }
      if (BossAtack[6]  == true && One == true) {
        drain2.trigger();
        Boss[0] += 3500;
        if (Boss[0] > 6000) {
          Boss[0] = 6000;
        }
        One = false;
        println(BossSerect);
      }
    }
    if (menuTime >= 3500) {
      for (int i = 0; i < 7; i++) {
        skillAtackReimu[i] = false;
        BossAtack[i]  = false;
      }
      for (int i = 0; i < 5; i++) {
        skillAtackMarisa[i] = false;
      }
      for (int i = 0; i < 4; i++) {
        skillAtackYoumu[i] = false;
      }
      for (int i = 0; i < 3; i++) {
        item[i] = false;
      }
      if (gard[0] == true) {
        char1[3] /= 2;
        gard[0] = false;
      }
      if (gard[1] == true) {
        char2[3] /= 2;
        gard[1] = false;
      }
      if (gard[2] == true) {
        char3[3] /= 2;
        gard[2] = false;
      }
      dy1 = height / 3 - 50;
      dy2 = height / 3 - 50;
      dy3 = height / 3 - 50;
      dy4 = height / 3 - 50;
      dy5 = height / 3 - 50;
      atack[0] = false;
      atack[1] = false;
      atack[2] = false;
      MP1 = false;
      MP2 = false;
      MP3 = false;
      turn = true;
      playerSerect = true;
      menu = true;
      charct = 0;
      System = false;
    }
  }
}

void charHP() {
  if (char1St[0] < 0) {
    char1St[0] = 0;
    char1Ded = true;
  }
  if (char2St[0] < 0) {
    char2St[0] = 0;
    char2Ded = true;
  }
  if (char3St[0] < 0) {
    char3St[0] = 0;
    char3Ded = true;
  }
  if (char1St[1] < 0) {
    char1St[1] = 0;
  }
  if (char2St[1] < 0) {
    char2St[0] = 0;
  }
  if (char3St[1] < 0) {
    char3St[0] = 0;
  }
  if (char1Ded == true) char1St[0] = 0;
  if (char2Ded == true) char2St[0] = 0;
  if (char3Ded == true) char3St[0] = 0;
  if (char1St[0] > char1[0]) char1St[0] = char1[0];
  if (char2St[0] > char2[0]) char2St[0] = char2[0];
  if (char3St[0] > char3[0]) char3St[0] = char3[0];
  if (Boss[0] < 0) Boss[0] = 0;
  if (char1St[0] == 0 && char2St[0] == 0 && char3St[0] == 0) {
    frame2++;
    playerSerect = false;
    if (frame2 >= 90) {
      for (int i = 0; i < 3; i++) {
        item[i] = false;
      }
      for (int i = 0; i < 7; i++) {
        skillAtackReimu[i] = false;
        BossAtack[i]  = false;
      }
      for (int i = 0; i < 5; i++) {
        skillAtackMarisa[i] = false;
      }
      for (int i = 0; i < 4; i++) {
        skillAtackYoumu[i] = false;
      }
      if (gard[0] == true) {
        char1[3] /= 2;
        gard[0] = false;
      }
      if (gard[1] == true) {
        char2[3] /= 2;
        gard[1] = false;
      }
      if (gard[2] == true) {
        char3[3] /= 2;
        gard[2] = false;
      }
      dy1 = height / 3 - 50;
      dy2 = height / 3 - 50;
      dy3 = height / 3 - 50;
      dy4 = height / 3 - 50;
      dy5 = height / 3 - 50;
      atack[0] = false;
      atack[1] = false;
      atack[2] = false;
      MP1 = false;
      MP2 = false;
      MP3 = false;
      turn = true;
      playerSerect = true;
      menu = true;
      charct = 0;
      System = false;
      char1St[0] = char1[0];
      char2St[0] = char2[0];
      char3St[0] = char3[0];
      char1St[1] = char1[1];
      char2St[1] = char2[1];
      char3St[1] = char3[1];
      char1[3] = 160;
      char2[3] = 179;
      char3[3] = 100;
      atackDamage[0] = 361;
      atackDamage[1] = 285;
      char2[5] = 202;
      One6 = true;
      Boss[0] = 10000;
      Boss[0] = 10000;
      player.pause();
      player.rewind();
      setup();
    }
  } else if (Boss[0] == 0) {
    BossDed = true;
    frame2++;
    playerSerect = false;
    menu = false;
    System = false;
    if (frame2 >= 30 && frame2 >= 60) {
      fill(255);
      text("さすがね…", 200, height / 3);
    }
    if (frame2 >= 120) {
      for (int i = 0; i < 3; i++) {
        item[i] = false;
      }
      for (int i = 0; i < 7; i++) {
        skillAtackReimu[i] = false;
        BossAtack[i]  = false;
      }
      for (int i = 0; i < 5; i++) {
        skillAtackMarisa[i] = false;
      }
      for (int i = 0; i < 4; i++) {
        skillAtackYoumu[i] = false;
      }
      if (gard[0] == true) {
        char1[3] /= 2;
        gard[0] = false;
      }
      if (gard[1] == true) {
        char2[3] /= 2;
        gard[1] = false;
      }
      if (gard[2] == true) {
        char3[3] /= 2;
        gard[2] = false;
      }
      dy1 = height / 3 - 50;
      dy2 = height / 3 - 50;
      dy3 = height / 3 - 50;
      dy4 = height / 3 - 50;
      dy5 = height / 3 - 50;
      atack[0] = false;
      atack[1] = false;
      atack[2] = false;
      MP1 = false;
      MP2 = false;
      MP3 = false;
      turn = true;
      playerSerect = true;
      menu = true;
      charct = 0;
      System = false;
      One6 = true;
      char1St[0] = char1[0];
      char2St[0] = char2[0];
      char3St[0] = char3[0];
      char1St[1] = char1[1];
      char2St[1] = char2[1];
      char3St[1] = char3[1];
      char1[3] = 160;
      char2[3] = 179;
      char3[3] = 100;
      atackDamage[0] = 361;
      atackDamage[1] = 285;
      char2[5] = 202;
      Boss[0] = 10000;
      player.pause();
      player.rewind();
      setup();
    }
  }
}

void stop() {
  player.close(); 
  minim.stop(); 
  super.stop();
}
