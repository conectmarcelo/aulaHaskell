{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Orcamentos where

import Import
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Text.Lucius
import Text.Julius

-- renderDivs
formOrcamentos :: Form Orcamentos 
formOrcamentos = renderBootstrap $ Orcamentos 
    <$> areq textField "Nome:" Nothing
    <*> areq textField "Email:" Nothing
    <*> areq textField "Telefone:" Nothing
    <*> areq textField "Mensagem:" Nothing

getOrcamentosR :: Handler Html
getOrcamentosR = do 
    (widget,enctype) <- generateFormPost formOrcamentos 
    defaultLayout $ do 
        msg <- getMessage
        [whamlet|
            
            <nav class="navbar justify-content-end navbar-fixed-top">    
              <ul>
                <nav class="navbar justify-content-end fixed-top">    
                    <ul>
                        <li>
                            <a href=@{HomeR}>Smiles Festas
                        <li>
                            <a href=@{FotosR}>Fotos
                        <li>
                            <a href=@{PromocoesR}>Promoções
                        <li>
                            <a href=@{ServicosR}>Serviços
                        <li>
                            <a href=@{DicasR}>Dicas
                        <li>
                            <a href=@{ContatosR}>Contatos    

            $maybe mensa <- msg
                <div>
                    ^{mensa}
            
            <h1>
                Solicite Um orçamento
                
            <form method=post action=@{OrcamentosR}>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postOrcamentosR :: Handler Html
postOrcamentosR = do 
    ((result,_),_) <- runFormPost formOrcamentos
    case result of 
        FormSuccess orcamentos -> do 
            runDB $ insert orcamentos
            setMessage [shamlet|
                <h2>
                    orcamento INSERIDO COM SUCESSO
            |]
            redirect OrcamentosR
        _ -> redirect HomeR

getListOrcamentosR :: Handler Html 
getListOrcamentosR = do 
    -- select * from Orcamentos order by orcamentos.nome
    orcamentos <- runDB $ selectList [] [Asc OrcamentosNome]
    defaultLayout $ do 
        $(whamletFile "templates/listarOrcamentos.hamlet")

postApagarOrcamentosR :: OrcamentosId -> Handler Html
postApagarOrcamentosR pid = do 
    _ <- runDB $ get404 pid
    runDB $ delete pid
    redirect ListOrcamentosR