; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22128 () Bool)

(assert start!22128)

(declare-fun b!230523 () Bool)

(declare-fun b_free!6195 () Bool)

(declare-fun b_next!6195 () Bool)

(assert (=> b!230523 (= b_free!6195 (not b_next!6195))))

(declare-fun tp!21727 () Bool)

(declare-fun b_and!13093 () Bool)

(assert (=> b!230523 (= tp!21727 b_and!13093)))

(declare-fun res!113377 () Bool)

(declare-fun e!149601 () Bool)

(assert (=> start!22128 (=> (not res!113377) (not e!149601))))

(declare-datatypes ((V!7723 0))(
  ( (V!7724 (val!3073 Int)) )
))
(declare-datatypes ((ValueCell!2685 0))(
  ( (ValueCellFull!2685 (v!5093 V!7723)) (EmptyCell!2685) )
))
(declare-datatypes ((array!11357 0))(
  ( (array!11358 (arr!5398 (Array (_ BitVec 32) ValueCell!2685)) (size!5731 (_ BitVec 32))) )
))
(declare-datatypes ((array!11359 0))(
  ( (array!11360 (arr!5399 (Array (_ BitVec 32) (_ BitVec 64))) (size!5732 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3270 0))(
  ( (LongMapFixedSize!3271 (defaultEntry!4294 Int) (mask!10186 (_ BitVec 32)) (extraKeys!4031 (_ BitVec 32)) (zeroValue!4135 V!7723) (minValue!4135 V!7723) (_size!1684 (_ BitVec 32)) (_keys!6348 array!11359) (_values!4277 array!11357) (_vacant!1684 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3270)

(declare-fun valid!1302 (LongMapFixedSize!3270) Bool)

(assert (=> start!22128 (= res!113377 (valid!1302 thiss!1504))))

(assert (=> start!22128 e!149601))

(declare-fun e!149611 () Bool)

(assert (=> start!22128 e!149611))

(assert (=> start!22128 true))

(declare-fun tp_is_empty!6057 () Bool)

(assert (=> start!22128 tp_is_empty!6057))

(declare-fun b!230520 () Bool)

(declare-datatypes ((Unit!7059 0))(
  ( (Unit!7060) )
))
(declare-fun e!149605 () Unit!7059)

(declare-fun lt!116027 () Unit!7059)

(assert (=> b!230520 (= e!149605 lt!116027)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!308 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7723 V!7723 (_ BitVec 64) Int) Unit!7059)

(assert (=> b!230520 (= lt!116027 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!308 (_keys!6348 thiss!1504) (_values!4277 thiss!1504) (mask!10186 thiss!1504) (extraKeys!4031 thiss!1504) (zeroValue!4135 thiss!1504) (minValue!4135 thiss!1504) key!932 (defaultEntry!4294 thiss!1504)))))

(declare-fun c!38268 () Bool)

(declare-datatypes ((SeekEntryResult!938 0))(
  ( (MissingZero!938 (index!5922 (_ BitVec 32))) (Found!938 (index!5923 (_ BitVec 32))) (Intermediate!938 (undefined!1750 Bool) (index!5924 (_ BitVec 32)) (x!23446 (_ BitVec 32))) (Undefined!938) (MissingVacant!938 (index!5925 (_ BitVec 32))) )
))
(declare-fun lt!116035 () SeekEntryResult!938)

(get-info :version)

(assert (=> b!230520 (= c!38268 ((_ is MissingZero!938) lt!116035))))

(declare-fun e!149599 () Bool)

(assert (=> b!230520 e!149599))

(declare-fun b!230521 () Bool)

(declare-fun res!113372 () Bool)

(assert (=> b!230521 (= res!113372 (= (select (arr!5399 (_keys!6348 thiss!1504)) (index!5925 lt!116035)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149606 () Bool)

(assert (=> b!230521 (=> (not res!113372) (not e!149606))))

(declare-fun mapNonEmpty!10255 () Bool)

(declare-fun mapRes!10255 () Bool)

(declare-fun tp!21726 () Bool)

(declare-fun e!149602 () Bool)

(assert (=> mapNonEmpty!10255 (= mapRes!10255 (and tp!21726 e!149602))))

(declare-fun mapKey!10255 () (_ BitVec 32))

(declare-fun mapValue!10255 () ValueCell!2685)

(declare-fun mapRest!10255 () (Array (_ BitVec 32) ValueCell!2685))

(assert (=> mapNonEmpty!10255 (= (arr!5398 (_values!4277 thiss!1504)) (store mapRest!10255 mapKey!10255 mapValue!10255))))

(declare-fun b!230522 () Bool)

(declare-fun e!149604 () Bool)

(assert (=> b!230522 (= e!149601 e!149604)))

(declare-fun res!113375 () Bool)

(assert (=> b!230522 (=> (not res!113375) (not e!149604))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230522 (= res!113375 (or (= lt!116035 (MissingZero!938 index!297)) (= lt!116035 (MissingVacant!938 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11359 (_ BitVec 32)) SeekEntryResult!938)

(assert (=> b!230522 (= lt!116035 (seekEntryOrOpen!0 key!932 (_keys!6348 thiss!1504) (mask!10186 thiss!1504)))))

(declare-fun mapIsEmpty!10255 () Bool)

(assert (=> mapIsEmpty!10255 mapRes!10255))

(declare-fun e!149612 () Bool)

(declare-fun array_inv!3561 (array!11359) Bool)

(declare-fun array_inv!3562 (array!11357) Bool)

(assert (=> b!230523 (= e!149611 (and tp!21727 tp_is_empty!6057 (array_inv!3561 (_keys!6348 thiss!1504)) (array_inv!3562 (_values!4277 thiss!1504)) e!149612))))

(declare-fun b!230524 () Bool)

(declare-fun e!149600 () Bool)

(assert (=> b!230524 (= e!149600 (not true))))

(declare-fun lt!116029 () array!11359)

(declare-fun arrayContainsKey!0 (array!11359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230524 (arrayContainsKey!0 lt!116029 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116036 () Unit!7059)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11359 (_ BitVec 64) (_ BitVec 32)) Unit!7059)

(assert (=> b!230524 (= lt!116036 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116029 key!932 index!297))))

(declare-datatypes ((tuple2!4534 0))(
  ( (tuple2!4535 (_1!2278 (_ BitVec 64)) (_2!2278 V!7723)) )
))
(declare-datatypes ((List!3457 0))(
  ( (Nil!3454) (Cons!3453 (h!4101 tuple2!4534) (t!8416 List!3457)) )
))
(declare-datatypes ((ListLongMap!3447 0))(
  ( (ListLongMap!3448 (toList!1739 List!3457)) )
))
(declare-fun lt!116037 () ListLongMap!3447)

(declare-fun v!346 () V!7723)

(declare-fun +!607 (ListLongMap!3447 tuple2!4534) ListLongMap!3447)

(declare-fun getCurrentListMap!1267 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7723 V!7723 (_ BitVec 32) Int) ListLongMap!3447)

(assert (=> b!230524 (= (+!607 lt!116037 (tuple2!4535 key!932 v!346)) (getCurrentListMap!1267 lt!116029 (array!11358 (store (arr!5398 (_values!4277 thiss!1504)) index!297 (ValueCellFull!2685 v!346)) (size!5731 (_values!4277 thiss!1504))) (mask!10186 thiss!1504) (extraKeys!4031 thiss!1504) (zeroValue!4135 thiss!1504) (minValue!4135 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4294 thiss!1504)))))

(declare-fun lt!116032 () Unit!7059)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!61 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7723 V!7723 (_ BitVec 32) (_ BitVec 64) V!7723 Int) Unit!7059)

(assert (=> b!230524 (= lt!116032 (lemmaAddValidKeyToArrayThenAddPairToListMap!61 (_keys!6348 thiss!1504) (_values!4277 thiss!1504) (mask!10186 thiss!1504) (extraKeys!4031 thiss!1504) (zeroValue!4135 thiss!1504) (minValue!4135 thiss!1504) index!297 key!932 v!346 (defaultEntry!4294 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11359 (_ BitVec 32)) Bool)

(assert (=> b!230524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116029 (mask!10186 thiss!1504))))

(declare-fun lt!116031 () Unit!7059)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11359 (_ BitVec 32) (_ BitVec 32)) Unit!7059)

(assert (=> b!230524 (= lt!116031 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6348 thiss!1504) index!297 (mask!10186 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11359 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230524 (= (arrayCountValidKeys!0 lt!116029 #b00000000000000000000000000000000 (size!5732 (_keys!6348 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6348 thiss!1504) #b00000000000000000000000000000000 (size!5732 (_keys!6348 thiss!1504)))))))

(declare-fun lt!116030 () Unit!7059)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11359 (_ BitVec 32) (_ BitVec 64)) Unit!7059)

(assert (=> b!230524 (= lt!116030 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6348 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3458 0))(
  ( (Nil!3455) (Cons!3454 (h!4102 (_ BitVec 64)) (t!8417 List!3458)) )
))
(declare-fun arrayNoDuplicates!0 (array!11359 (_ BitVec 32) List!3458) Bool)

(assert (=> b!230524 (arrayNoDuplicates!0 lt!116029 #b00000000000000000000000000000000 Nil!3455)))

(assert (=> b!230524 (= lt!116029 (array!11360 (store (arr!5399 (_keys!6348 thiss!1504)) index!297 key!932) (size!5732 (_keys!6348 thiss!1504))))))

(declare-fun lt!116034 () Unit!7059)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3458) Unit!7059)

(assert (=> b!230524 (= lt!116034 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6348 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3455))))

(declare-fun lt!116039 () Unit!7059)

(declare-fun e!149608 () Unit!7059)

(assert (=> b!230524 (= lt!116039 e!149608)))

(declare-fun c!38266 () Bool)

(assert (=> b!230524 (= c!38266 (arrayContainsKey!0 (_keys!6348 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230525 () Bool)

(declare-fun res!113376 () Bool)

(declare-fun e!149609 () Bool)

(assert (=> b!230525 (=> (not res!113376) (not e!149609))))

(declare-fun call!21419 () Bool)

(assert (=> b!230525 (= res!113376 call!21419)))

(assert (=> b!230525 (= e!149599 e!149609)))

(declare-fun bm!21416 () Bool)

(declare-fun call!21420 () Bool)

(assert (=> bm!21416 (= call!21420 (arrayContainsKey!0 (_keys!6348 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230526 () Bool)

(declare-fun res!113374 () Bool)

(assert (=> b!230526 (=> (not res!113374) (not e!149609))))

(assert (=> b!230526 (= res!113374 (= (select (arr!5399 (_keys!6348 thiss!1504)) (index!5922 lt!116035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230527 () Bool)

(declare-fun Unit!7061 () Unit!7059)

(assert (=> b!230527 (= e!149608 Unit!7061)))

(declare-fun b!230528 () Bool)

(declare-fun Unit!7062 () Unit!7059)

(assert (=> b!230528 (= e!149608 Unit!7062)))

(declare-fun lt!116033 () Unit!7059)

(declare-fun lemmaArrayContainsKeyThenInListMap!125 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7723 V!7723 (_ BitVec 64) (_ BitVec 32) Int) Unit!7059)

(assert (=> b!230528 (= lt!116033 (lemmaArrayContainsKeyThenInListMap!125 (_keys!6348 thiss!1504) (_values!4277 thiss!1504) (mask!10186 thiss!1504) (extraKeys!4031 thiss!1504) (zeroValue!4135 thiss!1504) (minValue!4135 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4294 thiss!1504)))))

(assert (=> b!230528 false))

(declare-fun b!230529 () Bool)

(declare-fun Unit!7063 () Unit!7059)

(assert (=> b!230529 (= e!149605 Unit!7063)))

(declare-fun lt!116038 () Unit!7059)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!291 (array!11359 array!11357 (_ BitVec 32) (_ BitVec 32) V!7723 V!7723 (_ BitVec 64) Int) Unit!7059)

(assert (=> b!230529 (= lt!116038 (lemmaInListMapThenSeekEntryOrOpenFindsIt!291 (_keys!6348 thiss!1504) (_values!4277 thiss!1504) (mask!10186 thiss!1504) (extraKeys!4031 thiss!1504) (zeroValue!4135 thiss!1504) (minValue!4135 thiss!1504) key!932 (defaultEntry!4294 thiss!1504)))))

(assert (=> b!230529 false))

(declare-fun b!230530 () Bool)

(declare-fun e!149610 () Bool)

(assert (=> b!230530 (= e!149610 tp_is_empty!6057)))

(declare-fun b!230531 () Bool)

(assert (=> b!230531 (= e!149604 e!149600)))

(declare-fun res!113370 () Bool)

(assert (=> b!230531 (=> (not res!113370) (not e!149600))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230531 (= res!113370 (inRange!0 index!297 (mask!10186 thiss!1504)))))

(declare-fun lt!116028 () Unit!7059)

(assert (=> b!230531 (= lt!116028 e!149605)))

(declare-fun c!38267 () Bool)

(declare-fun contains!1611 (ListLongMap!3447 (_ BitVec 64)) Bool)

(assert (=> b!230531 (= c!38267 (contains!1611 lt!116037 key!932))))

(assert (=> b!230531 (= lt!116037 (getCurrentListMap!1267 (_keys!6348 thiss!1504) (_values!4277 thiss!1504) (mask!10186 thiss!1504) (extraKeys!4031 thiss!1504) (zeroValue!4135 thiss!1504) (minValue!4135 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4294 thiss!1504)))))

(declare-fun b!230532 () Bool)

(assert (=> b!230532 (= e!149606 (not call!21420))))

(declare-fun b!230533 () Bool)

(declare-fun e!149603 () Bool)

(assert (=> b!230533 (= e!149603 e!149606)))

(declare-fun res!113371 () Bool)

(assert (=> b!230533 (= res!113371 call!21419)))

(assert (=> b!230533 (=> (not res!113371) (not e!149606))))

(declare-fun bm!21417 () Bool)

(assert (=> bm!21417 (= call!21419 (inRange!0 (ite c!38268 (index!5922 lt!116035) (index!5925 lt!116035)) (mask!10186 thiss!1504)))))

(declare-fun b!230534 () Bool)

(declare-fun c!38265 () Bool)

(assert (=> b!230534 (= c!38265 ((_ is MissingVacant!938) lt!116035))))

(assert (=> b!230534 (= e!149599 e!149603)))

(declare-fun b!230535 () Bool)

(assert (=> b!230535 (= e!149602 tp_is_empty!6057)))

(declare-fun b!230536 () Bool)

(assert (=> b!230536 (= e!149612 (and e!149610 mapRes!10255))))

(declare-fun condMapEmpty!10255 () Bool)

(declare-fun mapDefault!10255 () ValueCell!2685)

(assert (=> b!230536 (= condMapEmpty!10255 (= (arr!5398 (_values!4277 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2685)) mapDefault!10255)))))

(declare-fun b!230537 () Bool)

(declare-fun res!113373 () Bool)

(assert (=> b!230537 (=> (not res!113373) (not e!149601))))

(assert (=> b!230537 (= res!113373 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230538 () Bool)

(assert (=> b!230538 (= e!149603 ((_ is Undefined!938) lt!116035))))

(declare-fun b!230539 () Bool)

(assert (=> b!230539 (= e!149609 (not call!21420))))

(assert (= (and start!22128 res!113377) b!230537))

(assert (= (and b!230537 res!113373) b!230522))

(assert (= (and b!230522 res!113375) b!230531))

(assert (= (and b!230531 c!38267) b!230529))

(assert (= (and b!230531 (not c!38267)) b!230520))

(assert (= (and b!230520 c!38268) b!230525))

(assert (= (and b!230520 (not c!38268)) b!230534))

(assert (= (and b!230525 res!113376) b!230526))

(assert (= (and b!230526 res!113374) b!230539))

(assert (= (and b!230534 c!38265) b!230533))

(assert (= (and b!230534 (not c!38265)) b!230538))

(assert (= (and b!230533 res!113371) b!230521))

(assert (= (and b!230521 res!113372) b!230532))

(assert (= (or b!230525 b!230533) bm!21417))

(assert (= (or b!230539 b!230532) bm!21416))

(assert (= (and b!230531 res!113370) b!230524))

(assert (= (and b!230524 c!38266) b!230528))

(assert (= (and b!230524 (not c!38266)) b!230527))

(assert (= (and b!230536 condMapEmpty!10255) mapIsEmpty!10255))

(assert (= (and b!230536 (not condMapEmpty!10255)) mapNonEmpty!10255))

(assert (= (and mapNonEmpty!10255 ((_ is ValueCellFull!2685) mapValue!10255)) b!230535))

(assert (= (and b!230536 ((_ is ValueCellFull!2685) mapDefault!10255)) b!230530))

(assert (= b!230523 b!230536))

(assert (= start!22128 b!230523))

(declare-fun m!251889 () Bool)

(assert (=> mapNonEmpty!10255 m!251889))

(declare-fun m!251891 () Bool)

(assert (=> b!230529 m!251891))

(declare-fun m!251893 () Bool)

(assert (=> b!230524 m!251893))

(declare-fun m!251895 () Bool)

(assert (=> b!230524 m!251895))

(declare-fun m!251897 () Bool)

(assert (=> b!230524 m!251897))

(declare-fun m!251899 () Bool)

(assert (=> b!230524 m!251899))

(declare-fun m!251901 () Bool)

(assert (=> b!230524 m!251901))

(declare-fun m!251903 () Bool)

(assert (=> b!230524 m!251903))

(declare-fun m!251905 () Bool)

(assert (=> b!230524 m!251905))

(declare-fun m!251907 () Bool)

(assert (=> b!230524 m!251907))

(declare-fun m!251909 () Bool)

(assert (=> b!230524 m!251909))

(declare-fun m!251911 () Bool)

(assert (=> b!230524 m!251911))

(declare-fun m!251913 () Bool)

(assert (=> b!230524 m!251913))

(declare-fun m!251915 () Bool)

(assert (=> b!230524 m!251915))

(declare-fun m!251917 () Bool)

(assert (=> b!230524 m!251917))

(declare-fun m!251919 () Bool)

(assert (=> b!230524 m!251919))

(declare-fun m!251921 () Bool)

(assert (=> b!230524 m!251921))

(declare-fun m!251923 () Bool)

(assert (=> b!230528 m!251923))

(declare-fun m!251925 () Bool)

(assert (=> b!230526 m!251925))

(declare-fun m!251927 () Bool)

(assert (=> b!230521 m!251927))

(declare-fun m!251929 () Bool)

(assert (=> bm!21417 m!251929))

(declare-fun m!251931 () Bool)

(assert (=> b!230523 m!251931))

(declare-fun m!251933 () Bool)

(assert (=> b!230523 m!251933))

(declare-fun m!251935 () Bool)

(assert (=> b!230520 m!251935))

(declare-fun m!251937 () Bool)

(assert (=> b!230522 m!251937))

(declare-fun m!251939 () Bool)

(assert (=> b!230531 m!251939))

(declare-fun m!251941 () Bool)

(assert (=> b!230531 m!251941))

(declare-fun m!251943 () Bool)

(assert (=> b!230531 m!251943))

(assert (=> bm!21416 m!251893))

(declare-fun m!251945 () Bool)

(assert (=> start!22128 m!251945))

(check-sat b_and!13093 (not bm!21417) (not b!230522) (not b!230524) (not b_next!6195) (not start!22128) (not b!230520) (not b!230529) (not bm!21416) (not b!230523) (not b!230528) (not mapNonEmpty!10255) tp_is_empty!6057 (not b!230531))
(check-sat b_and!13093 (not b_next!6195))
