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
           
          
            
          
        |]
        
        [whamlet|
        
        <ul>
              <li class="nav-item">
                <a class="nav-link active" href=@{Page1R}>Smiles
              <li class="nav-item">
                <a class="nav-link" href=@{Page1R}>Promocoes
              <li class="nav-item">
                <a class="nav-link" href=@{Page2R}>Locacoes
              <li class="nav-item">
                <a class="nav-link" href=@{Page1R}>Contato

        <div class="a">
            <div class="aa">
                <h1>SMILES FESTAS
                <h2>Casamentos, Debutantes, Aniversários e muito mais    
        
        <div class="b">
            <h1>SMILES FESTAS
                <p>A empresa Smiles e um grupo dedicado a auxiliar no planejamento, execução e finalização de eventos
            <p>Aqui tratamos cada evento de forma única e original. Nos esforçamos para criar um ambiente atrativo e agradável para os seus convidados.
        <div class="c">
            <h1>Orcamento

         
         
            
            <br><button class="btn btn-danger" onclick="ola()">
                OK
        |]
