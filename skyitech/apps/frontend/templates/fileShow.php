<?php
$tDomain = SETTING_THUMB_DOMAIN;
?>
<h1><?php echo 'Free Download '. str_replace('_',' ',myUser::fileName($files->file_name)); ?></h1>
	<center>	<?php
	$thumbServer = 'sft'.ceil($files->id/500);
		if(is_file(sfConfig::get('sf_upload_dir').'/thumb/'.$thumbServer.'/'.$files->id.'_2.jpg')){
				echo '<p class="showimage">';
				echo image_tag(SETTING_THUMB_DOMAIN.'/'.$thumbServer.'/'.$files->id.'_2.jpg',array('class'=>'absmiddle'));
				echo '</p>';
		}
		elseif(is_file(sfConfig::get('sf_upload_dir').'/thumb/c/'.$files->category_id.'_2.jpg')){
				echo '<p class="showimage">';
				echo image_tag(SETTING_THUMB_DOMAIN.'/c/'.$files->category_id.'_2.jpg',array('class'=>'absmiddle'));
				echo '</p>';
		}
?></center>
<div class="fshow">
<?php if($files->description): ?>
	<div class="filedescription"><?php echo str_replace(chr(13),'<br />',$files->description); ?></div>
	<div class="devider">&nbsp;</div>
<?php endif; ?>
<?php
		$thumbServer = 'sft'.ceil($files->id/500);
		if(is_file(sfConfig::get('sf_upload_dir').'/thumb/'.$thumbServer.'/'.$files->id.'_'.SETTING_THUMB_FILE_TOP.'.jpg')){
				echo '<p class="showimage">';
				echo image_tag($tDomain.'/'.$thumbServer.'/'.$files->id.'_'.SETTING_THUMB_FILE_TOP.'.jpg',array('title'=>myUser::fileName($files->file_name,false), 'class'=>'absmiddle'));
				echo '</p>';
		}
?>
<?php myUser::getc('RG93bmxvYWQgTGluaw==',1);?>
<div class="fInfo">
<?php $dataServer = 'sfd'.ceil($files->id/500); ?>
<?php if($files->extension=='MP3' &&  $files->size < SETTING_MP3_PLAY_LIMIT*1024*1024 ): ?>
<div>
<center><audio controls preload="none"><source src="<?php echo url_for('files/download?id='.$files->id) ?>" type="audio/mpeg"> </audio></center>
</div>
<?php endif; ?>
	<?php if($files->extension=='JPG' || $files->extension=='PNG'): ?>
		<?php include(sfConfig::get('sf_upload_dir').'/advt/'.sfConfig::get('app_smallname').'/'.USERDEVICE.'_beforeDownload.php'); ?>
		<div class="fhd">Select Your Screen Size</div><div class="fi">
			<?php
			$sizes = explode(",",SETTING_WALLPAPER_SIZE);
			foreach($sizes as $k => $s){
				if($s=="")
					echo "<br/>";
				else{
					echo '<div class="downLink"> '.link_to('Download Now','files/download?id='.$files->id,array('class'=>'dwnLink','rel'=>'nofollow')).'</div>'; 

				}
			}
			?>
		</div>
		<?php include(sfConfig::get('sf_upload_dir').'/advt/'.sfConfig::get('app_smallname').'/'.USERDEVICE.'_afterDownload.php'); ?>
	<?php else: ?>
		<?php 
		include(sfConfig::get('sf_upload_dir').'/advt/'.sfConfig::get('app_smallname').'/'.USERDEVICE.'_beforeDownload.php');
		 
			echo '<div class="downLink"> '.link_to('Download Now','files/download?id='.$files->id,array('class'=>'dwnLink','rel'=>'nofollow')).'</div>'; 

		  
		include(sfConfig::get('sf_upload_dir').'/advt/'.sfConfig::get('app_smallname').'/'.USERDEVICE.'_afterDownload.php');
		if(count($multi)==0)
			echo '<div class="fhd">Size of file</div><div class="fi">'.myClass::formatSize($files->size).'</div>';
		?>
	<?php endif; ?>
	<?php
	if($files->singer){
		echo '<div class="fhd">Singer</div>';
		echo '<div class="fi">';
		foreach (explode(',',substr($files->singer,1,-1)) as $singer)
			if($singer)
				echo link_to($singer,'files/singer?singer='.$singer).'<br/>';
		echo '</div>';
	}
		echo '<div class="fhd">Category</div>';
		echo '<div class="fi">'.link_to($catName,'@filesList?parent='.$files->category_id.'&fname='.myUser::slugify($catName).'&sort='.myUser::getListOrd($list_ord)).'</div>';
	?>
</div>
</div>

<?php include(sfConfig::get('sf_upload_dir').'/advt/'.sfConfig::get('app_smallname').'/'.USERDEVICE.'_RelatedItemsBefore.php'); ?>
<div class="randomFile">
<h3>Related Files</h3>
<?php
$sql = "select * from files where category_id=".$files->category_id.' order by rand() limit 3';
$randomfiles = skyMysqlQuery($sql);
while($file = mysql_fetch_object($randomfiles))
{
	?>
	<div class="fl odd">
		<?php 
			$thumbServer = 'sft'.ceil($file->id/500);
			echo '<a class="fileName" href="'.url_for('@filesShow?id='.$file->id.'&name='.myUser::slugify( myUser::fileName($file->file_name,false) )).'">';
			echo '<div>';

	if(is_file(sfConfig::get('sf_upload_dir').'/thumb/'.$thumbServer.'/'.$file->id.'_'.SETTING_THUMB_FILE_LIST.'.jpg'))
		  		echo '<div>'.image_tag($tDomain.'/'.$thumbServer.'/'.$file->id.'_'.SETTING_THUMB_FILE_LIST.'.jpg',array('title'=>myUser::fileName($file->file_name,false))).'</div>';

                      elseif(is_file(sfConfig::get('sf_upload_dir').'/thumb/c/'.$files->category_id.'_1.jpg'))
	  		echo '<div>'.image_tag(SETTING_THUMB_DOMAIN.'/c/'.$files->category_id.'_1.jpg',array()).'</div>';
	  	

	    	echo '<div>'.str_replace('_',' ',myUser::fileName($file->file_name))."<br />";
    	if($file->singer)
    		echo '<span class="ar">'.str_replace(',',', ',substr($file->singer,1,-1)).'</span><br/>';
			if(!in_array($file->extension,array('JPG','GIF','PNG')))
			 echo "<span>[".myClass::formatsize($file->size)."]</span>  ";
			echo '';
			echo '</div>';
			echo '</div></a>';
			?>
  </div>
<?php
}
?>
</div>

<?php include(sfConfig::get('sf_upload_dir').'/advt/'.sfConfig::get('app_smallname').'/'.USERDEVICE.'_allPageBottom.php'); ?>
<div class="path"><?php 
	if(isset($_SERVER['HTTP_REFERER']) && strstr($_SERVER['HTTP_REFERER'],strtolower(sfConfig::get('app_sitename'))))
		echo '&laquo; '.link_to('Go Back',$_SERVER['HTTP_REFERER']).'<br />';
	echo link_to('Home',sfConfig::get('app_webpath')).' &raquo; ';
	echo $categoryPath;
	echo link_to($catName,'@filesList?parent='.$files->category_id.'&fname='.myUser::slugify($catName).'&sort='.myUser::getListOrd($list_ord));
?>
</div>
<div class="devider">&nbsp;</div>