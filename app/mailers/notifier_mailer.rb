class NotifierMailer < ApplicationMailer
    def alert_article(article) 
        @article = article
        mail(to: @article[:email], subject: "Mail regarding" )
    end
end
