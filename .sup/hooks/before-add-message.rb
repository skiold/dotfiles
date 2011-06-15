
# Mark by email list - requires the list sets the "List-Post:" header
if message.list_address != nil
  message.add_label "list"
end
{"agile-spain" => "List-ID: <agile-spain.googlegroups.com>",
 "curvecp" => "Mailing-List: contact curvecp-help@list.cr.yp.to; run by ezmlm",
 "exherbo-dev" => "List-Id: <exherbo-dev.lists.exherbo.org>",
 "linux-um" => "List-Id: <linux\.listas\.um\.es>",
 "lonely-coaches" => "<lonely-coaches-sodality.googlegroups.com>",
 "madrid-pm" => 'List-Id: Lista de correo de Madrid Perl Mongers <madrid-pm\.pm\.org>',
 "madrid-devops" => "List-ID: <madrid-devops\.googlegroups\.com>",
 "mcollective-users" => "List-ID: <mcollective-users.googlegroups.com>",
 "peertransfer" => "Delivered-To: peertransfer@ageda.net",
 "puppet-dev" => "List-ID: <puppet-dev\.googlegroups\.com>",
 "puppet-users" => "List-ID: <puppet-users\.googlegroups\.com>",
 "chef" => "List-Id: <chef\.lists\.opscode\.com>",
 "spain-hadoop-users" => "List-ID: <spain-scalability-users\.googlegroups\.com>",
 "twisted-web" => "List-Id: Twisted Web World <twisted-web\.twistedmatrix\.com>",
 "twisted-python" => "List-Id: Twisted general discussion <twisted-python\.twistedmatrix\.com>",
 "babushka_app" => "List-ID: <babushka_app\.googlegroups\.com>",
 "soag" => "List-ID: <spain-openstack-user-group\.googlegroups\.com>",
 "bufferbloat" => "<bloat-devel\.lists\.bufferbloat\.net>",
 }.each_pair do |list_label, list_regex| 
  if message.raw_header =~ /#{list_regex}/i
    message.add_label "list"
    message.add_label "#{list_label}"  
    message.remove_label :inbox
    log "archiving #{message.id} as #{list_label}"
  end
end
