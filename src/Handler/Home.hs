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
                alert("OLA MUNDO caraio depois de muitas tentativas funcionou kkkk");
            }
        |]
        toWidgetHead [lucius|
            h1 {
                color : red;
            }
            
          
        |]
        [whamlet|
            
            <ul class="nav">
              <li class="nav-item">
                <a class="nav-link active" href=@{Page1R}>Smiles
              
              <li class="nav-item">
                <a class="nav-link" href=@{Page1R}>Promocoes
              
              <li class="nav-item">
                <a class="nav-link" href=@{Page2R}>Locacoes
              
              <li class="nav-item">
                <a class="nav-link disabled" href=@{Page1R} tabindex="-1" aria-disabled="true">Contato

            
            
            
            
            
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
            
            <img src=@{StaticR citeg_jpg}>
            <img src=@{StaticR foto_jpg}>
            
            <button class="btn btn-danger" onclick="ola()">
                OK
        |]
