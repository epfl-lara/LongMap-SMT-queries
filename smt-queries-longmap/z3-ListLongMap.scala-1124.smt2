; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23060 () Bool)

(assert start!23060)

(declare-fun b!241494 () Bool)

(declare-fun b_free!6493 () Bool)

(declare-fun b_next!6493 () Bool)

(assert (=> b!241494 (= b_free!6493 (not b_next!6493))))

(declare-fun tp!22686 () Bool)

(declare-fun b_and!13439 () Bool)

(assert (=> b!241494 (= tp!22686 b_and!13439)))

(declare-fun b!241485 () Bool)

(declare-fun e!156721 () Bool)

(declare-fun call!22460 () Bool)

(assert (=> b!241485 (= e!156721 (not call!22460))))

(declare-fun mapNonEmpty!10768 () Bool)

(declare-fun mapRes!10768 () Bool)

(declare-fun tp!22687 () Bool)

(declare-fun e!156716 () Bool)

(assert (=> mapNonEmpty!10768 (= mapRes!10768 (and tp!22687 e!156716))))

(declare-datatypes ((V!8121 0))(
  ( (V!8122 (val!3222 Int)) )
))
(declare-datatypes ((ValueCell!2834 0))(
  ( (ValueCellFull!2834 (v!5255 V!8121)) (EmptyCell!2834) )
))
(declare-fun mapValue!10768 () ValueCell!2834)

