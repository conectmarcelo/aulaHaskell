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

getInfantilR :: Handler Html 
getInfantilR = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(luciusFile "templates/infantil.lucius")
        $(whamletFile "templates/infantil.hamlet")        
        

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

getDocesR :: Handler Html 
getDocesR = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(juliusFile "templates/doces.julius")
        toWidgetHead $(luciusFile "templates/doces.lucius")
        $(whamletFile "templates/doces.hamlet")

getHomeR :: Handler Html
getHomeR = do 
    defaultLayout $ do 
        
        -- remoto
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        sess <- lookupSession "_NOME"
        
        
        toWidgetHead [julius|
        
            if(location.protocol!=='https:'){
            const httpsURL = 'https://' + location.href.split('//')[1]
            location.replace(httpsURL)
            }
        
        
        
        |]
        
        
        
        toWidgetHead [hamlet|
        
        
        <link rel="stylesheet" type="text/css" href="bannertxt.css" media="screen" />
        <script type="text/javascript" src="bannertxt.js">
        
        
        
        |]
        
        
        
        toWidgetHead [lucius|
            
            * {
            margin: 0px;
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
            @media only screen and (max-device-width: 700px){
            
            .a {
                background:rgba(0,0,0, 0.5);
                background-size: 100%;
                height: 600px;
                margin-top: -60px;
            }
            
            
            
            
            
            
			}

            .aa {
                
                height: 100px;
                background-color: rgba(0,0,0, 0.0);
                position:absolute;
                top:450px;
                left:100px;
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
                background-color:#e9e9e9;
                height: 600px;
                padding-top: 10%;
                text-align: center;
            }
            
            footer{background-color:black;
            text-align:center;
            padding:20px;}

            img {width:50px; height:50px;z-index:-1;}
            
            
            
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
                    <a href=@{OrcamentosR}>Contatos
                
                
        
        <div class="a">
            <div id="48674-1" style="position:absolute;top:100px;left:100px;">
                <script src="//ads.themoneytizer.com/s/gen.js?type=1">
                <script src="//ads.themoneytizer.com/s/requestform.js?siteId=48674&formatId=1">
            <div class="aa">
                <h1>SMILES FESTAS
                <h2>Casamentos, Debutantes, Aniversários e muito mais    
                <br>
            <div style="background-color:white;position:absolute;top:100px;right:10px;padding:20px;">
                <div id="fb-root">
                <script async defer crossorigin="anonymous" src="https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v5.0&appId=523855388173048&autoLogAppEvents=1">
                <div class="fb-like" data-href="https://facebook.com/espacosmiles" data-width="300px" data-layout="standard" data-action="like" data-size="large" data-show-faces="true" data-share="true">
                
                
        <div class="b">
            <h1>SMILES FESTAS
            <p>A empresa Smiles é um grupo dedicado a auxiliar no planejamento, execução e finalização de eventos
            <p>Aqui tratamos cada evento de forma única e original. Nos esforçamos para criar um ambiente atrativo e agradável para os seus convidados.
            <br>
            <a href="https://wa.me/5513988822632?text=Atendimento%20Smiles" target="_blank" class="btn btn-primary">Atendimento
        <footer>
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="footer">
                        <h1>Smiles Festa
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="footer">
                            <ul>
                                <l1>
                                    <a href="https://www.facebook.com/espacosmiles" target="_blank"><img src=@{StaticR face_png} alt="facebook">
                                <l1>
                                    <a href="https://wa.me/5513988822632?text=Atendimento%20Smiles" target="_blank"><img src=@{StaticR whatsapp_png} alt="whatsapp">
                                    
            
        |]
        
      
