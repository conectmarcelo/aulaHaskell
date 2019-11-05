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

    

formProduto :: Form Produto
formProduto = renderBootstrap $ Produto

<$> areq textField "nome:" Nothing
<*> areq doublefield "Preço:" Nothing


getProdutoR:: Handler Html
getProdutoR = undefined
    (widget,entype)<- generateFormPost formProduto
    defaultLayout $ do
        msg <- getMessage
        [| wHamlet|
            $maybe:mensa <- msg
                <div>
                    ^{mensa}
                <h1>
                CADASTRO DE PRODUTOS
            
                <form method=post action=@{ProdutoR}
                ^{widget}
        
        
        |]

postProdutoR:: Handler Html
postProdutoR = do

    ((result,_)_) <- runFormPost formProduto
    case result of
    FormSucess produto --> do
        runDb $ insert produto
        setMessage {shamlet |
            <h2>
                PRODUTO INSERIDO COM SUCESSO
    |]
    
        redirect ProdutoR
    -> redirect HomeR
    _
