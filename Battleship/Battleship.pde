import processing.core.*;
import java.util.*;
import ddf.minim.*;
import static javax.swing.JOptionPane.*;
import java.io.File;

public class Battleship extends PApplet {

    int LADO=50, LINHAS=10, COLUNAS=10, count, count2, stage;
    int[][] tabuleiro = new int[LINHAS][COLUNAS];
    Random generator = new Random();
    PImage pa, qg, sm, dm, onda, sea, startscreen, regras, highscore, fim;
    Minim minim;
    AudioPlayer Splash, Explosion, musica;
    PrintWriter output;
    String lines[], id;

    
    public void settings() {
        size(495, 495);
    }

     public void setup() {
        noStroke();
        stage=0;
        
        //Load dos ficheiros da pasta data
        startscreen = loadImage("menu.jpg");
        pa=loadImage("pa.jpg");
        qg=loadImage("qg.jpg");
        sm=loadImage("sm.jpg");
        dm=loadImage("dm.jpg");
        onda=loadImage("splash.jpg");
        sea=loadImage("calmsea.jpg");
        regras=loadImage("regras.jpg");
        highscore=loadImage("highscore.jpg");
        fim=loadImage("fim.jpg");
        image(startscreen, 0, 0, 495, 495);
        minim = new Minim(this);
        Splash=minim.loadFile("Splash.wav");
        Explosion=minim.loadFile("Explosion.wav");
        musica=minim.loadFile("musica.wav");
        musica.play();
        musica.loop(); 
              
        //Ficheiro
        try{
        File f = new File("positions.txt");
        if(!f.exists() && !f.isDirectory()) { 
            f.createNewFile();
        }
        }catch(Exception e){}
        lines = loadStrings("positions.txt");
        if(lines.length!=3){
          output = createWriter("positions.txt");
          output.println("0");
          output.println("0");
          output.println("0");
          output.flush();
          output.close();
          lines = loadStrings("positions.txt");
        }
       
        for (int l = 0; l < LINHAS; l++){
          for (int c = 0; c < COLUNAS; c++){
            tabuleiro[l][c]=5;
          }
        }
        //Colocação barcos aleatoriamente
        for (int b = 0; b < 7; b++) {
          int nextl;
          int nextc;
          boolean done=false;
           
        //Porta-Aviões
             
             if(b==0){
               int r = generator.nextInt(4);
               if(r==0){
                 nextl = generator.nextInt(8);
                 nextc = generator.nextInt(8)+1;
                 tabuleiro[nextl][nextc] = 1;
                 tabuleiro[nextl+1][nextc]=1;      
                 tabuleiro[nextl+2][nextc]=1;
                 tabuleiro[nextl][nextc+1]=1;
                 tabuleiro[nextl][nextc-1]=1;
                 if(nextl-1>=0 && nextc-1>=0){
                     if(tabuleiro[nextl-1][nextc-1]==5){
                       tabuleiro[nextl-1][nextc-1]=6;
                      }
                 }
                 if(nextc-2>=0){
                   if(tabuleiro[nextl][nextc-2]==5){
                     tabuleiro[nextl][nextc-2]=6;
                   }
                 }
                 if(nextl+1<10 && nextc-1>=0){
                   if(tabuleiro[nextl+1][nextc-1]==5){
                     tabuleiro[nextl+1][nextc-1]=6;
                   }
                 }
                 if(nextl+2<10 && nextc-1>=0){
                   if(tabuleiro[nextl+2][nextc-1]==5){
                     tabuleiro[nextl+2][nextc-1]=6;
                   }
                 }
                 if(nextl-1>=0){
                   if(tabuleiro[nextl-1][nextc]==5){
                     tabuleiro[nextl-1][nextc]=6;
                   }
                 }
                 if(nextl+3<10){
                   if(tabuleiro[nextl+3][nextc]==5){
                     tabuleiro[nextl+3][nextc]=6;
                   }
                 }
                 if(nextl-1>=0 && nextc+1<10){
                   if(tabuleiro[nextl-1][nextc+1]==5){
                     tabuleiro[nextl-1][nextc+1]=6;
                   }
                 }
                 if(nextc+2<10){
                   if(tabuleiro[nextl][nextc+2]==5){
                     tabuleiro[nextl][nextc+2]=6;
                   }
                 }
                 if(nextl+1<10 && nextc+1<10){
                   if(tabuleiro[nextl+1][nextc+1]==5){
                     tabuleiro[nextl+1][nextc+1]=6;
                   }
                 }
                 if(nextl+2<10 && nextc+1<10){
                   if(tabuleiro[nextl+2][nextc+1]==5){
                     tabuleiro[nextl+2][nextc+1]=6;
                   }
                 }
               }if(r==1){
                 nextl = generator.nextInt(8)+1;
                 nextc = generator.nextInt(8);
                 tabuleiro[nextl][nextc] = 1;
                 tabuleiro[nextl+1][nextc]=1;      
                 tabuleiro[nextl-1][nextc]=1;
                 tabuleiro[nextl][nextc+1]=1;
                 tabuleiro[nextl][nextc+2]=1;
                 if(nextl-1>=0 && nextc-1>=0){
                    if(tabuleiro[nextl-1][nextc-1]==5){
                     tabuleiro[nextl-1][nextc-1]=6;
                   }
                 }
                 if(nextc-1>=0){
                   if(tabuleiro[nextl][nextc-1]==5){
                     tabuleiro[nextl][nextc-1]=6;
                   }
                 }
                 if(nextl+1<10 && nextc-1>=0){
                   if(tabuleiro[nextl+1][nextc-1]==5){
                     tabuleiro[nextl+1][nextc-1]=6;
                   }
                 }
                 if(nextl-2>=0){
                   if(tabuleiro[nextl-2][nextc]==5){
                     tabuleiro[nextl-2][nextc]=6;
                   }
                 }
                 if(nextl+2<10){
                   if(tabuleiro[nextl+2][nextc]==5){
                     tabuleiro[nextl+2][nextc]=6;
                   }
                 }
                 if(nextl+1<10 && nextc+1<10){
                   if(tabuleiro[nextl+1][nextc+1]==5){
                     tabuleiro[nextl+1][nextc+1]=6;
                   }
                 }
                 if(nextl-1>=0 && nextc+1<10){
                   if(tabuleiro[nextl-1][nextc+1]==5){
                     tabuleiro[nextl-1][nextc+1]=6;
                   }
                 }
                 if(nextl-1>=0 && nextc+2<10){
                   if(tabuleiro[nextl-1][nextc+2]==5){
                     tabuleiro[nextl-1][nextc+2]=6;
                   }
                 }
                 if(nextl+1<10 && nextc+2<10){
                   if(tabuleiro[nextl+1][nextc+2]==5){
                     tabuleiro[nextl+1][nextc+2]=6;
                   }
                 }
                 if(nextc+3<10){
                   if(tabuleiro[nextl][nextc+3]==5){
                     tabuleiro[nextl][nextc+3]=6;
                   }
                 }
               }if(r==2){
                 nextl = generator.nextInt(8);
                 nextc = generator.nextInt(8)+1;
                 tabuleiro[nextl][nextc] = 1;
                 tabuleiro[nextl+1][nextc]=1;      
                 tabuleiro[nextl+2][nextc]=1;
                 tabuleiro[nextl+2][nextc+1]=1;
                 tabuleiro[nextl+2][nextc-1]=1;
                 if(nextl+2<10 && nextc+2<10){
                   if(tabuleiro[nextl+2][nextc+2]==5){
                     tabuleiro[nextl+2][nextc+2]=6;
                   }
                 }
                 if(nextl+2<10 && nextc-2>=0){
                   if(tabuleiro[nextl+2][nextc-2]==5){
                     tabuleiro[nextl+2][nextc-2]=6;
                   }
                 }
                 if(nextc-1>=0){
                   if(tabuleiro[nextl][nextc-1]==5){
                     tabuleiro[nextl][nextc-1]=6;
                   }
                 }
                 if(nextl+1<10 && nextc-1>=0){
                   if(tabuleiro[nextl+1][nextc-1]==5){
                     tabuleiro[nextl+1][nextc-1]=6;
                   }
                 }
                 if(nextl+3<10 && nextc-1>=0){
                   if(tabuleiro[nextl+3][nextc-1]==5){
                     tabuleiro[nextl+3][nextc-1]=6;
                   }
                 }
                 if(nextl-1>=0){
                   if(tabuleiro[nextl-1][nextc]==5){
                     tabuleiro[nextl-1][nextc]=6;
                   }
                 }
                 if(nextl+3<10){
                   if(tabuleiro[nextl+3][nextc]==5){
                     tabuleiro[nextl+3][nextc]=6;
                   }
                 }
                 if(nextc+1<10){
                   if(tabuleiro[nextl][nextc+1]==5){
                     tabuleiro[nextl][nextc+1]=6;
                   }
                 }
                 if(nextl+1<10 && nextc+1<10){
                   if(tabuleiro[nextl+1][nextc+1]==5){
                     tabuleiro[nextl+1][nextc+1]=6;
                   }
                 }
                 if(nextl+3<10 && nextc+1<10){
                   if(tabuleiro[nextl+3][nextc+1]==5){
                     tabuleiro[nextl+3][nextc+1]=6;
                   }
                 }
               }if(r==3){
                 nextl = generator.nextInt(8)+1;
                 nextc = generator.nextInt(8);
                 tabuleiro[nextl][nextc] = 1;
                 tabuleiro[nextl][nextc+1]=1;
                 tabuleiro[nextl][nextc+2]=1;
                 tabuleiro[nextl+1][nextc+2]=1;      
                 tabuleiro[nextl-1][nextc+2]=1;
                 if(nextl+1<10 && nextc+3<10){
                   if(tabuleiro[nextl+1][nextc+3]==5){
                     tabuleiro[nextl+1][nextc+3]=6;
                   }
                 }
                 if(nextc-1>=0){
                   if(tabuleiro[nextl][nextc-1]==5){
                     tabuleiro[nextl][nextc-1]=6;
                   }
                 }
                 if(nextl-1>=0){
                   if(tabuleiro[nextl-1][nextc]==5){
                     tabuleiro[nextl-1][nextc]=6;
                   }
                 }
                 if(nextl+1<10){
                   if(tabuleiro[nextl+1][nextc]==5){
                     tabuleiro[nextl+1][nextc]=6;
                   }
                 }
                 if(nextl-1>=0 && nextc+1<10){
                   if(tabuleiro[nextl-1][nextc+1]==5){
                     tabuleiro[nextl-1][nextc+1]=6;
                   }
                 }
                 if(nextl+1<10 && nextc+1<10){
                   if(tabuleiro[nextl+1][nextc+1]==5){
                     tabuleiro[nextl+1][nextc+1]=6;
                   }
                 }
                 if(nextl-2>=0 && nextc<10){
                   if(tabuleiro[nextl-2][nextc+2]==5){
                     tabuleiro[nextl-2][nextc+2]=6;
                   }
                 }
                 if(nextl+2<10 && nextc+2<10){
                   if(tabuleiro[nextl+2][nextc+2]==5){
                     tabuleiro[nextl+2][nextc+2]=6;
                   }
                 }
                 if(nextl-1>=0 && nextc+3<10){
                   if(tabuleiro[nextl-1][nextc+3]==5){
                     tabuleiro[nextl-1][nextc+3]=6;
                   }
                 }
                 if(nextc+3<10){
                   if(tabuleiro[nextl][nextc+3]==5){
                     tabuleiro[nextl][nextc+3]=6;
                   }
                 }
               }
             }
             
            //Quebra-Gelo
             
            if (b==1){
               done=false;
               do{
                nextl = generator.nextInt(10);
                nextc = generator.nextInt(10);
                if(!contains(nextl,nextc)){
                  int r = generator.nextInt(2);
                  if(r==0){
                           if(nextl+3<10 && !contains(nextl+1, nextc) && !contains(nextl+2, nextc) && !contains(nextl+3, nextc)){
                           tabuleiro[nextl][nextc] = 2;
                           tabuleiro[nextl+1][nextc] = 2;
                           tabuleiro[nextl+2][nextc] = 2;
                           tabuleiro[nextl+3][nextc] = 2;
                           if(nextl+3<10 && nextc+1<10){
                             if(tabuleiro[nextl+3][nextc+1]==5){
                             tabuleiro[nextl+3][nextc+1]=6;
                             }
                           }
                           if(nextl-1>=0){
                             if(tabuleiro[nextl-1][nextc]==5){
                               tabuleiro[nextl-1][nextc]=6;
                             }
                           }
                           if(nextl+4<10){
                             if(tabuleiro[nextl+4][nextc]==5){
                               tabuleiro[nextl+4][nextc]=6;
                             }
                           }
                           if(nextc-1>=0){
                             if(tabuleiro[nextl][nextc-1]==5){
                               tabuleiro[nextl][nextc-1]=6;
                             }
                           }
                           if(nextl+1<10 && nextc-1>=0){
                             if(tabuleiro[nextl+1][nextc-1]==5){
                               tabuleiro[nextl+1][nextc-1]=6;
                             }
                           }
                           if(nextl+2<10 && nextc-1>=0){
                             if(tabuleiro[nextl+2][nextc-1]==5){
                               tabuleiro[nextl+2][nextc-1]=6;
                             }
                           }
                           if(nextl+3<10 && nextc-1>=0){
                             if(tabuleiro[nextl+3][nextc-1]==5){
                               tabuleiro[nextl+3][nextc-1]=6;
                             }
                           }
                           if(nextc+1<10){
                             if(tabuleiro[nextl][nextc+1]==5){
                               tabuleiro[nextl][nextc+1]=6;
                             }
                           }
                           if(nextl+1<10 && nextc+1<10){
                             if(tabuleiro[nextl+1][nextc+1]==5){
                               tabuleiro[nextl+1][nextc+1]=6;
                             }
                           }
                           if(nextl+2<10 && nextc+1<10){
                             if(tabuleiro[nextl+2][nextc+1]==5){
                               tabuleiro[nextl+2][nextc+1]=6;
                             }
                           }
                           done=true;
                           }
                  }
                  if(r==1){
                           if(nextc+3<10 && !contains(nextl, nextc+1) && !contains(nextl, nextc+2) && !contains(nextl, nextc+3)){
                           tabuleiro[nextl][nextc] = 2;
                           tabuleiro[nextl][nextc+1] = 2;
                           tabuleiro[nextl][nextc+2] = 2;
                           tabuleiro[nextl][nextc+3] = 2;
                           if(nextc-1>=0){
                             if(tabuleiro[nextl][nextc-1]==5){
                             tabuleiro[nextl][nextc-1]=6;
                             }
                           }
                           if(nextc+4<10){
                             if(tabuleiro[nextl][nextc+4]==5){
                               tabuleiro[nextl][nextc+4]=6;
                             }
                           }
                           if(nextl-1>=0){
                             if(tabuleiro[nextl-1][nextc]==5){
                               tabuleiro[nextl-1][nextc]=6;
                             }
                           }
                           if(nextl+1<10){
                             if(tabuleiro[nextl+1][nextc]==5){
                               tabuleiro[nextl+1][nextc]=6;
                             }
                           }
                           if(nextl-1>=0 && nextc+1<10){
                             if(tabuleiro[nextl-1][nextc+1]==5){
                               tabuleiro[nextl-1][nextc+1]=6;
                             }
                           }
                           if(nextl+1<10 && nextc+1<10){
                             if(tabuleiro[nextl+1][nextc+1]==5){
                               tabuleiro[nextl+1][nextc+1]=6;
                             }
                           }
                           if(nextl-1>=0 && nextc+2<10){
                             if(tabuleiro[nextl-1][nextc+2]==5){
                               tabuleiro[nextl-1][nextc+2]=6;
                             }
                           }
                           if(nextl+1<10 && nextc+2<10){
                             if(tabuleiro[nextl+1][nextc+2]==5){
                               tabuleiro[nextl+1][nextc+2]=6;
                             }
                           }
                           if(nextl-1>=0 && nextc+3<10){
                             if(tabuleiro[nextl-1][nextc+3]==5){
                               tabuleiro[nextl-1][nextc+3]=6;
                             }
                           }
                           if(nextl+1<10 && nextc+3<10){
                             if(tabuleiro[nextl+1][nextc+3]==5){
                               tabuleiro[nextl+1][nextc+3]=6;
                             }
                           }
                           done=true;
                           }
                  }                
                }
               }while(!done);
             }
             
           //Submarino
             
           if (b==2 || b==3){
               done=false;
               do{
                nextl = generator.nextInt(10);
                nextc = generator.nextInt(10);
                if(!contains(nextl,nextc)){
                  int r = generator.nextInt(2);
                  if(r==0){
                   if(nextl+1<10 && !contains(nextl+1, nextc)){
                           tabuleiro[nextl][nextc] = 3;
                           tabuleiro[nextl+1][nextc] = 3;
                           if(nextl-1>=0){
                             if(tabuleiro[nextl-1][nextc]==5){
                               tabuleiro[nextl-1][nextc]=6;
                             }
                           }
                           if(nextl+2<10){
                             if(tabuleiro[nextl+2][nextc]==5){
                               tabuleiro[nextl+2][nextc]=6;
                             }
                           }
                           if(nextc-1>=0){
                             if(tabuleiro[nextl][nextc-1]==5){
                               tabuleiro[nextl][nextc-1]=6;
                             }
                           }
                           if(nextl+1<10 && nextc-1>=0){
                             if(tabuleiro[nextl+1][nextc-1]==5){
                               tabuleiro[nextl+1][nextc-1]=6;
                             }
                           }
                           if(nextc+1<10){
                             if(tabuleiro[nextl][nextc+1]==5){
                               tabuleiro[nextl][nextc+1]=6;
                             }
                           }
                           if(nextl+1<10 && nextc+1<10){
                             if(tabuleiro[nextl+1][nextc+1]==5){
                               tabuleiro[nextl+1][nextc+1]=6;
                             }
                           }
                           done=true;}
                  }
                  if(r==1){
                   if(nextc+1<10 && !contains(nextl, nextc+1)){
                           tabuleiro[nextl][nextc] = 3;
                           tabuleiro[nextl][nextc+1] = 3;
                           if(nextc-1>=0){
                             if(tabuleiro[nextl][nextc-1]==5){
                               tabuleiro[nextl][nextc-1]=6;
                             }
                           }
                           if(nextc+2<10){
                             if(tabuleiro[nextl][nextc+2]==5){
                               tabuleiro[nextl][nextc+2]=6;
                             }
                           }
                           if(nextl-1>=0){
                             if(tabuleiro[nextl-1][nextc]==5){
                               tabuleiro[nextl-1][nextc]=6;
                             }
                           }
                           if(nextl+1<10){
                             if(tabuleiro[nextl+1][nextc]==5){
                               tabuleiro[nextl+1][nextc]=6;
                             }
                           }
                           if(nextl-1>=0 && nextc+1<10){
                             if(tabuleiro[nextl-1][nextc+1]==5){
                               tabuleiro[nextl-1][nextc+1]=6;
                             }
                           }
                           if(nextl+1<10 && nextc+1<10){
                             if(tabuleiro[nextl+1][nextc+1]==5){
                               tabuleiro[nextl+1][nextc+1]=6;
                             }
                           }
                           done=true;}                  
                  }
                }
               }while(!done);
             }
             
             
             //Draga-Minas
             
             if(b>3 && b<7){
              
               do{
                  done=false;
                  nextl = generator.nextInt(10);
                  nextc = generator.nextInt(10);
                  if(!contains(nextl, nextc)){
                      tabuleiro[nextl][nextc]=4;
                      if(nextl-1>=0){
                             if(tabuleiro[nextl-1][nextc]==5){
                               tabuleiro[nextl-1][nextc]=6;
                             }
                           }
                           if(nextl+1<10){
                             if(tabuleiro[nextl+1][nextc]==5){
                               tabuleiro[nextl+1][nextc]=6;
                             }
                           }
                           if(nextc+1<10){
                             if(tabuleiro[nextl][nextc+1]==5){
                               tabuleiro[nextl][nextc+1]=6;
                             }
                           }
                           if(nextc-1>=0){
                             if(tabuleiro[nextl][nextc-1]==5){
                               tabuleiro[nextl][nextc-1]=6;
                             }
                           }
                      done=true;
                  } 
               }while(!done);
             }                 
         }  
    }
    
