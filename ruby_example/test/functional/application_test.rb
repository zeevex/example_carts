require File.join(File.dirname(__FILE__), "..", "test_helper")

class ApplicationControllerTest < ActionController::TestCase

  def test_index_render
          
          get :index
          assert_response :success
          assert_select 'form#main_form'
 
          assert_select 'fieldset#read_only'
          assert_select 'legend', 'Read-Only'
          assert_select 'label[for=rm]'
          assert_select 'input#rm[value=0][readonly]'
          assert_select 'label[for=cmd]'
          assert_select 'input#cmd[value=_xclick][readonly]'
          assert_select 'label[for=currency_code]'
          assert_select 'input#currency_code[value=USD][readonly]'
          assert_select 'label[for=payment_option]'
          assert_select 'input#payment_option[value=sale][readonly]'

          assert_select 'fieldset#personal_info'
          assert_select 'legend', 'Personal Info'
          assert_select 'label[for=custom]'
          assert_select 'input#custom'

          assert_select 'fieldset#api_info'
          assert_select 'legend', 'API Info'
          assert_select 'label[for=business]'
          assert_select 'input#business'
          assert_select 'label[for=amount]'
          assert_select 'input#amount'
          assert_select 'label[for=invoice]'
          assert_select 'input#invoice'
          assert_select 'label[for=item_name]'
          assert_select 'input#item_name'
          assert_select 'label[for=lc]'
          assert_select 'input#lc'
          assert_select 'label[for=no_note]'
          assert_select 'input#no_note'
          assert_select 'label[for=cancel_return]'
          assert_select 'input#cancel_return'
          assert_select 'label[for=notify_url]'
          assert_select 'input#notify_url'
          assert_select 'label[for=return]'
          assert_select 'input#return'

          assert_select 'input[type=submit][value=Purchase]'
  end


    def test_cancel_callback
        get :cancel_callback
        assert_response :success
        assert_template 'cancel_callback'
    end

    def test_receipt_callback
        get :receipt_callback
        assert_response :success
        assert_template 'receipt_callback'
    end

end
