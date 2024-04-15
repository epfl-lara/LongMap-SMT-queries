; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111278 () Bool)

(assert start!111278)

(declare-fun res!874122 () Bool)

(declare-fun e!751374 () Bool)

(assert (=> start!111278 (=> (not res!874122) (not e!751374))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111278 (= res!874122 (validMask!0 mask!2019))))

(assert (=> start!111278 e!751374))

(assert (=> start!111278 true))

(declare-datatypes ((V!52793 0))(
  ( (V!52794 (val!17958 Int)) )
))
(declare-datatypes ((ValueCell!16985 0))(
  ( (ValueCellFull!16985 (v!20586 V!52793)) (EmptyCell!16985) )
))
(declare-datatypes ((array!88409 0))(
  ( (array!88410 (arr!42680 (Array (_ BitVec 32) ValueCell!16985)) (size!43232 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88409)

(declare-fun e!751375 () Bool)

(declare-fun array_inv!32415 (array!88409) Bool)

(assert (=> start!111278 (and (array_inv!32415 _values!1337) e!751375)))

(declare-datatypes ((array!88411 0))(
  ( (array!88412 (arr!42681 (Array (_ BitVec 32) (_ BitVec 64))) (size!43233 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88411)

(declare-fun array_inv!32416 (array!88411) Bool)

(assert (=> start!111278 (array_inv!32416 _keys!1609)))

(declare-fun b!1316926 () Bool)

(declare-fun res!874121 () Bool)

(assert (=> b!1316926 (=> (not res!874121) (not e!751374))))

(assert (=> b!1316926 (= res!874121 (and (bvsle #b00000000000000000000000000000000 (size!43233 _keys!1609)) (bvslt (size!43233 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun b!1316927 () Bool)

(declare-fun res!874120 () Bool)

(assert (=> b!1316927 (=> (not res!874120) (not e!751374))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1316927 (= res!874120 (and (= (size!43232 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43233 _keys!1609) (size!43232 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1316928 () Bool)

(declare-fun res!874119 () Bool)

(assert (=> b!1316928 (=> (not res!874119) (not e!751374))))

(declare-datatypes ((List!30352 0))(
  ( (Nil!30349) (Cons!30348 (h!31557 (_ BitVec 64)) (t!43952 List!30352)) )
))
(declare-fun noDuplicate!2085 (List!30352) Bool)

(assert (=> b!1316928 (= res!874119 (noDuplicate!2085 Nil!30349))))

(declare-fun b!1316929 () Bool)

(declare-fun e!751372 () Bool)

(declare-fun tp_is_empty!35767 () Bool)

(assert (=> b!1316929 (= e!751372 tp_is_empty!35767)))

(declare-fun b!1316930 () Bool)

(declare-fun e!751373 () Bool)

(declare-fun contains!8541 (List!30352 (_ BitVec 64)) Bool)

(assert (=> b!1316930 (= e!751373 (contains!8541 Nil!30349 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!55295 () Bool)

(declare-fun mapRes!55295 () Bool)

(assert (=> mapIsEmpty!55295 mapRes!55295))

(declare-fun b!1316931 () Bool)

(assert (=> b!1316931 (= e!751375 (and e!751372 mapRes!55295))))

(declare-fun condMapEmpty!55295 () Bool)

(declare-fun mapDefault!55295 () ValueCell!16985)

(assert (=> b!1316931 (= condMapEmpty!55295 (= (arr!42680 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16985)) mapDefault!55295)))))

(declare-fun b!1316932 () Bool)

(declare-fun e!751376 () Bool)

(assert (=> b!1316932 (= e!751376 tp_is_empty!35767)))

(declare-fun b!1316933 () Bool)

(assert (=> b!1316933 (= e!751374 e!751373)))

(declare-fun res!874123 () Bool)

(assert (=> b!1316933 (=> res!874123 e!751373)))

(assert (=> b!1316933 (= res!874123 (contains!8541 Nil!30349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316934 () Bool)

(declare-fun res!874118 () Bool)

(assert (=> b!1316934 (=> (not res!874118) (not e!751374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88411 (_ BitVec 32)) Bool)

(assert (=> b!1316934 (= res!874118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55295 () Bool)

(declare-fun tp!105402 () Bool)

(assert (=> mapNonEmpty!55295 (= mapRes!55295 (and tp!105402 e!751376))))

(declare-fun mapRest!55295 () (Array (_ BitVec 32) ValueCell!16985))

(declare-fun mapKey!55295 () (_ BitVec 32))

(declare-fun mapValue!55295 () ValueCell!16985)

(assert (=> mapNonEmpty!55295 (= (arr!42680 _values!1337) (store mapRest!55295 mapKey!55295 mapValue!55295))))

(assert (= (and start!111278 res!874122) b!1316927))

(assert (= (and b!1316927 res!874120) b!1316934))

(assert (= (and b!1316934 res!874118) b!1316926))

(assert (= (and b!1316926 res!874121) b!1316928))

(assert (= (and b!1316928 res!874119) b!1316933))

(assert (= (and b!1316933 (not res!874123)) b!1316930))

(assert (= (and b!1316931 condMapEmpty!55295) mapIsEmpty!55295))

(assert (= (and b!1316931 (not condMapEmpty!55295)) mapNonEmpty!55295))

(get-info :version)

(assert (= (and mapNonEmpty!55295 ((_ is ValueCellFull!16985) mapValue!55295)) b!1316932))

(assert (= (and b!1316931 ((_ is ValueCellFull!16985) mapDefault!55295)) b!1316929))

(assert (= start!111278 b!1316931))

(declare-fun m!1204487 () Bool)

(assert (=> b!1316930 m!1204487))

(declare-fun m!1204489 () Bool)

(assert (=> mapNonEmpty!55295 m!1204489))

(declare-fun m!1204491 () Bool)

(assert (=> b!1316934 m!1204491))

(declare-fun m!1204493 () Bool)

(assert (=> b!1316933 m!1204493))

(declare-fun m!1204495 () Bool)

(assert (=> start!111278 m!1204495))

(declare-fun m!1204497 () Bool)

(assert (=> start!111278 m!1204497))

(declare-fun m!1204499 () Bool)

(assert (=> start!111278 m!1204499))

(declare-fun m!1204501 () Bool)

(assert (=> b!1316928 m!1204501))

(check-sat (not b!1316930) (not start!111278) (not b!1316933) (not b!1316934) tp_is_empty!35767 (not mapNonEmpty!55295) (not b!1316928))
(check-sat)
(get-model)

(declare-fun d!142595 () Bool)

(declare-fun res!874164 () Bool)

(declare-fun e!751417 () Bool)

(assert (=> d!142595 (=> res!874164 e!751417)))

(assert (=> d!142595 (= res!874164 ((_ is Nil!30349) Nil!30349))))

(assert (=> d!142595 (= (noDuplicate!2085 Nil!30349) e!751417)))

(declare-fun b!1316993 () Bool)

(declare-fun e!751418 () Bool)

(assert (=> b!1316993 (= e!751417 e!751418)))

(declare-fun res!874165 () Bool)

(assert (=> b!1316993 (=> (not res!874165) (not e!751418))))

(assert (=> b!1316993 (= res!874165 (not (contains!8541 (t!43952 Nil!30349) (h!31557 Nil!30349))))))

(declare-fun b!1316994 () Bool)

(assert (=> b!1316994 (= e!751418 (noDuplicate!2085 (t!43952 Nil!30349)))))

(assert (= (and d!142595 (not res!874164)) b!1316993))

(assert (= (and b!1316993 res!874165) b!1316994))

(declare-fun m!1204535 () Bool)

(assert (=> b!1316993 m!1204535))

(declare-fun m!1204537 () Bool)

(assert (=> b!1316994 m!1204537))

(assert (=> b!1316928 d!142595))

(declare-fun d!142597 () Bool)

(declare-fun lt!586115 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!650 (List!30352) (InoxSet (_ BitVec 64)))

(assert (=> d!142597 (= lt!586115 (select (content!650 Nil!30349) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!751423 () Bool)

(assert (=> d!142597 (= lt!586115 e!751423)))

(declare-fun res!874171 () Bool)

(assert (=> d!142597 (=> (not res!874171) (not e!751423))))

(assert (=> d!142597 (= res!874171 ((_ is Cons!30348) Nil!30349))))

(assert (=> d!142597 (= (contains!8541 Nil!30349 #b1000000000000000000000000000000000000000000000000000000000000000) lt!586115)))

(declare-fun b!1316999 () Bool)

(declare-fun e!751424 () Bool)

(assert (=> b!1316999 (= e!751423 e!751424)))

(declare-fun res!874170 () Bool)

(assert (=> b!1316999 (=> res!874170 e!751424)))

(assert (=> b!1316999 (= res!874170 (= (h!31557 Nil!30349) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317000 () Bool)

(assert (=> b!1317000 (= e!751424 (contains!8541 (t!43952 Nil!30349) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142597 res!874171) b!1316999))

(assert (= (and b!1316999 (not res!874170)) b!1317000))

(declare-fun m!1204539 () Bool)

(assert (=> d!142597 m!1204539))

(declare-fun m!1204541 () Bool)

(assert (=> d!142597 m!1204541))

(declare-fun m!1204543 () Bool)

(assert (=> b!1317000 m!1204543))

(assert (=> b!1316930 d!142597))

(declare-fun d!142599 () Bool)

(assert (=> d!142599 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111278 d!142599))

(declare-fun d!142601 () Bool)

(assert (=> d!142601 (= (array_inv!32415 _values!1337) (bvsge (size!43232 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111278 d!142601))

(declare-fun d!142603 () Bool)

(assert (=> d!142603 (= (array_inv!32416 _keys!1609) (bvsge (size!43233 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111278 d!142603))

(declare-fun bm!64662 () Bool)

(declare-fun call!64665 () Bool)

(assert (=> bm!64662 (= call!64665 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1317009 () Bool)

(declare-fun e!751432 () Bool)

(assert (=> b!1317009 (= e!751432 call!64665)))

(declare-fun d!142605 () Bool)

(declare-fun res!874177 () Bool)

(declare-fun e!751431 () Bool)

(assert (=> d!142605 (=> res!874177 e!751431)))

(assert (=> d!142605 (= res!874177 (bvsge #b00000000000000000000000000000000 (size!43233 _keys!1609)))))

(assert (=> d!142605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!751431)))

(declare-fun b!1317010 () Bool)

(declare-fun e!751433 () Bool)

(assert (=> b!1317010 (= e!751433 e!751432)))

(declare-fun lt!586123 () (_ BitVec 64))

(assert (=> b!1317010 (= lt!586123 (select (arr!42681 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43249 0))(
  ( (Unit!43250) )
))
(declare-fun lt!586122 () Unit!43249)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88411 (_ BitVec 64) (_ BitVec 32)) Unit!43249)

(assert (=> b!1317010 (= lt!586122 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586123 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1317010 (arrayContainsKey!0 _keys!1609 lt!586123 #b00000000000000000000000000000000)))

(declare-fun lt!586124 () Unit!43249)

(assert (=> b!1317010 (= lt!586124 lt!586122)))

(declare-fun res!874176 () Bool)

(declare-datatypes ((SeekEntryResult!10038 0))(
  ( (MissingZero!10038 (index!42523 (_ BitVec 32))) (Found!10038 (index!42524 (_ BitVec 32))) (Intermediate!10038 (undefined!10850 Bool) (index!42525 (_ BitVec 32)) (x!117088 (_ BitVec 32))) (Undefined!10038) (MissingVacant!10038 (index!42526 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88411 (_ BitVec 32)) SeekEntryResult!10038)

(assert (=> b!1317010 (= res!874176 (= (seekEntryOrOpen!0 (select (arr!42681 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10038 #b00000000000000000000000000000000)))))

(assert (=> b!1317010 (=> (not res!874176) (not e!751432))))

(declare-fun b!1317011 () Bool)

(assert (=> b!1317011 (= e!751433 call!64665)))

(declare-fun b!1317012 () Bool)

(assert (=> b!1317012 (= e!751431 e!751433)))

(declare-fun c!125622 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1317012 (= c!125622 (validKeyInArray!0 (select (arr!42681 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!142605 (not res!874177)) b!1317012))

(assert (= (and b!1317012 c!125622) b!1317010))

(assert (= (and b!1317012 (not c!125622)) b!1317011))

(assert (= (and b!1317010 res!874176) b!1317009))

(assert (= (or b!1317009 b!1317011) bm!64662))

(declare-fun m!1204545 () Bool)

(assert (=> bm!64662 m!1204545))

(declare-fun m!1204547 () Bool)

(assert (=> b!1317010 m!1204547))

(declare-fun m!1204549 () Bool)

(assert (=> b!1317010 m!1204549))

(declare-fun m!1204551 () Bool)

(assert (=> b!1317010 m!1204551))

(assert (=> b!1317010 m!1204547))

(declare-fun m!1204553 () Bool)

(assert (=> b!1317010 m!1204553))

(assert (=> b!1317012 m!1204547))

(assert (=> b!1317012 m!1204547))

(declare-fun m!1204555 () Bool)

(assert (=> b!1317012 m!1204555))

(assert (=> b!1316934 d!142605))

(declare-fun d!142607 () Bool)

(declare-fun lt!586125 () Bool)

(assert (=> d!142607 (= lt!586125 (select (content!650 Nil!30349) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!751434 () Bool)

(assert (=> d!142607 (= lt!586125 e!751434)))

(declare-fun res!874179 () Bool)

(assert (=> d!142607 (=> (not res!874179) (not e!751434))))

(assert (=> d!142607 (= res!874179 ((_ is Cons!30348) Nil!30349))))

(assert (=> d!142607 (= (contains!8541 Nil!30349 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586125)))

(declare-fun b!1317013 () Bool)

(declare-fun e!751435 () Bool)

(assert (=> b!1317013 (= e!751434 e!751435)))

(declare-fun res!874178 () Bool)

(assert (=> b!1317013 (=> res!874178 e!751435)))

(assert (=> b!1317013 (= res!874178 (= (h!31557 Nil!30349) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317014 () Bool)

(assert (=> b!1317014 (= e!751435 (contains!8541 (t!43952 Nil!30349) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142607 res!874179) b!1317013))

(assert (= (and b!1317013 (not res!874178)) b!1317014))

(assert (=> d!142607 m!1204539))

(declare-fun m!1204557 () Bool)

(assert (=> d!142607 m!1204557))

(declare-fun m!1204559 () Bool)

(assert (=> b!1317014 m!1204559))

(assert (=> b!1316933 d!142607))

(declare-fun b!1317021 () Bool)

(declare-fun e!751441 () Bool)

(assert (=> b!1317021 (= e!751441 tp_is_empty!35767)))

(declare-fun condMapEmpty!55304 () Bool)

(declare-fun mapDefault!55304 () ValueCell!16985)

(assert (=> mapNonEmpty!55295 (= condMapEmpty!55304 (= mapRest!55295 ((as const (Array (_ BitVec 32) ValueCell!16985)) mapDefault!55304)))))

(declare-fun e!751440 () Bool)

(declare-fun mapRes!55304 () Bool)

(assert (=> mapNonEmpty!55295 (= tp!105402 (and e!751440 mapRes!55304))))

(declare-fun mapNonEmpty!55304 () Bool)

(declare-fun tp!105411 () Bool)

(assert (=> mapNonEmpty!55304 (= mapRes!55304 (and tp!105411 e!751441))))

(declare-fun mapRest!55304 () (Array (_ BitVec 32) ValueCell!16985))

(declare-fun mapKey!55304 () (_ BitVec 32))

(declare-fun mapValue!55304 () ValueCell!16985)

(assert (=> mapNonEmpty!55304 (= mapRest!55295 (store mapRest!55304 mapKey!55304 mapValue!55304))))

(declare-fun mapIsEmpty!55304 () Bool)

(assert (=> mapIsEmpty!55304 mapRes!55304))

(declare-fun b!1317022 () Bool)

(assert (=> b!1317022 (= e!751440 tp_is_empty!35767)))

(assert (= (and mapNonEmpty!55295 condMapEmpty!55304) mapIsEmpty!55304))

(assert (= (and mapNonEmpty!55295 (not condMapEmpty!55304)) mapNonEmpty!55304))

(assert (= (and mapNonEmpty!55304 ((_ is ValueCellFull!16985) mapValue!55304)) b!1317021))

(assert (= (and mapNonEmpty!55295 ((_ is ValueCellFull!16985) mapDefault!55304)) b!1317022))

(declare-fun m!1204561 () Bool)

(assert (=> mapNonEmpty!55304 m!1204561))

(check-sat (not bm!64662) (not b!1317010) (not b!1317012) (not b!1316993) (not d!142607) (not mapNonEmpty!55304) (not b!1317014) (not b!1316994) (not d!142597) tp_is_empty!35767 (not b!1317000))
(check-sat)
