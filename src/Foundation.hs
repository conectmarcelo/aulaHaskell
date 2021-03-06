{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ViewPatterns #-}

module Foundation where

import Import.NoFoundation
import Database.Persist.Sql (ConnectionPool, runSqlPool)
import Yesod.Core.Types     (Logger)

data App = App
    { appSettings    :: AppSettings
    , appStatic      :: Static 
    , appConnPool    :: ConnectionPool 
    , appHttpManager :: Manager
    , appLogger      :: Logger
    }

mkYesodData "App" $(parseRoutesFile "config/routes")

instance Yesod App where
    makeLogger = return . appLogger

    authRoute _ = Just EntrarR
    
    isAuthorized HomeR _ = return Authorized
    isAuthorized ContatosR _ = return Authorized
    isAuthorized FotosR _ = return Authorized
    isAuthorized PromocoesR _ = return Authorized
    isAuthorized ServicosR _ = return Authorized
    isAuthorized DicasR _ = return Authorized 
    isAuthorized InfantilR _ = return Authorized
    isAuthorized OrcamentosR _ = return Authorized 
    isAuthorized DocesR _ = return Authorized
    isAuthorized EntrarR _ = return Authorized
    isAuthorized SairR _ = return Authorized
    isAuthorized (StaticR _) _ = return Authorized
    isAuthorized ListOrcamentosR _ = isAdmin
    isAuthorized AdminR _ = isAdmin
    isAuthorized ListUsuarioR _ = isAdmin
    isAuthorized _ _ = isUsuario
    
isAdmin :: Handler AuthResult
isAdmin = do 
    sess <- lookupSession "_NOME"
    case sess of 
        Nothing -> return AuthenticationRequired
        Just "admin" -> return Authorized
        Just _ -> return $ Unauthorized "VOCÊ NÃO TEM PERMISSÃO PARA ACESSAR ESTA PÁGINA"    

isUsuario :: Handler AuthResult
isUsuario = do 
    sess <- lookupSession "_NOME"
    case sess of 
        Nothing -> return AuthenticationRequired
        Just _ -> return Authorized

type Form a = Html -> MForm Handler (FormResult a, Widget)

instance YesodPersist App where
    type YesodPersistBackend App = SqlBackend
    runDB action = do
        master <- getYesod
        runSqlPool action $ appConnPool master

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

instance HasHttpManager App where
    getHttpManager = appHttpManager