(declare-datatypes ((array!11983 0))(
  ( (array!11984 (arr!5691 (Array (_ BitVec 32) ValueCell!2834)) (size!6034 (_ BitVec 32))) )
))
(declare-datatypes ((array!11985 0))(
  ( (array!11986 (arr!5692 (Array (_ BitVec 32) (_ BitVec 64))) (size!6035 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3568 0))(
  ( (LongMapFixedSize!3569 (defaultEntry!4477 Int) (mask!10549 (_ BitVec 32)) (extraKeys!4214 (_ BitVec 32)) (zeroValue!4318 V!8121) (minValue!4318 V!8121) (_size!1833 (_ BitVec 32)) (_keys!6582 array!11985) (_values!4460 array!11983) (_vacant!1833 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3568)

(declare-fun mapRest!10768 () (Array (_ BitVec 32) ValueCell!2834))

(declare-fun mapKey!10768 () (_ BitVec 32))

(assert (=> mapNonEmpty!10768 (= (arr!5691 (_values!4460 thiss!1504)) (store mapRest!10768 mapKey!10768 mapValue!10768))))

(declare-fun b!241486 () Bool)

(declare-datatypes ((Unit!7435 0))(
  ( (Unit!7436) )
))
(declare-fun e!156715 () Unit!7435)

(declare-fun Unit!7437 () Unit!7435)

(assert (=> b!241486 (= e!156715 Unit!7437)))

(declare-fun lt!121240 () Unit!7435)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!354 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) Int) Unit!7435)

(assert (=> b!241486 (= lt!121240 (lemmaInListMapThenSeekEntryOrOpenFindsIt!354 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)))))

(assert (=> b!241486 false))

(declare-fun bm!22457 () Bool)

(declare-fun arrayContainsKey!0 (array!11985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22457 (= call!22460 (arrayContainsKey!0 (_keys!6582 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241487 () Bool)

(declare-fun res!118341 () Bool)

(assert (=> b!241487 (=> (not res!118341) (not e!156721))))

(declare-fun call!22461 () Bool)

(assert (=> b!241487 (= res!118341 call!22461)))

(declare-fun e!156723 () Bool)

(assert (=> b!241487 (= e!156723 e!156721)))

(declare-fun res!118340 () Bool)

(declare-fun e!156725 () Bool)

(assert (=> start!23060 (=> (not res!118340) (not e!156725))))

(declare-fun valid!1407 (LongMapFixedSize!3568) Bool)

(assert (=> start!23060 (= res!118340 (valid!1407 thiss!1504))))

(assert (=> start!23060 e!156725))

(declare-fun e!156722 () Bool)

(assert (=> start!23060 e!156722))

(assert (=> start!23060 true))

(declare-datatypes ((SeekEntryResult!1058 0))(
  ( (MissingZero!1058 (index!6402 (_ BitVec 32))) (Found!1058 (index!6403 (_ BitVec 32))) (Intermediate!1058 (undefined!1870 Bool) (index!6404 (_ BitVec 32)) (x!24227 (_ BitVec 32))) (Undefined!1058) (MissingVacant!1058 (index!6405 (_ BitVec 32))) )
))
(declare-fun lt!121239 () SeekEntryResult!1058)

(declare-fun bm!22458 () Bool)

(declare-fun c!40261 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22458 (= call!22461 (inRange!0 (ite c!40261 (index!6402 lt!121239) (index!6405 lt!121239)) (mask!10549 thiss!1504)))))

(declare-fun b!241488 () Bool)

(declare-fun tp_is_empty!6355 () Bool)

(assert (=> b!241488 (= e!156716 tp_is_empty!6355)))

(declare-fun b!241489 () Bool)

(declare-fun res!118338 () Bool)

(assert (=> b!241489 (= res!118338 (= (select (arr!5692 (_keys!6582 thiss!1504)) (index!6405 lt!121239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156720 () Bool)

(assert (=> b!241489 (=> (not res!118338) (not e!156720))))

(declare-fun b!241490 () Bool)

(declare-fun e!156728 () Bool)

(assert (=> b!241490 (= e!156728 e!156720)))

(declare-fun res!118339 () Bool)

(assert (=> b!241490 (= res!118339 call!22461)))

(assert (=> b!241490 (=> (not res!118339) (not e!156720))))

(declare-fun b!241491 () Bool)

(get-info :version)

(assert (=> b!241491 (= e!156728 ((_ is Undefined!1058) lt!121239))))

(declare-fun b!241492 () Bool)

(declare-fun e!156717 () Unit!7435)

(declare-fun Unit!7438 () Unit!7435)

(assert (=> b!241492 (= e!156717 Unit!7438)))

(declare-fun lt!121243 () Unit!7435)

(declare-fun lemmaArrayContainsKeyThenInListMap!168 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) (_ BitVec 32) Int) Unit!7435)

(assert (=> b!241492 (= lt!121243 (lemmaArrayContainsKeyThenInListMap!168 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(assert (=> b!241492 false))

(declare-fun b!241493 () Bool)

(declare-fun e!156727 () Bool)

(assert (=> b!241493 (= e!156727 tp_is_empty!6355)))

(declare-fun e!156724 () Bool)

(declare-fun array_inv!3755 (array!11985) Bool)

(declare-fun array_inv!3756 (array!11983) Bool)

(assert (=> b!241494 (= e!156722 (and tp!22686 tp_is_empty!6355 (array_inv!3755 (_keys!6582 thiss!1504)) (array_inv!3756 (_values!4460 thiss!1504)) e!156724))))

(declare-fun mapIsEmpty!10768 () Bool)

(assert (=> mapIsEmpty!10768 mapRes!10768))

(declare-fun b!241495 () Bool)

(declare-fun e!156719 () Bool)

(declare-fun e!156718 () Bool)

(assert (=> b!241495 (= e!156719 e!156718)))

(declare-fun res!118342 () Bool)

(assert (=> b!241495 (=> (not res!118342) (not e!156718))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!241495 (= res!118342 (inRange!0 index!297 (mask!10549 thiss!1504)))))

(declare-fun lt!121238 () Unit!7435)

(assert (=> b!241495 (= lt!121238 e!156715)))

(declare-fun c!40264 () Bool)

(declare-datatypes ((tuple2!4718 0))(
  ( (tuple2!4719 (_1!2370 (_ BitVec 64)) (_2!2370 V!8121)) )
))
(declare-datatypes ((List!3614 0))(
  ( (Nil!3611) (Cons!3610 (h!4267 tuple2!4718) (t!8602 List!3614)) )
))
(declare-datatypes ((ListLongMap!3621 0))(
  ( (ListLongMap!3622 (toList!1826 List!3614)) )
))
(declare-fun contains!1719 (ListLongMap!3621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1335 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 32) Int) ListLongMap!3621)

(assert (=> b!241495 (= c!40264 (contains!1719 (getCurrentListMap!1335 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) key!932))))

(declare-fun b!241496 () Bool)

(declare-fun res!118344 () Bool)

(assert (=> b!241496 (=> (not res!118344) (not e!156721))))

(assert (=> b!241496 (= res!118344 (= (select (arr!5692 (_keys!6582 thiss!1504)) (index!6402 lt!121239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241497 () Bool)

(declare-fun c!40262 () Bool)

(assert (=> b!241497 (= c!40262 ((_ is MissingVacant!1058) lt!121239))))

(assert (=> b!241497 (= e!156723 e!156728)))

(declare-fun b!241498 () Bool)

(assert (=> b!241498 (= e!156718 (and (bvslt (size!6035 (_keys!6582 thiss!1504)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!6035 (_keys!6582 thiss!1504)))))))

(declare-fun lt!121241 () Unit!7435)

(assert (=> b!241498 (= lt!121241 e!156717)))

(declare-fun c!40263 () Bool)

(assert (=> b!241498 (= c!40263 (arrayContainsKey!0 (_keys!6582 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241499 () Bool)

(assert (=> b!241499 (= e!156725 e!156719)))

(declare-fun res!118343 () Bool)

(assert (=> b!241499 (=> (not res!118343) (not e!156719))))

(assert (=> b!241499 (= res!118343 (or (= lt!121239 (MissingZero!1058 index!297)) (= lt!121239 (MissingVacant!1058 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11985 (_ BitVec 32)) SeekEntryResult!1058)

(assert (=> b!241499 (= lt!121239 (seekEntryOrOpen!0 key!932 (_keys!6582 thiss!1504) (mask!10549 thiss!1504)))))

(declare-fun b!241500 () Bool)

(declare-fun lt!121242 () Unit!7435)

(assert (=> b!241500 (= e!156715 lt!121242)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!355 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) Int) Unit!7435)

(assert (=> b!241500 (= lt!121242 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!355 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)))))

(assert (=> b!241500 (= c!40261 ((_ is MissingZero!1058) lt!121239))))

(assert (=> b!241500 e!156723))

(declare-fun b!241501 () Bool)

(declare-fun res!118345 () Bool)

(assert (=> b!241501 (=> (not res!118345) (not e!156725))))

(assert (=> b!241501 (= res!118345 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241502 () Bool)

(assert (=> b!241502 (= e!156724 (and e!156727 mapRes!10768))))

(declare-fun condMapEmpty!10768 () Bool)

(declare-fun mapDefault!10768 () ValueCell!2834)

(assert (=> b!241502 (= condMapEmpty!10768 (= (arr!5691 (_values!4460 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2834)) mapDefault!10768)))))

(declare-fun b!241503 () Bool)

(assert (=> b!241503 (= e!156720 (not call!22460))))

(declare-fun b!241504 () Bool)

(declare-fun Unit!7439 () Unit!7435)

(assert (=> b!241504 (= e!156717 Unit!7439)))

(assert (= (and start!23060 res!118340) b!241501))

(assert (= (and b!241501 res!118345) b!241499))

(assert (= (and b!241499 res!118343) b!241495))

(assert (= (and b!241495 c!40264) b!241486))

(assert (= (and b!241495 (not c!40264)) b!241500))

(assert (= (and b!241500 c!40261) b!241487))

(assert (= (and b!241500 (not c!40261)) b!241497))

(assert (= (and b!241487 res!118341) b!241496))

(assert (= (and b!241496 res!118344) b!241485))

(assert (= (and b!241497 c!40262) b!241490))

(assert (= (and b!241497 (not c!40262)) b!241491))

(assert (= (and b!241490 res!118339) b!241489))

(assert (= (and b!241489 res!118338) b!241503))

(assert (= (or b!241487 b!241490) bm!22458))

(assert (= (or b!241485 b!241503) bm!22457))

(assert (= (and b!241495 res!118342) b!241498))

(assert (= (and b!241498 c!40263) b!241492))

(assert (= (and b!241498 (not c!40263)) b!241504))

(assert (= (and b!241502 condMapEmpty!10768) mapIsEmpty!10768))

(assert (= (and b!241502 (not condMapEmpty!10768)) mapNonEmpty!10768))

(assert (= (and mapNonEmpty!10768 ((_ is ValueCellFull!2834) mapValue!10768)) b!241488))

(assert (= (and b!241502 ((_ is ValueCellFull!2834) mapDefault!10768)) b!241493))

(assert (= b!241494 b!241502))

(assert (= start!23060 b!241494))

(declare-fun m!260161 () Bool)

(assert (=> bm!22457 m!260161))

(declare-fun m!260163 () Bool)

(assert (=> start!23060 m!260163))

(declare-fun m!260165 () Bool)

(assert (=> mapNonEmpty!10768 m!260165))

(declare-fun m!260167 () Bool)

(assert (=> b!241486 m!260167))

(declare-fun m!260169 () Bool)

(assert (=> b!241500 m!260169))

(declare-fun m!260171 () Bool)

(assert (=> b!241499 m!260171))

(assert (=> b!241498 m!260161))

(declare-fun m!260173 () Bool)

(assert (=> b!241494 m!260173))

(declare-fun m!260175 () Bool)

(assert (=> b!241494 m!260175))

(declare-fun m!260177 () Bool)

(assert (=> b!241492 m!260177))

(declare-fun m!260179 () Bool)

(assert (=> bm!22458 m!260179))

(declare-fun m!260181 () Bool)

(assert (=> b!241495 m!260181))

(declare-fun m!260183 () Bool)

(assert (=> b!241495 m!260183))

(assert (=> b!241495 m!260183))

(declare-fun m!260185 () Bool)

(assert (=> b!241495 m!260185))

(declare-fun m!260187 () Bool)

(assert (=> b!241489 m!260187))

(declare-fun m!260189 () Bool)

(assert (=> b!241496 m!260189))

(check-sat (not b!241486) b_and!13439 (not start!23060) tp_is_empty!6355 (not b_next!6493) (not b!241495) (not bm!22458) (not b!241494) (not b!241492) (not b!241499) (not b!241498) (not mapNonEmpty!10768) (not bm!22457) (not b!241500))
(check-sat b_and!13439 (not b_next!6493))
(get-model)

(declare-fun d!59765 () Bool)

(assert (=> d!59765 (= (inRange!0 (ite c!40261 (index!6402 lt!121239) (index!6405 lt!121239)) (mask!10549 thiss!1504)) (and (bvsge (ite c!40261 (index!6402 lt!121239) (index!6405 lt!121239)) #b00000000000000000000000000000000) (bvslt (ite c!40261 (index!6402 lt!121239) (index!6405 lt!121239)) (bvadd (mask!10549 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22458 d!59765))

(declare-fun d!59767 () Bool)

(assert (=> d!59767 (contains!1719 (getCurrentListMap!1335 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) key!932)))

(declare-fun lt!121282 () Unit!7435)

(declare-fun choose!1129 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) (_ BitVec 32) Int) Unit!7435)

(assert (=> d!59767 (= lt!121282 (choose!1129 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59767 (validMask!0 (mask!10549 thiss!1504))))

(assert (=> d!59767 (= (lemmaArrayContainsKeyThenInListMap!168 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) lt!121282)))

(declare-fun bs!8828 () Bool)

(assert (= bs!8828 d!59767))

(assert (=> bs!8828 m!260183))

(assert (=> bs!8828 m!260183))

(assert (=> bs!8828 m!260185))

(declare-fun m!260251 () Bool)

(assert (=> bs!8828 m!260251))

(declare-fun m!260253 () Bool)

(assert (=> bs!8828 m!260253))

(assert (=> b!241492 d!59767))

(declare-fun d!59769 () Bool)

(declare-fun res!118398 () Bool)

(declare-fun e!156817 () Bool)

(assert (=> d!59769 (=> res!118398 e!156817)))

(assert (=> d!59769 (= res!118398 (= (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59769 (= (arrayContainsKey!0 (_keys!6582 thiss!1504) key!932 #b00000000000000000000000000000000) e!156817)))

(declare-fun b!241629 () Bool)

(declare-fun e!156818 () Bool)

(assert (=> b!241629 (= e!156817 e!156818)))

(declare-fun res!118399 () Bool)

(assert (=> b!241629 (=> (not res!118399) (not e!156818))))

(assert (=> b!241629 (= res!118399 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6035 (_keys!6582 thiss!1504))))))

(declare-fun b!241630 () Bool)

(assert (=> b!241630 (= e!156818 (arrayContainsKey!0 (_keys!6582 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59769 (not res!118398)) b!241629))

(assert (= (and b!241629 res!118399) b!241630))

(declare-fun m!260255 () Bool)

(assert (=> d!59769 m!260255))

(declare-fun m!260257 () Bool)

(assert (=> b!241630 m!260257))

(assert (=> b!241498 d!59769))

(declare-fun d!59771 () Bool)

(declare-fun res!118406 () Bool)

(declare-fun e!156821 () Bool)

(assert (=> d!59771 (=> (not res!118406) (not e!156821))))

(declare-fun simpleValid!245 (LongMapFixedSize!3568) Bool)

(assert (=> d!59771 (= res!118406 (simpleValid!245 thiss!1504))))

(assert (=> d!59771 (= (valid!1407 thiss!1504) e!156821)))

(declare-fun b!241637 () Bool)

(declare-fun res!118407 () Bool)

(assert (=> b!241637 (=> (not res!118407) (not e!156821))))

(declare-fun arrayCountValidKeys!0 (array!11985 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241637 (= res!118407 (= (arrayCountValidKeys!0 (_keys!6582 thiss!1504) #b00000000000000000000000000000000 (size!6035 (_keys!6582 thiss!1504))) (_size!1833 thiss!1504)))))

(declare-fun b!241638 () Bool)

(declare-fun res!118408 () Bool)

(assert (=> b!241638 (=> (not res!118408) (not e!156821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11985 (_ BitVec 32)) Bool)

(assert (=> b!241638 (= res!118408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6582 thiss!1504) (mask!10549 thiss!1504)))))

(declare-fun b!241639 () Bool)

(declare-datatypes ((List!3615 0))(
  ( (Nil!3612) (Cons!3611 (h!4268 (_ BitVec 64)) (t!8605 List!3615)) )
))
(declare-fun arrayNoDuplicates!0 (array!11985 (_ BitVec 32) List!3615) Bool)

(assert (=> b!241639 (= e!156821 (arrayNoDuplicates!0 (_keys!6582 thiss!1504) #b00000000000000000000000000000000 Nil!3612))))

(assert (= (and d!59771 res!118406) b!241637))

(assert (= (and b!241637 res!118407) b!241638))

(assert (= (and b!241638 res!118408) b!241639))

(declare-fun m!260259 () Bool)

(assert (=> d!59771 m!260259))

(declare-fun m!260261 () Bool)

(assert (=> b!241637 m!260261))

(declare-fun m!260263 () Bool)

(assert (=> b!241638 m!260263))

(declare-fun m!260265 () Bool)

(assert (=> b!241639 m!260265))

(assert (=> start!23060 d!59771))

(declare-fun b!241652 () Bool)

(declare-fun e!156828 () SeekEntryResult!1058)

(declare-fun lt!121290 () SeekEntryResult!1058)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11985 (_ BitVec 32)) SeekEntryResult!1058)

(assert (=> b!241652 (= e!156828 (seekKeyOrZeroReturnVacant!0 (x!24227 lt!121290) (index!6404 lt!121290) (index!6404 lt!121290) key!932 (_keys!6582 thiss!1504) (mask!10549 thiss!1504)))))

(declare-fun b!241653 () Bool)

(assert (=> b!241653 (= e!156828 (MissingZero!1058 (index!6404 lt!121290)))))

(declare-fun b!241654 () Bool)

(declare-fun c!40295 () Bool)

(declare-fun lt!121289 () (_ BitVec 64))

(assert (=> b!241654 (= c!40295 (= lt!121289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156829 () SeekEntryResult!1058)

(assert (=> b!241654 (= e!156829 e!156828)))

(declare-fun b!241655 () Bool)

(assert (=> b!241655 (= e!156829 (Found!1058 (index!6404 lt!121290)))))

(declare-fun d!59773 () Bool)

(declare-fun lt!121291 () SeekEntryResult!1058)

(assert (=> d!59773 (and (or ((_ is Undefined!1058) lt!121291) (not ((_ is Found!1058) lt!121291)) (and (bvsge (index!6403 lt!121291) #b00000000000000000000000000000000) (bvslt (index!6403 lt!121291) (size!6035 (_keys!6582 thiss!1504))))) (or ((_ is Undefined!1058) lt!121291) ((_ is Found!1058) lt!121291) (not ((_ is MissingZero!1058) lt!121291)) (and (bvsge (index!6402 lt!121291) #b00000000000000000000000000000000) (bvslt (index!6402 lt!121291) (size!6035 (_keys!6582 thiss!1504))))) (or ((_ is Undefined!1058) lt!121291) ((_ is Found!1058) lt!121291) ((_ is MissingZero!1058) lt!121291) (not ((_ is MissingVacant!1058) lt!121291)) (and (bvsge (index!6405 lt!121291) #b00000000000000000000000000000000) (bvslt (index!6405 lt!121291) (size!6035 (_keys!6582 thiss!1504))))) (or ((_ is Undefined!1058) lt!121291) (ite ((_ is Found!1058) lt!121291) (= (select (arr!5692 (_keys!6582 thiss!1504)) (index!6403 lt!121291)) key!932) (ite ((_ is MissingZero!1058) lt!121291) (= (select (arr!5692 (_keys!6582 thiss!1504)) (index!6402 lt!121291)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1058) lt!121291) (= (select (arr!5692 (_keys!6582 thiss!1504)) (index!6405 lt!121291)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!156830 () SeekEntryResult!1058)

(assert (=> d!59773 (= lt!121291 e!156830)))

(declare-fun c!40297 () Bool)

(assert (=> d!59773 (= c!40297 (and ((_ is Intermediate!1058) lt!121290) (undefined!1870 lt!121290)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11985 (_ BitVec 32)) SeekEntryResult!1058)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59773 (= lt!121290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10549 thiss!1504)) key!932 (_keys!6582 thiss!1504) (mask!10549 thiss!1504)))))

(assert (=> d!59773 (validMask!0 (mask!10549 thiss!1504))))

(assert (=> d!59773 (= (seekEntryOrOpen!0 key!932 (_keys!6582 thiss!1504) (mask!10549 thiss!1504)) lt!121291)))

(declare-fun b!241656 () Bool)

(assert (=> b!241656 (= e!156830 Undefined!1058)))

(declare-fun b!241657 () Bool)

(assert (=> b!241657 (= e!156830 e!156829)))

(assert (=> b!241657 (= lt!121289 (select (arr!5692 (_keys!6582 thiss!1504)) (index!6404 lt!121290)))))

(declare-fun c!40296 () Bool)

(assert (=> b!241657 (= c!40296 (= lt!121289 key!932))))

(assert (= (and d!59773 c!40297) b!241656))

(assert (= (and d!59773 (not c!40297)) b!241657))

(assert (= (and b!241657 c!40296) b!241655))

(assert (= (and b!241657 (not c!40296)) b!241654))

(assert (= (and b!241654 c!40295) b!241653))

(assert (= (and b!241654 (not c!40295)) b!241652))

(declare-fun m!260267 () Bool)

(assert (=> b!241652 m!260267))

(declare-fun m!260269 () Bool)

(assert (=> d!59773 m!260269))

(declare-fun m!260271 () Bool)

(assert (=> d!59773 m!260271))

(declare-fun m!260273 () Bool)

(assert (=> d!59773 m!260273))

(assert (=> d!59773 m!260253))

(declare-fun m!260275 () Bool)

(assert (=> d!59773 m!260275))

(assert (=> d!59773 m!260275))

(declare-fun m!260277 () Bool)

(assert (=> d!59773 m!260277))

(declare-fun m!260279 () Bool)

(assert (=> b!241657 m!260279))

(assert (=> b!241499 d!59773))

(declare-fun d!59775 () Bool)

(declare-fun e!156833 () Bool)

(assert (=> d!59775 e!156833))

(declare-fun res!118413 () Bool)

(assert (=> d!59775 (=> (not res!118413) (not e!156833))))

(declare-fun lt!121296 () SeekEntryResult!1058)

(assert (=> d!59775 (= res!118413 ((_ is Found!1058) lt!121296))))

(assert (=> d!59775 (= lt!121296 (seekEntryOrOpen!0 key!932 (_keys!6582 thiss!1504) (mask!10549 thiss!1504)))))

(declare-fun lt!121297 () Unit!7435)

(declare-fun choose!1130 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) Int) Unit!7435)

(assert (=> d!59775 (= lt!121297 (choose!1130 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)))))

(assert (=> d!59775 (validMask!0 (mask!10549 thiss!1504))))

(assert (=> d!59775 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!354 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)) lt!121297)))

(declare-fun b!241662 () Bool)

(declare-fun res!118414 () Bool)

(assert (=> b!241662 (=> (not res!118414) (not e!156833))))

(assert (=> b!241662 (= res!118414 (inRange!0 (index!6403 lt!121296) (mask!10549 thiss!1504)))))

(declare-fun b!241663 () Bool)

(assert (=> b!241663 (= e!156833 (= (select (arr!5692 (_keys!6582 thiss!1504)) (index!6403 lt!121296)) key!932))))

(assert (=> b!241663 (and (bvsge (index!6403 lt!121296) #b00000000000000000000000000000000) (bvslt (index!6403 lt!121296) (size!6035 (_keys!6582 thiss!1504))))))

(assert (= (and d!59775 res!118413) b!241662))

(assert (= (and b!241662 res!118414) b!241663))

(assert (=> d!59775 m!260171))

(declare-fun m!260281 () Bool)

(assert (=> d!59775 m!260281))

(assert (=> d!59775 m!260253))

(declare-fun m!260283 () Bool)

(assert (=> b!241662 m!260283))

(declare-fun m!260285 () Bool)

(assert (=> b!241663 m!260285))

(assert (=> b!241486 d!59775))

(declare-fun d!59777 () Bool)

(assert (=> d!59777 (= (array_inv!3755 (_keys!6582 thiss!1504)) (bvsge (size!6035 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241494 d!59777))

(declare-fun d!59779 () Bool)

(assert (=> d!59779 (= (array_inv!3756 (_values!4460 thiss!1504)) (bvsge (size!6034 (_values!4460 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241494 d!59779))

(declare-fun d!59781 () Bool)

(assert (=> d!59781 (= (inRange!0 index!297 (mask!10549 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10549 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!241495 d!59781))

(declare-fun d!59783 () Bool)

(declare-fun e!156838 () Bool)

(assert (=> d!59783 e!156838))

(declare-fun res!118417 () Bool)

(assert (=> d!59783 (=> res!118417 e!156838)))

(declare-fun lt!121309 () Bool)

(assert (=> d!59783 (= res!118417 (not lt!121309))))

(declare-fun lt!121306 () Bool)

(assert (=> d!59783 (= lt!121309 lt!121306)))

(declare-fun lt!121307 () Unit!7435)

(declare-fun e!156839 () Unit!7435)

(assert (=> d!59783 (= lt!121307 e!156839)))

(declare-fun c!40300 () Bool)

(assert (=> d!59783 (= c!40300 lt!121306)))

(declare-fun containsKey!270 (List!3614 (_ BitVec 64)) Bool)

(assert (=> d!59783 (= lt!121306 (containsKey!270 (toList!1826 (getCurrentListMap!1335 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504))) key!932))))

(assert (=> d!59783 (= (contains!1719 (getCurrentListMap!1335 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) key!932) lt!121309)))

(declare-fun b!241670 () Bool)

(declare-fun lt!121308 () Unit!7435)

(assert (=> b!241670 (= e!156839 lt!121308)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!219 (List!3614 (_ BitVec 64)) Unit!7435)

(assert (=> b!241670 (= lt!121308 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1826 (getCurrentListMap!1335 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504))) key!932))))

(declare-datatypes ((Option!284 0))(
  ( (Some!283 (v!5258 V!8121)) (None!282) )
))
(declare-fun isDefined!220 (Option!284) Bool)

(declare-fun getValueByKey!278 (List!3614 (_ BitVec 64)) Option!284)

(assert (=> b!241670 (isDefined!220 (getValueByKey!278 (toList!1826 (getCurrentListMap!1335 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504))) key!932))))

(declare-fun b!241671 () Bool)

(declare-fun Unit!7443 () Unit!7435)

(assert (=> b!241671 (= e!156839 Unit!7443)))

(declare-fun b!241672 () Bool)

(assert (=> b!241672 (= e!156838 (isDefined!220 (getValueByKey!278 (toList!1826 (getCurrentListMap!1335 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504))) key!932)))))

(assert (= (and d!59783 c!40300) b!241670))

(assert (= (and d!59783 (not c!40300)) b!241671))

(assert (= (and d!59783 (not res!118417)) b!241672))

(declare-fun m!260287 () Bool)

(assert (=> d!59783 m!260287))

(declare-fun m!260289 () Bool)

(assert (=> b!241670 m!260289))

(declare-fun m!260291 () Bool)

(assert (=> b!241670 m!260291))

(assert (=> b!241670 m!260291))

(declare-fun m!260293 () Bool)

(assert (=> b!241670 m!260293))

(assert (=> b!241672 m!260291))

(assert (=> b!241672 m!260291))

(assert (=> b!241672 m!260293))

(assert (=> b!241495 d!59783))

(declare-fun bm!22485 () Bool)

(declare-fun call!22488 () Bool)

(declare-fun lt!121366 () ListLongMap!3621)

(assert (=> bm!22485 (= call!22488 (contains!1719 lt!121366 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241715 () Bool)

(declare-fun e!156871 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!241715 (= e!156871 (validKeyInArray!0 (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241716 () Bool)

(declare-fun e!156874 () Unit!7435)

(declare-fun lt!121370 () Unit!7435)

(assert (=> b!241716 (= e!156874 lt!121370)))

(declare-fun lt!121361 () ListLongMap!3621)

(declare-fun getCurrentListMapNoExtraKeys!538 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 32) Int) ListLongMap!3621)

(assert (=> b!241716 (= lt!121361 (getCurrentListMapNoExtraKeys!538 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun lt!121354 () (_ BitVec 64))

(assert (=> b!241716 (= lt!121354 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121368 () (_ BitVec 64))

(assert (=> b!241716 (= lt!121368 (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121374 () Unit!7435)

(declare-fun addStillContains!198 (ListLongMap!3621 (_ BitVec 64) V!8121 (_ BitVec 64)) Unit!7435)

(assert (=> b!241716 (= lt!121374 (addStillContains!198 lt!121361 lt!121354 (zeroValue!4318 thiss!1504) lt!121368))))

(declare-fun +!655 (ListLongMap!3621 tuple2!4718) ListLongMap!3621)

(assert (=> b!241716 (contains!1719 (+!655 lt!121361 (tuple2!4719 lt!121354 (zeroValue!4318 thiss!1504))) lt!121368)))

(declare-fun lt!121362 () Unit!7435)

(assert (=> b!241716 (= lt!121362 lt!121374)))

(declare-fun lt!121363 () ListLongMap!3621)

(assert (=> b!241716 (= lt!121363 (getCurrentListMapNoExtraKeys!538 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun lt!121369 () (_ BitVec 64))

(assert (=> b!241716 (= lt!121369 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121367 () (_ BitVec 64))

(assert (=> b!241716 (= lt!121367 (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121356 () Unit!7435)

(declare-fun addApplyDifferent!198 (ListLongMap!3621 (_ BitVec 64) V!8121 (_ BitVec 64)) Unit!7435)

(assert (=> b!241716 (= lt!121356 (addApplyDifferent!198 lt!121363 lt!121369 (minValue!4318 thiss!1504) lt!121367))))

(declare-fun apply!222 (ListLongMap!3621 (_ BitVec 64)) V!8121)

(assert (=> b!241716 (= (apply!222 (+!655 lt!121363 (tuple2!4719 lt!121369 (minValue!4318 thiss!1504))) lt!121367) (apply!222 lt!121363 lt!121367))))

(declare-fun lt!121358 () Unit!7435)

(assert (=> b!241716 (= lt!121358 lt!121356)))

(declare-fun lt!121372 () ListLongMap!3621)

(assert (=> b!241716 (= lt!121372 (getCurrentListMapNoExtraKeys!538 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun lt!121373 () (_ BitVec 64))

(assert (=> b!241716 (= lt!121373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121360 () (_ BitVec 64))

(assert (=> b!241716 (= lt!121360 (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121364 () Unit!7435)

(assert (=> b!241716 (= lt!121364 (addApplyDifferent!198 lt!121372 lt!121373 (zeroValue!4318 thiss!1504) lt!121360))))

(assert (=> b!241716 (= (apply!222 (+!655 lt!121372 (tuple2!4719 lt!121373 (zeroValue!4318 thiss!1504))) lt!121360) (apply!222 lt!121372 lt!121360))))

(declare-fun lt!121355 () Unit!7435)

(assert (=> b!241716 (= lt!121355 lt!121364)))

(declare-fun lt!121359 () ListLongMap!3621)

(assert (=> b!241716 (= lt!121359 (getCurrentListMapNoExtraKeys!538 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun lt!121371 () (_ BitVec 64))

(assert (=> b!241716 (= lt!121371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121375 () (_ BitVec 64))

(assert (=> b!241716 (= lt!121375 (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241716 (= lt!121370 (addApplyDifferent!198 lt!121359 lt!121371 (minValue!4318 thiss!1504) lt!121375))))

(assert (=> b!241716 (= (apply!222 (+!655 lt!121359 (tuple2!4719 lt!121371 (minValue!4318 thiss!1504))) lt!121375) (apply!222 lt!121359 lt!121375))))

(declare-fun b!241717 () Bool)

(declare-fun e!156867 () Bool)

(declare-fun e!156872 () Bool)

(assert (=> b!241717 (= e!156867 e!156872)))

(declare-fun c!40318 () Bool)

(assert (=> b!241717 (= c!40318 (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!241718 () Bool)

(declare-fun e!156875 () Bool)

(assert (=> b!241718 (= e!156875 (validKeyInArray!0 (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22486 () Bool)

(declare-fun call!22492 () ListLongMap!3621)

(declare-fun call!22493 () ListLongMap!3621)

(assert (=> bm!22486 (= call!22492 call!22493)))

(declare-fun bm!22487 () Bool)

(declare-fun call!22494 () ListLongMap!3621)

(assert (=> bm!22487 (= call!22494 (getCurrentListMapNoExtraKeys!538 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)))))

(declare-fun bm!22488 () Bool)

(declare-fun call!22491 () ListLongMap!3621)

(declare-fun call!22490 () ListLongMap!3621)

(assert (=> bm!22488 (= call!22491 call!22490)))

(declare-fun b!241719 () Bool)

(declare-fun e!156868 () ListLongMap!3621)

(assert (=> b!241719 (= e!156868 call!22492)))

(declare-fun b!241720 () Bool)

(declare-fun e!156866 () Bool)

(assert (=> b!241720 (= e!156866 (= (apply!222 lt!121366 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4318 thiss!1504)))))

(declare-fun d!59785 () Bool)

(assert (=> d!59785 e!156867))

(declare-fun res!118440 () Bool)

(assert (=> d!59785 (=> (not res!118440) (not e!156867))))

(assert (=> d!59785 (= res!118440 (or (bvsge #b00000000000000000000000000000000 (size!6035 (_keys!6582 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6035 (_keys!6582 thiss!1504))))))))

(declare-fun lt!121357 () ListLongMap!3621)

(assert (=> d!59785 (= lt!121366 lt!121357)))

(declare-fun lt!121365 () Unit!7435)

(assert (=> d!59785 (= lt!121365 e!156874)))

(declare-fun c!40315 () Bool)

(assert (=> d!59785 (= c!40315 e!156875)))

(declare-fun res!118437 () Bool)

(assert (=> d!59785 (=> (not res!118437) (not e!156875))))

(assert (=> d!59785 (= res!118437 (bvslt #b00000000000000000000000000000000 (size!6035 (_keys!6582 thiss!1504))))))

(declare-fun e!156878 () ListLongMap!3621)

(assert (=> d!59785 (= lt!121357 e!156878)))

(declare-fun c!40317 () Bool)

(assert (=> d!59785 (= c!40317 (and (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59785 (validMask!0 (mask!10549 thiss!1504))))

(assert (=> d!59785 (= (getCurrentListMap!1335 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4477 thiss!1504)) lt!121366)))

(declare-fun b!241721 () Bool)

(assert (=> b!241721 (= e!156872 (not call!22488))))

(declare-fun b!241722 () Bool)

(declare-fun res!118443 () Bool)

(assert (=> b!241722 (=> (not res!118443) (not e!156867))))

(declare-fun e!156877 () Bool)

(assert (=> b!241722 (= res!118443 e!156877)))

(declare-fun c!40313 () Bool)

(assert (=> b!241722 (= c!40313 (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!241723 () Bool)

(declare-fun e!156869 () Bool)

(assert (=> b!241723 (= e!156869 (= (apply!222 lt!121366 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4318 thiss!1504)))))

(declare-fun b!241724 () Bool)

(declare-fun c!40316 () Bool)

(assert (=> b!241724 (= c!40316 (and (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!156876 () ListLongMap!3621)

(assert (=> b!241724 (= e!156876 e!156868)))

(declare-fun b!241725 () Bool)

(declare-fun e!156873 () Bool)

(declare-fun get!2920 (ValueCell!2834 V!8121) V!8121)

(declare-fun dynLambda!556 (Int (_ BitVec 64)) V!8121)

(assert (=> b!241725 (= e!156873 (= (apply!222 lt!121366 (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000)) (get!2920 (select (arr!5691 (_values!4460 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!556 (defaultEntry!4477 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!241725 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6034 (_values!4460 thiss!1504))))))

(assert (=> b!241725 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6035 (_keys!6582 thiss!1504))))))

(declare-fun b!241726 () Bool)

(declare-fun Unit!7444 () Unit!7435)

(assert (=> b!241726 (= e!156874 Unit!7444)))

(declare-fun b!241727 () Bool)

(assert (=> b!241727 (= e!156868 call!22491)))

(declare-fun b!241728 () Bool)

(declare-fun call!22489 () Bool)

(assert (=> b!241728 (= e!156877 (not call!22489))))

(declare-fun bm!22489 () Bool)

(assert (=> bm!22489 (= call!22493 call!22494)))

(declare-fun b!241729 () Bool)

(assert (=> b!241729 (= e!156876 call!22491)))

(declare-fun b!241730 () Bool)

(assert (=> b!241730 (= e!156872 e!156866)))

(declare-fun res!118441 () Bool)

(assert (=> b!241730 (= res!118441 call!22488)))

(assert (=> b!241730 (=> (not res!118441) (not e!156866))))

(declare-fun b!241731 () Bool)

(assert (=> b!241731 (= e!156878 e!156876)))

(declare-fun c!40314 () Bool)

(assert (=> b!241731 (= c!40314 (and (not (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4214 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22490 () Bool)

(assert (=> bm!22490 (= call!22490 (+!655 (ite c!40317 call!22494 (ite c!40314 call!22493 call!22492)) (ite (or c!40317 c!40314) (tuple2!4719 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4318 thiss!1504)) (tuple2!4719 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4318 thiss!1504)))))))

(declare-fun b!241732 () Bool)

(declare-fun e!156870 () Bool)

(assert (=> b!241732 (= e!156870 e!156873)))

(declare-fun res!118439 () Bool)

(assert (=> b!241732 (=> (not res!118439) (not e!156873))))

(assert (=> b!241732 (= res!118439 (contains!1719 lt!121366 (select (arr!5692 (_keys!6582 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6035 (_keys!6582 thiss!1504))))))

(declare-fun bm!22491 () Bool)

(assert (=> bm!22491 (= call!22489 (contains!1719 lt!121366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241733 () Bool)

(declare-fun res!118438 () Bool)

(assert (=> b!241733 (=> (not res!118438) (not e!156867))))

(assert (=> b!241733 (= res!118438 e!156870)))

(declare-fun res!118436 () Bool)

(assert (=> b!241733 (=> res!118436 e!156870)))

(assert (=> b!241733 (= res!118436 (not e!156871))))

(declare-fun res!118442 () Bool)

(assert (=> b!241733 (=> (not res!118442) (not e!156871))))

(assert (=> b!241733 (= res!118442 (bvslt #b00000000000000000000000000000000 (size!6035 (_keys!6582 thiss!1504))))))

(declare-fun b!241734 () Bool)

(assert (=> b!241734 (= e!156877 e!156869)))

(declare-fun res!118444 () Bool)

(assert (=> b!241734 (= res!118444 call!22489)))

(assert (=> b!241734 (=> (not res!118444) (not e!156869))))

(declare-fun b!241735 () Bool)

(assert (=> b!241735 (= e!156878 (+!655 call!22490 (tuple2!4719 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4318 thiss!1504))))))

(assert (= (and d!59785 c!40317) b!241735))

(assert (= (and d!59785 (not c!40317)) b!241731))

(assert (= (and b!241731 c!40314) b!241729))

(assert (= (and b!241731 (not c!40314)) b!241724))

(assert (= (and b!241724 c!40316) b!241727))

(assert (= (and b!241724 (not c!40316)) b!241719))

(assert (= (or b!241727 b!241719) bm!22486))

(assert (= (or b!241729 bm!22486) bm!22489))

(assert (= (or b!241729 b!241727) bm!22488))

(assert (= (or b!241735 bm!22489) bm!22487))

(assert (= (or b!241735 bm!22488) bm!22490))

(assert (= (and d!59785 res!118437) b!241718))

(assert (= (and d!59785 c!40315) b!241716))

(assert (= (and d!59785 (not c!40315)) b!241726))

(assert (= (and d!59785 res!118440) b!241733))

(assert (= (and b!241733 res!118442) b!241715))

(assert (= (and b!241733 (not res!118436)) b!241732))

(assert (= (and b!241732 res!118439) b!241725))

(assert (= (and b!241733 res!118438) b!241722))

(assert (= (and b!241722 c!40313) b!241734))

(assert (= (and b!241722 (not c!40313)) b!241728))

(assert (= (and b!241734 res!118444) b!241723))

(assert (= (or b!241734 b!241728) bm!22491))

(assert (= (and b!241722 res!118443) b!241717))

(assert (= (and b!241717 c!40318) b!241730))

(assert (= (and b!241717 (not c!40318)) b!241721))

(assert (= (and b!241730 res!118441) b!241720))

(assert (= (or b!241730 b!241721) bm!22485))

(declare-fun b_lambda!7973 () Bool)

(assert (=> (not b_lambda!7973) (not b!241725)))

(declare-fun t!8604 () Bool)

(declare-fun tb!2949 () Bool)

(assert (=> (and b!241494 (= (defaultEntry!4477 thiss!1504) (defaultEntry!4477 thiss!1504)) t!8604) tb!2949))

(declare-fun result!5185 () Bool)

(assert (=> tb!2949 (= result!5185 tp_is_empty!6355)))

(assert (=> b!241725 t!8604))

(declare-fun b_and!13445 () Bool)

(assert (= b_and!13439 (and (=> t!8604 result!5185) b_and!13445)))

(assert (=> b!241725 m!260255))

(assert (=> b!241725 m!260255))

(declare-fun m!260295 () Bool)

(assert (=> b!241725 m!260295))

(declare-fun m!260297 () Bool)

(assert (=> b!241725 m!260297))

(declare-fun m!260299 () Bool)

(assert (=> b!241725 m!260299))

(declare-fun m!260301 () Bool)

(assert (=> b!241725 m!260301))

(assert (=> b!241725 m!260297))

(assert (=> b!241725 m!260299))

(assert (=> d!59785 m!260253))

(declare-fun m!260303 () Bool)

(assert (=> bm!22491 m!260303))

(declare-fun m!260305 () Bool)

(assert (=> bm!22485 m!260305))

(declare-fun m!260307 () Bool)

(assert (=> bm!22487 m!260307))

(declare-fun m!260309 () Bool)

(assert (=> b!241735 m!260309))

(declare-fun m!260311 () Bool)

(assert (=> b!241720 m!260311))

(assert (=> b!241715 m!260255))

(assert (=> b!241715 m!260255))

(declare-fun m!260313 () Bool)

(assert (=> b!241715 m!260313))

(declare-fun m!260315 () Bool)

(assert (=> b!241723 m!260315))

(assert (=> b!241732 m!260255))

(assert (=> b!241732 m!260255))

(declare-fun m!260317 () Bool)

(assert (=> b!241732 m!260317))

(assert (=> b!241718 m!260255))

(assert (=> b!241718 m!260255))

(assert (=> b!241718 m!260313))

(assert (=> b!241716 m!260255))

(declare-fun m!260319 () Bool)

(assert (=> b!241716 m!260319))

(declare-fun m!260321 () Bool)

(assert (=> b!241716 m!260321))

(declare-fun m!260323 () Bool)

(assert (=> b!241716 m!260323))

(declare-fun m!260325 () Bool)

(assert (=> b!241716 m!260325))

(declare-fun m!260327 () Bool)

(assert (=> b!241716 m!260327))

(declare-fun m!260329 () Bool)

(assert (=> b!241716 m!260329))

(declare-fun m!260331 () Bool)

(assert (=> b!241716 m!260331))

(assert (=> b!241716 m!260323))

(declare-fun m!260333 () Bool)

(assert (=> b!241716 m!260333))

(declare-fun m!260335 () Bool)

(assert (=> b!241716 m!260335))

(declare-fun m!260337 () Bool)

(assert (=> b!241716 m!260337))

(declare-fun m!260339 () Bool)

(assert (=> b!241716 m!260339))

(assert (=> b!241716 m!260327))

(declare-fun m!260341 () Bool)

(assert (=> b!241716 m!260341))

(assert (=> b!241716 m!260325))

(declare-fun m!260343 () Bool)

(assert (=> b!241716 m!260343))

(assert (=> b!241716 m!260337))

(declare-fun m!260345 () Bool)

(assert (=> b!241716 m!260345))

(declare-fun m!260347 () Bool)

(assert (=> b!241716 m!260347))

(assert (=> b!241716 m!260307))

(declare-fun m!260349 () Bool)

(assert (=> bm!22490 m!260349))

(assert (=> b!241495 d!59785))

(assert (=> bm!22457 d!59769))

(declare-fun b!241754 () Bool)

(declare-fun e!156890 () Bool)

(declare-fun e!156887 () Bool)

(assert (=> b!241754 (= e!156890 e!156887)))

(declare-fun c!40324 () Bool)

(declare-fun lt!121380 () SeekEntryResult!1058)

(assert (=> b!241754 (= c!40324 ((_ is MissingVacant!1058) lt!121380))))

(declare-fun bm!22496 () Bool)

(declare-fun call!22500 () Bool)

(assert (=> bm!22496 (= call!22500 (arrayContainsKey!0 (_keys!6582 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241755 () Bool)

(declare-fun res!118455 () Bool)

(declare-fun e!156888 () Bool)

(assert (=> b!241755 (=> (not res!118455) (not e!156888))))

(assert (=> b!241755 (= res!118455 (= (select (arr!5692 (_keys!6582 thiss!1504)) (index!6405 lt!121380)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241755 (and (bvsge (index!6405 lt!121380) #b00000000000000000000000000000000) (bvslt (index!6405 lt!121380) (size!6035 (_keys!6582 thiss!1504))))))

(declare-fun b!241756 () Bool)

(declare-fun res!118454 () Bool)

(assert (=> b!241756 (=> (not res!118454) (not e!156888))))

(declare-fun call!22499 () Bool)

(assert (=> b!241756 (= res!118454 call!22499)))

(assert (=> b!241756 (= e!156887 e!156888)))

(declare-fun b!241757 () Bool)

(declare-fun e!156889 () Bool)

(assert (=> b!241757 (= e!156890 e!156889)))

(declare-fun res!118453 () Bool)

(assert (=> b!241757 (= res!118453 call!22499)))

(assert (=> b!241757 (=> (not res!118453) (not e!156889))))

(declare-fun bm!22497 () Bool)

(declare-fun c!40323 () Bool)

(assert (=> bm!22497 (= call!22499 (inRange!0 (ite c!40323 (index!6402 lt!121380) (index!6405 lt!121380)) (mask!10549 thiss!1504)))))

(declare-fun d!59787 () Bool)

(assert (=> d!59787 e!156890))

(assert (=> d!59787 (= c!40323 ((_ is MissingZero!1058) lt!121380))))

(assert (=> d!59787 (= lt!121380 (seekEntryOrOpen!0 key!932 (_keys!6582 thiss!1504) (mask!10549 thiss!1504)))))

(declare-fun lt!121381 () Unit!7435)

(declare-fun choose!1131 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8121 V!8121 (_ BitVec 64) Int) Unit!7435)

(assert (=> d!59787 (= lt!121381 (choose!1131 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)))))

(assert (=> d!59787 (validMask!0 (mask!10549 thiss!1504))))

(assert (=> d!59787 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!355 (_keys!6582 thiss!1504) (_values!4460 thiss!1504) (mask!10549 thiss!1504) (extraKeys!4214 thiss!1504) (zeroValue!4318 thiss!1504) (minValue!4318 thiss!1504) key!932 (defaultEntry!4477 thiss!1504)) lt!121381)))

(declare-fun b!241758 () Bool)

(assert (=> b!241758 (= e!156887 ((_ is Undefined!1058) lt!121380))))

(declare-fun b!241759 () Bool)

(assert (=> b!241759 (= e!156888 (not call!22500))))

(declare-fun b!241760 () Bool)

(assert (=> b!241760 (= e!156889 (not call!22500))))

(declare-fun b!241761 () Bool)

(assert (=> b!241761 (and (bvsge (index!6402 lt!121380) #b00000000000000000000000000000000) (bvslt (index!6402 lt!121380) (size!6035 (_keys!6582 thiss!1504))))))

(declare-fun res!118456 () Bool)

(assert (=> b!241761 (= res!118456 (= (select (arr!5692 (_keys!6582 thiss!1504)) (index!6402 lt!121380)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241761 (=> (not res!118456) (not e!156889))))

(assert (= (and d!59787 c!40323) b!241757))

(assert (= (and d!59787 (not c!40323)) b!241754))

(assert (= (and b!241757 res!118453) b!241761))

(assert (= (and b!241761 res!118456) b!241760))

(assert (= (and b!241754 c!40324) b!241756))

(assert (= (and b!241754 (not c!40324)) b!241758))

(assert (= (and b!241756 res!118454) b!241755))

(assert (= (and b!241755 res!118455) b!241759))

(assert (= (or b!241757 b!241756) bm!22497))

(assert (= (or b!241760 b!241759) bm!22496))

(declare-fun m!260351 () Bool)

(assert (=> b!241755 m!260351))

(declare-fun m!260353 () Bool)

(assert (=> bm!22497 m!260353))

(assert (=> bm!22496 m!260161))

(assert (=> d!59787 m!260171))

(declare-fun m!260355 () Bool)

(assert (=> d!59787 m!260355))

(assert (=> d!59787 m!260253))

(declare-fun m!260357 () Bool)

(assert (=> b!241761 m!260357))

(assert (=> b!241500 d!59787))

(declare-fun condMapEmpty!10777 () Bool)

(declare-fun mapDefault!10777 () ValueCell!2834)

(assert (=> mapNonEmpty!10768 (= condMapEmpty!10777 (= mapRest!10768 ((as const (Array (_ BitVec 32) ValueCell!2834)) mapDefault!10777)))))

(declare-fun e!156895 () Bool)

(declare-fun mapRes!10777 () Bool)

(assert (=> mapNonEmpty!10768 (= tp!22687 (and e!156895 mapRes!10777))))

(declare-fun b!241769 () Bool)

(assert (=> b!241769 (= e!156895 tp_is_empty!6355)))

(declare-fun b!241768 () Bool)

(declare-fun e!156896 () Bool)

(assert (=> b!241768 (= e!156896 tp_is_empty!6355)))

(declare-fun mapIsEmpty!10777 () Bool)

(assert (=> mapIsEmpty!10777 mapRes!10777))

(declare-fun mapNonEmpty!10777 () Bool)

(declare-fun tp!22702 () Bool)

(assert (=> mapNonEmpty!10777 (= mapRes!10777 (and tp!22702 e!156896))))

(declare-fun mapRest!10777 () (Array (_ BitVec 32) ValueCell!2834))

(declare-fun mapKey!10777 () (_ BitVec 32))

(declare-fun mapValue!10777 () ValueCell!2834)

(assert (=> mapNonEmpty!10777 (= mapRest!10768 (store mapRest!10777 mapKey!10777 mapValue!10777))))

(assert (= (and mapNonEmpty!10768 condMapEmpty!10777) mapIsEmpty!10777))

(assert (= (and mapNonEmpty!10768 (not condMapEmpty!10777)) mapNonEmpty!10777))

(assert (= (and mapNonEmpty!10777 ((_ is ValueCellFull!2834) mapValue!10777)) b!241768))

(assert (= (and mapNonEmpty!10768 ((_ is ValueCellFull!2834) mapDefault!10777)) b!241769))

(declare-fun m!260359 () Bool)

(assert (=> mapNonEmpty!10777 m!260359))

(declare-fun b_lambda!7975 () Bool)

(assert (= b_lambda!7973 (or (and b!241494 b_free!6493) b_lambda!7975)))

(check-sat (not b!241652) (not b!241638) (not b!241630) (not bm!22490) (not d!59775) (not bm!22485) (not b_lambda!7975) (not b!241720) (not b!241735) (not mapNonEmpty!10777) tp_is_empty!6355 (not d!59773) (not bm!22491) (not b!241725) (not bm!22487) (not b!241639) (not d!59787) (not b!241723) (not d!59785) (not d!59767) (not d!59783) (not b!241718) (not b!241672) (not b!241716) b_and!13445 (not b_next!6493) (not b!241670) (not b!241662) (not bm!22496) (not b!241732) (not bm!22497) (not b!241637) (not b!241715) (not d!59771))
(check-sat b_and!13445 (not b_next!6493))
