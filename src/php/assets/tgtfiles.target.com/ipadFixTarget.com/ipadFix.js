/*
@Ipad sprite Fix V 2.1
@Date :13-12-2011
*/
var isPad = navigator.userAgent.match(/iPad/i) != null;
if(isPad){
	var DOMstr = ".button, .quickInfo, .footerlogo, #LogoWrapper, .icon-sprite, .rating-large, .rating-small, .rating-xsmall, .overlay #close, span.Swatch, .swatches li, div.Swatch, form .error-summary, .rating-small.grey, #rvCore .viewedopen, form p.error-message, #chekoutLogoWrapper, #rvCore .viewedclose, #Carousel .prevFrame, #Carousel .nextFrame, .pagination2 .next a, #Header form#Search fieldset, .ProductComparison .show, .ProductComparison .hide, #media-player .prevFrame, #media-player .nextFrame, #Main #savedForLaterBox a, #cartContent .box-grey h3,  .pagination2 .previous a, .tooltipBox .tooltipPointer, .tile .compareContainer label, #Main ul.pagination1 li.next a, ul.pagination1 li.nextDisabled, .pagination2 .nextDisabled, .ProductComparison .backLink, .tipnoteTrigger.tipType-info, #dimension_rating .rating-reset, #Main ul.pagination1 li.previous a, #Main ul.pagination1 li.previous a, #mini-cart .items-set .prevFrame, #mini-cart .items-set .nextFrame, .checkout.review #section-head p, .checkout.review #section-head li, .pagination2 .previousDisabled, ul.pagination1 li.previousDisabled, #Header form#Search #searchMagnify, #Header #ShopMenu #mini-cart-icon, #Header ul#MainMenu > li.home-link a, #Header #globalPromise a.gotoOffer, #specifications div.mediaupload_error, .leftNav #dimensions fieldset legend .show, .leftNav #dimensions fieldset legend .hide, #media-player .carousel-pagination li a, #Header form#Search a#SearchCategories, #defaultLinks div.rightMenu > div#redcard, #RecentViewItems .items-set .prevFrame, #RecentViewItems .items-set .nextFrame, .button .buttonHoverFrame .hoverPointer, .modalWindow .tipnoteTrigger.tipType-info, #ProductDetailsTop .more .views .prevFrame, #ProductDetailsTop .more .views .nextFrame, #Header form#Search a#SearchCategories.selected, .tooltipContainer .buttonHoverFrame .hoverPointer, #community-participation .media-content .prevFrame, #community-participation .media-content .nextFrame, #Main .enhanced.ratings-form-wrapper .ratings-form, .overlay .enhanced.ratings-form-wrapper .ratings-form, #community-participation .media-content .carousel-pagination li a, #ProductDetails #specifications .tabs-section #track-listing .control a, .product-details.print #ProductDetailsSpecification #track-listing .control a, #Main .cartItemsBox.cartSection-saved.sectionState-expanded #savedForLaterBox a, #ProductDetails #specifications .tabs-section #MusicPlayList .playlist li .playBtn, .pagination2 .next a:hover, .pagination2 .next a:focus, .pagination2 .next a:active, .pagination2 .previous a:hover, .pagination2 .previous a:focus, .pagination2 .previous a:active, #Main ul.pagination1 li.next a:hover, #Main ul.pagination1 li.next a:focus, #Main ul.pagination1 li.next a:active, #Main ul.pagination1 li.previous a:hover, #Main ul.pagination1 li.previous a:focus, #Main ul.pagination1 li.previous a:active, #ProductDetailsTop .more .views .carousel-pagination li a, #InspirationalCollection #collection-intro a, #Main #registry-search-results h2.registry-giftgiver.no-items-guest-view, #registry-search-results #paginantion-secondary ul.pagination-controls li.previousDisabled, #registry-search-results #paginantion-secondary ul li.next a, .checklist .checklist-items .categoryTotal, .checklist .checklist-items .categoryTotal.noItems, #HelpMainNonForm .helpContent .backToTop a, .checkout.shipping #address-choices .address #selected-address, #hero-image-container a.nextFrame, #hero-image-container a.prevFrame, #hero-image-container a.prevFrame.disabled, #hero-image-container a.nextFrame.disabled, #hero-image-container .carousel-pagination li a, #hero-image-container .carousel-pagination li a.selected, .account-created #account-created h2, .ProductComparison .remove, .fiatsImg, #community-participation .review-info .review-media li, #community-participation .pro-con-title.pro, #community-participation .pro-con-title.con, #community-participation .review-info .review-media .video-play-icon, #community-participation .review-info .review-media li a:hover .video-play-icon, #community-participation .review-info .review-media li a:focus .video-play-icon, #community-participation .review-info .review-media li a:active .video-play-icon, .green-check-greymed";
	
	var sprites1 = 2000;
	var sprites2 = 2000+1340;
	var sprites3 = 2000+1340+2152;
	var sprites4 = 2000+1340+1008;
	
	$(function(){
		ipadDelayImg();
		$("head").append('<link href="//tgtfiles.target.com/ipadFixTarget.com/ipadFix.css" rel="stylesheet" type="text/css"/>');		
	});
}

function ipadDelayImg(){
	$(DOMstr).each(function(){
	var bgYPos = $(this).css("background-position").split(" ")[1].replace("px","")*-1;
	var bgXPos = ($(this).css("background-position").split(" ")[0].indexOf("px")>0)?$(this).css("background-position").split(" ")[0].replace("px","")+"px":$(this).css("background-position").split(" ")[0];
	var gridY = 0;
	var gridID;
	if(bgYPos < sprites1){
		gridY = 0;
		gridID = "sprites1";
	}else if(bgYPos < sprites2){
		gridY = sprites1;
		gridID = "sprites2";
	}else if(bgYPos < sprites3){
		gridY = sprites2;
		gridID = "sprites3";
	}else{
		gridY = sprites3;
		gridID = "sprites4";
	}
	gridY = gridY - bgYPos;	
	var styleStr = 'background:url(//tgtfiles.target.com/ipadFixTarget.com/'+gridID+'.png) '+bgXPos+' '+gridY+'px no-repeat;'
		if(($(this).attr("src") =="" || $(this).attr("src")==null) || ($(this).attr("style")=="" || $(this).attr("style")==null)){
			$(this).attr("style",styleStr);
		}
	});
}