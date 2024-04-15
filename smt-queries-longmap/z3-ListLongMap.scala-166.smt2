; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3168 () Bool)

(assert start!3168)

(declare-fun b!19284 () Bool)

(declare-fun b_free!673 () Bool)

(declare-fun b_next!673 () Bool)

(assert (=> b!19284 (= b_free!673 (not b_next!673))))

(declare-fun tp!3227 () Bool)

(declare-fun b_and!1327 () Bool)

(assert (=> b!19284 (= tp!3227 b_and!1327)))

(declare-fun b!19277 () Bool)

(declare-fun e!12420 () Bool)

(declare-fun e!12419 () Bool)

(assert (=> b!19277 (= e!12420 e!12419)))

(declare-fun mapIsEmpty!857 () Bool)

(declare-fun mapRes!857 () Bool)

(assert (=> mapIsEmpty!857 mapRes!857))

(declare-fun b!19278 () Bool)

(declare-fun e!12426 () Bool)

(declare-fun tp_is_empty!937 () Bool)

(assert (=> b!19278 (= e!12426 tp_is_empty!937)))

(declare-fun b!19279 () Bool)

(declare-fun e!12421 () Bool)

(assert (=> b!19279 (= e!12421 tp_is_empty!937)))

(declare-fun b!19280 () Bool)

(declare-fun res!13126 () Bool)

(declare-fun e!12424 () Bool)

(assert (=> b!19280 (=> (not res!13126) (not e!12424))))

