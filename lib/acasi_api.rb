module Acasi
  attr_accessor :api_url
  attr_accessor :api_key

  class WhoIs
    def self.awesome?
      puts "ACASI IS AWESOME V 0.0.5!!"
    end
  end

  class ItemCategories
    def self.all
      JSON.parse(RestClient::Request.execute(
      method: :get,
      url: "#{Acasi.api_url}/item_categories",
      headers: {params: {api_token: Acasi.api_key}}
      ).body)
    end
  end

  class BankTransactions
    def self.default_category(bank_transaction_id)
      JSON.parse(RestClient::Request.execute(
      method: :get,
      url: "#{Acasi.api_url}/bank_transactions/default_category",
      headers: {params: {api_token: Acasi.api_key, bank_transaction_id: bank_transaction_id}}
      ).body)
    end
  end

  class PurchaseInvoices
    def self.default_category(purchase_invoice_id)
      JSON.parse(RestClient::Request.execute(
      method: :get,
      url: "#{Acasi.api_url}/purchase_invoices/default_category",
      headers: {params: {api_token: Acasi.api_key, purchase_invoice_id: purchase_invoice_id}}
      ).body)
    end
  end

  class Users
    def self.bank_account_balance(user_id)
      JSON.parse(RestClient::Request.execute(
      method: :get,
      url: "#{Acasi.api_url}/users/bank_account_balance",
      headers: {params: {api_token: Acasi.api_key, user_id: user_id}}
      ).body)["openstruct"]["balance"]
    end
  end

end

