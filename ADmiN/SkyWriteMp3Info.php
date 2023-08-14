<?
  if($_REQUEST['singer'])
          $artist = base64_decode($_REQUEST['singer']);
        else
          $artist = 'HindiWorth.COM';
$commonkeysarrayWrite = array(
	'Title'			=>	substr(base64_decode($_REQUEST['lastFile']),0,-4),
	'Artist'		=>	$artist,
	'Album'			=>	base64_decode($_REQUEST['catName']).' - HindiWorth.COM',
	'Year'			=>	date("Y"),
	'Comment'		=>	'Downloaded From HindiWorth.COM',
	'Composer'	        =>	'HindiWorth.COM',
	'Band'		=>	$artist,
	'original_artist'       =>	'Downloaded From HindiWorth.COM',
	'Publisher'	        =>	'HindiWorth.COM',
);
?>
