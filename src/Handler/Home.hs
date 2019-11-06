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


getTesteR :: Handler Html 
getTesteR = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(luciusFile "templates/teste.lucius")
        $(whamletFile "templates/teste.hamlet")


getPage2R :: Handler Html 
getPage2R = do 
    defaultLayout $ do 
        --addStylesheet (StaticR css_bootstrap_css)
        addStylesheetRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        addScriptRemote "https://code.jquery.com/jquery-3.3.1.slim.min.js"
        addScriptRemote "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        addScriptRemote "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        toWidgetHead $(luciusFile "templates/page2.lucius")
        $(whamletFile "templates/page2.hamlet")

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

            .c {
            background-color:rgba(0,0,0, 0.5);
            height: 600px;
            padding-top: 10%;
            text-align: center;
            }
            
            
            
            

        |]
        [whamlet|
        
            <nav class="navbar justify-content-end fixed-top">    
              <ul>
                  <li>
                      <a href=@{HomeR}>Smiles Festas
                  <li>
                      <a href=@{FotosR}>Fotos
                  <li>
                      <a href=@{Page2R}>Promoções
                  <li>
                      <a href=@{Page2R}>Serviços
                  <li>
                      <a href=@{Page2R}>Dicas
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
        
        
        <footer class="pt-5 pb-4" id="contact">
    			<div class="container">
    				<div class="row" style="margin-top: -30px;margin-bottom: -40px;">
    					<div class="col-lg-3 col-md-6 col-sm-6 mt-2 mb-4">
    						<h5 class="mb-4 font-weight-bold">SOBRE NÓS
    						
    						<ul class="f-address">
    							<li>
    								<div class="row">
    									<div class="col-1"><i class="fas fa-map-marker">
    									<div class="col-10">
    										<h6 class="font-weight-bold mb-0">Endereço:
    										<p>Avenida Ana Costa 200, Vila Mathias|Santos/SP<br>CEP 11013-020
    										
    					<div class="col-lg-3 col-md-6 col-sm-6 mt-2 mb-4">
    						<h5 class="mb-4 font-weight-bold">TWEETS RECENTES
    						<ul class="f-address">
    					
    							<li>
    								<div class="row">
    									<div class="col-1"><i class="fab fa-twitter">
    									<div class="col-10">
    										<p class="mb-0"><h6 class="font-weight-bold mb-0">@GlobalCâmbio10 Min Atrás
    										
    					<div class="col-lg-3 col-md-6 col-sm-6 mt-2 mb-4">
    						<h5 class="mb-4 font-weight-bold">ULTIMA ATUALIZAÇÃO
    						<ul class="recent-post">
    							<li>
    								<label class="mr-3">25<br><span>SET</span>
    								<h6 class="font-weight-bold mb-0">Cotações atualizadas
    							
    					<div class="col-lg-3 col-md-6 col-sm-6 mt-2 mb-4">
    						<h5 class="mb-4 font-weight-bold">CONECTE-SE CONOSCO
    						<div class="input-group">
    						  	<input type="text" class="form-control" placeholder="Seu email">
    						  	<span class="input-group-addon" id="basic-addon2"><i class="fas fa-check">
    						
    						<ul class="social-pet mt-4">
    							<li><a href="#" title="facebook"><i class="fab fa-facebook-f">
    							<li><a href="#" title="twitter"><i class="fab fa-twitter">
    							<li><a href="#" title="google-plus"><i class="fab fa-google-plus-g">
    							<li><a href="#" title="instagram"><i class="fab fa-instagram">
    						
    		
    		<section class="copyright">
    			<div class="container">
    				<div class="row">
    					<div class="col-md-12 ">
    						<div class="text-center text-white">
    							&copy; 2019 Global Câmbio. All Rights Reserved.
    						
        |]
