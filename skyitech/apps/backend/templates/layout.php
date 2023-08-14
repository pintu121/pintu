<?php use_helper('Javascript') ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<?php include_http_metas() ?>
<?php include_metas() ?>
<?php include_title() ?>
<link rel="shortcut icon" href="/mm-admin4589/favicon.ico" />
</head>
<body>
	<?php if($sf_user->isAuthenticated()){ ?>
	<?php include_partial('global/navigation'); ?>
	<?php } ?>
	<div class="mainDiv">
		<?php echo $sf_data->getRaw('sf_content') ?>
	</div>

<script type="text/javascript">
function delCat()
{
	var ok=prompt('Please type secrate code here:','');
	if(ok=='d')
		return true;
	else
		return false;
}
jQuery('.editor').dblclick(function(){
	CKEDITOR.replace( this );
});

if(jQuery('.activeDeactiveButton').find('input').attr('checked')==true){
	jQuery('.activeDeactiveButton').addClass('selected');
	jQuery('.activeDeactiveButton').find('span').html('Active');
}
else{
	jQuery('.activeDeactiveButton').find('span').html('Block');
}
jQuery('.activeDeactiveButton').click(function(){
	if(jQuery(this).hasClass('selected')){
		jQuery(this).removeClass('selected');
		jQuery(this).find('input').attr('checked','');
		jQuery(this).find('span').html('Block');
	}
	else{
		jQuery(this).addClass('selected');
		jQuery(this).find('input').attr('checked','checked');
		jQuery(this).find('span').html('Active');
	}
}); 


if(jQuery('.featureButton').find('input').attr('checked')==true){
	jQuery('.featureButton').addClass('selected');
	jQuery('.featureButton').find('span').html('ON');
}
else{
	jQuery('.featureButton').find('span').html('OFF');
}
jQuery('.featureButton').click(function(){
	if(jQuery(this).hasClass('selected')){
		jQuery(this).removeClass('selected');
		jQuery(this).find('input').attr('checked','');
		jQuery(this).find('span').html('OFF');
	}
	else{
		jQuery(this).addClass('selected');
		jQuery(this).find('input').attr('checked','checked');
		jQuery(this).find('span').html('ON');
	}
}); 
</script>
</body>
</html>
