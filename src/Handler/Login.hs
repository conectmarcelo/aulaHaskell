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
    defaultLayout $ do
        toWidgetHead [lucius|
            
        * {
        margin:0px;
        padding: 0px;
        }
        
        nav{
        background-color:rgba(0,0,0, 0.9)
        }

        ul{  
            padding: 20px;
            text-align: end;
        }
        
        li {
            list-style: none;
            display: inline;
            margin-left: 20px;
        }
        
        li a{
            text-decoration: none;
            color:white;
            font-family: Helvetica;
            font-size: 20px;
            padding: 20px;
            transition-duration:0.5s, 0.3s;
            cursor: pointer;
        }
        
        li a:hover{
            width: 210px;
            background-color: grey;
            color:white;
            font-size: 20px;
            padding: 25px;
            text-decoration: none;
        }
        
        .mapa {
            background-image: url(@{StaticR mapa_jpg});
            background-repeat: no-repeat;
            background-size: 100%;
            
            
            
        }
         
         .contato {
                    background-color:lightgrey;
                    Text-align: center;
                    margin-top:50px;
                    }
        .button{
                background-color:black;
                color:white
        }
        
        h1{color:rgb(192, 159, 75);
        }
        
        .form{background-color:#e9e9e9;
        padding:0px;       
        
            
        }            
     
        input[type=email], select {
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid #ccc;
          border-radius: 4px;
          box-sizing: border-box;
        }
        
         input[type=password], select {
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid #ccc;
          border-radius: 4px;
          box-sizing: border-box;
        }
        
        
        input[type=submit] {
          width: 100%;
          background-color: black;
          color: white;
          padding: 14px 20px;
          margin: 8px 0;
          border: none;
          border-radius: 4px;
          cursor: pointer;
        }
        
        input[type=submit]:hover {
          background-color: grey;
        }
        
        div {
          border-radius: 5px;
        
        }
        
        .form {padding:100px 200px 50px 200px;
                margin:50px;
        }
        
        footer{background-color:black;
            text-align:center;
            padding:20px;}
        img {width:50px; height:50px;}
        
        .rodape{text-align:center}
        
                    
        |]    
        
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

            <div class="form"> 
                <h1>
                    ENTRAR
                
                <form method=post action=@{EntrarR}>
                    ^{widget}
                    <input type="submit" value="Entrar">
                    $maybe mensa <- msg 
                        <div>
                            ^{mensa}
        |]

postEntrarR :: Handler Html
postEntrarR = do 
    ((result,_),_) <- runFormPost formLogin
    case result of 
        FormSuccess ("root@root.com","root125") -> do 
            setSession "_NOME" "admin"
            redirect AdminR
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

getAdminR :: Handler Html
getAdminR = do 
    defaultLayout $ do
        toWidgetHead [lucius|
            
        * {
        margin:0px;
        padding: 0px;
        }
        
        nav{
        background-color:rgba(0,0,0, 0.9)
        }

        ul{  
            padding: 20px;
            text-align: end;
        }
        
        li {
            list-style: none;
            display: inline;
            margin-left: 20px;
        }
        
        li a{
            text-decoration: none;
            color:white;
            font-family: Helvetica;
            font-size: 20px;
            padding: 20px;
            transition-duration:0.5s, 0.3s;
            cursor: pointer;
        }
        
        li a:hover{
            width: 210px;
            background-color: grey;
            color:white;
            font-size: 20px;
            padding: 25px;
            text-decoration: none;
        }
        
                    
        |]
        
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
                    <a href=@{ContatosR}>Contatos
                <li>
                    <a href=@{UsuarioR}>Cadastrar
                <li>
                    <a href=@{EntrarR}>LoginN
                

        <div class="container">
            <h1>
                BEM-VINDO A ÁREA ADMINISTRATIVA!
        |]
