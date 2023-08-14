<?php
if($_SERVER['HTTP_HOST'] !='hindiworth.com') {
	header('Location: https://hindiworth.com'.$_SERVER['REQUEST_URI'],TRUE,301);
	exit;
}

define('SF_ROOT_DIR',    realpath(dirname(__FILE__).'/../skyitech'));
define('SF_APP', 'backend');
define('SF_ENVIRONMENT','hindiworth');
define('SF_DEBUG', false);

require_once(SF_ROOT_DIR.DIRECTORY_SEPARATOR.'apps'.DIRECTORY_SEPARATOR.SF_APP.DIRECTORY_SEPARATOR.'config'.DIRECTORY_SEPARATOR.'config.php');

sfContext::getInstance()->getController()->dispatch();
