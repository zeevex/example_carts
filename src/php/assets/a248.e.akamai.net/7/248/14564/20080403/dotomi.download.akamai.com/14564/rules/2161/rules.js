///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// rules.js
// Dotomi ReConnect Integration Rules
// (c) 2007 Dotomi, Inc.
// Ver 2.00
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(1) {
    try {
		_DTMTAG.write(
    		{ 
    		"default": {'dtm_com':28,'dtm_cmagic':'333ac5','dtm_fid':101,'dtm_format':5, 'cli_promo_id':1, 'dtmc_ver':6 },
			"timeout":2000, 
			"vars":
			  [    /* variable_name, mapped_name, ExtractionRegExp, ValidationRegExp, bRequired, ExcludeRegExp, ['name', val, ...] */
				["^",	"dtmc_ref",	null,	null ],
				["/",	"dtmc_loc",	null,	null ],
				
				["/",	"dtmc_transaction_id",	'ord=(\\d\\d\\d*)',	null ],
				["/",	"dtmc_order",	'type=(order940)',	null,	0,	null, ['dtm_com',29,'cli_promo_id',100,'dtm_fid',102] ],				
				["/",	null,	'type=(.*);',	null,	0, "(shopp950|place735)"],
				
				["/",	null,	'type=check127;cat=order814',	null,	0,	null, ['dtm_com',29,'cli_promo_id',100,'dtm_fid',102] ],	// Transaction
				["/",	null,	'type=regis468;cat=babyr931',	null,	0,	null,	['dtm_com',29,'cli_promo_id',202,'dtm_fid',102] ], 	// Baby Registry - Confirmation
				["/",	null,	'type=regis468;cat=weddi622',	null,	0,	null,	['dtm_com',29,'cli_promo_id',212,'dtm_fid',102] ], 	// Club Wedd Confirmation
				
				["/",	"dtmc_cat",	'cat=(targe185)',	null,	0,	null,	['cli_promo_id',200] ],
				["/",	"dtmc_cat",	'cat=(targe254)',	null,	0,	null,	['cli_promo_id',200] ],
				["/",	"dtmc_cat",	'cat=(targe346)',	null,	0,	null,	['dtm_com',29,'cli_promo_id',201] ],
				["/",	"dtmc_cat",	'cat=(targe181)',	null,	0,	null,	['dtm_com',29,'cli_promo_id',202,'dtm_fid',102] ],
				["/",	"dtmc_cat",	'cat=(clubw664)',	null,	0,	null,	['cli_promo_id',210] ],
				["/",	"dtmc_cat",	'cat=(clubw248)',	null,	0,	null,	['cli_promo_id',210] ],
				["/",	"dtmc_cat",	'cat=(clubw775)',	null,	0,	null,	['dtm_com',29,'cli_promo_id',212,'dtm_fid',102] ],
				["/",	"dtmc_cat",	'cat=(homep329)',	null,	0,	null,	['cli_promo_id',56] ],
				["/",	"dtmc_cat",	'cat=(daily231)',	null,	0,	null,	['cli_promo_id',420] ],
				["/",	"dtmc_cat",	'cat=(clear271)',	null,	0,	null,	['cli_promo_id',16] ],
				["/",	"dtmc_u1",	'u1=(\\d*)',	null,	0,	null,	['cli_promo_id',51]  ],
				["/",	"dtmc_u2",	'u2=(\\d*)',	null,	0,	null,	['cli_promo_id',54]  ],
				["/",	"dtmc_u3",	'u3=([^;]*)',	null,	0,	null,	['cli_promo_id',55]  ],
				["/",	"dtmc_u4",	'u4=([^;]*)',	null,	0,	null,	['cli_promo_id',57]  ],
				
				["/",	"dtmc_u5",	'u5=([^;]*)',	null], // Product ID
				["/",	"dtmc_u6",	'u6=([^;]*)',	null], // Search
				["/",	"dtmc_u7",	'u7=([^;]*)',	null], // Order Confirmation ID
				["/",	"dtmc_u8",	'u8=([^;]*)',	null], // Quantity
				["/",	"dtmc_u9",	'u9=([^;]*)',	null], // Price
				["/",	"dtmc_u10",	'u10=([^;]*)',	null], // SubTotal
				["/",	"dtmc_u11",	'u11=([^;]*)',	null], // Total
								
				["/",	"dtmc_u12",	'u12=([^;]*)',	null ],
				["/",	"dtmc_u13",	'u13=([^;]*)',	null ],
				["/",	"dtmc_u14",	'u14=(\\d*)',	null,	0,	null,	['cli_promo_id',52]  ],
				["/",	"dtmc_u15",	'u15=(\\d*)',	null,	0,	null,	['cli_promo_id',53]  ],
				["/",	"dtmc_u16",	'u16=([^;]*)',	null ],
				["/",	"dtmc_u17", 'u17=([\\d\\.]*)', null ],
				["/",	"dtmc_u18",	'u18=([\\d\\.]*)',	null ]
			  ],
		      "uris": 
			{
				"include": [ ],
				"exclude": [ ]
			},
			 "expr": [ ],
			 "promo": []
			}
        );
    } catch(ex) {
    }
}
// end rules.js  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
