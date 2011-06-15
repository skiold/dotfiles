
# Mark by email list - requires the list sets the "List-Post:" header
if message.list_address != nil
  message.add_label "list"
end
{"list" => "List-ID: ",
}.each_pair do |list_label, list_regex| 
  if message.raw_header =~ /#{list_regex}/i
    message.add_label "list"
    message.add_label "#{list_label}"  
    message.remove_label :inbox
    log "archiving #{message.id} as #{list_label}"
  end
end
