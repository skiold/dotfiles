
# Mark by email list - requires the list sets the "List-Post:" header
if message.list_address != nil
  message.add_label "list"
end
{"linux-um" => "List-Id: <linux\.listas\.um\.es>",
 "lonely-coaches" => "<lonely-coaches-sodality.googlegroups.com>",
 "madrid-pm" => 'List-Id: Lista de correo de Madrid Perl Mongers <madrid-pm\.pm\.org>',
 "puppet-dev" => "List-ID: <puppet-dev\.googlegroups\.com>",
 "puppet-users" => "List-ID: <puppet-users\.googlegroups\.com>",
 "chef" => "List-Id: <chef\.lists\.opscode\.com>",
 "twisted-web" => "List-Id: Twisted Web World <twisted-web\.twistedmatrix\.com>",
 "twisted-python" => "List-Id: Twisted general discussion <twisted-python\.twistedmatrix\.com>",
 "babushka_app" => "List-ID: <babushka_app\.googlegroups\.com>",
 }.each_pair do |list_label, list_regex| 
  if message.raw_header =~ /#{list_regex}/i
    message.add_label "list"
    message.add_label "#{list_label}"  
    message.remove_label :inbox
    log "archiving #{message.id} as #{list_label}"
  end
end
