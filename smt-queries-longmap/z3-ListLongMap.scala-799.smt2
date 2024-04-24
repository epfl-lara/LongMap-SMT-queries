; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19196 () Bool)

(assert start!19196)

(declare-fun b!188859 () Bool)

(declare-fun b_free!4633 () Bool)

(declare-fun b_next!4633 () Bool)

(assert (=> b!188859 (= b_free!4633 (not b_next!4633))))

(declare-fun tp!16726 () Bool)

(declare-fun b_and!11281 () Bool)

(assert (=> b!188859 (= tp!16726 b_and!11281)))

(declare-fun b!188851 () Bool)

(declare-fun e!124287 () Bool)

(declare-fun e!124283 () Bool)

(assert (=> b!188851 (= e!124287 e!124283)))

(declare-fun res!89273 () Bool)

(assert (=> b!188851 (=> (not res!89273) (not e!124283))))

(declare-datatypes ((V!5521 0))(
  ( (V!5522 (val!2247 Int)) )
))
(declare-datatypes ((ValueCell!1859 0))(
  ( (ValueCellFull!1859 (v!4167 V!5521)) (EmptyCell!1859) )
))
(declare-datatypes ((array!8021 0))(
  ( (array!8022 (arr!3782 (Array (_ BitVec 32) (_ BitVec 64))) (size!4102 (_ BitVec 32))) )
))
(declare-datatypes ((array!8023 0))(
  ( (array!8024 (arr!3783 (Array (_ BitVec 32) ValueCell!1859)) (size!4103 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2626 0))(
  ( (LongMapFixedSize!2627 (defaultEntry!3851 Int) (mask!9026 (_ BitVec 32)) (extraKeys!3588 (_ BitVec 32)) (zeroValue!3692 V!5521) (minValue!3692 V!5521) (_size!1362 (_ BitVec 32)) (_keys!5814 array!8021) (_values!3834 array!8023) (_vacant!1362 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2626)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188851 (= res!89273 (validMask!0 (mask!9026 thiss!1248)))))

(declare-datatypes ((Unit!5695 0))(
  ( (Unit!5696) )
))
(declare-fun lt!93517 () Unit!5695)

(declare-fun e!124282 () Unit!5695)

(assert (=> b!188851 (= lt!93517 e!124282)))

(declare-fun c!33951 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3446 0))(
  ( (tuple2!3447 (_1!1734 (_ BitVec 64)) (_2!1734 V!5521)) )
))
(declare-datatypes ((List!2364 0))(
  ( (Nil!2361) (Cons!2360 (h!2997 tuple2!3446) (t!7256 List!2364)) )
))
(declare-datatypes ((ListLongMap!2367 0))(
  ( (ListLongMap!2368 (toList!1199 List!2364)) )
))
(declare-fun contains!1316 (ListLongMap!2367 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!851 (array!8021 array!8023 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 32) Int) ListLongMap!2367)

(assert (=> b!188851 (= c!33951 (contains!1316 (getCurrentListMap!851 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)) key!828))))

(declare-fun b!188852 () Bool)

(declare-fun e!124286 () Bool)

(declare-fun e!124285 () Bool)

(declare-fun mapRes!7597 () Bool)

(assert (=> b!188852 (= e!124286 (and e!124285 mapRes!7597))))

(declare-fun condMapEmpty!7597 () Bool)

(declare-fun mapDefault!7597 () ValueCell!1859)

(assert (=> b!188852 (= condMapEmpty!7597 (= (arr!3783 (_values!3834 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1859)) mapDefault!7597)))))

(declare-fun b!188853 () Bool)

(declare-fun Unit!5697 () Unit!5695)

(assert (=> b!188853 (= e!124282 Unit!5697)))

(declare-fun lt!93518 () Unit!5695)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!156 (array!8021 array!8023 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5695)

