{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Usuario where

import Import
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql

-- renderDivs
formUsu :: Form (Usuario, Text)
formUsu = renderBootstrap $ (,)
    <$> (Usuario 
        <$> areq textField "Nome: " Nothing
        <*> areq emailField "E-mail: " Nothing
        <*> areq passwordField "Senha: " Nothing)
    <*> areq passwordField "Digite Novamente: " Nothing

getUsuarioR :: Handler Html
getUsuarioR = do 
    (widget,_) <- generateFormPost formUsu
    defaultLayout $
        msg <- getMessage
        [whamlet|
            
            <nav class="navbar justify-content-end fixed-top">    
              <ul>
                <li>
                  <a href=@{HomeR}>Home
                <li>
                  <a href=@{FotosR}>Fotos
                <li>
                  <a href=@{PromocoesR}>Promoções
                <li>
                  <a href=@{ServicosR}>Serviços
                <li>
                  <a href=@{DicasR}>Blog
                <li>
                  <a href=@{OrcamentosR}>Contatos
                <li>
                    <a href=@{EntrarR}Login
                <li>
                    <a href=@{ListOrcamentosR}>OrcamentosR
               
            $maybe mensa <- msg 

                <div>
                    ^{mensa}
            
            <h1>
                CADASTRO DE USUARIO
            
            <form method=post action=@{UsuarioR}>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postUsuarioR :: Handler Html
postUsuarioR = do 
    ((result,_),_) <- runFormPost formUsu
    case result of 
        FormSuccess (usuario,veri) -> do 
            if (usuarioSenha usuario == veri) then do 
                runDB $ insert usuario 
                setMessage [shamlet|
                    <div>
                        USUARIO INCLUIDO
                |]
                redirect UsuarioR
            else do 
                setMessage [shamlet|
                    <div>
                        SENHA E VERIFICACAO N CONFEREM
                |]
                redirect UsuarioR
        _ -> redirect HomeR
