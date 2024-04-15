; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24270 () Bool)

(assert start!24270)

(declare-fun b!253560 () Bool)

(declare-fun b_free!6667 () Bool)

(declare-fun b_next!6667 () Bool)

(assert (=> b!253560 (= b_free!6667 (not b_next!6667))))

(declare-fun tp!23288 () Bool)

(declare-fun b_and!13683 () Bool)

(assert (=> b!253560 (= tp!23288 b_and!13683)))

(declare-fun b!253547 () Bool)

(declare-fun e!164375 () Bool)

(declare-fun tp_is_empty!6529 () Bool)

(assert (=> b!253547 (= e!164375 tp_is_empty!6529)))

(declare-fun b!253548 () Bool)

(declare-fun e!164379 () Bool)

(assert (=> b!253548 (= e!164379 tp_is_empty!6529)))

(declare-fun res!124090 () Bool)

(declare-fun e!164381 () Bool)

(assert (=> start!24270 (=> (not res!124090) (not e!164381))))

(declare-datatypes ((V!8353 0))(
  ( (V!8354 (val!3309 Int)) )
))
(declare-datatypes ((ValueCell!2921 0))(
  ( (ValueCellFull!2921 (v!5377 V!8353)) (EmptyCell!2921) )
))
(declare-datatypes ((array!12381 0))(
  ( (array!12382 (arr!5865 (Array (_ BitVec 32) ValueCell!2921)) (size!6213 (_ BitVec 32))) )
))
(declare-datatypes ((array!12383 0))(
  ( (array!12384 (arr!5866 (Array (_ BitVec 32) (_ BitVec 64))) (size!6214 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3742 0))(
  ( (LongMapFixedSize!3743 (defaultEntry!4684 Int) (mask!10923 (_ BitVec 32)) (extraKeys!4421 (_ BitVec 32)) (zeroValue!4525 V!8353) (minValue!4525 V!8353) (_size!1920 (_ BitVec 32)) (_keys!6837 array!12383) (_values!4667 array!12381) (_vacant!1920 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3742)

(declare-fun valid!1465 (LongMapFixedSize!3742) Bool)

(assert (=> start!24270 (= res!124090 (valid!1465 thiss!1504))))

(assert (=> start!24270 e!164381))

(declare-fun e!164377 () Bool)

(assert (=> start!24270 e!164377))

(assert (=> start!24270 true))

(declare-fun b!253549 () Bool)

(declare-datatypes ((Unit!7820 0))(
  ( (Unit!7821) )
))
(declare-fun e!164374 () Unit!7820)

(declare-fun Unit!7822 () Unit!7820)

(assert (=> b!253549 (= e!164374 Unit!7822)))

(declare-fun b!253550 () Bool)

(declare-fun res!124087 () Bool)

(declare-fun e!164371 () Bool)

(assert (=> b!253550 (=> (not res!124087) (not e!164371))))

(declare-fun call!23922 () Bool)

(assert (=> b!253550 (= res!124087 call!23922)))

(declare-fun e!164370 () Bool)

(assert (=> b!253550 (= e!164370 e!164371)))

(declare-fun b!253551 () Bool)

(declare-fun e!164367 () Unit!7820)

(declare-fun Unit!7823 () Unit!7820)

(assert (=> b!253551 (= e!164367 Unit!7823)))

(declare-fun lt!126989 () Unit!7820)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!410 (array!12383 array!12381 (_ BitVec 32) (_ BitVec 32) V!8353 V!8353 (_ BitVec 64) Int) Unit!7820)

(assert (=> b!253551 (= lt!126989 (lemmaInListMapThenSeekEntryOrOpenFindsIt!410 (_keys!6837 thiss!1504) (_values!4667 thiss!1504) (mask!10923 thiss!1504) (extraKeys!4421 thiss!1504) (zeroValue!4525 thiss!1504) (minValue!4525 thiss!1504) key!932 (defaultEntry!4684 thiss!1504)))))

(assert (=> b!253551 false))

(declare-fun b!253552 () Bool)

(declare-fun res!124083 () Bool)

(declare-fun e!164368 () Bool)

(assert (=> b!253552 (=> res!124083 e!164368)))

(declare-datatypes ((List!3731 0))(
  ( (Nil!3728) (Cons!3727 (h!4389 (_ BitVec 64)) (t!8769 List!3731)) )
))
(declare-fun arrayNoDuplicates!0 (array!12383 (_ BitVec 32) List!3731) Bool)

(assert (=> b!253552 (= res!124083 (not (arrayNoDuplicates!0 (_keys!6837 thiss!1504) #b00000000000000000000000000000000 Nil!3728)))))

(declare-datatypes ((SeekEntryResult!1137 0))(
  ( (MissingZero!1137 (index!6718 (_ BitVec 32))) (Found!1137 (index!6719 (_ BitVec 32))) (Intermediate!1137 (undefined!1949 Bool) (index!6720 (_ BitVec 32)) (x!24828 (_ BitVec 32))) (Undefined!1137) (MissingVacant!1137 (index!6721 (_ BitVec 32))) )
))
(declare-fun lt!126991 () SeekEntryResult!1137)

(declare-fun bm!23919 () Bool)

(declare-fun c!42765 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23919 (= call!23922 (inRange!0 (ite c!42765 (index!6718 lt!126991) (index!6721 lt!126991)) (mask!10923 thiss!1504)))))

(declare-fun b!253553 () Bool)

(declare-fun e!164376 () Bool)

(assert (=> b!253553 (= e!164381 e!164376)))

(declare-fun res!124094 () Bool)

(assert (=> b!253553 (=> (not res!124094) (not e!164376))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!253553 (= res!124094 (or (= lt!126991 (MissingZero!1137 index!297)) (= lt!126991 (MissingVacant!1137 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12383 (_ BitVec 32)) SeekEntryResult!1137)

(assert (=> b!253553 (= lt!126991 (seekEntryOrOpen!0 key!932 (_keys!6837 thiss!1504) (mask!10923 thiss!1504)))))

(declare-fun b!253554 () Bool)

(declare-fun e!164378 () Bool)

(assert (=> b!253554 (= e!164376 e!164378)))

(declare-fun res!124093 () Bool)

(assert (=> b!253554 (=> (not res!124093) (not e!164378))))

(assert (=> b!253554 (= res!124093 (inRange!0 index!297 (mask!10923 thiss!1504)))))

(declare-fun lt!126992 () Unit!7820)

(assert (=> b!253554 (= lt!126992 e!164367)))

(declare-fun c!42766 () Bool)

(declare-datatypes ((tuple2!4830 0))(
  ( (tuple2!4831 (_1!2426 (_ BitVec 64)) (_2!2426 V!8353)) )
))
(declare-datatypes ((List!3732 0))(
  ( (Nil!3729) (Cons!3728 (h!4390 tuple2!4830) (t!8770 List!3732)) )
))
(declare-datatypes ((ListLongMap!3733 0))(
  ( (ListLongMap!3734 (toList!1882 List!3732)) )
))
(declare-fun contains!1817 (ListLongMap!3733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1391 (array!12383 array!12381 (_ BitVec 32) (_ BitVec 32) V!8353 V!8353 (_ BitVec 32) Int) ListLongMap!3733)

(assert (=> b!253554 (= c!42766 (contains!1817 (getCurrentListMap!1391 (_keys!6837 thiss!1504) (_values!4667 thiss!1504) (mask!10923 thiss!1504) (extraKeys!4421 thiss!1504) (zeroValue!4525 thiss!1504) (minValue!4525 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4684 thiss!1504)) key!932))))

(declare-fun b!253555 () Bool)

(declare-fun call!23923 () Bool)

(assert (=> b!253555 (= e!164371 (not call!23923))))

(declare-fun b!253556 () Bool)

(declare-fun res!124095 () Bool)

(assert (=> b!253556 (=> res!124095 e!164368)))

(assert (=> b!253556 (= res!124095 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6214 (_keys!6837 thiss!1504)))))))

(declare-fun b!253557 () Bool)

(declare-fun res!124089 () Bool)

(assert (=> b!253557 (=> res!124089 e!164368)))

(assert (=> b!253557 (= res!124089 (or (not (= (size!6213 (_values!4667 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10923 thiss!1504)))) (not (= (size!6214 (_keys!6837 thiss!1504)) (size!6213 (_values!4667 thiss!1504)))) (bvslt (mask!10923 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4421 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4421 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11109 () Bool)

(declare-fun mapRes!11109 () Bool)

(declare-fun tp!23289 () Bool)

(assert (=> mapNonEmpty!11109 (= mapRes!11109 (and tp!23289 e!164379))))

(declare-fun mapValue!11109 () ValueCell!2921)

(declare-fun mapRest!11109 () (Array (_ BitVec 32) ValueCell!2921))

(declare-fun mapKey!11109 () (_ BitVec 32))

(assert (=> mapNonEmpty!11109 (= (arr!5865 (_values!4667 thiss!1504)) (store mapRest!11109 mapKey!11109 mapValue!11109))))

(declare-fun b!253558 () Bool)

(assert (=> b!253558 (= e!164368 (or (= (select (arr!5866 (_keys!6837 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!5866 (_keys!6837 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!253559 () Bool)

(declare-fun res!124086 () Bool)

(assert (=> b!253559 (=> res!124086 e!164368)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253559 (= res!124086 (not (validKeyInArray!0 key!932)))))

(declare-fun e!164372 () Bool)

(declare-fun array_inv!3869 (array!12383) Bool)

(declare-fun array_inv!3870 (array!12381) Bool)

(assert (=> b!253560 (= e!164377 (and tp!23288 tp_is_empty!6529 (array_inv!3869 (_keys!6837 thiss!1504)) (array_inv!3870 (_values!4667 thiss!1504)) e!164372))))

(declare-fun b!253561 () Bool)

(declare-fun res!124091 () Bool)

(assert (=> b!253561 (=> (not res!124091) (not e!164371))))

(assert (=> b!253561 (= res!124091 (= (select (arr!5866 (_keys!6837 thiss!1504)) (index!6718 lt!126991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253562 () Bool)

(assert (=> b!253562 (= e!164378 (not e!164368))))

(declare-fun res!124085 () Bool)

(assert (=> b!253562 (=> res!124085 e!164368)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!253562 (= res!124085 (not (validMask!0 (mask!10923 thiss!1504))))))

(declare-fun lt!126985 () array!12383)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12383 (_ BitVec 32)) Bool)

(assert (=> b!253562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126985 (mask!10923 thiss!1504))))

(declare-fun lt!126986 () Unit!7820)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12383 (_ BitVec 32) (_ BitVec 32)) Unit!7820)

(assert (=> b!253562 (= lt!126986 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6837 thiss!1504) index!297 (mask!10923 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12383 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!253562 (= (arrayCountValidKeys!0 lt!126985 #b00000000000000000000000000000000 (size!6214 (_keys!6837 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6837 thiss!1504) #b00000000000000000000000000000000 (size!6214 (_keys!6837 thiss!1504)))))))

(declare-fun lt!126988 () Unit!7820)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12383 (_ BitVec 32) (_ BitVec 64)) Unit!7820)

(assert (=> b!253562 (= lt!126988 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6837 thiss!1504) index!297 key!932))))

(assert (=> b!253562 (arrayNoDuplicates!0 lt!126985 #b00000000000000000000000000000000 Nil!3728)))

(assert (=> b!253562 (= lt!126985 (array!12384 (store (arr!5866 (_keys!6837 thiss!1504)) index!297 key!932) (size!6214 (_keys!6837 thiss!1504))))))

(declare-fun lt!126990 () Unit!7820)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3731) Unit!7820)

(assert (=> b!253562 (= lt!126990 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6837 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3728))))

(declare-fun lt!126994 () Unit!7820)

(assert (=> b!253562 (= lt!126994 e!164374)))

(declare-fun c!42767 () Bool)

(declare-fun arrayContainsKey!0 (array!12383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!253562 (= c!42767 (arrayContainsKey!0 (_keys!6837 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253563 () Bool)

(declare-fun e!164369 () Bool)

(get-info :version)

(assert (=> b!253563 (= e!164369 ((_ is Undefined!1137) lt!126991))))

(declare-fun bm!23920 () Bool)

(assert (=> bm!23920 (= call!23923 (arrayContainsKey!0 (_keys!6837 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253564 () Bool)

(assert (=> b!253564 (= e!164372 (and e!164375 mapRes!11109))))

(declare-fun condMapEmpty!11109 () Bool)

(declare-fun mapDefault!11109 () ValueCell!2921)

(assert (=> b!253564 (= condMapEmpty!11109 (= (arr!5865 (_values!4667 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2921)) mapDefault!11109)))))

(declare-fun b!253565 () Bool)

(declare-fun c!42768 () Bool)

(assert (=> b!253565 (= c!42768 ((_ is MissingVacant!1137) lt!126991))))

(assert (=> b!253565 (= e!164370 e!164369)))

(declare-fun b!253566 () Bool)

(declare-fun Unit!7824 () Unit!7820)

(assert (=> b!253566 (= e!164374 Unit!7824)))

(declare-fun lt!126993 () Unit!7820)

(declare-fun lemmaArrayContainsKeyThenInListMap!219 (array!12383 array!12381 (_ BitVec 32) (_ BitVec 32) V!8353 V!8353 (_ BitVec 64) (_ BitVec 32) Int) Unit!7820)

(assert (=> b!253566 (= lt!126993 (lemmaArrayContainsKeyThenInListMap!219 (_keys!6837 thiss!1504) (_values!4667 thiss!1504) (mask!10923 thiss!1504) (extraKeys!4421 thiss!1504) (zeroValue!4525 thiss!1504) (minValue!4525 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4684 thiss!1504)))))

(assert (=> b!253566 false))

(declare-fun b!253567 () Bool)

(declare-fun res!124096 () Bool)

(assert (=> b!253567 (=> (not res!124096) (not e!164381))))

(assert (=> b!253567 (= res!124096 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!253568 () Bool)

(declare-fun lt!126987 () Unit!7820)

(assert (=> b!253568 (= e!164367 lt!126987)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!410 (array!12383 array!12381 (_ BitVec 32) (_ BitVec 32) V!8353 V!8353 (_ BitVec 64) Int) Unit!7820)

(assert (=> b!253568 (= lt!126987 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!410 (_keys!6837 thiss!1504) (_values!4667 thiss!1504) (mask!10923 thiss!1504) (extraKeys!4421 thiss!1504) (zeroValue!4525 thiss!1504) (minValue!4525 thiss!1504) key!932 (defaultEntry!4684 thiss!1504)))))

(assert (=> b!253568 (= c!42765 ((_ is MissingZero!1137) lt!126991))))

(assert (=> b!253568 e!164370))

(declare-fun b!253569 () Bool)

(declare-fun res!124088 () Bool)

(assert (=> b!253569 (=> res!124088 e!164368)))

(assert (=> b!253569 (= res!124088 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6837 thiss!1504) (mask!10923 thiss!1504))))))

(declare-fun mapIsEmpty!11109 () Bool)

(assert (=> mapIsEmpty!11109 mapRes!11109))

(declare-fun b!253570 () Bool)

(declare-fun e!164373 () Bool)

(assert (=> b!253570 (= e!164369 e!164373)))

(declare-fun res!124084 () Bool)

(assert (=> b!253570 (= res!124084 call!23922)))

(assert (=> b!253570 (=> (not res!124084) (not e!164373))))

(declare-fun b!253571 () Bool)

(assert (=> b!253571 (= e!164373 (not call!23923))))

(declare-fun b!253572 () Bool)

(declare-fun res!124092 () Bool)

(assert (=> b!253572 (= res!124092 (= (select (arr!5866 (_keys!6837 thiss!1504)) (index!6721 lt!126991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253572 (=> (not res!124092) (not e!164373))))

(assert (= (and start!24270 res!124090) b!253567))

(assert (= (and b!253567 res!124096) b!253553))

(assert (= (and b!253553 res!124094) b!253554))

(assert (= (and b!253554 c!42766) b!253551))

(assert (= (and b!253554 (not c!42766)) b!253568))

(assert (= (and b!253568 c!42765) b!253550))

(assert (= (and b!253568 (not c!42765)) b!253565))

(assert (= (and b!253550 res!124087) b!253561))

(assert (= (and b!253561 res!124091) b!253555))

(assert (= (and b!253565 c!42768) b!253570))

(assert (= (and b!253565 (not c!42768)) b!253563))

(assert (= (and b!253570 res!124084) b!253572))

(assert (= (and b!253572 res!124092) b!253571))

(assert (= (or b!253550 b!253570) bm!23919))

(assert (= (or b!253555 b!253571) bm!23920))

(assert (= (and b!253554 res!124093) b!253562))

(assert (= (and b!253562 c!42767) b!253566))

(assert (= (and b!253562 (not c!42767)) b!253549))

(assert (= (and b!253562 (not res!124085)) b!253557))

(assert (= (and b!253557 (not res!124089)) b!253569))

(assert (= (and b!253569 (not res!124088)) b!253552))

(assert (= (and b!253552 (not res!124083)) b!253556))

(assert (= (and b!253556 (not res!124095)) b!253559))

(assert (= (and b!253559 (not res!124086)) b!253558))

(assert (= (and b!253564 condMapEmpty!11109) mapIsEmpty!11109))

(assert (= (and b!253564 (not condMapEmpty!11109)) mapNonEmpty!11109))

(assert (= (and mapNonEmpty!11109 ((_ is ValueCellFull!2921) mapValue!11109)) b!253548))

(assert (= (and b!253564 ((_ is ValueCellFull!2921) mapDefault!11109)) b!253547))

(assert (= b!253560 b!253564))

(assert (= start!24270 b!253560))

(declare-fun m!268841 () Bool)

(assert (=> b!253568 m!268841))

(declare-fun m!268843 () Bool)

(assert (=> bm!23920 m!268843))

(declare-fun m!268845 () Bool)

(assert (=> b!253560 m!268845))

(declare-fun m!268847 () Bool)

(assert (=> b!253560 m!268847))

(declare-fun m!268849 () Bool)

(assert (=> b!253554 m!268849))

(declare-fun m!268851 () Bool)

(assert (=> b!253554 m!268851))

(assert (=> b!253554 m!268851))

(declare-fun m!268853 () Bool)

(assert (=> b!253554 m!268853))

(declare-fun m!268855 () Bool)

(assert (=> start!24270 m!268855))

(declare-fun m!268857 () Bool)

(assert (=> b!253551 m!268857))

(declare-fun m!268859 () Bool)

(assert (=> b!253558 m!268859))

(declare-fun m!268861 () Bool)

(assert (=> b!253553 m!268861))

(declare-fun m!268863 () Bool)

(assert (=> b!253559 m!268863))

(declare-fun m!268865 () Bool)

(assert (=> b!253561 m!268865))

(declare-fun m!268867 () Bool)

(assert (=> b!253572 m!268867))

(declare-fun m!268869 () Bool)

(assert (=> b!253569 m!268869))

(declare-fun m!268871 () Bool)

(assert (=> b!253566 m!268871))

(declare-fun m!268873 () Bool)

(assert (=> bm!23919 m!268873))

(declare-fun m!268875 () Bool)

(assert (=> b!253552 m!268875))

(declare-fun m!268877 () Bool)

(assert (=> mapNonEmpty!11109 m!268877))

(declare-fun m!268879 () Bool)

(assert (=> b!253562 m!268879))

(assert (=> b!253562 m!268843))

(declare-fun m!268881 () Bool)

(assert (=> b!253562 m!268881))

(declare-fun m!268883 () Bool)

(assert (=> b!253562 m!268883))

(declare-fun m!268885 () Bool)

(assert (=> b!253562 m!268885))

(declare-fun m!268887 () Bool)

(assert (=> b!253562 m!268887))

(declare-fun m!268889 () Bool)

(assert (=> b!253562 m!268889))

(declare-fun m!268891 () Bool)

(assert (=> b!253562 m!268891))

(declare-fun m!268893 () Bool)

(assert (=> b!253562 m!268893))

(declare-fun m!268895 () Bool)

(assert (=> b!253562 m!268895))

(check-sat (not b_next!6667) (not bm!23919) (not b!253553) (not b!253551) (not b!253560) tp_is_empty!6529 (not mapNonEmpty!11109) (not b!253568) (not b!253569) (not b!253559) (not b!253552) (not start!24270) (not b!253554) (not b!253566) (not bm!23920) (not b!253562) b_and!13683)
(check-sat b_and!13683 (not b_next!6667))