(declare-datatypes ((V!1075 0))(
  ( (V!1076 (val!495 Int)) )
))
(declare-datatypes ((ValueCell!269 0))(
  ( (ValueCellFull!269 (v!1505 V!1075)) (EmptyCell!269) )
))
(declare-datatypes ((array!1069 0))(
  ( (array!1070 (arr!512 (Array (_ BitVec 32) ValueCell!269)) (size!604 (_ BitVec 32))) )
))
(declare-datatypes ((array!1071 0))(
  ( (array!1072 (arr!513 (Array (_ BitVec 32) (_ BitVec 64))) (size!605 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!124 0))(
  ( (LongMapFixedSize!125 (defaultEntry!1681 Int) (mask!4628 (_ BitVec 32)) (extraKeys!1591 (_ BitVec 32)) (zeroValue!1615 V!1075) (minValue!1615 V!1075) (_size!95 (_ BitVec 32)) (_keys!3108 array!1071) (_values!1677 array!1069) (_vacant!95 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!124 0))(
  ( (Cell!125 (v!1506 LongMapFixedSize!124)) )
))
(declare-datatypes ((LongMap!124 0))(
  ( (LongMap!125 (underlying!73 Cell!124)) )
))
(declare-fun thiss!938 () LongMap!124)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19280 (= res!13126 (validMask!0 (mask!4628 (v!1506 (underlying!73 thiss!938)))))))

(declare-fun mapNonEmpty!857 () Bool)

(declare-fun tp!3226 () Bool)

(assert (=> mapNonEmpty!857 (= mapRes!857 (and tp!3226 e!12426))))

(declare-fun mapKey!857 () (_ BitVec 32))

(declare-fun mapRest!857 () (Array (_ BitVec 32) ValueCell!269))

(declare-fun mapValue!857 () ValueCell!269)

(assert (=> mapNonEmpty!857 (= (arr!512 (_values!1677 (v!1506 (underlying!73 thiss!938)))) (store mapRest!857 mapKey!857 mapValue!857))))

(declare-fun b!19281 () Bool)

(declare-fun e!12423 () Bool)

(assert (=> b!19281 (= e!12423 (and e!12421 mapRes!857))))

(declare-fun condMapEmpty!857 () Bool)

(declare-fun mapDefault!857 () ValueCell!269)

(assert (=> b!19281 (= condMapEmpty!857 (= (arr!512 (_values!1677 (v!1506 (underlying!73 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!269)) mapDefault!857)))))

(declare-fun b!19282 () Bool)

(assert (=> b!19282 (= e!12424 (and (bvsge (_size!95 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!95 (v!1506 (underlying!73 thiss!938))) (bvadd #b00000000000000000000000000000001 (mask!4628 (v!1506 (underlying!73 thiss!938))))) (bvslt (_vacant!95 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000)))))

(declare-fun res!13127 () Bool)

(assert (=> start!3168 (=> (not res!13127) (not e!12424))))

(declare-fun valid!67 (LongMap!124) Bool)

(assert (=> start!3168 (= res!13127 (valid!67 thiss!938))))

(assert (=> start!3168 e!12424))

(declare-fun e!12422 () Bool)

(assert (=> start!3168 e!12422))

(declare-fun b!19283 () Bool)

(assert (=> b!19283 (= e!12422 e!12420)))

(declare-fun array_inv!363 (array!1071) Bool)

(declare-fun array_inv!364 (array!1069) Bool)

(assert (=> b!19284 (= e!12419 (and tp!3227 tp_is_empty!937 (array_inv!363 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) (array_inv!364 (_values!1677 (v!1506 (underlying!73 thiss!938)))) e!12423))))

(assert (= (and start!3168 res!13127) b!19280))

(assert (= (and b!19280 res!13126) b!19282))

(assert (= (and b!19281 condMapEmpty!857) mapIsEmpty!857))

(assert (= (and b!19281 (not condMapEmpty!857)) mapNonEmpty!857))

(get-info :version)

(assert (= (and mapNonEmpty!857 ((_ is ValueCellFull!269) mapValue!857)) b!19278))

(assert (= (and b!19281 ((_ is ValueCellFull!269) mapDefault!857)) b!19279))

(assert (= b!19284 b!19281))

(assert (= b!19277 b!19284))

(assert (= b!19283 b!19277))

(assert (= start!3168 b!19283))

(declare-fun m!13579 () Bool)

(assert (=> b!19280 m!13579))

(declare-fun m!13581 () Bool)

(assert (=> mapNonEmpty!857 m!13581))

(declare-fun m!13583 () Bool)

(assert (=> start!3168 m!13583))

(declare-fun m!13585 () Bool)

(assert (=> b!19284 m!13585))

(declare-fun m!13587 () Bool)

(assert (=> b!19284 m!13587))

(check-sat (not start!3168) (not b!19284) b_and!1327 tp_is_empty!937 (not mapNonEmpty!857) (not b!19280) (not b_next!673))
(check-sat b_and!1327 (not b_next!673))
(get-model)

(declare-fun d!3549 () Bool)

(assert (=> d!3549 (= (array_inv!363 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) (bvsge (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19284 d!3549))

(declare-fun d!3551 () Bool)

(assert (=> d!3551 (= (array_inv!364 (_values!1677 (v!1506 (underlying!73 thiss!938)))) (bvsge (size!604 (_values!1677 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19284 d!3551))

(declare-fun d!3553 () Bool)

(assert (=> d!3553 (= (validMask!0 (mask!4628 (v!1506 (underlying!73 thiss!938)))) (and (or (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000001111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000011111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000001111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000011111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000001111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000011111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000001111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000011111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000001111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000011111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000001111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000011111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000001111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000011111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000111111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000001111111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000011111111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000111111111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00001111111111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00011111111111111111111111111111) (= (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19280 d!3553))

(declare-fun d!3555 () Bool)

(declare-fun valid!70 (LongMapFixedSize!124) Bool)

(assert (=> d!3555 (= (valid!67 thiss!938) (valid!70 (v!1506 (underlying!73 thiss!938))))))

(declare-fun bs!868 () Bool)

(assert (= bs!868 d!3555))

(declare-fun m!13609 () Bool)

(assert (=> bs!868 m!13609))

(assert (=> start!3168 d!3555))

(declare-fun mapNonEmpty!866 () Bool)

(declare-fun mapRes!866 () Bool)

(declare-fun tp!3242 () Bool)

(declare-fun e!12479 () Bool)

(assert (=> mapNonEmpty!866 (= mapRes!866 (and tp!3242 e!12479))))

(declare-fun mapRest!866 () (Array (_ BitVec 32) ValueCell!269))

(declare-fun mapKey!866 () (_ BitVec 32))

(declare-fun mapValue!866 () ValueCell!269)

(assert (=> mapNonEmpty!866 (= mapRest!857 (store mapRest!866 mapKey!866 mapValue!866))))

(declare-fun condMapEmpty!866 () Bool)

(declare-fun mapDefault!866 () ValueCell!269)

(assert (=> mapNonEmpty!857 (= condMapEmpty!866 (= mapRest!857 ((as const (Array (_ BitVec 32) ValueCell!269)) mapDefault!866)))))

(declare-fun e!12480 () Bool)

(assert (=> mapNonEmpty!857 (= tp!3226 (and e!12480 mapRes!866))))

(declare-fun b!19339 () Bool)

(assert (=> b!19339 (= e!12479 tp_is_empty!937)))

(declare-fun mapIsEmpty!866 () Bool)

(assert (=> mapIsEmpty!866 mapRes!866))

(declare-fun b!19340 () Bool)

(assert (=> b!19340 (= e!12480 tp_is_empty!937)))

(assert (= (and mapNonEmpty!857 condMapEmpty!866) mapIsEmpty!866))

(assert (= (and mapNonEmpty!857 (not condMapEmpty!866)) mapNonEmpty!866))

(assert (= (and mapNonEmpty!866 ((_ is ValueCellFull!269) mapValue!866)) b!19339))

(assert (= (and mapNonEmpty!857 ((_ is ValueCellFull!269) mapDefault!866)) b!19340))

(declare-fun m!13611 () Bool)

(assert (=> mapNonEmpty!866 m!13611))

(check-sat b_and!1327 tp_is_empty!937 (not d!3555) (not mapNonEmpty!866) (not b_next!673))
(check-sat b_and!1327 (not b_next!673))
(get-model)

(declare-fun d!3557 () Bool)

(declare-fun res!13146 () Bool)

(declare-fun e!12483 () Bool)

(assert (=> d!3557 (=> (not res!13146) (not e!12483))))

(declare-fun simpleValid!12 (LongMapFixedSize!124) Bool)

(assert (=> d!3557 (= res!13146 (simpleValid!12 (v!1506 (underlying!73 thiss!938))))))

(assert (=> d!3557 (= (valid!70 (v!1506 (underlying!73 thiss!938))) e!12483)))

(declare-fun b!19347 () Bool)

(declare-fun res!13147 () Bool)

(assert (=> b!19347 (=> (not res!13147) (not e!12483))))

(declare-fun arrayCountValidKeys!0 (array!1071 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19347 (= res!13147 (= (arrayCountValidKeys!0 (_keys!3108 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938))))) (_size!95 (v!1506 (underlying!73 thiss!938)))))))

(declare-fun b!19348 () Bool)

(declare-fun res!13148 () Bool)

(assert (=> b!19348 (=> (not res!13148) (not e!12483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1071 (_ BitVec 32)) Bool)

(assert (=> b!19348 (= res!13148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3108 (v!1506 (underlying!73 thiss!938))) (mask!4628 (v!1506 (underlying!73 thiss!938)))))))

(declare-fun b!19349 () Bool)

(declare-datatypes ((List!542 0))(
  ( (Nil!539) (Cons!538 (h!1104 (_ BitVec 64)) (t!3178 List!542)) )
))
(declare-fun arrayNoDuplicates!0 (array!1071 (_ BitVec 32) List!542) Bool)

(assert (=> b!19349 (= e!12483 (arrayNoDuplicates!0 (_keys!3108 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000 Nil!539))))

(assert (= (and d!3557 res!13146) b!19347))

(assert (= (and b!19347 res!13147) b!19348))

(assert (= (and b!19348 res!13148) b!19349))

(declare-fun m!13613 () Bool)

(assert (=> d!3557 m!13613))

(declare-fun m!13615 () Bool)

(assert (=> b!19347 m!13615))

(declare-fun m!13617 () Bool)

(assert (=> b!19348 m!13617))

(declare-fun m!13619 () Bool)

(assert (=> b!19349 m!13619))

(assert (=> d!3555 d!3557))

(declare-fun mapNonEmpty!867 () Bool)

(declare-fun mapRes!867 () Bool)

(declare-fun tp!3243 () Bool)

(declare-fun e!12484 () Bool)

(assert (=> mapNonEmpty!867 (= mapRes!867 (and tp!3243 e!12484))))

(declare-fun mapRest!867 () (Array (_ BitVec 32) ValueCell!269))

(declare-fun mapKey!867 () (_ BitVec 32))

(declare-fun mapValue!867 () ValueCell!269)

(assert (=> mapNonEmpty!867 (= mapRest!866 (store mapRest!867 mapKey!867 mapValue!867))))

(declare-fun condMapEmpty!867 () Bool)

(declare-fun mapDefault!867 () ValueCell!269)

(assert (=> mapNonEmpty!866 (= condMapEmpty!867 (= mapRest!866 ((as const (Array (_ BitVec 32) ValueCell!269)) mapDefault!867)))))

(declare-fun e!12485 () Bool)

(assert (=> mapNonEmpty!866 (= tp!3242 (and e!12485 mapRes!867))))

(declare-fun b!19350 () Bool)

(assert (=> b!19350 (= e!12484 tp_is_empty!937)))

(declare-fun mapIsEmpty!867 () Bool)

(assert (=> mapIsEmpty!867 mapRes!867))

(declare-fun b!19351 () Bool)

(assert (=> b!19351 (= e!12485 tp_is_empty!937)))

(assert (= (and mapNonEmpty!866 condMapEmpty!867) mapIsEmpty!867))

(assert (= (and mapNonEmpty!866 (not condMapEmpty!867)) mapNonEmpty!867))

(assert (= (and mapNonEmpty!867 ((_ is ValueCellFull!269) mapValue!867)) b!19350))

(assert (= (and mapNonEmpty!866 ((_ is ValueCellFull!269) mapDefault!867)) b!19351))

(declare-fun m!13621 () Bool)

(assert (=> mapNonEmpty!867 m!13621))

(check-sat b_and!1327 tp_is_empty!937 (not d!3557) (not b!19348) (not b_next!673) (not b!19347) (not mapNonEmpty!867) (not b!19349))
(check-sat b_and!1327 (not b_next!673))
(get-model)

(declare-fun b!19362 () Bool)

(declare-fun res!13159 () Bool)

(declare-fun e!12488 () Bool)

(assert (=> b!19362 (=> (not res!13159) (not e!12488))))

(declare-fun size!610 (LongMapFixedSize!124) (_ BitVec 32))

(assert (=> b!19362 (= res!13159 (= (size!610 (v!1506 (underlying!73 thiss!938))) (bvadd (_size!95 (v!1506 (underlying!73 thiss!938))) (bvsdiv (bvadd (extraKeys!1591 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!19363 () Bool)

(assert (=> b!19363 (= e!12488 (and (bvsge (extraKeys!1591 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1591 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!95 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000)))))

(declare-fun b!19361 () Bool)

(declare-fun res!13157 () Bool)

(assert (=> b!19361 (=> (not res!13157) (not e!12488))))

(assert (=> b!19361 (= res!13157 (bvsge (size!610 (v!1506 (underlying!73 thiss!938))) (_size!95 (v!1506 (underlying!73 thiss!938)))))))

(declare-fun b!19360 () Bool)

(declare-fun res!13158 () Bool)

(assert (=> b!19360 (=> (not res!13158) (not e!12488))))

(assert (=> b!19360 (= res!13158 (and (= (size!604 (_values!1677 (v!1506 (underlying!73 thiss!938)))) (bvadd (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000001)) (= (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) (size!604 (_values!1677 (v!1506 (underlying!73 thiss!938))))) (bvsge (_size!95 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!95 (v!1506 (underlying!73 thiss!938))) (bvadd (mask!4628 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun d!3559 () Bool)

(declare-fun res!13160 () Bool)

(assert (=> d!3559 (=> (not res!13160) (not e!12488))))

(assert (=> d!3559 (= res!13160 (validMask!0 (mask!4628 (v!1506 (underlying!73 thiss!938)))))))

(assert (=> d!3559 (= (simpleValid!12 (v!1506 (underlying!73 thiss!938))) e!12488)))

(assert (= (and d!3559 res!13160) b!19360))

(assert (= (and b!19360 res!13158) b!19361))

(assert (= (and b!19361 res!13157) b!19362))

(assert (= (and b!19362 res!13159) b!19363))

(declare-fun m!13623 () Bool)

(assert (=> b!19362 m!13623))

(assert (=> b!19361 m!13623))

(assert (=> d!3559 m!13579))

(assert (=> d!3557 d!3559))

(declare-fun b!19372 () Bool)

(declare-fun e!12494 () (_ BitVec 32))

(declare-fun e!12493 () (_ BitVec 32))

(assert (=> b!19372 (= e!12494 e!12493)))

(declare-fun c!2059 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19372 (= c!2059 (validKeyInArray!0 (select (arr!513 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19373 () Bool)

(declare-fun call!898 () (_ BitVec 32))

(assert (=> b!19373 (= e!12493 (bvadd #b00000000000000000000000000000001 call!898))))

(declare-fun b!19374 () Bool)

(assert (=> b!19374 (= e!12494 #b00000000000000000000000000000000)))

(declare-fun d!3561 () Bool)

(declare-fun lt!5411 () (_ BitVec 32))

(assert (=> d!3561 (and (bvsge lt!5411 #b00000000000000000000000000000000) (bvsle lt!5411 (bvsub (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (=> d!3561 (= lt!5411 e!12494)))

(declare-fun c!2058 () Bool)

(assert (=> d!3561 (= c!2058 (bvsge #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938))))))))

(assert (=> d!3561 (and (bvsle #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938))))))))

(assert (=> d!3561 (= (arrayCountValidKeys!0 (_keys!3108 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938))))) lt!5411)))

(declare-fun bm!895 () Bool)

(assert (=> bm!895 (= call!898 (arrayCountValidKeys!0 (_keys!3108 (v!1506 (underlying!73 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938))))))))

(declare-fun b!19375 () Bool)

(assert (=> b!19375 (= e!12493 call!898)))

(assert (= (and d!3561 c!2058) b!19374))

(assert (= (and d!3561 (not c!2058)) b!19372))

(assert (= (and b!19372 c!2059) b!19373))

(assert (= (and b!19372 (not c!2059)) b!19375))

(assert (= (or b!19373 b!19375) bm!895))

(declare-fun m!13625 () Bool)

(assert (=> b!19372 m!13625))

(assert (=> b!19372 m!13625))

(declare-fun m!13627 () Bool)

(assert (=> b!19372 m!13627))

(declare-fun m!13629 () Bool)

(assert (=> bm!895 m!13629))

(assert (=> b!19347 d!3561))

(declare-fun bm!898 () Bool)

(declare-fun call!901 () Bool)

(assert (=> bm!898 (= call!901 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3108 (v!1506 (underlying!73 thiss!938))) (mask!4628 (v!1506 (underlying!73 thiss!938)))))))

(declare-fun d!3563 () Bool)

(declare-fun res!13166 () Bool)

(declare-fun e!12501 () Bool)

(assert (=> d!3563 (=> res!13166 e!12501)))

(assert (=> d!3563 (= res!13166 (bvsge #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938))))))))

(assert (=> d!3563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3108 (v!1506 (underlying!73 thiss!938))) (mask!4628 (v!1506 (underlying!73 thiss!938)))) e!12501)))

(declare-fun b!19384 () Bool)

(declare-fun e!12503 () Bool)

(assert (=> b!19384 (= e!12501 e!12503)))

(declare-fun c!2062 () Bool)

(assert (=> b!19384 (= c!2062 (validKeyInArray!0 (select (arr!513 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19385 () Bool)

(declare-fun e!12502 () Bool)

(assert (=> b!19385 (= e!12503 e!12502)))

(declare-fun lt!5419 () (_ BitVec 64))

(assert (=> b!19385 (= lt!5419 (select (arr!513 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!389 0))(
  ( (Unit!390) )
))
(declare-fun lt!5418 () Unit!389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1071 (_ BitVec 64) (_ BitVec 32)) Unit!389)

(assert (=> b!19385 (= lt!5418 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3108 (v!1506 (underlying!73 thiss!938))) lt!5419 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19385 (arrayContainsKey!0 (_keys!3108 (v!1506 (underlying!73 thiss!938))) lt!5419 #b00000000000000000000000000000000)))

(declare-fun lt!5420 () Unit!389)

(assert (=> b!19385 (= lt!5420 lt!5418)))

(declare-fun res!13165 () Bool)

(declare-datatypes ((SeekEntryResult!47 0))(
  ( (MissingZero!47 (index!2308 (_ BitVec 32))) (Found!47 (index!2309 (_ BitVec 32))) (Intermediate!47 (undefined!859 Bool) (index!2310 (_ BitVec 32)) (x!4758 (_ BitVec 32))) (Undefined!47) (MissingVacant!47 (index!2311 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1071 (_ BitVec 32)) SeekEntryResult!47)

(assert (=> b!19385 (= res!13165 (= (seekEntryOrOpen!0 (select (arr!513 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000) (_keys!3108 (v!1506 (underlying!73 thiss!938))) (mask!4628 (v!1506 (underlying!73 thiss!938)))) (Found!47 #b00000000000000000000000000000000)))))

(assert (=> b!19385 (=> (not res!13165) (not e!12502))))

(declare-fun b!19386 () Bool)

(assert (=> b!19386 (= e!12502 call!901)))

(declare-fun b!19387 () Bool)

(assert (=> b!19387 (= e!12503 call!901)))

(assert (= (and d!3563 (not res!13166)) b!19384))

(assert (= (and b!19384 c!2062) b!19385))

(assert (= (and b!19384 (not c!2062)) b!19387))

(assert (= (and b!19385 res!13165) b!19386))

(assert (= (or b!19386 b!19387) bm!898))

(declare-fun m!13631 () Bool)

(assert (=> bm!898 m!13631))

(assert (=> b!19384 m!13625))

(assert (=> b!19384 m!13625))

(assert (=> b!19384 m!13627))

(assert (=> b!19385 m!13625))

(declare-fun m!13633 () Bool)

(assert (=> b!19385 m!13633))

(declare-fun m!13635 () Bool)

(assert (=> b!19385 m!13635))

(assert (=> b!19385 m!13625))

(declare-fun m!13637 () Bool)

(assert (=> b!19385 m!13637))

(assert (=> b!19348 d!3563))

(declare-fun b!19399 () Bool)

(declare-fun e!12514 () Bool)

(declare-fun e!12515 () Bool)

(assert (=> b!19399 (= e!12514 e!12515)))

(declare-fun c!2065 () Bool)

(assert (=> b!19399 (= c!2065 (validKeyInArray!0 (select (arr!513 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun bm!901 () Bool)

(declare-fun call!904 () Bool)

(assert (=> bm!901 (= call!904 (arrayNoDuplicates!0 (_keys!3108 (v!1506 (underlying!73 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2065 (Cons!538 (select (arr!513 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000) Nil!539) Nil!539)))))

(declare-fun b!19400 () Bool)

(assert (=> b!19400 (= e!12515 call!904)))

(declare-fun b!19401 () Bool)

(declare-fun e!12513 () Bool)

(assert (=> b!19401 (= e!12513 e!12514)))

(declare-fun res!13175 () Bool)

(assert (=> b!19401 (=> (not res!13175) (not e!12514))))

(declare-fun e!12512 () Bool)

(assert (=> b!19401 (= res!13175 (not e!12512))))

(declare-fun res!13173 () Bool)

(assert (=> b!19401 (=> (not res!13173) (not e!12512))))

(assert (=> b!19401 (= res!13173 (validKeyInArray!0 (select (arr!513 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19402 () Bool)

(declare-fun contains!220 (List!542 (_ BitVec 64)) Bool)

(assert (=> b!19402 (= e!12512 (contains!220 Nil!539 (select (arr!513 (_keys!3108 (v!1506 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19398 () Bool)

(assert (=> b!19398 (= e!12515 call!904)))

(declare-fun d!3565 () Bool)

(declare-fun res!13174 () Bool)

(assert (=> d!3565 (=> res!13174 e!12513)))

(assert (=> d!3565 (= res!13174 (bvsge #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1506 (underlying!73 thiss!938))))))))

(assert (=> d!3565 (= (arrayNoDuplicates!0 (_keys!3108 (v!1506 (underlying!73 thiss!938))) #b00000000000000000000000000000000 Nil!539) e!12513)))

(assert (= (and d!3565 (not res!13174)) b!19401))

(assert (= (and b!19401 res!13173) b!19402))

(assert (= (and b!19401 res!13175) b!19399))

(assert (= (and b!19399 c!2065) b!19400))

(assert (= (and b!19399 (not c!2065)) b!19398))

(assert (= (or b!19400 b!19398) bm!901))

(assert (=> b!19399 m!13625))

(assert (=> b!19399 m!13625))

(assert (=> b!19399 m!13627))

(assert (=> bm!901 m!13625))

(declare-fun m!13639 () Bool)

(assert (=> bm!901 m!13639))

(assert (=> b!19401 m!13625))

(assert (=> b!19401 m!13625))

(assert (=> b!19401 m!13627))

(assert (=> b!19402 m!13625))

(assert (=> b!19402 m!13625))

(declare-fun m!13641 () Bool)

(assert (=> b!19402 m!13641))

(assert (=> b!19349 d!3565))

(declare-fun mapNonEmpty!868 () Bool)

(declare-fun mapRes!868 () Bool)

(declare-fun tp!3244 () Bool)

(declare-fun e!12516 () Bool)

(assert (=> mapNonEmpty!868 (= mapRes!868 (and tp!3244 e!12516))))

(declare-fun mapKey!868 () (_ BitVec 32))

(declare-fun mapValue!868 () ValueCell!269)

(declare-fun mapRest!868 () (Array (_ BitVec 32) ValueCell!269))

(assert (=> mapNonEmpty!868 (= mapRest!867 (store mapRest!868 mapKey!868 mapValue!868))))

(declare-fun condMapEmpty!868 () Bool)

(declare-fun mapDefault!868 () ValueCell!269)

(assert (=> mapNonEmpty!867 (= condMapEmpty!868 (= mapRest!867 ((as const (Array (_ BitVec 32) ValueCell!269)) mapDefault!868)))))

(declare-fun e!12517 () Bool)

(assert (=> mapNonEmpty!867 (= tp!3243 (and e!12517 mapRes!868))))

(declare-fun b!19403 () Bool)

(assert (=> b!19403 (= e!12516 tp_is_empty!937)))

(declare-fun mapIsEmpty!868 () Bool)

(assert (=> mapIsEmpty!868 mapRes!868))

(declare-fun b!19404 () Bool)

(assert (=> b!19404 (= e!12517 tp_is_empty!937)))

(assert (= (and mapNonEmpty!867 condMapEmpty!868) mapIsEmpty!868))

(assert (= (and mapNonEmpty!867 (not condMapEmpty!868)) mapNonEmpty!868))

(assert (= (and mapNonEmpty!868 ((_ is ValueCellFull!269) mapValue!868)) b!19403))

(assert (= (and mapNonEmpty!867 ((_ is ValueCellFull!269) mapDefault!868)) b!19404))

(declare-fun m!13643 () Bool)

(assert (=> mapNonEmpty!868 m!13643))

(check-sat b_and!1327 (not b!19361) (not b!19401) (not bm!895) (not b!19372) (not b!19385) (not bm!898) (not b_next!673) (not b!19399) (not b!19402) tp_is_empty!937 (not bm!901) (not b!19384) (not b!19362) (not d!3559) (not mapNonEmpty!868))
(check-sat b_and!1327 (not b_next!673))
