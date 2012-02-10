FSR.surveydefs = [{
    site: 'everest',
    name: 'purch',
    invite: {
        when: 'onentry'
    },
    pop: {
        when: 'now'
    },
    pin: 1,
    criteria: {
        sp: 8,
        lf: 0
    },
    include: {
        urls: ['/OrderShippingBillingConfirmationView']
    }
}, {
    site: 'everest',
    name: 'chk',
    invite: false,
    pop: {
        when: 'later',
        what: 'qualifier'
    },
    pin: 1,
    criteria: {
        sp: 26,
        lf: 0
    },
    links: {
        attach: [{
            tag: 'a',
            attribute: 'href',
            patterns: ['GuestAsAnonymous'],
            sp: 26,
            when: 'later'
        }]
    },
    include: {
        urls: ['/CheckoutSignInView']
    }
}, {
    site: 'everest',
    name: 'browse',
    invite: {
        when: 'onentry'
    },
    pop: {
        when: 'later'
    },
    criteria: {
        sp: 1,
        lf: 6
    },
    include: {
        urls: ['.']
    }
}];
FSR.properties = {
    repeatdays: 90,
    
    repeatoverride: false,
    
    altcookie: {},
    
    language: {
        locale: 'en'
    },
    
    exclude: {},
    
    ipexclude: 'fsr$ip',
    
    invite: {
        content: '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"><HTML><HEAD><TITLE>Foresee Invite</TITLE></HEAD><BODY>\
 				  <div id=\"fsrcontainer\">\
				  <div class=\"fsri_body\" style=\"!padding: 10px 15px 5px 20px;\">\
				  <table width="100%" border="0"><tr><td colspan="2">\
				  <div class=\"fsri_body2\">\
				  <span class="fsr_txthead">Hi, we\'d like your feedback.</span><br><br>\
				  <span class="fsr_txtbody">Thank you for visiting Target.com. You have been randomly selected to participate in a customer satisfaction survey to help us improve your overall experience on our site.<br><br></span>\
                                  <span class="fsr_txtbody2">The survey will measure your entire site experience and will appear at the end of your visit.<br><br></span>\
				  <span class="fsr_txtlink">This survey is conducted by an independent company, ForeSee Results.</span><span class="fsr_txtbody"></span>\
				  </td></tr><tr><td align=\"left\" valign=\"middle\" width = \"400px\"><a id=\"decline\" onclick=\"FSR.declined(\'en\')\" style=\"cursor: pointer\"><img src=\"{%baseHref%}fsrnothanks.gif\" alt=\"no thanks\"></a><a id=\"accept\" onclick=\"FSR.accepted(\'en\')\" style=\"cursor: pointer\"><img src=\"{%baseHref%}fsrcontinue.gif\" alt=\"continue\"></a></td></tr></table>\
				  </div></div></div></div></BODY></HTML>',
        exclude: {
            local: ['/CheckoutSignInView', '/OrderItemDisplay', '/CheckoutOrderItemDisplayView', '/GuestAsAnonymous', '/CheckoutOrderShippingView', '/SingleShipmentOrderSummaryView', '/CheckoutGiftOptionsView', '/CheckoutOrderBillingView', '/OrderShippingBillingConfirmationView', '/CheckoutEditItemsDisplayView', '/CalculateGiftWrap', '/CheckoutAddCardToWalletForm', '/OrderDisplay', '/OrderConfirmationPrintView', '/OrderReviewView', '/splitOrderItems', '/ESPDisplayOptionsViewCmd', '/ExitCheckoutCmd', 'authoring.target.com', 'cmc-wcsauth.target.com'],
            referer: ['google.com']
        },
        include: {
            local: ['.']
        },
        
        width: '470',
        bgcolor: '#333',
        opacity: 0.7,
        x: 'center',
        y: 'center',
        delay: 0,
        timeout: 0,
        buttons: false,
        hideOnClick: false,
        css: 'foresee-dhtml.css',
        hide: []
    },
    
    tracker: {
        width: '520',
        height: '420',
        timeout: 3,
        adjust: true,
        alert: {
            enabled: false,
            message: 'The survey is now available.'
        },
        url: 'tracker.html'
    },
    
    survey: {
        width: 550,
        height: 600
    },
    
    qualifier: {
        width: '625',
        height: '500',
        bgcolor: '#333',
        opacity: 0.7,
        x: 'center',
        y: 'center',
        delay: 0,
        buttons: {
            accept: 'Continue'
        },
        hideOnClick: false,
        css: false,
        url: 'qualifying.html'
    },
    
    cancel: {
        url: 'cancel.html',
        width: '500',
        height: '300'
    },
    
    pop: {
        what: 'survey',
        after: 'leaving-site',
        pu: false,
        tracker: true
    },
    
    meta: {
        referrer: true,
        terms: true,
        ref_url: true,
        url: true,
        url_params: false
    },
    
    events: {
        enabled: true,
        id: true,
        codes: {
            purchase: 800,
            items: 801,
            dollars: 802
        },
        pd: 7,
        custom: {}
    },
    
    pool: 100,
    
    previous: false,
    
    analytics: {
        google: false
    },
    
    mode: 'first-party',
    
    cpps: {
        visualScienceId: {
            source: 'cookie',
            name: 'v1st'
        }
    }

};
