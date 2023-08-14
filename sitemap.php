<?php
$sitemap="sitemap.xml";
$siteurl="https://".$_SERVER['HTTP_HOST'];
$phpself=$_SERVER['PHP_SELF'];
$limited=50000000000000000000;      //Sitemap Links Limit

$priority="0.5";     //change priority any one:- 0.5, 0.80

$changefreq="daily"; //change freq any one:- always, Hourly, daily, weekly, monthly, yearly, never

$category = skyMysqlQuery("select id, category_name, child, flag_new, flag_updated, flag_hot, files, url from category where status='A' and parents='|' order by ord asc, id desc");

while($value = mysql_fetch_object($category)):
    if($value->child=='D'):
$url.="<url>
<loc>".$siteurl.str_replace($phpself, '', url_for('/category/list/?parent='.$value->id.'&fname='.myUser::slugify($value->category_name)))."</loc>
<changefreq>".$changefreq."</changefreq>
<priority>".$priority."</priority>
</url>\n";
endif;
endwhile;

$fList = skyMysqlQuery('select id,file_name,category_id,created_at from files where status!="B" order by id desc limit '.$limited);


	while($files = mysql_fetch_object($fList)):
$parent = skyGetRecordById('category',$files->category_id);
$catlink.=$siteurl.str_replace($phpself, '', url_for('/files/list/?parent='.$files->category_id.'&fname='.myUser::slugify($parent->category_name)))."**";
$date=explode(" ", $files->created_at);
$lastmod=$date[0]."T".$date[1]."+00:00";
$url.="<url>
<loc>".$siteurl.str_replace($phpself, '', url_for('@filesShow?id='.$files->id.'&name='.myUser::slugify( myUser::fileName($files->file_name,false) )))."</loc>
<lastmod>".$lastmod."</lastmod>
<changefreq>".$changefreq."</changefreq>
<priority>".$priority."</priority>
</url>\n";

 endwhile;
$head="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" .
 "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"\n" .
                 "        xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n" .
                 "        xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9\n" .
                 "        http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">
<url>\n<loc>".$siteurl."/</loc>\n<changefreq>".$changefreq."</changefreq>\n<priority>".$priority."</priority>\n</url>\n";
$end="</urlset>";
$catlink=explode("**", preg_replace("/[*]+$/", "", $catlink));
$catlink = array_unique($catlink);
foreach($catlink as $value) {
$url.="<url>
<loc>".preg_replace("/ /", "_", $value)."</loc>
<changefreq>".$changefreq."</changefreq>
<priority>".$priority."</priority>
</url>\n";
}

$write=$head.$url.$end;
@unlink($sitemap);
if (file_exists($sitemap)) {
  $fh = fopen($sitemap, 'a');
  fwrite($fh, $write);
} else {
  $fh = fopen($sitemap, 'w');
  fwrite($fh, $write);
}
fclose($fh);
$google="https://www.google.com/webmasters/tools/ping?sitemap=";
$ch = curl_init(); 
            curl_setopt($ch, CURLOPT_URL, $google.$siteurl."/".$sitemap); 
            curl_setopt($ch, CURLOPT_HEADER, TRUE);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE); 
            $head = curl_exec($ch); 
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); 
            curl_close($ch);
if($httpCode==200){
echo '<div class="finfo tCenter"><b>Sitemap Success Fully Generated</b>
<p class="home"><a href="/'.$sitemap.'"><b>View Your Sitemap</b></a></p>
</div>';
}
 ?>
