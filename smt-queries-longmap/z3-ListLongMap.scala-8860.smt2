; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107510 () Bool)

(assert start!107510)

(declare-fun b!1273156 () Bool)

(declare-fun b_free!27705 () Bool)

(declare-fun b_next!27705 () Bool)

(assert (=> b!1273156 (= b_free!27705 (not b_next!27705))))

(declare-fun tp!97653 () Bool)

(declare-fun b_and!45761 () Bool)

(assert (=> b!1273156 (= tp!97653 b_and!45761)))

(declare-fun b!1273151 () Bool)

(declare-fun e!726323 () Bool)

(declare-fun e!726321 () Bool)

(declare-fun mapRes!51225 () Bool)

(assert (=> b!1273151 (= e!726323 (and e!726321 mapRes!51225))))

(declare-fun condMapEmpty!51225 () Bool)

(declare-datatypes ((V!49293 0))(
  ( (V!49294 (val!16612 Int)) )
))
(declare-datatypes ((ValueCell!15684 0))(
  ( (ValueCellFull!15684 (v!19249 V!49293)) (EmptyCell!15684) )
))
(declare-datatypes ((array!83416 0))(
  ( (array!83417 (arr!40236 (Array (_ BitVec 32) ValueCell!15684)) (size!40777 (_ BitVec 32))) )
))
(declare-datatypes ((array!83418 0))(
  ( (array!83419 (arr!40237 (Array (_ BitVec 32) (_ BitVec 64))) (size!40778 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6132 0))(
  ( (LongMapFixedSize!6133 (defaultEntry!6712 Int) (mask!34483 (_ BitVec 32)) (extraKeys!6391 (_ BitVec 32)) (zeroValue!6497 V!49293) (minValue!6497 V!49293) (_size!3121 (_ BitVec 32)) (_keys!12124 array!83418) (_values!6735 array!83416) (_vacant!3121 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6132)

(declare-fun mapDefault!51225 () ValueCell!15684)

(assert (=> b!1273151 (= condMapEmpty!51225 (= (arr!40236 (_values!6735 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15684)) mapDefault!51225)))))

(declare-fun b!1273152 () Bool)

(declare-fun e!726320 () Bool)

(declare-datatypes ((List!28566 0))(
  ( (Nil!28563) (Cons!28562 (h!29771 (_ BitVec 64)) (t!42099 List!28566)) )
))
(declare-fun arrayNoDuplicates!0 (array!83418 (_ BitVec 32) List!28566) Bool)

(assert (=> b!1273152 (= e!726320 (not (arrayNoDuplicates!0 (_keys!12124 thiss!1559) #b00000000000000000000000000000000 Nil!28563)))))

(declare-fun mapNonEmpty!51225 () Bool)

(declare-fun tp!97652 () Bool)

(declare-fun e!726318 () Bool)

(assert (=> mapNonEmpty!51225 (= mapRes!51225 (and tp!97652 e!726318))))

(declare-fun mapValue!51225 () ValueCell!15684)

(declare-fun mapRest!51225 () (Array (_ BitVec 32) ValueCell!15684))

(declare-fun mapKey!51225 () (_ BitVec 32))

(assert (=> mapNonEmpty!51225 (= (arr!40236 (_values!6735 thiss!1559)) (store mapRest!51225 mapKey!51225 mapValue!51225))))

(declare-fun b!1273153 () Bool)

(declare-fun tp_is_empty!33075 () Bool)

(assert (=> b!1273153 (= e!726318 tp_is_empty!33075)))

(declare-fun b!1273154 () Bool)

(declare-fun res!846711 () Bool)

(assert (=> b!1273154 (=> (not res!846711) (not e!726320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83418 (_ BitVec 32)) Bool)

(assert (=> b!1273154 (= res!846711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12124 thiss!1559) (mask!34483 thiss!1559)))))

(declare-fun res!846714 () Bool)

(assert (=> start!107510 (=> (not res!846714) (not e!726320))))

(declare-fun valid!2301 (LongMapFixedSize!6132) Bool)

(assert (=> start!107510 (= res!846714 (valid!2301 thiss!1559))))

(assert (=> start!107510 e!726320))

(declare-fun e!726319 () Bool)

(assert (=> start!107510 e!726319))

(declare-fun b!1273155 () Bool)

(declare-fun res!846712 () Bool)

(assert (=> b!1273155 (=> (not res!846712) (not e!726320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273155 (= res!846712 (validMask!0 (mask!34483 thiss!1559)))))

(declare-fun array_inv!30597 (array!83418) Bool)

(declare-fun array_inv!30598 (array!83416) Bool)

(assert (=> b!1273156 (= e!726319 (and tp!97653 tp_is_empty!33075 (array_inv!30597 (_keys!12124 thiss!1559)) (array_inv!30598 (_values!6735 thiss!1559)) e!726323))))

(declare-fun mapIsEmpty!51225 () Bool)

(assert (=> mapIsEmpty!51225 mapRes!51225))

(declare-fun b!1273157 () Bool)

(declare-fun res!846713 () Bool)

(assert (=> b!1273157 (=> (not res!846713) (not e!726320))))

(assert (=> b!1273157 (= res!846713 (and (= (size!40777 (_values!6735 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34483 thiss!1559))) (= (size!40778 (_keys!12124 thiss!1559)) (size!40777 (_values!6735 thiss!1559))) (bvsge (mask!34483 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6391 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6391 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273158 () Bool)

(assert (=> b!1273158 (= e!726321 tp_is_empty!33075)))

(assert (= (and start!107510 res!846714) b!1273155))

(assert (= (and b!1273155 res!846712) b!1273157))

(assert (= (and b!1273157 res!846713) b!1273154))

(assert (= (and b!1273154 res!846711) b!1273152))

(assert (= (and b!1273151 condMapEmpty!51225) mapIsEmpty!51225))

(assert (= (and b!1273151 (not condMapEmpty!51225)) mapNonEmpty!51225))

(get-info :version)

(assert (= (and mapNonEmpty!51225 ((_ is ValueCellFull!15684) mapValue!51225)) b!1273153))

(assert (= (and b!1273151 ((_ is ValueCellFull!15684) mapDefault!51225)) b!1273158))

(assert (= b!1273156 b!1273151))

(assert (= start!107510 b!1273156))

(declare-fun m!1170479 () Bool)

(assert (=> start!107510 m!1170479))

(declare-fun m!1170481 () Bool)

(assert (=> b!1273156 m!1170481))

(declare-fun m!1170483 () Bool)

(assert (=> b!1273156 m!1170483))

(declare-fun m!1170485 () Bool)

(assert (=> b!1273155 m!1170485))

(declare-fun m!1170487 () Bool)

(assert (=> b!1273154 m!1170487))

(declare-fun m!1170489 () Bool)

(assert (=> b!1273152 m!1170489))

(declare-fun m!1170491 () Bool)

(assert (=> mapNonEmpty!51225 m!1170491))

(check-sat (not mapNonEmpty!51225) (not b!1273156) (not b!1273155) (not b!1273152) (not b_next!27705) tp_is_empty!33075 b_and!45761 (not b!1273154) (not start!107510))
(check-sat b_and!45761 (not b_next!27705))
(get-model)

(declare-fun b!1273193 () Bool)

(declare-fun e!726351 () Bool)

(declare-fun e!726352 () Bool)

(assert (=> b!1273193 (= e!726351 e!726352)))

(declare-fun res!846734 () Bool)

(assert (=> b!1273193 (=> (not res!846734) (not e!726352))))

(declare-fun e!726350 () Bool)

(assert (=> b!1273193 (= res!846734 (not e!726350))))

(declare-fun res!846733 () Bool)

(assert (=> b!1273193 (=> (not res!846733) (not e!726350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273193 (= res!846733 (validKeyInArray!0 (select (arr!40237 (_keys!12124 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!139957 () Bool)

(declare-fun res!846735 () Bool)

(assert (=> d!139957 (=> res!846735 e!726351)))

(assert (=> d!139957 (= res!846735 (bvsge #b00000000000000000000000000000000 (size!40778 (_keys!12124 thiss!1559))))))

(assert (=> d!139957 (= (arrayNoDuplicates!0 (_keys!12124 thiss!1559) #b00000000000000000000000000000000 Nil!28563) e!726351)))

(declare-fun b!1273194 () Bool)

(declare-fun contains!7673 (List!28566 (_ BitVec 64)) Bool)

(assert (=> b!1273194 (= e!726350 (contains!7673 Nil!28563 (select (arr!40237 (_keys!12124 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273195 () Bool)

(declare-fun e!726353 () Bool)

(declare-fun call!62588 () Bool)

(assert (=> b!1273195 (= e!726353 call!62588)))

(declare-fun b!1273196 () Bool)

(assert (=> b!1273196 (= e!726352 e!726353)))

(declare-fun c!123750 () Bool)

(assert (=> b!1273196 (= c!123750 (validKeyInArray!0 (select (arr!40237 (_keys!12124 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62585 () Bool)

(assert (=> bm!62585 (= call!62588 (arrayNoDuplicates!0 (_keys!12124 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123750 (Cons!28562 (select (arr!40237 (_keys!12124 thiss!1559)) #b00000000000000000000000000000000) Nil!28563) Nil!28563)))))

(declare-fun b!1273197 () Bool)

(assert (=> b!1273197 (= e!726353 call!62588)))

(assert (= (and d!139957 (not res!846735)) b!1273193))

(assert (= (and b!1273193 res!846733) b!1273194))

(assert (= (and b!1273193 res!846734) b!1273196))

(assert (= (and b!1273196 c!123750) b!1273195))

(assert (= (and b!1273196 (not c!123750)) b!1273197))

(assert (= (or b!1273195 b!1273197) bm!62585))

(declare-fun m!1170507 () Bool)

(assert (=> b!1273193 m!1170507))

(assert (=> b!1273193 m!1170507))

(declare-fun m!1170509 () Bool)

(assert (=> b!1273193 m!1170509))

(assert (=> b!1273194 m!1170507))

(assert (=> b!1273194 m!1170507))

(declare-fun m!1170511 () Bool)

(assert (=> b!1273194 m!1170511))

(assert (=> b!1273196 m!1170507))

(assert (=> b!1273196 m!1170507))

(assert (=> b!1273196 m!1170509))

(assert (=> bm!62585 m!1170507))

(declare-fun m!1170513 () Bool)

(assert (=> bm!62585 m!1170513))

(assert (=> b!1273152 d!139957))

(declare-fun d!139959 () Bool)

(assert (=> d!139959 (= (array_inv!30597 (_keys!12124 thiss!1559)) (bvsge (size!40778 (_keys!12124 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273156 d!139959))

(declare-fun d!139961 () Bool)

(assert (=> d!139961 (= (array_inv!30598 (_values!6735 thiss!1559)) (bvsge (size!40777 (_values!6735 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273156 d!139961))

(declare-fun d!139963 () Bool)

(assert (=> d!139963 (= (validMask!0 (mask!34483 thiss!1559)) (and (or (= (mask!34483 thiss!1559) #b00000000000000000000000000000111) (= (mask!34483 thiss!1559) #b00000000000000000000000000001111) (= (mask!34483 thiss!1559) #b00000000000000000000000000011111) (= (mask!34483 thiss!1559) #b00000000000000000000000000111111) (= (mask!34483 thiss!1559) #b00000000000000000000000001111111) (= (mask!34483 thiss!1559) #b00000000000000000000000011111111) (= (mask!34483 thiss!1559) #b00000000000000000000000111111111) (= (mask!34483 thiss!1559) #b00000000000000000000001111111111) (= (mask!34483 thiss!1559) #b00000000000000000000011111111111) (= (mask!34483 thiss!1559) #b00000000000000000000111111111111) (= (mask!34483 thiss!1559) #b00000000000000000001111111111111) (= (mask!34483 thiss!1559) #b00000000000000000011111111111111) (= (mask!34483 thiss!1559) #b00000000000000000111111111111111) (= (mask!34483 thiss!1559) #b00000000000000001111111111111111) (= (mask!34483 thiss!1559) #b00000000000000011111111111111111) (= (mask!34483 thiss!1559) #b00000000000000111111111111111111) (= (mask!34483 thiss!1559) #b00000000000001111111111111111111) (= (mask!34483 thiss!1559) #b00000000000011111111111111111111) (= (mask!34483 thiss!1559) #b00000000000111111111111111111111) (= (mask!34483 thiss!1559) #b00000000001111111111111111111111) (= (mask!34483 thiss!1559) #b00000000011111111111111111111111) (= (mask!34483 thiss!1559) #b00000000111111111111111111111111) (= (mask!34483 thiss!1559) #b00000001111111111111111111111111) (= (mask!34483 thiss!1559) #b00000011111111111111111111111111) (= (mask!34483 thiss!1559) #b00000111111111111111111111111111) (= (mask!34483 thiss!1559) #b00001111111111111111111111111111) (= (mask!34483 thiss!1559) #b00011111111111111111111111111111) (= (mask!34483 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34483 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1273155 d!139963))

(declare-fun b!1273206 () Bool)

(declare-fun e!726362 () Bool)

(declare-fun e!726360 () Bool)

(assert (=> b!1273206 (= e!726362 e!726360)))

(declare-fun lt!575121 () (_ BitVec 64))

(assert (=> b!1273206 (= lt!575121 (select (arr!40237 (_keys!12124 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42330 0))(
  ( (Unit!42331) )
))
(declare-fun lt!575122 () Unit!42330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83418 (_ BitVec 64) (_ BitVec 32)) Unit!42330)

(assert (=> b!1273206 (= lt!575122 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12124 thiss!1559) lt!575121 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273206 (arrayContainsKey!0 (_keys!12124 thiss!1559) lt!575121 #b00000000000000000000000000000000)))

(declare-fun lt!575120 () Unit!42330)

(assert (=> b!1273206 (= lt!575120 lt!575122)))

(declare-fun res!846740 () Bool)

(declare-datatypes ((SeekEntryResult!9995 0))(
  ( (MissingZero!9995 (index!42351 (_ BitVec 32))) (Found!9995 (index!42352 (_ BitVec 32))) (Intermediate!9995 (undefined!10807 Bool) (index!42353 (_ BitVec 32)) (x!112552 (_ BitVec 32))) (Undefined!9995) (MissingVacant!9995 (index!42354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83418 (_ BitVec 32)) SeekEntryResult!9995)

(assert (=> b!1273206 (= res!846740 (= (seekEntryOrOpen!0 (select (arr!40237 (_keys!12124 thiss!1559)) #b00000000000000000000000000000000) (_keys!12124 thiss!1559) (mask!34483 thiss!1559)) (Found!9995 #b00000000000000000000000000000000)))))

(assert (=> b!1273206 (=> (not res!846740) (not e!726360))))

(declare-fun b!1273207 () Bool)

(declare-fun call!62591 () Bool)

(assert (=> b!1273207 (= e!726362 call!62591)))

(declare-fun b!1273208 () Bool)

(declare-fun e!726361 () Bool)

(assert (=> b!1273208 (= e!726361 e!726362)))

(declare-fun c!123753 () Bool)

(assert (=> b!1273208 (= c!123753 (validKeyInArray!0 (select (arr!40237 (_keys!12124 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273209 () Bool)

(assert (=> b!1273209 (= e!726360 call!62591)))

(declare-fun d!139965 () Bool)

(declare-fun res!846741 () Bool)

(assert (=> d!139965 (=> res!846741 e!726361)))

(assert (=> d!139965 (= res!846741 (bvsge #b00000000000000000000000000000000 (size!40778 (_keys!12124 thiss!1559))))))

(assert (=> d!139965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12124 thiss!1559) (mask!34483 thiss!1559)) e!726361)))

(declare-fun bm!62588 () Bool)

(assert (=> bm!62588 (= call!62591 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12124 thiss!1559) (mask!34483 thiss!1559)))))

(assert (= (and d!139965 (not res!846741)) b!1273208))

(assert (= (and b!1273208 c!123753) b!1273206))

(assert (= (and b!1273208 (not c!123753)) b!1273207))

(assert (= (and b!1273206 res!846740) b!1273209))

(assert (= (or b!1273209 b!1273207) bm!62588))

(assert (=> b!1273206 m!1170507))

(declare-fun m!1170515 () Bool)

(assert (=> b!1273206 m!1170515))

(declare-fun m!1170517 () Bool)

(assert (=> b!1273206 m!1170517))

(assert (=> b!1273206 m!1170507))

(declare-fun m!1170519 () Bool)

(assert (=> b!1273206 m!1170519))

(assert (=> b!1273208 m!1170507))

(assert (=> b!1273208 m!1170507))

(assert (=> b!1273208 m!1170509))

(declare-fun m!1170521 () Bool)

(assert (=> bm!62588 m!1170521))

(assert (=> b!1273154 d!139965))

(declare-fun d!139967 () Bool)

(declare-fun res!846748 () Bool)

(declare-fun e!726365 () Bool)

(assert (=> d!139967 (=> (not res!846748) (not e!726365))))

(declare-fun simpleValid!462 (LongMapFixedSize!6132) Bool)

(assert (=> d!139967 (= res!846748 (simpleValid!462 thiss!1559))))

(assert (=> d!139967 (= (valid!2301 thiss!1559) e!726365)))

(declare-fun b!1273216 () Bool)

(declare-fun res!846749 () Bool)

(assert (=> b!1273216 (=> (not res!846749) (not e!726365))))

(declare-fun arrayCountValidKeys!0 (array!83418 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273216 (= res!846749 (= (arrayCountValidKeys!0 (_keys!12124 thiss!1559) #b00000000000000000000000000000000 (size!40778 (_keys!12124 thiss!1559))) (_size!3121 thiss!1559)))))

(declare-fun b!1273217 () Bool)

(declare-fun res!846750 () Bool)

(assert (=> b!1273217 (=> (not res!846750) (not e!726365))))

(assert (=> b!1273217 (= res!846750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12124 thiss!1559) (mask!34483 thiss!1559)))))

(declare-fun b!1273218 () Bool)

(assert (=> b!1273218 (= e!726365 (arrayNoDuplicates!0 (_keys!12124 thiss!1559) #b00000000000000000000000000000000 Nil!28563))))

(assert (= (and d!139967 res!846748) b!1273216))

(assert (= (and b!1273216 res!846749) b!1273217))

(assert (= (and b!1273217 res!846750) b!1273218))

(declare-fun m!1170523 () Bool)

(assert (=> d!139967 m!1170523))

(declare-fun m!1170525 () Bool)

(assert (=> b!1273216 m!1170525))

(assert (=> b!1273217 m!1170487))

(assert (=> b!1273218 m!1170489))

(assert (=> start!107510 d!139967))

(declare-fun mapIsEmpty!51231 () Bool)

(declare-fun mapRes!51231 () Bool)

(assert (=> mapIsEmpty!51231 mapRes!51231))

(declare-fun condMapEmpty!51231 () Bool)

(declare-fun mapDefault!51231 () ValueCell!15684)

(assert (=> mapNonEmpty!51225 (= condMapEmpty!51231 (= mapRest!51225 ((as const (Array (_ BitVec 32) ValueCell!15684)) mapDefault!51231)))))

(declare-fun e!726370 () Bool)

(assert (=> mapNonEmpty!51225 (= tp!97652 (and e!726370 mapRes!51231))))

(declare-fun mapNonEmpty!51231 () Bool)

(declare-fun tp!97662 () Bool)

(declare-fun e!726371 () Bool)

(assert (=> mapNonEmpty!51231 (= mapRes!51231 (and tp!97662 e!726371))))

(declare-fun mapValue!51231 () ValueCell!15684)

(declare-fun mapKey!51231 () (_ BitVec 32))

(declare-fun mapRest!51231 () (Array (_ BitVec 32) ValueCell!15684))

(assert (=> mapNonEmpty!51231 (= mapRest!51225 (store mapRest!51231 mapKey!51231 mapValue!51231))))

(declare-fun b!1273226 () Bool)

(assert (=> b!1273226 (= e!726370 tp_is_empty!33075)))

(declare-fun b!1273225 () Bool)

(assert (=> b!1273225 (= e!726371 tp_is_empty!33075)))

(assert (= (and mapNonEmpty!51225 condMapEmpty!51231) mapIsEmpty!51231))

(assert (= (and mapNonEmpty!51225 (not condMapEmpty!51231)) mapNonEmpty!51231))

(assert (= (and mapNonEmpty!51231 ((_ is ValueCellFull!15684) mapValue!51231)) b!1273225))

(assert (= (and mapNonEmpty!51225 ((_ is ValueCellFull!15684) mapDefault!51231)) b!1273226))

(declare-fun m!1170527 () Bool)

(assert (=> mapNonEmpty!51231 m!1170527))

(check-sat (not bm!62585) (not b!1273193) (not b!1273218) (not b!1273208) (not d!139967) (not b!1273196) (not b!1273194) tp_is_empty!33075 (not mapNonEmpty!51231) b_and!45761 (not b!1273206) (not b!1273217) (not b_next!27705) (not b!1273216) (not bm!62588))
(check-sat b_and!45761 (not b_next!27705))
