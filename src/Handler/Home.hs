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
        addStylesheet (StaticR css_bootstrap_min_css)
        toWidgetHead [julius|
            function ola(){
                alert("SMILES FESTAS");
            }
        |]
        toWidgetHead [lucius|
            h1 {
                color : blue;
            }
            main {background-color:aqua;}
            
          
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
                <a class="nav-link disabled" href=@{Page1R} tabindex="-1" aria-disabled="true">Contato
</main>
            
            
            
            
            
            
                <h1>
                    Smiles Festas
                    
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                      <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src=@{StaticR foto_jpg} class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                          <img src=@{StaticR foto_jpg} class="d-block w-100" alt="...">
                            </div>
                        <div class="carousel-item">
                          <img src==@{StaticR foto_jpg} class="d-block w-100" alt="...">
                        </div>
                          </div>
                            </div>
                    
                    
            
            <ul>
                <li>
                    <a href=@{Page1R}>
                        Pagina 1
                
                <li>
                    <a href=@{Page2R}>
                        Pagina 2
            
            <img src=@{StaticR foto_jpg}>
            
            <button class="btn btn-danger" onclick="ola()">
                OK
        |]