    //Função que impede que sejam colocados barcos em posições onde já existem barcos ou nas suas imediações
    public boolean contains(int x, int y){
        if(tabuleiro[x][y]!=5){
          return true;
        }
        return false;
    }
     public void draw() {
       boolean c2 = true;
       if(stage==0){
         
         //Menu
         image(startscreen, 0, 0, 495, 495);
           if (mouseX >= 167 && mouseX <= 326 && mouseY >= 96 && mouseY <= 169){
            if(mouseButton == LEFT){
              //Janela pop-up
              boolean vid=false;
              do{
                           count=0; count2=0;
                 id = showInputDialog("Por favor introduza um novo ID");
        
                 if (id==null){
                     
                     c2=!c2;
                     vid=true;
                 } else if(id.equals("")){
                    showMessageDialog(null, "ID inválido!", "Alerta", ERROR_MESSAGE);
                  
                 }else {
                    showMessageDialog(null, "ID \"" + id + "\" adicionado com sucesso!", "Informação", INFORMATION_MESSAGE); 
                    vid=true;
                 }
                }while(!vid);      
                if(!c2){
                   stage=0;
                }else{
                  stage=1;
                }
            } 
          } 
          if (mouseX >= 167 && mouseX <= 326 && mouseY >= 207 && mouseY <= 280){
            if(mouseButton == LEFT){
             
              stage=2;
            } 
          } 
          if (mouseX >= 167 && mouseX <= 326 && mouseY >= 320 && mouseY <= 393){
            if(mouseButton == LEFT){
             
              stage=3;
            }  
          }
          if (mouseX >= 9 && mouseX <= 73 && mouseY >= 431 && mouseY <= 491){
            if(mouseButton == LEFT){
             
              exit();  
            }
          }
       }
       
      if(stage==1){
         
        //Desenha tabuleiro 
        desenha(); 
      }
      
      if(stage==2){
        //Regras do jogo
         image(regras, 0, 0, 495, 495);
         
         //Exit
         if (mouseX >= 7 && mouseX <= 78 && mouseY >= 4 && mouseY <= 72){
            if(mouseButton == LEFT){
             
              stage=0;
            }  
         }
      }
      if(stage==3){
        //Pontuações máximas
        image(highscore, 0, 0, 495, 495);
         
         textSize(32);
         text(lines[0], 80, 185); 
         fill(0, 0, 0);
         textSize(32);
         text(lines[1], 80, 262);
         fill(0, 0, 0);
         textSize(32);
         text(lines[2], 80, 337);
         fill(0, 0, 0);
         
         //Exit
         if (mouseX >= 7 && mouseX <= 78 && mouseY >= 4 && mouseY <= 72){
            if(mouseButton == LEFT){
             
              stage=0;
            }  
         }
      }
      if(stage==4){
        //Final
        image(fim, 0, 0, 495, 495);
        textSize(25);text("Venceu o jogo após "+count2+" tentativas!", 40, 245);
        fill(0, 0, 0);
        
        if (keyPressed) {
          if (key == ' ') {
            exit();
          }
        }
      }
    }  
   
