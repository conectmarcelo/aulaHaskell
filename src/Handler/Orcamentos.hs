{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Orcamentos where

import Import
--import Network.HTTP.Types.Status
import Database.Persist.Postgresql
import Text.Lucius
import Text.Julius

-- renderDivs
formOrcamentos :: Form Orcamentos 
formOrcamentos = renderBootstrap $ Orcamentos 
    <$> areq textField "Nome:" Nothing
    <*> areq textField "Email:" Nothing
    <*> areq textField "Telefone:" Nothing
    <*> areq textField "Mensagem:" Nothing

getOrcamentosR :: Handler Html
getOrcamentosR = do 
    (widget,enctype) <- generateFormPost formOrcamentos 
    defaultLayout $ do 
        toWidgetHead [lucius|
            
        * {
        margin:0px;
        padding: 0px;
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
        
        .mapa {
            background-image: url(@{StaticR mapa_jpg});
            background-repeat: no-repeat;
            background-size: 100%;
            
            
            
        }
         
         .contato {
                    background-color:lightgrey;
                    Text-align: center;
                    margin-top:50px;
                    }
        .button{
                background-color:black;
                color:white
        }
        
        h1{color:rgb(192, 159, 75);
        }
        
        .form{background-color:#e9e9e9;
        padding:0px;       
        
            
        }            
     
        input[type=text], select {
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid #ccc;
          border-radius: 4px;
          box-sizing: border-box;
        }
        
        input[type=submit] {
          width: 100%;
          background-color: black;
          color: white;
          padding: 14px 20px;
          margin: 8px 0;
          border: none;
          border-radius: 4px;
          cursor: pointer;
        }
        
        input[type=submit]:hover {
          background-color: grey;
        }
        
        div {
          border-radius: 5px;
        
        }
        
        .form {padding:100px 200px 50px 200px;
                margin:50px;
        }
        
        footer{background-color:black;
            text-align:center;
            padding:20px;}
        img {width:50px; height:50px;}
        
        .rodape{text-align:center}
        
                    
        |]
        msg <- getMessage
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
                    <a href=@{ContatosR}>Contatos    
   
        $maybe mensa <- msg
            <div>
                ^{mensa}
        
        <div class="form">
            <h1>
                Solicite um orçamento
            <br>
                
            <form method=post action=@{OrcamentosR}>
                ^{widget}
                <input class=""btn btn-default btn-lg" type="submit" value="Cadastrar">
            <br>
            <div>
                <div class="col-lg-6">
                    <h1>Atendimento
                    <h3>Whatssapp
                    <h1>13 98882 2632
                <div class="col-lg-6">
                    <h1>Endereço
                    <h3>Rua São Miguel dos Campos, 121
                    <h3> Catipoã - São Vicente - SP    
                <div class="col-lg-12">
                    <div class="mapa">            
        <footer>
            <div class="footer">
                <h1>Smiles Festas
            <div class="footer">
                <ul class="rodape">
                    <l1>
                        <a href="www.facebook.com/espacosmiles"><img src=@{StaticR face_png} alt="facebook">
                    <l1>
                        <a href="www.facebook.com/espacosmiles" ><img src=@{StaticR whatsapp_png} alt="whatsapp">
              
        |]
        

postOrcamentosR :: Handler Html
postOrcamentosR = do 
    ((result,_),_) <- runFormPost formOrcamentos
    case result of 
        FormSuccess orcamentos -> do 
            runDB $ insert orcamentos
            setMessage [shamlet|
                <h2>
                    Mensagem enviada com sucesso!
            |]
            redirect OrcamentosR
        _ -> redirect HomeR

getListOrcamentosR :: Handler Html 
getListOrcamentosR = do 
    -- select * from Orcamentos order by orcamentos.nome
    orcamentos <- runDB $ selectList [] [Asc OrcamentosNome]
    defaultLayout $ do
        addStylesheet (StaticR css_bootstrap_css)
        $(whamletFile "templates/listarOrcamentos.hamlet")
        
        toWidgetHead [lucius|
            
        * {
        margin:0px;
        padding: 0px;
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
        
        
        footer{background-color:black;
            text-align:center;
            padding:20px;}
        img {width:50px; height:50px;}
        
        .rodape{text-align:center}
        
                    
        |]




postApagarOrcamentosR :: OrcamentosId -> Handler Html
postApagarOrcamentosR pid = do 
    _ <- runDB $ get404 pid
    runDB $ delete pid
    redirect ListOrcamentosR