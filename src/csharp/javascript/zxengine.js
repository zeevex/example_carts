/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function ZXForm() {
    this.cmd ="";
    this.business ="";
    this.invoice = "";
    this.item_name = "";
    this.item_number = "";
    this.amount = 0;
    this.quantity = 1;
    this.currency_code ="ZXT";
    this.rm = 0;

    this.notify_url = "";
    this.iframe=1;


    this.params = new Object();



/*   <input id="cmd" name="cmd" type="hidden" value="_xclick" />
  <input id="iframe" name="iframe" type="hidden" value="1" />
  <input id="business" name="business" type="hidden" value="admin@zeevex.com" />
  <input id="invoice" name="invoice" type="hidden" value="20100521-062949" />
  <input id="item_name" name="item_name" type="hidden" value="Leather Purse" />
  <input id="item_number" name="item_number" type="hidden" value="itemsku23591" />
  <input id="amount" name="amount" type="hidden" value="305" />
  <input id="quantity" name="quantity" type="hidden" value="1" />
  <input id="currency_code" name="currency_code" type="hidden" value="ZXT" />
  <input id="rm" name="rm" type="hidden" value="0" /> */


    this.submit = function() {
        alert("test 2 "+this.cmd);

    }
    
}