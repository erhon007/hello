<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'wldn_mysql';
$CFG->dbname    = 'lms';
$CFG->dbuser    = 'lms';
$CFG->dbpass    = 'Jhaw58$sn#JLsV';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '',
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_unicode_ci',
);
#$CFG->wwwroot   = 'https://ecsp-demo.wldn.kz';
$CFG->wwwroot   = 'https://138.201.19.103:7788';
$CFG->dataroot  = '/opt/lmsdata';
$CFG->admin     = 'admin';

$CFG->site_is_public = false;

$CFG->reverseproxy = true;

$CFG->directorypermissions = 0777;

$CFG->xsendfile = 'X-Accel-Redirect';
$CFG->xsendfilealiases = array(
    '/dataroot/' => $CFG->dataroot
);

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
