package com.sist.main;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.StoreDAO;
import com.sist.dao.StoreVO;

public class MainClass {
	public static void main(String[] args) {
			int k=1;
			StoreDAO dao = StoreDAO.newInstance();
				for(int i=1;i<=11;i++) {
					try
					{
					Document doc = Jsoup.connect("https://www.yes24.com/Product/Search?domain=GIFT&query=%EC%94%A8%EB%84%A4%EC%83%B5&page="+i).get();
					Elements link = doc.select("div.img_canvas span.img_grp a");
					for(int j=0; j<link.size(); j++)
					{
						try
						{
						System.out.println(link.get(j).attr("href"));
						System.out.println("상품번호 :"+k++);
						String url="https://www.yes24.com"+link.get(j).attr("href"); // 링크
						// 상세보기로 이동
						Document doc2 = Jsoup.connect(url).get();
						
						Element name=doc2.selectFirst("div.gd_titArea h2.gd_name");
						System.out.println(name.text());
						Element price=doc2.selectFirst("div.gd_infoTb em.yes_m");
						System.out.println(price.text());
						Element image=doc2.selectFirst("div.gd_imgArea em.imgBdr img.gImg");
						System.out.println(image.attr("src"));
						Element content=doc2.selectFirst("div.infoWrap_txt img.lazy");
						System.out.println(content.attr("data-original"));
						
						System.out.println("============================================================");
						StoreVO vo = new StoreVO();
						
						vo.setName(name.text());
						vo.setPrice(price.text());
						vo.setImage(image.attr("src"));
						vo.setContent(content.attr("data-original"));
						dao.storeInsert(vo);
						
					}catch(Exception ex) {ex.printStackTrace();}
					}
				
			}catch(Exception ex) {ex.printStackTrace();}
	
	}
	}
}
