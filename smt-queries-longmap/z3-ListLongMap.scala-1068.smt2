; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22092 () Bool)

(assert start!22092)

(declare-fun b!229422 () Bool)

(declare-fun b_free!6159 () Bool)

(declare-fun b_next!6159 () Bool)

(assert (=> b!229422 (= b_free!6159 (not b_next!6159))))

(declare-fun tp!21618 () Bool)

(declare-fun b_and!13057 () Bool)

(assert (=> b!229422 (= tp!21618 b_and!13057)))

(declare-fun b!229401 () Bool)

(declare-fun e!148841 () Bool)

(declare-datatypes ((SeekEntryResult!921 0))(
  ( (MissingZero!921 (index!5854 (_ BitVec 32))) (Found!921 (index!5855 (_ BitVec 32))) (Intermediate!921 (undefined!1733 Bool) (index!5856 (_ BitVec 32)) (x!23381 (_ BitVec 32))) (Undefined!921) (MissingVacant!921 (index!5857 (_ BitVec 32))) )
))
(declare-fun lt!115390 () SeekEntryResult!921)

(get-info :version)

(assert (=> b!229401 (= e!148841 ((_ is Undefined!921) lt!115390))))

(declare-fun b!229402 () Bool)

(declare-fun e!148837 () Bool)

(assert (=> b!229402 (= e!148837 true)))

(declare-fun lt!115387 () Bool)

