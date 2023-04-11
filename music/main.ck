me.dir() + "data/note_a.wav" => string sound_0;
me.dir() + "data/note_b.wav" => string sound_1;
me.dir() + "data/note_c.wav" => string sound_2;
me.dir() + "data/note_d.wav" => string sound_3;
me.dir() + "data/note_e.wav" => string sound_4;
me.dir() + "data/bg-music-1.wav" => string bg_music;
me.dir() + "data/tra1.wav" => string tra_1;
me.dir() + "data/tra2.wav" => string tra_2;
me.dir() + "data/tra3.wav" => string tra_3;
me.dir() + "data/euphonium.wav" => string euphonium;

// the patch 
SndBuf buf_0 => dac;
SndBuf buf_1 => dac;
SndBuf buf_2 => dac;
SndBuf buf_3 => dac;
SndBuf buf_4 => dac;
SndBuf bg_music_buf => dac;
SndBuf tra_1_buf => dac;
SndBuf tra_2_buf => dac;
SndBuf tra_3_buf => dac;
SndBuf euphonium_buf => dac;

// load the file
sound_0 => buf_0.read;
sound_1 => buf_1.read;
sound_2 => buf_2.read;
sound_3 => buf_3.read;
sound_4 => buf_4.read;
bg_music => bg_music_buf.read;
tra_1 => tra_1_buf.read;
tra_2 => tra_2_buf.read;
tra_3 => tra_3_buf.read;
euphonium => euphonium_buf.read;

9999999 => buf_0.pos;
9999999 => buf_1.pos;
9999999 => buf_2.pos;
9999999 => buf_3.pos;
9999999 => buf_4.pos;
9999999 => bg_music_buf.pos;
9999999 => tra_1_buf.pos;
9999999 => tra_2_buf.pos;
9999999 => tra_3_buf.pos;
9999999 => euphonium_buf.pos;

// create our OSC receiver
OscIn oin;
// create our OSC message
OscMsg msg;
// use port 6449 (or whatever)
6449 => oin.port;
// create an address in the receiver, expect an int and a float
oin.addAddress("0");
oin.addAddress("1");
oin.addAddress("2");
oin.addAddress("3");
oin.addAddress("4");
oin.addAddress("5");
oin.addAddress("6");
oin.addAddress("7");
oin.addAddress("8");
oin.addAddress("9");


// time loop
while( true )
{
    oin => now;

    while(oin.recv(msg)) 
    {
      msg.address @=> string address;
      // Math.random2f(.9,.9) => buf.gain;
      if(msg.address == "0"){
        Math.random2f(.89,.9) => buf_0.rate;
        0 => buf_0.pos;
      }
      if(msg.address == "1"){
        Math.random2f(.89,.9) => buf_1.rate;
        0 => buf_1.pos;
      }
      if(msg.address == "2"){
        Math.random2f(.89,.9) => buf_2.rate;
        0 => buf_2.pos;
      }
      if(msg.address == "3"){
        Math.random2f(.89,.9) => buf_3.rate;
        0 => buf_3.pos;
      }
      if(msg.address == "4"){
        Math.random2f(.89,.9) => buf_4.rate;
        0 => buf_4.pos;
      }
      if(msg.address == "5"){
        Math.random2f(.89,.9) => bg_music_buf.rate;
        0 => bg_music_buf.pos;
      }
      if(msg.address == "6"){
        Math.random2f(.89,.9) => tra_1_buf.rate;
        0 => tra_1_buf.pos;
      }
      if(msg.address == "7"){
        Math.random2f(.89,.9) => tra_2_buf.rate;
        0 => tra_2_buf.pos;
      }
      if(msg.address == "8"){
        Math.random2f(.89,.9) => tra_3_buf.rate;
        0 => tra_3_buf.pos;
      }
      if(msg.address == "9"){
        Math.random2f(.89,.9) => euphonium_buf.rate;
        0 => euphonium_buf.pos;
      }
    }
    10::ms => now;
}