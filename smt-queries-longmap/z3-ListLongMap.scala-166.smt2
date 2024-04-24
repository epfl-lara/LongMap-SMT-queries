; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3174 () Bool)

(assert start!3174)

(declare-fun b!19298 () Bool)

(declare-fun b_free!673 () Bool)

(declare-fun b_next!673 () Bool)

(assert (=> b!19298 (= b_free!673 (not b_next!673))))

(declare-fun tp!3226 () Bool)

(declare-fun b_and!1327 () Bool)

(assert (=> b!19298 (= tp!3226 b_and!1327)))

(declare-fun b!19295 () Bool)

(declare-fun e!12434 () Bool)

(declare-datatypes ((V!1075 0))(
  ( (V!1076 (val!495 Int)) )
))
(declare-datatypes ((ValueCell!269 0))(
  ( (ValueCellFull!269 (v!1506 V!1075)) (EmptyCell!269) )
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
  ( (Cell!125 (v!1507 LongMapFixedSize!124)) )
))
(declare-datatypes ((LongMap!124 0))(
  ( (LongMap!125 (underlying!73 Cell!124)) )
))
(declare-fun thiss!938 () LongMap!124)

(assert (=> b!19295 (= e!12434 (and (bvsge (_size!95 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!95 (v!1507 (underlying!73 thiss!938))) (bvadd #b00000000000000000000000000000001 (mask!4628 (v!1507 (underlying!73 thiss!938))))) (bvslt (_vacant!95 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000)))))

(declare-fun res!13137 () Bool)

(assert (=> start!3174 (=> (not res!13137) (not e!12434))))

(declare-fun valid!69 (LongMap!124) Bool)

(assert (=> start!3174 (= res!13137 (valid!69 thiss!938))))

(assert (=> start!3174 e!12434))

(declare-fun e!12439 () Bool)

(assert (=> start!3174 e!12439))

(declare-fun b!19296 () Bool)

(declare-fun e!12437 () Bool)

(declare-fun e!12440 () Bool)

(declare-fun mapRes!857 () Bool)

(assert (=> b!19296 (= e!12437 (and e!12440 mapRes!857))))

(declare-fun condMapEmpty!857 () Bool)

(declare-fun mapDefault!857 () ValueCell!269)

(assert (=> b!19296 (= condMapEmpty!857 (= (arr!512 (_values!1677 (v!1507 (underlying!73 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!269)) mapDefault!857)))))

(declare-fun b!19297 () Bool)

(declare-fun e!12435 () Bool)

(assert (=> b!19297 (= e!12439 e!12435)))

(declare-fun mapNonEmpty!857 () Bool)

(declare-fun tp!3227 () Bool)

(declare-fun e!12438 () Bool)

(assert (=> mapNonEmpty!857 (= mapRes!857 (and tp!3227 e!12438))))

(declare-fun mapRest!857 () (Array (_ BitVec 32) ValueCell!269))

(declare-fun mapValue!857 () ValueCell!269)

(declare-fun mapKey!857 () (_ BitVec 32))

(assert (=> mapNonEmpty!857 (= (arr!512 (_values!1677 (v!1507 (underlying!73 thiss!938)))) (store mapRest!857 mapKey!857 mapValue!857))))

(declare-fun mapIsEmpty!857 () Bool)

(assert (=> mapIsEmpty!857 mapRes!857))

(declare-fun tp_is_empty!937 () Bool)

(declare-fun e!12436 () Bool)

(declare-fun array_inv!369 (array!1071) Bool)

(declare-fun array_inv!370 (array!1069) Bool)

(assert (=> b!19298 (= e!12436 (and tp!3226 tp_is_empty!937 (array_inv!369 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) (array_inv!370 (_values!1677 (v!1507 (underlying!73 thiss!938)))) e!12437))))

(declare-fun b!19299 () Bool)

(assert (=> b!19299 (= e!12438 tp_is_empty!937)))

(declare-fun b!19300 () Bool)

(declare-fun res!13136 () Bool)

(assert (=> b!19300 (=> (not res!13136) (not e!12434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19300 (= res!13136 (validMask!0 (mask!4628 (v!1507 (underlying!73 thiss!938)))))))

(declare-fun b!19301 () Bool)

(assert (=> b!19301 (= e!12435 e!12436)))

(declare-fun b!19302 () Bool)

(assert (=> b!19302 (= e!12440 tp_is_empty!937)))

(assert (= (and start!3174 res!13137) b!19300))

(assert (= (and b!19300 res!13136) b!19295))

(assert (= (and b!19296 condMapEmpty!857) mapIsEmpty!857))

(assert (= (and b!19296 (not condMapEmpty!857)) mapNonEmpty!857))

(get-info :version)

(assert (= (and mapNonEmpty!857 ((_ is ValueCellFull!269) mapValue!857)) b!19299))

(assert (= (and b!19296 ((_ is ValueCellFull!269) mapDefault!857)) b!19302))

(assert (= b!19298 b!19296))

(assert (= b!19301 b!19298))

(assert (= b!19297 b!19301))

(assert (= start!3174 b!19297))

(declare-fun m!13593 () Bool)

(assert (=> start!3174 m!13593))

(declare-fun m!13595 () Bool)

(assert (=> mapNonEmpty!857 m!13595))

(declare-fun m!13597 () Bool)

(assert (=> b!19298 m!13597))

(declare-fun m!13599 () Bool)

(assert (=> b!19298 m!13599))

(declare-fun m!13601 () Bool)

(assert (=> b!19300 m!13601))

(check-sat (not b!19300) tp_is_empty!937 b_and!1327 (not mapNonEmpty!857) (not b_next!673) (not b!19298) (not start!3174))
(check-sat b_and!1327 (not b_next!673))
(get-model)

(declare-fun d!3555 () Bool)

(declare-fun valid!71 (LongMapFixedSize!124) Bool)

(assert (=> d!3555 (= (valid!69 thiss!938) (valid!71 (v!1507 (underlying!73 thiss!938))))))

(declare-fun bs!868 () Bool)

(assert (= bs!868 d!3555))

(declare-fun m!13623 () Bool)

(assert (=> bs!868 m!13623))

(assert (=> start!3174 d!3555))

(declare-fun d!3557 () Bool)

(assert (=> d!3557 (= (array_inv!369 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) (bvsge (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19298 d!3557))

(declare-fun d!3559 () Bool)

(assert (=> d!3559 (= (array_inv!370 (_values!1677 (v!1507 (underlying!73 thiss!938)))) (bvsge (size!604 (_values!1677 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19298 d!3559))

(declare-fun d!3561 () Bool)

(assert (=> d!3561 (= (validMask!0 (mask!4628 (v!1507 (underlying!73 thiss!938)))) (and (or (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000001111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000011111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000001111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000011111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000001111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000011111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000001111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000011111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000001111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000011111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000001111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000011111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000001111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000011111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000111111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000001111111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000011111111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000111111111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00001111111111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00011111111111111111111111111111) (= (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19300 d!3561))

(declare-fun mapIsEmpty!866 () Bool)

(declare-fun mapRes!866 () Bool)

(assert (=> mapIsEmpty!866 mapRes!866))

(declare-fun condMapEmpty!866 () Bool)

(declare-fun mapDefault!866 () ValueCell!269)

(assert (=> mapNonEmpty!857 (= condMapEmpty!866 (= mapRest!857 ((as const (Array (_ BitVec 32) ValueCell!269)) mapDefault!866)))))

(declare-fun e!12494 () Bool)

(assert (=> mapNonEmpty!857 (= tp!3227 (and e!12494 mapRes!866))))

(declare-fun mapNonEmpty!866 () Bool)

(declare-fun tp!3242 () Bool)

(declare-fun e!12493 () Bool)

(assert (=> mapNonEmpty!866 (= mapRes!866 (and tp!3242 e!12493))))

(declare-fun mapValue!866 () ValueCell!269)

(declare-fun mapKey!866 () (_ BitVec 32))

(declare-fun mapRest!866 () (Array (_ BitVec 32) ValueCell!269))

(assert (=> mapNonEmpty!866 (= mapRest!857 (store mapRest!866 mapKey!866 mapValue!866))))

(declare-fun b!19357 () Bool)

(assert (=> b!19357 (= e!12493 tp_is_empty!937)))

(declare-fun b!19358 () Bool)

(assert (=> b!19358 (= e!12494 tp_is_empty!937)))

(assert (= (and mapNonEmpty!857 condMapEmpty!866) mapIsEmpty!866))

(assert (= (and mapNonEmpty!857 (not condMapEmpty!866)) mapNonEmpty!866))

(assert (= (and mapNonEmpty!866 ((_ is ValueCellFull!269) mapValue!866)) b!19357))

(assert (= (and mapNonEmpty!857 ((_ is ValueCellFull!269) mapDefault!866)) b!19358))

(declare-fun m!13625 () Bool)

(assert (=> mapNonEmpty!866 m!13625))

(check-sat tp_is_empty!937 (not d!3555) (not mapNonEmpty!866) b_and!1327 (not b_next!673))
(check-sat b_and!1327 (not b_next!673))
(get-model)

(declare-fun d!3563 () Bool)

(declare-fun res!13156 () Bool)

(declare-fun e!12497 () Bool)

(assert (=> d!3563 (=> (not res!13156) (not e!12497))))

(declare-fun simpleValid!12 (LongMapFixedSize!124) Bool)

(assert (=> d!3563 (= res!13156 (simpleValid!12 (v!1507 (underlying!73 thiss!938))))))

(assert (=> d!3563 (= (valid!71 (v!1507 (underlying!73 thiss!938))) e!12497)))

(declare-fun b!19365 () Bool)

(declare-fun res!13157 () Bool)

(assert (=> b!19365 (=> (not res!13157) (not e!12497))))

(declare-fun arrayCountValidKeys!0 (array!1071 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19365 (= res!13157 (= (arrayCountValidKeys!0 (_keys!3108 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938))))) (_size!95 (v!1507 (underlying!73 thiss!938)))))))

(declare-fun b!19366 () Bool)

(declare-fun res!13158 () Bool)

(assert (=> b!19366 (=> (not res!13158) (not e!12497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1071 (_ BitVec 32)) Bool)

(assert (=> b!19366 (= res!13158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3108 (v!1507 (underlying!73 thiss!938))) (mask!4628 (v!1507 (underlying!73 thiss!938)))))))

(declare-fun b!19367 () Bool)

(declare-datatypes ((List!543 0))(
  ( (Nil!540) (Cons!539 (h!1105 (_ BitVec 64)) (t!3180 List!543)) )
))
(declare-fun arrayNoDuplicates!0 (array!1071 (_ BitVec 32) List!543) Bool)

(assert (=> b!19367 (= e!12497 (arrayNoDuplicates!0 (_keys!3108 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000 Nil!540))))

(assert (= (and d!3563 res!13156) b!19365))

(assert (= (and b!19365 res!13157) b!19366))

(assert (= (and b!19366 res!13158) b!19367))

(declare-fun m!13627 () Bool)

(assert (=> d!3563 m!13627))

(declare-fun m!13629 () Bool)

(assert (=> b!19365 m!13629))

(declare-fun m!13631 () Bool)

(assert (=> b!19366 m!13631))

(declare-fun m!13633 () Bool)

(assert (=> b!19367 m!13633))

(assert (=> d!3555 d!3563))

(declare-fun mapIsEmpty!867 () Bool)

(declare-fun mapRes!867 () Bool)

(assert (=> mapIsEmpty!867 mapRes!867))

(declare-fun condMapEmpty!867 () Bool)

(declare-fun mapDefault!867 () ValueCell!269)

(assert (=> mapNonEmpty!866 (= condMapEmpty!867 (= mapRest!866 ((as const (Array (_ BitVec 32) ValueCell!269)) mapDefault!867)))))

(declare-fun e!12499 () Bool)

(assert (=> mapNonEmpty!866 (= tp!3242 (and e!12499 mapRes!867))))

(declare-fun mapNonEmpty!867 () Bool)

(declare-fun tp!3243 () Bool)

(declare-fun e!12498 () Bool)

(assert (=> mapNonEmpty!867 (= mapRes!867 (and tp!3243 e!12498))))

(declare-fun mapKey!867 () (_ BitVec 32))

(declare-fun mapRest!867 () (Array (_ BitVec 32) ValueCell!269))

(declare-fun mapValue!867 () ValueCell!269)

(assert (=> mapNonEmpty!867 (= mapRest!866 (store mapRest!867 mapKey!867 mapValue!867))))

(declare-fun b!19368 () Bool)

(assert (=> b!19368 (= e!12498 tp_is_empty!937)))

(declare-fun b!19369 () Bool)

(assert (=> b!19369 (= e!12499 tp_is_empty!937)))

(assert (= (and mapNonEmpty!866 condMapEmpty!867) mapIsEmpty!867))

(assert (= (and mapNonEmpty!866 (not condMapEmpty!867)) mapNonEmpty!867))

(assert (= (and mapNonEmpty!867 ((_ is ValueCellFull!269) mapValue!867)) b!19368))

(assert (= (and mapNonEmpty!866 ((_ is ValueCellFull!269) mapDefault!867)) b!19369))

(declare-fun m!13635 () Bool)

(assert (=> mapNonEmpty!867 m!13635))

(check-sat tp_is_empty!937 (not mapNonEmpty!867) (not b!19365) (not b!19367) (not d!3563) (not b!19366) b_and!1327 (not b_next!673))
(check-sat b_and!1327 (not b_next!673))
(get-model)

(declare-fun b!19381 () Bool)

(declare-fun e!12502 () Bool)

(assert (=> b!19381 (= e!12502 (and (bvsge (extraKeys!1591 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1591 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!95 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000)))))

(declare-fun b!19380 () Bool)

(declare-fun res!13170 () Bool)

(assert (=> b!19380 (=> (not res!13170) (not e!12502))))

(declare-fun size!610 (LongMapFixedSize!124) (_ BitVec 32))

(assert (=> b!19380 (= res!13170 (= (size!610 (v!1507 (underlying!73 thiss!938))) (bvadd (_size!95 (v!1507 (underlying!73 thiss!938))) (bvsdiv (bvadd (extraKeys!1591 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!19378 () Bool)

(declare-fun res!13168 () Bool)

(assert (=> b!19378 (=> (not res!13168) (not e!12502))))

(assert (=> b!19378 (= res!13168 (and (= (size!604 (_values!1677 (v!1507 (underlying!73 thiss!938)))) (bvadd (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000001)) (= (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) (size!604 (_values!1677 (v!1507 (underlying!73 thiss!938))))) (bvsge (_size!95 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!95 (v!1507 (underlying!73 thiss!938))) (bvadd (mask!4628 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun d!3565 () Bool)

(declare-fun res!13169 () Bool)

(assert (=> d!3565 (=> (not res!13169) (not e!12502))))

(assert (=> d!3565 (= res!13169 (validMask!0 (mask!4628 (v!1507 (underlying!73 thiss!938)))))))

(assert (=> d!3565 (= (simpleValid!12 (v!1507 (underlying!73 thiss!938))) e!12502)))

(declare-fun b!19379 () Bool)

(declare-fun res!13167 () Bool)

(assert (=> b!19379 (=> (not res!13167) (not e!12502))))

(assert (=> b!19379 (= res!13167 (bvsge (size!610 (v!1507 (underlying!73 thiss!938))) (_size!95 (v!1507 (underlying!73 thiss!938)))))))

(assert (= (and d!3565 res!13169) b!19378))

(assert (= (and b!19378 res!13168) b!19379))

(assert (= (and b!19379 res!13167) b!19380))

(assert (= (and b!19380 res!13170) b!19381))

(declare-fun m!13637 () Bool)

(assert (=> b!19380 m!13637))

(assert (=> d!3565 m!13601))

(assert (=> b!19379 m!13637))

(assert (=> d!3563 d!3565))

(declare-fun b!19390 () Bool)

(declare-fun e!12508 () (_ BitVec 32))

(declare-fun call!898 () (_ BitVec 32))

(assert (=> b!19390 (= e!12508 (bvadd #b00000000000000000000000000000001 call!898))))

(declare-fun d!3567 () Bool)

(declare-fun lt!5415 () (_ BitVec 32))

(assert (=> d!3567 (and (bvsge lt!5415 #b00000000000000000000000000000000) (bvsle lt!5415 (bvsub (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun e!12507 () (_ BitVec 32))

(assert (=> d!3567 (= lt!5415 e!12507)))

(declare-fun c!2063 () Bool)

(assert (=> d!3567 (= c!2063 (bvsge #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938))))))))

(assert (=> d!3567 (and (bvsle #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938))))))))

(assert (=> d!3567 (= (arrayCountValidKeys!0 (_keys!3108 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938))))) lt!5415)))

(declare-fun b!19391 () Bool)

(assert (=> b!19391 (= e!12507 e!12508)))

(declare-fun c!2062 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19391 (= c!2062 (validKeyInArray!0 (select (arr!513 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun bm!895 () Bool)

(assert (=> bm!895 (= call!898 (arrayCountValidKeys!0 (_keys!3108 (v!1507 (underlying!73 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938))))))))

(declare-fun b!19392 () Bool)

(assert (=> b!19392 (= e!12507 #b00000000000000000000000000000000)))

(declare-fun b!19393 () Bool)

(assert (=> b!19393 (= e!12508 call!898)))

(assert (= (and d!3567 c!2063) b!19392))

(assert (= (and d!3567 (not c!2063)) b!19391))

(assert (= (and b!19391 c!2062) b!19390))

(assert (= (and b!19391 (not c!2062)) b!19393))

(assert (= (or b!19390 b!19393) bm!895))

(declare-fun m!13639 () Bool)

(assert (=> b!19391 m!13639))

(assert (=> b!19391 m!13639))

(declare-fun m!13641 () Bool)

(assert (=> b!19391 m!13641))

(declare-fun m!13643 () Bool)

(assert (=> bm!895 m!13643))

(assert (=> b!19365 d!3567))

(declare-fun d!3569 () Bool)

(declare-fun res!13175 () Bool)

(declare-fun e!12516 () Bool)

(assert (=> d!3569 (=> res!13175 e!12516)))

(assert (=> d!3569 (= res!13175 (bvsge #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938))))))))

(assert (=> d!3569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3108 (v!1507 (underlying!73 thiss!938))) (mask!4628 (v!1507 (underlying!73 thiss!938)))) e!12516)))

(declare-fun b!19402 () Bool)

(declare-fun e!12517 () Bool)

(assert (=> b!19402 (= e!12516 e!12517)))

(declare-fun c!2066 () Bool)

(assert (=> b!19402 (= c!2066 (validKeyInArray!0 (select (arr!513 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19403 () Bool)

(declare-fun e!12515 () Bool)

(assert (=> b!19403 (= e!12517 e!12515)))

(declare-fun lt!5422 () (_ BitVec 64))

(assert (=> b!19403 (= lt!5422 (select (arr!513 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!392 0))(
  ( (Unit!393) )
))
(declare-fun lt!5424 () Unit!392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1071 (_ BitVec 64) (_ BitVec 32)) Unit!392)

(assert (=> b!19403 (= lt!5424 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3108 (v!1507 (underlying!73 thiss!938))) lt!5422 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19403 (arrayContainsKey!0 (_keys!3108 (v!1507 (underlying!73 thiss!938))) lt!5422 #b00000000000000000000000000000000)))

(declare-fun lt!5423 () Unit!392)

(assert (=> b!19403 (= lt!5423 lt!5424)))

(declare-fun res!13176 () Bool)

(declare-datatypes ((SeekEntryResult!46 0))(
  ( (MissingZero!46 (index!2304 (_ BitVec 32))) (Found!46 (index!2305 (_ BitVec 32))) (Intermediate!46 (undefined!858 Bool) (index!2306 (_ BitVec 32)) (x!4757 (_ BitVec 32))) (Undefined!46) (MissingVacant!46 (index!2307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1071 (_ BitVec 32)) SeekEntryResult!46)

(assert (=> b!19403 (= res!13176 (= (seekEntryOrOpen!0 (select (arr!513 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000) (_keys!3108 (v!1507 (underlying!73 thiss!938))) (mask!4628 (v!1507 (underlying!73 thiss!938)))) (Found!46 #b00000000000000000000000000000000)))))

(assert (=> b!19403 (=> (not res!13176) (not e!12515))))

(declare-fun b!19404 () Bool)

(declare-fun call!901 () Bool)

(assert (=> b!19404 (= e!12517 call!901)))

(declare-fun bm!898 () Bool)

(assert (=> bm!898 (= call!901 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3108 (v!1507 (underlying!73 thiss!938))) (mask!4628 (v!1507 (underlying!73 thiss!938)))))))

(declare-fun b!19405 () Bool)

(assert (=> b!19405 (= e!12515 call!901)))

(assert (= (and d!3569 (not res!13175)) b!19402))

(assert (= (and b!19402 c!2066) b!19403))

(assert (= (and b!19402 (not c!2066)) b!19404))

(assert (= (and b!19403 res!13176) b!19405))

(assert (= (or b!19405 b!19404) bm!898))

(assert (=> b!19402 m!13639))

(assert (=> b!19402 m!13639))

(assert (=> b!19402 m!13641))

(assert (=> b!19403 m!13639))

(declare-fun m!13645 () Bool)

(assert (=> b!19403 m!13645))

(declare-fun m!13647 () Bool)

(assert (=> b!19403 m!13647))

(assert (=> b!19403 m!13639))

(declare-fun m!13649 () Bool)

(assert (=> b!19403 m!13649))

(declare-fun m!13651 () Bool)

(assert (=> bm!898 m!13651))

(assert (=> b!19366 d!3569))

(declare-fun b!19416 () Bool)

(declare-fun e!12527 () Bool)

(declare-fun call!904 () Bool)

(assert (=> b!19416 (= e!12527 call!904)))

(declare-fun b!19417 () Bool)

(declare-fun e!12529 () Bool)

(declare-fun e!12526 () Bool)

(assert (=> b!19417 (= e!12529 e!12526)))

(declare-fun res!13185 () Bool)

(assert (=> b!19417 (=> (not res!13185) (not e!12526))))

(declare-fun e!12528 () Bool)

(assert (=> b!19417 (= res!13185 (not e!12528))))

(declare-fun res!13183 () Bool)

(assert (=> b!19417 (=> (not res!13183) (not e!12528))))

(assert (=> b!19417 (= res!13183 (validKeyInArray!0 (select (arr!513 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun d!3571 () Bool)

(declare-fun res!13184 () Bool)

(assert (=> d!3571 (=> res!13184 e!12529)))

(assert (=> d!3571 (= res!13184 (bvsge #b00000000000000000000000000000000 (size!605 (_keys!3108 (v!1507 (underlying!73 thiss!938))))))))

(assert (=> d!3571 (= (arrayNoDuplicates!0 (_keys!3108 (v!1507 (underlying!73 thiss!938))) #b00000000000000000000000000000000 Nil!540) e!12529)))

(declare-fun bm!901 () Bool)

(declare-fun c!2069 () Bool)

(assert (=> bm!901 (= call!904 (arrayNoDuplicates!0 (_keys!3108 (v!1507 (underlying!73 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2069 (Cons!539 (select (arr!513 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000) Nil!540) Nil!540)))))

(declare-fun b!19418 () Bool)

(assert (=> b!19418 (= e!12526 e!12527)))

(assert (=> b!19418 (= c!2069 (validKeyInArray!0 (select (arr!513 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19419 () Bool)

(declare-fun contains!219 (List!543 (_ BitVec 64)) Bool)

(assert (=> b!19419 (= e!12528 (contains!219 Nil!540 (select (arr!513 (_keys!3108 (v!1507 (underlying!73 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19420 () Bool)

(assert (=> b!19420 (= e!12527 call!904)))

(assert (= (and d!3571 (not res!13184)) b!19417))

(assert (= (and b!19417 res!13183) b!19419))

(assert (= (and b!19417 res!13185) b!19418))

(assert (= (and b!19418 c!2069) b!19416))

(assert (= (and b!19418 (not c!2069)) b!19420))

(assert (= (or b!19416 b!19420) bm!901))

(assert (=> b!19417 m!13639))

(assert (=> b!19417 m!13639))

(assert (=> b!19417 m!13641))

(assert (=> bm!901 m!13639))

(declare-fun m!13653 () Bool)

(assert (=> bm!901 m!13653))

(assert (=> b!19418 m!13639))

(assert (=> b!19418 m!13639))

(assert (=> b!19418 m!13641))

(assert (=> b!19419 m!13639))

(assert (=> b!19419 m!13639))

(declare-fun m!13655 () Bool)

(assert (=> b!19419 m!13655))

(assert (=> b!19367 d!3571))

(declare-fun mapIsEmpty!868 () Bool)

(declare-fun mapRes!868 () Bool)

(assert (=> mapIsEmpty!868 mapRes!868))

(declare-fun condMapEmpty!868 () Bool)

(declare-fun mapDefault!868 () ValueCell!269)

(assert (=> mapNonEmpty!867 (= condMapEmpty!868 (= mapRest!867 ((as const (Array (_ BitVec 32) ValueCell!269)) mapDefault!868)))))

(declare-fun e!12531 () Bool)

(assert (=> mapNonEmpty!867 (= tp!3243 (and e!12531 mapRes!868))))

(declare-fun mapNonEmpty!868 () Bool)

(declare-fun tp!3244 () Bool)

(declare-fun e!12530 () Bool)

(assert (=> mapNonEmpty!868 (= mapRes!868 (and tp!3244 e!12530))))

(declare-fun mapValue!868 () ValueCell!269)

(declare-fun mapRest!868 () (Array (_ BitVec 32) ValueCell!269))

(declare-fun mapKey!868 () (_ BitVec 32))

(assert (=> mapNonEmpty!868 (= mapRest!867 (store mapRest!868 mapKey!868 mapValue!868))))

(declare-fun b!19421 () Bool)

(assert (=> b!19421 (= e!12530 tp_is_empty!937)))

(declare-fun b!19422 () Bool)

(assert (=> b!19422 (= e!12531 tp_is_empty!937)))

(assert (= (and mapNonEmpty!867 condMapEmpty!868) mapIsEmpty!868))

(assert (= (and mapNonEmpty!867 (not condMapEmpty!868)) mapNonEmpty!868))

(assert (= (and mapNonEmpty!868 ((_ is ValueCellFull!269) mapValue!868)) b!19421))

(assert (= (and mapNonEmpty!867 ((_ is ValueCellFull!269) mapDefault!868)) b!19422))

(declare-fun m!13657 () Bool)

(assert (=> mapNonEmpty!868 m!13657))

(check-sat (not b!19417) tp_is_empty!937 (not mapNonEmpty!868) (not b!19391) (not bm!898) (not b!19402) (not b!19419) (not b!19403) (not d!3565) (not b!19418) b_and!1327 (not b_next!673) (not bm!901) (not b!19380) (not bm!895) (not b!19379))
(check-sat b_and!1327 (not b_next!673))
