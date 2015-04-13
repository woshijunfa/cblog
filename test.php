<?php
	$conn = mysql_pconnect("localhost","root","") or die("Can not connect to MySQL");
	echo "MySQL process id:". MySQL_thread_id($conn). "<br />";
	echo "Apache process id". getmypid();

	
	