    //Função que vira cada quadrado se clicado
    public void mousePressed() {
      if(stage==1){
        int l, c;
        c = mouseX / LADO;
        l = mouseY / LADO;
        if (tabuleiro[l][c] > 0) {
            tabuleiro[l][c] = -tabuleiro[l][c];
            //desenha();
             if (tabuleiro[l][c]==-5 || tabuleiro[l][c]==-6) {
               Splash.rewind();
               Splash.play();
               count2++;
            }
            else {
              Explosion.rewind();
              Explosion.play();
              count++;
              count2++;
            }
         }
         if(count==16){
            winner();
            musica.pause();
            desenha();
            stage=4;
         }
      }
   }
   //Funçao para imprimir os resultados(se elevados o suficiente) no ficheiro
   public void winner(){
      output = createWriter("positions.txt");
      if(lines[0].equals("0")){
        output.println(id+ " - " +count2);
        output.println("0");
        output.println("0");
      }else if(count2<toInt(lines[0])){
           output.println(id +" - "+count2);
           output.println(lines[0]);
           output.println(lines[1]);
       }else if(lines[1].equals("0")){
          output.println(lines[0]);
          output.println(id +" - "+count2);
          output.println("0");
       }else if(count2<toInt(lines[1])){
           output.println(lines[0]);
           output.println(id +" - "+count2);
           output.println(lines[1]);
       }else if(lines[2].equals("0")){
           output.println(lines[0]);
           output.println(lines[1]);
           output.println(id +" - "+count2);
       }else if(count2<toInt(lines[2])){
             output.println(lines[0]);
             output.println(lines[1]);
             output.println(id +" - "+count2);
       }else{
             output.println(lines[0]);
             output.println(lines[1]);
             output.println(lines[2]);
       }
            output.flush();
            output.close();
   }
   //Função para isolar o valor de tentativas, de modo a ordenar os valores no ficheiro
   public int toInt(String x){
     String [] aux = x.split(" - ");
     return Integer.parseInt(aux[1]);
   }
  //Função que desenha os barcos
  public void desenha(){
        background(0, 0, 0);
        for (int l = 0; l < LINHAS; l++) {
            for (int c = 0; c < COLUNAS; c++) {
              rect(c * LADO, l * LADO, LADO - 5, LADO - 5);
              image(sea,c*LADO, l*LADO);
              if (tabuleiro[l][c] < 0) {       
                    if(tabuleiro[l][c]==-1){
                         image(pa,c*LADO, l*LADO);
                    }
                    if(tabuleiro[l][c]==-2){
                         image(qg, c*LADO, l*LADO);
                    }
                    if(tabuleiro[l][c]==-3){
                         image(sm, c*LADO, l*LADO);
                    }
                    if(tabuleiro[l][c]==-4){
                         image(dm, c*LADO, l*LADO);
                    }
                    if(tabuleiro[l][c]==-5){
                         image(onda, c*LADO, l*LADO);
                    }
                    if(tabuleiro[l][c]==-6){
                         image(onda, c*LADO, l*LADO);
                    }
                } 
            }
        }
  }    
 void keyPressed(){
  
  if (stage!=4){
   if (key == 'm')
   {
      if (musica.isPlaying())
      {
        musica.pause();
      }  
      else
      {  
        musica.play();
      }  
    } 
  }
 } 
}  