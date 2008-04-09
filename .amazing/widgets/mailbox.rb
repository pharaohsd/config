# Coming from Slackware I'm used to a mailx
# with some more functionality... in Arch
# it can be found in AUR as mailx-heirloom
#
# Written by anrxc@sysphere.org
#
# config.yml
#   mail:
#       type: Mailbox
#       every: 40
#       format: '"text #{@subject}"'

class Mailbox < Widget
  description "Displays subject of latest email in a mbox file"
  option :mbox, "Mailbox to read", "/home/anrxc/mail/Inbox"
  field :subject, "Subject line of last email"
  default { @subject }

  init do
    IO.popen("mail -H -f #@mbox | tail -n 1 | cut -d'/' -f2", IO::RDONLY) do |am| 
      @subject = am.read
    end
  end
end