(assert (=> b!188853 (= lt!93518 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!156 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(assert (=> b!188853 false))

(declare-fun mapNonEmpty!7597 () Bool)

(declare-fun tp!16725 () Bool)

(declare-fun e!124279 () Bool)

(assert (=> mapNonEmpty!7597 (= mapRes!7597 (and tp!16725 e!124279))))

(declare-fun mapValue!7597 () ValueCell!1859)

(declare-fun mapRest!7597 () (Array (_ BitVec 32) ValueCell!1859))

(declare-fun mapKey!7597 () (_ BitVec 32))

(assert (=> mapNonEmpty!7597 (= (arr!3783 (_values!3834 thiss!1248)) (store mapRest!7597 mapKey!7597 mapValue!7597))))

(declare-fun b!188854 () Bool)

(declare-fun res!89278 () Bool)

(declare-fun e!124280 () Bool)

(assert (=> b!188854 (=> (not res!89278) (not e!124280))))

(assert (=> b!188854 (= res!89278 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188855 () Bool)

(declare-fun lt!93519 () Unit!5695)

(assert (=> b!188855 (= e!124282 lt!93519)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (array!8021 array!8023 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5695)

(assert (=> b!188855 (= lt!93519 (lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(declare-fun res!89277 () Bool)

(declare-datatypes ((SeekEntryResult!649 0))(
  ( (MissingZero!649 (index!4766 (_ BitVec 32))) (Found!649 (index!4767 (_ BitVec 32))) (Intermediate!649 (undefined!1461 Bool) (index!4768 (_ BitVec 32)) (x!20371 (_ BitVec 32))) (Undefined!649) (MissingVacant!649 (index!4769 (_ BitVec 32))) )
))
(declare-fun lt!93520 () SeekEntryResult!649)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188855 (= res!89277 (inRange!0 (index!4767 lt!93520) (mask!9026 thiss!1248)))))

(declare-fun e!124281 () Bool)

(assert (=> b!188855 (=> (not res!89277) (not e!124281))))

(assert (=> b!188855 e!124281))

(declare-fun b!188856 () Bool)

(declare-fun res!89271 () Bool)

(assert (=> b!188856 (=> (not res!89271) (not e!124283))))

(assert (=> b!188856 (= res!89271 (and (= (size!4103 (_values!3834 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9026 thiss!1248))) (= (size!4102 (_keys!5814 thiss!1248)) (size!4103 (_values!3834 thiss!1248))) (bvsge (mask!9026 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3588 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3588 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188857 () Bool)

(assert (=> b!188857 (= e!124283 (or (bvslt (index!4767 lt!93520) #b00000000000000000000000000000000) (bvsge (index!4767 lt!93520) (size!4102 (_keys!5814 thiss!1248)))))))

(declare-fun b!188858 () Bool)

(declare-fun tp_is_empty!4405 () Bool)

(assert (=> b!188858 (= e!124285 tp_is_empty!4405)))

(declare-fun e!124284 () Bool)

(declare-fun array_inv!2439 (array!8021) Bool)

(declare-fun array_inv!2440 (array!8023) Bool)

(assert (=> b!188859 (= e!124284 (and tp!16726 tp_is_empty!4405 (array_inv!2439 (_keys!5814 thiss!1248)) (array_inv!2440 (_values!3834 thiss!1248)) e!124286))))

(declare-fun b!188860 () Bool)

(declare-fun res!89276 () Bool)

(assert (=> b!188860 (=> (not res!89276) (not e!124283))))

(declare-datatypes ((List!2365 0))(
  ( (Nil!2362) (Cons!2361 (h!2998 (_ BitVec 64)) (t!7257 List!2365)) )
))
(declare-fun arrayNoDuplicates!0 (array!8021 (_ BitVec 32) List!2365) Bool)

(assert (=> b!188860 (= res!89276 (arrayNoDuplicates!0 (_keys!5814 thiss!1248) #b00000000000000000000000000000000 Nil!2362))))

(declare-fun b!188861 () Bool)

(assert (=> b!188861 (= e!124279 tp_is_empty!4405)))

(declare-fun b!188862 () Bool)

(assert (=> b!188862 (= e!124281 (= (select (arr!3782 (_keys!5814 thiss!1248)) (index!4767 lt!93520)) key!828))))

(declare-fun res!89274 () Bool)

(assert (=> start!19196 (=> (not res!89274) (not e!124280))))

(declare-fun valid!1106 (LongMapFixedSize!2626) Bool)

(assert (=> start!19196 (= res!89274 (valid!1106 thiss!1248))))

(assert (=> start!19196 e!124280))

(assert (=> start!19196 e!124284))

(assert (=> start!19196 true))

(declare-fun mapIsEmpty!7597 () Bool)

(assert (=> mapIsEmpty!7597 mapRes!7597))

(declare-fun b!188863 () Bool)

(declare-fun res!89275 () Bool)

(assert (=> b!188863 (=> (not res!89275) (not e!124283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8021 (_ BitVec 32)) Bool)

(assert (=> b!188863 (= res!89275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(declare-fun b!188864 () Bool)

(assert (=> b!188864 (= e!124280 e!124287)))

(declare-fun res!89272 () Bool)

(assert (=> b!188864 (=> (not res!89272) (not e!124287))))

(get-info :version)

(assert (=> b!188864 (= res!89272 (and (not ((_ is Undefined!649) lt!93520)) (not ((_ is MissingVacant!649) lt!93520)) (not ((_ is MissingZero!649) lt!93520)) ((_ is Found!649) lt!93520)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8021 (_ BitVec 32)) SeekEntryResult!649)

(assert (=> b!188864 (= lt!93520 (seekEntryOrOpen!0 key!828 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(assert (= (and start!19196 res!89274) b!188854))

(assert (= (and b!188854 res!89278) b!188864))

(assert (= (and b!188864 res!89272) b!188851))

(assert (= (and b!188851 c!33951) b!188855))

(assert (= (and b!188851 (not c!33951)) b!188853))

(assert (= (and b!188855 res!89277) b!188862))

(assert (= (and b!188851 res!89273) b!188856))

(assert (= (and b!188856 res!89271) b!188863))

(assert (= (and b!188863 res!89275) b!188860))

(assert (= (and b!188860 res!89276) b!188857))

(assert (= (and b!188852 condMapEmpty!7597) mapIsEmpty!7597))

(assert (= (and b!188852 (not condMapEmpty!7597)) mapNonEmpty!7597))

(assert (= (and mapNonEmpty!7597 ((_ is ValueCellFull!1859) mapValue!7597)) b!188861))

(assert (= (and b!188852 ((_ is ValueCellFull!1859) mapDefault!7597)) b!188858))

(assert (= b!188859 b!188852))

(assert (= start!19196 b!188859))

(declare-fun m!215531 () Bool)

(assert (=> b!188864 m!215531))

(declare-fun m!215533 () Bool)

(assert (=> b!188863 m!215533))

(declare-fun m!215535 () Bool)

(assert (=> b!188862 m!215535))

(declare-fun m!215537 () Bool)

(assert (=> b!188853 m!215537))

(declare-fun m!215539 () Bool)

(assert (=> start!19196 m!215539))

(declare-fun m!215541 () Bool)

(assert (=> b!188855 m!215541))

(declare-fun m!215543 () Bool)

(assert (=> b!188855 m!215543))

(declare-fun m!215545 () Bool)

(assert (=> b!188859 m!215545))

(declare-fun m!215547 () Bool)

(assert (=> b!188859 m!215547))

(declare-fun m!215549 () Bool)

(assert (=> b!188860 m!215549))

(declare-fun m!215551 () Bool)

(assert (=> mapNonEmpty!7597 m!215551))

(declare-fun m!215553 () Bool)

(assert (=> b!188851 m!215553))

(declare-fun m!215555 () Bool)

(assert (=> b!188851 m!215555))

(assert (=> b!188851 m!215555))

(declare-fun m!215557 () Bool)

(assert (=> b!188851 m!215557))

(check-sat (not mapNonEmpty!7597) (not start!19196) tp_is_empty!4405 (not b!188864) (not b!188859) (not b!188851) (not b!188863) (not b_next!4633) b_and!11281 (not b!188853) (not b!188860) (not b!188855))
(check-sat b_and!11281 (not b_next!4633))
(get-model)

(declare-fun b!188965 () Bool)

(declare-fun e!124356 () Bool)

(declare-fun call!19030 () Bool)

(assert (=> b!188965 (= e!124356 (not call!19030))))

(declare-fun b!188966 () Bool)

(declare-fun e!124357 () Bool)

(assert (=> b!188966 (= e!124357 (not call!19030))))

(declare-fun b!188967 () Bool)

(declare-fun e!124359 () Bool)

(declare-fun e!124358 () Bool)

(assert (=> b!188967 (= e!124359 e!124358)))

(declare-fun c!33963 () Bool)

(declare-fun lt!93549 () SeekEntryResult!649)

(assert (=> b!188967 (= c!33963 ((_ is MissingVacant!649) lt!93549))))

(declare-fun d!55735 () Bool)

(assert (=> d!55735 e!124359))

(declare-fun c!33962 () Bool)

(assert (=> d!55735 (= c!33962 ((_ is MissingZero!649) lt!93549))))

(assert (=> d!55735 (= lt!93549 (seekEntryOrOpen!0 key!828 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(declare-fun lt!93550 () Unit!5695)

(declare-fun choose!1017 (array!8021 array!8023 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5695)

(assert (=> d!55735 (= lt!93550 (choose!1017 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(assert (=> d!55735 (validMask!0 (mask!9026 thiss!1248))))

(assert (=> d!55735 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!156 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)) lt!93550)))

(declare-fun bm!19026 () Bool)

(declare-fun call!19029 () Bool)

(assert (=> bm!19026 (= call!19029 (inRange!0 (ite c!33962 (index!4766 lt!93549) (index!4769 lt!93549)) (mask!9026 thiss!1248)))))

(declare-fun b!188968 () Bool)

(assert (=> b!188968 (= e!124358 ((_ is Undefined!649) lt!93549))))

(declare-fun b!188969 () Bool)

(assert (=> b!188969 (and (bvsge (index!4766 lt!93549) #b00000000000000000000000000000000) (bvslt (index!4766 lt!93549) (size!4102 (_keys!5814 thiss!1248))))))

(declare-fun res!89336 () Bool)

(assert (=> b!188969 (= res!89336 (= (select (arr!3782 (_keys!5814 thiss!1248)) (index!4766 lt!93549)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188969 (=> (not res!89336) (not e!124357))))

(declare-fun b!188970 () Bool)

(declare-fun res!89338 () Bool)

(assert (=> b!188970 (=> (not res!89338) (not e!124356))))

(assert (=> b!188970 (= res!89338 call!19029)))

(assert (=> b!188970 (= e!124358 e!124356)))

(declare-fun bm!19027 () Bool)

(declare-fun arrayContainsKey!0 (array!8021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19027 (= call!19030 (arrayContainsKey!0 (_keys!5814 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188971 () Bool)

(declare-fun res!89337 () Bool)

(assert (=> b!188971 (=> (not res!89337) (not e!124356))))

(assert (=> b!188971 (= res!89337 (= (select (arr!3782 (_keys!5814 thiss!1248)) (index!4769 lt!93549)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188971 (and (bvsge (index!4769 lt!93549) #b00000000000000000000000000000000) (bvslt (index!4769 lt!93549) (size!4102 (_keys!5814 thiss!1248))))))

(declare-fun b!188972 () Bool)

(assert (=> b!188972 (= e!124359 e!124357)))

(declare-fun res!89335 () Bool)

(assert (=> b!188972 (= res!89335 call!19029)))

(assert (=> b!188972 (=> (not res!89335) (not e!124357))))

(assert (= (and d!55735 c!33962) b!188972))

(assert (= (and d!55735 (not c!33962)) b!188967))

(assert (= (and b!188972 res!89335) b!188969))

(assert (= (and b!188969 res!89336) b!188966))

(assert (= (and b!188967 c!33963) b!188970))

(assert (= (and b!188967 (not c!33963)) b!188968))

(assert (= (and b!188970 res!89338) b!188971))

(assert (= (and b!188971 res!89337) b!188965))

(assert (= (or b!188972 b!188970) bm!19026))

(assert (= (or b!188966 b!188965) bm!19027))

(assert (=> d!55735 m!215531))

(declare-fun m!215615 () Bool)

(assert (=> d!55735 m!215615))

(assert (=> d!55735 m!215553))

(declare-fun m!215617 () Bool)

(assert (=> bm!19027 m!215617))

(declare-fun m!215619 () Bool)

(assert (=> b!188971 m!215619))

(declare-fun m!215621 () Bool)

(assert (=> b!188969 m!215621))

(declare-fun m!215623 () Bool)

(assert (=> bm!19026 m!215623))

(assert (=> b!188853 d!55735))

(declare-fun d!55737 () Bool)

(declare-fun res!89344 () Bool)

(declare-fun e!124368 () Bool)

(assert (=> d!55737 (=> res!89344 e!124368)))

(assert (=> d!55737 (= res!89344 (bvsge #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))))))

(assert (=> d!55737 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)) e!124368)))

(declare-fun bm!19030 () Bool)

(declare-fun call!19033 () Bool)

(assert (=> bm!19030 (= call!19033 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(declare-fun b!188981 () Bool)

(declare-fun e!124367 () Bool)

(declare-fun e!124366 () Bool)

(assert (=> b!188981 (= e!124367 e!124366)))

(declare-fun lt!93559 () (_ BitVec 64))

(assert (=> b!188981 (= lt!93559 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93558 () Unit!5695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8021 (_ BitVec 64) (_ BitVec 32)) Unit!5695)

(assert (=> b!188981 (= lt!93558 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5814 thiss!1248) lt!93559 #b00000000000000000000000000000000))))

(assert (=> b!188981 (arrayContainsKey!0 (_keys!5814 thiss!1248) lt!93559 #b00000000000000000000000000000000)))

(declare-fun lt!93557 () Unit!5695)

(assert (=> b!188981 (= lt!93557 lt!93558)))

(declare-fun res!89343 () Bool)

(assert (=> b!188981 (= res!89343 (= (seekEntryOrOpen!0 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000) (_keys!5814 thiss!1248) (mask!9026 thiss!1248)) (Found!649 #b00000000000000000000000000000000)))))

(assert (=> b!188981 (=> (not res!89343) (not e!124366))))

(declare-fun b!188982 () Bool)

(assert (=> b!188982 (= e!124366 call!19033)))

(declare-fun b!188983 () Bool)

(assert (=> b!188983 (= e!124367 call!19033)))

(declare-fun b!188984 () Bool)

(assert (=> b!188984 (= e!124368 e!124367)))

(declare-fun c!33966 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188984 (= c!33966 (validKeyInArray!0 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55737 (not res!89344)) b!188984))

(assert (= (and b!188984 c!33966) b!188981))

(assert (= (and b!188984 (not c!33966)) b!188983))

(assert (= (and b!188981 res!89343) b!188982))

(assert (= (or b!188982 b!188983) bm!19030))

(declare-fun m!215625 () Bool)

(assert (=> bm!19030 m!215625))

(declare-fun m!215627 () Bool)

(assert (=> b!188981 m!215627))

(declare-fun m!215629 () Bool)

(assert (=> b!188981 m!215629))

(declare-fun m!215631 () Bool)

(assert (=> b!188981 m!215631))

(assert (=> b!188981 m!215627))

(declare-fun m!215633 () Bool)

(assert (=> b!188981 m!215633))

(assert (=> b!188984 m!215627))

(assert (=> b!188984 m!215627))

(declare-fun m!215635 () Bool)

(assert (=> b!188984 m!215635))

(assert (=> b!188863 d!55737))

(declare-fun d!55739 () Bool)

(assert (=> d!55739 (= (array_inv!2439 (_keys!5814 thiss!1248)) (bvsge (size!4102 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188859 d!55739))

(declare-fun d!55741 () Bool)

(assert (=> d!55741 (= (array_inv!2440 (_values!3834 thiss!1248)) (bvsge (size!4103 (_values!3834 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188859 d!55741))

(declare-fun b!188997 () Bool)

(declare-fun e!124376 () SeekEntryResult!649)

(declare-fun e!124377 () SeekEntryResult!649)

(assert (=> b!188997 (= e!124376 e!124377)))

(declare-fun lt!93566 () (_ BitVec 64))

(declare-fun lt!93568 () SeekEntryResult!649)

(assert (=> b!188997 (= lt!93566 (select (arr!3782 (_keys!5814 thiss!1248)) (index!4768 lt!93568)))))

(declare-fun c!33975 () Bool)

(assert (=> b!188997 (= c!33975 (= lt!93566 key!828))))

(declare-fun b!188998 () Bool)

(declare-fun e!124375 () SeekEntryResult!649)

(assert (=> b!188998 (= e!124375 (MissingZero!649 (index!4768 lt!93568)))))

(declare-fun b!189000 () Bool)

(declare-fun c!33973 () Bool)

(assert (=> b!189000 (= c!33973 (= lt!93566 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189000 (= e!124377 e!124375)))

(declare-fun b!189001 () Bool)

(assert (=> b!189001 (= e!124377 (Found!649 (index!4768 lt!93568)))))

(declare-fun b!189002 () Bool)

(assert (=> b!189002 (= e!124376 Undefined!649)))

(declare-fun b!188999 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8021 (_ BitVec 32)) SeekEntryResult!649)

(assert (=> b!188999 (= e!124375 (seekKeyOrZeroReturnVacant!0 (x!20371 lt!93568) (index!4768 lt!93568) (index!4768 lt!93568) key!828 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(declare-fun d!55743 () Bool)

(declare-fun lt!93567 () SeekEntryResult!649)

(assert (=> d!55743 (and (or ((_ is Undefined!649) lt!93567) (not ((_ is Found!649) lt!93567)) (and (bvsge (index!4767 lt!93567) #b00000000000000000000000000000000) (bvslt (index!4767 lt!93567) (size!4102 (_keys!5814 thiss!1248))))) (or ((_ is Undefined!649) lt!93567) ((_ is Found!649) lt!93567) (not ((_ is MissingZero!649) lt!93567)) (and (bvsge (index!4766 lt!93567) #b00000000000000000000000000000000) (bvslt (index!4766 lt!93567) (size!4102 (_keys!5814 thiss!1248))))) (or ((_ is Undefined!649) lt!93567) ((_ is Found!649) lt!93567) ((_ is MissingZero!649) lt!93567) (not ((_ is MissingVacant!649) lt!93567)) (and (bvsge (index!4769 lt!93567) #b00000000000000000000000000000000) (bvslt (index!4769 lt!93567) (size!4102 (_keys!5814 thiss!1248))))) (or ((_ is Undefined!649) lt!93567) (ite ((_ is Found!649) lt!93567) (= (select (arr!3782 (_keys!5814 thiss!1248)) (index!4767 lt!93567)) key!828) (ite ((_ is MissingZero!649) lt!93567) (= (select (arr!3782 (_keys!5814 thiss!1248)) (index!4766 lt!93567)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!649) lt!93567) (= (select (arr!3782 (_keys!5814 thiss!1248)) (index!4769 lt!93567)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55743 (= lt!93567 e!124376)))

(declare-fun c!33974 () Bool)

(assert (=> d!55743 (= c!33974 (and ((_ is Intermediate!649) lt!93568) (undefined!1461 lt!93568)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8021 (_ BitVec 32)) SeekEntryResult!649)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55743 (= lt!93568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9026 thiss!1248)) key!828 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(assert (=> d!55743 (validMask!0 (mask!9026 thiss!1248))))

(assert (=> d!55743 (= (seekEntryOrOpen!0 key!828 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)) lt!93567)))

(assert (= (and d!55743 c!33974) b!189002))

(assert (= (and d!55743 (not c!33974)) b!188997))

(assert (= (and b!188997 c!33975) b!189001))

(assert (= (and b!188997 (not c!33975)) b!189000))

(assert (= (and b!189000 c!33973) b!188998))

(assert (= (and b!189000 (not c!33973)) b!188999))

(declare-fun m!215637 () Bool)

(assert (=> b!188997 m!215637))

(declare-fun m!215639 () Bool)

(assert (=> b!188999 m!215639))

(assert (=> d!55743 m!215553))

(declare-fun m!215641 () Bool)

(assert (=> d!55743 m!215641))

(declare-fun m!215643 () Bool)

(assert (=> d!55743 m!215643))

(declare-fun m!215645 () Bool)

(assert (=> d!55743 m!215645))

(declare-fun m!215647 () Bool)

(assert (=> d!55743 m!215647))

(assert (=> d!55743 m!215645))

(declare-fun m!215649 () Bool)

(assert (=> d!55743 m!215649))

(assert (=> b!188864 d!55743))

(declare-fun d!55745 () Bool)

(declare-fun e!124380 () Bool)

(assert (=> d!55745 e!124380))

(declare-fun res!89349 () Bool)

(assert (=> d!55745 (=> (not res!89349) (not e!124380))))

(declare-fun lt!93574 () SeekEntryResult!649)

(assert (=> d!55745 (= res!89349 ((_ is Found!649) lt!93574))))

(assert (=> d!55745 (= lt!93574 (seekEntryOrOpen!0 key!828 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(declare-fun lt!93573 () Unit!5695)

(declare-fun choose!1018 (array!8021 array!8023 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 64) Int) Unit!5695)

(assert (=> d!55745 (= lt!93573 (choose!1018 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)))))

(assert (=> d!55745 (validMask!0 (mask!9026 thiss!1248))))

(assert (=> d!55745 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!161 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) key!828 (defaultEntry!3851 thiss!1248)) lt!93573)))

(declare-fun b!189007 () Bool)

(declare-fun res!89350 () Bool)

(assert (=> b!189007 (=> (not res!89350) (not e!124380))))

(assert (=> b!189007 (= res!89350 (inRange!0 (index!4767 lt!93574) (mask!9026 thiss!1248)))))

(declare-fun b!189008 () Bool)

(assert (=> b!189008 (= e!124380 (= (select (arr!3782 (_keys!5814 thiss!1248)) (index!4767 lt!93574)) key!828))))

(assert (=> b!189008 (and (bvsge (index!4767 lt!93574) #b00000000000000000000000000000000) (bvslt (index!4767 lt!93574) (size!4102 (_keys!5814 thiss!1248))))))

(assert (= (and d!55745 res!89349) b!189007))

(assert (= (and b!189007 res!89350) b!189008))

(assert (=> d!55745 m!215531))

(declare-fun m!215651 () Bool)

(assert (=> d!55745 m!215651))

(assert (=> d!55745 m!215553))

(declare-fun m!215653 () Bool)

(assert (=> b!189007 m!215653))

(declare-fun m!215655 () Bool)

(assert (=> b!189008 m!215655))

(assert (=> b!188855 d!55745))

(declare-fun d!55747 () Bool)

(assert (=> d!55747 (= (inRange!0 (index!4767 lt!93520) (mask!9026 thiss!1248)) (and (bvsge (index!4767 lt!93520) #b00000000000000000000000000000000) (bvslt (index!4767 lt!93520) (bvadd (mask!9026 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188855 d!55747))

(declare-fun d!55749 () Bool)

(assert (=> d!55749 (= (validMask!0 (mask!9026 thiss!1248)) (and (or (= (mask!9026 thiss!1248) #b00000000000000000000000000000111) (= (mask!9026 thiss!1248) #b00000000000000000000000000001111) (= (mask!9026 thiss!1248) #b00000000000000000000000000011111) (= (mask!9026 thiss!1248) #b00000000000000000000000000111111) (= (mask!9026 thiss!1248) #b00000000000000000000000001111111) (= (mask!9026 thiss!1248) #b00000000000000000000000011111111) (= (mask!9026 thiss!1248) #b00000000000000000000000111111111) (= (mask!9026 thiss!1248) #b00000000000000000000001111111111) (= (mask!9026 thiss!1248) #b00000000000000000000011111111111) (= (mask!9026 thiss!1248) #b00000000000000000000111111111111) (= (mask!9026 thiss!1248) #b00000000000000000001111111111111) (= (mask!9026 thiss!1248) #b00000000000000000011111111111111) (= (mask!9026 thiss!1248) #b00000000000000000111111111111111) (= (mask!9026 thiss!1248) #b00000000000000001111111111111111) (= (mask!9026 thiss!1248) #b00000000000000011111111111111111) (= (mask!9026 thiss!1248) #b00000000000000111111111111111111) (= (mask!9026 thiss!1248) #b00000000000001111111111111111111) (= (mask!9026 thiss!1248) #b00000000000011111111111111111111) (= (mask!9026 thiss!1248) #b00000000000111111111111111111111) (= (mask!9026 thiss!1248) #b00000000001111111111111111111111) (= (mask!9026 thiss!1248) #b00000000011111111111111111111111) (= (mask!9026 thiss!1248) #b00000000111111111111111111111111) (= (mask!9026 thiss!1248) #b00000001111111111111111111111111) (= (mask!9026 thiss!1248) #b00000011111111111111111111111111) (= (mask!9026 thiss!1248) #b00000111111111111111111111111111) (= (mask!9026 thiss!1248) #b00001111111111111111111111111111) (= (mask!9026 thiss!1248) #b00011111111111111111111111111111) (= (mask!9026 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9026 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188851 d!55749))

(declare-fun d!55751 () Bool)

(declare-fun e!124386 () Bool)

(assert (=> d!55751 e!124386))

(declare-fun res!89353 () Bool)

(assert (=> d!55751 (=> res!89353 e!124386)))

(declare-fun lt!93583 () Bool)

(assert (=> d!55751 (= res!89353 (not lt!93583))))

(declare-fun lt!93585 () Bool)

(assert (=> d!55751 (= lt!93583 lt!93585)))

(declare-fun lt!93586 () Unit!5695)

(declare-fun e!124385 () Unit!5695)

(assert (=> d!55751 (= lt!93586 e!124385)))

(declare-fun c!33978 () Bool)

(assert (=> d!55751 (= c!33978 lt!93585)))

(declare-fun containsKey!236 (List!2364 (_ BitVec 64)) Bool)

(assert (=> d!55751 (= lt!93585 (containsKey!236 (toList!1199 (getCurrentListMap!851 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248))) key!828))))

(assert (=> d!55751 (= (contains!1316 (getCurrentListMap!851 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)) key!828) lt!93583)))

(declare-fun b!189015 () Bool)

(declare-fun lt!93584 () Unit!5695)

(assert (=> b!189015 (= e!124385 lt!93584)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!184 (List!2364 (_ BitVec 64)) Unit!5695)

(assert (=> b!189015 (= lt!93584 (lemmaContainsKeyImpliesGetValueByKeyDefined!184 (toList!1199 (getCurrentListMap!851 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248))) key!828))))

(declare-datatypes ((Option!239 0))(
  ( (Some!238 (v!4170 V!5521)) (None!237) )
))
(declare-fun isDefined!185 (Option!239) Bool)

(declare-fun getValueByKey!233 (List!2364 (_ BitVec 64)) Option!239)

(assert (=> b!189015 (isDefined!185 (getValueByKey!233 (toList!1199 (getCurrentListMap!851 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248))) key!828))))

(declare-fun b!189016 () Bool)

(declare-fun Unit!5700 () Unit!5695)

(assert (=> b!189016 (= e!124385 Unit!5700)))

(declare-fun b!189017 () Bool)

(assert (=> b!189017 (= e!124386 (isDefined!185 (getValueByKey!233 (toList!1199 (getCurrentListMap!851 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248))) key!828)))))

(assert (= (and d!55751 c!33978) b!189015))

(assert (= (and d!55751 (not c!33978)) b!189016))

(assert (= (and d!55751 (not res!89353)) b!189017))

(declare-fun m!215657 () Bool)

(assert (=> d!55751 m!215657))

(declare-fun m!215659 () Bool)

(assert (=> b!189015 m!215659))

(declare-fun m!215661 () Bool)

(assert (=> b!189015 m!215661))

(assert (=> b!189015 m!215661))

(declare-fun m!215663 () Bool)

(assert (=> b!189015 m!215663))

(assert (=> b!189017 m!215661))

(assert (=> b!189017 m!215661))

(assert (=> b!189017 m!215663))

(assert (=> b!188851 d!55751))

(declare-fun b!189060 () Bool)

(declare-fun e!124420 () ListLongMap!2367)

(declare-fun call!19053 () ListLongMap!2367)

(assert (=> b!189060 (= e!124420 call!19053)))

(declare-fun bm!19045 () Bool)

(declare-fun call!19050 () Bool)

(declare-fun lt!93642 () ListLongMap!2367)

(assert (=> bm!19045 (= call!19050 (contains!1316 lt!93642 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189061 () Bool)

(declare-fun call!19049 () ListLongMap!2367)

(assert (=> b!189061 (= e!124420 call!19049)))

(declare-fun b!189062 () Bool)

(declare-fun e!124419 () ListLongMap!2367)

(declare-fun call!19054 () ListLongMap!2367)

(declare-fun +!295 (ListLongMap!2367 tuple2!3446) ListLongMap!2367)

(assert (=> b!189062 (= e!124419 (+!295 call!19054 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3692 thiss!1248))))))

(declare-fun bm!19046 () Bool)

(declare-fun call!19051 () ListLongMap!2367)

(assert (=> bm!19046 (= call!19049 call!19051)))

(declare-fun bm!19047 () Bool)

(assert (=> bm!19047 (= call!19053 call!19054)))

(declare-fun b!189063 () Bool)

(declare-fun e!124416 () Bool)

(declare-fun apply!175 (ListLongMap!2367 (_ BitVec 64)) V!5521)

(assert (=> b!189063 (= e!124416 (= (apply!175 lt!93642 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3692 thiss!1248)))))

(declare-fun b!189064 () Bool)

(declare-fun e!124424 () Unit!5695)

(declare-fun Unit!5701 () Unit!5695)

(assert (=> b!189064 (= e!124424 Unit!5701)))

(declare-fun b!189065 () Bool)

(declare-fun e!124415 () ListLongMap!2367)

(assert (=> b!189065 (= e!124419 e!124415)))

(declare-fun c!33995 () Bool)

(assert (=> b!189065 (= c!33995 (and (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19048 () Bool)

(declare-fun call!19052 () ListLongMap!2367)

(assert (=> bm!19048 (= call!19051 call!19052)))

(declare-fun b!189066 () Bool)

(declare-fun e!124425 () Bool)

(assert (=> b!189066 (= e!124425 (validKeyInArray!0 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189067 () Bool)

(declare-fun e!124421 () Bool)

(assert (=> b!189067 (= e!124421 (= (apply!175 lt!93642 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3692 thiss!1248)))))

(declare-fun b!189068 () Bool)

(declare-fun e!124417 () Bool)

(assert (=> b!189068 (= e!124417 (not call!19050))))

(declare-fun b!189069 () Bool)

(declare-fun res!89378 () Bool)

(declare-fun e!124423 () Bool)

(assert (=> b!189069 (=> (not res!89378) (not e!124423))))

(declare-fun e!124413 () Bool)

(assert (=> b!189069 (= res!89378 e!124413)))

(declare-fun res!89372 () Bool)

(assert (=> b!189069 (=> res!89372 e!124413)))

(assert (=> b!189069 (= res!89372 (not e!124425))))

(declare-fun res!89376 () Bool)

(assert (=> b!189069 (=> (not res!89376) (not e!124425))))

(assert (=> b!189069 (= res!89376 (bvslt #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))))))

(declare-fun b!189070 () Bool)

(declare-fun res!89374 () Bool)

(assert (=> b!189070 (=> (not res!89374) (not e!124423))))

(declare-fun e!124414 () Bool)

(assert (=> b!189070 (= res!89374 e!124414)))

(declare-fun c!33994 () Bool)

(assert (=> b!189070 (= c!33994 (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19050 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!206 (array!8021 array!8023 (_ BitVec 32) (_ BitVec 32) V!5521 V!5521 (_ BitVec 32) Int) ListLongMap!2367)

(assert (=> bm!19050 (= call!19052 (getCurrentListMapNoExtraKeys!206 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun b!189071 () Bool)

(declare-fun e!124422 () Bool)

(declare-fun get!2190 (ValueCell!1859 V!5521) V!5521)

(declare-fun dynLambda!518 (Int (_ BitVec 64)) V!5521)

(assert (=> b!189071 (= e!124422 (= (apply!175 lt!93642 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000)) (get!2190 (select (arr!3783 (_values!3834 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!518 (defaultEntry!3851 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4103 (_values!3834 thiss!1248))))))

(assert (=> b!189071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))))))

(declare-fun bm!19051 () Bool)

(declare-fun c!33996 () Bool)

(assert (=> bm!19051 (= call!19054 (+!295 (ite c!33996 call!19052 (ite c!33995 call!19051 call!19049)) (ite (or c!33996 c!33995) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3692 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3692 thiss!1248)))))))

(declare-fun b!189072 () Bool)

(declare-fun lt!93632 () Unit!5695)

(assert (=> b!189072 (= e!124424 lt!93632)))

(declare-fun lt!93640 () ListLongMap!2367)

(assert (=> b!189072 (= lt!93640 (getCurrentListMapNoExtraKeys!206 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun lt!93638 () (_ BitVec 64))

(assert (=> b!189072 (= lt!93638 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93633 () (_ BitVec 64))

(assert (=> b!189072 (= lt!93633 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93639 () Unit!5695)

(declare-fun addStillContains!151 (ListLongMap!2367 (_ BitVec 64) V!5521 (_ BitVec 64)) Unit!5695)

(assert (=> b!189072 (= lt!93639 (addStillContains!151 lt!93640 lt!93638 (zeroValue!3692 thiss!1248) lt!93633))))

(assert (=> b!189072 (contains!1316 (+!295 lt!93640 (tuple2!3447 lt!93638 (zeroValue!3692 thiss!1248))) lt!93633)))

(declare-fun lt!93648 () Unit!5695)

(assert (=> b!189072 (= lt!93648 lt!93639)))

(declare-fun lt!93650 () ListLongMap!2367)

(assert (=> b!189072 (= lt!93650 (getCurrentListMapNoExtraKeys!206 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun lt!93631 () (_ BitVec 64))

(assert (=> b!189072 (= lt!93631 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93651 () (_ BitVec 64))

(assert (=> b!189072 (= lt!93651 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93636 () Unit!5695)

(declare-fun addApplyDifferent!151 (ListLongMap!2367 (_ BitVec 64) V!5521 (_ BitVec 64)) Unit!5695)

(assert (=> b!189072 (= lt!93636 (addApplyDifferent!151 lt!93650 lt!93631 (minValue!3692 thiss!1248) lt!93651))))

(assert (=> b!189072 (= (apply!175 (+!295 lt!93650 (tuple2!3447 lt!93631 (minValue!3692 thiss!1248))) lt!93651) (apply!175 lt!93650 lt!93651))))

(declare-fun lt!93643 () Unit!5695)

(assert (=> b!189072 (= lt!93643 lt!93636)))

(declare-fun lt!93646 () ListLongMap!2367)

(assert (=> b!189072 (= lt!93646 (getCurrentListMapNoExtraKeys!206 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun lt!93635 () (_ BitVec 64))

(assert (=> b!189072 (= lt!93635 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93647 () (_ BitVec 64))

(assert (=> b!189072 (= lt!93647 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93649 () Unit!5695)

(assert (=> b!189072 (= lt!93649 (addApplyDifferent!151 lt!93646 lt!93635 (zeroValue!3692 thiss!1248) lt!93647))))

(assert (=> b!189072 (= (apply!175 (+!295 lt!93646 (tuple2!3447 lt!93635 (zeroValue!3692 thiss!1248))) lt!93647) (apply!175 lt!93646 lt!93647))))

(declare-fun lt!93634 () Unit!5695)

(assert (=> b!189072 (= lt!93634 lt!93649)))

(declare-fun lt!93652 () ListLongMap!2367)

(assert (=> b!189072 (= lt!93652 (getCurrentListMapNoExtraKeys!206 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)))))

(declare-fun lt!93645 () (_ BitVec 64))

(assert (=> b!189072 (= lt!93645 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93644 () (_ BitVec 64))

(assert (=> b!189072 (= lt!93644 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189072 (= lt!93632 (addApplyDifferent!151 lt!93652 lt!93645 (minValue!3692 thiss!1248) lt!93644))))

(assert (=> b!189072 (= (apply!175 (+!295 lt!93652 (tuple2!3447 lt!93645 (minValue!3692 thiss!1248))) lt!93644) (apply!175 lt!93652 lt!93644))))

(declare-fun b!189073 () Bool)

(declare-fun c!33992 () Bool)

(assert (=> b!189073 (= c!33992 (and (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189073 (= e!124415 e!124420)))

(declare-fun b!189074 () Bool)

(assert (=> b!189074 (= e!124417 e!124421)))

(declare-fun res!89377 () Bool)

(assert (=> b!189074 (= res!89377 call!19050)))

(assert (=> b!189074 (=> (not res!89377) (not e!124421))))

(declare-fun b!189075 () Bool)

(declare-fun call!19048 () Bool)

(assert (=> b!189075 (= e!124414 (not call!19048))))

(declare-fun b!189076 () Bool)

(declare-fun e!124418 () Bool)

(assert (=> b!189076 (= e!124418 (validKeyInArray!0 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189077 () Bool)

(assert (=> b!189077 (= e!124413 e!124422)))

(declare-fun res!89380 () Bool)

(assert (=> b!189077 (=> (not res!89380) (not e!124422))))

(assert (=> b!189077 (= res!89380 (contains!1316 lt!93642 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))))))

(declare-fun b!189078 () Bool)

(assert (=> b!189078 (= e!124414 e!124416)))

(declare-fun res!89375 () Bool)

(assert (=> b!189078 (= res!89375 call!19048)))

(assert (=> b!189078 (=> (not res!89375) (not e!124416))))

(declare-fun d!55753 () Bool)

(assert (=> d!55753 e!124423))

(declare-fun res!89373 () Bool)

(assert (=> d!55753 (=> (not res!89373) (not e!124423))))

(assert (=> d!55753 (= res!89373 (or (bvsge #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))))))))

(declare-fun lt!93641 () ListLongMap!2367)

(assert (=> d!55753 (= lt!93642 lt!93641)))

(declare-fun lt!93637 () Unit!5695)

(assert (=> d!55753 (= lt!93637 e!124424)))

(declare-fun c!33993 () Bool)

(assert (=> d!55753 (= c!33993 e!124418)))

(declare-fun res!89379 () Bool)

(assert (=> d!55753 (=> (not res!89379) (not e!124418))))

(assert (=> d!55753 (= res!89379 (bvslt #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))))))

(assert (=> d!55753 (= lt!93641 e!124419)))

(assert (=> d!55753 (= c!33996 (and (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55753 (validMask!0 (mask!9026 thiss!1248))))

(assert (=> d!55753 (= (getCurrentListMap!851 (_keys!5814 thiss!1248) (_values!3834 thiss!1248) (mask!9026 thiss!1248) (extraKeys!3588 thiss!1248) (zeroValue!3692 thiss!1248) (minValue!3692 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3851 thiss!1248)) lt!93642)))

(declare-fun bm!19049 () Bool)

(assert (=> bm!19049 (= call!19048 (contains!1316 lt!93642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189079 () Bool)

(assert (=> b!189079 (= e!124415 call!19053)))

(declare-fun b!189080 () Bool)

(assert (=> b!189080 (= e!124423 e!124417)))

(declare-fun c!33991 () Bool)

(assert (=> b!189080 (= c!33991 (not (= (bvand (extraKeys!3588 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!55753 c!33996) b!189062))

(assert (= (and d!55753 (not c!33996)) b!189065))

(assert (= (and b!189065 c!33995) b!189079))

(assert (= (and b!189065 (not c!33995)) b!189073))

(assert (= (and b!189073 c!33992) b!189060))

(assert (= (and b!189073 (not c!33992)) b!189061))

(assert (= (or b!189060 b!189061) bm!19046))

(assert (= (or b!189079 bm!19046) bm!19048))

(assert (= (or b!189079 b!189060) bm!19047))

(assert (= (or b!189062 bm!19048) bm!19050))

(assert (= (or b!189062 bm!19047) bm!19051))

(assert (= (and d!55753 res!89379) b!189076))

(assert (= (and d!55753 c!33993) b!189072))

(assert (= (and d!55753 (not c!33993)) b!189064))

(assert (= (and d!55753 res!89373) b!189069))

(assert (= (and b!189069 res!89376) b!189066))

(assert (= (and b!189069 (not res!89372)) b!189077))

(assert (= (and b!189077 res!89380) b!189071))

(assert (= (and b!189069 res!89378) b!189070))

(assert (= (and b!189070 c!33994) b!189078))

(assert (= (and b!189070 (not c!33994)) b!189075))

(assert (= (and b!189078 res!89375) b!189063))

(assert (= (or b!189078 b!189075) bm!19049))

(assert (= (and b!189070 res!89374) b!189080))

(assert (= (and b!189080 c!33991) b!189074))

(assert (= (and b!189080 (not c!33991)) b!189068))

(assert (= (and b!189074 res!89377) b!189067))

(assert (= (or b!189074 b!189068) bm!19045))

(declare-fun b_lambda!7341 () Bool)

(assert (=> (not b_lambda!7341) (not b!189071)))

(declare-fun t!7260 () Bool)

(declare-fun tb!2853 () Bool)

(assert (=> (and b!188859 (= (defaultEntry!3851 thiss!1248) (defaultEntry!3851 thiss!1248)) t!7260) tb!2853))

(declare-fun result!4853 () Bool)

(assert (=> tb!2853 (= result!4853 tp_is_empty!4405)))

(assert (=> b!189071 t!7260))

(declare-fun b_and!11287 () Bool)

(assert (= b_and!11281 (and (=> t!7260 result!4853) b_and!11287)))

(assert (=> d!55753 m!215553))

(assert (=> b!189072 m!215627))

(declare-fun m!215665 () Bool)

(assert (=> b!189072 m!215665))

(declare-fun m!215667 () Bool)

(assert (=> b!189072 m!215667))

(assert (=> b!189072 m!215667))

(declare-fun m!215669 () Bool)

(assert (=> b!189072 m!215669))

(declare-fun m!215671 () Bool)

(assert (=> b!189072 m!215671))

(declare-fun m!215673 () Bool)

(assert (=> b!189072 m!215673))

(declare-fun m!215675 () Bool)

(assert (=> b!189072 m!215675))

(declare-fun m!215677 () Bool)

(assert (=> b!189072 m!215677))

(declare-fun m!215679 () Bool)

(assert (=> b!189072 m!215679))

(declare-fun m!215681 () Bool)

(assert (=> b!189072 m!215681))

(declare-fun m!215683 () Bool)

(assert (=> b!189072 m!215683))

(assert (=> b!189072 m!215673))

(declare-fun m!215685 () Bool)

(assert (=> b!189072 m!215685))

(declare-fun m!215687 () Bool)

(assert (=> b!189072 m!215687))

(declare-fun m!215689 () Bool)

(assert (=> b!189072 m!215689))

(assert (=> b!189072 m!215689))

(declare-fun m!215691 () Bool)

(assert (=> b!189072 m!215691))

(assert (=> b!189072 m!215677))

(declare-fun m!215693 () Bool)

(assert (=> b!189072 m!215693))

(declare-fun m!215695 () Bool)

(assert (=> b!189072 m!215695))

(declare-fun m!215697 () Bool)

(assert (=> b!189062 m!215697))

(assert (=> bm!19050 m!215685))

(assert (=> b!189077 m!215627))

(assert (=> b!189077 m!215627))

(declare-fun m!215699 () Bool)

(assert (=> b!189077 m!215699))

(declare-fun m!215701 () Bool)

(assert (=> bm!19051 m!215701))

(assert (=> b!189071 m!215627))

(assert (=> b!189071 m!215627))

(declare-fun m!215703 () Bool)

(assert (=> b!189071 m!215703))

(declare-fun m!215705 () Bool)

(assert (=> b!189071 m!215705))

(declare-fun m!215707 () Bool)

(assert (=> b!189071 m!215707))

(assert (=> b!189071 m!215705))

(declare-fun m!215709 () Bool)

(assert (=> b!189071 m!215709))

(assert (=> b!189071 m!215707))

(declare-fun m!215711 () Bool)

(assert (=> bm!19049 m!215711))

(declare-fun m!215713 () Bool)

(assert (=> b!189067 m!215713))

(declare-fun m!215715 () Bool)

(assert (=> b!189063 m!215715))

(assert (=> b!189066 m!215627))

(assert (=> b!189066 m!215627))

(assert (=> b!189066 m!215635))

(assert (=> b!189076 m!215627))

(assert (=> b!189076 m!215627))

(assert (=> b!189076 m!215635))

(declare-fun m!215717 () Bool)

(assert (=> bm!19045 m!215717))

(assert (=> b!188851 d!55753))

(declare-fun d!55755 () Bool)

(declare-fun res!89387 () Bool)

(declare-fun e!124428 () Bool)

(assert (=> d!55755 (=> (not res!89387) (not e!124428))))

(declare-fun simpleValid!191 (LongMapFixedSize!2626) Bool)

(assert (=> d!55755 (= res!89387 (simpleValid!191 thiss!1248))))

(assert (=> d!55755 (= (valid!1106 thiss!1248) e!124428)))

(declare-fun b!189089 () Bool)

(declare-fun res!89388 () Bool)

(assert (=> b!189089 (=> (not res!89388) (not e!124428))))

(declare-fun arrayCountValidKeys!0 (array!8021 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!189089 (= res!89388 (= (arrayCountValidKeys!0 (_keys!5814 thiss!1248) #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))) (_size!1362 thiss!1248)))))

(declare-fun b!189090 () Bool)

(declare-fun res!89389 () Bool)

(assert (=> b!189090 (=> (not res!89389) (not e!124428))))

(assert (=> b!189090 (= res!89389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5814 thiss!1248) (mask!9026 thiss!1248)))))

(declare-fun b!189091 () Bool)

(assert (=> b!189091 (= e!124428 (arrayNoDuplicates!0 (_keys!5814 thiss!1248) #b00000000000000000000000000000000 Nil!2362))))

(assert (= (and d!55755 res!89387) b!189089))

(assert (= (and b!189089 res!89388) b!189090))

(assert (= (and b!189090 res!89389) b!189091))

(declare-fun m!215719 () Bool)

(assert (=> d!55755 m!215719))

(declare-fun m!215721 () Bool)

(assert (=> b!189089 m!215721))

(assert (=> b!189090 m!215533))

(assert (=> b!189091 m!215549))

(assert (=> start!19196 d!55755))

(declare-fun b!189102 () Bool)

(declare-fun e!124439 () Bool)

(declare-fun call!19057 () Bool)

(assert (=> b!189102 (= e!124439 call!19057)))

(declare-fun b!189103 () Bool)

(declare-fun e!124438 () Bool)

(assert (=> b!189103 (= e!124438 e!124439)))

(declare-fun c!33999 () Bool)

(assert (=> b!189103 (= c!33999 (validKeyInArray!0 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55757 () Bool)

(declare-fun res!89398 () Bool)

(declare-fun e!124437 () Bool)

(assert (=> d!55757 (=> res!89398 e!124437)))

(assert (=> d!55757 (= res!89398 (bvsge #b00000000000000000000000000000000 (size!4102 (_keys!5814 thiss!1248))))))

(assert (=> d!55757 (= (arrayNoDuplicates!0 (_keys!5814 thiss!1248) #b00000000000000000000000000000000 Nil!2362) e!124437)))

(declare-fun b!189104 () Bool)

(declare-fun e!124440 () Bool)

(declare-fun contains!1318 (List!2365 (_ BitVec 64)) Bool)

(assert (=> b!189104 (= e!124440 (contains!1318 Nil!2362 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189105 () Bool)

(assert (=> b!189105 (= e!124439 call!19057)))

(declare-fun bm!19054 () Bool)

(assert (=> bm!19054 (= call!19057 (arrayNoDuplicates!0 (_keys!5814 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33999 (Cons!2361 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000) Nil!2362) Nil!2362)))))

(declare-fun b!189106 () Bool)

(assert (=> b!189106 (= e!124437 e!124438)))

(declare-fun res!89396 () Bool)

(assert (=> b!189106 (=> (not res!89396) (not e!124438))))

(assert (=> b!189106 (= res!89396 (not e!124440))))

(declare-fun res!89397 () Bool)

(assert (=> b!189106 (=> (not res!89397) (not e!124440))))

(assert (=> b!189106 (= res!89397 (validKeyInArray!0 (select (arr!3782 (_keys!5814 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55757 (not res!89398)) b!189106))

(assert (= (and b!189106 res!89397) b!189104))

(assert (= (and b!189106 res!89396) b!189103))

(assert (= (and b!189103 c!33999) b!189105))

(assert (= (and b!189103 (not c!33999)) b!189102))

(assert (= (or b!189105 b!189102) bm!19054))

(assert (=> b!189103 m!215627))

(assert (=> b!189103 m!215627))

(assert (=> b!189103 m!215635))

(assert (=> b!189104 m!215627))

(assert (=> b!189104 m!215627))

(declare-fun m!215723 () Bool)

(assert (=> b!189104 m!215723))

(assert (=> bm!19054 m!215627))

(declare-fun m!215725 () Bool)

(assert (=> bm!19054 m!215725))

(assert (=> b!189106 m!215627))

(assert (=> b!189106 m!215627))

(assert (=> b!189106 m!215635))

(assert (=> b!188860 d!55757))

(declare-fun condMapEmpty!7606 () Bool)

(declare-fun mapDefault!7606 () ValueCell!1859)

(assert (=> mapNonEmpty!7597 (= condMapEmpty!7606 (= mapRest!7597 ((as const (Array (_ BitVec 32) ValueCell!1859)) mapDefault!7606)))))

(declare-fun e!124445 () Bool)

(declare-fun mapRes!7606 () Bool)

(assert (=> mapNonEmpty!7597 (= tp!16725 (and e!124445 mapRes!7606))))

(declare-fun mapIsEmpty!7606 () Bool)

(assert (=> mapIsEmpty!7606 mapRes!7606))

(declare-fun b!189113 () Bool)

(declare-fun e!124446 () Bool)

(assert (=> b!189113 (= e!124446 tp_is_empty!4405)))

(declare-fun b!189114 () Bool)

(assert (=> b!189114 (= e!124445 tp_is_empty!4405)))

(declare-fun mapNonEmpty!7606 () Bool)

(declare-fun tp!16741 () Bool)

(assert (=> mapNonEmpty!7606 (= mapRes!7606 (and tp!16741 e!124446))))

(declare-fun mapValue!7606 () ValueCell!1859)

(declare-fun mapKey!7606 () (_ BitVec 32))

(declare-fun mapRest!7606 () (Array (_ BitVec 32) ValueCell!1859))

(assert (=> mapNonEmpty!7606 (= mapRest!7597 (store mapRest!7606 mapKey!7606 mapValue!7606))))

(assert (= (and mapNonEmpty!7597 condMapEmpty!7606) mapIsEmpty!7606))

(assert (= (and mapNonEmpty!7597 (not condMapEmpty!7606)) mapNonEmpty!7606))

(assert (= (and mapNonEmpty!7606 ((_ is ValueCellFull!1859) mapValue!7606)) b!189113))

(assert (= (and mapNonEmpty!7597 ((_ is ValueCellFull!1859) mapDefault!7606)) b!189114))

(declare-fun m!215727 () Bool)

(assert (=> mapNonEmpty!7606 m!215727))

(declare-fun b_lambda!7343 () Bool)

(assert (= b_lambda!7341 (or (and b!188859 b_free!4633) b_lambda!7343)))

(check-sat (not b_next!4633) (not b_lambda!7343) (not b!189063) tp_is_empty!4405 (not b!189015) (not bm!19026) (not b!188999) (not b!189017) (not mapNonEmpty!7606) (not bm!19027) b_and!11287 (not d!55745) (not d!55755) (not bm!19045) (not d!55735) (not bm!19030) (not b!189072) (not b!189103) (not bm!19049) (not bm!19050) (not b!189007) (not bm!19054) (not b!188981) (not d!55751) (not b!189104) (not b!189062) (not b!189066) (not d!55743) (not b!189077) (not b!189067) (not d!55753) (not b!189091) (not b!189106) (not b!189090) (not b!189076) (not b!189089) (not bm!19051) (not b!189071) (not b!188984))
(check-sat b_and!11287 (not b_next!4633))
