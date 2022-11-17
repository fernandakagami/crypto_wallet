namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?         
      puts  %x(rails db:drop:_unsafe db:create db:migrate dev:add_coins dev:add_mining_types)      
    else
      puts "Você não está em ambiente de desenvolvimento."
    end
  end

  desc "Cadastro das moedas"
  task add_coins: :environment do
    coins = [
      {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"
      },    
      {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpr0Lw2Km6vMV7WX2kr4kXttvh4Rgd2RXkZQ&usqp=CAU"
      },
      {   
          description: "Dash",
          acronym: "DASH",
          url_image: "https://media.dash.org/wp-content/uploads/dash-d.png"
      }
    ]

    coins.each do |coin|
       Coin.find_or_create_by!(coin)
    end
  end

  desc "Cadastro dos tipos de mineração"
  task add_mining_types: :environment do
    mining_types = [
      {name: "Proof of Work", acronym: "PoW"},
      {name: "Proof of Stake", acronym: "PoS"},
      {name: "Proof of Capacity", acronym: "PoC"}
    ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
   end
  end

end
