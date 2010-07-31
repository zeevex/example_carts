<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function log_request($from, $message) {
    global $IPN_LOG;

    if($fp = fopen($IPN_LOG,"a")) {
       // $buffer = "<table width=100% border=1><tr><td valign='top' width=100>".htmlspecialchars($from)."</td><td>".htmlspecialchars($message)."</td></tr></table>\n";
        $buffer = "<div class='log_row'><div class='log_type'>".htmlspecialchars($from)."</div><div class='log_message'>".htmlspecialchars($message)."</div></div>\n";
		fputs($fp,$buffer);
        fclose($fp);
    }
}

function print_log() {
    global $IPN_LOG;

    if (is_readable($IPN_LOG)) {
        $fp = fopen($IPN_LOG,"r");
        $buffer = "";
        while (!feof($fp)) {
            $line = fgets($fp,1024);
            $buffer .= $line."</br>";
        }

        return  $buffer;
    }

    return "No log content found. Perhaps the directory where this PHP file is stored is not writable.";

}
?>