require "granite/adapter/sqlite"
   
class Message < Granite::Base
  connection sqlstore
  table messages

  column id : Int64, primary: true
  column protocol : String
  column sender : String
  column body : String?
  column sent_at : Time?
  column received_at : Time
  end