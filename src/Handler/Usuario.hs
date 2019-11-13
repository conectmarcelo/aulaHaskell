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

formUsu :: Form (Usuario< Text)
formUsu = rederBootstrap $ (,)
-- ou  formUsu = rederDivs
    <$> (Usuario 
        <$> areq textField "Nome: " Nothing
        <*> areq emailField "E-mail: " Nothing
        <*> areq passwordField "Senha: " Nothing)
    <*> areq passwordField "Digite Novamente: " Nothing


getUsuarioR :: Handler Html
getUsuarioR = do
    (widget,_) <- generateFormPost formUsu
    msg <- getMessage
    defaulLayout $
        [whamlet|
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
    ((result,_),) <- runFormPost formUsu
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
                    setMessage[shamlet|
                        <div>
                            SENHA E VERIFICACAO NAO CONFEREM
                    
                    |]
                    redirec UsuarioR
            -> redirect HomeR

