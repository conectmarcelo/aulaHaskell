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
        addStylesheet (StaticR css_bootstrap_css)
        toWidgetHead $(luciusFile "templates/page2.lucius")
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
        addStylesheetRemote "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"
        addScriptRemote "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        addScriptRemote "https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"
  
        
        
        -- esta no projeto
        addStylesheet (StaticR css_bootstrap_css)
        toWidgetHead [julius|
            function ola(){
                alert("OLA MUNDO teste");
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

            nav{
                background-color:rgba(0,0,0, 0.7)
               
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
            .a {
                background:rgba(0,0,0, 0.5);
                background-size: 100%;
                height: 800px;
                margin-top: -60px;
            }

            .aa {
                padding-top: 500px;
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
        
            <nav class="navbar navbar-fixed-top">    
                <ul>
                    <li>
                        <a href=@{HomeR}>Smiles Festas
                    <li>
                        <a href=@{Page1R}>Promoções
                    <li>
                        <a href=@{Page2R}>Serviços
                    <li>
                        <a href=@{Page2R}>Contatos
            <div class="a">
                <div class="aa">
                    <h1>SMILES FESTAS
                    <h2>Casamentos, Debutantes, Aniversários e muito mais    
                    
            <div class="b">
                <h1>SMILES FESTAS
                <p>A empresa Smiles é um grupo dedicado a auxiliar no planejamento, execução e finalização de eventos
                <p>Aqui tratamos cada evento de forma única e original. Nos esforçamos para criar um ambiente atrativo e agradável para os seus convidados.
            
            <div class="c">
                    <div class="col-lg-3">    
                    <div class="col-lg-6">
                        <h1>Solicite um Orçamento teste
                        <form class="form-horizontal">
                          <div class="form-group">
                            <input type="text" class="form-control" id="nome" placeholder="Nome">
                          <div class="form-group">
                             <input type="email" class="form-control" id="email" placeholder="Email">
                          <div class="form-group">
                             <input type="text" class="form-control" id="telefone" placeholder="Telefone">
                          <div class="form-group">
                            <textarea class="form-control" rows="3" id="mensagem" placeholder="Mensagem">
                          <div class="form-group">
                            <button type="button" class="btn btn-info btn-lg" onclick="ola()">Orçamento
        |]
