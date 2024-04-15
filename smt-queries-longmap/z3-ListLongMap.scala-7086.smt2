; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89568 () Bool)

(assert start!89568)

(declare-fun b!1027329 () Bool)

(declare-fun b_free!20569 () Bool)

(declare-fun b_next!20569 () Bool)

(assert (=> b!1027329 (= b_free!20569 (not b_next!20569))))

(declare-fun tp!72752 () Bool)

(declare-fun b_and!32789 () Bool)

(assert (=> b!1027329 (= tp!72752 b_and!32789)))

(declare-fun b!1027324 () Bool)

(declare-fun res!687657 () Bool)

(declare-fun e!579789 () Bool)

(assert (=> b!1027324 (=> (not res!687657) (not e!579789))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027324 (= res!687657 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37862 () Bool)

(declare-fun mapRes!37862 () Bool)

(declare-fun tp!72753 () Bool)

(declare-fun e!579791 () Bool)

(assert (=> mapNonEmpty!37862 (= mapRes!37862 (and tp!72753 e!579791))))

(declare-datatypes ((V!37259 0))(
  ( (V!37260 (val!12195 Int)) )
))
(declare-datatypes ((ValueCell!11441 0))(
  ( (ValueCellFull!11441 (v!14763 V!37259)) (EmptyCell!11441) )
))
(declare-fun mapRest!37862 () (Array (_ BitVec 32) ValueCell!11441))

(declare-fun mapValue!37862 () ValueCell!11441)

(declare-datatypes ((array!64567 0))(
  ( (array!64568 (arr!31092 (Array (_ BitVec 32) (_ BitVec 64))) (size!31607 (_ BitVec 32))) )
))
(declare-datatypes ((array!64569 0))(
  ( (array!64570 (arr!31093 (Array (_ BitVec 32) ValueCell!11441)) (size!31608 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5476 0))(
  ( (LongMapFixedSize!5477 (defaultEntry!6090 Int) (mask!29803 (_ BitVec 32)) (extraKeys!5822 (_ BitVec 32)) (zeroValue!5926 V!37259) (minValue!5926 V!37259) (_size!2793 (_ BitVec 32)) (_keys!11233 array!64567) (_values!6113 array!64569) (_vacant!2793 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5476)

(declare-fun mapKey!37862 () (_ BitVec 32))

(assert (=> mapNonEmpty!37862 (= (arr!31093 (_values!6113 thiss!1427)) (store mapRest!37862 mapKey!37862 mapValue!37862))))

(declare-fun mapIsEmpty!37862 () Bool)

(assert (=> mapIsEmpty!37862 mapRes!37862))

(declare-fun res!687656 () Bool)

(assert (=> start!89568 (=> (not res!687656) (not e!579789))))

(declare-fun valid!2065 (LongMapFixedSize!5476) Bool)

(assert (=> start!89568 (= res!687656 (valid!2065 thiss!1427))))

(assert (=> start!89568 e!579789))

(declare-fun e!579786 () Bool)

(assert (=> start!89568 e!579786))

(assert (=> start!89568 true))

(declare-fun b!1027325 () Bool)

(declare-fun tp_is_empty!24289 () Bool)

(assert (=> b!1027325 (= e!579791 tp_is_empty!24289)))

(declare-fun b!1027326 () Bool)

(declare-fun e!579790 () Bool)

(assert (=> b!1027326 (= e!579790 tp_is_empty!24289)))

(declare-fun b!1027327 () Bool)

(declare-fun e!579792 () Bool)

(assert (=> b!1027327 (= e!579792 (and e!579790 mapRes!37862))))

(declare-fun condMapEmpty!37862 () Bool)

(declare-fun mapDefault!37862 () ValueCell!11441)

(assert (=> b!1027327 (= condMapEmpty!37862 (= (arr!31093 (_values!6113 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11441)) mapDefault!37862)))))

(declare-fun b!1027328 () Bool)

(declare-fun e!579788 () Bool)

(assert (=> b!1027328 (= e!579789 e!579788)))

(declare-fun res!687658 () Bool)

(assert (=> b!1027328 (=> (not res!687658) (not e!579788))))

(declare-datatypes ((SeekEntryResult!9663 0))(
  ( (MissingZero!9663 (index!41023 (_ BitVec 32))) (Found!9663 (index!41024 (_ BitVec 32))) (Intermediate!9663 (undefined!10475 Bool) (index!41025 (_ BitVec 32)) (x!91420 (_ BitVec 32))) (Undefined!9663) (MissingVacant!9663 (index!41026 (_ BitVec 32))) )
))
(declare-fun lt!452090 () SeekEntryResult!9663)

(get-info :version)

(assert (=> b!1027328 (= res!687658 ((_ is Found!9663) lt!452090))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64567 (_ BitVec 32)) SeekEntryResult!9663)

(assert (=> b!1027328 (= lt!452090 (seekEntry!0 key!909 (_keys!11233 thiss!1427) (mask!29803 thiss!1427)))))

(declare-fun array_inv!24073 (array!64567) Bool)

(declare-fun array_inv!24074 (array!64569) Bool)

(assert (=> b!1027329 (= e!579786 (and tp!72752 tp_is_empty!24289 (array_inv!24073 (_keys!11233 thiss!1427)) (array_inv!24074 (_values!6113 thiss!1427)) e!579792))))

(declare-fun b!1027330 () Bool)

(declare-fun lt!452095 () array!64569)

(declare-fun lt!452091 () array!64567)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(declare-datatypes ((Unit!33369 0))(
  ( (Unit!33370) )
))
(declare-datatypes ((tuple2!15606 0))(
  ( (tuple2!15607 (_1!7814 Unit!33369) (_2!7814 LongMapFixedSize!5476)) )
))
(declare-fun Unit!33371 () Unit!33369)

(declare-fun Unit!33372 () Unit!33369)

(assert (=> b!1027330 (= e!579788 (not (validMask!0 (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33371 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33372 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))))))))

(declare-datatypes ((tuple2!15608 0))(
  ( (tuple2!15609 (_1!7815 (_ BitVec 64)) (_2!7815 V!37259)) )
))
(declare-datatypes ((List!21838 0))(
  ( (Nil!21835) (Cons!21834 (h!23032 tuple2!15608) (t!30893 List!21838)) )
))
(declare-datatypes ((ListLongMap!13739 0))(
  ( (ListLongMap!13740 (toList!6885 List!21838)) )
))
(declare-fun -!477 (ListLongMap!13739 (_ BitVec 64)) ListLongMap!13739)

(declare-fun getCurrentListMap!3852 (array!64567 array!64569 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) Int) ListLongMap!13739)

(assert (=> b!1027330 (= (-!477 (getCurrentListMap!3852 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) key!909) (getCurrentListMap!3852 lt!452091 lt!452095 (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun dynLambda!1939 (Int (_ BitVec 64)) V!37259)

(assert (=> b!1027330 (= lt!452095 (array!64570 (store (arr!31093 (_values!6113 thiss!1427)) (index!41024 lt!452090) (ValueCellFull!11441 (dynLambda!1939 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31608 (_values!6113 thiss!1427))))))

(declare-fun lt!452088 () Unit!33369)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!2 (array!64567 array!64569 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) (_ BitVec 64) Int) Unit!33369)

(assert (=> b!1027330 (= lt!452088 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!2 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (index!41024 lt!452090) key!909 (defaultEntry!6090 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027330 (not (arrayContainsKey!0 lt!452091 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452092 () Unit!33369)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64567 (_ BitVec 32) (_ BitVec 64)) Unit!33369)

(assert (=> b!1027330 (= lt!452092 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11233 thiss!1427) (index!41024 lt!452090) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64567 (_ BitVec 32)) Bool)

(assert (=> b!1027330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452091 (mask!29803 thiss!1427))))

(declare-fun lt!452094 () Unit!33369)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64567 (_ BitVec 32) (_ BitVec 32)) Unit!33369)

(assert (=> b!1027330 (= lt!452094 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11233 thiss!1427) (index!41024 lt!452090) (mask!29803 thiss!1427)))))

(declare-datatypes ((List!21839 0))(
  ( (Nil!21836) (Cons!21835 (h!23033 (_ BitVec 64)) (t!30894 List!21839)) )
))
(declare-fun arrayNoDuplicates!0 (array!64567 (_ BitVec 32) List!21839) Bool)

(assert (=> b!1027330 (arrayNoDuplicates!0 lt!452091 #b00000000000000000000000000000000 Nil!21836)))

(declare-fun lt!452093 () Unit!33369)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21839) Unit!33369)

(assert (=> b!1027330 (= lt!452093 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11233 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41024 lt!452090) #b00000000000000000000000000000000 Nil!21836))))

(declare-fun arrayCountValidKeys!0 (array!64567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027330 (= (arrayCountValidKeys!0 lt!452091 #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027330 (= lt!452091 (array!64568 (store (arr!31092 (_keys!11233 thiss!1427)) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31607 (_keys!11233 thiss!1427))))))

(declare-fun lt!452089 () Unit!33369)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64567 (_ BitVec 32) (_ BitVec 64)) Unit!33369)

(assert (=> b!1027330 (= lt!452089 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11233 thiss!1427) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89568 res!687656) b!1027324))

(assert (= (and b!1027324 res!687657) b!1027328))

(assert (= (and b!1027328 res!687658) b!1027330))

(assert (= (and b!1027327 condMapEmpty!37862) mapIsEmpty!37862))

(assert (= (and b!1027327 (not condMapEmpty!37862)) mapNonEmpty!37862))

(assert (= (and mapNonEmpty!37862 ((_ is ValueCellFull!11441) mapValue!37862)) b!1027325))

(assert (= (and b!1027327 ((_ is ValueCellFull!11441) mapDefault!37862)) b!1027326))

(assert (= b!1027329 b!1027327))

(assert (= start!89568 b!1027329))

(declare-fun b_lambda!15697 () Bool)

(assert (=> (not b_lambda!15697) (not b!1027330)))

(declare-fun t!30892 () Bool)

(declare-fun tb!6879 () Bool)

(assert (=> (and b!1027329 (= (defaultEntry!6090 thiss!1427) (defaultEntry!6090 thiss!1427)) t!30892) tb!6879))

(declare-fun result!14081 () Bool)

(assert (=> tb!6879 (= result!14081 tp_is_empty!24289)))

(assert (=> b!1027330 t!30892))

(declare-fun b_and!32791 () Bool)

(assert (= b_and!32789 (and (=> t!30892 result!14081) b_and!32791)))

(declare-fun m!945335 () Bool)

(assert (=> b!1027329 m!945335))

(declare-fun m!945337 () Bool)

(assert (=> b!1027329 m!945337))

(declare-fun m!945339 () Bool)

(assert (=> b!1027328 m!945339))

(declare-fun m!945341 () Bool)

(assert (=> mapNonEmpty!37862 m!945341))

(declare-fun m!945343 () Bool)

(assert (=> b!1027330 m!945343))

(declare-fun m!945345 () Bool)

(assert (=> b!1027330 m!945345))

(declare-fun m!945347 () Bool)

(assert (=> b!1027330 m!945347))

(declare-fun m!945349 () Bool)

(assert (=> b!1027330 m!945349))

(declare-fun m!945351 () Bool)

(assert (=> b!1027330 m!945351))

(declare-fun m!945353 () Bool)

(assert (=> b!1027330 m!945353))

(declare-fun m!945355 () Bool)

(assert (=> b!1027330 m!945355))

(declare-fun m!945357 () Bool)

(assert (=> b!1027330 m!945357))

(declare-fun m!945359 () Bool)

(assert (=> b!1027330 m!945359))

(declare-fun m!945361 () Bool)

(assert (=> b!1027330 m!945361))

(declare-fun m!945363 () Bool)

(assert (=> b!1027330 m!945363))

(declare-fun m!945365 () Bool)

(assert (=> b!1027330 m!945365))

(declare-fun m!945367 () Bool)

(assert (=> b!1027330 m!945367))

(assert (=> b!1027330 m!945361))

(declare-fun m!945369 () Bool)

(assert (=> b!1027330 m!945369))

(declare-fun m!945371 () Bool)

(assert (=> b!1027330 m!945371))

(declare-fun m!945373 () Bool)

(assert (=> b!1027330 m!945373))

(declare-fun m!945375 () Bool)

(assert (=> b!1027330 m!945375))

(declare-fun m!945377 () Bool)

(assert (=> start!89568 m!945377))

(check-sat tp_is_empty!24289 (not mapNonEmpty!37862) (not b_lambda!15697) (not b!1027329) (not start!89568) (not b_next!20569) b_and!32791 (not b!1027330) (not b!1027328))
(check-sat b_and!32791 (not b_next!20569))
(get-model)

(declare-fun b_lambda!15703 () Bool)

(assert (= b_lambda!15697 (or (and b!1027329 b_free!20569) b_lambda!15703)))

(check-sat tp_is_empty!24289 (not mapNonEmpty!37862) (not b!1027329) (not start!89568) (not b_next!20569) (not b_lambda!15703) b_and!32791 (not b!1027330) (not b!1027328))
(check-sat b_and!32791 (not b_next!20569))
(get-model)

(declare-fun b!1027391 () Bool)

(declare-fun e!579843 () SeekEntryResult!9663)

(declare-fun e!579841 () SeekEntryResult!9663)

(assert (=> b!1027391 (= e!579843 e!579841)))

(declare-fun lt!452153 () (_ BitVec 64))

(declare-fun lt!452155 () SeekEntryResult!9663)

(assert (=> b!1027391 (= lt!452153 (select (arr!31092 (_keys!11233 thiss!1427)) (index!41025 lt!452155)))))

(declare-fun c!103538 () Bool)

(assert (=> b!1027391 (= c!103538 (= lt!452153 key!909))))

(declare-fun b!1027393 () Bool)

(declare-fun e!579842 () SeekEntryResult!9663)

(declare-fun lt!452152 () SeekEntryResult!9663)

(assert (=> b!1027393 (= e!579842 (ite ((_ is MissingVacant!9663) lt!452152) (MissingZero!9663 (index!41026 lt!452152)) lt!452152))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64567 (_ BitVec 32)) SeekEntryResult!9663)

(assert (=> b!1027393 (= lt!452152 (seekKeyOrZeroReturnVacant!0 (x!91420 lt!452155) (index!41025 lt!452155) (index!41025 lt!452155) key!909 (_keys!11233 thiss!1427) (mask!29803 thiss!1427)))))

(declare-fun b!1027394 () Bool)

(assert (=> b!1027394 (= e!579841 (Found!9663 (index!41025 lt!452155)))))

(declare-fun b!1027395 () Bool)

(declare-fun c!103539 () Bool)

(assert (=> b!1027395 (= c!103539 (= lt!452153 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027395 (= e!579841 e!579842)))

(declare-fun b!1027396 () Bool)

(assert (=> b!1027396 (= e!579842 (MissingZero!9663 (index!41025 lt!452155)))))

(declare-fun b!1027392 () Bool)

(assert (=> b!1027392 (= e!579843 Undefined!9663)))

(declare-fun d!122557 () Bool)

(declare-fun lt!452154 () SeekEntryResult!9663)

(assert (=> d!122557 (and (or ((_ is MissingVacant!9663) lt!452154) (not ((_ is Found!9663) lt!452154)) (and (bvsge (index!41024 lt!452154) #b00000000000000000000000000000000) (bvslt (index!41024 lt!452154) (size!31607 (_keys!11233 thiss!1427))))) (not ((_ is MissingVacant!9663) lt!452154)) (or (not ((_ is Found!9663) lt!452154)) (= (select (arr!31092 (_keys!11233 thiss!1427)) (index!41024 lt!452154)) key!909)))))

(assert (=> d!122557 (= lt!452154 e!579843)))

(declare-fun c!103540 () Bool)

(assert (=> d!122557 (= c!103540 (and ((_ is Intermediate!9663) lt!452155) (undefined!10475 lt!452155)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64567 (_ BitVec 32)) SeekEntryResult!9663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!122557 (= lt!452155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29803 thiss!1427)) key!909 (_keys!11233 thiss!1427) (mask!29803 thiss!1427)))))

(assert (=> d!122557 (validMask!0 (mask!29803 thiss!1427))))

(assert (=> d!122557 (= (seekEntry!0 key!909 (_keys!11233 thiss!1427) (mask!29803 thiss!1427)) lt!452154)))

(assert (= (and d!122557 c!103540) b!1027392))

(assert (= (and d!122557 (not c!103540)) b!1027391))

(assert (= (and b!1027391 c!103538) b!1027394))

(assert (= (and b!1027391 (not c!103538)) b!1027395))

(assert (= (and b!1027395 c!103539) b!1027396))

(assert (= (and b!1027395 (not c!103539)) b!1027393))

(declare-fun m!945467 () Bool)

(assert (=> b!1027391 m!945467))

(declare-fun m!945469 () Bool)

(assert (=> b!1027393 m!945469))

(declare-fun m!945471 () Bool)

(assert (=> d!122557 m!945471))

(declare-fun m!945473 () Bool)

(assert (=> d!122557 m!945473))

(assert (=> d!122557 m!945473))

(declare-fun m!945475 () Bool)

(assert (=> d!122557 m!945475))

(declare-fun m!945477 () Bool)

(assert (=> d!122557 m!945477))

(assert (=> b!1027328 d!122557))

(declare-fun d!122559 () Bool)

(assert (=> d!122559 (= (array_inv!24073 (_keys!11233 thiss!1427)) (bvsge (size!31607 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027329 d!122559))

(declare-fun d!122561 () Bool)

(assert (=> d!122561 (= (array_inv!24074 (_values!6113 thiss!1427)) (bvsge (size!31608 (_values!6113 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027329 d!122561))

(declare-fun call!43235 () ListLongMap!13739)

(declare-fun call!43240 () ListLongMap!13739)

(declare-fun call!43234 () ListLongMap!13739)

(declare-fun call!43238 () ListLongMap!13739)

(declare-fun c!103557 () Bool)

(declare-fun c!103554 () Bool)

(declare-fun bm!43231 () Bool)

(declare-fun +!3123 (ListLongMap!13739 tuple2!15608) ListLongMap!13739)

(assert (=> bm!43231 (= call!43235 (+!3123 (ite c!103554 call!43234 (ite c!103557 call!43240 call!43238)) (ite (or c!103554 c!103557) (tuple2!15609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5926 thiss!1427)) (tuple2!15609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5926 thiss!1427)))))))

(declare-fun b!1027439 () Bool)

(declare-fun e!579877 () ListLongMap!13739)

(assert (=> b!1027439 (= e!579877 (+!3123 call!43235 (tuple2!15609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5926 thiss!1427))))))

(declare-fun b!1027440 () Bool)

(declare-fun res!687696 () Bool)

(declare-fun e!579873 () Bool)

(assert (=> b!1027440 (=> (not res!687696) (not e!579873))))

(declare-fun e!579880 () Bool)

(assert (=> b!1027440 (= res!687696 e!579880)))

(declare-fun c!103553 () Bool)

(assert (=> b!1027440 (= c!103553 (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1027441 () Bool)

(declare-fun e!579878 () Unit!33369)

(declare-fun lt!452203 () Unit!33369)

(assert (=> b!1027441 (= e!579878 lt!452203)))

(declare-fun lt!452202 () ListLongMap!13739)

(declare-fun getCurrentListMapNoExtraKeys!3558 (array!64567 array!64569 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) Int) ListLongMap!13739)

(assert (=> b!1027441 (= lt!452202 (getCurrentListMapNoExtraKeys!3558 lt!452091 lt!452095 (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452201 () (_ BitVec 64))

(assert (=> b!1027441 (= lt!452201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452207 () (_ BitVec 64))

(assert (=> b!1027441 (= lt!452207 (select (arr!31092 lt!452091) #b00000000000000000000000000000000))))

(declare-fun lt!452204 () Unit!33369)

(declare-fun addStillContains!611 (ListLongMap!13739 (_ BitVec 64) V!37259 (_ BitVec 64)) Unit!33369)

(assert (=> b!1027441 (= lt!452204 (addStillContains!611 lt!452202 lt!452201 (zeroValue!5926 thiss!1427) lt!452207))))

(declare-fun contains!5941 (ListLongMap!13739 (_ BitVec 64)) Bool)

(assert (=> b!1027441 (contains!5941 (+!3123 lt!452202 (tuple2!15609 lt!452201 (zeroValue!5926 thiss!1427))) lt!452207)))

(declare-fun lt!452220 () Unit!33369)

(assert (=> b!1027441 (= lt!452220 lt!452204)))

(declare-fun lt!452208 () ListLongMap!13739)

(assert (=> b!1027441 (= lt!452208 (getCurrentListMapNoExtraKeys!3558 lt!452091 lt!452095 (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452206 () (_ BitVec 64))

(assert (=> b!1027441 (= lt!452206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452205 () (_ BitVec 64))

(assert (=> b!1027441 (= lt!452205 (select (arr!31092 lt!452091) #b00000000000000000000000000000000))))

(declare-fun lt!452211 () Unit!33369)

(declare-fun addApplyDifferent!467 (ListLongMap!13739 (_ BitVec 64) V!37259 (_ BitVec 64)) Unit!33369)

(assert (=> b!1027441 (= lt!452211 (addApplyDifferent!467 lt!452208 lt!452206 (minValue!5926 thiss!1427) lt!452205))))

(declare-fun apply!892 (ListLongMap!13739 (_ BitVec 64)) V!37259)

(assert (=> b!1027441 (= (apply!892 (+!3123 lt!452208 (tuple2!15609 lt!452206 (minValue!5926 thiss!1427))) lt!452205) (apply!892 lt!452208 lt!452205))))

(declare-fun lt!452200 () Unit!33369)

(assert (=> b!1027441 (= lt!452200 lt!452211)))

(declare-fun lt!452209 () ListLongMap!13739)

(assert (=> b!1027441 (= lt!452209 (getCurrentListMapNoExtraKeys!3558 lt!452091 lt!452095 (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452214 () (_ BitVec 64))

(assert (=> b!1027441 (= lt!452214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452210 () (_ BitVec 64))

(assert (=> b!1027441 (= lt!452210 (select (arr!31092 lt!452091) #b00000000000000000000000000000000))))

(declare-fun lt!452218 () Unit!33369)

(assert (=> b!1027441 (= lt!452218 (addApplyDifferent!467 lt!452209 lt!452214 (zeroValue!5926 thiss!1427) lt!452210))))

(assert (=> b!1027441 (= (apply!892 (+!3123 lt!452209 (tuple2!15609 lt!452214 (zeroValue!5926 thiss!1427))) lt!452210) (apply!892 lt!452209 lt!452210))))

(declare-fun lt!452221 () Unit!33369)

(assert (=> b!1027441 (= lt!452221 lt!452218)))

(declare-fun lt!452216 () ListLongMap!13739)

(assert (=> b!1027441 (= lt!452216 (getCurrentListMapNoExtraKeys!3558 lt!452091 lt!452095 (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452213 () (_ BitVec 64))

(assert (=> b!1027441 (= lt!452213 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452215 () (_ BitVec 64))

(assert (=> b!1027441 (= lt!452215 (select (arr!31092 lt!452091) #b00000000000000000000000000000000))))

(assert (=> b!1027441 (= lt!452203 (addApplyDifferent!467 lt!452216 lt!452213 (minValue!5926 thiss!1427) lt!452215))))

(assert (=> b!1027441 (= (apply!892 (+!3123 lt!452216 (tuple2!15609 lt!452213 (minValue!5926 thiss!1427))) lt!452215) (apply!892 lt!452216 lt!452215))))

(declare-fun b!1027442 () Bool)

(declare-fun e!579882 () Bool)

(declare-fun call!43239 () Bool)

(assert (=> b!1027442 (= e!579882 (not call!43239))))

(declare-fun b!1027443 () Bool)

(declare-fun e!579881 () Bool)

(declare-fun lt!452219 () ListLongMap!13739)

(assert (=> b!1027443 (= e!579881 (= (apply!892 lt!452219 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5926 thiss!1427)))))

(declare-fun b!1027444 () Bool)

(declare-fun e!579874 () ListLongMap!13739)

(declare-fun call!43236 () ListLongMap!13739)

(assert (=> b!1027444 (= e!579874 call!43236)))

(declare-fun b!1027446 () Bool)

(declare-fun call!43237 () Bool)

(assert (=> b!1027446 (= e!579880 (not call!43237))))

(declare-fun b!1027447 () Bool)

(declare-fun e!579875 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1027447 (= e!579875 (validKeyInArray!0 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)))))

(declare-fun b!1027448 () Bool)

(assert (=> b!1027448 (= e!579873 e!579882)))

(declare-fun c!103555 () Bool)

(assert (=> b!1027448 (= c!103555 (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43232 () Bool)

(assert (=> bm!43232 (= call!43237 (contains!5941 lt!452219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027449 () Bool)

(declare-fun e!579871 () Bool)

(declare-fun get!16333 (ValueCell!11441 V!37259) V!37259)

(assert (=> b!1027449 (= e!579871 (= (apply!892 lt!452219 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)) (get!16333 (select (arr!31093 lt!452095) #b00000000000000000000000000000000) (dynLambda!1939 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31608 lt!452095)))))

(assert (=> b!1027449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31607 lt!452091)))))

(declare-fun b!1027450 () Bool)

(declare-fun c!103558 () Bool)

(assert (=> b!1027450 (= c!103558 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!579879 () ListLongMap!13739)

(assert (=> b!1027450 (= e!579879 e!579874)))

(declare-fun b!1027451 () Bool)

(assert (=> b!1027451 (= e!579879 call!43236)))

(declare-fun bm!43233 () Bool)

(assert (=> bm!43233 (= call!43236 call!43235)))

(declare-fun b!1027452 () Bool)

(declare-fun Unit!33381 () Unit!33369)

(assert (=> b!1027452 (= e!579878 Unit!33381)))

(declare-fun b!1027453 () Bool)

(assert (=> b!1027453 (= e!579877 e!579879)))

(assert (=> b!1027453 (= c!103557 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027454 () Bool)

(assert (=> b!1027454 (= e!579874 call!43238)))

(declare-fun b!1027455 () Bool)

(declare-fun e!579876 () Bool)

(assert (=> b!1027455 (= e!579876 e!579871)))

(declare-fun res!687702 () Bool)

(assert (=> b!1027455 (=> (not res!687702) (not e!579871))))

(assert (=> b!1027455 (= res!687702 (contains!5941 lt!452219 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)))))

(assert (=> b!1027455 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31607 lt!452091)))))

(declare-fun b!1027456 () Bool)

(declare-fun e!579870 () Bool)

(assert (=> b!1027456 (= e!579870 (= (apply!892 lt!452219 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5926 thiss!1427)))))

(declare-fun b!1027457 () Bool)

(declare-fun e!579872 () Bool)

(assert (=> b!1027457 (= e!579872 (validKeyInArray!0 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)))))

(declare-fun bm!43234 () Bool)

(assert (=> bm!43234 (= call!43239 (contains!5941 lt!452219 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027445 () Bool)

(assert (=> b!1027445 (= e!579880 e!579881)))

(declare-fun res!687695 () Bool)

(assert (=> b!1027445 (= res!687695 call!43237)))

(assert (=> b!1027445 (=> (not res!687695) (not e!579881))))

(declare-fun d!122563 () Bool)

(assert (=> d!122563 e!579873))

(declare-fun res!687698 () Bool)

(assert (=> d!122563 (=> (not res!687698) (not e!579873))))

(assert (=> d!122563 (= res!687698 (or (bvsge #b00000000000000000000000000000000 (size!31607 lt!452091)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31607 lt!452091)))))))

(declare-fun lt!452217 () ListLongMap!13739)

(assert (=> d!122563 (= lt!452219 lt!452217)))

(declare-fun lt!452212 () Unit!33369)

(assert (=> d!122563 (= lt!452212 e!579878)))

(declare-fun c!103556 () Bool)

(assert (=> d!122563 (= c!103556 e!579875)))

(declare-fun res!687697 () Bool)

(assert (=> d!122563 (=> (not res!687697) (not e!579875))))

(assert (=> d!122563 (= res!687697 (bvslt #b00000000000000000000000000000000 (size!31607 lt!452091)))))

(assert (=> d!122563 (= lt!452217 e!579877)))

(assert (=> d!122563 (= c!103554 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122563 (validMask!0 (mask!29803 thiss!1427))))

(assert (=> d!122563 (= (getCurrentListMap!3852 lt!452091 lt!452095 (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) lt!452219)))

(declare-fun b!1027458 () Bool)

(declare-fun res!687703 () Bool)

(assert (=> b!1027458 (=> (not res!687703) (not e!579873))))

(assert (=> b!1027458 (= res!687703 e!579876)))

(declare-fun res!687699 () Bool)

(assert (=> b!1027458 (=> res!687699 e!579876)))

(assert (=> b!1027458 (= res!687699 (not e!579872))))

(declare-fun res!687701 () Bool)

(assert (=> b!1027458 (=> (not res!687701) (not e!579872))))

(assert (=> b!1027458 (= res!687701 (bvslt #b00000000000000000000000000000000 (size!31607 lt!452091)))))

(declare-fun bm!43235 () Bool)

(assert (=> bm!43235 (= call!43240 call!43234)))

(declare-fun bm!43236 () Bool)

(assert (=> bm!43236 (= call!43234 (getCurrentListMapNoExtraKeys!3558 lt!452091 lt!452095 (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun b!1027459 () Bool)

(assert (=> b!1027459 (= e!579882 e!579870)))

(declare-fun res!687700 () Bool)

(assert (=> b!1027459 (= res!687700 call!43239)))

(assert (=> b!1027459 (=> (not res!687700) (not e!579870))))

(declare-fun bm!43237 () Bool)

(assert (=> bm!43237 (= call!43238 call!43240)))

(assert (= (and d!122563 c!103554) b!1027439))

(assert (= (and d!122563 (not c!103554)) b!1027453))

(assert (= (and b!1027453 c!103557) b!1027451))

(assert (= (and b!1027453 (not c!103557)) b!1027450))

(assert (= (and b!1027450 c!103558) b!1027444))

(assert (= (and b!1027450 (not c!103558)) b!1027454))

(assert (= (or b!1027444 b!1027454) bm!43237))

(assert (= (or b!1027451 bm!43237) bm!43235))

(assert (= (or b!1027451 b!1027444) bm!43233))

(assert (= (or b!1027439 bm!43235) bm!43236))

(assert (= (or b!1027439 bm!43233) bm!43231))

(assert (= (and d!122563 res!687697) b!1027447))

(assert (= (and d!122563 c!103556) b!1027441))

(assert (= (and d!122563 (not c!103556)) b!1027452))

(assert (= (and d!122563 res!687698) b!1027458))

(assert (= (and b!1027458 res!687701) b!1027457))

(assert (= (and b!1027458 (not res!687699)) b!1027455))

(assert (= (and b!1027455 res!687702) b!1027449))

(assert (= (and b!1027458 res!687703) b!1027440))

(assert (= (and b!1027440 c!103553) b!1027445))

(assert (= (and b!1027440 (not c!103553)) b!1027446))

(assert (= (and b!1027445 res!687695) b!1027443))

(assert (= (or b!1027445 b!1027446) bm!43232))

(assert (= (and b!1027440 res!687696) b!1027448))

(assert (= (and b!1027448 c!103555) b!1027459))

(assert (= (and b!1027448 (not c!103555)) b!1027442))

(assert (= (and b!1027459 res!687700) b!1027456))

(assert (= (or b!1027459 b!1027442) bm!43234))

(declare-fun b_lambda!15705 () Bool)

(assert (=> (not b_lambda!15705) (not b!1027449)))

(assert (=> b!1027449 t!30892))

(declare-fun b_and!32801 () Bool)

(assert (= b_and!32791 (and (=> t!30892 result!14081) b_and!32801)))

(declare-fun m!945479 () Bool)

(assert (=> b!1027447 m!945479))

(assert (=> b!1027447 m!945479))

(declare-fun m!945481 () Bool)

(assert (=> b!1027447 m!945481))

(declare-fun m!945483 () Bool)

(assert (=> bm!43236 m!945483))

(declare-fun m!945485 () Bool)

(assert (=> b!1027443 m!945485))

(declare-fun m!945487 () Bool)

(assert (=> b!1027456 m!945487))

(declare-fun m!945489 () Bool)

(assert (=> b!1027439 m!945489))

(assert (=> d!122563 m!945477))

(assert (=> b!1027455 m!945479))

(assert (=> b!1027455 m!945479))

(declare-fun m!945491 () Bool)

(assert (=> b!1027455 m!945491))

(declare-fun m!945493 () Bool)

(assert (=> b!1027441 m!945493))

(declare-fun m!945495 () Bool)

(assert (=> b!1027441 m!945495))

(declare-fun m!945497 () Bool)

(assert (=> b!1027441 m!945497))

(declare-fun m!945499 () Bool)

(assert (=> b!1027441 m!945499))

(declare-fun m!945501 () Bool)

(assert (=> b!1027441 m!945501))

(declare-fun m!945503 () Bool)

(assert (=> b!1027441 m!945503))

(declare-fun m!945505 () Bool)

(assert (=> b!1027441 m!945505))

(declare-fun m!945507 () Bool)

(assert (=> b!1027441 m!945507))

(assert (=> b!1027441 m!945501))

(declare-fun m!945509 () Bool)

(assert (=> b!1027441 m!945509))

(declare-fun m!945511 () Bool)

(assert (=> b!1027441 m!945511))

(declare-fun m!945513 () Bool)

(assert (=> b!1027441 m!945513))

(declare-fun m!945515 () Bool)

(assert (=> b!1027441 m!945515))

(declare-fun m!945517 () Bool)

(assert (=> b!1027441 m!945517))

(assert (=> b!1027441 m!945483))

(assert (=> b!1027441 m!945515))

(declare-fun m!945519 () Bool)

(assert (=> b!1027441 m!945519))

(assert (=> b!1027441 m!945479))

(assert (=> b!1027441 m!945505))

(assert (=> b!1027441 m!945495))

(declare-fun m!945521 () Bool)

(assert (=> b!1027441 m!945521))

(assert (=> b!1027457 m!945479))

(assert (=> b!1027457 m!945479))

(assert (=> b!1027457 m!945481))

(declare-fun m!945523 () Bool)

(assert (=> bm!43232 m!945523))

(assert (=> b!1027449 m!945479))

(declare-fun m!945525 () Bool)

(assert (=> b!1027449 m!945525))

(declare-fun m!945527 () Bool)

(assert (=> b!1027449 m!945527))

(assert (=> b!1027449 m!945375))

(declare-fun m!945529 () Bool)

(assert (=> b!1027449 m!945529))

(assert (=> b!1027449 m!945375))

(assert (=> b!1027449 m!945479))

(assert (=> b!1027449 m!945527))

(declare-fun m!945531 () Bool)

(assert (=> bm!43234 m!945531))

(declare-fun m!945533 () Bool)

(assert (=> bm!43231 m!945533))

(assert (=> b!1027330 d!122563))

(declare-fun d!122565 () Bool)

(declare-fun e!579885 () Bool)

(assert (=> d!122565 e!579885))

(declare-fun res!687706 () Bool)

(assert (=> d!122565 (=> (not res!687706) (not e!579885))))

(assert (=> d!122565 (= res!687706 (and (bvsge (index!41024 lt!452090) #b00000000000000000000000000000000) (bvslt (index!41024 lt!452090) (size!31607 (_keys!11233 thiss!1427)))))))

(declare-fun lt!452224 () Unit!33369)

(declare-fun choose!53 (array!64567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21839) Unit!33369)

(assert (=> d!122565 (= lt!452224 (choose!53 (_keys!11233 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41024 lt!452090) #b00000000000000000000000000000000 Nil!21836))))

(assert (=> d!122565 (bvslt (size!31607 (_keys!11233 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!122565 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11233 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41024 lt!452090) #b00000000000000000000000000000000 Nil!21836) lt!452224)))

(declare-fun b!1027462 () Bool)

(assert (=> b!1027462 (= e!579885 (arrayNoDuplicates!0 (array!64568 (store (arr!31092 (_keys!11233 thiss!1427)) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31607 (_keys!11233 thiss!1427))) #b00000000000000000000000000000000 Nil!21836))))

(assert (= (and d!122565 res!687706) b!1027462))

(declare-fun m!945535 () Bool)

(assert (=> d!122565 m!945535))

(assert (=> b!1027462 m!945367))

(declare-fun m!945537 () Bool)

(assert (=> b!1027462 m!945537))

(assert (=> b!1027330 d!122565))

(declare-fun d!122567 () Bool)

(declare-fun e!579888 () Bool)

(assert (=> d!122567 e!579888))

(declare-fun res!687709 () Bool)

(assert (=> d!122567 (=> (not res!687709) (not e!579888))))

(assert (=> d!122567 (= res!687709 (and (bvsge (index!41024 lt!452090) #b00000000000000000000000000000000) (bvslt (index!41024 lt!452090) (size!31607 (_keys!11233 thiss!1427)))))))

(declare-fun lt!452227 () Unit!33369)

(declare-fun choose!1688 (array!64567 array!64569 (_ BitVec 32) (_ BitVec 32) V!37259 V!37259 (_ BitVec 32) (_ BitVec 64) Int) Unit!33369)

(assert (=> d!122567 (= lt!452227 (choose!1688 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (index!41024 lt!452090) key!909 (defaultEntry!6090 thiss!1427)))))

(assert (=> d!122567 (validMask!0 (mask!29803 thiss!1427))))

(assert (=> d!122567 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!2 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (index!41024 lt!452090) key!909 (defaultEntry!6090 thiss!1427)) lt!452227)))

(declare-fun b!1027465 () Bool)

(assert (=> b!1027465 (= e!579888 (= (-!477 (getCurrentListMap!3852 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) key!909) (getCurrentListMap!3852 (array!64568 (store (arr!31092 (_keys!11233 thiss!1427)) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31607 (_keys!11233 thiss!1427))) (array!64570 (store (arr!31093 (_values!6113 thiss!1427)) (index!41024 lt!452090) (ValueCellFull!11441 (dynLambda!1939 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31608 (_values!6113 thiss!1427))) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427))))))

(assert (=> b!1027465 (bvslt (index!41024 lt!452090) (size!31608 (_values!6113 thiss!1427)))))

(assert (= (and d!122567 res!687709) b!1027465))

(declare-fun b_lambda!15707 () Bool)

(assert (=> (not b_lambda!15707) (not b!1027465)))

(assert (=> b!1027465 t!30892))

(declare-fun b_and!32803 () Bool)

(assert (= b_and!32801 (and (=> t!30892 result!14081) b_and!32803)))

(declare-fun m!945539 () Bool)

(assert (=> d!122567 m!945539))

(assert (=> d!122567 m!945477))

(declare-fun m!945541 () Bool)

(assert (=> b!1027465 m!945541))

(assert (=> b!1027465 m!945365))

(assert (=> b!1027465 m!945367))

(assert (=> b!1027465 m!945361))

(assert (=> b!1027465 m!945375))

(assert (=> b!1027465 m!945361))

(assert (=> b!1027465 m!945369))

(assert (=> b!1027330 d!122567))

(declare-fun d!122569 () Bool)

(declare-fun e!579891 () Bool)

(assert (=> d!122569 e!579891))

(declare-fun res!687712 () Bool)

(assert (=> d!122569 (=> (not res!687712) (not e!579891))))

(assert (=> d!122569 (= res!687712 (bvslt (index!41024 lt!452090) (size!31607 (_keys!11233 thiss!1427))))))

(declare-fun lt!452230 () Unit!33369)

(declare-fun choose!121 (array!64567 (_ BitVec 32) (_ BitVec 64)) Unit!33369)

(assert (=> d!122569 (= lt!452230 (choose!121 (_keys!11233 thiss!1427) (index!41024 lt!452090) key!909))))

(assert (=> d!122569 (bvsge (index!41024 lt!452090) #b00000000000000000000000000000000)))

(assert (=> d!122569 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11233 thiss!1427) (index!41024 lt!452090) key!909) lt!452230)))

(declare-fun b!1027468 () Bool)

(assert (=> b!1027468 (= e!579891 (not (arrayContainsKey!0 (array!64568 (store (arr!31092 (_keys!11233 thiss!1427)) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31607 (_keys!11233 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!122569 res!687712) b!1027468))

(declare-fun m!945543 () Bool)

(assert (=> d!122569 m!945543))

(assert (=> b!1027468 m!945367))

(declare-fun m!945545 () Bool)

(assert (=> b!1027468 m!945545))

(assert (=> b!1027330 d!122569))

(declare-fun d!122571 () Bool)

(declare-fun e!579894 () Bool)

(assert (=> d!122571 e!579894))

(declare-fun res!687715 () Bool)

(assert (=> d!122571 (=> (not res!687715) (not e!579894))))

(assert (=> d!122571 (= res!687715 (and (bvsge (index!41024 lt!452090) #b00000000000000000000000000000000) (bvslt (index!41024 lt!452090) (size!31607 (_keys!11233 thiss!1427)))))))

(declare-fun lt!452233 () Unit!33369)

(declare-fun choose!25 (array!64567 (_ BitVec 32) (_ BitVec 32)) Unit!33369)

(assert (=> d!122571 (= lt!452233 (choose!25 (_keys!11233 thiss!1427) (index!41024 lt!452090) (mask!29803 thiss!1427)))))

(assert (=> d!122571 (validMask!0 (mask!29803 thiss!1427))))

(assert (=> d!122571 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11233 thiss!1427) (index!41024 lt!452090) (mask!29803 thiss!1427)) lt!452233)))

(declare-fun b!1027471 () Bool)

(assert (=> b!1027471 (= e!579894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64568 (store (arr!31092 (_keys!11233 thiss!1427)) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31607 (_keys!11233 thiss!1427))) (mask!29803 thiss!1427)))))

(assert (= (and d!122571 res!687715) b!1027471))

(declare-fun m!945547 () Bool)

(assert (=> d!122571 m!945547))

(assert (=> d!122571 m!945477))

(assert (=> b!1027471 m!945367))

(declare-fun m!945549 () Bool)

(assert (=> b!1027471 m!945549))

(assert (=> b!1027330 d!122571))

(declare-fun d!122573 () Bool)

(declare-fun Unit!33382 () Unit!33369)

(declare-fun Unit!33383 () Unit!33369)

(declare-fun Unit!33384 () Unit!33369)

(declare-fun Unit!33385 () Unit!33369)

(declare-fun Unit!33386 () Unit!33369)

(declare-fun Unit!33387 () Unit!33369)

(declare-fun Unit!33388 () Unit!33369)

(declare-fun Unit!33389 () Unit!33369)

(declare-fun Unit!33390 () Unit!33369)

(declare-fun Unit!33391 () Unit!33369)

(declare-fun Unit!33392 () Unit!33369)

(declare-fun Unit!33393 () Unit!33369)

(declare-fun Unit!33394 () Unit!33369)

(declare-fun Unit!33395 () Unit!33369)

(declare-fun Unit!33396 () Unit!33369)

(declare-fun Unit!33397 () Unit!33369)

(declare-fun Unit!33398 () Unit!33369)

(declare-fun Unit!33399 () Unit!33369)

(declare-fun Unit!33400 () Unit!33369)

(declare-fun Unit!33401 () Unit!33369)

(declare-fun Unit!33402 () Unit!33369)

(declare-fun Unit!33403 () Unit!33369)

(declare-fun Unit!33404 () Unit!33369)

(declare-fun Unit!33405 () Unit!33369)

(declare-fun Unit!33406 () Unit!33369)

(declare-fun Unit!33407 () Unit!33369)

(declare-fun Unit!33408 () Unit!33369)

(declare-fun Unit!33409 () Unit!33369)

(declare-fun Unit!33410 () Unit!33369)

(declare-fun Unit!33411 () Unit!33369)

(declare-fun Unit!33412 () Unit!33369)

(declare-fun Unit!33413 () Unit!33369)

(declare-fun Unit!33414 () Unit!33369)

(declare-fun Unit!33415 () Unit!33369)

(declare-fun Unit!33416 () Unit!33369)

(declare-fun Unit!33417 () Unit!33369)

(declare-fun Unit!33418 () Unit!33369)

(declare-fun Unit!33419 () Unit!33369)

(declare-fun Unit!33420 () Unit!33369)

(declare-fun Unit!33421 () Unit!33369)

(declare-fun Unit!33422 () Unit!33369)

(declare-fun Unit!33423 () Unit!33369)

(declare-fun Unit!33424 () Unit!33369)

(declare-fun Unit!33425 () Unit!33369)

(declare-fun Unit!33426 () Unit!33369)

(declare-fun Unit!33427 () Unit!33369)

(declare-fun Unit!33428 () Unit!33369)

(declare-fun Unit!33429 () Unit!33369)

(declare-fun Unit!33430 () Unit!33369)

(declare-fun Unit!33431 () Unit!33369)

(declare-fun Unit!33432 () Unit!33369)

(declare-fun Unit!33433 () Unit!33369)

(declare-fun Unit!33434 () Unit!33369)

(declare-fun Unit!33435 () Unit!33369)

(declare-fun Unit!33436 () Unit!33369)

(declare-fun Unit!33437 () Unit!33369)

(declare-fun Unit!33438 () Unit!33369)

(declare-fun Unit!33439 () Unit!33369)

(declare-fun Unit!33440 () Unit!33369)

(declare-fun Unit!33441 () Unit!33369)

(assert (=> d!122573 (= (validMask!0 (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33382 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33383 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427))))))) (and (or (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33384 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33385 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000000000111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33386 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33387 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000000001111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33388 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33389 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000000011111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33390 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33391 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000000111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33392 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33393 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000001111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33394 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33395 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000011111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33396 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33397 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000000111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33398 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33399 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000001111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33400 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33401 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000011111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33402 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33403 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000000111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33404 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33405 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000001111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33406 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33407 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000011111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33408 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33409 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000000111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33410 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33411 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000001111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33412 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33413 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000011111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33414 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33415 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000000111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33416 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33417 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000001111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33418 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33419 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000011111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33420 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33421 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000000111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33422 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33423 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000001111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33424 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33425 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000011111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33426 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33427 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000000111111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33428 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33429 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000001111111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33430 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33431 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000011111111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33432 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33433 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00000111111111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33434 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33435 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00001111111111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33436 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33437 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00011111111111111111111111111111) (= (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33438 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33439 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00111111111111111111111111111111)) (bvsle (mask!29803 (_2!7814 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15607 Unit!33440 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (bvadd #b00000000000000000000000000000001 (_vacant!2793 thiss!1427)))) (tuple2!15607 Unit!33441 (LongMapFixedSize!5477 (defaultEntry!6090 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) (bvsub (_size!2793 thiss!1427) #b00000000000000000000000000000001) lt!452091 lt!452095 (_vacant!2793 thiss!1427)))))) #b00111111111111111111111111111111)))))

(assert (=> b!1027330 d!122573))

(declare-fun d!122575 () Bool)

(declare-fun res!687720 () Bool)

(declare-fun e!579899 () Bool)

(assert (=> d!122575 (=> res!687720 e!579899)))

(assert (=> d!122575 (= res!687720 (= (select (arr!31092 lt!452091) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122575 (= (arrayContainsKey!0 lt!452091 key!909 #b00000000000000000000000000000000) e!579899)))

(declare-fun b!1027476 () Bool)

(declare-fun e!579900 () Bool)

(assert (=> b!1027476 (= e!579899 e!579900)))

(declare-fun res!687721 () Bool)

(assert (=> b!1027476 (=> (not res!687721) (not e!579900))))

(assert (=> b!1027476 (= res!687721 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31607 lt!452091)))))

(declare-fun b!1027477 () Bool)

(assert (=> b!1027477 (= e!579900 (arrayContainsKey!0 lt!452091 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122575 (not res!687720)) b!1027476))

(assert (= (and b!1027476 res!687721) b!1027477))

(assert (=> d!122575 m!945479))

(declare-fun m!945551 () Bool)

(assert (=> b!1027477 m!945551))

(assert (=> b!1027330 d!122575))

(declare-fun b!1027486 () Bool)

(declare-fun e!579905 () (_ BitVec 32))

(assert (=> b!1027486 (= e!579905 #b00000000000000000000000000000000)))

(declare-fun b!1027487 () Bool)

(declare-fun e!579906 () (_ BitVec 32))

(declare-fun call!43243 () (_ BitVec 32))

(assert (=> b!1027487 (= e!579906 (bvadd #b00000000000000000000000000000001 call!43243))))

(declare-fun d!122577 () Bool)

(declare-fun lt!452236 () (_ BitVec 32))

(assert (=> d!122577 (and (bvsge lt!452236 #b00000000000000000000000000000000) (bvsle lt!452236 (bvsub (size!31607 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122577 (= lt!452236 e!579905)))

(declare-fun c!103564 () Bool)

(assert (=> d!122577 (= c!103564 (bvsge #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))))))

(assert (=> d!122577 (and (bvsle #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31607 (_keys!11233 thiss!1427)) (size!31607 (_keys!11233 thiss!1427))))))

(assert (=> d!122577 (= (arrayCountValidKeys!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) lt!452236)))

(declare-fun bm!43240 () Bool)

(assert (=> bm!43240 (= call!43243 (arrayCountValidKeys!0 (_keys!11233 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31607 (_keys!11233 thiss!1427))))))

(declare-fun b!1027488 () Bool)

(assert (=> b!1027488 (= e!579906 call!43243)))

(declare-fun b!1027489 () Bool)

(assert (=> b!1027489 (= e!579905 e!579906)))

(declare-fun c!103563 () Bool)

(assert (=> b!1027489 (= c!103563 (validKeyInArray!0 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!122577 c!103564) b!1027486))

(assert (= (and d!122577 (not c!103564)) b!1027489))

(assert (= (and b!1027489 c!103563) b!1027487))

(assert (= (and b!1027489 (not c!103563)) b!1027488))

(assert (= (or b!1027487 b!1027488) bm!43240))

(declare-fun m!945553 () Bool)

(assert (=> bm!43240 m!945553))

(declare-fun m!945555 () Bool)

(assert (=> b!1027489 m!945555))

(assert (=> b!1027489 m!945555))

(declare-fun m!945557 () Bool)

(assert (=> b!1027489 m!945557))

(assert (=> b!1027330 d!122577))

(declare-fun b!1027498 () Bool)

(declare-fun e!579915 () Bool)

(declare-fun call!43246 () Bool)

(assert (=> b!1027498 (= e!579915 call!43246)))

(declare-fun b!1027499 () Bool)

(declare-fun e!579914 () Bool)

(assert (=> b!1027499 (= e!579914 call!43246)))

(declare-fun b!1027500 () Bool)

(assert (=> b!1027500 (= e!579914 e!579915)))

(declare-fun lt!452245 () (_ BitVec 64))

(assert (=> b!1027500 (= lt!452245 (select (arr!31092 lt!452091) #b00000000000000000000000000000000))))

(declare-fun lt!452244 () Unit!33369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64567 (_ BitVec 64) (_ BitVec 32)) Unit!33369)

(assert (=> b!1027500 (= lt!452244 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452091 lt!452245 #b00000000000000000000000000000000))))

(assert (=> b!1027500 (arrayContainsKey!0 lt!452091 lt!452245 #b00000000000000000000000000000000)))

(declare-fun lt!452243 () Unit!33369)

(assert (=> b!1027500 (= lt!452243 lt!452244)))

(declare-fun res!687726 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64567 (_ BitVec 32)) SeekEntryResult!9663)

(assert (=> b!1027500 (= res!687726 (= (seekEntryOrOpen!0 (select (arr!31092 lt!452091) #b00000000000000000000000000000000) lt!452091 (mask!29803 thiss!1427)) (Found!9663 #b00000000000000000000000000000000)))))

(assert (=> b!1027500 (=> (not res!687726) (not e!579915))))

(declare-fun d!122579 () Bool)

(declare-fun res!687727 () Bool)

(declare-fun e!579913 () Bool)

(assert (=> d!122579 (=> res!687727 e!579913)))

(assert (=> d!122579 (= res!687727 (bvsge #b00000000000000000000000000000000 (size!31607 lt!452091)))))

(assert (=> d!122579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452091 (mask!29803 thiss!1427)) e!579913)))

(declare-fun b!1027501 () Bool)

(assert (=> b!1027501 (= e!579913 e!579914)))

(declare-fun c!103567 () Bool)

(assert (=> b!1027501 (= c!103567 (validKeyInArray!0 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)))))

(declare-fun bm!43243 () Bool)

(assert (=> bm!43243 (= call!43246 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452091 (mask!29803 thiss!1427)))))

(assert (= (and d!122579 (not res!687727)) b!1027501))

(assert (= (and b!1027501 c!103567) b!1027500))

(assert (= (and b!1027501 (not c!103567)) b!1027499))

(assert (= (and b!1027500 res!687726) b!1027498))

(assert (= (or b!1027498 b!1027499) bm!43243))

(assert (=> b!1027500 m!945479))

(declare-fun m!945559 () Bool)

(assert (=> b!1027500 m!945559))

(declare-fun m!945561 () Bool)

(assert (=> b!1027500 m!945561))

(assert (=> b!1027500 m!945479))

(declare-fun m!945563 () Bool)

(assert (=> b!1027500 m!945563))

(assert (=> b!1027501 m!945479))

(assert (=> b!1027501 m!945479))

(assert (=> b!1027501 m!945481))

(declare-fun m!945565 () Bool)

(assert (=> bm!43243 m!945565))

(assert (=> b!1027330 d!122579))

(declare-fun b!1027511 () Bool)

(declare-fun res!687736 () Bool)

(declare-fun e!579921 () Bool)

(assert (=> b!1027511 (=> (not res!687736) (not e!579921))))

(assert (=> b!1027511 (= res!687736 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1027510 () Bool)

(declare-fun res!687738 () Bool)

(assert (=> b!1027510 (=> (not res!687738) (not e!579921))))

(assert (=> b!1027510 (= res!687738 (validKeyInArray!0 (select (arr!31092 (_keys!11233 thiss!1427)) (index!41024 lt!452090))))))

(declare-fun d!122581 () Bool)

(declare-fun e!579920 () Bool)

(assert (=> d!122581 e!579920))

(declare-fun res!687739 () Bool)

(assert (=> d!122581 (=> (not res!687739) (not e!579920))))

(assert (=> d!122581 (= res!687739 (and (bvsge (index!41024 lt!452090) #b00000000000000000000000000000000) (bvslt (index!41024 lt!452090) (size!31607 (_keys!11233 thiss!1427)))))))

(declare-fun lt!452248 () Unit!33369)

(declare-fun choose!82 (array!64567 (_ BitVec 32) (_ BitVec 64)) Unit!33369)

(assert (=> d!122581 (= lt!452248 (choose!82 (_keys!11233 thiss!1427) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122581 e!579921))

(declare-fun res!687737 () Bool)

(assert (=> d!122581 (=> (not res!687737) (not e!579921))))

(assert (=> d!122581 (= res!687737 (and (bvsge (index!41024 lt!452090) #b00000000000000000000000000000000) (bvslt (index!41024 lt!452090) (size!31607 (_keys!11233 thiss!1427)))))))

(assert (=> d!122581 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11233 thiss!1427) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000) lt!452248)))

(declare-fun b!1027513 () Bool)

(assert (=> b!1027513 (= e!579920 (= (arrayCountValidKeys!0 (array!64568 (store (arr!31092 (_keys!11233 thiss!1427)) (index!41024 lt!452090) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31607 (_keys!11233 thiss!1427))) #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1027512 () Bool)

(assert (=> b!1027512 (= e!579921 (bvslt (size!31607 (_keys!11233 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!122581 res!687737) b!1027510))

(assert (= (and b!1027510 res!687738) b!1027511))

(assert (= (and b!1027511 res!687736) b!1027512))

(assert (= (and d!122581 res!687739) b!1027513))

(declare-fun m!945567 () Bool)

(assert (=> b!1027511 m!945567))

(declare-fun m!945569 () Bool)

(assert (=> b!1027510 m!945569))

(assert (=> b!1027510 m!945569))

(declare-fun m!945571 () Bool)

(assert (=> b!1027510 m!945571))

(declare-fun m!945573 () Bool)

(assert (=> d!122581 m!945573))

(assert (=> b!1027513 m!945367))

(declare-fun m!945575 () Bool)

(assert (=> b!1027513 m!945575))

(assert (=> b!1027513 m!945353))

(assert (=> b!1027330 d!122581))

(declare-fun c!103572 () Bool)

(declare-fun call!43253 () ListLongMap!13739)

(declare-fun bm!43244 () Bool)

(declare-fun call!43251 () ListLongMap!13739)

(declare-fun call!43248 () ListLongMap!13739)

(declare-fun call!43247 () ListLongMap!13739)

(declare-fun c!103569 () Bool)

(assert (=> bm!43244 (= call!43248 (+!3123 (ite c!103569 call!43247 (ite c!103572 call!43253 call!43251)) (ite (or c!103569 c!103572) (tuple2!15609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5926 thiss!1427)) (tuple2!15609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5926 thiss!1427)))))))

(declare-fun b!1027514 () Bool)

(declare-fun e!579929 () ListLongMap!13739)

(assert (=> b!1027514 (= e!579929 (+!3123 call!43248 (tuple2!15609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5926 thiss!1427))))))

(declare-fun b!1027515 () Bool)

(declare-fun res!687741 () Bool)

(declare-fun e!579925 () Bool)

(assert (=> b!1027515 (=> (not res!687741) (not e!579925))))

(declare-fun e!579932 () Bool)

(assert (=> b!1027515 (= res!687741 e!579932)))

(declare-fun c!103568 () Bool)

(assert (=> b!1027515 (= c!103568 (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1027516 () Bool)

(declare-fun e!579930 () Unit!33369)

(declare-fun lt!452252 () Unit!33369)

(assert (=> b!1027516 (= e!579930 lt!452252)))

(declare-fun lt!452251 () ListLongMap!13739)

(assert (=> b!1027516 (= lt!452251 (getCurrentListMapNoExtraKeys!3558 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452250 () (_ BitVec 64))

(assert (=> b!1027516 (= lt!452250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452256 () (_ BitVec 64))

(assert (=> b!1027516 (= lt!452256 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452253 () Unit!33369)

(assert (=> b!1027516 (= lt!452253 (addStillContains!611 lt!452251 lt!452250 (zeroValue!5926 thiss!1427) lt!452256))))

(assert (=> b!1027516 (contains!5941 (+!3123 lt!452251 (tuple2!15609 lt!452250 (zeroValue!5926 thiss!1427))) lt!452256)))

(declare-fun lt!452269 () Unit!33369)

(assert (=> b!1027516 (= lt!452269 lt!452253)))

(declare-fun lt!452257 () ListLongMap!13739)

(assert (=> b!1027516 (= lt!452257 (getCurrentListMapNoExtraKeys!3558 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452255 () (_ BitVec 64))

(assert (=> b!1027516 (= lt!452255 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452254 () (_ BitVec 64))

(assert (=> b!1027516 (= lt!452254 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452260 () Unit!33369)

(assert (=> b!1027516 (= lt!452260 (addApplyDifferent!467 lt!452257 lt!452255 (minValue!5926 thiss!1427) lt!452254))))

(assert (=> b!1027516 (= (apply!892 (+!3123 lt!452257 (tuple2!15609 lt!452255 (minValue!5926 thiss!1427))) lt!452254) (apply!892 lt!452257 lt!452254))))

(declare-fun lt!452249 () Unit!33369)

(assert (=> b!1027516 (= lt!452249 lt!452260)))

(declare-fun lt!452258 () ListLongMap!13739)

(assert (=> b!1027516 (= lt!452258 (getCurrentListMapNoExtraKeys!3558 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452263 () (_ BitVec 64))

(assert (=> b!1027516 (= lt!452263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452259 () (_ BitVec 64))

(assert (=> b!1027516 (= lt!452259 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452267 () Unit!33369)

(assert (=> b!1027516 (= lt!452267 (addApplyDifferent!467 lt!452258 lt!452263 (zeroValue!5926 thiss!1427) lt!452259))))

(assert (=> b!1027516 (= (apply!892 (+!3123 lt!452258 (tuple2!15609 lt!452263 (zeroValue!5926 thiss!1427))) lt!452259) (apply!892 lt!452258 lt!452259))))

(declare-fun lt!452270 () Unit!33369)

(assert (=> b!1027516 (= lt!452270 lt!452267)))

(declare-fun lt!452265 () ListLongMap!13739)

(assert (=> b!1027516 (= lt!452265 (getCurrentListMapNoExtraKeys!3558 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun lt!452262 () (_ BitVec 64))

(assert (=> b!1027516 (= lt!452262 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452264 () (_ BitVec 64))

(assert (=> b!1027516 (= lt!452264 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027516 (= lt!452252 (addApplyDifferent!467 lt!452265 lt!452262 (minValue!5926 thiss!1427) lt!452264))))

(assert (=> b!1027516 (= (apply!892 (+!3123 lt!452265 (tuple2!15609 lt!452262 (minValue!5926 thiss!1427))) lt!452264) (apply!892 lt!452265 lt!452264))))

(declare-fun b!1027517 () Bool)

(declare-fun e!579934 () Bool)

(declare-fun call!43252 () Bool)

(assert (=> b!1027517 (= e!579934 (not call!43252))))

(declare-fun b!1027518 () Bool)

(declare-fun e!579933 () Bool)

(declare-fun lt!452268 () ListLongMap!13739)

(assert (=> b!1027518 (= e!579933 (= (apply!892 lt!452268 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5926 thiss!1427)))))

(declare-fun b!1027519 () Bool)

(declare-fun e!579926 () ListLongMap!13739)

(declare-fun call!43249 () ListLongMap!13739)

(assert (=> b!1027519 (= e!579926 call!43249)))

(declare-fun b!1027521 () Bool)

(declare-fun call!43250 () Bool)

(assert (=> b!1027521 (= e!579932 (not call!43250))))

(declare-fun b!1027522 () Bool)

(declare-fun e!579927 () Bool)

(assert (=> b!1027522 (= e!579927 (validKeyInArray!0 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1027523 () Bool)

(assert (=> b!1027523 (= e!579925 e!579934)))

(declare-fun c!103570 () Bool)

(assert (=> b!1027523 (= c!103570 (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43245 () Bool)

(assert (=> bm!43245 (= call!43250 (contains!5941 lt!452268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027524 () Bool)

(declare-fun e!579923 () Bool)

(assert (=> b!1027524 (= e!579923 (= (apply!892 lt!452268 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000)) (get!16333 (select (arr!31093 (_values!6113 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1939 (defaultEntry!6090 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31608 (_values!6113 thiss!1427))))))

(assert (=> b!1027524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))))))

(declare-fun b!1027525 () Bool)

(declare-fun c!103573 () Bool)

(assert (=> b!1027525 (= c!103573 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!579931 () ListLongMap!13739)

(assert (=> b!1027525 (= e!579931 e!579926)))

(declare-fun b!1027526 () Bool)

(assert (=> b!1027526 (= e!579931 call!43249)))

(declare-fun bm!43246 () Bool)

(assert (=> bm!43246 (= call!43249 call!43248)))

(declare-fun b!1027527 () Bool)

(declare-fun Unit!33442 () Unit!33369)

(assert (=> b!1027527 (= e!579930 Unit!33442)))

(declare-fun b!1027528 () Bool)

(assert (=> b!1027528 (= e!579929 e!579931)))

(assert (=> b!1027528 (= c!103572 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027529 () Bool)

(assert (=> b!1027529 (= e!579926 call!43251)))

(declare-fun b!1027530 () Bool)

(declare-fun e!579928 () Bool)

(assert (=> b!1027530 (= e!579928 e!579923)))

(declare-fun res!687747 () Bool)

(assert (=> b!1027530 (=> (not res!687747) (not e!579923))))

(assert (=> b!1027530 (= res!687747 (contains!5941 lt!452268 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1027530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))))))

(declare-fun b!1027531 () Bool)

(declare-fun e!579922 () Bool)

(assert (=> b!1027531 (= e!579922 (= (apply!892 lt!452268 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5926 thiss!1427)))))

(declare-fun b!1027532 () Bool)

(declare-fun e!579924 () Bool)

(assert (=> b!1027532 (= e!579924 (validKeyInArray!0 (select (arr!31092 (_keys!11233 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43247 () Bool)

(assert (=> bm!43247 (= call!43252 (contains!5941 lt!452268 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027520 () Bool)

(assert (=> b!1027520 (= e!579932 e!579933)))

(declare-fun res!687740 () Bool)

(assert (=> b!1027520 (= res!687740 call!43250)))

(assert (=> b!1027520 (=> (not res!687740) (not e!579933))))

(declare-fun d!122583 () Bool)

(assert (=> d!122583 e!579925))

(declare-fun res!687743 () Bool)

(assert (=> d!122583 (=> (not res!687743) (not e!579925))))

(assert (=> d!122583 (= res!687743 (or (bvsge #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))))))))

(declare-fun lt!452266 () ListLongMap!13739)

(assert (=> d!122583 (= lt!452268 lt!452266)))

(declare-fun lt!452261 () Unit!33369)

(assert (=> d!122583 (= lt!452261 e!579930)))

(declare-fun c!103571 () Bool)

(assert (=> d!122583 (= c!103571 e!579927)))

(declare-fun res!687742 () Bool)

(assert (=> d!122583 (=> (not res!687742) (not e!579927))))

(assert (=> d!122583 (= res!687742 (bvslt #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))))))

(assert (=> d!122583 (= lt!452266 e!579929)))

(assert (=> d!122583 (= c!103569 (and (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5822 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122583 (validMask!0 (mask!29803 thiss!1427))))

(assert (=> d!122583 (= (getCurrentListMap!3852 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) lt!452268)))

(declare-fun b!1027533 () Bool)

(declare-fun res!687748 () Bool)

(assert (=> b!1027533 (=> (not res!687748) (not e!579925))))

(assert (=> b!1027533 (= res!687748 e!579928)))

(declare-fun res!687744 () Bool)

(assert (=> b!1027533 (=> res!687744 e!579928)))

(assert (=> b!1027533 (= res!687744 (not e!579924))))

(declare-fun res!687746 () Bool)

(assert (=> b!1027533 (=> (not res!687746) (not e!579924))))

(assert (=> b!1027533 (= res!687746 (bvslt #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))))))

(declare-fun bm!43248 () Bool)

(assert (=> bm!43248 (= call!43253 call!43247)))

(declare-fun bm!43249 () Bool)

(assert (=> bm!43249 (= call!43247 (getCurrentListMapNoExtraKeys!3558 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)))))

(declare-fun b!1027534 () Bool)

(assert (=> b!1027534 (= e!579934 e!579922)))

(declare-fun res!687745 () Bool)

(assert (=> b!1027534 (= res!687745 call!43252)))

(assert (=> b!1027534 (=> (not res!687745) (not e!579922))))

(declare-fun bm!43250 () Bool)

(assert (=> bm!43250 (= call!43251 call!43253)))

(assert (= (and d!122583 c!103569) b!1027514))

(assert (= (and d!122583 (not c!103569)) b!1027528))

(assert (= (and b!1027528 c!103572) b!1027526))

(assert (= (and b!1027528 (not c!103572)) b!1027525))

(assert (= (and b!1027525 c!103573) b!1027519))

(assert (= (and b!1027525 (not c!103573)) b!1027529))

(assert (= (or b!1027519 b!1027529) bm!43250))

(assert (= (or b!1027526 bm!43250) bm!43248))

(assert (= (or b!1027526 b!1027519) bm!43246))

(assert (= (or b!1027514 bm!43248) bm!43249))

(assert (= (or b!1027514 bm!43246) bm!43244))

(assert (= (and d!122583 res!687742) b!1027522))

(assert (= (and d!122583 c!103571) b!1027516))

(assert (= (and d!122583 (not c!103571)) b!1027527))

(assert (= (and d!122583 res!687743) b!1027533))

(assert (= (and b!1027533 res!687746) b!1027532))

(assert (= (and b!1027533 (not res!687744)) b!1027530))

(assert (= (and b!1027530 res!687747) b!1027524))

(assert (= (and b!1027533 res!687748) b!1027515))

(assert (= (and b!1027515 c!103568) b!1027520))

(assert (= (and b!1027515 (not c!103568)) b!1027521))

(assert (= (and b!1027520 res!687740) b!1027518))

(assert (= (or b!1027520 b!1027521) bm!43245))

(assert (= (and b!1027515 res!687741) b!1027523))

(assert (= (and b!1027523 c!103570) b!1027534))

(assert (= (and b!1027523 (not c!103570)) b!1027517))

(assert (= (and b!1027534 res!687745) b!1027531))

(assert (= (or b!1027534 b!1027517) bm!43247))

(declare-fun b_lambda!15709 () Bool)

(assert (=> (not b_lambda!15709) (not b!1027524)))

(assert (=> b!1027524 t!30892))

(declare-fun b_and!32805 () Bool)

(assert (= b_and!32803 (and (=> t!30892 result!14081) b_and!32805)))

(assert (=> b!1027522 m!945555))

(assert (=> b!1027522 m!945555))

(assert (=> b!1027522 m!945557))

(declare-fun m!945577 () Bool)

(assert (=> bm!43249 m!945577))

(declare-fun m!945579 () Bool)

(assert (=> b!1027518 m!945579))

(declare-fun m!945581 () Bool)

(assert (=> b!1027531 m!945581))

(declare-fun m!945583 () Bool)

(assert (=> b!1027514 m!945583))

(assert (=> d!122583 m!945477))

(assert (=> b!1027530 m!945555))

(assert (=> b!1027530 m!945555))

(declare-fun m!945585 () Bool)

(assert (=> b!1027530 m!945585))

(declare-fun m!945587 () Bool)

(assert (=> b!1027516 m!945587))

(declare-fun m!945589 () Bool)

(assert (=> b!1027516 m!945589))

(declare-fun m!945591 () Bool)

(assert (=> b!1027516 m!945591))

(declare-fun m!945593 () Bool)

(assert (=> b!1027516 m!945593))

(declare-fun m!945595 () Bool)

(assert (=> b!1027516 m!945595))

(declare-fun m!945597 () Bool)

(assert (=> b!1027516 m!945597))

(declare-fun m!945599 () Bool)

(assert (=> b!1027516 m!945599))

(declare-fun m!945601 () Bool)

(assert (=> b!1027516 m!945601))

(assert (=> b!1027516 m!945595))

(declare-fun m!945603 () Bool)

(assert (=> b!1027516 m!945603))

(declare-fun m!945605 () Bool)

(assert (=> b!1027516 m!945605))

(declare-fun m!945607 () Bool)

(assert (=> b!1027516 m!945607))

(declare-fun m!945609 () Bool)

(assert (=> b!1027516 m!945609))

(declare-fun m!945611 () Bool)

(assert (=> b!1027516 m!945611))

(assert (=> b!1027516 m!945577))

(assert (=> b!1027516 m!945609))

(declare-fun m!945613 () Bool)

(assert (=> b!1027516 m!945613))

(assert (=> b!1027516 m!945555))

(assert (=> b!1027516 m!945599))

(assert (=> b!1027516 m!945589))

(declare-fun m!945615 () Bool)

(assert (=> b!1027516 m!945615))

(assert (=> b!1027532 m!945555))

(assert (=> b!1027532 m!945555))

(assert (=> b!1027532 m!945557))

(declare-fun m!945617 () Bool)

(assert (=> bm!43245 m!945617))

(assert (=> b!1027524 m!945555))

(declare-fun m!945619 () Bool)

(assert (=> b!1027524 m!945619))

(declare-fun m!945621 () Bool)

(assert (=> b!1027524 m!945621))

(assert (=> b!1027524 m!945375))

(declare-fun m!945623 () Bool)

(assert (=> b!1027524 m!945623))

(assert (=> b!1027524 m!945375))

(assert (=> b!1027524 m!945555))

(assert (=> b!1027524 m!945621))

(declare-fun m!945625 () Bool)

(assert (=> bm!43247 m!945625))

(declare-fun m!945627 () Bool)

(assert (=> bm!43244 m!945627))

(assert (=> b!1027330 d!122583))

(declare-fun d!122585 () Bool)

(declare-fun res!687756 () Bool)

(declare-fun e!579943 () Bool)

(assert (=> d!122585 (=> res!687756 e!579943)))

(assert (=> d!122585 (= res!687756 (bvsge #b00000000000000000000000000000000 (size!31607 lt!452091)))))

(assert (=> d!122585 (= (arrayNoDuplicates!0 lt!452091 #b00000000000000000000000000000000 Nil!21836) e!579943)))

(declare-fun b!1027545 () Bool)

(declare-fun e!579944 () Bool)

(assert (=> b!1027545 (= e!579943 e!579944)))

(declare-fun res!687755 () Bool)

(assert (=> b!1027545 (=> (not res!687755) (not e!579944))))

(declare-fun e!579945 () Bool)

(assert (=> b!1027545 (= res!687755 (not e!579945))))

(declare-fun res!687757 () Bool)

(assert (=> b!1027545 (=> (not res!687757) (not e!579945))))

(assert (=> b!1027545 (= res!687757 (validKeyInArray!0 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)))))

(declare-fun b!1027546 () Bool)

(declare-fun e!579946 () Bool)

(assert (=> b!1027546 (= e!579944 e!579946)))

(declare-fun c!103576 () Bool)

(assert (=> b!1027546 (= c!103576 (validKeyInArray!0 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)))))

(declare-fun b!1027547 () Bool)

(declare-fun call!43256 () Bool)

(assert (=> b!1027547 (= e!579946 call!43256)))

(declare-fun b!1027548 () Bool)

(declare-fun contains!5942 (List!21839 (_ BitVec 64)) Bool)

(assert (=> b!1027548 (= e!579945 (contains!5942 Nil!21836 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)))))

(declare-fun b!1027549 () Bool)

(assert (=> b!1027549 (= e!579946 call!43256)))

(declare-fun bm!43253 () Bool)

(assert (=> bm!43253 (= call!43256 (arrayNoDuplicates!0 lt!452091 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103576 (Cons!21835 (select (arr!31092 lt!452091) #b00000000000000000000000000000000) Nil!21836) Nil!21836)))))

(assert (= (and d!122585 (not res!687756)) b!1027545))

(assert (= (and b!1027545 res!687757) b!1027548))

(assert (= (and b!1027545 res!687755) b!1027546))

(assert (= (and b!1027546 c!103576) b!1027549))

(assert (= (and b!1027546 (not c!103576)) b!1027547))

(assert (= (or b!1027549 b!1027547) bm!43253))

(assert (=> b!1027545 m!945479))

(assert (=> b!1027545 m!945479))

(assert (=> b!1027545 m!945481))

(assert (=> b!1027546 m!945479))

(assert (=> b!1027546 m!945479))

(assert (=> b!1027546 m!945481))

(assert (=> b!1027548 m!945479))

(assert (=> b!1027548 m!945479))

(declare-fun m!945629 () Bool)

(assert (=> b!1027548 m!945629))

(assert (=> bm!43253 m!945479))

(declare-fun m!945631 () Bool)

(assert (=> bm!43253 m!945631))

(assert (=> b!1027330 d!122585))

(declare-fun d!122587 () Bool)

(declare-fun lt!452273 () ListLongMap!13739)

(assert (=> d!122587 (not (contains!5941 lt!452273 key!909))))

(declare-fun removeStrictlySorted!49 (List!21838 (_ BitVec 64)) List!21838)

(assert (=> d!122587 (= lt!452273 (ListLongMap!13740 (removeStrictlySorted!49 (toList!6885 (getCurrentListMap!3852 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427))) key!909)))))

(assert (=> d!122587 (= (-!477 (getCurrentListMap!3852 (_keys!11233 thiss!1427) (_values!6113 thiss!1427) (mask!29803 thiss!1427) (extraKeys!5822 thiss!1427) (zeroValue!5926 thiss!1427) (minValue!5926 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6090 thiss!1427)) key!909) lt!452273)))

(declare-fun bs!29961 () Bool)

(assert (= bs!29961 d!122587))

(declare-fun m!945633 () Bool)

(assert (=> bs!29961 m!945633))

(declare-fun m!945635 () Bool)

(assert (=> bs!29961 m!945635))

(assert (=> b!1027330 d!122587))

(declare-fun b!1027550 () Bool)

(declare-fun e!579947 () (_ BitVec 32))

(assert (=> b!1027550 (= e!579947 #b00000000000000000000000000000000)))

(declare-fun b!1027551 () Bool)

(declare-fun e!579948 () (_ BitVec 32))

(declare-fun call!43257 () (_ BitVec 32))

(assert (=> b!1027551 (= e!579948 (bvadd #b00000000000000000000000000000001 call!43257))))

(declare-fun d!122589 () Bool)

(declare-fun lt!452274 () (_ BitVec 32))

(assert (=> d!122589 (and (bvsge lt!452274 #b00000000000000000000000000000000) (bvsle lt!452274 (bvsub (size!31607 lt!452091) #b00000000000000000000000000000000)))))

(assert (=> d!122589 (= lt!452274 e!579947)))

(declare-fun c!103578 () Bool)

(assert (=> d!122589 (= c!103578 (bvsge #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))))))

(assert (=> d!122589 (and (bvsle #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31607 (_keys!11233 thiss!1427)) (size!31607 lt!452091)))))

(assert (=> d!122589 (= (arrayCountValidKeys!0 lt!452091 #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) lt!452274)))

(declare-fun bm!43254 () Bool)

(assert (=> bm!43254 (= call!43257 (arrayCountValidKeys!0 lt!452091 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31607 (_keys!11233 thiss!1427))))))

(declare-fun b!1027552 () Bool)

(assert (=> b!1027552 (= e!579948 call!43257)))

(declare-fun b!1027553 () Bool)

(assert (=> b!1027553 (= e!579947 e!579948)))

(declare-fun c!103577 () Bool)

(assert (=> b!1027553 (= c!103577 (validKeyInArray!0 (select (arr!31092 lt!452091) #b00000000000000000000000000000000)))))

(assert (= (and d!122589 c!103578) b!1027550))

(assert (= (and d!122589 (not c!103578)) b!1027553))

(assert (= (and b!1027553 c!103577) b!1027551))

(assert (= (and b!1027553 (not c!103577)) b!1027552))

(assert (= (or b!1027551 b!1027552) bm!43254))

(declare-fun m!945637 () Bool)

(assert (=> bm!43254 m!945637))

(assert (=> b!1027553 m!945479))

(assert (=> b!1027553 m!945479))

(assert (=> b!1027553 m!945481))

(assert (=> b!1027330 d!122589))

(declare-fun d!122591 () Bool)

(declare-fun res!687764 () Bool)

(declare-fun e!579951 () Bool)

(assert (=> d!122591 (=> (not res!687764) (not e!579951))))

(declare-fun simpleValid!390 (LongMapFixedSize!5476) Bool)

(assert (=> d!122591 (= res!687764 (simpleValid!390 thiss!1427))))

(assert (=> d!122591 (= (valid!2065 thiss!1427) e!579951)))

(declare-fun b!1027560 () Bool)

(declare-fun res!687765 () Bool)

(assert (=> b!1027560 (=> (not res!687765) (not e!579951))))

(assert (=> b!1027560 (= res!687765 (= (arrayCountValidKeys!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 (size!31607 (_keys!11233 thiss!1427))) (_size!2793 thiss!1427)))))

(declare-fun b!1027561 () Bool)

(declare-fun res!687766 () Bool)

(assert (=> b!1027561 (=> (not res!687766) (not e!579951))))

(assert (=> b!1027561 (= res!687766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11233 thiss!1427) (mask!29803 thiss!1427)))))

(declare-fun b!1027562 () Bool)

(assert (=> b!1027562 (= e!579951 (arrayNoDuplicates!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 Nil!21836))))

(assert (= (and d!122591 res!687764) b!1027560))

(assert (= (and b!1027560 res!687765) b!1027561))

(assert (= (and b!1027561 res!687766) b!1027562))

(declare-fun m!945639 () Bool)

(assert (=> d!122591 m!945639))

(assert (=> b!1027560 m!945353))

(declare-fun m!945641 () Bool)

(assert (=> b!1027561 m!945641))

(declare-fun m!945643 () Bool)

(assert (=> b!1027562 m!945643))

(assert (=> start!89568 d!122591))

(declare-fun b!1027570 () Bool)

(declare-fun e!579957 () Bool)

(assert (=> b!1027570 (= e!579957 tp_is_empty!24289)))

(declare-fun mapIsEmpty!37871 () Bool)

(declare-fun mapRes!37871 () Bool)

(assert (=> mapIsEmpty!37871 mapRes!37871))

(declare-fun condMapEmpty!37871 () Bool)

(declare-fun mapDefault!37871 () ValueCell!11441)

(assert (=> mapNonEmpty!37862 (= condMapEmpty!37871 (= mapRest!37862 ((as const (Array (_ BitVec 32) ValueCell!11441)) mapDefault!37871)))))

(assert (=> mapNonEmpty!37862 (= tp!72753 (and e!579957 mapRes!37871))))

(declare-fun b!1027569 () Bool)

(declare-fun e!579956 () Bool)

(assert (=> b!1027569 (= e!579956 tp_is_empty!24289)))

(declare-fun mapNonEmpty!37871 () Bool)

(declare-fun tp!72768 () Bool)

(assert (=> mapNonEmpty!37871 (= mapRes!37871 (and tp!72768 e!579956))))

(declare-fun mapRest!37871 () (Array (_ BitVec 32) ValueCell!11441))

(declare-fun mapValue!37871 () ValueCell!11441)

(declare-fun mapKey!37871 () (_ BitVec 32))

(assert (=> mapNonEmpty!37871 (= mapRest!37862 (store mapRest!37871 mapKey!37871 mapValue!37871))))

(assert (= (and mapNonEmpty!37862 condMapEmpty!37871) mapIsEmpty!37871))

(assert (= (and mapNonEmpty!37862 (not condMapEmpty!37871)) mapNonEmpty!37871))

(assert (= (and mapNonEmpty!37871 ((_ is ValueCellFull!11441) mapValue!37871)) b!1027569))

(assert (= (and mapNonEmpty!37862 ((_ is ValueCellFull!11441) mapDefault!37871)) b!1027570))

(declare-fun m!945645 () Bool)

(assert (=> mapNonEmpty!37871 m!945645))

(declare-fun b_lambda!15711 () Bool)

(assert (= b_lambda!15705 (or (and b!1027329 b_free!20569) b_lambda!15711)))

(declare-fun b_lambda!15713 () Bool)

(assert (= b_lambda!15709 (or (and b!1027329 b_free!20569) b_lambda!15713)))

(declare-fun b_lambda!15715 () Bool)

(assert (= b_lambda!15707 (or (and b!1027329 b_free!20569) b_lambda!15715)))

(check-sat (not bm!43245) (not b!1027531) (not b!1027439) (not b!1027462) (not b!1027514) (not bm!43240) (not mapNonEmpty!37871) (not b!1027465) (not b!1027457) (not b!1027447) (not b!1027443) (not b!1027441) (not b!1027510) (not bm!43249) b_and!32805 (not b!1027455) (not b!1027500) (not d!122581) (not b!1027393) (not b!1027548) (not d!122569) (not b!1027468) (not b!1027562) (not b!1027489) (not b!1027511) (not d!122565) (not b_lambda!15715) (not d!122567) (not b!1027456) (not d!122571) (not b!1027516) (not d!122563) tp_is_empty!24289 (not bm!43243) (not d!122587) (not b!1027449) (not b_lambda!15713) (not b!1027518) (not b!1027501) (not b!1027553) (not b!1027560) (not d!122583) (not bm!43232) (not b!1027530) (not b_lambda!15711) (not d!122557) (not bm!43254) (not b!1027561) (not bm!43231) (not bm!43236) (not b!1027513) (not b!1027545) (not b!1027471) (not b!1027546) (not bm!43253) (not b!1027524) (not b_next!20569) (not b!1027522) (not b_lambda!15703) (not b!1027477) (not d!122591) (not bm!43247) (not b!1027532) (not bm!43244) (not bm!43234))
(check-sat b_and!32805 (not b_next!20569))
