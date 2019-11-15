{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Login where

import Import
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql

-- renderDivs
formLogin :: Form (Text, Text)
formLogin = renderBootstrap $ (,)
    <$> areq emailField "E-mail: " Nothing
    <*> areq passwordField "Senha: " Nothing

getEntrarR :: Handler Html
getEntrarR = do 
    (widget,_) <- generateFormPost formLogin
    msg <- getMessage
    defaultLayout $ 
        [whamlet|
            $maybe mensa <- msg 
                <div>
                    ^{mensa}
            
            
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

           <div class="container justify-content-center"> 
                <h1>
                    ENTRAR
                
                <form method=post action=@{EntrarR}>
                    ^{widget}
                    <input type="submit" value="Entrar">
        |]

postEntrarR :: Handler Html
postEntrarR = do 
    ((result,_),_) <- runFormPost formLogin
    case result of 
        FormSuccess ("root@root.com","root125") -> do 
            setSession "_NOME" "admin"
            redirect UsuarioR
        FormSuccess (email,senha) -> do 
           -- select * from usuario where email=digitado.email
           usuario <- runDB $ getBy (UniqueEmailRest email)
           case usuario of 
                Nothing -> do 
                    setMessage [shamlet|
                        <div>
                            E-mail Não ENCONTRADO!
                    |]
                    redirect EntrarR
                Just (Entity _ usu) -> do 
                    if (usuarioSenha usu == senha) then do
                        setSession "_NOME" (usuarioNome usu)
                        redirect HomeR
                    else do 
                        setMessage [shamlet|
                            <div>
                                Senha INCORRETA!
                        |]
                        redirect EntrarR 
        _ -> redirect HomeR

postSairR :: Handler Html 
postSairR = do 
    deleteSession "_NOME"
    redirect HomeR


