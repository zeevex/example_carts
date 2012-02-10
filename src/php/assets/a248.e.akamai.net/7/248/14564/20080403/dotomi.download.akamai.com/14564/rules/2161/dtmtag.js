//
// dtmtag.js
// Dotomi Platform Integration for Target
// (c) 2008 Dotomi, Inc.
// Ver 2.02
//
var _DTMTAG={
"sto": function(t){ this.hto=setTimeout('timeOutDotomi()', t ? t : 3000); },
"init": function(cid) {
    if(!cid) return;  // bail if we do not get a cid
    var style="display:none",typ="text/javascript",rulesUrl,prot=window.location.protocol,doc=document;
    this.cid=cid;
    this.prot=prot;
    
	rulesUrl = prot + "//a248." + (prot == "http:" ? "g" : "e") + ".akamai.net/7/248/14564/20080403/dotomi.download.akamai.com/14564/rules/" + cid + "/rules.js";
    
    // load tag rules
    var sc=_DTMTAG.crEl(doc,["script","type", typ, "src", rulesUrl]);
    if(sc){
        var ib=doc.getElementsByTagName("body")[0].firstChild;
        if(ib) ib.parentNode.insertBefore(sc,ib);
    } else {
        doc.write('<scr'+'ipt type="' + typ + '" src="' + rulesUrl + '"></scr'+'ipt>');
    }
},
"apply":function(dict,a,s) {
    try {
        if(!a) return;
        for(var i=(s || 0),l=a.length; i<l; i+=2) 
            dict[ a[i] ] = a[i+1]; 
    }catch(e){}
},
"cfm":function(r){
    if (!r || typeof r != 'object') return -1;
	
    var fm=r['fm'];
    if(fm) {
        var fv=fm[1];
        this.apply(this,fm[2]);
        fm=fm[0];
        if(fm>0 && !this.gfv(fv[0],fv[1],fv[2],fv[3]) ) return -1;
    } else {
        fm=0;
    }
    return fm;
},
"qryParse":function(q) {
    if(!q) {
        q = window.location.search;
    } else {
        q = q.substr(q.indexOf("?")+1);
    }
    var r={};
    if( q && q.charAt(0) == "?") {
        var splt = q.split("&");
        for(var i=0;i<splt.length;i++){
            splt[i] = (splt[i]).split("=");
            r[(splt[i][0]).toLowerCase()] = splt[i][1];
        }
    }
    return r;
},
"crEl":function(doc,def,parentEl) {
    // create a DOM element
    // def == ["tagname", ["attrib",value....]]
    var el=null,ud="undefined";
    if (typeof doc.createElementNS != ud)
        el=doc.createElementNS('http://www.w3.org/1999/xhtml',def[0]);
    else if (typeof doc.createElement != ud)
        el=doc.createElement(def[0]);

    if(!el) return false;

    for(var i=1; i<def.length; i++)
  	    el.setAttribute(def[i++], def[i]);

    if(parentEl) parentEl.appendChild(el);
    return el;
},
"write":function(rules) {
    var mode=this.cfm(rules);
    if(mode==-1) return;

    var tag=rules['default'];  // get tag base
    var src={};
    tag.dtm_cid=this.cid;
    var prot=this.prot;    

    // process the rules
    var r=rules.vars,qry,promo=null,doc=document,dataCnt=0,me=arguments.callee;
    var purl=doc.location.href,cook,refName;

    // make dtmdiv
    var id="dtmdiv",sty="display:none";
    var dv=this.crEl(doc,["div","id",id]);
    if(dv){
        if(mode==0) dv.style.cssText = sty;
        var dtjs=doc.getElementsByTagName("body")[0].firstChild;
        if(dtjs) dtjs.parentNode.insertBefore(dv,dtjs);
    } else {
        sty=(mode<2) ? 'style="'+sty+'"' : '';
        doc.write('<div ' + sty + ' id="' + id + '"></div>');
    }

    function isempty(v) { return (v==undefined || v==null || v=="");}

    for(var i=0,l=r.length; i<l; i++) {
	    var rule=r[i],ok=true;
	    var vname = rule[0],fc,qry,val,required;
	    fc=vname.charAt(0);
	    required=(rule[4]==1);
	    switch(fc){
        case '/':
            val=purl;
            break;
        case '?':
            // query/query string
            if( vname.length <= 1) break;

            if(!qry) qry = _DTMTAG.qryParse();
		    vname=vname.substr(1);
	        val = qry[vname];
            break;

        case '#':
            // DOM element
            if( vname.length <= 1) break;

		    vname=vname.substr(1);
	        val = doc.getElementById(vname);
            break;

        case '^':
            // referrer
            val=document.referrer;
            if(val && val != 'blockedReferrer') {
                if(vname=="^^") {
                    // referrer IFF from a different host than current page
                    if( val.indexOf( prot + "//" + window.location.hostname ) == 0 )
                        val=null;
                    else {
                        refName=rule[1];
                        rule[1]=null;
                    }
                }
            }
            else
                val=null;
            break;

        case ';':
            // cookies
            val=document.cookie;
            if(vname!=";;") {
                vname=vname.substr(1);
                if(!cook) cook = val.split(fc);
        	    var vn=vname+"=";

        	    for(var j=0,c,val=null;j < cook.length;j++) {
        		    c = cook[j];
        		    while(c.charAt(0)==' ') c = c.substring(1,c.length);
        		    if (c.indexOf(vn) == 0) {
                        val = c.substring(vn.length,c.length);
                        break;
                    }
                }
            }
            break;

        default:
	        var splt=vname.split(".");
            for(var j=0,val=window; j<splt.length; j++) {
                val=val[splt[j]];
            }
	    }
	    if (isempty(val) || val==window) {
	        if(required) return; else continue;
	    }

	    if( rule[2] ) {
		    // use RegExp to extract value from var
		    var extractRe = new RegExp( rule[2] );
		    val = extractRe.exec( val );
		    try {
		        for(j=1; j<val.length; j++) {
		            if( !isempty(val[j]) ) {
    			        val = val[j];
    			        break;
		            }
		        }
		    } catch(ex){
		    } finally {
	            if (isempty(val))
    		        if(required) return; else continue;
		    }
	    }

        function tst(e,v){
	        if(e && e!="") {
	            var r = new RegExp( e );
	            return r.test( v );
	        }
	        return true;
        }
        
	    // 3 test if the value is in an acceptable range
	    var testRe;
	    // 3 test for inclusion
	    if( rule[3] && rule[3]!="") {
	        testRe = new RegExp( rule[3] );
	        ok = testRe.test( val );
	    }
	    // test for exclusion
	    if(rule[5] && rule[5]!="") {
	        testRe = new RegExp( rule[5] );
	        if(testRe.test( val ))
	            return;
	    }

        if(!ok && required)
            return;
	        
	    // if name is mapped, keep the value
	    if( rule[1] ) {
		    tag[rule[1]] = val;
		    dataCnt+=1;
	    }

	    // does this variable determine promo_id?
	    var pmap = rules.promo[rule[1] || rule[0]];
	    if( pmap ) {
	        var tmp = val.split(" ").join("");
	        tag['cli_promo_id']=pmap[tmp];
	    }
		
	    this.apply(tag,rule[6] );
		
    }

    function until( a, h ) {
        for(var i=0,l=a.length;i<l;i++) if(h(a[i])) break;
    }

    // check url overrides
    until( rules.uris.include, function(r) {
        var re = new RegExp( r[0] );
        if( re.test( purl ) ) {
            _DTMTAG.apply(tag,r[1] ); 
            return 1;
        }
	    return 0;
    });

    until( rules.uris.exclude, function(r) {
        if( (new RegExp( r )).test( purl ) ) {
            dataCnt = 0;
            return 1;
        }
	    return 0;
    });

    this.apply( tag,rules[ tag["dtm_com"] ] );
	
    if(dataCnt>0 && tag["dtm_com"]>0 && tag['cli_promo_id']>0) {

        for(i=0,l=rules.expr.length; i<l; i++) {
            rule=rules.expr[i];
            vname = rule[0];
            switch(rule[1][0]) {
            case '+':
                for(var j=0,l2=rule[2].length,val="",cc=[]; j<l2; j++) {
                    if( this[ rule[2][j]] ) {
                       cc[cc.length]=this[rule[2][j]];
                    }
                }
                val=cc.join( rule[1][1] );
                tag[ vname ] = val;
                break;
            case "-":
               delete tag[rule[0]];
               break;
            default:
               break;
            }
        }
	    
	    // write the tag
        var to, baseUrl=prot+"//login.dotomi.com/ucm/UCMController?" //XX
        // build URL using custom field values
        for(var attr in tag){
            var itm=tag[attr];
            to=typeof itm;
            if(to!="function" && to!="object") baseUrl += attr + "=" + escape(itm) + "&";
        }

	    if(refName && document['referrer']) baseUrl += refName + "=" + escape(document.referrer) + "&";

        var oei;
        oei='<iframe src="' + baseUrl + '"></iframe>';

        this.sto( (rules["timeout"] ? rules["timeout"] : "3000") );
        this.ih(oei);   // embed the tag
    }
},
"ih":function(h){
    try{
        document.getElementById("dtmdiv").innerHTML=h;
    }catch(ex){}
}
};

function timeOutDotomi(){
    var h=_DTMTAG.hto;
    if(h) _DTMTAG.ih("");
}    

try {
    _DTMTAG.init(2161);
} catch(e) {
}
// END dtmtag.js
