package test;

import webcollector.collect.GetPlaylist;
import webcollector.collect.GetRadio;
import webcollector.collect.GetSong;

public class test {
	public static void go(){
				// TODO Auto-generated method stub
					try {
						GetSong.go();
						GetPlaylist.go();
						GetRadio.go();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		
}
