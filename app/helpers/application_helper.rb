module ApplicationHelper
    def locale(locale)
        I18n.locale == :en ? "inglês" : "português"
    end
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end
end
