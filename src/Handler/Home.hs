{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import
import Text.Lucius
import Text.Julius
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql

getPage2R :: Handler Html 
getPage2R = do 
    defaultLayout $ do 
        $(whamletFile "templates/page2.hamlet")

getPage1R :: Handler Html 
getPage1R = do 
    defaultLayout $ do 
        addStylesheet (StaticR css_bootstrap_css)
        toWidgetHead $(juliusFile "templates/page1.julius")
        toWidgetHead $(luciusFile "templates/page1.lucius")
        $(whamletFile "templates/page1.hamlet")

getHomeR :: Handler Html
getHomeR = do 
    defaultLayout $ do 
        -- remoto
        addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
        -- esta no projeto
        addStylesheet (StaticR css_bootstrap_css)
        toWidgetHead [julius|
            function ola(){
                alert("OLA MUNDO");
            }
        |]

        toWidgetHead [lucius|
            h1 {
                color : red;
            }
            
            body {
                background-image: url(@{StaticR foto_jpg});
                background-repeat: no-repeat;
                background-size: 100%;
                background-attachment: fixed;
            }

            nav{
                background-attachment: fixed;
            }

            ul{
                background-color:rgba(0,0,0, 0.7);
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
                padding: 20px;
            }
        |]
        [whamlet|
            
        <nav>
            <ul>
                <li>
                    <a href=@{Page1R}>Smiles Festas
                <li>
                    <a href=@{Page1R}>Promoções
                <li>
                    <a href=@{Page1R}>Serviços
                <li>
                    <a href=@{Page1R}>Contatos
        
        <div>
            <h1>
                OLA MUNDO
            
            <ul>
                <li>
                    <a href=@{Page1R}>
                        Pagina 1
                
                <li>
                    <a href=@{Page2R}>
                        Pagina 2
            
            
            
            <button class="btn btn-danger" onclick="ola()">
                OK
        |]
