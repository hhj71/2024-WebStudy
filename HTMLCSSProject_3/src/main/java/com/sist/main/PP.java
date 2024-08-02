package com.sist.main;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class PP {
   public static void main(String[] args) {
      for(int i=1;i<=11;i++) {
         try {
            Document doc=Jsoup.connect("https://www.yes24.com/Product/Search?domain=GIFT&query=%EC%94%A8%EB%84%A4%EC%83%B5&page="+i).get();
            Elements url=doc.select("div.img_canvas span.img_grp a");
            for(int j=0;j<url.size();j++) {
               System.out.println(url.get(j).attr("href"));
               doc=Jsoup.connect("https://www.yes24.com"+url.get(j).attr("href")).get();
            }
         } catch (IOException e) {
            e.printStackTrace();
         }
      }
   }
}

