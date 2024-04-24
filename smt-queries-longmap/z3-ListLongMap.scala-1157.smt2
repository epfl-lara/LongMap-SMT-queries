; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24294 () Bool)

(assert start!24294)

(declare-fun b!254622 () Bool)

(declare-fun b_free!6691 () Bool)

(declare-fun b_next!6691 () Bool)

(assert (=> b!254622 (= b_free!6691 (not b_next!6691))))

(declare-fun tp!23361 () Bool)

(declare-fun b_and!13747 () Bool)

(assert (=> b!254622 (= tp!23361 b_and!13747)))

(declare-fun b!254611 () Bool)

(declare-fun res!124643 () Bool)

(declare-fun e!165042 () Bool)

(assert (=> b!254611 (=> (not res!124643) (not e!165042))))

(declare-fun call!24007 () Bool)

(assert (=> b!254611 (= res!124643 call!24007)))

(declare-fun e!165040 () Bool)

(assert (=> b!254611 (= e!165040 e!165042)))

(declare-fun b!254612 () Bool)

(declare-datatypes ((Unit!7864 0))(
  ( (Unit!7865) )
))
(declare-fun e!165038 () Unit!7864)

(declare-fun Unit!7866 () Unit!7864)

(assert (=> b!254612 (= e!165038 Unit!7866)))

(declare-fun b!254613 () Bool)

(declare-fun e!165039 () Unit!7864)

(declare-fun Unit!7867 () Unit!7864)

(assert (=> b!254613 (= e!165039 Unit!7867)))

(declare-fun lt!127617 () Unit!7864)

