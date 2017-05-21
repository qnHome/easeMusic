package webcollector.collect;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.csvreader.CsvWriter;

import cn.edu.hfut.dmic.webcollector.model.CrawlDatums;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.plugin.berkeley.BreadthCrawler;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.json.*;


/**
 * 获取网易云音乐所有歌曲的id，并且写入csv文件中
 * @author wqn
 */
public class GetPlaylist extends BreadthCrawler {
	private static SessionFactory factory; 
	// 添加变量为CsvWriter
	private CsvWriter r = null;
	private static int n = 0;
	/**
	 * 关闭csv文件
	 */
	public void closeCsv() {
		this.r.close();
	}
	/**
	 * 将二进制流转化为byte字节数组
	 * @param instream
	 * @return
	 * @throws IOException
	 */
	public static byte[] readInputStream(InputStream instream) throws IOException {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();  
        byte[]  buffer = new byte[1204];  
        int len = 0;  
        while ((len = instream.read(buffer)) != -1){  
            outStream.write(buffer,0,len);  
        }  
        instream.close();  
        return outStream.toByteArray(); 
	}
	/**
	 * 根据URL获得网页源码
	 * @param url 传入的URL
	 * @return String
	 * @throws IOException 
	 */
	public static String getURLSource(URL url) throws IOException {
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		conn.setConnectTimeout(5 * 1000);
		InputStream inStream = conn.getInputStream();
		byte[] data = readInputStream(inStream);
		String htmlSource = new String(data);
		return htmlSource;
	}
	/**
	 * 重写构造函数
	 * @param crawlPath 爬虫路径
	 * @param autoParse 是否自动解析
	 */
	public GetPlaylist(String crawlPath, boolean autoParse) throws FileNotFoundException {
		super(crawlPath, autoParse);
		// 逗号进行分割，字符编码为UTF-8
		this.r = new CsvWriter("playlist.csv", ',', Charset.forName("UTF-8"));		
	}
	@Override
	public void visit(Page page, CrawlDatums next) {
		// 继承覆盖visit方法，该方法表示在每个页面进行的操作
		// 参数page和next分别表示当前页面和下个URL对象的地址
		// 生成文件songId.csv，第一列为歌曲id，第二列为歌曲名字，第三列为演唱者，第四列为歌曲信息的URL
		// 网易云音乐song页面URL地址正则
		String song_regex = "^http://music.163.com/playlist\\?id=[0-9]+";
		// 创建Pattern对象
		Pattern songIdPattern = Pattern.compile("^http://music.163.com/playlist\\?id=([0-9]+)");
		// 对页面进行正则判断，如果有的话，将歌曲的id和网页标题提取出来，否则不进行任何操作
		if (Pattern.matches(song_regex, page.getUrl())) {
			// 将网页的URL和网页标题提取出来，网页标题格式：歌曲名字-歌手-网易云音乐
			String url = page.getUrl();
			@SuppressWarnings("deprecation")
			String title = page.getDoc().title();
			String songId = null;
			// 对标题进行歌曲名字、歌手解析
			String name[] = title.split("-"); 
			System.out.println("正在抽取:" + url);
			// 创建Matcher对象，使用正则找出歌曲对应id
			Matcher idMatcher = songIdPattern.matcher(url);
			if (idMatcher.find()) {
				songId = idMatcher.group(1);
			}
			System.out.println("歌曲:" + name[0]);
			System.out.println("ID:" + songId);	

			String[] contents = {songId, name[0], url};

			PlayList m = new PlayList();
			m.setId(songId.toString());
			m.setListname(name[0]);
			m.setUrl(url);

			test(m);
			
//			n++;		
			try {
				this.r.writeRecord(contents);
				this.r.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public void test(PlayList m){  
		 
        Session session = factory.openSession();  
        Transaction ts = session.getTransaction();  
        try{  
                  //开启事务  
                  ts.begin();  
                    
                  session.save(m);  
                    
                  ts.commit();  
        }catch(Exception e){  
                  e.printStackTrace();  
                  ts.rollback();  
        }  
	}
	
	
       public static void listStudents( ){
 		   
 	      Session session = factory.openSession();
 	      Transaction tx = null;
 	      try{
 	         tx = session.beginTransaction();
 	         List employees = session.createQuery("FROM PlayList").list(); 
 	         
 	         for (Iterator iterator = 
 	                           employees.iterator(); iterator.hasNext();){
 	            PlayList ms = (PlayList) iterator.next(); 
 	            System.out.print("   "+ms.getId()+"  \t"); 
 	            System.out.print("   "+ms.getListname()+"    \t\t"); 
 	            System.out.println("   "+ms.getUrl()+"    \t"); 
 	         }
 	         tx.commit();
 	      }catch (HibernateException e) {
 	         if (tx!=null) tx.rollback();
 	         e.printStackTrace(); 
 	      }finally {
 	         session.close(); 
 	      }
 	   }
       
       
	/**
	 * 歌曲id爬虫开始
	 * @param args
	 * @throws Exception 
	 */
	public static void go() throws Exception {
		try{
			//加载配置文件
			Configuration configuration = new Configuration().configure("hibernate.xml");
			StandardServiceRegistryBuilder standardServiceRegistryBuilder =	new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
			StandardServiceRegistry standardServiceRegistry = standardServiceRegistryBuilder.build();
			factory = configuration.buildSessionFactory(standardServiceRegistry);
			
	    }catch (Throwable ex) { 
	        System.err.println("Failed to create sessionFactory object." + ex);
	        throw new ExceptionInInitializerError(ex); 
	    }

		GetPlaylist crawler = new GetPlaylist("crawler", true);
		// 添加初始种子页面http://music.163.com
		crawler.addSeed("http://music.163.com/");
		// 设置采集规则为所有类型的网页
		crawler.addRegex("http://music.163.com/.*");
		// 设置爬取URL数量的上限
		crawler.setTopN(300);
		// 设置线程数
		crawler.setThreads(30);
		// 设置断点采集
		crawler.setResumable(false);
		// 设置爬虫深度
		crawler.start(5);
		listStudents();
		factory.close();
		
	}
}
