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
            
            * {
            margin:0px;
            padding: 0px;
            }

            body {
                background-image: url(@{StaticR foto_jpg});
                background-repeat: no-repeat;
                background-size: 100%;
                background-attachment: fixed;
            }

            nav{position: fixed;
                top: 0%;
            }
            
           ul{  background-color:rgba(0,0,0, 0.7);
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
                padding: 0px;
                transition-duration:0.5s, 0.3s;
                cursor: pointer;
            }

            li a:hover{
                width: 210px;
                background-color: grey;
                color:white;
                font-size: 20px;
                padding: 20px;
                text-decoration: none;
            }
            .a {
                background:rgba(0,0,0, 0.5);
                background-size: 100%;
                height: 800px;
                margin-top: -60px;
            }

            .aa {
                padding-top: 400px;
                padding-left: 100px;
                height: 100px;
                background-color: rgba(0,0,0, 0.0);
            }

            h1{
                color: rgb(192, 159, 75);
                font-size:  40px;}    
                h2{color: white;
                font-size: 30px;
            }

            p{
                color:black;
                font-family: Helvetica, sans-serif;
                font-size:25px;
                margin: 20px 200px 0px 200px;
            }

            .b {
                background-color: silver;
                height: 600px;
                padding-top: 10%;
                text-align: center;
            }

            .c {
            background-color:rgba(0,0,0, 0.5);
            height: 600px;
            padding-top: 10%;
            text-align: center;
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
        <div class="a">
            <div class="aa">
                <h1>SMILES FESTAS
                <h2>Casamentos, Debutantes, Aniversários e muito mais    
                
        <div class="b">
            <h1>SMILES FESTAS
            <p>A empresa Smiles é um grupo dedicado a auxiliar no planejamento, execução e finalização de eventos
            <p>Aqui tratamos cada evento de forma única e original. Nos esforçamos para criar um ambiente atrativo e agradável para os seus convidados.
        
        <div class="c">
            <h1>Orcamento
            <form>
            <input type="text"  placeholder="Nome:"> <br>
            <input type="text"  placeholder="Email:"><br>
            <input type="text"  placeholder="Telefone:"><br>
            <textarea rows="4" cols="50" name="comment" form="usrform">
            Digite sua Mensagem...
            <br>
            <button class="btn btn-dark" onclick="ola()">
                Solicitar Orçamento
        |]
