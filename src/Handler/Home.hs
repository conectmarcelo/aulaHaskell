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
        addStylesheet (StaticR css_bootstrap_min_css)
        toWidgetHead $(juliusFile "templates/page1.julius")
        toWidgetHead $(luciusFile "templates/page1.lucius")
        $(whamletFile "templates/page1.hamlet")

getHomeR :: Handler Html
getHomeR = do 
    defaultLayout $ do 
        -- remoto
        addScriptRemote "https://code.jquery.com/jquery-3.4.1.min.js"
        -- esta no projeto
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"
        toWidgetHead [julius|
            function ola(){
                alert("SMILES FESTAS");
            }
        |]
        toWidgetHead [lucius|
            h1 {
                color : blue;
            }
            main {background-color:white;}
            
          
        |]
        [whamlet|
        
         <main class="container-fluid">
            
            <ul class="navbar navbar-dark bg-dark navbar-expand-lg navbar-default fixed-top">
              <li class="nav-item">
                <a class="nav-link active" href=@{Page1R}>Smiles
              <li class="nav-item">
                <a class="nav-link" href=@{Page1R}>Promocoes
              <li class="nav-item">
                <a class="nav-link" href=@{Page2R}>Locacoes
              <li class="nav-item">
                <a class="nav-link" href=@{Page1R}>Contato

            <h1>Smiles Festas
                    
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item">
                        <img src=@{StaticR foto_jpg} class="d-block w-100" alt="...">
                            <div class="carousel-item">
                                <img src=@{StaticR fotoa_jpg} class="d-block w-100" alt="...">
                                     <div class="carousel-item">
                                        <img src==@{StaticR fotob_jpg} class="d-block w-100" alt="...">
            
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src=@{StaticR foto_jpg} class="d-block w-100">
                    <div class="carousel-item">
                        <img src=@{StaticR fotoa_jpg} class="d-block w-100">
                    <div class="carousel-item">
                        <img src=@{StaticR fotob_jpg} class="d-block w-100">
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true">
                    <span class="sr-only">Previous
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true">
                    <span class="sr-only">Next
             
            <p>
                Aqui tratamos cada evento de forma única e original. Nos esforçamos para criar um ambiente atrativo e agradável para os seus convidados.

            <p>
                Nossos clientes são valorizados e nossa maior alegria é constatar a satisfação de nossos clientes com os nossos serviços.



                
            <ul>
                <li>
                    <a href=@{Page1R}>
                        Pagina 1
                
                <li>
                    <a href=@{Page2R}>
                        Pagina 2
            
            <img src=@{StaticR foto_jpg}>
            <img src=@{StaticR fotoa_jpg}>
            <img src=@{StaticR fotob_jpg}>
            
            <br><button class="btn btn-danger" onclick="ola()">
                OK
        |]