(declare-datatypes ((V!7675 0))(
  ( (V!7676 (val!3055 Int)) )
))
(declare-datatypes ((ValueCell!2667 0))(
  ( (ValueCellFull!2667 (v!5075 V!7675)) (EmptyCell!2667) )
))
(declare-datatypes ((array!11285 0))(
  ( (array!11286 (arr!5362 (Array (_ BitVec 32) ValueCell!2667)) (size!5695 (_ BitVec 32))) )
))
(declare-datatypes ((array!11287 0))(
  ( (array!11288 (arr!5363 (Array (_ BitVec 32) (_ BitVec 64))) (size!5696 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3234 0))(
  ( (LongMapFixedSize!3235 (defaultEntry!4276 Int) (mask!10156 (_ BitVec 32)) (extraKeys!4013 (_ BitVec 32)) (zeroValue!4117 V!7675) (minValue!4117 V!7675) (_size!1666 (_ BitVec 32)) (_keys!6330 array!11287) (_values!4259 array!11285) (_vacant!1666 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3234)

(declare-datatypes ((List!3432 0))(
  ( (Nil!3429) (Cons!3428 (h!4076 (_ BitVec 64)) (t!8391 List!3432)) )
))
(declare-fun arrayNoDuplicates!0 (array!11287 (_ BitVec 32) List!3432) Bool)

(assert (=> b!229402 (= lt!115387 (arrayNoDuplicates!0 (_keys!6330 thiss!1504) #b00000000000000000000000000000000 Nil!3429))))

(declare-fun b!229403 () Bool)

(declare-fun res!112899 () Bool)

(declare-fun e!148838 () Bool)

(assert (=> b!229403 (=> (not res!112899) (not e!148838))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!229403 (= res!112899 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229404 () Bool)

(declare-fun res!112907 () Bool)

(declare-fun e!148832 () Bool)

(assert (=> b!229404 (=> (not res!112907) (not e!148832))))

(assert (=> b!229404 (= res!112907 (= (select (arr!5363 (_keys!6330 thiss!1504)) (index!5854 lt!115390)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21308 () Bool)

(declare-fun call!21311 () Bool)

(declare-fun c!38049 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21308 (= call!21311 (inRange!0 (ite c!38049 (index!5854 lt!115390) (index!5857 lt!115390)) (mask!10156 thiss!1504)))))

(declare-fun b!229405 () Bool)

(declare-fun c!38051 () Bool)

(assert (=> b!229405 (= c!38051 ((_ is MissingVacant!921) lt!115390))))

(declare-fun e!148830 () Bool)

(assert (=> b!229405 (= e!148830 e!148841)))

(declare-fun b!229406 () Bool)

(declare-fun res!112908 () Bool)

(assert (=> b!229406 (= res!112908 (= (select (arr!5363 (_keys!6330 thiss!1504)) (index!5857 lt!115390)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148835 () Bool)

(assert (=> b!229406 (=> (not res!112908) (not e!148835))))

(declare-fun res!112903 () Bool)

(assert (=> start!22092 (=> (not res!112903) (not e!148838))))

(declare-fun valid!1290 (LongMapFixedSize!3234) Bool)

(assert (=> start!22092 (= res!112903 (valid!1290 thiss!1504))))

(assert (=> start!22092 e!148838))

(declare-fun e!148843 () Bool)

(assert (=> start!22092 e!148843))

(assert (=> start!22092 true))

(declare-fun b!229407 () Bool)

(declare-fun e!148842 () Bool)

(declare-fun e!148836 () Bool)

(assert (=> b!229407 (= e!148842 e!148836)))

(declare-fun res!112905 () Bool)

(assert (=> b!229407 (=> (not res!112905) (not e!148836))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229407 (= res!112905 (inRange!0 index!297 (mask!10156 thiss!1504)))))

(declare-datatypes ((Unit!6997 0))(
  ( (Unit!6998) )
))
(declare-fun lt!115396 () Unit!6997)

(declare-fun e!148831 () Unit!6997)

(assert (=> b!229407 (= lt!115396 e!148831)))

(declare-fun c!38050 () Bool)

(declare-datatypes ((tuple2!4508 0))(
  ( (tuple2!4509 (_1!2265 (_ BitVec 64)) (_2!2265 V!7675)) )
))
(declare-datatypes ((List!3433 0))(
  ( (Nil!3430) (Cons!3429 (h!4077 tuple2!4508) (t!8392 List!3433)) )
))
(declare-datatypes ((ListLongMap!3421 0))(
  ( (ListLongMap!3422 (toList!1726 List!3433)) )
))
(declare-fun contains!1600 (ListLongMap!3421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1254 (array!11287 array!11285 (_ BitVec 32) (_ BitVec 32) V!7675 V!7675 (_ BitVec 32) Int) ListLongMap!3421)

(assert (=> b!229407 (= c!38050 (contains!1600 (getCurrentListMap!1254 (_keys!6330 thiss!1504) (_values!4259 thiss!1504) (mask!10156 thiss!1504) (extraKeys!4013 thiss!1504) (zeroValue!4117 thiss!1504) (minValue!4117 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4276 thiss!1504)) key!932))))

(declare-fun b!229408 () Bool)

(declare-fun Unit!6999 () Unit!6997)

(assert (=> b!229408 (= e!148831 Unit!6999)))

(declare-fun lt!115394 () Unit!6997)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!281 (array!11287 array!11285 (_ BitVec 32) (_ BitVec 32) V!7675 V!7675 (_ BitVec 64) Int) Unit!6997)

(assert (=> b!229408 (= lt!115394 (lemmaInListMapThenSeekEntryOrOpenFindsIt!281 (_keys!6330 thiss!1504) (_values!4259 thiss!1504) (mask!10156 thiss!1504) (extraKeys!4013 thiss!1504) (zeroValue!4117 thiss!1504) (minValue!4117 thiss!1504) key!932 (defaultEntry!4276 thiss!1504)))))

(assert (=> b!229408 false))

(declare-fun b!229409 () Bool)

(assert (=> b!229409 (= e!148836 (not e!148837))))

(declare-fun res!112901 () Bool)

(assert (=> b!229409 (=> res!112901 e!148837)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229409 (= res!112901 (not (validMask!0 (mask!10156 thiss!1504))))))

(declare-fun lt!115395 () array!11287)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11287 (_ BitVec 32)) Bool)

(assert (=> b!229409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115395 (mask!10156 thiss!1504))))

(declare-fun lt!115388 () Unit!6997)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11287 (_ BitVec 32) (_ BitVec 32)) Unit!6997)

(assert (=> b!229409 (= lt!115388 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6330 thiss!1504) index!297 (mask!10156 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11287 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229409 (= (arrayCountValidKeys!0 lt!115395 #b00000000000000000000000000000000 (size!5696 (_keys!6330 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6330 thiss!1504) #b00000000000000000000000000000000 (size!5696 (_keys!6330 thiss!1504)))))))

(declare-fun lt!115393 () Unit!6997)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11287 (_ BitVec 32) (_ BitVec 64)) Unit!6997)

(assert (=> b!229409 (= lt!115393 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6330 thiss!1504) index!297 key!932))))

(assert (=> b!229409 (arrayNoDuplicates!0 lt!115395 #b00000000000000000000000000000000 Nil!3429)))

(assert (=> b!229409 (= lt!115395 (array!11288 (store (arr!5363 (_keys!6330 thiss!1504)) index!297 key!932) (size!5696 (_keys!6330 thiss!1504))))))

(declare-fun lt!115389 () Unit!6997)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3432) Unit!6997)

(assert (=> b!229409 (= lt!115389 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6330 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3429))))

(declare-fun lt!115391 () Unit!6997)

(declare-fun e!148839 () Unit!6997)

(assert (=> b!229409 (= lt!115391 e!148839)))

(declare-fun c!38052 () Bool)

(declare-fun arrayContainsKey!0 (array!11287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229409 (= c!38052 (arrayContainsKey!0 (_keys!6330 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229410 () Bool)

(declare-fun Unit!7000 () Unit!6997)

(assert (=> b!229410 (= e!148839 Unit!7000)))

(declare-fun lt!115392 () Unit!6997)

(declare-fun lemmaArrayContainsKeyThenInListMap!115 (array!11287 array!11285 (_ BitVec 32) (_ BitVec 32) V!7675 V!7675 (_ BitVec 64) (_ BitVec 32) Int) Unit!6997)

(assert (=> b!229410 (= lt!115392 (lemmaArrayContainsKeyThenInListMap!115 (_keys!6330 thiss!1504) (_values!4259 thiss!1504) (mask!10156 thiss!1504) (extraKeys!4013 thiss!1504) (zeroValue!4117 thiss!1504) (minValue!4117 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4276 thiss!1504)))))

(assert (=> b!229410 false))

(declare-fun b!229411 () Bool)

(declare-fun lt!115397 () Unit!6997)

(assert (=> b!229411 (= e!148831 lt!115397)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!298 (array!11287 array!11285 (_ BitVec 32) (_ BitVec 32) V!7675 V!7675 (_ BitVec 64) Int) Unit!6997)

(assert (=> b!229411 (= lt!115397 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!298 (_keys!6330 thiss!1504) (_values!4259 thiss!1504) (mask!10156 thiss!1504) (extraKeys!4013 thiss!1504) (zeroValue!4117 thiss!1504) (minValue!4117 thiss!1504) key!932 (defaultEntry!4276 thiss!1504)))))

(assert (=> b!229411 (= c!38049 ((_ is MissingZero!921) lt!115390))))

(assert (=> b!229411 e!148830))

(declare-fun b!229412 () Bool)

(declare-fun call!21312 () Bool)

(assert (=> b!229412 (= e!148832 (not call!21312))))

(declare-fun bm!21309 () Bool)

(assert (=> bm!21309 (= call!21312 (arrayContainsKey!0 (_keys!6330 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229413 () Bool)

(declare-fun e!148844 () Bool)

(declare-fun tp_is_empty!6021 () Bool)

(assert (=> b!229413 (= e!148844 tp_is_empty!6021)))

(declare-fun b!229414 () Bool)

(assert (=> b!229414 (= e!148841 e!148835)))

(declare-fun res!112906 () Bool)

(assert (=> b!229414 (= res!112906 call!21311)))

(assert (=> b!229414 (=> (not res!112906) (not e!148835))))

(declare-fun b!229415 () Bool)

(declare-fun e!148833 () Bool)

(assert (=> b!229415 (= e!148833 tp_is_empty!6021)))

(declare-fun b!229416 () Bool)

(declare-fun res!112904 () Bool)

(assert (=> b!229416 (=> res!112904 e!148837)))

(assert (=> b!229416 (= res!112904 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6330 thiss!1504) (mask!10156 thiss!1504))))))

(declare-fun b!229417 () Bool)

(assert (=> b!229417 (= e!148835 (not call!21312))))

(declare-fun mapIsEmpty!10201 () Bool)

(declare-fun mapRes!10201 () Bool)

(assert (=> mapIsEmpty!10201 mapRes!10201))

(declare-fun b!229418 () Bool)

(assert (=> b!229418 (= e!148838 e!148842)))

(declare-fun res!112909 () Bool)

(assert (=> b!229418 (=> (not res!112909) (not e!148842))))

(assert (=> b!229418 (= res!112909 (or (= lt!115390 (MissingZero!921 index!297)) (= lt!115390 (MissingVacant!921 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11287 (_ BitVec 32)) SeekEntryResult!921)

(assert (=> b!229418 (= lt!115390 (seekEntryOrOpen!0 key!932 (_keys!6330 thiss!1504) (mask!10156 thiss!1504)))))

(declare-fun b!229419 () Bool)

(declare-fun e!148834 () Bool)

(assert (=> b!229419 (= e!148834 (and e!148833 mapRes!10201))))

(declare-fun condMapEmpty!10201 () Bool)

(declare-fun mapDefault!10201 () ValueCell!2667)

(assert (=> b!229419 (= condMapEmpty!10201 (= (arr!5362 (_values!4259 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2667)) mapDefault!10201)))))

(declare-fun b!229420 () Bool)

(declare-fun res!112902 () Bool)

(assert (=> b!229420 (=> (not res!112902) (not e!148832))))

(assert (=> b!229420 (= res!112902 call!21311)))

(assert (=> b!229420 (= e!148830 e!148832)))

(declare-fun b!229421 () Bool)

(declare-fun res!112900 () Bool)

(assert (=> b!229421 (=> res!112900 e!148837)))

(assert (=> b!229421 (= res!112900 (or (not (= (size!5695 (_values!4259 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10156 thiss!1504)))) (not (= (size!5696 (_keys!6330 thiss!1504)) (size!5695 (_values!4259 thiss!1504)))) (bvslt (mask!10156 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4013 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4013 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun array_inv!3541 (array!11287) Bool)

(declare-fun array_inv!3542 (array!11285) Bool)

(assert (=> b!229422 (= e!148843 (and tp!21618 tp_is_empty!6021 (array_inv!3541 (_keys!6330 thiss!1504)) (array_inv!3542 (_values!4259 thiss!1504)) e!148834))))

(declare-fun mapNonEmpty!10201 () Bool)

(declare-fun tp!21619 () Bool)

(assert (=> mapNonEmpty!10201 (= mapRes!10201 (and tp!21619 e!148844))))

(declare-fun mapKey!10201 () (_ BitVec 32))

(declare-fun mapValue!10201 () ValueCell!2667)

(declare-fun mapRest!10201 () (Array (_ BitVec 32) ValueCell!2667))

(assert (=> mapNonEmpty!10201 (= (arr!5362 (_values!4259 thiss!1504)) (store mapRest!10201 mapKey!10201 mapValue!10201))))

(declare-fun b!229423 () Bool)

(declare-fun Unit!7001 () Unit!6997)

(assert (=> b!229423 (= e!148839 Unit!7001)))

(assert (= (and start!22092 res!112903) b!229403))

(assert (= (and b!229403 res!112899) b!229418))

(assert (= (and b!229418 res!112909) b!229407))

(assert (= (and b!229407 c!38050) b!229408))

(assert (= (and b!229407 (not c!38050)) b!229411))

(assert (= (and b!229411 c!38049) b!229420))

(assert (= (and b!229411 (not c!38049)) b!229405))

(assert (= (and b!229420 res!112902) b!229404))

(assert (= (and b!229404 res!112907) b!229412))

(assert (= (and b!229405 c!38051) b!229414))

(assert (= (and b!229405 (not c!38051)) b!229401))

(assert (= (and b!229414 res!112906) b!229406))

(assert (= (and b!229406 res!112908) b!229417))

(assert (= (or b!229420 b!229414) bm!21308))

(assert (= (or b!229412 b!229417) bm!21309))

(assert (= (and b!229407 res!112905) b!229409))

(assert (= (and b!229409 c!38052) b!229410))

(assert (= (and b!229409 (not c!38052)) b!229423))

(assert (= (and b!229409 (not res!112901)) b!229421))

(assert (= (and b!229421 (not res!112900)) b!229416))

(assert (= (and b!229416 (not res!112904)) b!229402))

(assert (= (and b!229419 condMapEmpty!10201) mapIsEmpty!10201))

(assert (= (and b!229419 (not condMapEmpty!10201)) mapNonEmpty!10201))

(assert (= (and mapNonEmpty!10201 ((_ is ValueCellFull!2667) mapValue!10201)) b!229413))

(assert (= (and b!229419 ((_ is ValueCellFull!2667) mapDefault!10201)) b!229415))

(assert (= b!229422 b!229419))

(assert (= start!22092 b!229422))

(declare-fun m!250923 () Bool)

(assert (=> b!229402 m!250923))

(declare-fun m!250925 () Bool)

(assert (=> b!229418 m!250925))

(declare-fun m!250927 () Bool)

(assert (=> b!229404 m!250927))

(declare-fun m!250929 () Bool)

(assert (=> mapNonEmpty!10201 m!250929))

(declare-fun m!250931 () Bool)

(assert (=> b!229406 m!250931))

(declare-fun m!250933 () Bool)

(assert (=> bm!21308 m!250933))

(declare-fun m!250935 () Bool)

(assert (=> b!229407 m!250935))

(declare-fun m!250937 () Bool)

(assert (=> b!229407 m!250937))

(assert (=> b!229407 m!250937))

(declare-fun m!250939 () Bool)

(assert (=> b!229407 m!250939))

(declare-fun m!250941 () Bool)

(assert (=> b!229409 m!250941))

(declare-fun m!250943 () Bool)

(assert (=> b!229409 m!250943))

(declare-fun m!250945 () Bool)

(assert (=> b!229409 m!250945))

(declare-fun m!250947 () Bool)

(assert (=> b!229409 m!250947))

(declare-fun m!250949 () Bool)

(assert (=> b!229409 m!250949))

(declare-fun m!250951 () Bool)

(assert (=> b!229409 m!250951))

(declare-fun m!250953 () Bool)

(assert (=> b!229409 m!250953))

(declare-fun m!250955 () Bool)

(assert (=> b!229409 m!250955))

(declare-fun m!250957 () Bool)

(assert (=> b!229409 m!250957))

(declare-fun m!250959 () Bool)

(assert (=> b!229409 m!250959))

(assert (=> bm!21309 m!250943))

(declare-fun m!250961 () Bool)

(assert (=> start!22092 m!250961))

(declare-fun m!250963 () Bool)

(assert (=> b!229408 m!250963))

(declare-fun m!250965 () Bool)

(assert (=> b!229411 m!250965))

(declare-fun m!250967 () Bool)

(assert (=> b!229410 m!250967))

(declare-fun m!250969 () Bool)

(assert (=> b!229422 m!250969))

(declare-fun m!250971 () Bool)

(assert (=> b!229422 m!250971))

(declare-fun m!250973 () Bool)

(assert (=> b!229416 m!250973))

(check-sat tp_is_empty!6021 (not b!229416) (not b!229422) (not start!22092) (not bm!21309) (not b!229407) b_and!13057 (not b_next!6159) (not b!229409) (not b!229418) (not b!229408) (not b!229410) (not mapNonEmpty!10201) (not bm!21308) (not b!229402) (not b!229411))
(check-sat b_and!13057 (not b_next!6159))
