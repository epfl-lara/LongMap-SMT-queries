; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18908 () Bool)

(assert start!18908)

(declare-fun b!186465 () Bool)

(declare-fun b_free!4597 () Bool)

(declare-fun b_next!4597 () Bool)

(assert (=> b!186465 (= b_free!4597 (not b_next!4597))))

(declare-fun tp!16597 () Bool)

(declare-fun b_and!11181 () Bool)

(assert (=> b!186465 (= tp!16597 b_and!11181)))

(declare-fun b!186461 () Bool)

(declare-fun e!122713 () Bool)

(declare-fun tp_is_empty!4369 () Bool)

(assert (=> b!186461 (= e!122713 tp_is_empty!4369)))

(declare-fun b!186462 () Bool)

(declare-fun e!122705 () Bool)

(declare-fun e!122704 () Bool)

(assert (=> b!186462 (= e!122705 e!122704)))

(declare-fun res!88171 () Bool)

(assert (=> b!186462 (=> (not res!88171) (not e!122704))))

(declare-datatypes ((SeekEntryResult!646 0))(
  ( (MissingZero!646 (index!4754 (_ BitVec 32))) (Found!646 (index!4755 (_ BitVec 32))) (Intermediate!646 (undefined!1458 Bool) (index!4756 (_ BitVec 32)) (x!20235 (_ BitVec 32))) (Undefined!646) (MissingVacant!646 (index!4757 (_ BitVec 32))) )
))
(declare-fun lt!92101 () SeekEntryResult!646)

(get-info :version)

(assert (=> b!186462 (= res!88171 (and (not ((_ is Undefined!646) lt!92101)) (not ((_ is MissingVacant!646) lt!92101)) (not ((_ is MissingZero!646) lt!92101)) ((_ is Found!646) lt!92101)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5473 0))(
  ( (V!5474 (val!2229 Int)) )
))
(declare-datatypes ((ValueCell!1841 0))(
  ( (ValueCellFull!1841 (v!4136 V!5473)) (EmptyCell!1841) )
))
(declare-datatypes ((array!7931 0))(
  ( (array!7932 (arr!3742 (Array (_ BitVec 32) (_ BitVec 64))) (size!4060 (_ BitVec 32))) )
))
(declare-datatypes ((array!7933 0))(
  ( (array!7934 (arr!3743 (Array (_ BitVec 32) ValueCell!1841)) (size!4061 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2590 0))(
  ( (LongMapFixedSize!2591 (defaultEntry!3806 Int) (mask!8936 (_ BitVec 32)) (extraKeys!3543 (_ BitVec 32)) (zeroValue!3647 V!5473) (minValue!3647 V!5473) (_size!1344 (_ BitVec 32)) (_keys!5751 array!7931) (_values!3789 array!7933) (_vacant!1344 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2590)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7931 (_ BitVec 32)) SeekEntryResult!646)

(assert (=> b!186462 (= lt!92101 (seekEntryOrOpen!0 key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(declare-fun mapIsEmpty!7522 () Bool)

(declare-fun mapRes!7522 () Bool)

(assert (=> mapIsEmpty!7522 mapRes!7522))

(declare-fun b!186463 () Bool)

(declare-fun e!122708 () Bool)

(assert (=> b!186463 (= e!122704 e!122708)))

(declare-fun res!88172 () Bool)

(assert (=> b!186463 (=> (not res!88172) (not e!122708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!186463 (= res!88172 (validMask!0 (mask!8936 thiss!1248)))))

(declare-datatypes ((Unit!5593 0))(
  ( (Unit!5594) )
))
(declare-fun lt!92104 () Unit!5593)

(declare-fun e!122709 () Unit!5593)

(assert (=> b!186463 (= lt!92104 e!122709)))

(declare-fun c!33450 () Bool)

(declare-datatypes ((tuple2!3434 0))(
  ( (tuple2!3435 (_1!1728 (_ BitVec 64)) (_2!1728 V!5473)) )
))
(declare-datatypes ((List!2364 0))(
  ( (Nil!2361) (Cons!2360 (h!2994 tuple2!3434) (t!7243 List!2364)) )
))
(declare-datatypes ((ListLongMap!2343 0))(
  ( (ListLongMap!2344 (toList!1187 List!2364)) )
))
(declare-fun contains!1291 (ListLongMap!2343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!820 (array!7931 array!7933 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 32) Int) ListLongMap!2343)

(assert (=> b!186463 (= c!33450 (contains!1291 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)) key!828))))

(declare-fun b!186464 () Bool)

(declare-fun e!122707 () Bool)

(assert (=> b!186464 (= e!122707 tp_is_empty!4369)))

(declare-fun e!122712 () Bool)

(declare-fun e!122710 () Bool)

(declare-fun array_inv!2423 (array!7931) Bool)

(declare-fun array_inv!2424 (array!7933) Bool)

(assert (=> b!186465 (= e!122710 (and tp!16597 tp_is_empty!4369 (array_inv!2423 (_keys!5751 thiss!1248)) (array_inv!2424 (_values!3789 thiss!1248)) e!122712))))

(declare-fun b!186466 () Bool)

(assert (=> b!186466 (= e!122712 (and e!122713 mapRes!7522))))

(declare-fun condMapEmpty!7522 () Bool)

(declare-fun mapDefault!7522 () ValueCell!1841)

(assert (=> b!186466 (= condMapEmpty!7522 (= (arr!3743 (_values!3789 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1841)) mapDefault!7522)))))

(declare-fun mapNonEmpty!7522 () Bool)

(declare-fun tp!16596 () Bool)

(assert (=> mapNonEmpty!7522 (= mapRes!7522 (and tp!16596 e!122707))))

(declare-fun mapValue!7522 () ValueCell!1841)

(declare-fun mapRest!7522 () (Array (_ BitVec 32) ValueCell!1841))

(declare-fun mapKey!7522 () (_ BitVec 32))

(assert (=> mapNonEmpty!7522 (= (arr!3743 (_values!3789 thiss!1248)) (store mapRest!7522 mapKey!7522 mapValue!7522))))

(declare-fun res!88168 () Bool)

(assert (=> start!18908 (=> (not res!88168) (not e!122705))))

(declare-fun valid!1087 (LongMapFixedSize!2590) Bool)

(assert (=> start!18908 (= res!88168 (valid!1087 thiss!1248))))

(assert (=> start!18908 e!122705))

(assert (=> start!18908 e!122710))

(assert (=> start!18908 true))

(declare-fun b!186467 () Bool)

(assert (=> b!186467 (= e!122708 (and (= (size!4061 (_values!3789 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8936 thiss!1248))) (not (= (size!4060 (_keys!5751 thiss!1248)) (size!4061 (_values!3789 thiss!1248))))))))

(declare-fun b!186468 () Bool)

(declare-fun res!88169 () Bool)

(assert (=> b!186468 (=> (not res!88169) (not e!122705))))

(assert (=> b!186468 (= res!88169 (not (= key!828 (bvneg key!828))))))

(declare-fun b!186469 () Bool)

(declare-fun lt!92102 () Unit!5593)

(assert (=> b!186469 (= e!122709 lt!92102)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!146 (array!7931 array!7933 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 64) Int) Unit!5593)

(assert (=> b!186469 (= lt!92102 (lemmaInListMapThenSeekEntryOrOpenFindsIt!146 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)))))

(declare-fun res!88170 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186469 (= res!88170 (inRange!0 (index!4755 lt!92101) (mask!8936 thiss!1248)))))

(declare-fun e!122711 () Bool)

(assert (=> b!186469 (=> (not res!88170) (not e!122711))))

(assert (=> b!186469 e!122711))

(declare-fun b!186470 () Bool)

(declare-fun Unit!5595 () Unit!5593)

(assert (=> b!186470 (= e!122709 Unit!5595)))

(declare-fun lt!92103 () Unit!5593)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!143 (array!7931 array!7933 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 64) Int) Unit!5593)

(assert (=> b!186470 (= lt!92103 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!143 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)))))

(assert (=> b!186470 false))

(declare-fun b!186471 () Bool)

(assert (=> b!186471 (= e!122711 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4755 lt!92101)) key!828))))

(assert (= (and start!18908 res!88168) b!186468))

(assert (= (and b!186468 res!88169) b!186462))

(assert (= (and b!186462 res!88171) b!186463))

(assert (= (and b!186463 c!33450) b!186469))

(assert (= (and b!186463 (not c!33450)) b!186470))

(assert (= (and b!186469 res!88170) b!186471))

(assert (= (and b!186463 res!88172) b!186467))

(assert (= (and b!186466 condMapEmpty!7522) mapIsEmpty!7522))

(assert (= (and b!186466 (not condMapEmpty!7522)) mapNonEmpty!7522))

(assert (= (and mapNonEmpty!7522 ((_ is ValueCellFull!1841) mapValue!7522)) b!186464))

(assert (= (and b!186466 ((_ is ValueCellFull!1841) mapDefault!7522)) b!186461))

(assert (= b!186465 b!186466))

(assert (= start!18908 b!186465))

(declare-fun m!212943 () Bool)

(assert (=> b!186471 m!212943))

(declare-fun m!212945 () Bool)

(assert (=> b!186469 m!212945))

(declare-fun m!212947 () Bool)

(assert (=> b!186469 m!212947))

(declare-fun m!212949 () Bool)

(assert (=> b!186463 m!212949))

(declare-fun m!212951 () Bool)

(assert (=> b!186463 m!212951))

(assert (=> b!186463 m!212951))

(declare-fun m!212953 () Bool)

(assert (=> b!186463 m!212953))

(declare-fun m!212955 () Bool)

(assert (=> mapNonEmpty!7522 m!212955))

(declare-fun m!212957 () Bool)

(assert (=> b!186470 m!212957))

(declare-fun m!212959 () Bool)

(assert (=> b!186465 m!212959))

(declare-fun m!212961 () Bool)

(assert (=> b!186465 m!212961))

(declare-fun m!212963 () Bool)

(assert (=> b!186462 m!212963))

(declare-fun m!212965 () Bool)

(assert (=> start!18908 m!212965))

(check-sat (not b!186465) (not mapNonEmpty!7522) (not b!186462) b_and!11181 (not b!186470) tp_is_empty!4369 (not b!186469) (not start!18908) (not b_next!4597) (not b!186463))
(check-sat b_and!11181 (not b_next!4597))
(get-model)

(declare-fun b!186550 () Bool)

(declare-fun e!122780 () SeekEntryResult!646)

(declare-fun e!122782 () SeekEntryResult!646)

(assert (=> b!186550 (= e!122780 e!122782)))

(declare-fun lt!92135 () (_ BitVec 64))

(declare-fun lt!92136 () SeekEntryResult!646)

(assert (=> b!186550 (= lt!92135 (select (arr!3742 (_keys!5751 thiss!1248)) (index!4756 lt!92136)))))

(declare-fun c!33464 () Bool)

(assert (=> b!186550 (= c!33464 (= lt!92135 key!828))))

(declare-fun d!55123 () Bool)

(declare-fun lt!92137 () SeekEntryResult!646)

