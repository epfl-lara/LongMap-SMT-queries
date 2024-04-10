; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18408 () Bool)

(assert start!18408)

(declare-fun b!182597 () Bool)

(declare-fun b_free!4503 () Bool)

(declare-fun b_next!4503 () Bool)

(assert (=> b!182597 (= b_free!4503 (not b_next!4503))))

(declare-fun tp!16271 () Bool)

(declare-fun b_and!11067 () Bool)

(assert (=> b!182597 (= tp!16271 b_and!11067)))

(declare-fun b!182588 () Bool)

(declare-fun e!120225 () Bool)

(declare-datatypes ((V!5347 0))(
  ( (V!5348 (val!2182 Int)) )
))
(declare-datatypes ((ValueCell!1794 0))(
  ( (ValueCellFull!1794 (v!4082 V!5347)) (EmptyCell!1794) )
))
(declare-datatypes ((array!7737 0))(
  ( (array!7738 (arr!3659 (Array (_ BitVec 32) (_ BitVec 64))) (size!3971 (_ BitVec 32))) )
))
(declare-datatypes ((array!7739 0))(
  ( (array!7740 (arr!3660 (Array (_ BitVec 32) ValueCell!1794)) (size!3972 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2496 0))(
  ( (LongMapFixedSize!2497 (defaultEntry!3735 Int) (mask!8781 (_ BitVec 32)) (extraKeys!3472 (_ BitVec 32)) (zeroValue!3576 V!5347) (minValue!3576 V!5347) (_size!1297 (_ BitVec 32)) (_keys!5648 array!7737) (_values!3718 array!7739) (_vacant!1297 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2496)

(declare-datatypes ((List!2318 0))(
  ( (Nil!2315) (Cons!2314 (h!2943 (_ BitVec 64)) (t!7180 List!2318)) )
))
(declare-fun arrayNoDuplicates!0 (array!7737 (_ BitVec 32) List!2318) Bool)

(assert (=> b!182588 (= e!120225 (not (arrayNoDuplicates!0 (_keys!5648 thiss!1248) #b00000000000000000000000000000000 Nil!2315)))))

(declare-fun b!182589 () Bool)

(declare-fun res!86415 () Bool)

(declare-fun e!120230 () Bool)

(assert (=> b!182589 (=> (not res!86415) (not e!120230))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!182589 (= res!86415 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7337 () Bool)

(declare-fun mapRes!7337 () Bool)

(assert (=> mapIsEmpty!7337 mapRes!7337))

(declare-fun b!182590 () Bool)

(declare-fun res!86412 () Bool)

(assert (=> b!182590 (=> (not res!86412) (not e!120225))))

(assert (=> b!182590 (= res!86412 (and (= (size!3972 (_values!3718 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8781 thiss!1248))) (= (size!3971 (_keys!5648 thiss!1248)) (size!3972 (_values!3718 thiss!1248))) (bvsge (mask!8781 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3472 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3472 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182591 () Bool)

(declare-fun e!120226 () Bool)

(declare-fun tp_is_empty!4275 () Bool)

(assert (=> b!182591 (= e!120226 tp_is_empty!4275)))

(declare-fun b!182592 () Bool)

(declare-fun res!86414 () Bool)

(assert (=> b!182592 (=> (not res!86414) (not e!120225))))

(declare-datatypes ((tuple2!3400 0))(
  ( (tuple2!3401 (_1!1711 (_ BitVec 64)) (_2!1711 V!5347)) )
))
(declare-datatypes ((List!2319 0))(
  ( (Nil!2316) (Cons!2315 (h!2944 tuple2!3400) (t!7181 List!2319)) )
))
(declare-datatypes ((ListLongMap!2317 0))(
  ( (ListLongMap!2318 (toList!1174 List!2319)) )
))
(declare-fun contains!1258 (ListLongMap!2317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!822 (array!7737 array!7739 (_ BitVec 32) (_ BitVec 32) V!5347 V!5347 (_ BitVec 32) Int) ListLongMap!2317)

(assert (=> b!182592 (= res!86414 (contains!1258 (getCurrentListMap!822 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248)) key!828))))

(declare-fun b!182593 () Bool)

(declare-fun res!86413 () Bool)

(assert (=> b!182593 (=> (not res!86413) (not e!120225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7737 (_ BitVec 32)) Bool)

(assert (=> b!182593 (= res!86413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5648 thiss!1248) (mask!8781 thiss!1248)))))

(declare-fun mapNonEmpty!7337 () Bool)

(declare-fun tp!16270 () Bool)

(assert (=> mapNonEmpty!7337 (= mapRes!7337 (and tp!16270 e!120226))))

(declare-fun mapKey!7337 () (_ BitVec 32))

(declare-fun mapRest!7337 () (Array (_ BitVec 32) ValueCell!1794))

(declare-fun mapValue!7337 () ValueCell!1794)

(assert (=> mapNonEmpty!7337 (= (arr!3660 (_values!3718 thiss!1248)) (store mapRest!7337 mapKey!7337 mapValue!7337))))

(declare-fun b!182594 () Bool)

(declare-fun e!120228 () Bool)

(assert (=> b!182594 (= e!120228 tp_is_empty!4275)))

(declare-fun res!86418 () Bool)

(assert (=> start!18408 (=> (not res!86418) (not e!120230))))

(declare-fun valid!1034 (LongMapFixedSize!2496) Bool)

(assert (=> start!18408 (= res!86418 (valid!1034 thiss!1248))))

(assert (=> start!18408 e!120230))

(declare-fun e!120229 () Bool)

(assert (=> start!18408 e!120229))

(assert (=> start!18408 true))

(declare-fun b!182595 () Bool)

(declare-fun e!120224 () Bool)

(assert (=> b!182595 (= e!120224 (and e!120228 mapRes!7337))))

(declare-fun condMapEmpty!7337 () Bool)

(declare-fun mapDefault!7337 () ValueCell!1794)

(assert (=> b!182595 (= condMapEmpty!7337 (= (arr!3660 (_values!3718 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1794)) mapDefault!7337)))))

(declare-fun b!182596 () Bool)

(declare-fun res!86416 () Bool)

(assert (=> b!182596 (=> (not res!86416) (not e!120225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182596 (= res!86416 (validMask!0 (mask!8781 thiss!1248)))))

(declare-fun array_inv!2361 (array!7737) Bool)

(declare-fun array_inv!2362 (array!7739) Bool)

(assert (=> b!182597 (= e!120229 (and tp!16271 tp_is_empty!4275 (array_inv!2361 (_keys!5648 thiss!1248)) (array_inv!2362 (_values!3718 thiss!1248)) e!120224))))

(declare-fun b!182598 () Bool)

(assert (=> b!182598 (= e!120230 e!120225)))

(declare-fun res!86417 () Bool)

(assert (=> b!182598 (=> (not res!86417) (not e!120225))))

(declare-datatypes ((SeekEntryResult!608 0))(
  ( (MissingZero!608 (index!4602 (_ BitVec 32))) (Found!608 (index!4603 (_ BitVec 32))) (Intermediate!608 (undefined!1420 Bool) (index!4604 (_ BitVec 32)) (x!19900 (_ BitVec 32))) (Undefined!608) (MissingVacant!608 (index!4605 (_ BitVec 32))) )
))
(declare-fun lt!90298 () SeekEntryResult!608)

(get-info :version)

(assert (=> b!182598 (= res!86417 (and (not ((_ is Undefined!608) lt!90298)) (not ((_ is MissingVacant!608) lt!90298)) (not ((_ is MissingZero!608) lt!90298)) ((_ is Found!608) lt!90298)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7737 (_ BitVec 32)) SeekEntryResult!608)

(assert (=> b!182598 (= lt!90298 (seekEntryOrOpen!0 key!828 (_keys!5648 thiss!1248) (mask!8781 thiss!1248)))))

(assert (= (and start!18408 res!86418) b!182589))

(assert (= (and b!182589 res!86415) b!182598))

(assert (= (and b!182598 res!86417) b!182592))

(assert (= (and b!182592 res!86414) b!182596))

(assert (= (and b!182596 res!86416) b!182590))

(assert (= (and b!182590 res!86412) b!182593))

(assert (= (and b!182593 res!86413) b!182588))

(assert (= (and b!182595 condMapEmpty!7337) mapIsEmpty!7337))

(assert (= (and b!182595 (not condMapEmpty!7337)) mapNonEmpty!7337))

(assert (= (and mapNonEmpty!7337 ((_ is ValueCellFull!1794) mapValue!7337)) b!182591))

(assert (= (and b!182595 ((_ is ValueCellFull!1794) mapDefault!7337)) b!182594))

(assert (= b!182597 b!182595))

(assert (= start!18408 b!182597))

(declare-fun m!210331 () Bool)

(assert (=> b!182598 m!210331))

(declare-fun m!210333 () Bool)

(assert (=> b!182588 m!210333))

(declare-fun m!210335 () Bool)

(assert (=> b!182596 m!210335))

(declare-fun m!210337 () Bool)

(assert (=> start!18408 m!210337))

(declare-fun m!210339 () Bool)

(assert (=> b!182592 m!210339))

(assert (=> b!182592 m!210339))

(declare-fun m!210341 () Bool)

(assert (=> b!182592 m!210341))

(declare-fun m!210343 () Bool)

(assert (=> mapNonEmpty!7337 m!210343))

(declare-fun m!210345 () Bool)

(assert (=> b!182593 m!210345))

(declare-fun m!210347 () Bool)

(assert (=> b!182597 m!210347))

(declare-fun m!210349 () Bool)

(assert (=> b!182597 m!210349))

(check-sat (not start!18408) (not b!182597) (not b_next!4503) (not b!182592) tp_is_empty!4275 (not b!182593) (not b!182596) b_and!11067 (not b!182588) (not mapNonEmpty!7337) (not b!182598))
(check-sat b_and!11067 (not b_next!4503))
(get-model)

(declare-fun d!54643 () Bool)

(declare-fun res!86446 () Bool)

(declare-fun e!120254 () Bool)

(assert (=> d!54643 (=> (not res!86446) (not e!120254))))

(declare-fun simpleValid!172 (LongMapFixedSize!2496) Bool)

(assert (=> d!54643 (= res!86446 (simpleValid!172 thiss!1248))))

(assert (=> d!54643 (= (valid!1034 thiss!1248) e!120254)))

(declare-fun b!182638 () Bool)

(declare-fun res!86447 () Bool)

(assert (=> b!182638 (=> (not res!86447) (not e!120254))))

(declare-fun arrayCountValidKeys!0 (array!7737 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182638 (= res!86447 (= (arrayCountValidKeys!0 (_keys!5648 thiss!1248) #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))) (_size!1297 thiss!1248)))))

(declare-fun b!182639 () Bool)

(declare-fun res!86448 () Bool)

(assert (=> b!182639 (=> (not res!86448) (not e!120254))))

(assert (=> b!182639 (= res!86448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5648 thiss!1248) (mask!8781 thiss!1248)))))

(declare-fun b!182640 () Bool)

(assert (=> b!182640 (= e!120254 (arrayNoDuplicates!0 (_keys!5648 thiss!1248) #b00000000000000000000000000000000 Nil!2315))))

(assert (= (and d!54643 res!86446) b!182638))

(assert (= (and b!182638 res!86447) b!182639))

(assert (= (and b!182639 res!86448) b!182640))

(declare-fun m!210371 () Bool)

(assert (=> d!54643 m!210371))

(declare-fun m!210373 () Bool)

(assert (=> b!182638 m!210373))

(assert (=> b!182639 m!210345))

(assert (=> b!182640 m!210333))

(assert (=> start!18408 d!54643))

(declare-fun b!182653 () Bool)

(declare-fun e!120262 () SeekEntryResult!608)

(declare-fun e!120263 () SeekEntryResult!608)

(assert (=> b!182653 (= e!120262 e!120263)))

(declare-fun lt!90310 () (_ BitVec 64))

(declare-fun lt!90308 () SeekEntryResult!608)

(assert (=> b!182653 (= lt!90310 (select (arr!3659 (_keys!5648 thiss!1248)) (index!4604 lt!90308)))))

(declare-fun c!32754 () Bool)

(assert (=> b!182653 (= c!32754 (= lt!90310 key!828))))

(declare-fun b!182654 () Bool)

(declare-fun c!32752 () Bool)

(assert (=> b!182654 (= c!32752 (= lt!90310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120261 () SeekEntryResult!608)

(assert (=> b!182654 (= e!120263 e!120261)))

(declare-fun b!182655 () Bool)

(assert (=> b!182655 (= e!120261 (MissingZero!608 (index!4604 lt!90308)))))

(declare-fun b!182656 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7737 (_ BitVec 32)) SeekEntryResult!608)

(assert (=> b!182656 (= e!120261 (seekKeyOrZeroReturnVacant!0 (x!19900 lt!90308) (index!4604 lt!90308) (index!4604 lt!90308) key!828 (_keys!5648 thiss!1248) (mask!8781 thiss!1248)))))

(declare-fun b!182657 () Bool)

(assert (=> b!182657 (= e!120263 (Found!608 (index!4604 lt!90308)))))

(declare-fun b!182658 () Bool)

(assert (=> b!182658 (= e!120262 Undefined!608)))

(declare-fun d!54645 () Bool)

(declare-fun lt!90309 () SeekEntryResult!608)

(assert (=> d!54645 (and (or ((_ is Undefined!608) lt!90309) (not ((_ is Found!608) lt!90309)) (and (bvsge (index!4603 lt!90309) #b00000000000000000000000000000000) (bvslt (index!4603 lt!90309) (size!3971 (_keys!5648 thiss!1248))))) (or ((_ is Undefined!608) lt!90309) ((_ is Found!608) lt!90309) (not ((_ is MissingZero!608) lt!90309)) (and (bvsge (index!4602 lt!90309) #b00000000000000000000000000000000) (bvslt (index!4602 lt!90309) (size!3971 (_keys!5648 thiss!1248))))) (or ((_ is Undefined!608) lt!90309) ((_ is Found!608) lt!90309) ((_ is MissingZero!608) lt!90309) (not ((_ is MissingVacant!608) lt!90309)) (and (bvsge (index!4605 lt!90309) #b00000000000000000000000000000000) (bvslt (index!4605 lt!90309) (size!3971 (_keys!5648 thiss!1248))))) (or ((_ is Undefined!608) lt!90309) (ite ((_ is Found!608) lt!90309) (= (select (arr!3659 (_keys!5648 thiss!1248)) (index!4603 lt!90309)) key!828) (ite ((_ is MissingZero!608) lt!90309) (= (select (arr!3659 (_keys!5648 thiss!1248)) (index!4602 lt!90309)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!608) lt!90309) (= (select (arr!3659 (_keys!5648 thiss!1248)) (index!4605 lt!90309)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54645 (= lt!90309 e!120262)))

(declare-fun c!32753 () Bool)

(assert (=> d!54645 (= c!32753 (and ((_ is Intermediate!608) lt!90308) (undefined!1420 lt!90308)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7737 (_ BitVec 32)) SeekEntryResult!608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54645 (= lt!90308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8781 thiss!1248)) key!828 (_keys!5648 thiss!1248) (mask!8781 thiss!1248)))))

(assert (=> d!54645 (validMask!0 (mask!8781 thiss!1248))))

(assert (=> d!54645 (= (seekEntryOrOpen!0 key!828 (_keys!5648 thiss!1248) (mask!8781 thiss!1248)) lt!90309)))

(assert (= (and d!54645 c!32753) b!182658))

(assert (= (and d!54645 (not c!32753)) b!182653))

(assert (= (and b!182653 c!32754) b!182657))

(assert (= (and b!182653 (not c!32754)) b!182654))

(assert (= (and b!182654 c!32752) b!182655))

(assert (= (and b!182654 (not c!32752)) b!182656))

(declare-fun m!210375 () Bool)

(assert (=> b!182653 m!210375))

(declare-fun m!210377 () Bool)

(assert (=> b!182656 m!210377))

(declare-fun m!210379 () Bool)

(assert (=> d!54645 m!210379))

(assert (=> d!54645 m!210335))

(declare-fun m!210381 () Bool)

(assert (=> d!54645 m!210381))

(declare-fun m!210383 () Bool)

(assert (=> d!54645 m!210383))

(declare-fun m!210385 () Bool)

(assert (=> d!54645 m!210385))

(assert (=> d!54645 m!210381))

(declare-fun m!210387 () Bool)

(assert (=> d!54645 m!210387))

(assert (=> b!182598 d!54645))

(declare-fun d!54647 () Bool)

(declare-fun res!86455 () Bool)

(declare-fun e!120275 () Bool)

(assert (=> d!54647 (=> res!86455 e!120275)))

(assert (=> d!54647 (= res!86455 (bvsge #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))))))

(assert (=> d!54647 (= (arrayNoDuplicates!0 (_keys!5648 thiss!1248) #b00000000000000000000000000000000 Nil!2315) e!120275)))

(declare-fun bm!18433 () Bool)

(declare-fun call!18436 () Bool)

(declare-fun c!32757 () Bool)

(assert (=> bm!18433 (= call!18436 (arrayNoDuplicates!0 (_keys!5648 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32757 (Cons!2314 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000) Nil!2315) Nil!2315)))))

(declare-fun b!182669 () Bool)

(declare-fun e!120272 () Bool)

(assert (=> b!182669 (= e!120272 call!18436)))

(declare-fun b!182670 () Bool)

(declare-fun e!120273 () Bool)

(assert (=> b!182670 (= e!120275 e!120273)))

(declare-fun res!86456 () Bool)

(assert (=> b!182670 (=> (not res!86456) (not e!120273))))

(declare-fun e!120274 () Bool)

(assert (=> b!182670 (= res!86456 (not e!120274))))

(declare-fun res!86457 () Bool)

(assert (=> b!182670 (=> (not res!86457) (not e!120274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182670 (= res!86457 (validKeyInArray!0 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182671 () Bool)

(assert (=> b!182671 (= e!120273 e!120272)))

(assert (=> b!182671 (= c!32757 (validKeyInArray!0 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182672 () Bool)

(assert (=> b!182672 (= e!120272 call!18436)))

(declare-fun b!182673 () Bool)

(declare-fun contains!1260 (List!2318 (_ BitVec 64)) Bool)

(assert (=> b!182673 (= e!120274 (contains!1260 Nil!2315 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54647 (not res!86455)) b!182670))

(assert (= (and b!182670 res!86457) b!182673))

(assert (= (and b!182670 res!86456) b!182671))

(assert (= (and b!182671 c!32757) b!182672))

(assert (= (and b!182671 (not c!32757)) b!182669))

(assert (= (or b!182672 b!182669) bm!18433))

(declare-fun m!210389 () Bool)

(assert (=> bm!18433 m!210389))

(declare-fun m!210391 () Bool)

(assert (=> bm!18433 m!210391))

(assert (=> b!182670 m!210389))

(assert (=> b!182670 m!210389))

(declare-fun m!210393 () Bool)

(assert (=> b!182670 m!210393))

(assert (=> b!182671 m!210389))

(assert (=> b!182671 m!210389))

(assert (=> b!182671 m!210393))

(assert (=> b!182673 m!210389))

(assert (=> b!182673 m!210389))

(declare-fun m!210395 () Bool)

(assert (=> b!182673 m!210395))

(assert (=> b!182588 d!54647))

(declare-fun d!54649 () Bool)

(assert (=> d!54649 (= (array_inv!2361 (_keys!5648 thiss!1248)) (bvsge (size!3971 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182597 d!54649))

(declare-fun d!54651 () Bool)

(assert (=> d!54651 (= (array_inv!2362 (_values!3718 thiss!1248)) (bvsge (size!3972 (_values!3718 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182597 d!54651))

(declare-fun b!182682 () Bool)

(declare-fun e!120282 () Bool)

(declare-fun e!120283 () Bool)

(assert (=> b!182682 (= e!120282 e!120283)))

(declare-fun lt!90318 () (_ BitVec 64))

(assert (=> b!182682 (= lt!90318 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5536 0))(
  ( (Unit!5537) )
))
(declare-fun lt!90319 () Unit!5536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7737 (_ BitVec 64) (_ BitVec 32)) Unit!5536)

(assert (=> b!182682 (= lt!90319 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5648 thiss!1248) lt!90318 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182682 (arrayContainsKey!0 (_keys!5648 thiss!1248) lt!90318 #b00000000000000000000000000000000)))

(declare-fun lt!90317 () Unit!5536)

(assert (=> b!182682 (= lt!90317 lt!90319)))

(declare-fun res!86463 () Bool)

(assert (=> b!182682 (= res!86463 (= (seekEntryOrOpen!0 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000) (_keys!5648 thiss!1248) (mask!8781 thiss!1248)) (Found!608 #b00000000000000000000000000000000)))))

(assert (=> b!182682 (=> (not res!86463) (not e!120283))))

(declare-fun b!182683 () Bool)

(declare-fun call!18439 () Bool)

(assert (=> b!182683 (= e!120282 call!18439)))

(declare-fun b!182684 () Bool)

(declare-fun e!120284 () Bool)

(assert (=> b!182684 (= e!120284 e!120282)))

(declare-fun c!32760 () Bool)

(assert (=> b!182684 (= c!32760 (validKeyInArray!0 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18436 () Bool)

(assert (=> bm!18436 (= call!18439 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5648 thiss!1248) (mask!8781 thiss!1248)))))

(declare-fun d!54653 () Bool)

(declare-fun res!86462 () Bool)

(assert (=> d!54653 (=> res!86462 e!120284)))

(assert (=> d!54653 (= res!86462 (bvsge #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))))))

(assert (=> d!54653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5648 thiss!1248) (mask!8781 thiss!1248)) e!120284)))

(declare-fun b!182685 () Bool)

(assert (=> b!182685 (= e!120283 call!18439)))

(assert (= (and d!54653 (not res!86462)) b!182684))

(assert (= (and b!182684 c!32760) b!182682))

(assert (= (and b!182684 (not c!32760)) b!182683))

(assert (= (and b!182682 res!86463) b!182685))

(assert (= (or b!182685 b!182683) bm!18436))

(assert (=> b!182682 m!210389))

(declare-fun m!210397 () Bool)

(assert (=> b!182682 m!210397))

(declare-fun m!210399 () Bool)

(assert (=> b!182682 m!210399))

(assert (=> b!182682 m!210389))

(declare-fun m!210401 () Bool)

(assert (=> b!182682 m!210401))

(assert (=> b!182684 m!210389))

(assert (=> b!182684 m!210389))

(assert (=> b!182684 m!210393))

(declare-fun m!210403 () Bool)

(assert (=> bm!18436 m!210403))

(assert (=> b!182593 d!54653))

(declare-fun d!54655 () Bool)

(assert (=> d!54655 (= (validMask!0 (mask!8781 thiss!1248)) (and (or (= (mask!8781 thiss!1248) #b00000000000000000000000000000111) (= (mask!8781 thiss!1248) #b00000000000000000000000000001111) (= (mask!8781 thiss!1248) #b00000000000000000000000000011111) (= (mask!8781 thiss!1248) #b00000000000000000000000000111111) (= (mask!8781 thiss!1248) #b00000000000000000000000001111111) (= (mask!8781 thiss!1248) #b00000000000000000000000011111111) (= (mask!8781 thiss!1248) #b00000000000000000000000111111111) (= (mask!8781 thiss!1248) #b00000000000000000000001111111111) (= (mask!8781 thiss!1248) #b00000000000000000000011111111111) (= (mask!8781 thiss!1248) #b00000000000000000000111111111111) (= (mask!8781 thiss!1248) #b00000000000000000001111111111111) (= (mask!8781 thiss!1248) #b00000000000000000011111111111111) (= (mask!8781 thiss!1248) #b00000000000000000111111111111111) (= (mask!8781 thiss!1248) #b00000000000000001111111111111111) (= (mask!8781 thiss!1248) #b00000000000000011111111111111111) (= (mask!8781 thiss!1248) #b00000000000000111111111111111111) (= (mask!8781 thiss!1248) #b00000000000001111111111111111111) (= (mask!8781 thiss!1248) #b00000000000011111111111111111111) (= (mask!8781 thiss!1248) #b00000000000111111111111111111111) (= (mask!8781 thiss!1248) #b00000000001111111111111111111111) (= (mask!8781 thiss!1248) #b00000000011111111111111111111111) (= (mask!8781 thiss!1248) #b00000000111111111111111111111111) (= (mask!8781 thiss!1248) #b00000001111111111111111111111111) (= (mask!8781 thiss!1248) #b00000011111111111111111111111111) (= (mask!8781 thiss!1248) #b00000111111111111111111111111111) (= (mask!8781 thiss!1248) #b00001111111111111111111111111111) (= (mask!8781 thiss!1248) #b00011111111111111111111111111111) (= (mask!8781 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8781 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182596 d!54655))

(declare-fun d!54657 () Bool)

(declare-fun e!120289 () Bool)

(assert (=> d!54657 e!120289))

(declare-fun res!86466 () Bool)

(assert (=> d!54657 (=> res!86466 e!120289)))

(declare-fun lt!90329 () Bool)

(assert (=> d!54657 (= res!86466 (not lt!90329))))

(declare-fun lt!90330 () Bool)

(assert (=> d!54657 (= lt!90329 lt!90330)))

(declare-fun lt!90328 () Unit!5536)

(declare-fun e!120290 () Unit!5536)

(assert (=> d!54657 (= lt!90328 e!120290)))

(declare-fun c!32763 () Bool)

(assert (=> d!54657 (= c!32763 lt!90330)))

(declare-fun containsKey!217 (List!2319 (_ BitVec 64)) Bool)

(assert (=> d!54657 (= lt!90330 (containsKey!217 (toList!1174 (getCurrentListMap!822 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248))) key!828))))

(assert (=> d!54657 (= (contains!1258 (getCurrentListMap!822 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248)) key!828) lt!90329)))

(declare-fun b!182692 () Bool)

(declare-fun lt!90331 () Unit!5536)

(assert (=> b!182692 (= e!120290 lt!90331)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!165 (List!2319 (_ BitVec 64)) Unit!5536)

(assert (=> b!182692 (= lt!90331 (lemmaContainsKeyImpliesGetValueByKeyDefined!165 (toList!1174 (getCurrentListMap!822 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248))) key!828))))

(declare-datatypes ((Option!219 0))(
  ( (Some!218 (v!4084 V!5347)) (None!217) )
))
(declare-fun isDefined!166 (Option!219) Bool)

(declare-fun getValueByKey!213 (List!2319 (_ BitVec 64)) Option!219)

(assert (=> b!182692 (isDefined!166 (getValueByKey!213 (toList!1174 (getCurrentListMap!822 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248))) key!828))))

(declare-fun b!182693 () Bool)

(declare-fun Unit!5538 () Unit!5536)

(assert (=> b!182693 (= e!120290 Unit!5538)))

(declare-fun b!182694 () Bool)

(assert (=> b!182694 (= e!120289 (isDefined!166 (getValueByKey!213 (toList!1174 (getCurrentListMap!822 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248))) key!828)))))

(assert (= (and d!54657 c!32763) b!182692))

(assert (= (and d!54657 (not c!32763)) b!182693))

(assert (= (and d!54657 (not res!86466)) b!182694))

(declare-fun m!210405 () Bool)

(assert (=> d!54657 m!210405))

(declare-fun m!210407 () Bool)

(assert (=> b!182692 m!210407))

(declare-fun m!210409 () Bool)

(assert (=> b!182692 m!210409))

(assert (=> b!182692 m!210409))

(declare-fun m!210411 () Bool)

(assert (=> b!182692 m!210411))

(assert (=> b!182694 m!210409))

(assert (=> b!182694 m!210409))

(assert (=> b!182694 m!210411))

(assert (=> b!182592 d!54657))

(declare-fun b!182737 () Bool)

(declare-fun e!120324 () Bool)

(declare-fun lt!90392 () ListLongMap!2317)

(declare-fun apply!156 (ListLongMap!2317 (_ BitVec 64)) V!5347)

(assert (=> b!182737 (= e!120324 (= (apply!156 lt!90392 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3576 thiss!1248)))))

(declare-fun b!182738 () Bool)

(declare-fun e!120322 () ListLongMap!2317)

(declare-fun e!120326 () ListLongMap!2317)

(assert (=> b!182738 (= e!120322 e!120326)))

(declare-fun c!32780 () Bool)

(assert (=> b!182738 (= c!32780 (and (not (= (bvand (extraKeys!3472 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3472 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182739 () Bool)

(declare-fun e!120321 () Bool)

(assert (=> b!182739 (= e!120321 (validKeyInArray!0 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182740 () Bool)

(declare-fun e!120319 () Unit!5536)

(declare-fun lt!90389 () Unit!5536)

(assert (=> b!182740 (= e!120319 lt!90389)))

(declare-fun lt!90395 () ListLongMap!2317)

(declare-fun getCurrentListMapNoExtraKeys!189 (array!7737 array!7739 (_ BitVec 32) (_ BitVec 32) V!5347 V!5347 (_ BitVec 32) Int) ListLongMap!2317)

(assert (=> b!182740 (= lt!90395 (getCurrentListMapNoExtraKeys!189 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248)))))

(declare-fun lt!90385 () (_ BitVec 64))

(assert (=> b!182740 (= lt!90385 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90379 () (_ BitVec 64))

(assert (=> b!182740 (= lt!90379 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90394 () Unit!5536)

(declare-fun addStillContains!132 (ListLongMap!2317 (_ BitVec 64) V!5347 (_ BitVec 64)) Unit!5536)

(assert (=> b!182740 (= lt!90394 (addStillContains!132 lt!90395 lt!90385 (zeroValue!3576 thiss!1248) lt!90379))))

(declare-fun +!276 (ListLongMap!2317 tuple2!3400) ListLongMap!2317)

(assert (=> b!182740 (contains!1258 (+!276 lt!90395 (tuple2!3401 lt!90385 (zeroValue!3576 thiss!1248))) lt!90379)))

(declare-fun lt!90380 () Unit!5536)

(assert (=> b!182740 (= lt!90380 lt!90394)))

(declare-fun lt!90387 () ListLongMap!2317)

(assert (=> b!182740 (= lt!90387 (getCurrentListMapNoExtraKeys!189 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248)))))

(declare-fun lt!90382 () (_ BitVec 64))

(assert (=> b!182740 (= lt!90382 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90386 () (_ BitVec 64))

(assert (=> b!182740 (= lt!90386 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90396 () Unit!5536)

(declare-fun addApplyDifferent!132 (ListLongMap!2317 (_ BitVec 64) V!5347 (_ BitVec 64)) Unit!5536)

(assert (=> b!182740 (= lt!90396 (addApplyDifferent!132 lt!90387 lt!90382 (minValue!3576 thiss!1248) lt!90386))))

(assert (=> b!182740 (= (apply!156 (+!276 lt!90387 (tuple2!3401 lt!90382 (minValue!3576 thiss!1248))) lt!90386) (apply!156 lt!90387 lt!90386))))

(declare-fun lt!90381 () Unit!5536)

(assert (=> b!182740 (= lt!90381 lt!90396)))

(declare-fun lt!90383 () ListLongMap!2317)

(assert (=> b!182740 (= lt!90383 (getCurrentListMapNoExtraKeys!189 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248)))))

(declare-fun lt!90390 () (_ BitVec 64))

(assert (=> b!182740 (= lt!90390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90376 () (_ BitVec 64))

(assert (=> b!182740 (= lt!90376 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90377 () Unit!5536)

(assert (=> b!182740 (= lt!90377 (addApplyDifferent!132 lt!90383 lt!90390 (zeroValue!3576 thiss!1248) lt!90376))))

(assert (=> b!182740 (= (apply!156 (+!276 lt!90383 (tuple2!3401 lt!90390 (zeroValue!3576 thiss!1248))) lt!90376) (apply!156 lt!90383 lt!90376))))

(declare-fun lt!90378 () Unit!5536)

(assert (=> b!182740 (= lt!90378 lt!90377)))

(declare-fun lt!90384 () ListLongMap!2317)

(assert (=> b!182740 (= lt!90384 (getCurrentListMapNoExtraKeys!189 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248)))))

(declare-fun lt!90393 () (_ BitVec 64))

(assert (=> b!182740 (= lt!90393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90388 () (_ BitVec 64))

(assert (=> b!182740 (= lt!90388 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182740 (= lt!90389 (addApplyDifferent!132 lt!90384 lt!90393 (minValue!3576 thiss!1248) lt!90388))))

(assert (=> b!182740 (= (apply!156 (+!276 lt!90384 (tuple2!3401 lt!90393 (minValue!3576 thiss!1248))) lt!90388) (apply!156 lt!90384 lt!90388))))

(declare-fun b!182741 () Bool)

(declare-fun e!120328 () Bool)

(assert (=> b!182741 (= e!120328 e!120324)))

(declare-fun res!86493 () Bool)

(declare-fun call!18455 () Bool)

(assert (=> b!182741 (= res!86493 call!18455)))

(assert (=> b!182741 (=> (not res!86493) (not e!120324))))

(declare-fun b!182742 () Bool)

(declare-fun e!120320 () Bool)

(declare-fun call!18460 () Bool)

(assert (=> b!182742 (= e!120320 (not call!18460))))

(declare-fun b!182743 () Bool)

(declare-fun e!120318 () Bool)

(assert (=> b!182743 (= e!120318 e!120328)))

(declare-fun c!32781 () Bool)

(assert (=> b!182743 (= c!32781 (not (= (bvand (extraKeys!3472 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182744 () Bool)

(declare-fun res!86491 () Bool)

(assert (=> b!182744 (=> (not res!86491) (not e!120318))))

(assert (=> b!182744 (= res!86491 e!120320)))

(declare-fun c!32777 () Bool)

(assert (=> b!182744 (= c!32777 (not (= (bvand (extraKeys!3472 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!182745 () Bool)

(declare-fun e!120325 () Bool)

(assert (=> b!182745 (= e!120325 (= (apply!156 lt!90392 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3576 thiss!1248)))))

(declare-fun b!182746 () Bool)

(assert (=> b!182746 (= e!120320 e!120325)))

(declare-fun res!86490 () Bool)

(assert (=> b!182746 (= res!86490 call!18460)))

(assert (=> b!182746 (=> (not res!86490) (not e!120325))))

(declare-fun b!182747 () Bool)

(declare-fun e!120317 () ListLongMap!2317)

(declare-fun call!18456 () ListLongMap!2317)

(assert (=> b!182747 (= e!120317 call!18456)))

(declare-fun b!182748 () Bool)

(declare-fun e!120327 () Bool)

(declare-fun e!120329 () Bool)

(assert (=> b!182748 (= e!120327 e!120329)))

(declare-fun res!86492 () Bool)

(assert (=> b!182748 (=> (not res!86492) (not e!120329))))

(assert (=> b!182748 (= res!86492 (contains!1258 lt!90392 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182748 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))))))

(declare-fun b!182749 () Bool)

(declare-fun call!18454 () ListLongMap!2317)

(assert (=> b!182749 (= e!120322 (+!276 call!18454 (tuple2!3401 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3576 thiss!1248))))))

(declare-fun bm!18451 () Bool)

(declare-fun call!18457 () ListLongMap!2317)

(declare-fun call!18458 () ListLongMap!2317)

(assert (=> bm!18451 (= call!18457 call!18458)))

(declare-fun bm!18452 () Bool)

(declare-fun call!18459 () ListLongMap!2317)

(assert (=> bm!18452 (= call!18459 call!18457)))

(declare-fun d!54659 () Bool)

(assert (=> d!54659 e!120318))

(declare-fun res!86487 () Bool)

(assert (=> d!54659 (=> (not res!86487) (not e!120318))))

(assert (=> d!54659 (= res!86487 (or (bvsge #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))))))))

(declare-fun lt!90391 () ListLongMap!2317)

(assert (=> d!54659 (= lt!90392 lt!90391)))

(declare-fun lt!90397 () Unit!5536)

(assert (=> d!54659 (= lt!90397 e!120319)))

(declare-fun c!32778 () Bool)

(declare-fun e!120323 () Bool)

(assert (=> d!54659 (= c!32778 e!120323)))

(declare-fun res!86485 () Bool)

(assert (=> d!54659 (=> (not res!86485) (not e!120323))))

(assert (=> d!54659 (= res!86485 (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))))))

(assert (=> d!54659 (= lt!90391 e!120322)))

(declare-fun c!32776 () Bool)

(assert (=> d!54659 (= c!32776 (and (not (= (bvand (extraKeys!3472 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3472 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54659 (validMask!0 (mask!8781 thiss!1248))))

(assert (=> d!54659 (= (getCurrentListMap!822 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248)) lt!90392)))

(declare-fun b!182750 () Bool)

(assert (=> b!182750 (= e!120326 call!18456)))

(declare-fun bm!18453 () Bool)

(assert (=> bm!18453 (= call!18454 (+!276 (ite c!32776 call!18458 (ite c!32780 call!18457 call!18459)) (ite (or c!32776 c!32780) (tuple2!3401 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3576 thiss!1248)) (tuple2!3401 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3576 thiss!1248)))))))

(declare-fun b!182751 () Bool)

(assert (=> b!182751 (= e!120323 (validKeyInArray!0 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182752 () Bool)

(declare-fun get!2097 (ValueCell!1794 V!5347) V!5347)

(declare-fun dynLambda!499 (Int (_ BitVec 64)) V!5347)

(assert (=> b!182752 (= e!120329 (= (apply!156 lt!90392 (select (arr!3659 (_keys!5648 thiss!1248)) #b00000000000000000000000000000000)) (get!2097 (select (arr!3660 (_values!3718 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!499 (defaultEntry!3735 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3972 (_values!3718 thiss!1248))))))

(assert (=> b!182752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))))))

(declare-fun b!182753 () Bool)

(assert (=> b!182753 (= e!120317 call!18459)))

(declare-fun b!182754 () Bool)

(assert (=> b!182754 (= e!120328 (not call!18455))))

(declare-fun bm!18454 () Bool)

(assert (=> bm!18454 (= call!18456 call!18454)))

(declare-fun bm!18455 () Bool)

(assert (=> bm!18455 (= call!18460 (contains!1258 lt!90392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182755 () Bool)

(declare-fun c!32779 () Bool)

(assert (=> b!182755 (= c!32779 (and (not (= (bvand (extraKeys!3472 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3472 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!182755 (= e!120326 e!120317)))

(declare-fun bm!18456 () Bool)

(assert (=> bm!18456 (= call!18458 (getCurrentListMapNoExtraKeys!189 (_keys!5648 thiss!1248) (_values!3718 thiss!1248) (mask!8781 thiss!1248) (extraKeys!3472 thiss!1248) (zeroValue!3576 thiss!1248) (minValue!3576 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3735 thiss!1248)))))

(declare-fun bm!18457 () Bool)

(assert (=> bm!18457 (= call!18455 (contains!1258 lt!90392 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182756 () Bool)

(declare-fun Unit!5539 () Unit!5536)

(assert (=> b!182756 (= e!120319 Unit!5539)))

(declare-fun b!182757 () Bool)

(declare-fun res!86486 () Bool)

(assert (=> b!182757 (=> (not res!86486) (not e!120318))))

(assert (=> b!182757 (= res!86486 e!120327)))

(declare-fun res!86489 () Bool)

(assert (=> b!182757 (=> res!86489 e!120327)))

(assert (=> b!182757 (= res!86489 (not e!120321))))

(declare-fun res!86488 () Bool)

(assert (=> b!182757 (=> (not res!86488) (not e!120321))))

(assert (=> b!182757 (= res!86488 (bvslt #b00000000000000000000000000000000 (size!3971 (_keys!5648 thiss!1248))))))

(assert (= (and d!54659 c!32776) b!182749))

(assert (= (and d!54659 (not c!32776)) b!182738))

(assert (= (and b!182738 c!32780) b!182750))

(assert (= (and b!182738 (not c!32780)) b!182755))

(assert (= (and b!182755 c!32779) b!182747))

(assert (= (and b!182755 (not c!32779)) b!182753))

(assert (= (or b!182747 b!182753) bm!18452))

(assert (= (or b!182750 bm!18452) bm!18451))

(assert (= (or b!182750 b!182747) bm!18454))

(assert (= (or b!182749 bm!18451) bm!18456))

(assert (= (or b!182749 bm!18454) bm!18453))

(assert (= (and d!54659 res!86485) b!182751))

(assert (= (and d!54659 c!32778) b!182740))

(assert (= (and d!54659 (not c!32778)) b!182756))

(assert (= (and d!54659 res!86487) b!182757))

(assert (= (and b!182757 res!86488) b!182739))

(assert (= (and b!182757 (not res!86489)) b!182748))

(assert (= (and b!182748 res!86492) b!182752))

(assert (= (and b!182757 res!86486) b!182744))

(assert (= (and b!182744 c!32777) b!182746))

(assert (= (and b!182744 (not c!32777)) b!182742))

(assert (= (and b!182746 res!86490) b!182745))

(assert (= (or b!182746 b!182742) bm!18455))

(assert (= (and b!182744 res!86491) b!182743))

(assert (= (and b!182743 c!32781) b!182741))

(assert (= (and b!182743 (not c!32781)) b!182754))

(assert (= (and b!182741 res!86493) b!182737))

(assert (= (or b!182741 b!182754) bm!18457))

(declare-fun b_lambda!7179 () Bool)

(assert (=> (not b_lambda!7179) (not b!182752)))

(declare-fun t!7185 () Bool)

(declare-fun tb!2823 () Bool)

(assert (=> (and b!182597 (= (defaultEntry!3735 thiss!1248) (defaultEntry!3735 thiss!1248)) t!7185) tb!2823))

(declare-fun result!4747 () Bool)

(assert (=> tb!2823 (= result!4747 tp_is_empty!4275)))

(assert (=> b!182752 t!7185))

(declare-fun b_and!11071 () Bool)

(assert (= b_and!11067 (and (=> t!7185 result!4747) b_and!11071)))

(declare-fun m!210413 () Bool)

(assert (=> b!182745 m!210413))

(assert (=> b!182751 m!210389))

(assert (=> b!182751 m!210389))

(assert (=> b!182751 m!210393))

(declare-fun m!210415 () Bool)

(assert (=> b!182752 m!210415))

(assert (=> b!182752 m!210415))

(declare-fun m!210417 () Bool)

(assert (=> b!182752 m!210417))

(declare-fun m!210419 () Bool)

(assert (=> b!182752 m!210419))

(assert (=> b!182752 m!210389))

(assert (=> b!182752 m!210389))

(declare-fun m!210421 () Bool)

(assert (=> b!182752 m!210421))

(assert (=> b!182752 m!210417))

(assert (=> b!182748 m!210389))

(assert (=> b!182748 m!210389))

(declare-fun m!210423 () Bool)

(assert (=> b!182748 m!210423))

(assert (=> b!182739 m!210389))

(assert (=> b!182739 m!210389))

(assert (=> b!182739 m!210393))

(declare-fun m!210425 () Bool)

(assert (=> bm!18455 m!210425))

(declare-fun m!210427 () Bool)

(assert (=> b!182737 m!210427))

(declare-fun m!210429 () Bool)

(assert (=> bm!18457 m!210429))

(declare-fun m!210431 () Bool)

(assert (=> bm!18456 m!210431))

(declare-fun m!210433 () Bool)

(assert (=> b!182749 m!210433))

(declare-fun m!210435 () Bool)

(assert (=> bm!18453 m!210435))

(declare-fun m!210437 () Bool)

(assert (=> b!182740 m!210437))

(declare-fun m!210439 () Bool)

(assert (=> b!182740 m!210439))

(declare-fun m!210441 () Bool)

(assert (=> b!182740 m!210441))

(declare-fun m!210443 () Bool)

(assert (=> b!182740 m!210443))

(assert (=> b!182740 m!210431))

(declare-fun m!210445 () Bool)

(assert (=> b!182740 m!210445))

(declare-fun m!210447 () Bool)

(assert (=> b!182740 m!210447))

(assert (=> b!182740 m!210445))

(assert (=> b!182740 m!210441))

(declare-fun m!210449 () Bool)

(assert (=> b!182740 m!210449))

(declare-fun m!210451 () Bool)

(assert (=> b!182740 m!210451))

(declare-fun m!210453 () Bool)

(assert (=> b!182740 m!210453))

(assert (=> b!182740 m!210437))

(declare-fun m!210455 () Bool)

(assert (=> b!182740 m!210455))

(declare-fun m!210457 () Bool)

(assert (=> b!182740 m!210457))

(declare-fun m!210459 () Bool)

(assert (=> b!182740 m!210459))

(declare-fun m!210461 () Bool)

(assert (=> b!182740 m!210461))

(assert (=> b!182740 m!210389))

(declare-fun m!210463 () Bool)

(assert (=> b!182740 m!210463))

(assert (=> b!182740 m!210443))

(declare-fun m!210465 () Bool)

(assert (=> b!182740 m!210465))

(assert (=> d!54659 m!210335))

(assert (=> b!182592 d!54659))

(declare-fun b!182767 () Bool)

(declare-fun e!120335 () Bool)

(assert (=> b!182767 (= e!120335 tp_is_empty!4275)))

(declare-fun b!182766 () Bool)

(declare-fun e!120334 () Bool)

(assert (=> b!182766 (= e!120334 tp_is_empty!4275)))

(declare-fun mapIsEmpty!7343 () Bool)

(declare-fun mapRes!7343 () Bool)

(assert (=> mapIsEmpty!7343 mapRes!7343))

(declare-fun mapNonEmpty!7343 () Bool)

(declare-fun tp!16280 () Bool)

(assert (=> mapNonEmpty!7343 (= mapRes!7343 (and tp!16280 e!120334))))

(declare-fun mapKey!7343 () (_ BitVec 32))

(declare-fun mapValue!7343 () ValueCell!1794)

(declare-fun mapRest!7343 () (Array (_ BitVec 32) ValueCell!1794))

(assert (=> mapNonEmpty!7343 (= mapRest!7337 (store mapRest!7343 mapKey!7343 mapValue!7343))))

(declare-fun condMapEmpty!7343 () Bool)

(declare-fun mapDefault!7343 () ValueCell!1794)

(assert (=> mapNonEmpty!7337 (= condMapEmpty!7343 (= mapRest!7337 ((as const (Array (_ BitVec 32) ValueCell!1794)) mapDefault!7343)))))

(assert (=> mapNonEmpty!7337 (= tp!16270 (and e!120335 mapRes!7343))))

(assert (= (and mapNonEmpty!7337 condMapEmpty!7343) mapIsEmpty!7343))

(assert (= (and mapNonEmpty!7337 (not condMapEmpty!7343)) mapNonEmpty!7343))

(assert (= (and mapNonEmpty!7343 ((_ is ValueCellFull!1794) mapValue!7343)) b!182766))

(assert (= (and mapNonEmpty!7337 ((_ is ValueCellFull!1794) mapDefault!7343)) b!182767))

(declare-fun m!210467 () Bool)

(assert (=> mapNonEmpty!7343 m!210467))

(declare-fun b_lambda!7181 () Bool)

(assert (= b_lambda!7179 (or (and b!182597 b_free!4503) b_lambda!7181)))

(check-sat (not b!182694) (not b!182640) (not b!182740) (not b!182639) (not b!182684) (not b!182656) (not mapNonEmpty!7343) (not b_lambda!7181) tp_is_empty!4275 (not bm!18455) (not b!182752) (not b!182682) (not bm!18453) (not b!182751) (not b!182670) (not b!182673) (not b!182692) (not bm!18433) (not d!54659) (not b!182638) (not b_next!4503) (not b!182671) (not d!54645) (not bm!18436) (not b!182748) (not b!182749) (not d!54657) (not bm!18456) (not d!54643) (not b!182739) b_and!11071 (not b!182737) (not bm!18457) (not b!182745))
(check-sat b_and!11071 (not b_next!4503))