(declare-datatypes ((V!8385 0))(
  ( (V!8386 (val!3321 Int)) )
))
(declare-datatypes ((ValueCell!2933 0))(
  ( (ValueCellFull!2933 (v!5396 V!8385)) (EmptyCell!2933) )
))
(declare-datatypes ((array!12435 0))(
  ( (array!12436 (arr!5893 (Array (_ BitVec 32) ValueCell!2933)) (size!6240 (_ BitVec 32))) )
))
(declare-datatypes ((array!12437 0))(
  ( (array!12438 (arr!5894 (Array (_ BitVec 32) (_ BitVec 64))) (size!6241 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3766 0))(
  ( (LongMapFixedSize!3767 (defaultEntry!4696 Int) (mask!10944 (_ BitVec 32)) (extraKeys!4433 (_ BitVec 32)) (zeroValue!4537 V!8385) (minValue!4537 V!8385) (_size!1932 (_ BitVec 32)) (_keys!6850 array!12437) (_values!4679 array!12435) (_vacant!1932 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3766)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!413 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7864)

(assert (=> b!254613 (= lt!127617 (lemmaInListMapThenSeekEntryOrOpenFindsIt!413 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(assert (=> b!254613 false))

(declare-fun res!124642 () Bool)

(declare-fun e!165037 () Bool)

(assert (=> start!24294 (=> (not res!124642) (not e!165037))))

(declare-fun valid!1478 (LongMapFixedSize!3766) Bool)

(assert (=> start!24294 (= res!124642 (valid!1478 thiss!1504))))

(assert (=> start!24294 e!165037))

(declare-fun e!165030 () Bool)

(assert (=> start!24294 e!165030))

(assert (=> start!24294 true))

(declare-fun tp_is_empty!6553 () Bool)

(assert (=> start!24294 tp_is_empty!6553))

(declare-fun b!254614 () Bool)

(declare-fun e!165035 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!254614 (= e!165035 (not (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6241 (_keys!6850 thiss!1504))))))))

(declare-fun lt!127624 () array!12437)

(declare-fun v!346 () V!8385)

(declare-datatypes ((tuple2!4804 0))(
  ( (tuple2!4805 (_1!2413 (_ BitVec 64)) (_2!2413 V!8385)) )
))
(declare-datatypes ((List!3684 0))(
  ( (Nil!3681) (Cons!3680 (h!4342 tuple2!4804) (t!8723 List!3684)) )
))
(declare-datatypes ((ListLongMap!3719 0))(
  ( (ListLongMap!3720 (toList!1875 List!3684)) )
))
(declare-fun lt!127620 () ListLongMap!3719)

(declare-fun +!674 (ListLongMap!3719 tuple2!4804) ListLongMap!3719)

(declare-fun getCurrentListMap!1407 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) Int) ListLongMap!3719)

(assert (=> b!254614 (= (+!674 lt!127620 (tuple2!4805 key!932 v!346)) (getCurrentListMap!1407 lt!127624 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127616 () Unit!7864)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!89 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) (_ BitVec 64) V!8385 Int) Unit!7864)

(assert (=> b!254614 (= lt!127616 (lemmaAddValidKeyToArrayThenAddPairToListMap!89 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) index!297 key!932 v!346 (defaultEntry!4696 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12437 (_ BitVec 32)) Bool)

(assert (=> b!254614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127624 (mask!10944 thiss!1504))))

(declare-fun lt!127625 () Unit!7864)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12437 (_ BitVec 32) (_ BitVec 32)) Unit!7864)

(assert (=> b!254614 (= lt!127625 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6850 thiss!1504) index!297 (mask!10944 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12437 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254614 (= (arrayCountValidKeys!0 lt!127624 #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6850 thiss!1504) #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504)))))))

(declare-fun lt!127623 () Unit!7864)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12437 (_ BitVec 32) (_ BitVec 64)) Unit!7864)

(assert (=> b!254614 (= lt!127623 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6850 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3685 0))(
  ( (Nil!3682) (Cons!3681 (h!4343 (_ BitVec 64)) (t!8724 List!3685)) )
))
(declare-fun arrayNoDuplicates!0 (array!12437 (_ BitVec 32) List!3685) Bool)

(assert (=> b!254614 (arrayNoDuplicates!0 lt!127624 #b00000000000000000000000000000000 Nil!3682)))

(assert (=> b!254614 (= lt!127624 (array!12438 (store (arr!5894 (_keys!6850 thiss!1504)) index!297 key!932) (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun lt!127621 () Unit!7864)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3685) Unit!7864)

(assert (=> b!254614 (= lt!127621 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6850 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3682))))

(declare-fun lt!127622 () Unit!7864)

(assert (=> b!254614 (= lt!127622 e!165038)))

(declare-fun c!42948 () Bool)

(declare-fun arrayContainsKey!0 (array!12437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254614 (= c!42948 (arrayContainsKey!0 (_keys!6850 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254615 () Bool)

(declare-fun res!124640 () Bool)

(assert (=> b!254615 (=> (not res!124640) (not e!165037))))

(assert (=> b!254615 (= res!124640 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!11145 () Bool)

(declare-fun mapRes!11145 () Bool)

(declare-fun tp!23360 () Bool)

(declare-fun e!165034 () Bool)

(assert (=> mapNonEmpty!11145 (= mapRes!11145 (and tp!23360 e!165034))))

(declare-fun mapValue!11145 () ValueCell!2933)

(declare-fun mapRest!11145 () (Array (_ BitVec 32) ValueCell!2933))

(declare-fun mapKey!11145 () (_ BitVec 32))

(assert (=> mapNonEmpty!11145 (= (arr!5893 (_values!4679 thiss!1504)) (store mapRest!11145 mapKey!11145 mapValue!11145))))

(declare-fun b!254616 () Bool)

(declare-fun e!165036 () Bool)

(declare-fun call!24006 () Bool)

(assert (=> b!254616 (= e!165036 (not call!24006))))

(declare-fun bm!24003 () Bool)

(assert (=> bm!24003 (= call!24006 (arrayContainsKey!0 (_keys!6850 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254617 () Bool)

(declare-fun e!165041 () Bool)

(assert (=> b!254617 (= e!165037 e!165041)))

(declare-fun res!124638 () Bool)

(assert (=> b!254617 (=> (not res!124638) (not e!165041))))

(declare-datatypes ((SeekEntryResult!1117 0))(
  ( (MissingZero!1117 (index!6638 (_ BitVec 32))) (Found!1117 (index!6639 (_ BitVec 32))) (Intermediate!1117 (undefined!1929 Bool) (index!6640 (_ BitVec 32)) (x!24841 (_ BitVec 32))) (Undefined!1117) (MissingVacant!1117 (index!6641 (_ BitVec 32))) )
))
(declare-fun lt!127626 () SeekEntryResult!1117)

(assert (=> b!254617 (= res!124638 (or (= lt!127626 (MissingZero!1117 index!297)) (= lt!127626 (MissingVacant!1117 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12437 (_ BitVec 32)) SeekEntryResult!1117)

(assert (=> b!254617 (= lt!127626 (seekEntryOrOpen!0 key!932 (_keys!6850 thiss!1504) (mask!10944 thiss!1504)))))

(declare-fun b!254618 () Bool)

(declare-fun res!124641 () Bool)

(assert (=> b!254618 (= res!124641 (= (select (arr!5894 (_keys!6850 thiss!1504)) (index!6641 lt!127626)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254618 (=> (not res!124641) (not e!165036))))

(declare-fun b!254619 () Bool)

(declare-fun e!165033 () Bool)

(get-info :version)

(assert (=> b!254619 (= e!165033 ((_ is Undefined!1117) lt!127626))))

(declare-fun mapIsEmpty!11145 () Bool)

(assert (=> mapIsEmpty!11145 mapRes!11145))

(declare-fun b!254620 () Bool)

(declare-fun e!165032 () Bool)

(assert (=> b!254620 (= e!165032 tp_is_empty!6553)))

(declare-fun b!254621 () Bool)

(declare-fun Unit!7868 () Unit!7864)

(assert (=> b!254621 (= e!165038 Unit!7868)))

(declare-fun lt!127618 () Unit!7864)

(declare-fun lemmaArrayContainsKeyThenInListMap!231 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) (_ BitVec 32) Int) Unit!7864)

(assert (=> b!254621 (= lt!127618 (lemmaArrayContainsKeyThenInListMap!231 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(assert (=> b!254621 false))

(declare-fun e!165031 () Bool)

(declare-fun array_inv!3877 (array!12437) Bool)

(declare-fun array_inv!3878 (array!12435) Bool)

(assert (=> b!254622 (= e!165030 (and tp!23361 tp_is_empty!6553 (array_inv!3877 (_keys!6850 thiss!1504)) (array_inv!3878 (_values!4679 thiss!1504)) e!165031))))

(declare-fun b!254623 () Bool)

(declare-fun res!124639 () Bool)

(assert (=> b!254623 (=> (not res!124639) (not e!165042))))

(assert (=> b!254623 (= res!124639 (= (select (arr!5894 (_keys!6850 thiss!1504)) (index!6638 lt!127626)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254624 () Bool)

(assert (=> b!254624 (= e!165033 e!165036)))

(declare-fun res!124637 () Bool)

(assert (=> b!254624 (= res!124637 call!24007)))

(assert (=> b!254624 (=> (not res!124637) (not e!165036))))

(declare-fun b!254625 () Bool)

(assert (=> b!254625 (= e!165042 (not call!24006))))

(declare-fun b!254626 () Bool)

(assert (=> b!254626 (= e!165031 (and e!165032 mapRes!11145))))

(declare-fun condMapEmpty!11145 () Bool)

(declare-fun mapDefault!11145 () ValueCell!2933)

(assert (=> b!254626 (= condMapEmpty!11145 (= (arr!5893 (_values!4679 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2933)) mapDefault!11145)))))

(declare-fun bm!24004 () Bool)

(declare-fun c!42951 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24004 (= call!24007 (inRange!0 (ite c!42951 (index!6638 lt!127626) (index!6641 lt!127626)) (mask!10944 thiss!1504)))))

(declare-fun b!254627 () Bool)

(declare-fun c!42949 () Bool)

(assert (=> b!254627 (= c!42949 ((_ is MissingVacant!1117) lt!127626))))

(assert (=> b!254627 (= e!165040 e!165033)))

(declare-fun b!254628 () Bool)

(assert (=> b!254628 (= e!165034 tp_is_empty!6553)))

(declare-fun b!254629 () Bool)

(assert (=> b!254629 (= e!165041 e!165035)))

(declare-fun res!124644 () Bool)

(assert (=> b!254629 (=> (not res!124644) (not e!165035))))

(assert (=> b!254629 (= res!124644 (inRange!0 index!297 (mask!10944 thiss!1504)))))

(declare-fun lt!127619 () Unit!7864)

(assert (=> b!254629 (= lt!127619 e!165039)))

(declare-fun c!42950 () Bool)

(declare-fun contains!1821 (ListLongMap!3719 (_ BitVec 64)) Bool)

(assert (=> b!254629 (= c!42950 (contains!1821 lt!127620 key!932))))

(assert (=> b!254629 (= lt!127620 (getCurrentListMap!1407 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun b!254630 () Bool)

(declare-fun lt!127627 () Unit!7864)

(assert (=> b!254630 (= e!165039 lt!127627)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!407 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7864)

(assert (=> b!254630 (= lt!127627 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!407 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(assert (=> b!254630 (= c!42951 ((_ is MissingZero!1117) lt!127626))))

(assert (=> b!254630 e!165040))

(assert (= (and start!24294 res!124642) b!254615))

(assert (= (and b!254615 res!124640) b!254617))

(assert (= (and b!254617 res!124638) b!254629))

(assert (= (and b!254629 c!42950) b!254613))

(assert (= (and b!254629 (not c!42950)) b!254630))

(assert (= (and b!254630 c!42951) b!254611))

(assert (= (and b!254630 (not c!42951)) b!254627))

(assert (= (and b!254611 res!124643) b!254623))

(assert (= (and b!254623 res!124639) b!254625))

(assert (= (and b!254627 c!42949) b!254624))

(assert (= (and b!254627 (not c!42949)) b!254619))

(assert (= (and b!254624 res!124637) b!254618))

(assert (= (and b!254618 res!124641) b!254616))

(assert (= (or b!254611 b!254624) bm!24004))

(assert (= (or b!254625 b!254616) bm!24003))

(assert (= (and b!254629 res!124644) b!254614))

(assert (= (and b!254614 c!42948) b!254621))

(assert (= (and b!254614 (not c!42948)) b!254612))

(assert (= (and b!254626 condMapEmpty!11145) mapIsEmpty!11145))

(assert (= (and b!254626 (not condMapEmpty!11145)) mapNonEmpty!11145))

(assert (= (and mapNonEmpty!11145 ((_ is ValueCellFull!2933) mapValue!11145)) b!254628))

(assert (= (and b!254626 ((_ is ValueCellFull!2933) mapDefault!11145)) b!254620))

(assert (= b!254622 b!254626))

(assert (= start!24294 b!254622))

(declare-fun m!270287 () Bool)

(assert (=> b!254617 m!270287))

(declare-fun m!270289 () Bool)

(assert (=> bm!24003 m!270289))

(declare-fun m!270291 () Bool)

(assert (=> b!254621 m!270291))

(declare-fun m!270293 () Bool)

(assert (=> start!24294 m!270293))

(declare-fun m!270295 () Bool)

(assert (=> mapNonEmpty!11145 m!270295))

(declare-fun m!270297 () Bool)

(assert (=> b!254618 m!270297))

(declare-fun m!270299 () Bool)

(assert (=> bm!24004 m!270299))

(declare-fun m!270301 () Bool)

(assert (=> b!254613 m!270301))

(declare-fun m!270303 () Bool)

(assert (=> b!254622 m!270303))

(declare-fun m!270305 () Bool)

(assert (=> b!254622 m!270305))

(declare-fun m!270307 () Bool)

(assert (=> b!254630 m!270307))

(declare-fun m!270309 () Bool)

(assert (=> b!254623 m!270309))

(assert (=> b!254614 m!270289))

(declare-fun m!270311 () Bool)

(assert (=> b!254614 m!270311))

(declare-fun m!270313 () Bool)

(assert (=> b!254614 m!270313))

(declare-fun m!270315 () Bool)

(assert (=> b!254614 m!270315))

(declare-fun m!270317 () Bool)

(assert (=> b!254614 m!270317))

(declare-fun m!270319 () Bool)

(assert (=> b!254614 m!270319))

(declare-fun m!270321 () Bool)

(assert (=> b!254614 m!270321))

(declare-fun m!270323 () Bool)

(assert (=> b!254614 m!270323))

(declare-fun m!270325 () Bool)

(assert (=> b!254614 m!270325))

(declare-fun m!270327 () Bool)

(assert (=> b!254614 m!270327))

(declare-fun m!270329 () Bool)

(assert (=> b!254614 m!270329))

(declare-fun m!270331 () Bool)

(assert (=> b!254614 m!270331))

(declare-fun m!270333 () Bool)

(assert (=> b!254614 m!270333))

(declare-fun m!270335 () Bool)

(assert (=> b!254629 m!270335))

(declare-fun m!270337 () Bool)

(assert (=> b!254629 m!270337))

(declare-fun m!270339 () Bool)

(assert (=> b!254629 m!270339))

(check-sat (not b!254630) (not start!24294) (not bm!24003) (not b_next!6691) (not bm!24004) tp_is_empty!6553 (not b!254617) (not mapNonEmpty!11145) (not b!254629) (not b!254621) (not b!254613) (not b!254614) b_and!13747 (not b!254622))
(check-sat b_and!13747 (not b_next!6691))
(get-model)

(declare-fun d!61559 () Bool)

(assert (=> d!61559 (= (inRange!0 index!297 (mask!10944 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10944 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!254629 d!61559))

(declare-fun d!61561 () Bool)

(declare-fun e!165133 () Bool)

(assert (=> d!61561 e!165133))

(declare-fun res!124695 () Bool)

(assert (=> d!61561 (=> res!124695 e!165133)))

(declare-fun lt!127711 () Bool)

(assert (=> d!61561 (= res!124695 (not lt!127711))))

(declare-fun lt!127710 () Bool)

(assert (=> d!61561 (= lt!127711 lt!127710)))

(declare-fun lt!127709 () Unit!7864)

(declare-fun e!165132 () Unit!7864)

(assert (=> d!61561 (= lt!127709 e!165132)))

(declare-fun c!42978 () Bool)

(assert (=> d!61561 (= c!42978 lt!127710)))

(declare-fun containsKey!297 (List!3684 (_ BitVec 64)) Bool)

(assert (=> d!61561 (= lt!127710 (containsKey!297 (toList!1875 lt!127620) key!932))))

(assert (=> d!61561 (= (contains!1821 lt!127620 key!932) lt!127711)))

(declare-fun b!254757 () Bool)

(declare-fun lt!127708 () Unit!7864)

(assert (=> b!254757 (= e!165132 lt!127708)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!245 (List!3684 (_ BitVec 64)) Unit!7864)

(assert (=> b!254757 (= lt!127708 (lemmaContainsKeyImpliesGetValueByKeyDefined!245 (toList!1875 lt!127620) key!932))))

(declare-datatypes ((Option!312 0))(
  ( (Some!311 (v!5401 V!8385)) (None!310) )
))
(declare-fun isDefined!246 (Option!312) Bool)

(declare-fun getValueByKey!306 (List!3684 (_ BitVec 64)) Option!312)

(assert (=> b!254757 (isDefined!246 (getValueByKey!306 (toList!1875 lt!127620) key!932))))

(declare-fun b!254758 () Bool)

(declare-fun Unit!7877 () Unit!7864)

(assert (=> b!254758 (= e!165132 Unit!7877)))

(declare-fun b!254759 () Bool)

(assert (=> b!254759 (= e!165133 (isDefined!246 (getValueByKey!306 (toList!1875 lt!127620) key!932)))))

(assert (= (and d!61561 c!42978) b!254757))

(assert (= (and d!61561 (not c!42978)) b!254758))

(assert (= (and d!61561 (not res!124695)) b!254759))

(declare-fun m!270449 () Bool)

(assert (=> d!61561 m!270449))

(declare-fun m!270451 () Bool)

(assert (=> b!254757 m!270451))

(declare-fun m!270453 () Bool)

(assert (=> b!254757 m!270453))

(assert (=> b!254757 m!270453))

(declare-fun m!270455 () Bool)

(assert (=> b!254757 m!270455))

(assert (=> b!254759 m!270453))

(assert (=> b!254759 m!270453))

(assert (=> b!254759 m!270455))

(assert (=> b!254629 d!61561))

(declare-fun b!254802 () Bool)

(declare-fun res!124722 () Bool)

(declare-fun e!165163 () Bool)

(assert (=> b!254802 (=> (not res!124722) (not e!165163))))

(declare-fun e!165162 () Bool)

(assert (=> b!254802 (= res!124722 e!165162)))

(declare-fun res!124717 () Bool)

(assert (=> b!254802 (=> res!124717 e!165162)))

(declare-fun e!165166 () Bool)

(assert (=> b!254802 (= res!124717 (not e!165166))))

(declare-fun res!124719 () Bool)

(assert (=> b!254802 (=> (not res!124719) (not e!165166))))

(assert (=> b!254802 (= res!124719 (bvslt #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun b!254803 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!254803 (= e!165166 (validKeyInArray!0 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!254804 () Bool)

(declare-fun e!165169 () ListLongMap!3719)

(declare-fun e!165161 () ListLongMap!3719)

(assert (=> b!254804 (= e!165169 e!165161)))

(declare-fun c!42991 () Bool)

(assert (=> b!254804 (= c!42991 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!254805 () Bool)

(declare-fun e!165170 () Bool)

(assert (=> b!254805 (= e!165170 (validKeyInArray!0 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!254806 () Bool)

(declare-fun e!165171 () Bool)

(declare-fun lt!127764 () ListLongMap!3719)

(declare-fun apply!247 (ListLongMap!3719 (_ BitVec 64)) V!8385)

(assert (=> b!254806 (= e!165171 (= (apply!247 lt!127764 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4537 thiss!1504)))))

(declare-fun bm!24031 () Bool)

(declare-fun call!24038 () Bool)

(assert (=> bm!24031 (= call!24038 (contains!1821 lt!127764 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254807 () Bool)

(declare-fun e!165160 () Bool)

(assert (=> b!254807 (= e!165160 (= (apply!247 lt!127764 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4537 thiss!1504)))))

(declare-fun b!254808 () Bool)

(declare-fun e!165164 () Bool)

(assert (=> b!254808 (= e!165162 e!165164)))

(declare-fun res!124716 () Bool)

(assert (=> b!254808 (=> (not res!124716) (not e!165164))))

(assert (=> b!254808 (= res!124716 (contains!1821 lt!127764 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!254808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun bm!24032 () Bool)

(declare-fun call!24037 () ListLongMap!3719)

(declare-fun call!24034 () ListLongMap!3719)

(assert (=> bm!24032 (= call!24037 call!24034)))

(declare-fun bm!24033 () Bool)

(declare-fun call!24036 () Bool)

(assert (=> bm!24033 (= call!24036 (contains!1821 lt!127764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254809 () Bool)

(declare-fun e!165168 () Unit!7864)

(declare-fun lt!127770 () Unit!7864)

(assert (=> b!254809 (= e!165168 lt!127770)))

(declare-fun lt!127774 () ListLongMap!3719)

(declare-fun getCurrentListMapNoExtraKeys!563 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) Int) ListLongMap!3719)

(assert (=> b!254809 (= lt!127774 (getCurrentListMapNoExtraKeys!563 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127771 () (_ BitVec 64))

(assert (=> b!254809 (= lt!127771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127762 () (_ BitVec 64))

(assert (=> b!254809 (= lt!127762 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127777 () Unit!7864)

(declare-fun addStillContains!223 (ListLongMap!3719 (_ BitVec 64) V!8385 (_ BitVec 64)) Unit!7864)

(assert (=> b!254809 (= lt!127777 (addStillContains!223 lt!127774 lt!127771 (zeroValue!4537 thiss!1504) lt!127762))))

(assert (=> b!254809 (contains!1821 (+!674 lt!127774 (tuple2!4805 lt!127771 (zeroValue!4537 thiss!1504))) lt!127762)))

(declare-fun lt!127775 () Unit!7864)

(assert (=> b!254809 (= lt!127775 lt!127777)))

(declare-fun lt!127768 () ListLongMap!3719)

(assert (=> b!254809 (= lt!127768 (getCurrentListMapNoExtraKeys!563 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127767 () (_ BitVec 64))

(assert (=> b!254809 (= lt!127767 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127760 () (_ BitVec 64))

(assert (=> b!254809 (= lt!127760 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127769 () Unit!7864)

(declare-fun addApplyDifferent!223 (ListLongMap!3719 (_ BitVec 64) V!8385 (_ BitVec 64)) Unit!7864)

(assert (=> b!254809 (= lt!127769 (addApplyDifferent!223 lt!127768 lt!127767 (minValue!4537 thiss!1504) lt!127760))))

(assert (=> b!254809 (= (apply!247 (+!674 lt!127768 (tuple2!4805 lt!127767 (minValue!4537 thiss!1504))) lt!127760) (apply!247 lt!127768 lt!127760))))

(declare-fun lt!127758 () Unit!7864)

(assert (=> b!254809 (= lt!127758 lt!127769)))

(declare-fun lt!127772 () ListLongMap!3719)

(assert (=> b!254809 (= lt!127772 (getCurrentListMapNoExtraKeys!563 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127759 () (_ BitVec 64))

(assert (=> b!254809 (= lt!127759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127757 () (_ BitVec 64))

(assert (=> b!254809 (= lt!127757 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127761 () Unit!7864)

(assert (=> b!254809 (= lt!127761 (addApplyDifferent!223 lt!127772 lt!127759 (zeroValue!4537 thiss!1504) lt!127757))))

(assert (=> b!254809 (= (apply!247 (+!674 lt!127772 (tuple2!4805 lt!127759 (zeroValue!4537 thiss!1504))) lt!127757) (apply!247 lt!127772 lt!127757))))

(declare-fun lt!127765 () Unit!7864)

(assert (=> b!254809 (= lt!127765 lt!127761)))

(declare-fun lt!127763 () ListLongMap!3719)

(assert (=> b!254809 (= lt!127763 (getCurrentListMapNoExtraKeys!563 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127756 () (_ BitVec 64))

(assert (=> b!254809 (= lt!127756 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127773 () (_ BitVec 64))

(assert (=> b!254809 (= lt!127773 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254809 (= lt!127770 (addApplyDifferent!223 lt!127763 lt!127756 (minValue!4537 thiss!1504) lt!127773))))

(assert (=> b!254809 (= (apply!247 (+!674 lt!127763 (tuple2!4805 lt!127756 (minValue!4537 thiss!1504))) lt!127773) (apply!247 lt!127763 lt!127773))))

(declare-fun b!254810 () Bool)

(declare-fun e!165167 () ListLongMap!3719)

(declare-fun call!24039 () ListLongMap!3719)

(assert (=> b!254810 (= e!165167 call!24039)))

(declare-fun b!254811 () Bool)

(declare-fun e!165172 () Bool)

(assert (=> b!254811 (= e!165163 e!165172)))

(declare-fun c!42996 () Bool)

(assert (=> b!254811 (= c!42996 (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24034 () Bool)

(assert (=> bm!24034 (= call!24039 call!24037)))

(declare-fun d!61563 () Bool)

(assert (=> d!61563 e!165163))

(declare-fun res!124715 () Bool)

(assert (=> d!61563 (=> (not res!124715) (not e!165163))))

(assert (=> d!61563 (= res!124715 (or (bvsge #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))))))))

(declare-fun lt!127766 () ListLongMap!3719)

(assert (=> d!61563 (= lt!127764 lt!127766)))

(declare-fun lt!127776 () Unit!7864)

(assert (=> d!61563 (= lt!127776 e!165168)))

(declare-fun c!42993 () Bool)

(assert (=> d!61563 (= c!42993 e!165170)))

(declare-fun res!124721 () Bool)

(assert (=> d!61563 (=> (not res!124721) (not e!165170))))

(assert (=> d!61563 (= res!124721 (bvslt #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))))))

(assert (=> d!61563 (= lt!127766 e!165169)))

(declare-fun c!42994 () Bool)

(assert (=> d!61563 (= c!42994 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61563 (validMask!0 (mask!10944 thiss!1504))))

(assert (=> d!61563 (= (getCurrentListMap!1407 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) lt!127764)))

(declare-fun b!254812 () Bool)

(declare-fun call!24035 () ListLongMap!3719)

(assert (=> b!254812 (= e!165167 call!24035)))

(declare-fun bm!24035 () Bool)

(declare-fun call!24040 () ListLongMap!3719)

(assert (=> bm!24035 (= call!24040 (+!674 (ite c!42994 call!24034 (ite c!42991 call!24037 call!24039)) (ite (or c!42994 c!42991) (tuple2!4805 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4537 thiss!1504)) (tuple2!4805 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4537 thiss!1504)))))))

(declare-fun b!254813 () Bool)

(declare-fun c!42992 () Bool)

(assert (=> b!254813 (= c!42992 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!254813 (= e!165161 e!165167)))

(declare-fun b!254814 () Bool)

(declare-fun res!124714 () Bool)

(assert (=> b!254814 (=> (not res!124714) (not e!165163))))

(declare-fun e!165165 () Bool)

(assert (=> b!254814 (= res!124714 e!165165)))

(declare-fun c!42995 () Bool)

(assert (=> b!254814 (= c!42995 (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!254815 () Bool)

(assert (=> b!254815 (= e!165165 (not call!24036))))

(declare-fun b!254816 () Bool)

(assert (=> b!254816 (= e!165172 (not call!24038))))

(declare-fun b!254817 () Bool)

(declare-fun get!3038 (ValueCell!2933 V!8385) V!8385)

(declare-fun dynLambda!590 (Int (_ BitVec 64)) V!8385)

(assert (=> b!254817 (= e!165164 (= (apply!247 lt!127764 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000)) (get!3038 (select (arr!5893 (_values!4679 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4696 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!254817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6240 (_values!4679 thiss!1504))))))

(assert (=> b!254817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun b!254818 () Bool)

(assert (=> b!254818 (= e!165172 e!165160)))

(declare-fun res!124718 () Bool)

(assert (=> b!254818 (= res!124718 call!24038)))

(assert (=> b!254818 (=> (not res!124718) (not e!165160))))

(declare-fun b!254819 () Bool)

(assert (=> b!254819 (= e!165169 (+!674 call!24040 (tuple2!4805 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4537 thiss!1504))))))

(declare-fun bm!24036 () Bool)

(assert (=> bm!24036 (= call!24035 call!24040)))

(declare-fun b!254820 () Bool)

(assert (=> b!254820 (= e!165161 call!24035)))

(declare-fun b!254821 () Bool)

(declare-fun Unit!7878 () Unit!7864)

(assert (=> b!254821 (= e!165168 Unit!7878)))

(declare-fun bm!24037 () Bool)

(assert (=> bm!24037 (= call!24034 (getCurrentListMapNoExtraKeys!563 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun b!254822 () Bool)

(assert (=> b!254822 (= e!165165 e!165171)))

(declare-fun res!124720 () Bool)

(assert (=> b!254822 (= res!124720 call!24036)))

(assert (=> b!254822 (=> (not res!124720) (not e!165171))))

(assert (= (and d!61563 c!42994) b!254819))

(assert (= (and d!61563 (not c!42994)) b!254804))

(assert (= (and b!254804 c!42991) b!254820))

(assert (= (and b!254804 (not c!42991)) b!254813))

(assert (= (and b!254813 c!42992) b!254812))

(assert (= (and b!254813 (not c!42992)) b!254810))

(assert (= (or b!254812 b!254810) bm!24034))

(assert (= (or b!254820 bm!24034) bm!24032))

(assert (= (or b!254820 b!254812) bm!24036))

(assert (= (or b!254819 bm!24032) bm!24037))

(assert (= (or b!254819 bm!24036) bm!24035))

(assert (= (and d!61563 res!124721) b!254805))

(assert (= (and d!61563 c!42993) b!254809))

(assert (= (and d!61563 (not c!42993)) b!254821))

(assert (= (and d!61563 res!124715) b!254802))

(assert (= (and b!254802 res!124719) b!254803))

(assert (= (and b!254802 (not res!124717)) b!254808))

(assert (= (and b!254808 res!124716) b!254817))

(assert (= (and b!254802 res!124722) b!254814))

(assert (= (and b!254814 c!42995) b!254822))

(assert (= (and b!254814 (not c!42995)) b!254815))

(assert (= (and b!254822 res!124720) b!254806))

(assert (= (or b!254822 b!254815) bm!24033))

(assert (= (and b!254814 res!124714) b!254811))

(assert (= (and b!254811 c!42996) b!254818))

(assert (= (and b!254811 (not c!42996)) b!254816))

(assert (= (and b!254818 res!124718) b!254807))

(assert (= (or b!254818 b!254816) bm!24031))

(declare-fun b_lambda!8153 () Bool)

(assert (=> (not b_lambda!8153) (not b!254817)))

(declare-fun t!8728 () Bool)

(declare-fun tb!2999 () Bool)

(assert (=> (and b!254622 (= (defaultEntry!4696 thiss!1504) (defaultEntry!4696 thiss!1504)) t!8728) tb!2999))

(declare-fun result!5335 () Bool)

(assert (=> tb!2999 (= result!5335 tp_is_empty!6553)))

(assert (=> b!254817 t!8728))

(declare-fun b_and!13753 () Bool)

(assert (= b_and!13747 (and (=> t!8728 result!5335) b_and!13753)))

(declare-fun m!270457 () Bool)

(assert (=> b!254809 m!270457))

(declare-fun m!270459 () Bool)

(assert (=> b!254809 m!270459))

(declare-fun m!270461 () Bool)

(assert (=> b!254809 m!270461))

(declare-fun m!270463 () Bool)

(assert (=> b!254809 m!270463))

(declare-fun m!270465 () Bool)

(assert (=> b!254809 m!270465))

(declare-fun m!270467 () Bool)

(assert (=> b!254809 m!270467))

(declare-fun m!270469 () Bool)

(assert (=> b!254809 m!270469))

(declare-fun m!270471 () Bool)

(assert (=> b!254809 m!270471))

(declare-fun m!270473 () Bool)

(assert (=> b!254809 m!270473))

(declare-fun m!270475 () Bool)

(assert (=> b!254809 m!270475))

(declare-fun m!270477 () Bool)

(assert (=> b!254809 m!270477))

(assert (=> b!254809 m!270471))

(declare-fun m!270479 () Bool)

(assert (=> b!254809 m!270479))

(assert (=> b!254809 m!270475))

(declare-fun m!270481 () Bool)

(assert (=> b!254809 m!270481))

(declare-fun m!270483 () Bool)

(assert (=> b!254809 m!270483))

(declare-fun m!270485 () Bool)

(assert (=> b!254809 m!270485))

(assert (=> b!254809 m!270483))

(declare-fun m!270487 () Bool)

(assert (=> b!254809 m!270487))

(assert (=> b!254809 m!270467))

(declare-fun m!270489 () Bool)

(assert (=> b!254809 m!270489))

(assert (=> b!254808 m!270473))

(assert (=> b!254808 m!270473))

(declare-fun m!270491 () Bool)

(assert (=> b!254808 m!270491))

(assert (=> b!254803 m!270473))

(assert (=> b!254803 m!270473))

(declare-fun m!270493 () Bool)

(assert (=> b!254803 m!270493))

(declare-fun m!270495 () Bool)

(assert (=> b!254807 m!270495))

(declare-fun m!270497 () Bool)

(assert (=> d!61563 m!270497))

(declare-fun m!270499 () Bool)

(assert (=> b!254806 m!270499))

(declare-fun m!270501 () Bool)

(assert (=> bm!24035 m!270501))

(assert (=> b!254805 m!270473))

(assert (=> b!254805 m!270473))

(assert (=> b!254805 m!270493))

(assert (=> bm!24037 m!270477))

(declare-fun m!270503 () Bool)

(assert (=> bm!24031 m!270503))

(declare-fun m!270505 () Bool)

(assert (=> b!254819 m!270505))

(declare-fun m!270507 () Bool)

(assert (=> b!254817 m!270507))

(assert (=> b!254817 m!270507))

(declare-fun m!270509 () Bool)

(assert (=> b!254817 m!270509))

(declare-fun m!270511 () Bool)

(assert (=> b!254817 m!270511))

(assert (=> b!254817 m!270473))

(assert (=> b!254817 m!270473))

(declare-fun m!270513 () Bool)

(assert (=> b!254817 m!270513))

(assert (=> b!254817 m!270509))

(declare-fun m!270515 () Bool)

(assert (=> bm!24033 m!270515))

(assert (=> b!254629 d!61563))

(declare-fun d!61565 () Bool)

(declare-fun e!165175 () Bool)

(assert (=> d!61565 e!165175))

(declare-fun res!124727 () Bool)

(assert (=> d!61565 (=> (not res!124727) (not e!165175))))

(declare-fun lt!127782 () SeekEntryResult!1117)

(assert (=> d!61565 (= res!124727 ((_ is Found!1117) lt!127782))))

(assert (=> d!61565 (= lt!127782 (seekEntryOrOpen!0 key!932 (_keys!6850 thiss!1504) (mask!10944 thiss!1504)))))

(declare-fun lt!127783 () Unit!7864)

(declare-fun choose!1219 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7864)

(assert (=> d!61565 (= lt!127783 (choose!1219 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(assert (=> d!61565 (validMask!0 (mask!10944 thiss!1504))))

(assert (=> d!61565 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!413 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)) lt!127783)))

(declare-fun b!254829 () Bool)

(declare-fun res!124728 () Bool)

(assert (=> b!254829 (=> (not res!124728) (not e!165175))))

(assert (=> b!254829 (= res!124728 (inRange!0 (index!6639 lt!127782) (mask!10944 thiss!1504)))))

(declare-fun b!254830 () Bool)

(assert (=> b!254830 (= e!165175 (= (select (arr!5894 (_keys!6850 thiss!1504)) (index!6639 lt!127782)) key!932))))

(assert (=> b!254830 (and (bvsge (index!6639 lt!127782) #b00000000000000000000000000000000) (bvslt (index!6639 lt!127782) (size!6241 (_keys!6850 thiss!1504))))))

(assert (= (and d!61565 res!124727) b!254829))

(assert (= (and b!254829 res!124728) b!254830))

(assert (=> d!61565 m!270287))

(declare-fun m!270517 () Bool)

(assert (=> d!61565 m!270517))

(assert (=> d!61565 m!270497))

(declare-fun m!270519 () Bool)

(assert (=> b!254829 m!270519))

(declare-fun m!270521 () Bool)

(assert (=> b!254830 m!270521))

(assert (=> b!254613 d!61565))

(declare-fun b!254847 () Bool)

(declare-fun e!165187 () Bool)

(declare-fun e!165184 () Bool)

(assert (=> b!254847 (= e!165187 e!165184)))

(declare-fun c!43001 () Bool)

(declare-fun lt!127788 () SeekEntryResult!1117)

(assert (=> b!254847 (= c!43001 ((_ is MissingVacant!1117) lt!127788))))

(declare-fun b!254848 () Bool)

(declare-fun e!165186 () Bool)

(declare-fun call!24046 () Bool)

(assert (=> b!254848 (= e!165186 (not call!24046))))

(declare-fun call!24045 () Bool)

(declare-fun bm!24042 () Bool)

(declare-fun c!43002 () Bool)

(assert (=> bm!24042 (= call!24045 (inRange!0 (ite c!43002 (index!6638 lt!127788) (index!6641 lt!127788)) (mask!10944 thiss!1504)))))

(declare-fun b!254849 () Bool)

(assert (=> b!254849 (and (bvsge (index!6638 lt!127788) #b00000000000000000000000000000000) (bvslt (index!6638 lt!127788) (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun res!124738 () Bool)

(assert (=> b!254849 (= res!124738 (= (select (arr!5894 (_keys!6850 thiss!1504)) (index!6638 lt!127788)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165185 () Bool)

(assert (=> b!254849 (=> (not res!124738) (not e!165185))))

(declare-fun b!254850 () Bool)

(assert (=> b!254850 (= e!165185 (not call!24046))))

(declare-fun b!254851 () Bool)

(assert (=> b!254851 (= e!165184 ((_ is Undefined!1117) lt!127788))))

(declare-fun d!61567 () Bool)

(assert (=> d!61567 e!165187))

(assert (=> d!61567 (= c!43002 ((_ is MissingZero!1117) lt!127788))))

(assert (=> d!61567 (= lt!127788 (seekEntryOrOpen!0 key!932 (_keys!6850 thiss!1504) (mask!10944 thiss!1504)))))

(declare-fun lt!127789 () Unit!7864)

(declare-fun choose!1220 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) Int) Unit!7864)

(assert (=> d!61567 (= lt!127789 (choose!1220 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)))))

(assert (=> d!61567 (validMask!0 (mask!10944 thiss!1504))))

(assert (=> d!61567 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!407 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 (defaultEntry!4696 thiss!1504)) lt!127789)))

(declare-fun bm!24043 () Bool)

(assert (=> bm!24043 (= call!24046 (arrayContainsKey!0 (_keys!6850 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254852 () Bool)

(declare-fun res!124740 () Bool)

(assert (=> b!254852 (=> (not res!124740) (not e!165186))))

(assert (=> b!254852 (= res!124740 call!24045)))

(assert (=> b!254852 (= e!165184 e!165186)))

(declare-fun b!254853 () Bool)

(declare-fun res!124737 () Bool)

(assert (=> b!254853 (=> (not res!124737) (not e!165186))))

(assert (=> b!254853 (= res!124737 (= (select (arr!5894 (_keys!6850 thiss!1504)) (index!6641 lt!127788)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254853 (and (bvsge (index!6641 lt!127788) #b00000000000000000000000000000000) (bvslt (index!6641 lt!127788) (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun b!254854 () Bool)

(assert (=> b!254854 (= e!165187 e!165185)))

(declare-fun res!124739 () Bool)

(assert (=> b!254854 (= res!124739 call!24045)))

(assert (=> b!254854 (=> (not res!124739) (not e!165185))))

(assert (= (and d!61567 c!43002) b!254854))

(assert (= (and d!61567 (not c!43002)) b!254847))

(assert (= (and b!254854 res!124739) b!254849))

(assert (= (and b!254849 res!124738) b!254850))

(assert (= (and b!254847 c!43001) b!254852))

(assert (= (and b!254847 (not c!43001)) b!254851))

(assert (= (and b!254852 res!124740) b!254853))

(assert (= (and b!254853 res!124737) b!254848))

(assert (= (or b!254854 b!254852) bm!24042))

(assert (= (or b!254850 b!254848) bm!24043))

(declare-fun m!270523 () Bool)

(assert (=> bm!24042 m!270523))

(assert (=> d!61567 m!270287))

(declare-fun m!270525 () Bool)

(assert (=> d!61567 m!270525))

(assert (=> d!61567 m!270497))

(assert (=> bm!24043 m!270289))

(declare-fun m!270527 () Bool)

(assert (=> b!254849 m!270527))

(declare-fun m!270529 () Bool)

(assert (=> b!254853 m!270529))

(assert (=> b!254630 d!61567))

(declare-fun d!61569 () Bool)

(declare-fun res!124745 () Bool)

(declare-fun e!165192 () Bool)

(assert (=> d!61569 (=> res!124745 e!165192)))

(assert (=> d!61569 (= res!124745 (= (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61569 (= (arrayContainsKey!0 (_keys!6850 thiss!1504) key!932 #b00000000000000000000000000000000) e!165192)))

(declare-fun b!254859 () Bool)

(declare-fun e!165193 () Bool)

(assert (=> b!254859 (= e!165192 e!165193)))

(declare-fun res!124746 () Bool)

(assert (=> b!254859 (=> (not res!124746) (not e!165193))))

(assert (=> b!254859 (= res!124746 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun b!254860 () Bool)

(assert (=> b!254860 (= e!165193 (arrayContainsKey!0 (_keys!6850 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61569 (not res!124745)) b!254859))

(assert (= (and b!254859 res!124746) b!254860))

(assert (=> d!61569 m!270473))

(declare-fun m!270531 () Bool)

(assert (=> b!254860 m!270531))

(assert (=> bm!24003 d!61569))

(declare-fun b!254873 () Bool)

(declare-fun lt!127797 () SeekEntryResult!1117)

(declare-fun e!165202 () SeekEntryResult!1117)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12437 (_ BitVec 32)) SeekEntryResult!1117)

(assert (=> b!254873 (= e!165202 (seekKeyOrZeroReturnVacant!0 (x!24841 lt!127797) (index!6640 lt!127797) (index!6640 lt!127797) key!932 (_keys!6850 thiss!1504) (mask!10944 thiss!1504)))))

(declare-fun b!254874 () Bool)

(declare-fun e!165201 () SeekEntryResult!1117)

(assert (=> b!254874 (= e!165201 Undefined!1117)))

(declare-fun b!254875 () Bool)

(declare-fun e!165200 () SeekEntryResult!1117)

(assert (=> b!254875 (= e!165200 (Found!1117 (index!6640 lt!127797)))))

(declare-fun d!61571 () Bool)

(declare-fun lt!127796 () SeekEntryResult!1117)

(assert (=> d!61571 (and (or ((_ is Undefined!1117) lt!127796) (not ((_ is Found!1117) lt!127796)) (and (bvsge (index!6639 lt!127796) #b00000000000000000000000000000000) (bvslt (index!6639 lt!127796) (size!6241 (_keys!6850 thiss!1504))))) (or ((_ is Undefined!1117) lt!127796) ((_ is Found!1117) lt!127796) (not ((_ is MissingZero!1117) lt!127796)) (and (bvsge (index!6638 lt!127796) #b00000000000000000000000000000000) (bvslt (index!6638 lt!127796) (size!6241 (_keys!6850 thiss!1504))))) (or ((_ is Undefined!1117) lt!127796) ((_ is Found!1117) lt!127796) ((_ is MissingZero!1117) lt!127796) (not ((_ is MissingVacant!1117) lt!127796)) (and (bvsge (index!6641 lt!127796) #b00000000000000000000000000000000) (bvslt (index!6641 lt!127796) (size!6241 (_keys!6850 thiss!1504))))) (or ((_ is Undefined!1117) lt!127796) (ite ((_ is Found!1117) lt!127796) (= (select (arr!5894 (_keys!6850 thiss!1504)) (index!6639 lt!127796)) key!932) (ite ((_ is MissingZero!1117) lt!127796) (= (select (arr!5894 (_keys!6850 thiss!1504)) (index!6638 lt!127796)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1117) lt!127796) (= (select (arr!5894 (_keys!6850 thiss!1504)) (index!6641 lt!127796)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61571 (= lt!127796 e!165201)))

(declare-fun c!43010 () Bool)

(assert (=> d!61571 (= c!43010 (and ((_ is Intermediate!1117) lt!127797) (undefined!1929 lt!127797)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12437 (_ BitVec 32)) SeekEntryResult!1117)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61571 (= lt!127797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10944 thiss!1504)) key!932 (_keys!6850 thiss!1504) (mask!10944 thiss!1504)))))

(assert (=> d!61571 (validMask!0 (mask!10944 thiss!1504))))

(assert (=> d!61571 (= (seekEntryOrOpen!0 key!932 (_keys!6850 thiss!1504) (mask!10944 thiss!1504)) lt!127796)))

(declare-fun b!254876 () Bool)

(assert (=> b!254876 (= e!165201 e!165200)))

(declare-fun lt!127798 () (_ BitVec 64))

(assert (=> b!254876 (= lt!127798 (select (arr!5894 (_keys!6850 thiss!1504)) (index!6640 lt!127797)))))

(declare-fun c!43011 () Bool)

(assert (=> b!254876 (= c!43011 (= lt!127798 key!932))))

(declare-fun b!254877 () Bool)

(declare-fun c!43009 () Bool)

(assert (=> b!254877 (= c!43009 (= lt!127798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254877 (= e!165200 e!165202)))

(declare-fun b!254878 () Bool)

(assert (=> b!254878 (= e!165202 (MissingZero!1117 (index!6640 lt!127797)))))

(assert (= (and d!61571 c!43010) b!254874))

(assert (= (and d!61571 (not c!43010)) b!254876))

(assert (= (and b!254876 c!43011) b!254875))

(assert (= (and b!254876 (not c!43011)) b!254877))

(assert (= (and b!254877 c!43009) b!254878))

(assert (= (and b!254877 (not c!43009)) b!254873))

(declare-fun m!270533 () Bool)

(assert (=> b!254873 m!270533))

(declare-fun m!270535 () Bool)

(assert (=> d!61571 m!270535))

(declare-fun m!270537 () Bool)

(assert (=> d!61571 m!270537))

(declare-fun m!270539 () Bool)

(assert (=> d!61571 m!270539))

(assert (=> d!61571 m!270497))

(declare-fun m!270541 () Bool)

(assert (=> d!61571 m!270541))

(assert (=> d!61571 m!270539))

(declare-fun m!270543 () Bool)

(assert (=> d!61571 m!270543))

(declare-fun m!270545 () Bool)

(assert (=> b!254876 m!270545))

(assert (=> b!254617 d!61571))

(declare-fun d!61573 () Bool)

(assert (=> d!61573 (contains!1821 (getCurrentListMap!1407 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) key!932)))

(declare-fun lt!127801 () Unit!7864)

(declare-fun choose!1221 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 64) (_ BitVec 32) Int) Unit!7864)

(assert (=> d!61573 (= lt!127801 (choose!1221 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(assert (=> d!61573 (validMask!0 (mask!10944 thiss!1504))))

(assert (=> d!61573 (= (lemmaArrayContainsKeyThenInListMap!231 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) lt!127801)))

(declare-fun bs!9074 () Bool)

(assert (= bs!9074 d!61573))

(assert (=> bs!9074 m!270339))

(assert (=> bs!9074 m!270339))

(declare-fun m!270547 () Bool)

(assert (=> bs!9074 m!270547))

(declare-fun m!270549 () Bool)

(assert (=> bs!9074 m!270549))

(assert (=> bs!9074 m!270497))

(assert (=> b!254621 d!61573))

(declare-fun d!61575 () Bool)

(declare-fun res!124753 () Bool)

(declare-fun e!165205 () Bool)

(assert (=> d!61575 (=> (not res!124753) (not e!165205))))

(declare-fun simpleValid!270 (LongMapFixedSize!3766) Bool)

(assert (=> d!61575 (= res!124753 (simpleValid!270 thiss!1504))))

(assert (=> d!61575 (= (valid!1478 thiss!1504) e!165205)))

(declare-fun b!254885 () Bool)

(declare-fun res!124754 () Bool)

(assert (=> b!254885 (=> (not res!124754) (not e!165205))))

(assert (=> b!254885 (= res!124754 (= (arrayCountValidKeys!0 (_keys!6850 thiss!1504) #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) (_size!1932 thiss!1504)))))

(declare-fun b!254886 () Bool)

(declare-fun res!124755 () Bool)

(assert (=> b!254886 (=> (not res!124755) (not e!165205))))

(assert (=> b!254886 (= res!124755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6850 thiss!1504) (mask!10944 thiss!1504)))))

(declare-fun b!254887 () Bool)

(assert (=> b!254887 (= e!165205 (arrayNoDuplicates!0 (_keys!6850 thiss!1504) #b00000000000000000000000000000000 Nil!3682))))

(assert (= (and d!61575 res!124753) b!254885))

(assert (= (and b!254885 res!124754) b!254886))

(assert (= (and b!254886 res!124755) b!254887))

(declare-fun m!270551 () Bool)

(assert (=> d!61575 m!270551))

(assert (=> b!254885 m!270327))

(declare-fun m!270553 () Bool)

(assert (=> b!254886 m!270553))

(declare-fun m!270555 () Bool)

(assert (=> b!254887 m!270555))

(assert (=> start!24294 d!61575))

(declare-fun d!61577 () Bool)

(assert (=> d!61577 (= (array_inv!3877 (_keys!6850 thiss!1504)) (bvsge (size!6241 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254622 d!61577))

(declare-fun d!61579 () Bool)

(assert (=> d!61579 (= (array_inv!3878 (_values!4679 thiss!1504)) (bvsge (size!6240 (_values!4679 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!254622 d!61579))

(declare-fun d!61581 () Bool)

(assert (=> d!61581 (= (inRange!0 (ite c!42951 (index!6638 lt!127626) (index!6641 lt!127626)) (mask!10944 thiss!1504)) (and (bvsge (ite c!42951 (index!6638 lt!127626) (index!6641 lt!127626)) #b00000000000000000000000000000000) (bvslt (ite c!42951 (index!6638 lt!127626) (index!6641 lt!127626)) (bvadd (mask!10944 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24004 d!61581))

(declare-fun b!254896 () Bool)

(declare-fun e!165212 () Bool)

(declare-fun call!24049 () Bool)

(assert (=> b!254896 (= e!165212 call!24049)))

(declare-fun d!61583 () Bool)

(declare-fun res!124761 () Bool)

(declare-fun e!165214 () Bool)

(assert (=> d!61583 (=> res!124761 e!165214)))

(assert (=> d!61583 (= res!124761 (bvsge #b00000000000000000000000000000000 (size!6241 lt!127624)))))

(assert (=> d!61583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127624 (mask!10944 thiss!1504)) e!165214)))

(declare-fun b!254897 () Bool)

(declare-fun e!165213 () Bool)

(assert (=> b!254897 (= e!165213 call!24049)))

(declare-fun bm!24046 () Bool)

(assert (=> bm!24046 (= call!24049 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!127624 (mask!10944 thiss!1504)))))

(declare-fun b!254898 () Bool)

(assert (=> b!254898 (= e!165212 e!165213)))

(declare-fun lt!127809 () (_ BitVec 64))

(assert (=> b!254898 (= lt!127809 (select (arr!5894 lt!127624) #b00000000000000000000000000000000))))

(declare-fun lt!127810 () Unit!7864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12437 (_ BitVec 64) (_ BitVec 32)) Unit!7864)

(assert (=> b!254898 (= lt!127810 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!127624 lt!127809 #b00000000000000000000000000000000))))

(assert (=> b!254898 (arrayContainsKey!0 lt!127624 lt!127809 #b00000000000000000000000000000000)))

(declare-fun lt!127808 () Unit!7864)

(assert (=> b!254898 (= lt!127808 lt!127810)))

(declare-fun res!124760 () Bool)

(assert (=> b!254898 (= res!124760 (= (seekEntryOrOpen!0 (select (arr!5894 lt!127624) #b00000000000000000000000000000000) lt!127624 (mask!10944 thiss!1504)) (Found!1117 #b00000000000000000000000000000000)))))

(assert (=> b!254898 (=> (not res!124760) (not e!165213))))

(declare-fun b!254899 () Bool)

(assert (=> b!254899 (= e!165214 e!165212)))

(declare-fun c!43014 () Bool)

(assert (=> b!254899 (= c!43014 (validKeyInArray!0 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)))))

(assert (= (and d!61583 (not res!124761)) b!254899))

(assert (= (and b!254899 c!43014) b!254898))

(assert (= (and b!254899 (not c!43014)) b!254896))

(assert (= (and b!254898 res!124760) b!254897))

(assert (= (or b!254897 b!254896) bm!24046))

(declare-fun m!270557 () Bool)

(assert (=> bm!24046 m!270557))

(declare-fun m!270559 () Bool)

(assert (=> b!254898 m!270559))

(declare-fun m!270561 () Bool)

(assert (=> b!254898 m!270561))

(declare-fun m!270563 () Bool)

(assert (=> b!254898 m!270563))

(assert (=> b!254898 m!270559))

(declare-fun m!270565 () Bool)

(assert (=> b!254898 m!270565))

(assert (=> b!254899 m!270559))

(assert (=> b!254899 m!270559))

(declare-fun m!270567 () Bool)

(assert (=> b!254899 m!270567))

(assert (=> b!254614 d!61583))

(declare-fun b!254910 () Bool)

(declare-fun e!165220 () Bool)

(assert (=> b!254910 (= e!165220 (bvslt (size!6241 (_keys!6850 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!254909 () Bool)

(declare-fun res!124772 () Bool)

(assert (=> b!254909 (=> (not res!124772) (not e!165220))))

(assert (=> b!254909 (= res!124772 (validKeyInArray!0 key!932))))

(declare-fun b!254908 () Bool)

(declare-fun res!124770 () Bool)

(assert (=> b!254908 (=> (not res!124770) (not e!165220))))

(assert (=> b!254908 (= res!124770 (not (validKeyInArray!0 (select (arr!5894 (_keys!6850 thiss!1504)) index!297))))))

(declare-fun d!61585 () Bool)

(declare-fun e!165219 () Bool)

(assert (=> d!61585 e!165219))

(declare-fun res!124773 () Bool)

(assert (=> d!61585 (=> (not res!124773) (not e!165219))))

(assert (=> d!61585 (= res!124773 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6241 (_keys!6850 thiss!1504)))))))

(declare-fun lt!127813 () Unit!7864)

(declare-fun choose!1 (array!12437 (_ BitVec 32) (_ BitVec 64)) Unit!7864)

(assert (=> d!61585 (= lt!127813 (choose!1 (_keys!6850 thiss!1504) index!297 key!932))))

(assert (=> d!61585 e!165220))

(declare-fun res!124771 () Bool)

(assert (=> d!61585 (=> (not res!124771) (not e!165220))))

(assert (=> d!61585 (= res!124771 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6241 (_keys!6850 thiss!1504)))))))

(assert (=> d!61585 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6850 thiss!1504) index!297 key!932) lt!127813)))

(declare-fun b!254911 () Bool)

(assert (=> b!254911 (= e!165219 (= (arrayCountValidKeys!0 (array!12438 (store (arr!5894 (_keys!6850 thiss!1504)) index!297 key!932) (size!6241 (_keys!6850 thiss!1504))) #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6850 thiss!1504) #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!61585 res!124771) b!254908))

(assert (= (and b!254908 res!124770) b!254909))

(assert (= (and b!254909 res!124772) b!254910))

(assert (= (and d!61585 res!124773) b!254911))

(declare-fun m!270569 () Bool)

(assert (=> b!254909 m!270569))

(declare-fun m!270571 () Bool)

(assert (=> b!254908 m!270571))

(assert (=> b!254908 m!270571))

(declare-fun m!270573 () Bool)

(assert (=> b!254908 m!270573))

(declare-fun m!270575 () Bool)

(assert (=> d!61585 m!270575))

(assert (=> b!254911 m!270325))

(declare-fun m!270577 () Bool)

(assert (=> b!254911 m!270577))

(assert (=> b!254911 m!270327))

(assert (=> b!254614 d!61585))

(declare-fun bm!24049 () Bool)

(declare-fun call!24052 () (_ BitVec 32))

(assert (=> bm!24049 (= call!24052 (arrayCountValidKeys!0 (_keys!6850 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun d!61587 () Bool)

(declare-fun lt!127816 () (_ BitVec 32))

(assert (=> d!61587 (and (bvsge lt!127816 #b00000000000000000000000000000000) (bvsle lt!127816 (bvsub (size!6241 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!165225 () (_ BitVec 32))

(assert (=> d!61587 (= lt!127816 e!165225)))

(declare-fun c!43020 () Bool)

(assert (=> d!61587 (= c!43020 (bvsge #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))))))

(assert (=> d!61587 (and (bvsle #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6241 (_keys!6850 thiss!1504)) (size!6241 (_keys!6850 thiss!1504))))))

(assert (=> d!61587 (= (arrayCountValidKeys!0 (_keys!6850 thiss!1504) #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) lt!127816)))

(declare-fun b!254920 () Bool)

(assert (=> b!254920 (= e!165225 #b00000000000000000000000000000000)))

(declare-fun b!254921 () Bool)

(declare-fun e!165226 () (_ BitVec 32))

(assert (=> b!254921 (= e!165226 call!24052)))

(declare-fun b!254922 () Bool)

(assert (=> b!254922 (= e!165226 (bvadd #b00000000000000000000000000000001 call!24052))))

(declare-fun b!254923 () Bool)

(assert (=> b!254923 (= e!165225 e!165226)))

(declare-fun c!43019 () Bool)

(assert (=> b!254923 (= c!43019 (validKeyInArray!0 (select (arr!5894 (_keys!6850 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61587 c!43020) b!254920))

(assert (= (and d!61587 (not c!43020)) b!254923))

(assert (= (and b!254923 c!43019) b!254922))

(assert (= (and b!254923 (not c!43019)) b!254921))

(assert (= (or b!254922 b!254921) bm!24049))

(declare-fun m!270579 () Bool)

(assert (=> bm!24049 m!270579))

(assert (=> b!254923 m!270473))

(assert (=> b!254923 m!270473))

(assert (=> b!254923 m!270493))

(assert (=> b!254614 d!61587))

(declare-fun d!61589 () Bool)

(declare-fun e!165229 () Bool)

(assert (=> d!61589 e!165229))

(declare-fun res!124776 () Bool)

(assert (=> d!61589 (=> (not res!124776) (not e!165229))))

(assert (=> d!61589 (= res!124776 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6241 (_keys!6850 thiss!1504))) (bvslt index!297 (size!6240 (_values!4679 thiss!1504)))))))

(declare-fun lt!127819 () Unit!7864)

(declare-fun choose!1222 (array!12437 array!12435 (_ BitVec 32) (_ BitVec 32) V!8385 V!8385 (_ BitVec 32) (_ BitVec 64) V!8385 Int) Unit!7864)

(assert (=> d!61589 (= lt!127819 (choose!1222 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) index!297 key!932 v!346 (defaultEntry!4696 thiss!1504)))))

(assert (=> d!61589 (validMask!0 (mask!10944 thiss!1504))))

(assert (=> d!61589 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!89 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) index!297 key!932 v!346 (defaultEntry!4696 thiss!1504)) lt!127819)))

(declare-fun b!254926 () Bool)

(assert (=> b!254926 (= e!165229 (= (+!674 (getCurrentListMap!1407 (_keys!6850 thiss!1504) (_values!4679 thiss!1504) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) (tuple2!4805 key!932 v!346)) (getCurrentListMap!1407 (array!12438 (store (arr!5894 (_keys!6850 thiss!1504)) index!297 key!932) (size!6241 (_keys!6850 thiss!1504))) (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504))))))

(assert (= (and d!61589 res!124776) b!254926))

(declare-fun m!270581 () Bool)

(assert (=> d!61589 m!270581))

(assert (=> d!61589 m!270497))

(assert (=> b!254926 m!270339))

(assert (=> b!254926 m!270339))

(declare-fun m!270583 () Bool)

(assert (=> b!254926 m!270583))

(declare-fun m!270585 () Bool)

(assert (=> b!254926 m!270585))

(assert (=> b!254926 m!270315))

(assert (=> b!254926 m!270325))

(assert (=> b!254614 d!61589))

(declare-fun b!254927 () Bool)

(declare-fun res!124785 () Bool)

(declare-fun e!165233 () Bool)

(assert (=> b!254927 (=> (not res!124785) (not e!165233))))

(declare-fun e!165232 () Bool)

(assert (=> b!254927 (= res!124785 e!165232)))

(declare-fun res!124780 () Bool)

(assert (=> b!254927 (=> res!124780 e!165232)))

(declare-fun e!165236 () Bool)

(assert (=> b!254927 (= res!124780 (not e!165236))))

(declare-fun res!124782 () Bool)

(assert (=> b!254927 (=> (not res!124782) (not e!165236))))

(assert (=> b!254927 (= res!124782 (bvslt #b00000000000000000000000000000000 (size!6241 lt!127624)))))

(declare-fun b!254928 () Bool)

(assert (=> b!254928 (= e!165236 (validKeyInArray!0 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)))))

(declare-fun b!254929 () Bool)

(declare-fun e!165239 () ListLongMap!3719)

(declare-fun e!165231 () ListLongMap!3719)

(assert (=> b!254929 (= e!165239 e!165231)))

(declare-fun c!43021 () Bool)

(assert (=> b!254929 (= c!43021 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!254930 () Bool)

(declare-fun e!165240 () Bool)

(assert (=> b!254930 (= e!165240 (validKeyInArray!0 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)))))

(declare-fun b!254931 () Bool)

(declare-fun e!165241 () Bool)

(declare-fun lt!127828 () ListLongMap!3719)

(assert (=> b!254931 (= e!165241 (= (apply!247 lt!127828 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4537 thiss!1504)))))

(declare-fun bm!24050 () Bool)

(declare-fun call!24057 () Bool)

(assert (=> bm!24050 (= call!24057 (contains!1821 lt!127828 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254932 () Bool)

(declare-fun e!165230 () Bool)

(assert (=> b!254932 (= e!165230 (= (apply!247 lt!127828 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4537 thiss!1504)))))

(declare-fun b!254933 () Bool)

(declare-fun e!165234 () Bool)

(assert (=> b!254933 (= e!165232 e!165234)))

(declare-fun res!124779 () Bool)

(assert (=> b!254933 (=> (not res!124779) (not e!165234))))

(assert (=> b!254933 (= res!124779 (contains!1821 lt!127828 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)))))

(assert (=> b!254933 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6241 lt!127624)))))

(declare-fun bm!24051 () Bool)

(declare-fun call!24056 () ListLongMap!3719)

(declare-fun call!24053 () ListLongMap!3719)

(assert (=> bm!24051 (= call!24056 call!24053)))

(declare-fun bm!24052 () Bool)

(declare-fun call!24055 () Bool)

(assert (=> bm!24052 (= call!24055 (contains!1821 lt!127828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254934 () Bool)

(declare-fun e!165238 () Unit!7864)

(declare-fun lt!127834 () Unit!7864)

(assert (=> b!254934 (= e!165238 lt!127834)))

(declare-fun lt!127838 () ListLongMap!3719)

(assert (=> b!254934 (= lt!127838 (getCurrentListMapNoExtraKeys!563 lt!127624 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127835 () (_ BitVec 64))

(assert (=> b!254934 (= lt!127835 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127826 () (_ BitVec 64))

(assert (=> b!254934 (= lt!127826 (select (arr!5894 lt!127624) #b00000000000000000000000000000000))))

(declare-fun lt!127841 () Unit!7864)

(assert (=> b!254934 (= lt!127841 (addStillContains!223 lt!127838 lt!127835 (zeroValue!4537 thiss!1504) lt!127826))))

(assert (=> b!254934 (contains!1821 (+!674 lt!127838 (tuple2!4805 lt!127835 (zeroValue!4537 thiss!1504))) lt!127826)))

(declare-fun lt!127839 () Unit!7864)

(assert (=> b!254934 (= lt!127839 lt!127841)))

(declare-fun lt!127832 () ListLongMap!3719)

(assert (=> b!254934 (= lt!127832 (getCurrentListMapNoExtraKeys!563 lt!127624 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127831 () (_ BitVec 64))

(assert (=> b!254934 (= lt!127831 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127824 () (_ BitVec 64))

(assert (=> b!254934 (= lt!127824 (select (arr!5894 lt!127624) #b00000000000000000000000000000000))))

(declare-fun lt!127833 () Unit!7864)

(assert (=> b!254934 (= lt!127833 (addApplyDifferent!223 lt!127832 lt!127831 (minValue!4537 thiss!1504) lt!127824))))

(assert (=> b!254934 (= (apply!247 (+!674 lt!127832 (tuple2!4805 lt!127831 (minValue!4537 thiss!1504))) lt!127824) (apply!247 lt!127832 lt!127824))))

(declare-fun lt!127822 () Unit!7864)

(assert (=> b!254934 (= lt!127822 lt!127833)))

(declare-fun lt!127836 () ListLongMap!3719)

(assert (=> b!254934 (= lt!127836 (getCurrentListMapNoExtraKeys!563 lt!127624 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127823 () (_ BitVec 64))

(assert (=> b!254934 (= lt!127823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127821 () (_ BitVec 64))

(assert (=> b!254934 (= lt!127821 (select (arr!5894 lt!127624) #b00000000000000000000000000000000))))

(declare-fun lt!127825 () Unit!7864)

(assert (=> b!254934 (= lt!127825 (addApplyDifferent!223 lt!127836 lt!127823 (zeroValue!4537 thiss!1504) lt!127821))))

(assert (=> b!254934 (= (apply!247 (+!674 lt!127836 (tuple2!4805 lt!127823 (zeroValue!4537 thiss!1504))) lt!127821) (apply!247 lt!127836 lt!127821))))

(declare-fun lt!127829 () Unit!7864)

(assert (=> b!254934 (= lt!127829 lt!127825)))

(declare-fun lt!127827 () ListLongMap!3719)

(assert (=> b!254934 (= lt!127827 (getCurrentListMapNoExtraKeys!563 lt!127624 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun lt!127820 () (_ BitVec 64))

(assert (=> b!254934 (= lt!127820 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127837 () (_ BitVec 64))

(assert (=> b!254934 (= lt!127837 (select (arr!5894 lt!127624) #b00000000000000000000000000000000))))

(assert (=> b!254934 (= lt!127834 (addApplyDifferent!223 lt!127827 lt!127820 (minValue!4537 thiss!1504) lt!127837))))

(assert (=> b!254934 (= (apply!247 (+!674 lt!127827 (tuple2!4805 lt!127820 (minValue!4537 thiss!1504))) lt!127837) (apply!247 lt!127827 lt!127837))))

(declare-fun b!254935 () Bool)

(declare-fun e!165237 () ListLongMap!3719)

(declare-fun call!24058 () ListLongMap!3719)

(assert (=> b!254935 (= e!165237 call!24058)))

(declare-fun b!254936 () Bool)

(declare-fun e!165242 () Bool)

(assert (=> b!254936 (= e!165233 e!165242)))

(declare-fun c!43026 () Bool)

(assert (=> b!254936 (= c!43026 (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24053 () Bool)

(assert (=> bm!24053 (= call!24058 call!24056)))

(declare-fun d!61591 () Bool)

(assert (=> d!61591 e!165233))

(declare-fun res!124778 () Bool)

(assert (=> d!61591 (=> (not res!124778) (not e!165233))))

(assert (=> d!61591 (= res!124778 (or (bvsge #b00000000000000000000000000000000 (size!6241 lt!127624)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6241 lt!127624)))))))

(declare-fun lt!127830 () ListLongMap!3719)

(assert (=> d!61591 (= lt!127828 lt!127830)))

(declare-fun lt!127840 () Unit!7864)

(assert (=> d!61591 (= lt!127840 e!165238)))

(declare-fun c!43023 () Bool)

(assert (=> d!61591 (= c!43023 e!165240)))

(declare-fun res!124784 () Bool)

(assert (=> d!61591 (=> (not res!124784) (not e!165240))))

(assert (=> d!61591 (= res!124784 (bvslt #b00000000000000000000000000000000 (size!6241 lt!127624)))))

(assert (=> d!61591 (= lt!127830 e!165239)))

(declare-fun c!43024 () Bool)

(assert (=> d!61591 (= c!43024 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61591 (validMask!0 (mask!10944 thiss!1504))))

(assert (=> d!61591 (= (getCurrentListMap!1407 lt!127624 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)) lt!127828)))

(declare-fun b!254937 () Bool)

(declare-fun call!24054 () ListLongMap!3719)

(assert (=> b!254937 (= e!165237 call!24054)))

(declare-fun bm!24054 () Bool)

(declare-fun call!24059 () ListLongMap!3719)

(assert (=> bm!24054 (= call!24059 (+!674 (ite c!43024 call!24053 (ite c!43021 call!24056 call!24058)) (ite (or c!43024 c!43021) (tuple2!4805 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4537 thiss!1504)) (tuple2!4805 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4537 thiss!1504)))))))

(declare-fun b!254938 () Bool)

(declare-fun c!43022 () Bool)

(assert (=> b!254938 (= c!43022 (and (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!254938 (= e!165231 e!165237)))

(declare-fun b!254939 () Bool)

(declare-fun res!124777 () Bool)

(assert (=> b!254939 (=> (not res!124777) (not e!165233))))

(declare-fun e!165235 () Bool)

(assert (=> b!254939 (= res!124777 e!165235)))

(declare-fun c!43025 () Bool)

(assert (=> b!254939 (= c!43025 (not (= (bvand (extraKeys!4433 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!254940 () Bool)

(assert (=> b!254940 (= e!165235 (not call!24055))))

(declare-fun b!254941 () Bool)

(assert (=> b!254941 (= e!165242 (not call!24057))))

(declare-fun b!254942 () Bool)

(assert (=> b!254942 (= e!165234 (= (apply!247 lt!127828 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)) (get!3038 (select (arr!5893 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!590 (defaultEntry!4696 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!254942 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6240 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))))))))

(assert (=> b!254942 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6241 lt!127624)))))

(declare-fun b!254943 () Bool)

(assert (=> b!254943 (= e!165242 e!165230)))

(declare-fun res!124781 () Bool)

(assert (=> b!254943 (= res!124781 call!24057)))

(assert (=> b!254943 (=> (not res!124781) (not e!165230))))

(declare-fun b!254944 () Bool)

(assert (=> b!254944 (= e!165239 (+!674 call!24059 (tuple2!4805 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4537 thiss!1504))))))

(declare-fun bm!24055 () Bool)

(assert (=> bm!24055 (= call!24054 call!24059)))

(declare-fun b!254945 () Bool)

(assert (=> b!254945 (= e!165231 call!24054)))

(declare-fun b!254946 () Bool)

(declare-fun Unit!7879 () Unit!7864)

(assert (=> b!254946 (= e!165238 Unit!7879)))

(declare-fun bm!24056 () Bool)

(assert (=> bm!24056 (= call!24053 (getCurrentListMapNoExtraKeys!563 lt!127624 (array!12436 (store (arr!5893 (_values!4679 thiss!1504)) index!297 (ValueCellFull!2933 v!346)) (size!6240 (_values!4679 thiss!1504))) (mask!10944 thiss!1504) (extraKeys!4433 thiss!1504) (zeroValue!4537 thiss!1504) (minValue!4537 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4696 thiss!1504)))))

(declare-fun b!254947 () Bool)

(assert (=> b!254947 (= e!165235 e!165241)))

(declare-fun res!124783 () Bool)

(assert (=> b!254947 (= res!124783 call!24055)))

(assert (=> b!254947 (=> (not res!124783) (not e!165241))))

(assert (= (and d!61591 c!43024) b!254944))

(assert (= (and d!61591 (not c!43024)) b!254929))

(assert (= (and b!254929 c!43021) b!254945))

(assert (= (and b!254929 (not c!43021)) b!254938))

(assert (= (and b!254938 c!43022) b!254937))

(assert (= (and b!254938 (not c!43022)) b!254935))

(assert (= (or b!254937 b!254935) bm!24053))

(assert (= (or b!254945 bm!24053) bm!24051))

(assert (= (or b!254945 b!254937) bm!24055))

(assert (= (or b!254944 bm!24051) bm!24056))

(assert (= (or b!254944 bm!24055) bm!24054))

(assert (= (and d!61591 res!124784) b!254930))

(assert (= (and d!61591 c!43023) b!254934))

(assert (= (and d!61591 (not c!43023)) b!254946))

(assert (= (and d!61591 res!124778) b!254927))

(assert (= (and b!254927 res!124782) b!254928))

(assert (= (and b!254927 (not res!124780)) b!254933))

(assert (= (and b!254933 res!124779) b!254942))

(assert (= (and b!254927 res!124785) b!254939))

(assert (= (and b!254939 c!43025) b!254947))

(assert (= (and b!254939 (not c!43025)) b!254940))

(assert (= (and b!254947 res!124783) b!254931))

(assert (= (or b!254947 b!254940) bm!24052))

(assert (= (and b!254939 res!124777) b!254936))

(assert (= (and b!254936 c!43026) b!254943))

(assert (= (and b!254936 (not c!43026)) b!254941))

(assert (= (and b!254943 res!124781) b!254932))

(assert (= (or b!254943 b!254941) bm!24050))

(declare-fun b_lambda!8155 () Bool)

(assert (=> (not b_lambda!8155) (not b!254942)))

(assert (=> b!254942 t!8728))

(declare-fun b_and!13755 () Bool)

(assert (= b_and!13753 (and (=> t!8728 result!5335) b_and!13755)))

(declare-fun m!270587 () Bool)

(assert (=> b!254934 m!270587))

(declare-fun m!270589 () Bool)

(assert (=> b!254934 m!270589))

(declare-fun m!270591 () Bool)

(assert (=> b!254934 m!270591))

(declare-fun m!270593 () Bool)

(assert (=> b!254934 m!270593))

(declare-fun m!270595 () Bool)

(assert (=> b!254934 m!270595))

(declare-fun m!270597 () Bool)

(assert (=> b!254934 m!270597))

(declare-fun m!270599 () Bool)

(assert (=> b!254934 m!270599))

(declare-fun m!270601 () Bool)

(assert (=> b!254934 m!270601))

(assert (=> b!254934 m!270559))

(declare-fun m!270603 () Bool)

(assert (=> b!254934 m!270603))

(declare-fun m!270605 () Bool)

(assert (=> b!254934 m!270605))

(assert (=> b!254934 m!270601))

(declare-fun m!270607 () Bool)

(assert (=> b!254934 m!270607))

(assert (=> b!254934 m!270603))

(declare-fun m!270609 () Bool)

(assert (=> b!254934 m!270609))

(declare-fun m!270611 () Bool)

(assert (=> b!254934 m!270611))

(declare-fun m!270613 () Bool)

(assert (=> b!254934 m!270613))

(assert (=> b!254934 m!270611))

(declare-fun m!270615 () Bool)

(assert (=> b!254934 m!270615))

(assert (=> b!254934 m!270597))

(declare-fun m!270617 () Bool)

(assert (=> b!254934 m!270617))

(assert (=> b!254933 m!270559))

(assert (=> b!254933 m!270559))

(declare-fun m!270619 () Bool)

(assert (=> b!254933 m!270619))

(assert (=> b!254928 m!270559))

(assert (=> b!254928 m!270559))

(assert (=> b!254928 m!270567))

(declare-fun m!270621 () Bool)

(assert (=> b!254932 m!270621))

(assert (=> d!61591 m!270497))

(declare-fun m!270623 () Bool)

(assert (=> b!254931 m!270623))

(declare-fun m!270625 () Bool)

(assert (=> bm!24054 m!270625))

(assert (=> b!254930 m!270559))

(assert (=> b!254930 m!270559))

(assert (=> b!254930 m!270567))

(assert (=> bm!24056 m!270605))

(declare-fun m!270627 () Bool)

(assert (=> bm!24050 m!270627))

(declare-fun m!270629 () Bool)

(assert (=> b!254944 m!270629))

(declare-fun m!270631 () Bool)

(assert (=> b!254942 m!270631))

(assert (=> b!254942 m!270631))

(assert (=> b!254942 m!270509))

(declare-fun m!270633 () Bool)

(assert (=> b!254942 m!270633))

(assert (=> b!254942 m!270559))

(assert (=> b!254942 m!270559))

(declare-fun m!270635 () Bool)

(assert (=> b!254942 m!270635))

(assert (=> b!254942 m!270509))

(declare-fun m!270637 () Bool)

(assert (=> bm!24052 m!270637))

(assert (=> b!254614 d!61591))

(declare-fun bm!24057 () Bool)

(declare-fun call!24060 () (_ BitVec 32))

(assert (=> bm!24057 (= call!24060 (arrayCountValidKeys!0 lt!127624 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6241 (_keys!6850 thiss!1504))))))

(declare-fun d!61593 () Bool)

(declare-fun lt!127842 () (_ BitVec 32))

(assert (=> d!61593 (and (bvsge lt!127842 #b00000000000000000000000000000000) (bvsle lt!127842 (bvsub (size!6241 lt!127624) #b00000000000000000000000000000000)))))

(declare-fun e!165243 () (_ BitVec 32))

(assert (=> d!61593 (= lt!127842 e!165243)))

(declare-fun c!43028 () Bool)

(assert (=> d!61593 (= c!43028 (bvsge #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))))))

(assert (=> d!61593 (and (bvsle #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6241 (_keys!6850 thiss!1504)) (size!6241 lt!127624)))))

(assert (=> d!61593 (= (arrayCountValidKeys!0 lt!127624 #b00000000000000000000000000000000 (size!6241 (_keys!6850 thiss!1504))) lt!127842)))

(declare-fun b!254948 () Bool)

(assert (=> b!254948 (= e!165243 #b00000000000000000000000000000000)))

(declare-fun b!254949 () Bool)

(declare-fun e!165244 () (_ BitVec 32))

(assert (=> b!254949 (= e!165244 call!24060)))

(declare-fun b!254950 () Bool)

(assert (=> b!254950 (= e!165244 (bvadd #b00000000000000000000000000000001 call!24060))))

(declare-fun b!254951 () Bool)

(assert (=> b!254951 (= e!165243 e!165244)))

(declare-fun c!43027 () Bool)

(assert (=> b!254951 (= c!43027 (validKeyInArray!0 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)))))

(assert (= (and d!61593 c!43028) b!254948))

(assert (= (and d!61593 (not c!43028)) b!254951))

(assert (= (and b!254951 c!43027) b!254950))

(assert (= (and b!254951 (not c!43027)) b!254949))

(assert (= (or b!254950 b!254949) bm!24057))

(declare-fun m!270639 () Bool)

(assert (=> bm!24057 m!270639))

(assert (=> b!254951 m!270559))

(assert (=> b!254951 m!270559))

(assert (=> b!254951 m!270567))

(assert (=> b!254614 d!61593))

(declare-fun d!61595 () Bool)

(declare-fun e!165247 () Bool)

(assert (=> d!61595 e!165247))

(declare-fun res!124791 () Bool)

(assert (=> d!61595 (=> (not res!124791) (not e!165247))))

(declare-fun lt!127852 () ListLongMap!3719)

(assert (=> d!61595 (= res!124791 (contains!1821 lt!127852 (_1!2413 (tuple2!4805 key!932 v!346))))))

(declare-fun lt!127854 () List!3684)

(assert (=> d!61595 (= lt!127852 (ListLongMap!3720 lt!127854))))

(declare-fun lt!127853 () Unit!7864)

(declare-fun lt!127851 () Unit!7864)

(assert (=> d!61595 (= lt!127853 lt!127851)))

(assert (=> d!61595 (= (getValueByKey!306 lt!127854 (_1!2413 (tuple2!4805 key!932 v!346))) (Some!311 (_2!2413 (tuple2!4805 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!162 (List!3684 (_ BitVec 64) V!8385) Unit!7864)

(assert (=> d!61595 (= lt!127851 (lemmaContainsTupThenGetReturnValue!162 lt!127854 (_1!2413 (tuple2!4805 key!932 v!346)) (_2!2413 (tuple2!4805 key!932 v!346))))))

(declare-fun insertStrictlySorted!165 (List!3684 (_ BitVec 64) V!8385) List!3684)

(assert (=> d!61595 (= lt!127854 (insertStrictlySorted!165 (toList!1875 lt!127620) (_1!2413 (tuple2!4805 key!932 v!346)) (_2!2413 (tuple2!4805 key!932 v!346))))))

(assert (=> d!61595 (= (+!674 lt!127620 (tuple2!4805 key!932 v!346)) lt!127852)))

(declare-fun b!254956 () Bool)

(declare-fun res!124790 () Bool)

(assert (=> b!254956 (=> (not res!124790) (not e!165247))))

(assert (=> b!254956 (= res!124790 (= (getValueByKey!306 (toList!1875 lt!127852) (_1!2413 (tuple2!4805 key!932 v!346))) (Some!311 (_2!2413 (tuple2!4805 key!932 v!346)))))))

(declare-fun b!254957 () Bool)

(declare-fun contains!1822 (List!3684 tuple2!4804) Bool)

(assert (=> b!254957 (= e!165247 (contains!1822 (toList!1875 lt!127852) (tuple2!4805 key!932 v!346)))))

(assert (= (and d!61595 res!124791) b!254956))

(assert (= (and b!254956 res!124790) b!254957))

(declare-fun m!270641 () Bool)

(assert (=> d!61595 m!270641))

(declare-fun m!270643 () Bool)

(assert (=> d!61595 m!270643))

(declare-fun m!270645 () Bool)

(assert (=> d!61595 m!270645))

(declare-fun m!270647 () Bool)

(assert (=> d!61595 m!270647))

(declare-fun m!270649 () Bool)

(assert (=> b!254956 m!270649))

(declare-fun m!270651 () Bool)

(assert (=> b!254957 m!270651))

(assert (=> b!254614 d!61595))

(declare-fun d!61597 () Bool)

(declare-fun e!165250 () Bool)

(assert (=> d!61597 e!165250))

(declare-fun res!124794 () Bool)

(assert (=> d!61597 (=> (not res!124794) (not e!165250))))

(assert (=> d!61597 (= res!124794 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6241 (_keys!6850 thiss!1504)))))))

(declare-fun lt!127857 () Unit!7864)

(declare-fun choose!41 (array!12437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3685) Unit!7864)

(assert (=> d!61597 (= lt!127857 (choose!41 (_keys!6850 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3682))))

(assert (=> d!61597 (bvslt (size!6241 (_keys!6850 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61597 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6850 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3682) lt!127857)))

(declare-fun b!254960 () Bool)

(assert (=> b!254960 (= e!165250 (arrayNoDuplicates!0 (array!12438 (store (arr!5894 (_keys!6850 thiss!1504)) index!297 key!932) (size!6241 (_keys!6850 thiss!1504))) #b00000000000000000000000000000000 Nil!3682))))

(assert (= (and d!61597 res!124794) b!254960))

(declare-fun m!270653 () Bool)

(assert (=> d!61597 m!270653))

(assert (=> b!254960 m!270325))

(declare-fun m!270655 () Bool)

(assert (=> b!254960 m!270655))

(assert (=> b!254614 d!61597))

(declare-fun b!254972 () Bool)

(declare-fun e!165262 () Bool)

(declare-fun contains!1823 (List!3685 (_ BitVec 64)) Bool)

(assert (=> b!254972 (= e!165262 (contains!1823 Nil!3682 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)))))

(declare-fun b!254973 () Bool)

(declare-fun e!165260 () Bool)

(declare-fun call!24063 () Bool)

(assert (=> b!254973 (= e!165260 call!24063)))

(declare-fun b!254974 () Bool)

(declare-fun e!165261 () Bool)

(declare-fun e!165259 () Bool)

(assert (=> b!254974 (= e!165261 e!165259)))

(declare-fun res!124802 () Bool)

(assert (=> b!254974 (=> (not res!124802) (not e!165259))))

(assert (=> b!254974 (= res!124802 (not e!165262))))

(declare-fun res!124801 () Bool)

(assert (=> b!254974 (=> (not res!124801) (not e!165262))))

(assert (=> b!254974 (= res!124801 (validKeyInArray!0 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)))))

(declare-fun b!254971 () Bool)

(assert (=> b!254971 (= e!165260 call!24063)))

(declare-fun d!61599 () Bool)

(declare-fun res!124803 () Bool)

(assert (=> d!61599 (=> res!124803 e!165261)))

(assert (=> d!61599 (= res!124803 (bvsge #b00000000000000000000000000000000 (size!6241 lt!127624)))))

(assert (=> d!61599 (= (arrayNoDuplicates!0 lt!127624 #b00000000000000000000000000000000 Nil!3682) e!165261)))

(declare-fun b!254975 () Bool)

(assert (=> b!254975 (= e!165259 e!165260)))

(declare-fun c!43031 () Bool)

(assert (=> b!254975 (= c!43031 (validKeyInArray!0 (select (arr!5894 lt!127624) #b00000000000000000000000000000000)))))

(declare-fun bm!24060 () Bool)

(assert (=> bm!24060 (= call!24063 (arrayNoDuplicates!0 lt!127624 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43031 (Cons!3681 (select (arr!5894 lt!127624) #b00000000000000000000000000000000) Nil!3682) Nil!3682)))))

(assert (= (and d!61599 (not res!124803)) b!254974))

(assert (= (and b!254974 res!124801) b!254972))

(assert (= (and b!254974 res!124802) b!254975))

(assert (= (and b!254975 c!43031) b!254971))

(assert (= (and b!254975 (not c!43031)) b!254973))

(assert (= (or b!254971 b!254973) bm!24060))

(assert (=> b!254972 m!270559))

(assert (=> b!254972 m!270559))

(declare-fun m!270657 () Bool)

(assert (=> b!254972 m!270657))

(assert (=> b!254974 m!270559))

(assert (=> b!254974 m!270559))

(assert (=> b!254974 m!270567))

(assert (=> b!254975 m!270559))

(assert (=> b!254975 m!270559))

(assert (=> b!254975 m!270567))

(assert (=> bm!24060 m!270559))

(declare-fun m!270659 () Bool)

(assert (=> bm!24060 m!270659))

(assert (=> b!254614 d!61599))

(assert (=> b!254614 d!61569))

(declare-fun d!61601 () Bool)

(declare-fun e!165265 () Bool)

(assert (=> d!61601 e!165265))

(declare-fun res!124806 () Bool)

(assert (=> d!61601 (=> (not res!124806) (not e!165265))))

(assert (=> d!61601 (= res!124806 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6241 (_keys!6850 thiss!1504)))))))

(declare-fun lt!127860 () Unit!7864)

(declare-fun choose!102 ((_ BitVec 64) array!12437 (_ BitVec 32) (_ BitVec 32)) Unit!7864)

(assert (=> d!61601 (= lt!127860 (choose!102 key!932 (_keys!6850 thiss!1504) index!297 (mask!10944 thiss!1504)))))

(assert (=> d!61601 (validMask!0 (mask!10944 thiss!1504))))

(assert (=> d!61601 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6850 thiss!1504) index!297 (mask!10944 thiss!1504)) lt!127860)))

(declare-fun b!254978 () Bool)

(assert (=> b!254978 (= e!165265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12438 (store (arr!5894 (_keys!6850 thiss!1504)) index!297 key!932) (size!6241 (_keys!6850 thiss!1504))) (mask!10944 thiss!1504)))))

(assert (= (and d!61601 res!124806) b!254978))

(declare-fun m!270661 () Bool)

(assert (=> d!61601 m!270661))

(assert (=> d!61601 m!270497))

(assert (=> b!254978 m!270325))

(declare-fun m!270663 () Bool)

(assert (=> b!254978 m!270663))

(assert (=> b!254614 d!61601))

(declare-fun mapNonEmpty!11154 () Bool)

(declare-fun mapRes!11154 () Bool)

(declare-fun tp!23376 () Bool)

(declare-fun e!165271 () Bool)

(assert (=> mapNonEmpty!11154 (= mapRes!11154 (and tp!23376 e!165271))))

(declare-fun mapRest!11154 () (Array (_ BitVec 32) ValueCell!2933))

(declare-fun mapKey!11154 () (_ BitVec 32))

(declare-fun mapValue!11154 () ValueCell!2933)

(assert (=> mapNonEmpty!11154 (= mapRest!11145 (store mapRest!11154 mapKey!11154 mapValue!11154))))

(declare-fun condMapEmpty!11154 () Bool)

(declare-fun mapDefault!11154 () ValueCell!2933)

(assert (=> mapNonEmpty!11145 (= condMapEmpty!11154 (= mapRest!11145 ((as const (Array (_ BitVec 32) ValueCell!2933)) mapDefault!11154)))))

(declare-fun e!165270 () Bool)

(assert (=> mapNonEmpty!11145 (= tp!23360 (and e!165270 mapRes!11154))))

(declare-fun b!254985 () Bool)

(assert (=> b!254985 (= e!165271 tp_is_empty!6553)))

(declare-fun mapIsEmpty!11154 () Bool)

(assert (=> mapIsEmpty!11154 mapRes!11154))

(declare-fun b!254986 () Bool)

(assert (=> b!254986 (= e!165270 tp_is_empty!6553)))

(assert (= (and mapNonEmpty!11145 condMapEmpty!11154) mapIsEmpty!11154))

(assert (= (and mapNonEmpty!11145 (not condMapEmpty!11154)) mapNonEmpty!11154))

(assert (= (and mapNonEmpty!11154 ((_ is ValueCellFull!2933) mapValue!11154)) b!254985))

(assert (= (and mapNonEmpty!11145 ((_ is ValueCellFull!2933) mapDefault!11154)) b!254986))

(declare-fun m!270665 () Bool)

(assert (=> mapNonEmpty!11154 m!270665))

(declare-fun b_lambda!8157 () Bool)

(assert (= b_lambda!8155 (or (and b!254622 b_free!6691) b_lambda!8157)))

(declare-fun b_lambda!8159 () Bool)

(assert (= b_lambda!8153 (or (and b!254622 b_free!6691) b_lambda!8159)))

(check-sat (not b!254860) (not b!254817) (not bm!24043) (not b!254899) (not d!61567) (not d!61597) (not b!254944) (not bm!24035) (not b!254951) (not b!254803) (not b_lambda!8159) (not b!254886) (not b!254759) (not d!61585) (not b!254930) (not d!61589) (not d!61575) (not b!254887) (not b!254932) (not b!254972) (not d!61565) (not b!254926) (not b!254809) (not d!61561) (not d!61595) (not b!254928) (not mapNonEmpty!11154) (not b!254808) (not b_next!6691) (not b!254974) (not d!61563) (not bm!24046) (not bm!24031) (not bm!24054) (not b!254960) (not bm!24037) (not b!254978) (not bm!24052) (not bm!24057) (not b!254806) (not b!254805) (not b!254923) (not b!254957) (not b_lambda!8157) tp_is_empty!6553 (not b!254873) (not b!254898) (not d!61601) (not b!254911) (not b!254934) (not b!254956) (not b!254942) (not b!254975) (not b!254909) (not bm!24060) b_and!13755 (not bm!24033) (not b!254757) (not b!254908) (not bm!24049) (not bm!24042) (not b!254829) (not d!61571) (not b!254807) (not b!254931) (not b!254885) (not d!61591) (not b!254819) (not bm!24050) (not bm!24056) (not d!61573) (not b!254933))
(check-sat b_and!13755 (not b_next!6691))
