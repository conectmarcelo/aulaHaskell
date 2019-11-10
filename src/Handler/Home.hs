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

getDicasR :: Handler Html 
getDicasR = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(luciusFile "templates/dicas.lucius")
        $(whamletFile "templates/dicas.hamlet")

getPromocoesR :: Handler Html 
getPromocoesR = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(luciusFile "templates/promocoes.lucius")
        $(whamletFile "templates/promocoes.hamlet")

getServicosR :: Handler Html 
getServicosR = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(luciusFile "templates/servicos.lucius")
        $(whamletFile "templates/servicos.hamlet")


getContatosR :: Handler Html 
getContatosR = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(luciusFile "templates/contatos.lucius")
        $(whamletFile "templates/contatos.hamlet")

getFotosR :: Handler Html 
getFotosR = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(juliusFile "templates/fotos.julius")
        toWidgetHead $(luciusFile "templates/fotos.lucius")
        $(whamletFile "templates/fotos.hamlet")

getHomeR :: Handler Html
getHomeR = do 
    defaultLayout $ do 
        -- remoto
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        
        
        -- esta no projeto
        -- addStylesheet (StaticR css_bootstrap_css)
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
            
            footer{background-color:black;
            text-align:center;
            }

            img {width:30px; height:30px;}
            
            
        |]
        [whamlet|
        
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
                      <a href=@{OrcamentosR}>Contatos
            <div class="a">
                <div class="aa">
                    <h1>SMILES FESTAS
                    <h2>Casamentos, Debutantes, Aniversários e muito mais    
                    
            <div class="b">
                <h1>SMILES FESTAS
                <p>A empresa Smiles é um grupo dedicado a auxiliar no planejamento, execução e finalização de eventos
                <p>Aqui tratamos cada evento de forma única e original. Nos esforçamos para criar um ambiente atrativo e agradável para os seus convidados.
            
            <footer>
                <div class="row">
                    <div class="col-12">
                        <div class="footer">
                            <h1>Smiles Festas
                    <div class="row">
                        <div class="col-12">
                            <div class="footer">
                                <ul class="footer-social">
                                    <l1>
                                        <a href="www.facebook.com/espacosmiles"><img src=@{StaticR face_png} alt="facebook">
                                    <l1>
                                        <a href="www.facebook.com/espacosmiles" ><img src=@{StaticR whatsapp_png} alt="whatsapp">
                                        
        |]
