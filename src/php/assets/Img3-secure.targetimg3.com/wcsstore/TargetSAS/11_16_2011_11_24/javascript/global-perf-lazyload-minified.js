var Print={get:function(a){var d=typeof a=="string"?eval(a):$(a),b=$('<iframe id="PrintFrame" name="PrintFrame" src="print.php" style="width:1px; height:1px;">');$("body").prepend(b);$("#PrintFrame").load(function(){$("body",b[0].contentWindow.document).html(d.html());var c=window.frames.PrintFrame;c.focus();c.print();setTimeout(function(){$("#PrintFrame").remove()},100)})}};