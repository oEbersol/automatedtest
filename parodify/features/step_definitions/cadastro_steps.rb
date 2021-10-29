Dado('que acesso a página de cadastro') do
    visit "https://automacaocombatista.herokuapp.com/users/new"
   
end
  
Quando('submeto o meu cadastro com:') do |table|
    user = table.rows_hash
    find("input[id=user_name]").set user[:nome]
    find("input[id=user_lastname]").set user[:ultimo_nome]
    find("input[id=user_email]").set user[:email]
    find("input[id=user_address]").set user[:endereco]
    find("input[id=user_university]").set user[:universidade]
    find("input[id=user_profile]").set user[:profissao]
    find("input[id=user_gender]").set user[:genero]
    find("input[id=user_age]").set user[:idade]

    click_on "Criar"

    sleep 5

end
  
Então('devo ser redirecionado para a área logada') do
    expect(page). to have_css 'p[class="light-green accent-2"]'
end


Quando('submeto o meu cadastro sem o email') do 
    find("input[id=user_name]").set "Dollynete"
    find("input[id=user_lastname]").set "Orelha"
    find("input[id=user_address]").set "Rua Borgussa tentaro"
    find("input[id=user_university]").set "EDHA"
    find("input[id=user_profile]").set "Agióta"
    find("input[id=user_gender]").set "Molier"
    find("input[id=user_age]").set "122"

    click_on "Criar"
    sleep 5

end
  
Então('devo ver Oops! Informe seu email') do
    expect(page). to have_css 'p[class="light-green accent-2"]'
end