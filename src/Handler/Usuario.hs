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
    msg <- getMessage
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
        
        input[type=text], select {
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
        
       
        
        [whamlet|
        
        <nav class="navbar justify-content-end fixed-top">    
          <ul>
                <li>
                    <a href=@{HomeR}>Home
                <li>
                    <a href=@{ListOrcamentosR}>Orçamentos
                <li>
                    <a href=@{UsuarioR}>Cadastrar Usuário
                <li>
                    <a href=@{ListUsuarioR}>Gerênciar Usuários
                <li>
                    <a href=@{EntrarR}>Login
                <li>
                    <a href=@{SairR}>Logout

        <div class="form"> 
            <h1>
                CADASTRO DE USUARIO
            
            <form method=post action=@{UsuarioR}>
                ^{widget}
                <input type="submit" value="Cadastrar">
                $maybe mensa <- msg 
                    <div>
                        ^{mensa}
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
                        USUÁRIO INCLUIDO
                |]
                redirect UsuarioR
            else do 
                setMessage [shamlet|
                    <div>
                        SENHA E VERIFICAÇÃO NÃO CONFEREM
                |]
                redirect UsuarioR
        _ -> redirect HomeR


getListUsuarioR :: Handler Html 
getListUsuarioR = do 
    -- select * from Usuario order by usuario.nome
    usuario <- runDB $ selectList [] [Asc UsuarioNome]
    defaultLayout $ do 
        addStylesheet (StaticR css_bootstrap_css)
        $(whamletFile "templates/listarUsuario.hamlet")

        
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
        
        
        footer{background-color:black;
            text-align:center;
            padding:20px;}
        img {width:50px; height:50px;}
        
        .rodape{text-align:center}
        
                    
        |]

postApagarUsuarioR :: UsuarioId -> Handler Html
postApagarUsuarioR pid = do 
    _ <- runDB $ get404 pid
    runDB $ delete pid
    redirect ListUsuarioR