(assert (=> d!55123 (and (or ((_ is Undefined!646) lt!92137) (not ((_ is Found!646) lt!92137)) (and (bvsge (index!4755 lt!92137) #b00000000000000000000000000000000) (bvslt (index!4755 lt!92137) (size!4060 (_keys!5751 thiss!1248))))) (or ((_ is Undefined!646) lt!92137) ((_ is Found!646) lt!92137) (not ((_ is MissingZero!646) lt!92137)) (and (bvsge (index!4754 lt!92137) #b00000000000000000000000000000000) (bvslt (index!4754 lt!92137) (size!4060 (_keys!5751 thiss!1248))))) (or ((_ is Undefined!646) lt!92137) ((_ is Found!646) lt!92137) ((_ is MissingZero!646) lt!92137) (not ((_ is MissingVacant!646) lt!92137)) (and (bvsge (index!4757 lt!92137) #b00000000000000000000000000000000) (bvslt (index!4757 lt!92137) (size!4060 (_keys!5751 thiss!1248))))) (or ((_ is Undefined!646) lt!92137) (ite ((_ is Found!646) lt!92137) (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4755 lt!92137)) key!828) (ite ((_ is MissingZero!646) lt!92137) (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4754 lt!92137)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!646) lt!92137) (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4757 lt!92137)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55123 (= lt!92137 e!122780)))

(declare-fun c!33463 () Bool)

(assert (=> d!55123 (= c!33463 (and ((_ is Intermediate!646) lt!92136) (undefined!1458 lt!92136)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7931 (_ BitVec 32)) SeekEntryResult!646)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55123 (= lt!92136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8936 thiss!1248)) key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(assert (=> d!55123 (validMask!0 (mask!8936 thiss!1248))))

(assert (=> d!55123 (= (seekEntryOrOpen!0 key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)) lt!92137)))

(declare-fun b!186551 () Bool)

(assert (=> b!186551 (= e!122780 Undefined!646)))

(declare-fun b!186552 () Bool)

(declare-fun e!122781 () SeekEntryResult!646)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7931 (_ BitVec 32)) SeekEntryResult!646)

(assert (=> b!186552 (= e!122781 (seekKeyOrZeroReturnVacant!0 (x!20235 lt!92136) (index!4756 lt!92136) (index!4756 lt!92136) key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(declare-fun b!186553 () Bool)

(assert (=> b!186553 (= e!122782 (Found!646 (index!4756 lt!92136)))))

(declare-fun b!186554 () Bool)

(declare-fun c!33465 () Bool)

(assert (=> b!186554 (= c!33465 (= lt!92135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186554 (= e!122782 e!122781)))

(declare-fun b!186555 () Bool)

(assert (=> b!186555 (= e!122781 (MissingZero!646 (index!4756 lt!92136)))))

(assert (= (and d!55123 c!33463) b!186551))

(assert (= (and d!55123 (not c!33463)) b!186550))

(assert (= (and b!186550 c!33464) b!186553))

(assert (= (and b!186550 (not c!33464)) b!186554))

(assert (= (and b!186554 c!33465) b!186555))

(assert (= (and b!186554 (not c!33465)) b!186552))

(declare-fun m!213015 () Bool)

(assert (=> b!186550 m!213015))

(declare-fun m!213017 () Bool)

(assert (=> d!55123 m!213017))

(assert (=> d!55123 m!212949))

(declare-fun m!213019 () Bool)

(assert (=> d!55123 m!213019))

(declare-fun m!213021 () Bool)

(assert (=> d!55123 m!213021))

(declare-fun m!213023 () Bool)

(assert (=> d!55123 m!213023))

(assert (=> d!55123 m!213021))

(declare-fun m!213025 () Bool)

(assert (=> d!55123 m!213025))

(declare-fun m!213027 () Bool)

(assert (=> b!186552 m!213027))

(assert (=> b!186462 d!55123))

(declare-fun b!186572 () Bool)

(declare-fun e!122793 () Bool)

(declare-fun e!122794 () Bool)

(assert (=> b!186572 (= e!122793 e!122794)))

(declare-fun res!88212 () Bool)

(declare-fun call!18792 () Bool)

(assert (=> b!186572 (= res!88212 call!18792)))

(assert (=> b!186572 (=> (not res!88212) (not e!122794))))

(declare-fun d!55125 () Bool)

(assert (=> d!55125 e!122793))

(declare-fun c!33471 () Bool)

(declare-fun lt!92142 () SeekEntryResult!646)

(assert (=> d!55125 (= c!33471 ((_ is MissingZero!646) lt!92142))))

(assert (=> d!55125 (= lt!92142 (seekEntryOrOpen!0 key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(declare-fun lt!92143 () Unit!5593)

(declare-fun choose!996 (array!7931 array!7933 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 64) Int) Unit!5593)

(assert (=> d!55125 (= lt!92143 (choose!996 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)))))

(assert (=> d!55125 (validMask!0 (mask!8936 thiss!1248))))

(assert (=> d!55125 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!143 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)) lt!92143)))

(declare-fun b!186573 () Bool)

(assert (=> b!186573 (and (bvsge (index!4754 lt!92142) #b00000000000000000000000000000000) (bvslt (index!4754 lt!92142) (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun res!88214 () Bool)

(assert (=> b!186573 (= res!88214 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4754 lt!92142)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186573 (=> (not res!88214) (not e!122794))))

(declare-fun b!186574 () Bool)

(declare-fun res!88211 () Bool)

(declare-fun e!122792 () Bool)

(assert (=> b!186574 (=> (not res!88211) (not e!122792))))

(assert (=> b!186574 (= res!88211 call!18792)))

(declare-fun e!122791 () Bool)

(assert (=> b!186574 (= e!122791 e!122792)))

(declare-fun b!186575 () Bool)

(declare-fun res!88213 () Bool)

(assert (=> b!186575 (=> (not res!88213) (not e!122792))))

(assert (=> b!186575 (= res!88213 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4757 lt!92142)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186575 (and (bvsge (index!4757 lt!92142) #b00000000000000000000000000000000) (bvslt (index!4757 lt!92142) (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun b!186576 () Bool)

(assert (=> b!186576 (= e!122793 e!122791)))

(declare-fun c!33470 () Bool)

(assert (=> b!186576 (= c!33470 ((_ is MissingVacant!646) lt!92142))))

(declare-fun bm!18789 () Bool)

(declare-fun call!18793 () Bool)

(declare-fun arrayContainsKey!0 (array!7931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18789 (= call!18793 (arrayContainsKey!0 (_keys!5751 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186577 () Bool)

(assert (=> b!186577 (= e!122791 ((_ is Undefined!646) lt!92142))))

(declare-fun b!186578 () Bool)

(assert (=> b!186578 (= e!122792 (not call!18793))))

(declare-fun b!186579 () Bool)

(assert (=> b!186579 (= e!122794 (not call!18793))))

(declare-fun bm!18790 () Bool)

(assert (=> bm!18790 (= call!18792 (inRange!0 (ite c!33471 (index!4754 lt!92142) (index!4757 lt!92142)) (mask!8936 thiss!1248)))))

(assert (= (and d!55125 c!33471) b!186572))

(assert (= (and d!55125 (not c!33471)) b!186576))

(assert (= (and b!186572 res!88212) b!186573))

(assert (= (and b!186573 res!88214) b!186579))

(assert (= (and b!186576 c!33470) b!186574))

(assert (= (and b!186576 (not c!33470)) b!186577))

(assert (= (and b!186574 res!88211) b!186575))

(assert (= (and b!186575 res!88213) b!186578))

(assert (= (or b!186572 b!186574) bm!18790))

(assert (= (or b!186579 b!186578) bm!18789))

(declare-fun m!213029 () Bool)

(assert (=> b!186573 m!213029))

(declare-fun m!213031 () Bool)

(assert (=> bm!18790 m!213031))

(assert (=> d!55125 m!212963))

(declare-fun m!213033 () Bool)

(assert (=> d!55125 m!213033))

(assert (=> d!55125 m!212949))

(declare-fun m!213035 () Bool)

(assert (=> bm!18789 m!213035))

(declare-fun m!213037 () Bool)

(assert (=> b!186575 m!213037))

(assert (=> b!186470 d!55125))

(declare-fun d!55127 () Bool)

(assert (=> d!55127 (= (array_inv!2423 (_keys!5751 thiss!1248)) (bvsge (size!4060 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186465 d!55127))

(declare-fun d!55129 () Bool)

(assert (=> d!55129 (= (array_inv!2424 (_values!3789 thiss!1248)) (bvsge (size!4061 (_values!3789 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186465 d!55129))

(declare-fun d!55131 () Bool)

(declare-fun e!122797 () Bool)

(assert (=> d!55131 e!122797))

(declare-fun res!88220 () Bool)

(assert (=> d!55131 (=> (not res!88220) (not e!122797))))

(declare-fun lt!92149 () SeekEntryResult!646)

(assert (=> d!55131 (= res!88220 ((_ is Found!646) lt!92149))))

(assert (=> d!55131 (= lt!92149 (seekEntryOrOpen!0 key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(declare-fun lt!92148 () Unit!5593)

(declare-fun choose!997 (array!7931 array!7933 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 64) Int) Unit!5593)

(assert (=> d!55131 (= lt!92148 (choose!997 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)))))

(assert (=> d!55131 (validMask!0 (mask!8936 thiss!1248))))

(assert (=> d!55131 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!146 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)) lt!92148)))

(declare-fun b!186584 () Bool)

(declare-fun res!88219 () Bool)

(assert (=> b!186584 (=> (not res!88219) (not e!122797))))

(assert (=> b!186584 (= res!88219 (inRange!0 (index!4755 lt!92149) (mask!8936 thiss!1248)))))

(declare-fun b!186585 () Bool)

(assert (=> b!186585 (= e!122797 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4755 lt!92149)) key!828))))

(assert (=> b!186585 (and (bvsge (index!4755 lt!92149) #b00000000000000000000000000000000) (bvslt (index!4755 lt!92149) (size!4060 (_keys!5751 thiss!1248))))))

(assert (= (and d!55131 res!88220) b!186584))

(assert (= (and b!186584 res!88219) b!186585))

(assert (=> d!55131 m!212963))

(declare-fun m!213039 () Bool)

(assert (=> d!55131 m!213039))

(assert (=> d!55131 m!212949))

(declare-fun m!213041 () Bool)

(assert (=> b!186584 m!213041))

(declare-fun m!213043 () Bool)

(assert (=> b!186585 m!213043))

(assert (=> b!186469 d!55131))

(declare-fun d!55133 () Bool)

(assert (=> d!55133 (= (inRange!0 (index!4755 lt!92101) (mask!8936 thiss!1248)) (and (bvsge (index!4755 lt!92101) #b00000000000000000000000000000000) (bvslt (index!4755 lt!92101) (bvadd (mask!8936 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186469 d!55133))

(declare-fun d!55135 () Bool)

(declare-fun res!88227 () Bool)

(declare-fun e!122800 () Bool)

(assert (=> d!55135 (=> (not res!88227) (not e!122800))))

(declare-fun simpleValid!185 (LongMapFixedSize!2590) Bool)

(assert (=> d!55135 (= res!88227 (simpleValid!185 thiss!1248))))

(assert (=> d!55135 (= (valid!1087 thiss!1248) e!122800)))

(declare-fun b!186592 () Bool)

(declare-fun res!88228 () Bool)

(assert (=> b!186592 (=> (not res!88228) (not e!122800))))

(declare-fun arrayCountValidKeys!0 (array!7931 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186592 (= res!88228 (= (arrayCountValidKeys!0 (_keys!5751 thiss!1248) #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))) (_size!1344 thiss!1248)))))

(declare-fun b!186593 () Bool)

(declare-fun res!88229 () Bool)

(assert (=> b!186593 (=> (not res!88229) (not e!122800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7931 (_ BitVec 32)) Bool)

(assert (=> b!186593 (= res!88229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(declare-fun b!186594 () Bool)

(declare-datatypes ((List!2365 0))(
  ( (Nil!2362) (Cons!2361 (h!2995 (_ BitVec 64)) (t!7246 List!2365)) )
))
(declare-fun arrayNoDuplicates!0 (array!7931 (_ BitVec 32) List!2365) Bool)

(assert (=> b!186594 (= e!122800 (arrayNoDuplicates!0 (_keys!5751 thiss!1248) #b00000000000000000000000000000000 Nil!2362))))

(assert (= (and d!55135 res!88227) b!186592))

(assert (= (and b!186592 res!88228) b!186593))

(assert (= (and b!186593 res!88229) b!186594))

(declare-fun m!213045 () Bool)

(assert (=> d!55135 m!213045))

(declare-fun m!213047 () Bool)

(assert (=> b!186592 m!213047))

(declare-fun m!213049 () Bool)

(assert (=> b!186593 m!213049))

(declare-fun m!213051 () Bool)

(assert (=> b!186594 m!213051))

(assert (=> start!18908 d!55135))

(declare-fun d!55137 () Bool)

(assert (=> d!55137 (= (validMask!0 (mask!8936 thiss!1248)) (and (or (= (mask!8936 thiss!1248) #b00000000000000000000000000000111) (= (mask!8936 thiss!1248) #b00000000000000000000000000001111) (= (mask!8936 thiss!1248) #b00000000000000000000000000011111) (= (mask!8936 thiss!1248) #b00000000000000000000000000111111) (= (mask!8936 thiss!1248) #b00000000000000000000000001111111) (= (mask!8936 thiss!1248) #b00000000000000000000000011111111) (= (mask!8936 thiss!1248) #b00000000000000000000000111111111) (= (mask!8936 thiss!1248) #b00000000000000000000001111111111) (= (mask!8936 thiss!1248) #b00000000000000000000011111111111) (= (mask!8936 thiss!1248) #b00000000000000000000111111111111) (= (mask!8936 thiss!1248) #b00000000000000000001111111111111) (= (mask!8936 thiss!1248) #b00000000000000000011111111111111) (= (mask!8936 thiss!1248) #b00000000000000000111111111111111) (= (mask!8936 thiss!1248) #b00000000000000001111111111111111) (= (mask!8936 thiss!1248) #b00000000000000011111111111111111) (= (mask!8936 thiss!1248) #b00000000000000111111111111111111) (= (mask!8936 thiss!1248) #b00000000000001111111111111111111) (= (mask!8936 thiss!1248) #b00000000000011111111111111111111) (= (mask!8936 thiss!1248) #b00000000000111111111111111111111) (= (mask!8936 thiss!1248) #b00000000001111111111111111111111) (= (mask!8936 thiss!1248) #b00000000011111111111111111111111) (= (mask!8936 thiss!1248) #b00000000111111111111111111111111) (= (mask!8936 thiss!1248) #b00000001111111111111111111111111) (= (mask!8936 thiss!1248) #b00000011111111111111111111111111) (= (mask!8936 thiss!1248) #b00000111111111111111111111111111) (= (mask!8936 thiss!1248) #b00001111111111111111111111111111) (= (mask!8936 thiss!1248) #b00011111111111111111111111111111) (= (mask!8936 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8936 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!186463 d!55137))

(declare-fun d!55139 () Bool)

(declare-fun e!122806 () Bool)

(assert (=> d!55139 e!122806))

(declare-fun res!88232 () Bool)

(assert (=> d!55139 (=> res!88232 e!122806)))

(declare-fun lt!92160 () Bool)

(assert (=> d!55139 (= res!88232 (not lt!92160))))

(declare-fun lt!92159 () Bool)

(assert (=> d!55139 (= lt!92160 lt!92159)))

(declare-fun lt!92161 () Unit!5593)

(declare-fun e!122805 () Unit!5593)

(assert (=> d!55139 (= lt!92161 e!122805)))

(declare-fun c!33474 () Bool)

(assert (=> d!55139 (= c!33474 lt!92159)))

(declare-fun containsKey!228 (List!2364 (_ BitVec 64)) Bool)

(assert (=> d!55139 (= lt!92159 (containsKey!228 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(assert (=> d!55139 (= (contains!1291 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)) key!828) lt!92160)))

(declare-fun b!186601 () Bool)

(declare-fun lt!92158 () Unit!5593)

(assert (=> b!186601 (= e!122805 lt!92158)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!177 (List!2364 (_ BitVec 64)) Unit!5593)

(assert (=> b!186601 (= lt!92158 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(declare-datatypes ((Option!230 0))(
  ( (Some!229 (v!4139 V!5473)) (None!228) )
))
(declare-fun isDefined!178 (Option!230) Bool)

(declare-fun getValueByKey!224 (List!2364 (_ BitVec 64)) Option!230)

(assert (=> b!186601 (isDefined!178 (getValueByKey!224 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(declare-fun b!186602 () Bool)

(declare-fun Unit!5599 () Unit!5593)

(assert (=> b!186602 (= e!122805 Unit!5599)))

(declare-fun b!186603 () Bool)

(assert (=> b!186603 (= e!122806 (isDefined!178 (getValueByKey!224 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828)))))

(assert (= (and d!55139 c!33474) b!186601))

(assert (= (and d!55139 (not c!33474)) b!186602))

(assert (= (and d!55139 (not res!88232)) b!186603))

(declare-fun m!213053 () Bool)

(assert (=> d!55139 m!213053))

(declare-fun m!213055 () Bool)

(assert (=> b!186601 m!213055))

(declare-fun m!213057 () Bool)

(assert (=> b!186601 m!213057))

(assert (=> b!186601 m!213057))

(declare-fun m!213059 () Bool)

(assert (=> b!186601 m!213059))

(assert (=> b!186603 m!213057))

(assert (=> b!186603 m!213057))

(assert (=> b!186603 m!213059))

(assert (=> b!186463 d!55139))

(declare-fun b!186646 () Bool)

(declare-fun e!122839 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!186646 (= e!122839 (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55141 () Bool)

(declare-fun e!122842 () Bool)

(assert (=> d!55141 e!122842))

(declare-fun res!88255 () Bool)

(assert (=> d!55141 (=> (not res!88255) (not e!122842))))

(assert (=> d!55141 (= res!88255 (or (bvsge #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))))

(declare-fun lt!92212 () ListLongMap!2343)

(declare-fun lt!92218 () ListLongMap!2343)

(assert (=> d!55141 (= lt!92212 lt!92218)))

(declare-fun lt!92210 () Unit!5593)

(declare-fun e!122841 () Unit!5593)

(assert (=> d!55141 (= lt!92210 e!122841)))

(declare-fun c!33488 () Bool)

(assert (=> d!55141 (= c!33488 e!122839)))

(declare-fun res!88254 () Bool)

(assert (=> d!55141 (=> (not res!88254) (not e!122839))))

(assert (=> d!55141 (= res!88254 (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun e!122838 () ListLongMap!2343)

(assert (=> d!55141 (= lt!92218 e!122838)))

(declare-fun c!33487 () Bool)

(assert (=> d!55141 (= c!33487 (and (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55141 (validMask!0 (mask!8936 thiss!1248))))

(assert (=> d!55141 (= (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)) lt!92212)))

(declare-fun b!186647 () Bool)

(declare-fun e!122844 () Bool)

(declare-fun call!18809 () Bool)

(assert (=> b!186647 (= e!122844 (not call!18809))))

(declare-fun b!186648 () Bool)

(declare-fun e!122836 () Bool)

(declare-fun apply!169 (ListLongMap!2343 (_ BitVec 64)) V!5473)

(assert (=> b!186648 (= e!122836 (= (apply!169 lt!92212 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3647 thiss!1248)))))

(declare-fun b!186649 () Bool)

(declare-fun e!122840 () Bool)

(declare-fun e!122837 () Bool)

(assert (=> b!186649 (= e!122840 e!122837)))

(declare-fun res!88257 () Bool)

(declare-fun call!18814 () Bool)

(assert (=> b!186649 (= res!88257 call!18814)))

(assert (=> b!186649 (=> (not res!88257) (not e!122837))))

(declare-fun bm!18805 () Bool)

(assert (=> bm!18805 (= call!18809 (contains!1291 lt!92212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186650 () Bool)

(declare-fun res!88252 () Bool)

(assert (=> b!186650 (=> (not res!88252) (not e!122842))))

(assert (=> b!186650 (= res!88252 e!122840)))

(declare-fun c!33489 () Bool)

(assert (=> b!186650 (= c!33489 (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!186651 () Bool)

(assert (=> b!186651 (= e!122842 e!122844)))

(declare-fun c!33492 () Bool)

(assert (=> b!186651 (= c!33492 (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18806 () Bool)

(declare-fun call!18811 () ListLongMap!2343)

(declare-fun call!18813 () ListLongMap!2343)

(assert (=> bm!18806 (= call!18811 call!18813)))

(declare-fun bm!18807 () Bool)

(declare-fun call!18808 () ListLongMap!2343)

(declare-fun call!18812 () ListLongMap!2343)

(assert (=> bm!18807 (= call!18808 call!18812)))

(declare-fun b!186652 () Bool)

(declare-fun e!122843 () Bool)

(declare-fun get!2151 (ValueCell!1841 V!5473) V!5473)

(declare-fun dynLambda!503 (Int (_ BitVec 64)) V!5473)

(assert (=> b!186652 (= e!122843 (= (apply!169 lt!92212 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)) (get!2151 (select (arr!3743 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4061 (_values!3789 thiss!1248))))))

(assert (=> b!186652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun bm!18808 () Bool)

(assert (=> bm!18808 (= call!18814 (contains!1291 lt!92212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18809 () Bool)

(declare-fun call!18810 () ListLongMap!2343)

(declare-fun c!33491 () Bool)

(declare-fun +!286 (ListLongMap!2343 tuple2!3434) ListLongMap!2343)

(assert (=> bm!18809 (= call!18812 (+!286 (ite c!33487 call!18810 (ite c!33491 call!18813 call!18811)) (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(declare-fun b!186653 () Bool)

(declare-fun e!122845 () ListLongMap!2343)

(assert (=> b!186653 (= e!122838 e!122845)))

(assert (=> b!186653 (= c!33491 (and (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!186654 () Bool)

(assert (=> b!186654 (= e!122845 call!18808)))

(declare-fun b!186655 () Bool)

(assert (=> b!186655 (= e!122840 (not call!18814))))

(declare-fun b!186656 () Bool)

(declare-fun c!33490 () Bool)

(assert (=> b!186656 (= c!33490 (and (not (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122833 () ListLongMap!2343)

(assert (=> b!186656 (= e!122845 e!122833)))

(declare-fun b!186657 () Bool)

(declare-fun res!88256 () Bool)

(assert (=> b!186657 (=> (not res!88256) (not e!122842))))

(declare-fun e!122835 () Bool)

(assert (=> b!186657 (= res!88256 e!122835)))

(declare-fun res!88251 () Bool)

(assert (=> b!186657 (=> res!88251 e!122835)))

(declare-fun e!122834 () Bool)

(assert (=> b!186657 (= res!88251 (not e!122834))))

(declare-fun res!88253 () Bool)

(assert (=> b!186657 (=> (not res!88253) (not e!122834))))

(assert (=> b!186657 (= res!88253 (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun b!186658 () Bool)

(assert (=> b!186658 (= e!122835 e!122843)))

(declare-fun res!88259 () Bool)

(assert (=> b!186658 (=> (not res!88259) (not e!122843))))

(assert (=> b!186658 (= res!88259 (contains!1291 lt!92212 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun b!186659 () Bool)

(assert (=> b!186659 (= e!122844 e!122836)))

(declare-fun res!88258 () Bool)

(assert (=> b!186659 (= res!88258 call!18809)))

(assert (=> b!186659 (=> (not res!88258) (not e!122836))))

(declare-fun b!186660 () Bool)

(assert (=> b!186660 (= e!122833 call!18811)))

(declare-fun b!186661 () Bool)

(declare-fun Unit!5600 () Unit!5593)

(assert (=> b!186661 (= e!122841 Unit!5600)))

(declare-fun b!186662 () Bool)

(assert (=> b!186662 (= e!122838 (+!286 call!18812 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))

(declare-fun bm!18810 () Bool)

(assert (=> bm!18810 (= call!18813 call!18810)))

(declare-fun b!186663 () Bool)

(assert (=> b!186663 (= e!122833 call!18808)))

(declare-fun b!186664 () Bool)

(assert (=> b!186664 (= e!122837 (= (apply!169 lt!92212 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3647 thiss!1248)))))

(declare-fun b!186665 () Bool)

(declare-fun lt!92213 () Unit!5593)

(assert (=> b!186665 (= e!122841 lt!92213)))

(declare-fun lt!92222 () ListLongMap!2343)

(declare-fun getCurrentListMapNoExtraKeys!190 (array!7931 array!7933 (_ BitVec 32) (_ BitVec 32) V!5473 V!5473 (_ BitVec 32) Int) ListLongMap!2343)

(assert (=> b!186665 (= lt!92222 (getCurrentListMapNoExtraKeys!190 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun lt!92206 () (_ BitVec 64))

(assert (=> b!186665 (= lt!92206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92220 () (_ BitVec 64))

(assert (=> b!186665 (= lt!92220 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92225 () Unit!5593)

(declare-fun addStillContains!145 (ListLongMap!2343 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5593)

(assert (=> b!186665 (= lt!92225 (addStillContains!145 lt!92222 lt!92206 (zeroValue!3647 thiss!1248) lt!92220))))

(assert (=> b!186665 (contains!1291 (+!286 lt!92222 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248))) lt!92220)))

(declare-fun lt!92216 () Unit!5593)

(assert (=> b!186665 (= lt!92216 lt!92225)))

(declare-fun lt!92214 () ListLongMap!2343)

(assert (=> b!186665 (= lt!92214 (getCurrentListMapNoExtraKeys!190 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun lt!92224 () (_ BitVec 64))

(assert (=> b!186665 (= lt!92224 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92227 () (_ BitVec 64))

(assert (=> b!186665 (= lt!92227 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92217 () Unit!5593)

(declare-fun addApplyDifferent!145 (ListLongMap!2343 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5593)

(assert (=> b!186665 (= lt!92217 (addApplyDifferent!145 lt!92214 lt!92224 (minValue!3647 thiss!1248) lt!92227))))

(assert (=> b!186665 (= (apply!169 (+!286 lt!92214 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248))) lt!92227) (apply!169 lt!92214 lt!92227))))

(declare-fun lt!92226 () Unit!5593)

(assert (=> b!186665 (= lt!92226 lt!92217)))

(declare-fun lt!92221 () ListLongMap!2343)

(assert (=> b!186665 (= lt!92221 (getCurrentListMapNoExtraKeys!190 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun lt!92211 () (_ BitVec 64))

(assert (=> b!186665 (= lt!92211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92215 () (_ BitVec 64))

(assert (=> b!186665 (= lt!92215 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92208 () Unit!5593)

(assert (=> b!186665 (= lt!92208 (addApplyDifferent!145 lt!92221 lt!92211 (zeroValue!3647 thiss!1248) lt!92215))))

(assert (=> b!186665 (= (apply!169 (+!286 lt!92221 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248))) lt!92215) (apply!169 lt!92221 lt!92215))))

(declare-fun lt!92207 () Unit!5593)

(assert (=> b!186665 (= lt!92207 lt!92208)))

(declare-fun lt!92209 () ListLongMap!2343)

(assert (=> b!186665 (= lt!92209 (getCurrentListMapNoExtraKeys!190 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(declare-fun lt!92219 () (_ BitVec 64))

(assert (=> b!186665 (= lt!92219 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92223 () (_ BitVec 64))

(assert (=> b!186665 (= lt!92223 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186665 (= lt!92213 (addApplyDifferent!145 lt!92209 lt!92219 (minValue!3647 thiss!1248) lt!92223))))

(assert (=> b!186665 (= (apply!169 (+!286 lt!92209 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248))) lt!92223) (apply!169 lt!92209 lt!92223))))

(declare-fun b!186666 () Bool)

(assert (=> b!186666 (= e!122834 (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18811 () Bool)

(assert (=> bm!18811 (= call!18810 (getCurrentListMapNoExtraKeys!190 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))

(assert (= (and d!55141 c!33487) b!186662))

(assert (= (and d!55141 (not c!33487)) b!186653))

(assert (= (and b!186653 c!33491) b!186654))

(assert (= (and b!186653 (not c!33491)) b!186656))

(assert (= (and b!186656 c!33490) b!186663))

(assert (= (and b!186656 (not c!33490)) b!186660))

(assert (= (or b!186663 b!186660) bm!18806))

(assert (= (or b!186654 bm!18806) bm!18810))

(assert (= (or b!186654 b!186663) bm!18807))

(assert (= (or b!186662 bm!18810) bm!18811))

(assert (= (or b!186662 bm!18807) bm!18809))

(assert (= (and d!55141 res!88254) b!186646))

(assert (= (and d!55141 c!33488) b!186665))

(assert (= (and d!55141 (not c!33488)) b!186661))

(assert (= (and d!55141 res!88255) b!186657))

(assert (= (and b!186657 res!88253) b!186666))

(assert (= (and b!186657 (not res!88251)) b!186658))

(assert (= (and b!186658 res!88259) b!186652))

(assert (= (and b!186657 res!88256) b!186650))

(assert (= (and b!186650 c!33489) b!186649))

(assert (= (and b!186650 (not c!33489)) b!186655))

(assert (= (and b!186649 res!88257) b!186664))

(assert (= (or b!186649 b!186655) bm!18808))

(assert (= (and b!186650 res!88252) b!186651))

(assert (= (and b!186651 c!33492) b!186659))

(assert (= (and b!186651 (not c!33492)) b!186647))

(assert (= (and b!186659 res!88258) b!186648))

(assert (= (or b!186659 b!186647) bm!18805))

(declare-fun b_lambda!7253 () Bool)

(assert (=> (not b_lambda!7253) (not b!186652)))

(declare-fun t!7245 () Bool)

(declare-fun tb!2841 () Bool)

(assert (=> (and b!186465 (= (defaultEntry!3806 thiss!1248) (defaultEntry!3806 thiss!1248)) t!7245) tb!2841))

(declare-fun result!4817 () Bool)

(assert (=> tb!2841 (= result!4817 tp_is_empty!4369)))

(assert (=> b!186652 t!7245))

(declare-fun b_and!11187 () Bool)

(assert (= b_and!11181 (and (=> t!7245 result!4817) b_and!11187)))

(assert (=> d!55141 m!212949))

(declare-fun m!213061 () Bool)

(assert (=> bm!18811 m!213061))

(declare-fun m!213063 () Bool)

(assert (=> b!186646 m!213063))

(assert (=> b!186646 m!213063))

(declare-fun m!213065 () Bool)

(assert (=> b!186646 m!213065))

(declare-fun m!213067 () Bool)

(assert (=> bm!18805 m!213067))

(declare-fun m!213069 () Bool)

(assert (=> b!186665 m!213069))

(declare-fun m!213071 () Bool)

(assert (=> b!186665 m!213071))

(declare-fun m!213073 () Bool)

(assert (=> b!186665 m!213073))

(declare-fun m!213075 () Bool)

(assert (=> b!186665 m!213075))

(declare-fun m!213077 () Bool)

(assert (=> b!186665 m!213077))

(declare-fun m!213079 () Bool)

(assert (=> b!186665 m!213079))

(declare-fun m!213081 () Bool)

(assert (=> b!186665 m!213081))

(declare-fun m!213083 () Bool)

(assert (=> b!186665 m!213083))

(assert (=> b!186665 m!213079))

(assert (=> b!186665 m!213063))

(declare-fun m!213085 () Bool)

(assert (=> b!186665 m!213085))

(declare-fun m!213087 () Bool)

(assert (=> b!186665 m!213087))

(declare-fun m!213089 () Bool)

(assert (=> b!186665 m!213089))

(assert (=> b!186665 m!213085))

(declare-fun m!213091 () Bool)

(assert (=> b!186665 m!213091))

(declare-fun m!213093 () Bool)

(assert (=> b!186665 m!213093))

(assert (=> b!186665 m!213061))

(assert (=> b!186665 m!213075))

(assert (=> b!186665 m!213083))

(declare-fun m!213095 () Bool)

(assert (=> b!186665 m!213095))

(declare-fun m!213097 () Bool)

(assert (=> b!186665 m!213097))

(assert (=> b!186658 m!213063))

(assert (=> b!186658 m!213063))

(declare-fun m!213099 () Bool)

(assert (=> b!186658 m!213099))

(declare-fun m!213101 () Bool)

(assert (=> b!186664 m!213101))

(declare-fun m!213103 () Bool)

(assert (=> b!186648 m!213103))

(assert (=> b!186666 m!213063))

(assert (=> b!186666 m!213063))

(assert (=> b!186666 m!213065))

(declare-fun m!213105 () Bool)

(assert (=> bm!18809 m!213105))

(declare-fun m!213107 () Bool)

(assert (=> bm!18808 m!213107))

(declare-fun m!213109 () Bool)

(assert (=> b!186652 m!213109))

(declare-fun m!213111 () Bool)

(assert (=> b!186652 m!213111))

(assert (=> b!186652 m!213111))

(assert (=> b!186652 m!213109))

(declare-fun m!213113 () Bool)

(assert (=> b!186652 m!213113))

(assert (=> b!186652 m!213063))

(declare-fun m!213115 () Bool)

(assert (=> b!186652 m!213115))

(assert (=> b!186652 m!213063))

(declare-fun m!213117 () Bool)

(assert (=> b!186662 m!213117))

(assert (=> b!186463 d!55141))

(declare-fun mapNonEmpty!7531 () Bool)

(declare-fun mapRes!7531 () Bool)

(declare-fun tp!16612 () Bool)

(declare-fun e!122850 () Bool)

(assert (=> mapNonEmpty!7531 (= mapRes!7531 (and tp!16612 e!122850))))

(declare-fun mapRest!7531 () (Array (_ BitVec 32) ValueCell!1841))

(declare-fun mapKey!7531 () (_ BitVec 32))

(declare-fun mapValue!7531 () ValueCell!1841)

(assert (=> mapNonEmpty!7531 (= mapRest!7522 (store mapRest!7531 mapKey!7531 mapValue!7531))))

(declare-fun mapIsEmpty!7531 () Bool)

(assert (=> mapIsEmpty!7531 mapRes!7531))

(declare-fun b!186676 () Bool)

(declare-fun e!122851 () Bool)

(assert (=> b!186676 (= e!122851 tp_is_empty!4369)))

(declare-fun condMapEmpty!7531 () Bool)

(declare-fun mapDefault!7531 () ValueCell!1841)

(assert (=> mapNonEmpty!7522 (= condMapEmpty!7531 (= mapRest!7522 ((as const (Array (_ BitVec 32) ValueCell!1841)) mapDefault!7531)))))

(assert (=> mapNonEmpty!7522 (= tp!16596 (and e!122851 mapRes!7531))))

(declare-fun b!186675 () Bool)

(assert (=> b!186675 (= e!122850 tp_is_empty!4369)))

(assert (= (and mapNonEmpty!7522 condMapEmpty!7531) mapIsEmpty!7531))

(assert (= (and mapNonEmpty!7522 (not condMapEmpty!7531)) mapNonEmpty!7531))

(assert (= (and mapNonEmpty!7531 ((_ is ValueCellFull!1841) mapValue!7531)) b!186675))

(assert (= (and mapNonEmpty!7522 ((_ is ValueCellFull!1841) mapDefault!7531)) b!186676))

(declare-fun m!213119 () Bool)

(assert (=> mapNonEmpty!7531 m!213119))

(declare-fun b_lambda!7255 () Bool)

(assert (= b_lambda!7253 (or (and b!186465 b_free!4597) b_lambda!7255)))

(check-sat (not d!55139) (not b!186646) (not b!186584) (not d!55123) (not b!186603) (not b!186666) (not bm!18805) (not b_lambda!7255) (not b!186664) (not b!186662) (not b!186552) (not bm!18809) (not b!186652) (not b!186665) b_and!11187 (not bm!18808) (not b!186648) (not b!186658) (not d!55135) (not d!55131) (not bm!18789) (not bm!18790) (not b!186594) (not b!186593) (not b!186592) (not mapNonEmpty!7531) tp_is_empty!4369 (not b!186601) (not d!55125) (not d!55141) (not b_next!4597) (not bm!18811))
(check-sat b_and!11187 (not b_next!4597))
(get-model)

(declare-fun d!55143 () Bool)

(assert (=> d!55143 (= (inRange!0 (ite c!33471 (index!4754 lt!92142) (index!4757 lt!92142)) (mask!8936 thiss!1248)) (and (bvsge (ite c!33471 (index!4754 lt!92142) (index!4757 lt!92142)) #b00000000000000000000000000000000) (bvslt (ite c!33471 (index!4754 lt!92142) (index!4757 lt!92142)) (bvadd (mask!8936 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18790 d!55143))

(declare-fun d!55145 () Bool)

(declare-fun res!88264 () Bool)

(declare-fun e!122856 () Bool)

(assert (=> d!55145 (=> res!88264 e!122856)))

(assert (=> d!55145 (= res!88264 (and ((_ is Cons!2360) (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) (= (_1!1728 (h!2994 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828)))))

(assert (=> d!55145 (= (containsKey!228 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828) e!122856)))

(declare-fun b!186681 () Bool)

(declare-fun e!122857 () Bool)

(assert (=> b!186681 (= e!122856 e!122857)))

(declare-fun res!88265 () Bool)

(assert (=> b!186681 (=> (not res!88265) (not e!122857))))

(assert (=> b!186681 (= res!88265 (and (or (not ((_ is Cons!2360) (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) (bvsle (_1!1728 (h!2994 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828)) ((_ is Cons!2360) (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) (bvslt (_1!1728 (h!2994 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828)))))

(declare-fun b!186682 () Bool)

(assert (=> b!186682 (= e!122857 (containsKey!228 (t!7243 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) key!828))))

(assert (= (and d!55145 (not res!88264)) b!186681))

(assert (= (and b!186681 res!88265) b!186682))

(declare-fun m!213121 () Bool)

(assert (=> b!186682 m!213121))

(assert (=> d!55139 d!55145))

(declare-fun b!186701 () Bool)

(declare-fun e!122871 () Bool)

(declare-fun e!122872 () Bool)

(assert (=> b!186701 (= e!122871 e!122872)))

(declare-fun res!88273 () Bool)

(declare-fun lt!92233 () SeekEntryResult!646)

(assert (=> b!186701 (= res!88273 (and ((_ is Intermediate!646) lt!92233) (not (undefined!1458 lt!92233)) (bvslt (x!20235 lt!92233) #b01111111111111111111111111111110) (bvsge (x!20235 lt!92233) #b00000000000000000000000000000000) (bvsge (x!20235 lt!92233) #b00000000000000000000000000000000)))))

(assert (=> b!186701 (=> (not res!88273) (not e!122872))))

(declare-fun b!186702 () Bool)

(assert (=> b!186702 (and (bvsge (index!4756 lt!92233) #b00000000000000000000000000000000) (bvslt (index!4756 lt!92233) (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun e!122869 () Bool)

(assert (=> b!186702 (= e!122869 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4756 lt!92233)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186703 () Bool)

(declare-fun e!122870 () SeekEntryResult!646)

(assert (=> b!186703 (= e!122870 (Intermediate!646 false (toIndex!0 key!828 (mask!8936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186704 () Bool)

(assert (=> b!186704 (and (bvsge (index!4756 lt!92233) #b00000000000000000000000000000000) (bvslt (index!4756 lt!92233) (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun res!88272 () Bool)

(assert (=> b!186704 (= res!88272 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4756 lt!92233)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186704 (=> res!88272 e!122869)))

(declare-fun b!186705 () Bool)

(declare-fun e!122868 () SeekEntryResult!646)

(assert (=> b!186705 (= e!122868 (Intermediate!646 true (toIndex!0 key!828 (mask!8936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!186706 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!186706 (= e!122870 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8936 thiss!1248)) #b00000000000000000000000000000000 (mask!8936 thiss!1248)) key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(declare-fun b!186707 () Bool)

(assert (=> b!186707 (= e!122868 e!122870)))

(declare-fun c!33500 () Bool)

(declare-fun lt!92232 () (_ BitVec 64))

(assert (=> b!186707 (= c!33500 (or (= lt!92232 key!828) (= (bvadd lt!92232 lt!92232) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!55147 () Bool)

(assert (=> d!55147 e!122871))

(declare-fun c!33499 () Bool)

(assert (=> d!55147 (= c!33499 (and ((_ is Intermediate!646) lt!92233) (undefined!1458 lt!92233)))))

(assert (=> d!55147 (= lt!92233 e!122868)))

(declare-fun c!33501 () Bool)

(assert (=> d!55147 (= c!33501 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!55147 (= lt!92232 (select (arr!3742 (_keys!5751 thiss!1248)) (toIndex!0 key!828 (mask!8936 thiss!1248))))))

(assert (=> d!55147 (validMask!0 (mask!8936 thiss!1248))))

(assert (=> d!55147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8936 thiss!1248)) key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)) lt!92233)))

(declare-fun b!186708 () Bool)

(assert (=> b!186708 (= e!122871 (bvsge (x!20235 lt!92233) #b01111111111111111111111111111110))))

(declare-fun b!186709 () Bool)

(assert (=> b!186709 (and (bvsge (index!4756 lt!92233) #b00000000000000000000000000000000) (bvslt (index!4756 lt!92233) (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun res!88274 () Bool)

(assert (=> b!186709 (= res!88274 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4756 lt!92233)) key!828))))

(assert (=> b!186709 (=> res!88274 e!122869)))

(assert (=> b!186709 (= e!122872 e!122869)))

(assert (= (and d!55147 c!33501) b!186705))

(assert (= (and d!55147 (not c!33501)) b!186707))

(assert (= (and b!186707 c!33500) b!186703))

(assert (= (and b!186707 (not c!33500)) b!186706))

(assert (= (and d!55147 c!33499) b!186708))

(assert (= (and d!55147 (not c!33499)) b!186701))

(assert (= (and b!186701 res!88273) b!186709))

(assert (= (and b!186709 (not res!88274)) b!186704))

(assert (= (and b!186704 (not res!88272)) b!186702))

(assert (=> b!186706 m!213021))

(declare-fun m!213123 () Bool)

(assert (=> b!186706 m!213123))

(assert (=> b!186706 m!213123))

(declare-fun m!213125 () Bool)

(assert (=> b!186706 m!213125))

(declare-fun m!213127 () Bool)

(assert (=> b!186709 m!213127))

(assert (=> b!186704 m!213127))

(assert (=> b!186702 m!213127))

(assert (=> d!55147 m!213021))

(declare-fun m!213129 () Bool)

(assert (=> d!55147 m!213129))

(assert (=> d!55147 m!212949))

(assert (=> d!55123 d!55147))

(declare-fun d!55149 () Bool)

(declare-fun lt!92239 () (_ BitVec 32))

(declare-fun lt!92238 () (_ BitVec 32))

(assert (=> d!55149 (= lt!92239 (bvmul (bvxor lt!92238 (bvlshr lt!92238 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55149 (= lt!92238 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55149 (and (bvsge (mask!8936 thiss!1248) #b00000000000000000000000000000000) (let ((res!88275 (let ((h!2996 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20252 (bvmul (bvxor h!2996 (bvlshr h!2996 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20252 (bvlshr x!20252 #b00000000000000000000000000001101)) (mask!8936 thiss!1248)))))) (and (bvslt res!88275 (bvadd (mask!8936 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88275 #b00000000000000000000000000000000))))))

(assert (=> d!55149 (= (toIndex!0 key!828 (mask!8936 thiss!1248)) (bvand (bvxor lt!92239 (bvlshr lt!92239 #b00000000000000000000000000001101)) (mask!8936 thiss!1248)))))

(assert (=> d!55123 d!55149))

(assert (=> d!55123 d!55137))

(declare-fun d!55151 () Bool)

(declare-fun e!122875 () Bool)

(assert (=> d!55151 e!122875))

(declare-fun res!88280 () Bool)

(assert (=> d!55151 (=> (not res!88280) (not e!122875))))

(declare-fun lt!92250 () ListLongMap!2343)

(assert (=> d!55151 (= res!88280 (contains!1291 lt!92250 (_1!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(declare-fun lt!92249 () List!2364)

(assert (=> d!55151 (= lt!92250 (ListLongMap!2344 lt!92249))))

(declare-fun lt!92251 () Unit!5593)

(declare-fun lt!92248 () Unit!5593)

(assert (=> d!55151 (= lt!92251 lt!92248)))

(assert (=> d!55151 (= (getValueByKey!224 lt!92249 (_1!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))) (Some!229 (_2!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!119 (List!2364 (_ BitVec 64) V!5473) Unit!5593)

(assert (=> d!55151 (= lt!92248 (lemmaContainsTupThenGetReturnValue!119 lt!92249 (_1!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) (_2!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(declare-fun insertStrictlySorted!122 (List!2364 (_ BitVec 64) V!5473) List!2364)

(assert (=> d!55151 (= lt!92249 (insertStrictlySorted!122 (toList!1187 (ite c!33487 call!18810 (ite c!33491 call!18813 call!18811))) (_1!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) (_2!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(assert (=> d!55151 (= (+!286 (ite c!33487 call!18810 (ite c!33491 call!18813 call!18811)) (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) lt!92250)))

(declare-fun b!186714 () Bool)

(declare-fun res!88281 () Bool)

(assert (=> b!186714 (=> (not res!88281) (not e!122875))))

(assert (=> b!186714 (= res!88281 (= (getValueByKey!224 (toList!1187 lt!92250) (_1!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))) (Some!229 (_2!1728 (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))))

(declare-fun b!186715 () Bool)

(declare-fun contains!1292 (List!2364 tuple2!3434) Bool)

(assert (=> b!186715 (= e!122875 (contains!1292 (toList!1187 lt!92250) (ite (or c!33487 c!33491) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3647 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(assert (= (and d!55151 res!88280) b!186714))

(assert (= (and b!186714 res!88281) b!186715))

(declare-fun m!213131 () Bool)

(assert (=> d!55151 m!213131))

(declare-fun m!213133 () Bool)

(assert (=> d!55151 m!213133))

(declare-fun m!213135 () Bool)

(assert (=> d!55151 m!213135))

(declare-fun m!213137 () Bool)

(assert (=> d!55151 m!213137))

(declare-fun m!213139 () Bool)

(assert (=> b!186714 m!213139))

(declare-fun m!213141 () Bool)

(assert (=> b!186715 m!213141))

(assert (=> bm!18809 d!55151))

(declare-fun d!55153 () Bool)

(declare-fun e!122877 () Bool)

(assert (=> d!55153 e!122877))

(declare-fun res!88282 () Bool)

(assert (=> d!55153 (=> res!88282 e!122877)))

(declare-fun lt!92254 () Bool)

(assert (=> d!55153 (= res!88282 (not lt!92254))))

(declare-fun lt!92253 () Bool)

(assert (=> d!55153 (= lt!92254 lt!92253)))

(declare-fun lt!92255 () Unit!5593)

(declare-fun e!122876 () Unit!5593)

(assert (=> d!55153 (= lt!92255 e!122876)))

(declare-fun c!33502 () Bool)

(assert (=> d!55153 (= c!33502 lt!92253)))

(assert (=> d!55153 (= lt!92253 (containsKey!228 (toList!1187 lt!92212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55153 (= (contains!1291 lt!92212 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92254)))

(declare-fun b!186716 () Bool)

(declare-fun lt!92252 () Unit!5593)

(assert (=> b!186716 (= e!122876 lt!92252)))

(assert (=> b!186716 (= lt!92252 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1187 lt!92212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186716 (isDefined!178 (getValueByKey!224 (toList!1187 lt!92212) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186717 () Bool)

(declare-fun Unit!5601 () Unit!5593)

(assert (=> b!186717 (= e!122876 Unit!5601)))

(declare-fun b!186718 () Bool)

(assert (=> b!186718 (= e!122877 (isDefined!178 (getValueByKey!224 (toList!1187 lt!92212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55153 c!33502) b!186716))

(assert (= (and d!55153 (not c!33502)) b!186717))

(assert (= (and d!55153 (not res!88282)) b!186718))

(declare-fun m!213143 () Bool)

(assert (=> d!55153 m!213143))

(declare-fun m!213145 () Bool)

(assert (=> b!186716 m!213145))

(declare-fun m!213147 () Bool)

(assert (=> b!186716 m!213147))

(assert (=> b!186716 m!213147))

(declare-fun m!213149 () Bool)

(assert (=> b!186716 m!213149))

(assert (=> b!186718 m!213147))

(assert (=> b!186718 m!213147))

(assert (=> b!186718 m!213149))

(assert (=> bm!18808 d!55153))

(declare-fun d!55155 () Bool)

(declare-fun res!88287 () Bool)

(declare-fun e!122882 () Bool)

(assert (=> d!55155 (=> res!88287 e!122882)))

(assert (=> d!55155 (= res!88287 (= (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55155 (= (arrayContainsKey!0 (_keys!5751 thiss!1248) key!828 #b00000000000000000000000000000000) e!122882)))

(declare-fun b!186723 () Bool)

(declare-fun e!122883 () Bool)

(assert (=> b!186723 (= e!122882 e!122883)))

(declare-fun res!88288 () Bool)

(assert (=> b!186723 (=> (not res!88288) (not e!122883))))

(assert (=> b!186723 (= res!88288 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun b!186724 () Bool)

(assert (=> b!186724 (= e!122883 (arrayContainsKey!0 (_keys!5751 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55155 (not res!88287)) b!186723))

(assert (= (and b!186723 res!88288) b!186724))

(assert (=> d!55155 m!213063))

(declare-fun m!213151 () Bool)

(assert (=> b!186724 m!213151))

(assert (=> bm!18789 d!55155))

(declare-fun b!186733 () Bool)

(declare-fun e!122890 () Bool)

(declare-fun call!18817 () Bool)

(assert (=> b!186733 (= e!122890 call!18817)))

(declare-fun d!55157 () Bool)

(declare-fun res!88294 () Bool)

(declare-fun e!122891 () Bool)

(assert (=> d!55157 (=> res!88294 e!122891)))

(assert (=> d!55157 (= res!88294 (bvsge #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(assert (=> d!55157 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)) e!122891)))

(declare-fun bm!18814 () Bool)

(assert (=> bm!18814 (= call!18817 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(declare-fun b!186734 () Bool)

(declare-fun e!122892 () Bool)

(assert (=> b!186734 (= e!122892 e!122890)))

(declare-fun lt!92263 () (_ BitVec 64))

(assert (=> b!186734 (= lt!92263 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92262 () Unit!5593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7931 (_ BitVec 64) (_ BitVec 32)) Unit!5593)

(assert (=> b!186734 (= lt!92262 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5751 thiss!1248) lt!92263 #b00000000000000000000000000000000))))

(assert (=> b!186734 (arrayContainsKey!0 (_keys!5751 thiss!1248) lt!92263 #b00000000000000000000000000000000)))

(declare-fun lt!92264 () Unit!5593)

(assert (=> b!186734 (= lt!92264 lt!92262)))

(declare-fun res!88293 () Bool)

(assert (=> b!186734 (= res!88293 (= (seekEntryOrOpen!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000) (_keys!5751 thiss!1248) (mask!8936 thiss!1248)) (Found!646 #b00000000000000000000000000000000)))))

(assert (=> b!186734 (=> (not res!88293) (not e!122890))))

(declare-fun b!186735 () Bool)

(assert (=> b!186735 (= e!122892 call!18817)))

(declare-fun b!186736 () Bool)

(assert (=> b!186736 (= e!122891 e!122892)))

(declare-fun c!33505 () Bool)

(assert (=> b!186736 (= c!33505 (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55157 (not res!88294)) b!186736))

(assert (= (and b!186736 c!33505) b!186734))

(assert (= (and b!186736 (not c!33505)) b!186735))

(assert (= (and b!186734 res!88293) b!186733))

(assert (= (or b!186733 b!186735) bm!18814))

(declare-fun m!213153 () Bool)

(assert (=> bm!18814 m!213153))

(assert (=> b!186734 m!213063))

(declare-fun m!213155 () Bool)

(assert (=> b!186734 m!213155))

(declare-fun m!213157 () Bool)

(assert (=> b!186734 m!213157))

(assert (=> b!186734 m!213063))

(declare-fun m!213159 () Bool)

(assert (=> b!186734 m!213159))

(assert (=> b!186736 m!213063))

(assert (=> b!186736 m!213063))

(assert (=> b!186736 m!213065))

(assert (=> b!186593 d!55157))

(assert (=> d!55141 d!55137))

(declare-fun b!186745 () Bool)

(declare-fun e!122897 () (_ BitVec 32))

(assert (=> b!186745 (= e!122897 #b00000000000000000000000000000000)))

(declare-fun b!186746 () Bool)

(declare-fun e!122898 () (_ BitVec 32))

(assert (=> b!186746 (= e!122897 e!122898)))

(declare-fun c!33511 () Bool)

(assert (=> b!186746 (= c!33511 (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186747 () Bool)

(declare-fun call!18820 () (_ BitVec 32))

(assert (=> b!186747 (= e!122898 (bvadd #b00000000000000000000000000000001 call!18820))))

(declare-fun b!186748 () Bool)

(assert (=> b!186748 (= e!122898 call!18820)))

(declare-fun d!55159 () Bool)

(declare-fun lt!92267 () (_ BitVec 32))

(assert (=> d!55159 (and (bvsge lt!92267 #b00000000000000000000000000000000) (bvsle lt!92267 (bvsub (size!4060 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55159 (= lt!92267 e!122897)))

(declare-fun c!33510 () Bool)

(assert (=> d!55159 (= c!33510 (bvsge #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(assert (=> d!55159 (and (bvsle #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4060 (_keys!5751 thiss!1248)) (size!4060 (_keys!5751 thiss!1248))))))

(assert (=> d!55159 (= (arrayCountValidKeys!0 (_keys!5751 thiss!1248) #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))) lt!92267)))

(declare-fun bm!18817 () Bool)

(assert (=> bm!18817 (= call!18820 (arrayCountValidKeys!0 (_keys!5751 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4060 (_keys!5751 thiss!1248))))))

(assert (= (and d!55159 c!33510) b!186745))

(assert (= (and d!55159 (not c!33510)) b!186746))

(assert (= (and b!186746 c!33511) b!186747))

(assert (= (and b!186746 (not c!33511)) b!186748))

(assert (= (or b!186747 b!186748) bm!18817))

(assert (=> b!186746 m!213063))

(assert (=> b!186746 m!213063))

(assert (=> b!186746 m!213065))

(declare-fun m!213161 () Bool)

(assert (=> bm!18817 m!213161))

(assert (=> b!186592 d!55159))

(assert (=> d!55125 d!55123))

(declare-fun b!186765 () Bool)

(declare-fun e!122910 () Bool)

(declare-fun call!18825 () Bool)

(assert (=> b!186765 (= e!122910 (not call!18825))))

(declare-fun b!186766 () Bool)

(declare-fun e!122909 () Bool)

(declare-fun e!122908 () Bool)

(assert (=> b!186766 (= e!122909 e!122908)))

(declare-fun res!88306 () Bool)

(declare-fun call!18826 () Bool)

(assert (=> b!186766 (= res!88306 call!18826)))

(assert (=> b!186766 (=> (not res!88306) (not e!122908))))

(declare-fun bm!18822 () Bool)

(assert (=> bm!18822 (= call!18825 (arrayContainsKey!0 (_keys!5751 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!186767 () Bool)

(declare-fun res!88305 () Bool)

(declare-fun lt!92270 () SeekEntryResult!646)

(assert (=> b!186767 (= res!88305 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4754 lt!92270)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186767 (=> (not res!88305) (not e!122908))))

(declare-fun c!33516 () Bool)

(declare-fun bm!18823 () Bool)

(assert (=> bm!18823 (= call!18826 (inRange!0 (ite c!33516 (index!4754 lt!92270) (index!4757 lt!92270)) (mask!8936 thiss!1248)))))

(declare-fun b!186768 () Bool)

(declare-fun res!88303 () Bool)

(assert (=> b!186768 (=> (not res!88303) (not e!122910))))

(assert (=> b!186768 (= res!88303 call!18826)))

(declare-fun e!122907 () Bool)

(assert (=> b!186768 (= e!122907 e!122910)))

(declare-fun b!186769 () Bool)

(assert (=> b!186769 (= e!122908 (not call!18825))))

(declare-fun b!186770 () Bool)

(declare-fun res!88304 () Bool)

(assert (=> b!186770 (=> (not res!88304) (not e!122910))))

(assert (=> b!186770 (= res!88304 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4757 lt!92270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186771 () Bool)

(assert (=> b!186771 (= e!122907 ((_ is Undefined!646) lt!92270))))

(declare-fun d!55161 () Bool)

(assert (=> d!55161 e!122909))

(assert (=> d!55161 (= c!33516 ((_ is MissingZero!646) lt!92270))))

(assert (=> d!55161 (= lt!92270 (seekEntryOrOpen!0 key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(assert (=> d!55161 true))

(declare-fun _$34!1066 () Unit!5593)

(assert (=> d!55161 (= (choose!996 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)) _$34!1066)))

(declare-fun b!186772 () Bool)

(assert (=> b!186772 (= e!122909 e!122907)))

(declare-fun c!33517 () Bool)

(assert (=> b!186772 (= c!33517 ((_ is MissingVacant!646) lt!92270))))

(assert (= (and d!55161 c!33516) b!186766))

(assert (= (and d!55161 (not c!33516)) b!186772))

(assert (= (and b!186766 res!88306) b!186767))

(assert (= (and b!186767 res!88305) b!186769))

(assert (= (and b!186772 c!33517) b!186768))

(assert (= (and b!186772 (not c!33517)) b!186771))

(assert (= (and b!186768 res!88303) b!186770))

(assert (= (and b!186770 res!88304) b!186765))

(assert (= (or b!186766 b!186768) bm!18823))

(assert (= (or b!186769 b!186765) bm!18822))

(assert (=> bm!18822 m!213035))

(declare-fun m!213163 () Bool)

(assert (=> bm!18823 m!213163))

(assert (=> d!55161 m!212963))

(declare-fun m!213165 () Bool)

(assert (=> b!186770 m!213165))

(declare-fun m!213167 () Bool)

(assert (=> b!186767 m!213167))

(assert (=> d!55125 d!55161))

(assert (=> d!55125 d!55137))

(declare-fun b!186784 () Bool)

(declare-fun e!122913 () Bool)

(assert (=> b!186784 (= e!122913 (and (bvsge (extraKeys!3543 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3543 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1344 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!55163 () Bool)

(declare-fun res!88315 () Bool)

(assert (=> d!55163 (=> (not res!88315) (not e!122913))))

(assert (=> d!55163 (= res!88315 (validMask!0 (mask!8936 thiss!1248)))))

(assert (=> d!55163 (= (simpleValid!185 thiss!1248) e!122913)))

(declare-fun b!186782 () Bool)

(declare-fun res!88318 () Bool)

(assert (=> b!186782 (=> (not res!88318) (not e!122913))))

(declare-fun size!4066 (LongMapFixedSize!2590) (_ BitVec 32))

(assert (=> b!186782 (= res!88318 (bvsge (size!4066 thiss!1248) (_size!1344 thiss!1248)))))

(declare-fun b!186783 () Bool)

(declare-fun res!88317 () Bool)

(assert (=> b!186783 (=> (not res!88317) (not e!122913))))

(assert (=> b!186783 (= res!88317 (= (size!4066 thiss!1248) (bvadd (_size!1344 thiss!1248) (bvsdiv (bvadd (extraKeys!3543 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!186781 () Bool)

(declare-fun res!88316 () Bool)

(assert (=> b!186781 (=> (not res!88316) (not e!122913))))

(assert (=> b!186781 (= res!88316 (and (= (size!4061 (_values!3789 thiss!1248)) (bvadd (mask!8936 thiss!1248) #b00000000000000000000000000000001)) (= (size!4060 (_keys!5751 thiss!1248)) (size!4061 (_values!3789 thiss!1248))) (bvsge (_size!1344 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1344 thiss!1248) (bvadd (mask!8936 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!55163 res!88315) b!186781))

(assert (= (and b!186781 res!88316) b!186782))

(assert (= (and b!186782 res!88318) b!186783))

(assert (= (and b!186783 res!88317) b!186784))

(assert (=> d!55163 m!212949))

(declare-fun m!213169 () Bool)

(assert (=> b!186782 m!213169))

(assert (=> b!186783 m!213169))

(assert (=> d!55135 d!55163))

(declare-fun d!55165 () Bool)

(declare-fun e!122915 () Bool)

(assert (=> d!55165 e!122915))

(declare-fun res!88319 () Bool)

(assert (=> d!55165 (=> res!88319 e!122915)))

(declare-fun lt!92273 () Bool)

(assert (=> d!55165 (= res!88319 (not lt!92273))))

(declare-fun lt!92272 () Bool)

(assert (=> d!55165 (= lt!92273 lt!92272)))

(declare-fun lt!92274 () Unit!5593)

(declare-fun e!122914 () Unit!5593)

(assert (=> d!55165 (= lt!92274 e!122914)))

(declare-fun c!33518 () Bool)

(assert (=> d!55165 (= c!33518 lt!92272)))

(assert (=> d!55165 (= lt!92272 (containsKey!228 (toList!1187 lt!92212) (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55165 (= (contains!1291 lt!92212 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)) lt!92273)))

(declare-fun b!186785 () Bool)

(declare-fun lt!92271 () Unit!5593)

(assert (=> b!186785 (= e!122914 lt!92271)))

(assert (=> b!186785 (= lt!92271 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1187 lt!92212) (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186785 (isDefined!178 (getValueByKey!224 (toList!1187 lt!92212) (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186786 () Bool)

(declare-fun Unit!5602 () Unit!5593)

(assert (=> b!186786 (= e!122914 Unit!5602)))

(declare-fun b!186787 () Bool)

(assert (=> b!186787 (= e!122915 (isDefined!178 (getValueByKey!224 (toList!1187 lt!92212) (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55165 c!33518) b!186785))

(assert (= (and d!55165 (not c!33518)) b!186786))

(assert (= (and d!55165 (not res!88319)) b!186787))

(assert (=> d!55165 m!213063))

(declare-fun m!213171 () Bool)

(assert (=> d!55165 m!213171))

(assert (=> b!186785 m!213063))

(declare-fun m!213173 () Bool)

(assert (=> b!186785 m!213173))

(assert (=> b!186785 m!213063))

(declare-fun m!213175 () Bool)

(assert (=> b!186785 m!213175))

(assert (=> b!186785 m!213175))

(declare-fun m!213177 () Bool)

(assert (=> b!186785 m!213177))

(assert (=> b!186787 m!213063))

(assert (=> b!186787 m!213175))

(assert (=> b!186787 m!213175))

(assert (=> b!186787 m!213177))

(assert (=> b!186658 d!55165))

(assert (=> d!55131 d!55123))

(declare-fun d!55167 () Bool)

(declare-fun e!122918 () Bool)

(assert (=> d!55167 e!122918))

(declare-fun res!88325 () Bool)

(assert (=> d!55167 (=> (not res!88325) (not e!122918))))

(declare-fun lt!92277 () SeekEntryResult!646)

(assert (=> d!55167 (= res!88325 ((_ is Found!646) lt!92277))))

(assert (=> d!55167 (= lt!92277 (seekEntryOrOpen!0 key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(assert (=> d!55167 true))

(declare-fun _$33!129 () Unit!5593)

(assert (=> d!55167 (= (choose!997 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) key!828 (defaultEntry!3806 thiss!1248)) _$33!129)))

(declare-fun b!186792 () Bool)

(declare-fun res!88324 () Bool)

(assert (=> b!186792 (=> (not res!88324) (not e!122918))))

(assert (=> b!186792 (= res!88324 (inRange!0 (index!4755 lt!92277) (mask!8936 thiss!1248)))))

(declare-fun b!186793 () Bool)

(assert (=> b!186793 (= e!122918 (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4755 lt!92277)) key!828))))

(assert (= (and d!55167 res!88325) b!186792))

(assert (= (and b!186792 res!88324) b!186793))

(assert (=> d!55167 m!212963))

(declare-fun m!213179 () Bool)

(assert (=> b!186792 m!213179))

(declare-fun m!213181 () Bool)

(assert (=> b!186793 m!213181))

(assert (=> d!55131 d!55167))

(assert (=> d!55131 d!55137))

(declare-fun d!55169 () Bool)

(declare-fun get!2152 (Option!230) V!5473)

(assert (=> d!55169 (= (apply!169 lt!92214 lt!92227) (get!2152 (getValueByKey!224 (toList!1187 lt!92214) lt!92227)))))

(declare-fun bs!7520 () Bool)

(assert (= bs!7520 d!55169))

(declare-fun m!213183 () Bool)

(assert (=> bs!7520 m!213183))

(assert (=> bs!7520 m!213183))

(declare-fun m!213185 () Bool)

(assert (=> bs!7520 m!213185))

(assert (=> b!186665 d!55169))

(declare-fun b!186818 () Bool)

(declare-fun e!122938 () ListLongMap!2343)

(declare-fun e!122939 () ListLongMap!2343)

(assert (=> b!186818 (= e!122938 e!122939)))

(declare-fun c!33530 () Bool)

(assert (=> b!186818 (= c!33530 (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186819 () Bool)

(declare-fun lt!92293 () Unit!5593)

(declare-fun lt!92294 () Unit!5593)

(assert (=> b!186819 (= lt!92293 lt!92294)))

(declare-fun lt!92298 () ListLongMap!2343)

(declare-fun lt!92292 () (_ BitVec 64))

(declare-fun lt!92296 () (_ BitVec 64))

(declare-fun lt!92295 () V!5473)

(assert (=> b!186819 (not (contains!1291 (+!286 lt!92298 (tuple2!3435 lt!92296 lt!92295)) lt!92292))))

(declare-fun addStillNotContains!91 (ListLongMap!2343 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5593)

(assert (=> b!186819 (= lt!92294 (addStillNotContains!91 lt!92298 lt!92296 lt!92295 lt!92292))))

(assert (=> b!186819 (= lt!92292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!186819 (= lt!92295 (get!2151 (select (arr!3743 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186819 (= lt!92296 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18829 () ListLongMap!2343)

(assert (=> b!186819 (= lt!92298 call!18829)))

(assert (=> b!186819 (= e!122939 (+!286 call!18829 (tuple2!3435 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000) (get!2151 (select (arr!3743 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!186820 () Bool)

(declare-fun e!122935 () Bool)

(declare-fun e!122934 () Bool)

(assert (=> b!186820 (= e!122935 e!122934)))

(declare-fun c!33527 () Bool)

(declare-fun e!122937 () Bool)

(assert (=> b!186820 (= c!33527 e!122937)))

(declare-fun res!88335 () Bool)

(assert (=> b!186820 (=> (not res!88335) (not e!122937))))

(assert (=> b!186820 (= res!88335 (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun b!186822 () Bool)

(declare-fun res!88336 () Bool)

(assert (=> b!186822 (=> (not res!88336) (not e!122935))))

(declare-fun lt!92297 () ListLongMap!2343)

(assert (=> b!186822 (= res!88336 (not (contains!1291 lt!92297 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186823 () Bool)

(declare-fun e!122933 () Bool)

(assert (=> b!186823 (= e!122934 e!122933)))

(assert (=> b!186823 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun res!88334 () Bool)

(assert (=> b!186823 (= res!88334 (contains!1291 lt!92297 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186823 (=> (not res!88334) (not e!122933))))

(declare-fun bm!18826 () Bool)

(assert (=> bm!18826 (= call!18829 (getCurrentListMapNoExtraKeys!190 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3806 thiss!1248)))))

(declare-fun b!186824 () Bool)

(declare-fun e!122936 () Bool)

(assert (=> b!186824 (= e!122934 e!122936)))

(declare-fun c!33528 () Bool)

(assert (=> b!186824 (= c!33528 (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(declare-fun b!186825 () Bool)

(assert (=> b!186825 (= e!122939 call!18829)))

(declare-fun b!186826 () Bool)

(assert (=> b!186826 (= e!122938 (ListLongMap!2344 Nil!2361))))

(declare-fun b!186827 () Bool)

(assert (=> b!186827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(assert (=> b!186827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4061 (_values!3789 thiss!1248))))))

(assert (=> b!186827 (= e!122933 (= (apply!169 lt!92297 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)) (get!2151 (select (arr!3743 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!186821 () Bool)

(declare-fun isEmpty!477 (ListLongMap!2343) Bool)

(assert (=> b!186821 (= e!122936 (isEmpty!477 lt!92297))))

(declare-fun d!55171 () Bool)

(assert (=> d!55171 e!122935))

(declare-fun res!88337 () Bool)

(assert (=> d!55171 (=> (not res!88337) (not e!122935))))

(assert (=> d!55171 (= res!88337 (not (contains!1291 lt!92297 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55171 (= lt!92297 e!122938)))

(declare-fun c!33529 () Bool)

(assert (=> d!55171 (= c!33529 (bvsge #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(assert (=> d!55171 (validMask!0 (mask!8936 thiss!1248))))

(assert (=> d!55171 (= (getCurrentListMapNoExtraKeys!190 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)) lt!92297)))

(declare-fun b!186828 () Bool)

(assert (=> b!186828 (= e!122937 (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!186828 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!186829 () Bool)

(assert (=> b!186829 (= e!122936 (= lt!92297 (getCurrentListMapNoExtraKeys!190 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3806 thiss!1248))))))

(assert (= (and d!55171 c!33529) b!186826))

(assert (= (and d!55171 (not c!33529)) b!186818))

(assert (= (and b!186818 c!33530) b!186819))

(assert (= (and b!186818 (not c!33530)) b!186825))

(assert (= (or b!186819 b!186825) bm!18826))

(assert (= (and d!55171 res!88337) b!186822))

(assert (= (and b!186822 res!88336) b!186820))

(assert (= (and b!186820 res!88335) b!186828))

(assert (= (and b!186820 c!33527) b!186823))

(assert (= (and b!186820 (not c!33527)) b!186824))

(assert (= (and b!186823 res!88334) b!186827))

(assert (= (and b!186824 c!33528) b!186829))

(assert (= (and b!186824 (not c!33528)) b!186821))

(declare-fun b_lambda!7257 () Bool)

(assert (=> (not b_lambda!7257) (not b!186819)))

(assert (=> b!186819 t!7245))

(declare-fun b_and!11189 () Bool)

(assert (= b_and!11187 (and (=> t!7245 result!4817) b_and!11189)))

(declare-fun b_lambda!7259 () Bool)

(assert (=> (not b_lambda!7259) (not b!186827)))

(assert (=> b!186827 t!7245))

(declare-fun b_and!11191 () Bool)

(assert (= b_and!11189 (and (=> t!7245 result!4817) b_and!11191)))

(assert (=> b!186827 m!213063))

(assert (=> b!186827 m!213111))

(assert (=> b!186827 m!213109))

(assert (=> b!186827 m!213113))

(assert (=> b!186827 m!213111))

(assert (=> b!186827 m!213109))

(assert (=> b!186827 m!213063))

(declare-fun m!213187 () Bool)

(assert (=> b!186827 m!213187))

(assert (=> b!186823 m!213063))

(assert (=> b!186823 m!213063))

(declare-fun m!213189 () Bool)

(assert (=> b!186823 m!213189))

(declare-fun m!213191 () Bool)

(assert (=> b!186829 m!213191))

(declare-fun m!213193 () Bool)

(assert (=> b!186821 m!213193))

(assert (=> b!186828 m!213063))

(assert (=> b!186828 m!213063))

(assert (=> b!186828 m!213065))

(declare-fun m!213195 () Bool)

(assert (=> b!186822 m!213195))

(declare-fun m!213197 () Bool)

(assert (=> b!186819 m!213197))

(assert (=> b!186819 m!213063))

(declare-fun m!213199 () Bool)

(assert (=> b!186819 m!213199))

(assert (=> b!186819 m!213199))

(declare-fun m!213201 () Bool)

(assert (=> b!186819 m!213201))

(assert (=> b!186819 m!213111))

(assert (=> b!186819 m!213109))

(assert (=> b!186819 m!213113))

(declare-fun m!213203 () Bool)

(assert (=> b!186819 m!213203))

(assert (=> b!186819 m!213111))

(assert (=> b!186819 m!213109))

(assert (=> bm!18826 m!213191))

(declare-fun m!213205 () Bool)

(assert (=> d!55171 m!213205))

(assert (=> d!55171 m!212949))

(assert (=> b!186818 m!213063))

(assert (=> b!186818 m!213063))

(assert (=> b!186818 m!213065))

(assert (=> b!186665 d!55171))

(declare-fun d!55173 () Bool)

(assert (=> d!55173 (contains!1291 (+!286 lt!92222 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248))) lt!92220)))

(declare-fun lt!92301 () Unit!5593)

(declare-fun choose!998 (ListLongMap!2343 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5593)

(assert (=> d!55173 (= lt!92301 (choose!998 lt!92222 lt!92206 (zeroValue!3647 thiss!1248) lt!92220))))

(assert (=> d!55173 (contains!1291 lt!92222 lt!92220)))

(assert (=> d!55173 (= (addStillContains!145 lt!92222 lt!92206 (zeroValue!3647 thiss!1248) lt!92220) lt!92301)))

(declare-fun bs!7521 () Bool)

(assert (= bs!7521 d!55173))

(assert (=> bs!7521 m!213079))

(assert (=> bs!7521 m!213079))

(assert (=> bs!7521 m!213081))

(declare-fun m!213207 () Bool)

(assert (=> bs!7521 m!213207))

(declare-fun m!213209 () Bool)

(assert (=> bs!7521 m!213209))

(assert (=> b!186665 d!55173))

(declare-fun d!55175 () Bool)

(assert (=> d!55175 (= (apply!169 (+!286 lt!92214 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248))) lt!92227) (apply!169 lt!92214 lt!92227))))

(declare-fun lt!92304 () Unit!5593)

(declare-fun choose!999 (ListLongMap!2343 (_ BitVec 64) V!5473 (_ BitVec 64)) Unit!5593)

(assert (=> d!55175 (= lt!92304 (choose!999 lt!92214 lt!92224 (minValue!3647 thiss!1248) lt!92227))))

(declare-fun e!122942 () Bool)

(assert (=> d!55175 e!122942))

(declare-fun res!88340 () Bool)

(assert (=> d!55175 (=> (not res!88340) (not e!122942))))

(assert (=> d!55175 (= res!88340 (contains!1291 lt!92214 lt!92227))))

(assert (=> d!55175 (= (addApplyDifferent!145 lt!92214 lt!92224 (minValue!3647 thiss!1248) lt!92227) lt!92304)))

(declare-fun b!186834 () Bool)

(assert (=> b!186834 (= e!122942 (not (= lt!92227 lt!92224)))))

(assert (= (and d!55175 res!88340) b!186834))

(declare-fun m!213211 () Bool)

(assert (=> d!55175 m!213211))

(assert (=> d!55175 m!213091))

(declare-fun m!213213 () Bool)

(assert (=> d!55175 m!213213))

(assert (=> d!55175 m!213075))

(assert (=> d!55175 m!213077))

(assert (=> d!55175 m!213075))

(assert (=> b!186665 d!55175))

(declare-fun d!55177 () Bool)

(assert (=> d!55177 (= (apply!169 lt!92221 lt!92215) (get!2152 (getValueByKey!224 (toList!1187 lt!92221) lt!92215)))))

(declare-fun bs!7522 () Bool)

(assert (= bs!7522 d!55177))

(declare-fun m!213215 () Bool)

(assert (=> bs!7522 m!213215))

(assert (=> bs!7522 m!213215))

(declare-fun m!213217 () Bool)

(assert (=> bs!7522 m!213217))

(assert (=> b!186665 d!55177))

(declare-fun d!55179 () Bool)

(assert (=> d!55179 (= (apply!169 (+!286 lt!92209 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248))) lt!92223) (apply!169 lt!92209 lt!92223))))

(declare-fun lt!92305 () Unit!5593)

(assert (=> d!55179 (= lt!92305 (choose!999 lt!92209 lt!92219 (minValue!3647 thiss!1248) lt!92223))))

(declare-fun e!122943 () Bool)

(assert (=> d!55179 e!122943))

(declare-fun res!88341 () Bool)

(assert (=> d!55179 (=> (not res!88341) (not e!122943))))

(assert (=> d!55179 (= res!88341 (contains!1291 lt!92209 lt!92223))))

(assert (=> d!55179 (= (addApplyDifferent!145 lt!92209 lt!92219 (minValue!3647 thiss!1248) lt!92223) lt!92305)))

(declare-fun b!186835 () Bool)

(assert (=> b!186835 (= e!122943 (not (= lt!92223 lt!92219)))))

(assert (= (and d!55179 res!88341) b!186835))

(declare-fun m!213219 () Bool)

(assert (=> d!55179 m!213219))

(assert (=> d!55179 m!213089))

(declare-fun m!213221 () Bool)

(assert (=> d!55179 m!213221))

(assert (=> d!55179 m!213083))

(assert (=> d!55179 m!213095))

(assert (=> d!55179 m!213083))

(assert (=> b!186665 d!55179))

(declare-fun d!55181 () Bool)

(assert (=> d!55181 (= (apply!169 (+!286 lt!92214 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248))) lt!92227) (get!2152 (getValueByKey!224 (toList!1187 (+!286 lt!92214 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248)))) lt!92227)))))

(declare-fun bs!7523 () Bool)

(assert (= bs!7523 d!55181))

(declare-fun m!213223 () Bool)

(assert (=> bs!7523 m!213223))

(assert (=> bs!7523 m!213223))

(declare-fun m!213225 () Bool)

(assert (=> bs!7523 m!213225))

(assert (=> b!186665 d!55181))

(declare-fun d!55183 () Bool)

(assert (=> d!55183 (= (apply!169 (+!286 lt!92209 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248))) lt!92223) (get!2152 (getValueByKey!224 (toList!1187 (+!286 lt!92209 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248)))) lt!92223)))))

(declare-fun bs!7524 () Bool)

(assert (= bs!7524 d!55183))

(declare-fun m!213227 () Bool)

(assert (=> bs!7524 m!213227))

(assert (=> bs!7524 m!213227))

(declare-fun m!213229 () Bool)

(assert (=> bs!7524 m!213229))

(assert (=> b!186665 d!55183))

(declare-fun d!55185 () Bool)

(assert (=> d!55185 (= (apply!169 lt!92209 lt!92223) (get!2152 (getValueByKey!224 (toList!1187 lt!92209) lt!92223)))))

(declare-fun bs!7525 () Bool)

(assert (= bs!7525 d!55185))

(declare-fun m!213231 () Bool)

(assert (=> bs!7525 m!213231))

(assert (=> bs!7525 m!213231))

(declare-fun m!213233 () Bool)

(assert (=> bs!7525 m!213233))

(assert (=> b!186665 d!55185))

(declare-fun d!55187 () Bool)

(declare-fun e!122944 () Bool)

(assert (=> d!55187 e!122944))

(declare-fun res!88342 () Bool)

(assert (=> d!55187 (=> (not res!88342) (not e!122944))))

(declare-fun lt!92308 () ListLongMap!2343)

(assert (=> d!55187 (= res!88342 (contains!1291 lt!92308 (_1!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))))))

(declare-fun lt!92307 () List!2364)

(assert (=> d!55187 (= lt!92308 (ListLongMap!2344 lt!92307))))

(declare-fun lt!92309 () Unit!5593)

(declare-fun lt!92306 () Unit!5593)

(assert (=> d!55187 (= lt!92309 lt!92306)))

(assert (=> d!55187 (= (getValueByKey!224 lt!92307 (_1!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55187 (= lt!92306 (lemmaContainsTupThenGetReturnValue!119 lt!92307 (_1!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55187 (= lt!92307 (insertStrictlySorted!122 (toList!1187 lt!92222) (_1!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55187 (= (+!286 lt!92222 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248))) lt!92308)))

(declare-fun b!186836 () Bool)

(declare-fun res!88343 () Bool)

(assert (=> b!186836 (=> (not res!88343) (not e!122944))))

(assert (=> b!186836 (= res!88343 (= (getValueByKey!224 (toList!1187 lt!92308) (_1!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248))))))))

(declare-fun b!186837 () Bool)

(assert (=> b!186837 (= e!122944 (contains!1292 (toList!1187 lt!92308) (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248))))))

(assert (= (and d!55187 res!88342) b!186836))

(assert (= (and b!186836 res!88343) b!186837))

(declare-fun m!213235 () Bool)

(assert (=> d!55187 m!213235))

(declare-fun m!213237 () Bool)

(assert (=> d!55187 m!213237))

(declare-fun m!213239 () Bool)

(assert (=> d!55187 m!213239))

(declare-fun m!213241 () Bool)

(assert (=> d!55187 m!213241))

(declare-fun m!213243 () Bool)

(assert (=> b!186836 m!213243))

(declare-fun m!213245 () Bool)

(assert (=> b!186837 m!213245))

(assert (=> b!186665 d!55187))

(declare-fun d!55189 () Bool)

(assert (=> d!55189 (= (apply!169 (+!286 lt!92221 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248))) lt!92215) (apply!169 lt!92221 lt!92215))))

(declare-fun lt!92310 () Unit!5593)

(assert (=> d!55189 (= lt!92310 (choose!999 lt!92221 lt!92211 (zeroValue!3647 thiss!1248) lt!92215))))

(declare-fun e!122945 () Bool)

(assert (=> d!55189 e!122945))

(declare-fun res!88344 () Bool)

(assert (=> d!55189 (=> (not res!88344) (not e!122945))))

(assert (=> d!55189 (= res!88344 (contains!1291 lt!92221 lt!92215))))

(assert (=> d!55189 (= (addApplyDifferent!145 lt!92221 lt!92211 (zeroValue!3647 thiss!1248) lt!92215) lt!92310)))

(declare-fun b!186838 () Bool)

(assert (=> b!186838 (= e!122945 (not (= lt!92215 lt!92211)))))

(assert (= (and d!55189 res!88344) b!186838))

(declare-fun m!213247 () Bool)

(assert (=> d!55189 m!213247))

(assert (=> d!55189 m!213071))

(declare-fun m!213249 () Bool)

(assert (=> d!55189 m!213249))

(assert (=> d!55189 m!213085))

(assert (=> d!55189 m!213087))

(assert (=> d!55189 m!213085))

(assert (=> b!186665 d!55189))

(declare-fun d!55191 () Bool)

(declare-fun e!122946 () Bool)

(assert (=> d!55191 e!122946))

(declare-fun res!88345 () Bool)

(assert (=> d!55191 (=> (not res!88345) (not e!122946))))

(declare-fun lt!92313 () ListLongMap!2343)

(assert (=> d!55191 (= res!88345 (contains!1291 lt!92313 (_1!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248)))))))

(declare-fun lt!92312 () List!2364)

(assert (=> d!55191 (= lt!92313 (ListLongMap!2344 lt!92312))))

(declare-fun lt!92314 () Unit!5593)

(declare-fun lt!92311 () Unit!5593)

(assert (=> d!55191 (= lt!92314 lt!92311)))

(assert (=> d!55191 (= (getValueByKey!224 lt!92312 (_1!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248)))))))

(assert (=> d!55191 (= lt!92311 (lemmaContainsTupThenGetReturnValue!119 lt!92312 (_1!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248)))))))

(assert (=> d!55191 (= lt!92312 (insertStrictlySorted!122 (toList!1187 lt!92209) (_1!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248)))))))

(assert (=> d!55191 (= (+!286 lt!92209 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248))) lt!92313)))

(declare-fun b!186839 () Bool)

(declare-fun res!88346 () Bool)

(assert (=> b!186839 (=> (not res!88346) (not e!122946))))

(assert (=> b!186839 (= res!88346 (= (getValueByKey!224 (toList!1187 lt!92313) (_1!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 lt!92219 (minValue!3647 thiss!1248))))))))

(declare-fun b!186840 () Bool)

(assert (=> b!186840 (= e!122946 (contains!1292 (toList!1187 lt!92313) (tuple2!3435 lt!92219 (minValue!3647 thiss!1248))))))

(assert (= (and d!55191 res!88345) b!186839))

(assert (= (and b!186839 res!88346) b!186840))

(declare-fun m!213251 () Bool)

(assert (=> d!55191 m!213251))

(declare-fun m!213253 () Bool)

(assert (=> d!55191 m!213253))

(declare-fun m!213255 () Bool)

(assert (=> d!55191 m!213255))

(declare-fun m!213257 () Bool)

(assert (=> d!55191 m!213257))

(declare-fun m!213259 () Bool)

(assert (=> b!186839 m!213259))

(declare-fun m!213261 () Bool)

(assert (=> b!186840 m!213261))

(assert (=> b!186665 d!55191))

(declare-fun d!55193 () Bool)

(declare-fun e!122947 () Bool)

(assert (=> d!55193 e!122947))

(declare-fun res!88347 () Bool)

(assert (=> d!55193 (=> (not res!88347) (not e!122947))))

(declare-fun lt!92317 () ListLongMap!2343)

(assert (=> d!55193 (= res!88347 (contains!1291 lt!92317 (_1!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248)))))))

(declare-fun lt!92316 () List!2364)

(assert (=> d!55193 (= lt!92317 (ListLongMap!2344 lt!92316))))

(declare-fun lt!92318 () Unit!5593)

(declare-fun lt!92315 () Unit!5593)

(assert (=> d!55193 (= lt!92318 lt!92315)))

(assert (=> d!55193 (= (getValueByKey!224 lt!92316 (_1!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248)))))))

(assert (=> d!55193 (= lt!92315 (lemmaContainsTupThenGetReturnValue!119 lt!92316 (_1!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248)))))))

(assert (=> d!55193 (= lt!92316 (insertStrictlySorted!122 (toList!1187 lt!92214) (_1!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248)))))))

(assert (=> d!55193 (= (+!286 lt!92214 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248))) lt!92317)))

(declare-fun b!186841 () Bool)

(declare-fun res!88348 () Bool)

(assert (=> b!186841 (=> (not res!88348) (not e!122947))))

(assert (=> b!186841 (= res!88348 (= (getValueByKey!224 (toList!1187 lt!92317) (_1!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 lt!92224 (minValue!3647 thiss!1248))))))))

(declare-fun b!186842 () Bool)

(assert (=> b!186842 (= e!122947 (contains!1292 (toList!1187 lt!92317) (tuple2!3435 lt!92224 (minValue!3647 thiss!1248))))))

(assert (= (and d!55193 res!88347) b!186841))

(assert (= (and b!186841 res!88348) b!186842))

(declare-fun m!213263 () Bool)

(assert (=> d!55193 m!213263))

(declare-fun m!213265 () Bool)

(assert (=> d!55193 m!213265))

(declare-fun m!213267 () Bool)

(assert (=> d!55193 m!213267))

(declare-fun m!213269 () Bool)

(assert (=> d!55193 m!213269))

(declare-fun m!213271 () Bool)

(assert (=> b!186841 m!213271))

(declare-fun m!213273 () Bool)

(assert (=> b!186842 m!213273))

(assert (=> b!186665 d!55193))

(declare-fun d!55195 () Bool)

(assert (=> d!55195 (= (apply!169 (+!286 lt!92221 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248))) lt!92215) (get!2152 (getValueByKey!224 (toList!1187 (+!286 lt!92221 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248)))) lt!92215)))))

(declare-fun bs!7526 () Bool)

(assert (= bs!7526 d!55195))

(declare-fun m!213275 () Bool)

(assert (=> bs!7526 m!213275))

(assert (=> bs!7526 m!213275))

(declare-fun m!213277 () Bool)

(assert (=> bs!7526 m!213277))

(assert (=> b!186665 d!55195))

(declare-fun d!55197 () Bool)

(declare-fun e!122949 () Bool)

(assert (=> d!55197 e!122949))

(declare-fun res!88349 () Bool)

(assert (=> d!55197 (=> res!88349 e!122949)))

(declare-fun lt!92321 () Bool)

(assert (=> d!55197 (= res!88349 (not lt!92321))))

(declare-fun lt!92320 () Bool)

(assert (=> d!55197 (= lt!92321 lt!92320)))

(declare-fun lt!92322 () Unit!5593)

(declare-fun e!122948 () Unit!5593)

(assert (=> d!55197 (= lt!92322 e!122948)))

(declare-fun c!33531 () Bool)

(assert (=> d!55197 (= c!33531 lt!92320)))

(assert (=> d!55197 (= lt!92320 (containsKey!228 (toList!1187 (+!286 lt!92222 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))) lt!92220))))

(assert (=> d!55197 (= (contains!1291 (+!286 lt!92222 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248))) lt!92220) lt!92321)))

(declare-fun b!186843 () Bool)

(declare-fun lt!92319 () Unit!5593)

(assert (=> b!186843 (= e!122948 lt!92319)))

(assert (=> b!186843 (= lt!92319 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1187 (+!286 lt!92222 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))) lt!92220))))

(assert (=> b!186843 (isDefined!178 (getValueByKey!224 (toList!1187 (+!286 lt!92222 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))) lt!92220))))

(declare-fun b!186844 () Bool)

(declare-fun Unit!5603 () Unit!5593)

(assert (=> b!186844 (= e!122948 Unit!5603)))

(declare-fun b!186845 () Bool)

(assert (=> b!186845 (= e!122949 (isDefined!178 (getValueByKey!224 (toList!1187 (+!286 lt!92222 (tuple2!3435 lt!92206 (zeroValue!3647 thiss!1248)))) lt!92220)))))

(assert (= (and d!55197 c!33531) b!186843))

(assert (= (and d!55197 (not c!33531)) b!186844))

(assert (= (and d!55197 (not res!88349)) b!186845))

(declare-fun m!213279 () Bool)

(assert (=> d!55197 m!213279))

(declare-fun m!213281 () Bool)

(assert (=> b!186843 m!213281))

(declare-fun m!213283 () Bool)

(assert (=> b!186843 m!213283))

(assert (=> b!186843 m!213283))

(declare-fun m!213285 () Bool)

(assert (=> b!186843 m!213285))

(assert (=> b!186845 m!213283))

(assert (=> b!186845 m!213283))

(assert (=> b!186845 m!213285))

(assert (=> b!186665 d!55197))

(declare-fun d!55199 () Bool)

(declare-fun e!122950 () Bool)

(assert (=> d!55199 e!122950))

(declare-fun res!88350 () Bool)

(assert (=> d!55199 (=> (not res!88350) (not e!122950))))

(declare-fun lt!92325 () ListLongMap!2343)

(assert (=> d!55199 (= res!88350 (contains!1291 lt!92325 (_1!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248)))))))

(declare-fun lt!92324 () List!2364)

(assert (=> d!55199 (= lt!92325 (ListLongMap!2344 lt!92324))))

(declare-fun lt!92326 () Unit!5593)

(declare-fun lt!92323 () Unit!5593)

(assert (=> d!55199 (= lt!92326 lt!92323)))

(assert (=> d!55199 (= (getValueByKey!224 lt!92324 (_1!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55199 (= lt!92323 (lemmaContainsTupThenGetReturnValue!119 lt!92324 (_1!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55199 (= lt!92324 (insertStrictlySorted!122 (toList!1187 lt!92221) (_1!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248)))))))

(assert (=> d!55199 (= (+!286 lt!92221 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248))) lt!92325)))

(declare-fun b!186846 () Bool)

(declare-fun res!88351 () Bool)

(assert (=> b!186846 (=> (not res!88351) (not e!122950))))

(assert (=> b!186846 (= res!88351 (= (getValueByKey!224 (toList!1187 lt!92325) (_1!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248))))))))

(declare-fun b!186847 () Bool)

(assert (=> b!186847 (= e!122950 (contains!1292 (toList!1187 lt!92325) (tuple2!3435 lt!92211 (zeroValue!3647 thiss!1248))))))

(assert (= (and d!55199 res!88350) b!186846))

(assert (= (and b!186846 res!88351) b!186847))

(declare-fun m!213287 () Bool)

(assert (=> d!55199 m!213287))

(declare-fun m!213289 () Bool)

(assert (=> d!55199 m!213289))

(declare-fun m!213291 () Bool)

(assert (=> d!55199 m!213291))

(declare-fun m!213293 () Bool)

(assert (=> d!55199 m!213293))

(declare-fun m!213295 () Bool)

(assert (=> b!186846 m!213295))

(declare-fun m!213297 () Bool)

(assert (=> b!186847 m!213297))

(assert (=> b!186665 d!55199))

(declare-fun d!55201 () Bool)

(assert (=> d!55201 (= (apply!169 lt!92212 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2152 (getValueByKey!224 (toList!1187 lt!92212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7527 () Bool)

(assert (= bs!7527 d!55201))

(assert (=> bs!7527 m!213147))

(assert (=> bs!7527 m!213147))

(declare-fun m!213299 () Bool)

(assert (=> bs!7527 m!213299))

(assert (=> b!186664 d!55201))

(declare-fun d!55203 () Bool)

(assert (=> d!55203 (= (apply!169 lt!92212 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2152 (getValueByKey!224 (toList!1187 lt!92212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7528 () Bool)

(assert (= bs!7528 d!55203))

(declare-fun m!213301 () Bool)

(assert (=> bs!7528 m!213301))

(assert (=> bs!7528 m!213301))

(declare-fun m!213303 () Bool)

(assert (=> bs!7528 m!213303))

(assert (=> b!186648 d!55203))

(declare-fun d!55205 () Bool)

(assert (=> d!55205 (= (inRange!0 (index!4755 lt!92149) (mask!8936 thiss!1248)) (and (bvsge (index!4755 lt!92149) #b00000000000000000000000000000000) (bvslt (index!4755 lt!92149) (bvadd (mask!8936 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186584 d!55205))

(declare-fun d!55207 () Bool)

(assert (=> d!55207 (= (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!186646 d!55207))

(declare-fun d!55209 () Bool)

(declare-fun e!122951 () Bool)

(assert (=> d!55209 e!122951))

(declare-fun res!88352 () Bool)

(assert (=> d!55209 (=> (not res!88352) (not e!122951))))

(declare-fun lt!92329 () ListLongMap!2343)

(assert (=> d!55209 (= res!88352 (contains!1291 lt!92329 (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(declare-fun lt!92328 () List!2364)

(assert (=> d!55209 (= lt!92329 (ListLongMap!2344 lt!92328))))

(declare-fun lt!92330 () Unit!5593)

(declare-fun lt!92327 () Unit!5593)

(assert (=> d!55209 (= lt!92330 lt!92327)))

(assert (=> d!55209 (= (getValueByKey!224 lt!92328 (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(assert (=> d!55209 (= lt!92327 (lemmaContainsTupThenGetReturnValue!119 lt!92328 (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(assert (=> d!55209 (= lt!92328 (insertStrictlySorted!122 (toList!1187 call!18812) (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))) (_2!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))))))

(assert (=> d!55209 (= (+!286 call!18812 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))) lt!92329)))

(declare-fun b!186848 () Bool)

(declare-fun res!88353 () Bool)

(assert (=> b!186848 (=> (not res!88353) (not e!122951))))

(assert (=> b!186848 (= res!88353 (= (getValueByKey!224 (toList!1187 lt!92329) (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248)))) (Some!229 (_2!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))))

(declare-fun b!186849 () Bool)

(assert (=> b!186849 (= e!122951 (contains!1292 (toList!1187 lt!92329) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3647 thiss!1248))))))

(assert (= (and d!55209 res!88352) b!186848))

(assert (= (and b!186848 res!88353) b!186849))

(declare-fun m!213305 () Bool)

(assert (=> d!55209 m!213305))

(declare-fun m!213307 () Bool)

(assert (=> d!55209 m!213307))

(declare-fun m!213309 () Bool)

(assert (=> d!55209 m!213309))

(declare-fun m!213311 () Bool)

(assert (=> d!55209 m!213311))

(declare-fun m!213313 () Bool)

(assert (=> b!186848 m!213313))

(declare-fun m!213315 () Bool)

(assert (=> b!186849 m!213315))

(assert (=> b!186662 d!55209))

(declare-fun b!186860 () Bool)

(declare-fun e!122960 () Bool)

(declare-fun e!122961 () Bool)

(assert (=> b!186860 (= e!122960 e!122961)))

(declare-fun res!88361 () Bool)

(assert (=> b!186860 (=> (not res!88361) (not e!122961))))

(declare-fun e!122962 () Bool)

(assert (=> b!186860 (= res!88361 (not e!122962))))

(declare-fun res!88362 () Bool)

(assert (=> b!186860 (=> (not res!88362) (not e!122962))))

(assert (=> b!186860 (= res!88362 (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186861 () Bool)

(declare-fun e!122963 () Bool)

(declare-fun call!18832 () Bool)

(assert (=> b!186861 (= e!122963 call!18832)))

(declare-fun b!186862 () Bool)

(declare-fun contains!1293 (List!2365 (_ BitVec 64)) Bool)

(assert (=> b!186862 (= e!122962 (contains!1293 Nil!2362 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18829 () Bool)

(declare-fun c!33534 () Bool)

(assert (=> bm!18829 (= call!18832 (arrayNoDuplicates!0 (_keys!5751 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33534 (Cons!2361 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000) Nil!2362) Nil!2362)))))

(declare-fun d!55211 () Bool)

(declare-fun res!88360 () Bool)

(assert (=> d!55211 (=> res!88360 e!122960)))

(assert (=> d!55211 (= res!88360 (bvsge #b00000000000000000000000000000000 (size!4060 (_keys!5751 thiss!1248))))))

(assert (=> d!55211 (= (arrayNoDuplicates!0 (_keys!5751 thiss!1248) #b00000000000000000000000000000000 Nil!2362) e!122960)))

(declare-fun b!186863 () Bool)

(assert (=> b!186863 (= e!122961 e!122963)))

(assert (=> b!186863 (= c!33534 (validKeyInArray!0 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!186864 () Bool)

(assert (=> b!186864 (= e!122963 call!18832)))

(assert (= (and d!55211 (not res!88360)) b!186860))

(assert (= (and b!186860 res!88362) b!186862))

(assert (= (and b!186860 res!88361) b!186863))

(assert (= (and b!186863 c!33534) b!186861))

(assert (= (and b!186863 (not c!33534)) b!186864))

(assert (= (or b!186861 b!186864) bm!18829))

(assert (=> b!186860 m!213063))

(assert (=> b!186860 m!213063))

(assert (=> b!186860 m!213065))

(assert (=> b!186862 m!213063))

(assert (=> b!186862 m!213063))

(declare-fun m!213317 () Bool)

(assert (=> b!186862 m!213317))

(assert (=> bm!18829 m!213063))

(declare-fun m!213319 () Bool)

(assert (=> bm!18829 m!213319))

(assert (=> b!186863 m!213063))

(assert (=> b!186863 m!213063))

(assert (=> b!186863 m!213065))

(assert (=> b!186594 d!55211))

(declare-fun b!186877 () Bool)

(declare-fun e!122971 () SeekEntryResult!646)

(assert (=> b!186877 (= e!122971 (Found!646 (index!4756 lt!92136)))))

(declare-fun b!186878 () Bool)

(declare-fun e!122970 () SeekEntryResult!646)

(assert (=> b!186878 (= e!122970 Undefined!646)))

(declare-fun b!186879 () Bool)

(assert (=> b!186879 (= e!122970 e!122971)))

(declare-fun c!33542 () Bool)

(declare-fun lt!92335 () (_ BitVec 64))

(assert (=> b!186879 (= c!33542 (= lt!92335 key!828))))

(declare-fun b!186880 () Bool)

(declare-fun e!122972 () SeekEntryResult!646)

(assert (=> b!186880 (= e!122972 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20235 lt!92136) #b00000000000000000000000000000001) (nextIndex!0 (index!4756 lt!92136) (x!20235 lt!92136) (mask!8936 thiss!1248)) (index!4756 lt!92136) key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)))))

(declare-fun b!186881 () Bool)

(assert (=> b!186881 (= e!122972 (MissingVacant!646 (index!4756 lt!92136)))))

(declare-fun b!186882 () Bool)

(declare-fun c!33543 () Bool)

(assert (=> b!186882 (= c!33543 (= lt!92335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186882 (= e!122971 e!122972)))

(declare-fun d!55213 () Bool)

(declare-fun lt!92336 () SeekEntryResult!646)

(assert (=> d!55213 (and (or ((_ is Undefined!646) lt!92336) (not ((_ is Found!646) lt!92336)) (and (bvsge (index!4755 lt!92336) #b00000000000000000000000000000000) (bvslt (index!4755 lt!92336) (size!4060 (_keys!5751 thiss!1248))))) (or ((_ is Undefined!646) lt!92336) ((_ is Found!646) lt!92336) (not ((_ is MissingVacant!646) lt!92336)) (not (= (index!4757 lt!92336) (index!4756 lt!92136))) (and (bvsge (index!4757 lt!92336) #b00000000000000000000000000000000) (bvslt (index!4757 lt!92336) (size!4060 (_keys!5751 thiss!1248))))) (or ((_ is Undefined!646) lt!92336) (ite ((_ is Found!646) lt!92336) (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4755 lt!92336)) key!828) (and ((_ is MissingVacant!646) lt!92336) (= (index!4757 lt!92336) (index!4756 lt!92136)) (= (select (arr!3742 (_keys!5751 thiss!1248)) (index!4757 lt!92336)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55213 (= lt!92336 e!122970)))

(declare-fun c!33541 () Bool)

(assert (=> d!55213 (= c!33541 (bvsge (x!20235 lt!92136) #b01111111111111111111111111111110))))

(assert (=> d!55213 (= lt!92335 (select (arr!3742 (_keys!5751 thiss!1248)) (index!4756 lt!92136)))))

(assert (=> d!55213 (validMask!0 (mask!8936 thiss!1248))))

(assert (=> d!55213 (= (seekKeyOrZeroReturnVacant!0 (x!20235 lt!92136) (index!4756 lt!92136) (index!4756 lt!92136) key!828 (_keys!5751 thiss!1248) (mask!8936 thiss!1248)) lt!92336)))

(assert (= (and d!55213 c!33541) b!186878))

(assert (= (and d!55213 (not c!33541)) b!186879))

(assert (= (and b!186879 c!33542) b!186877))

(assert (= (and b!186879 (not c!33542)) b!186882))

(assert (= (and b!186882 c!33543) b!186881))

(assert (= (and b!186882 (not c!33543)) b!186880))

(declare-fun m!213321 () Bool)

(assert (=> b!186880 m!213321))

(assert (=> b!186880 m!213321))

(declare-fun m!213323 () Bool)

(assert (=> b!186880 m!213323))

(declare-fun m!213325 () Bool)

(assert (=> d!55213 m!213325))

(declare-fun m!213327 () Bool)

(assert (=> d!55213 m!213327))

(assert (=> d!55213 m!213015))

(assert (=> d!55213 m!212949))

(assert (=> b!186552 d!55213))

(declare-fun d!55215 () Bool)

(assert (=> d!55215 (= (apply!169 lt!92212 (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000)) (get!2152 (getValueByKey!224 (toList!1187 lt!92212) (select (arr!3742 (_keys!5751 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7529 () Bool)

(assert (= bs!7529 d!55215))

(assert (=> bs!7529 m!213063))

(assert (=> bs!7529 m!213175))

(assert (=> bs!7529 m!213175))

(declare-fun m!213329 () Bool)

(assert (=> bs!7529 m!213329))

(assert (=> b!186652 d!55215))

(declare-fun d!55217 () Bool)

(declare-fun c!33546 () Bool)

(assert (=> d!55217 (= c!33546 ((_ is ValueCellFull!1841) (select (arr!3743 (_values!3789 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!122975 () V!5473)

(assert (=> d!55217 (= (get!2151 (select (arr!3743 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!122975)))

(declare-fun b!186887 () Bool)

(declare-fun get!2153 (ValueCell!1841 V!5473) V!5473)

(assert (=> b!186887 (= e!122975 (get!2153 (select (arr!3743 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!186888 () Bool)

(declare-fun get!2154 (ValueCell!1841 V!5473) V!5473)

(assert (=> b!186888 (= e!122975 (get!2154 (select (arr!3743 (_values!3789 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!503 (defaultEntry!3806 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55217 c!33546) b!186887))

(assert (= (and d!55217 (not c!33546)) b!186888))

(assert (=> b!186887 m!213111))

(assert (=> b!186887 m!213109))

(declare-fun m!213331 () Bool)

(assert (=> b!186887 m!213331))

(assert (=> b!186888 m!213111))

(assert (=> b!186888 m!213109))

(declare-fun m!213333 () Bool)

(assert (=> b!186888 m!213333))

(assert (=> b!186652 d!55217))

(declare-fun d!55219 () Bool)

(declare-fun isEmpty!478 (Option!230) Bool)

(assert (=> d!55219 (= (isDefined!178 (getValueByKey!224 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828)) (not (isEmpty!478 (getValueByKey!224 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))))

(declare-fun bs!7530 () Bool)

(assert (= bs!7530 d!55219))

(assert (=> bs!7530 m!213057))

(declare-fun m!213335 () Bool)

(assert (=> bs!7530 m!213335))

(assert (=> b!186603 d!55219))

(declare-fun b!186899 () Bool)

(declare-fun e!122981 () Option!230)

(assert (=> b!186899 (= e!122981 (getValueByKey!224 (t!7243 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) key!828))))

(declare-fun b!186897 () Bool)

(declare-fun e!122980 () Option!230)

(assert (=> b!186897 (= e!122980 (Some!229 (_2!1728 (h!2994 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))))))

(declare-fun b!186900 () Bool)

(assert (=> b!186900 (= e!122981 None!228)))

(declare-fun d!55221 () Bool)

(declare-fun c!33551 () Bool)

(assert (=> d!55221 (= c!33551 (and ((_ is Cons!2360) (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) (= (_1!1728 (h!2994 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828)))))

(assert (=> d!55221 (= (getValueByKey!224 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828) e!122980)))

(declare-fun b!186898 () Bool)

(assert (=> b!186898 (= e!122980 e!122981)))

(declare-fun c!33552 () Bool)

(assert (=> b!186898 (= c!33552 (and ((_ is Cons!2360) (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))) (not (= (_1!1728 (h!2994 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))))) key!828))))))

(assert (= (and d!55221 c!33551) b!186897))

(assert (= (and d!55221 (not c!33551)) b!186898))

(assert (= (and b!186898 c!33552) b!186899))

(assert (= (and b!186898 (not c!33552)) b!186900))

(declare-fun m!213337 () Bool)

(assert (=> b!186899 m!213337))

(assert (=> b!186603 d!55221))

(declare-fun d!55223 () Bool)

(assert (=> d!55223 (isDefined!178 (getValueByKey!224 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(declare-fun lt!92339 () Unit!5593)

(declare-fun choose!1000 (List!2364 (_ BitVec 64)) Unit!5593)

(assert (=> d!55223 (= lt!92339 (choose!1000 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(declare-fun e!122984 () Bool)

(assert (=> d!55223 e!122984))

(declare-fun res!88365 () Bool)

(assert (=> d!55223 (=> (not res!88365) (not e!122984))))

(declare-fun isStrictlySorted!345 (List!2364) Bool)

(assert (=> d!55223 (= res!88365 (isStrictlySorted!345 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248)))))))

(assert (=> d!55223 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828) lt!92339)))

(declare-fun b!186903 () Bool)

(assert (=> b!186903 (= e!122984 (containsKey!228 (toList!1187 (getCurrentListMap!820 (_keys!5751 thiss!1248) (_values!3789 thiss!1248) (mask!8936 thiss!1248) (extraKeys!3543 thiss!1248) (zeroValue!3647 thiss!1248) (minValue!3647 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3806 thiss!1248))) key!828))))

(assert (= (and d!55223 res!88365) b!186903))

(assert (=> d!55223 m!213057))

(assert (=> d!55223 m!213057))

(assert (=> d!55223 m!213059))

(declare-fun m!213339 () Bool)

(assert (=> d!55223 m!213339))

(declare-fun m!213341 () Bool)

(assert (=> d!55223 m!213341))

(assert (=> b!186903 m!213053))

(assert (=> b!186601 d!55223))

(assert (=> b!186601 d!55219))

(assert (=> b!186601 d!55221))

(assert (=> bm!18811 d!55171))

(assert (=> b!186666 d!55207))

(declare-fun d!55225 () Bool)

(declare-fun e!122986 () Bool)

(assert (=> d!55225 e!122986))

(declare-fun res!88366 () Bool)

(assert (=> d!55225 (=> res!88366 e!122986)))

(declare-fun lt!92342 () Bool)

(assert (=> d!55225 (= res!88366 (not lt!92342))))

(declare-fun lt!92341 () Bool)

(assert (=> d!55225 (= lt!92342 lt!92341)))

(declare-fun lt!92343 () Unit!5593)

(declare-fun e!122985 () Unit!5593)

(assert (=> d!55225 (= lt!92343 e!122985)))

(declare-fun c!33553 () Bool)

(assert (=> d!55225 (= c!33553 lt!92341)))

(assert (=> d!55225 (= lt!92341 (containsKey!228 (toList!1187 lt!92212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55225 (= (contains!1291 lt!92212 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92342)))

(declare-fun b!186904 () Bool)

(declare-fun lt!92340 () Unit!5593)

(assert (=> b!186904 (= e!122985 lt!92340)))

(assert (=> b!186904 (= lt!92340 (lemmaContainsKeyImpliesGetValueByKeyDefined!177 (toList!1187 lt!92212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!186904 (isDefined!178 (getValueByKey!224 (toList!1187 lt!92212) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!186905 () Bool)

(declare-fun Unit!5604 () Unit!5593)

(assert (=> b!186905 (= e!122985 Unit!5604)))

(declare-fun b!186906 () Bool)

(assert (=> b!186906 (= e!122986 (isDefined!178 (getValueByKey!224 (toList!1187 lt!92212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55225 c!33553) b!186904))

(assert (= (and d!55225 (not c!33553)) b!186905))

(assert (= (and d!55225 (not res!88366)) b!186906))

(declare-fun m!213343 () Bool)

(assert (=> d!55225 m!213343))

(declare-fun m!213345 () Bool)

(assert (=> b!186904 m!213345))

(assert (=> b!186904 m!213301))

(assert (=> b!186904 m!213301))

(declare-fun m!213347 () Bool)

(assert (=> b!186904 m!213347))

(assert (=> b!186906 m!213301))

(assert (=> b!186906 m!213301))

(assert (=> b!186906 m!213347))

(assert (=> bm!18805 d!55225))

(declare-fun mapNonEmpty!7532 () Bool)

(declare-fun mapRes!7532 () Bool)

(declare-fun tp!16613 () Bool)

(declare-fun e!122987 () Bool)

(assert (=> mapNonEmpty!7532 (= mapRes!7532 (and tp!16613 e!122987))))

(declare-fun mapKey!7532 () (_ BitVec 32))

(declare-fun mapRest!7532 () (Array (_ BitVec 32) ValueCell!1841))

(declare-fun mapValue!7532 () ValueCell!1841)

(assert (=> mapNonEmpty!7532 (= mapRest!7531 (store mapRest!7532 mapKey!7532 mapValue!7532))))

(declare-fun mapIsEmpty!7532 () Bool)

(assert (=> mapIsEmpty!7532 mapRes!7532))

(declare-fun b!186908 () Bool)

(declare-fun e!122988 () Bool)

(assert (=> b!186908 (= e!122988 tp_is_empty!4369)))

(declare-fun condMapEmpty!7532 () Bool)

(declare-fun mapDefault!7532 () ValueCell!1841)

(assert (=> mapNonEmpty!7531 (= condMapEmpty!7532 (= mapRest!7531 ((as const (Array (_ BitVec 32) ValueCell!1841)) mapDefault!7532)))))

(assert (=> mapNonEmpty!7531 (= tp!16612 (and e!122988 mapRes!7532))))

(declare-fun b!186907 () Bool)

(assert (=> b!186907 (= e!122987 tp_is_empty!4369)))

(assert (= (and mapNonEmpty!7531 condMapEmpty!7532) mapIsEmpty!7532))

(assert (= (and mapNonEmpty!7531 (not condMapEmpty!7532)) mapNonEmpty!7532))

(assert (= (and mapNonEmpty!7532 ((_ is ValueCellFull!1841) mapValue!7532)) b!186907))

(assert (= (and mapNonEmpty!7531 ((_ is ValueCellFull!1841) mapDefault!7532)) b!186908))

(declare-fun m!213349 () Bool)

(assert (=> mapNonEmpty!7532 m!213349))

(declare-fun b_lambda!7261 () Bool)

(assert (= b_lambda!7259 (or (and b!186465 b_free!4597) b_lambda!7261)))

(declare-fun b_lambda!7263 () Bool)

(assert (= b_lambda!7257 (or (and b!186465 b_free!4597) b_lambda!7263)))

(check-sat (not d!55175) (not b!186862) (not d!55187) (not b!186839) (not b!186715) (not d!55177) (not b!186829) (not bm!18826) (not d!55169) (not d!55201) (not b_lambda!7263) (not b!186860) (not bm!18823) (not mapNonEmpty!7532) (not b!186821) (not b!186849) (not b!186827) (not b!186682) (not d!55203) (not b!186845) (not b!186863) (not b!186823) (not d!55165) (not b!186792) (not b!186906) (not bm!18822) (not bm!18814) (not b!186724) (not d!55219) (not d!55173) (not b!186736) (not d!55213) (not b!186714) (not bm!18817) (not b!186899) (not b!186888) (not b!186880) (not b!186822) (not b!186787) (not b!186903) (not b!186837) (not d!55223) (not b!186904) (not d!55163) (not d!55181) (not d!55151) (not b!186734) (not b_lambda!7261) (not d!55197) (not b!186716) b_and!11191 (not d!55167) (not b!186846) (not d!55199) (not b!186718) (not b_lambda!7255) (not b!186785) (not d!55225) (not b!186706) (not b!186782) (not d!55189) tp_is_empty!4369 (not d!55147) (not d!55179) (not d!55195) (not b!186847) (not b!186746) (not b!186848) (not d!55161) (not d!55193) (not b!186840) (not d!55153) (not b!186841) (not d!55191) (not d!55209) (not d!55183) (not d!55171) (not b!186842) (not b!186818) (not d!55215) (not b!186836) (not b_next!4597) (not bm!18829) (not b!186819) (not b!186783) (not d!55185) (not b!186887) (not b!186828) (not b!186843))
(check-sat b_and!11191 (not b_next!4597))
