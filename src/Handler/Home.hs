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
         
        toWidgetHead [hamlet|<script data-ad-client="ca-pub-6395641199023717" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js">|]
        
        
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
                background-color:#e9e9e9;
                height: 600px;
                padding-top: 10%;
                text-align: center;
            }
            
            footer{background-color:black;
            text-align:center;
            padding:20px;}

            img {width:50px; height:50px;}
            
            
        |]
        [whamlet|
        
        <script type="text/javascript" async="async" >
        var elem = document.createElement('script');
        elem.src = 'https://quantcast.mgr.consensu.org/cmp.js';
        elem.async = true;
        elem.type = "text/javascript";
        var scpt = document.getElementsByTagName('script')[0];
        scpt.parentNode.insertBefore(elem, scpt);
        (function() {
        var gdprAppliesGlobally = false;
        function addFrame() {
            if (!window.frames['__cmpLocator']) {
            if (document.body) {
                var body = document.body,
                    iframe = document.createElement('iframe');
                iframe.style = 'display:none';
                iframe.name = '__cmpLocator';
                body.appendChild(iframe);
            } else {
                setTimeout(addFrame, 5);
            }
            }
        }
        addFrame();
        function cmpMsgHandler(event) {
            var msgIsString = typeof event.data === "string";
            var json;
            if(msgIsString) {
            json = event.data.indexOf("__cmpCall") != -1 ? JSON.parse(event.data) : {};
            } else {
            json = event.data;
            }
            if (json.__cmpCall) {
            var i = json.__cmpCall;
            window.__cmp(i.command, i.parameter, function(retValue, success) {
                var returnMsg = {"__cmpReturn": {
                "returnValue": retValue,
                "success": success,
                "callId": i.callId
                }};
                event.source.postMessage(msgIsString ?
                JSON.stringify(returnMsg) : returnMsg, '*');
            });
            }
        }
        window.__cmp = function (c) {
            var b = arguments;
            if (!b.length) {
            return __cmp.a;
            }
            else if (b[0] === 'ping') {
            b[2]({"gdprAppliesGlobally": gdprAppliesGlobally,
                "cmpLoaded": false}, true);
            } else if (c == '__cmp')
            return false;
            else {
            if (typeof __cmp.a === 'undefined') {
                __cmp.a = [];
            }
            __cmp.a.push([].slice.apply(b));
            }
        }
        window.__cmp.gdprAppliesGlobally = gdprAppliesGlobally;
        window.__cmp.msgHandler = cmpMsgHandler;
        if (window.addEventListener) {
            window.addEventListener('message', cmpMsgHandler, false);
        }
        else {
            window.attachEvent('onmessage', cmpMsgHandler);
        }
        })();
        window.__cmp('init', {
        		'Language': 'pt',
    		'Initial Screen Body Text Option': 1,
    		'Publisher Name': 'Moneytizer',
    		'Default Value for Toggles': 'off',
    		'UI Layout': 'banner',
    		'No Option': false,
        });
    
        <style>
            .qc-cmp-button,
            .qc-cmp-button.qc-cmp-secondary-button:hover {
                background-color: #000000 !important;
                border-color: #000000 !important;
            }
            .qc-cmp-button:hover,
            .qc-cmp-button.qc-cmp-secondary-button {
                background-color: transparent !important;
                border-color: #000000 !important;
            }
            .qc-cmp-alt-action,
            .qc-cmp-link {
                color: #000000 !important;
            }
            .qc-cmp-button,
            .qc-cmp-button.qc-cmp-secondary-button:hover {
                color: #ffffff !important;
            }
            .qc-cmp-button:hover,
            .qc-cmp-button.qc-cmp-secondary-button {
                color: #000000 !important;
            }
            .qc-cmp-small-toggle,
            .qc-cmp-toggle {
                background-color: #000000 !important;
                border-color: #000000 !important;
            }
            .qc-cmp-main-messaging,
    		.qc-cmp-messaging,
    		.qc-cmp-sub-title,
    		.qc-cmp-privacy-settings-title,
    		.qc-cmp-purpose-list,
    		.qc-cmp-tab,
    		.qc-cmp-title,
    		.qc-cmp-vendor-list,
    		.qc-cmp-vendor-list-title,
    		.qc-cmp-enabled-cell,
    		.qc-cmp-toggle-status,
    		.qc-cmp-table,
    		.qc-cmp-table-header {
        		color: #000000 !important;
    		}
           	
            .qc-cmp-ui {
      			background-color: #ffffff !important;
    		}
    
    		.qc-cmp-table,
    		.qc-cmp-table-row {
    			  border: 1px solid !important;
    			  border-color: #000000 !important;
    		} 
        #qcCmpButtons a {
                text-decoration: none !important;
    
        }
        
        #qcCmpButtons button {
            margin-top: 65px;
        }
        .qc-cmp-qc-link-container{
        display:none;
        }
        

        
        
        <div id="48674-1">
            <script src="//ads.themoneytizer.com/s/gen.js?type=1">
            <script src="//ads.themoneytizer.com/s/requestform.js?siteId=48674&formatId=1">
        <div id="48674-3">
            <script src="//ads.themoneytizer.com/s/gen.js?type=3">
            <script src="//ads.themoneytizer.com/s/requestform.js?siteId=48674&formatId=3">    
        
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
            <div class="aa">
                <h1>SMILES FESTAS
                <h2>Casamentos, Debutantes, Aniversários e muito mais    
                
        <div class="b">
            <h1>SMILES FESTAS
            <p>A empresa Smiles é um grupo dedicado a auxiliar no planejamento, execução e finalização de eventos
            <p>Aqui tratamos cada evento de forma única e original. Nos esforçamos para criar um ambiente atrativo e agradável para os seus convidados.
        
        <footer>
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="footer">
                        <h1>Smiles Festas
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="footer">
                            <ul>
                                <l1>
                                    <a href="https://www.facebook.com/espacosmiles"><img src=@{StaticR face_png} alt="facebook">
                                <l1>
                                    <a href="www.facebook.com/espacosmiles" ><img src=@{StaticR whatsapp_png} alt="whatsapp">
                                        
        |]
