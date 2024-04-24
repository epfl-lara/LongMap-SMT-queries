; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25138 () Bool)

(assert start!25138)

(declare-fun b!262017 () Bool)

(declare-fun b_free!6781 () Bool)

(declare-fun b_next!6781 () Bool)

(assert (=> b!262017 (= b_free!6781 (not b_next!6781))))

(declare-fun tp!23674 () Bool)

(declare-fun b_and!13929 () Bool)

(assert (=> b!262017 (= tp!23674 b_and!13929)))

(declare-fun b!262013 () Bool)

(declare-fun res!127985 () Bool)

(declare-fun e!169800 () Bool)

(assert (=> b!262013 (=> (not res!127985) (not e!169800))))

(declare-fun call!25004 () Bool)

(assert (=> b!262013 (= res!127985 call!25004)))

(declare-fun e!169795 () Bool)

(assert (=> b!262013 (= e!169795 e!169800)))

(declare-fun b!262014 () Bool)

(declare-fun e!169790 () Bool)

(declare-datatypes ((SeekEntryResult!1159 0))(
  ( (MissingZero!1159 (index!6806 (_ BitVec 32))) (Found!1159 (index!6807 (_ BitVec 32))) (Intermediate!1159 (undefined!1971 Bool) (index!6808 (_ BitVec 32)) (x!25165 (_ BitVec 32))) (Undefined!1159) (MissingVacant!1159 (index!6809 (_ BitVec 32))) )
))
(declare-fun lt!132411 () SeekEntryResult!1159)

(get-info :version)

(assert (=> b!262014 (= e!169790 ((_ is Undefined!1159) lt!132411))))

(declare-fun mapNonEmpty!11323 () Bool)

(declare-fun mapRes!11323 () Bool)

(declare-fun tp!23673 () Bool)

(declare-fun e!169798 () Bool)

(assert (=> mapNonEmpty!11323 (= mapRes!11323 (and tp!23673 e!169798))))

(declare-datatypes ((V!8505 0))(
  ( (V!8506 (val!3366 Int)) )
))
(declare-datatypes ((ValueCell!2978 0))(
  ( (ValueCellFull!2978 (v!5492 V!8505)) (EmptyCell!2978) )
))
(declare-fun mapValue!11323 () ValueCell!2978)

(declare-datatypes ((array!12641 0))(
  ( (array!12642 (arr!5983 (Array (_ BitVec 32) ValueCell!2978)) (size!6334 (_ BitVec 32))) )
))
(declare-datatypes ((array!12643 0))(
  ( (array!12644 (arr!5984 (Array (_ BitVec 32) (_ BitVec 64))) (size!6335 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3856 0))(
  ( (LongMapFixedSize!3857 (defaultEntry!4826 Int) (mask!11178 (_ BitVec 32)) (extraKeys!4563 (_ BitVec 32)) (zeroValue!4667 V!8505) (minValue!4667 V!8505) (_size!1977 (_ BitVec 32)) (_keys!7014 array!12643) (_values!4809 array!12641) (_vacant!1977 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3856)

(declare-fun mapRest!11323 () (Array (_ BitVec 32) ValueCell!2978))

(declare-fun mapKey!11323 () (_ BitVec 32))

(assert (=> mapNonEmpty!11323 (= (arr!5983 (_values!4809 thiss!1504)) (store mapRest!11323 mapKey!11323 mapValue!11323))))

(declare-fun bm!25000 () Bool)

(declare-fun call!25003 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25000 (= call!25003 (arrayContainsKey!0 (_keys!7014 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262015 () Bool)

(declare-fun e!169788 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!262015 (= e!169788 (or (not (= (size!6334 (_values!4809 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11178 thiss!1504)))) (not (= (size!6335 (_keys!7014 thiss!1504)) (size!6334 (_values!4809 thiss!1504)))) (bvslt (mask!11178 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4563 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4563 thiss!1504) #b00000000000000000000000000000011) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6335 (_keys!7014 thiss!1504))))))))

(declare-fun b!262016 () Bool)

(declare-fun e!169794 () Bool)

(declare-fun e!169793 () Bool)

(assert (=> b!262016 (= e!169794 e!169793)))

(declare-fun res!127991 () Bool)

(assert (=> b!262016 (=> (not res!127991) (not e!169793))))

(assert (=> b!262016 (= res!127991 (or (= lt!132411 (MissingZero!1159 index!297)) (= lt!132411 (MissingVacant!1159 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12643 (_ BitVec 32)) SeekEntryResult!1159)

(assert (=> b!262016 (= lt!132411 (seekEntryOrOpen!0 key!932 (_keys!7014 thiss!1504) (mask!11178 thiss!1504)))))

(declare-fun e!169787 () Bool)

(declare-fun e!169796 () Bool)

(declare-fun tp_is_empty!6643 () Bool)

(declare-fun array_inv!3937 (array!12643) Bool)

(declare-fun array_inv!3938 (array!12641) Bool)

(assert (=> b!262017 (= e!169796 (and tp!23674 tp_is_empty!6643 (array_inv!3937 (_keys!7014 thiss!1504)) (array_inv!3938 (_values!4809 thiss!1504)) e!169787))))

(declare-fun b!262018 () Bool)

(declare-fun e!169792 () Bool)

(assert (=> b!262018 (= e!169790 e!169792)))

(declare-fun res!127993 () Bool)

(assert (=> b!262018 (= res!127993 call!25004)))

(assert (=> b!262018 (=> (not res!127993) (not e!169792))))

(declare-fun mapIsEmpty!11323 () Bool)

(assert (=> mapIsEmpty!11323 mapRes!11323))

(declare-fun b!262019 () Bool)

(declare-datatypes ((Unit!8134 0))(
  ( (Unit!8135) )
))
(declare-fun e!169799 () Unit!8134)

(declare-fun Unit!8136 () Unit!8134)

(assert (=> b!262019 (= e!169799 Unit!8136)))

(declare-fun lt!132407 () Unit!8134)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!446 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8134)

(assert (=> b!262019 (= lt!132407 (lemmaInListMapThenSeekEntryOrOpenFindsIt!446 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> b!262019 false))

(declare-fun bm!25001 () Bool)

(declare-fun c!44636 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!25001 (= call!25004 (inRange!0 (ite c!44636 (index!6806 lt!132411) (index!6809 lt!132411)) (mask!11178 thiss!1504)))))

(declare-fun b!262021 () Bool)

(declare-fun res!127990 () Bool)

(assert (=> b!262021 (=> (not res!127990) (not e!169800))))

(assert (=> b!262021 (= res!127990 (= (select (arr!5984 (_keys!7014 thiss!1504)) (index!6806 lt!132411)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262022 () Bool)

(declare-fun e!169791 () Bool)

(assert (=> b!262022 (= e!169793 e!169791)))

(declare-fun res!127988 () Bool)

(assert (=> b!262022 (=> (not res!127988) (not e!169791))))

(assert (=> b!262022 (= res!127988 (inRange!0 index!297 (mask!11178 thiss!1504)))))

(declare-fun lt!132406 () Unit!8134)

(assert (=> b!262022 (= lt!132406 e!169799)))

(declare-fun c!44635 () Bool)

(declare-datatypes ((tuple2!4876 0))(
  ( (tuple2!4877 (_1!2449 (_ BitVec 64)) (_2!2449 V!8505)) )
))
(declare-datatypes ((List!3753 0))(
  ( (Nil!3750) (Cons!3749 (h!4415 tuple2!4876) (t!8818 List!3753)) )
))
(declare-datatypes ((ListLongMap!3791 0))(
  ( (ListLongMap!3792 (toList!1911 List!3753)) )
))
(declare-fun lt!132405 () ListLongMap!3791)

(declare-fun contains!1877 (ListLongMap!3791 (_ BitVec 64)) Bool)

(assert (=> b!262022 (= c!44635 (contains!1877 lt!132405 key!932))))

(declare-fun getCurrentListMap!1443 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) Int) ListLongMap!3791)

(assert (=> b!262022 (= lt!132405 (getCurrentListMap!1443 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun b!262023 () Bool)

(declare-fun lt!132401 () Unit!8134)

(assert (=> b!262023 (= e!169799 lt!132401)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!437 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8134)

(assert (=> b!262023 (= lt!132401 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!437 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> b!262023 (= c!44636 ((_ is MissingZero!1159) lt!132411))))

(assert (=> b!262023 e!169795))

(declare-fun b!262024 () Bool)

(declare-fun res!127986 () Bool)

(assert (=> b!262024 (= res!127986 (= (select (arr!5984 (_keys!7014 thiss!1504)) (index!6809 lt!132411)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262024 (=> (not res!127986) (not e!169792))))

(declare-fun b!262025 () Bool)

(declare-fun e!169797 () Unit!8134)

(declare-fun Unit!8137 () Unit!8134)

(assert (=> b!262025 (= e!169797 Unit!8137)))

(declare-fun b!262026 () Bool)

(declare-fun c!44634 () Bool)

(assert (=> b!262026 (= c!44634 ((_ is MissingVacant!1159) lt!132411))))

(assert (=> b!262026 (= e!169795 e!169790)))

(declare-fun b!262027 () Bool)

(declare-fun e!169789 () Bool)

(assert (=> b!262027 (= e!169787 (and e!169789 mapRes!11323))))

(declare-fun condMapEmpty!11323 () Bool)

(declare-fun mapDefault!11323 () ValueCell!2978)

(assert (=> b!262027 (= condMapEmpty!11323 (= (arr!5983 (_values!4809 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2978)) mapDefault!11323)))))

(declare-fun b!262028 () Bool)

(assert (=> b!262028 (= e!169800 (not call!25003))))

(declare-fun b!262029 () Bool)

(assert (=> b!262029 (= e!169789 tp_is_empty!6643)))

(declare-fun b!262030 () Bool)

(assert (=> b!262030 (= e!169798 tp_is_empty!6643)))

(declare-fun b!262031 () Bool)

(declare-fun Unit!8138 () Unit!8134)

(assert (=> b!262031 (= e!169797 Unit!8138)))

(declare-fun lt!132400 () Unit!8134)

(declare-fun lemmaArrayContainsKeyThenInListMap!265 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) (_ BitVec 32) Int) Unit!8134)

(assert (=> b!262031 (= lt!132400 (lemmaArrayContainsKeyThenInListMap!265 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(assert (=> b!262031 false))

(declare-fun b!262032 () Bool)

(assert (=> b!262032 (= e!169792 (not call!25003))))

(declare-fun b!262033 () Bool)

(assert (=> b!262033 (= e!169791 (not e!169788))))

(declare-fun res!127989 () Bool)

(assert (=> b!262033 (=> res!127989 e!169788)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!262033 (= res!127989 (not (validMask!0 (mask!11178 thiss!1504))))))

(declare-fun lt!132402 () array!12643)

(declare-fun arrayCountValidKeys!0 (array!12643 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262033 (= (arrayCountValidKeys!0 lt!132402 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132408 () Unit!8134)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12643 (_ BitVec 32)) Unit!8134)

(assert (=> b!262033 (= lt!132408 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132402 index!297))))

(assert (=> b!262033 (arrayContainsKey!0 lt!132402 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132410 () Unit!8134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12643 (_ BitVec 64) (_ BitVec 32)) Unit!8134)

(assert (=> b!262033 (= lt!132410 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132402 key!932 index!297))))

(declare-fun v!346 () V!8505)

(declare-fun +!707 (ListLongMap!3791 tuple2!4876) ListLongMap!3791)

(assert (=> b!262033 (= (+!707 lt!132405 (tuple2!4877 key!932 v!346)) (getCurrentListMap!1443 lt!132402 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132413 () Unit!8134)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!122 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) (_ BitVec 64) V!8505 Int) Unit!8134)

(assert (=> b!262033 (= lt!132413 (lemmaAddValidKeyToArrayThenAddPairToListMap!122 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) index!297 key!932 v!346 (defaultEntry!4826 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12643 (_ BitVec 32)) Bool)

(assert (=> b!262033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132402 (mask!11178 thiss!1504))))

(declare-fun lt!132403 () Unit!8134)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12643 (_ BitVec 32) (_ BitVec 32)) Unit!8134)

(assert (=> b!262033 (= lt!132403 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7014 thiss!1504) index!297 (mask!11178 thiss!1504)))))

(assert (=> b!262033 (= (arrayCountValidKeys!0 lt!132402 #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7014 thiss!1504) #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504)))))))

(declare-fun lt!132404 () Unit!8134)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12643 (_ BitVec 32) (_ BitVec 64)) Unit!8134)

(assert (=> b!262033 (= lt!132404 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7014 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3754 0))(
  ( (Nil!3751) (Cons!3750 (h!4416 (_ BitVec 64)) (t!8819 List!3754)) )
))
(declare-fun arrayNoDuplicates!0 (array!12643 (_ BitVec 32) List!3754) Bool)

(assert (=> b!262033 (arrayNoDuplicates!0 lt!132402 #b00000000000000000000000000000000 Nil!3751)))

(assert (=> b!262033 (= lt!132402 (array!12644 (store (arr!5984 (_keys!7014 thiss!1504)) index!297 key!932) (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun lt!132409 () Unit!8134)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12643 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3754) Unit!8134)

(assert (=> b!262033 (= lt!132409 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7014 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3751))))

(declare-fun lt!132412 () Unit!8134)

(assert (=> b!262033 (= lt!132412 e!169797)))

(declare-fun c!44637 () Bool)

(assert (=> b!262033 (= c!44637 (arrayContainsKey!0 (_keys!7014 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!127992 () Bool)

(assert (=> start!25138 (=> (not res!127992) (not e!169794))))

(declare-fun valid!1509 (LongMapFixedSize!3856) Bool)

(assert (=> start!25138 (= res!127992 (valid!1509 thiss!1504))))

(assert (=> start!25138 e!169794))

(assert (=> start!25138 e!169796))

(assert (=> start!25138 true))

(assert (=> start!25138 tp_is_empty!6643))

(declare-fun b!262020 () Bool)

(declare-fun res!127987 () Bool)

(assert (=> b!262020 (=> (not res!127987) (not e!169794))))

(assert (=> b!262020 (= res!127987 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!25138 res!127992) b!262020))

(assert (= (and b!262020 res!127987) b!262016))

(assert (= (and b!262016 res!127991) b!262022))

(assert (= (and b!262022 c!44635) b!262019))

(assert (= (and b!262022 (not c!44635)) b!262023))

(assert (= (and b!262023 c!44636) b!262013))

(assert (= (and b!262023 (not c!44636)) b!262026))

(assert (= (and b!262013 res!127985) b!262021))

(assert (= (and b!262021 res!127990) b!262028))

(assert (= (and b!262026 c!44634) b!262018))

(assert (= (and b!262026 (not c!44634)) b!262014))

(assert (= (and b!262018 res!127993) b!262024))

(assert (= (and b!262024 res!127986) b!262032))

(assert (= (or b!262013 b!262018) bm!25001))

(assert (= (or b!262028 b!262032) bm!25000))

(assert (= (and b!262022 res!127988) b!262033))

(assert (= (and b!262033 c!44637) b!262031))

(assert (= (and b!262033 (not c!44637)) b!262025))

(assert (= (and b!262033 (not res!127989)) b!262015))

(assert (= (and b!262027 condMapEmpty!11323) mapIsEmpty!11323))

(assert (= (and b!262027 (not condMapEmpty!11323)) mapNonEmpty!11323))

(assert (= (and mapNonEmpty!11323 ((_ is ValueCellFull!2978) mapValue!11323)) b!262030))

(assert (= (and b!262027 ((_ is ValueCellFull!2978) mapDefault!11323)) b!262029))

(assert (= b!262017 b!262027))

(assert (= start!25138 b!262017))

(declare-fun m!278239 () Bool)

(assert (=> b!262031 m!278239))

(declare-fun m!278241 () Bool)

(assert (=> b!262024 m!278241))

(declare-fun m!278243 () Bool)

(assert (=> bm!25000 m!278243))

(declare-fun m!278245 () Bool)

(assert (=> mapNonEmpty!11323 m!278245))

(declare-fun m!278247 () Bool)

(assert (=> start!25138 m!278247))

(declare-fun m!278249 () Bool)

(assert (=> b!262017 m!278249))

(declare-fun m!278251 () Bool)

(assert (=> b!262017 m!278251))

(declare-fun m!278253 () Bool)

(assert (=> b!262021 m!278253))

(declare-fun m!278255 () Bool)

(assert (=> b!262019 m!278255))

(declare-fun m!278257 () Bool)

(assert (=> b!262022 m!278257))

(declare-fun m!278259 () Bool)

(assert (=> b!262022 m!278259))

(declare-fun m!278261 () Bool)

(assert (=> b!262022 m!278261))

(declare-fun m!278263 () Bool)

(assert (=> b!262033 m!278263))

(declare-fun m!278265 () Bool)

(assert (=> b!262033 m!278265))

(declare-fun m!278267 () Bool)

(assert (=> b!262033 m!278267))

(declare-fun m!278269 () Bool)

(assert (=> b!262033 m!278269))

(declare-fun m!278271 () Bool)

(assert (=> b!262033 m!278271))

(declare-fun m!278273 () Bool)

(assert (=> b!262033 m!278273))

(declare-fun m!278275 () Bool)

(assert (=> b!262033 m!278275))

(declare-fun m!278277 () Bool)

(assert (=> b!262033 m!278277))

(declare-fun m!278279 () Bool)

(assert (=> b!262033 m!278279))

(declare-fun m!278281 () Bool)

(assert (=> b!262033 m!278281))

(declare-fun m!278283 () Bool)

(assert (=> b!262033 m!278283))

(declare-fun m!278285 () Bool)

(assert (=> b!262033 m!278285))

(assert (=> b!262033 m!278243))

(declare-fun m!278287 () Bool)

(assert (=> b!262033 m!278287))

(declare-fun m!278289 () Bool)

(assert (=> b!262033 m!278289))

(declare-fun m!278291 () Bool)

(assert (=> b!262033 m!278291))

(declare-fun m!278293 () Bool)

(assert (=> b!262033 m!278293))

(declare-fun m!278295 () Bool)

(assert (=> b!262033 m!278295))

(declare-fun m!278297 () Bool)

(assert (=> b!262023 m!278297))

(declare-fun m!278299 () Bool)

(assert (=> bm!25001 m!278299))

(declare-fun m!278301 () Bool)

(assert (=> b!262016 m!278301))

(check-sat (not b!262033) b_and!13929 (not b!262031) (not b_next!6781) (not bm!25000) (not b!262017) (not b!262022) (not bm!25001) (not b!262016) tp_is_empty!6643 (not b!262023) (not b!262019) (not mapNonEmpty!11323) (not start!25138))
(check-sat b_and!13929 (not b_next!6781))
(get-model)

(declare-fun d!63037 () Bool)

(assert (=> d!63037 (= (inRange!0 index!297 (mask!11178 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11178 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!262022 d!63037))

(declare-fun d!63039 () Bool)

(declare-fun e!169895 () Bool)

(assert (=> d!63039 e!169895))

(declare-fun res!128050 () Bool)

(assert (=> d!63039 (=> res!128050 e!169895)))

(declare-fun lt!132506 () Bool)

(assert (=> d!63039 (= res!128050 (not lt!132506))))

(declare-fun lt!132508 () Bool)

(assert (=> d!63039 (= lt!132506 lt!132508)))

(declare-fun lt!132509 () Unit!8134)

(declare-fun e!169896 () Unit!8134)

(assert (=> d!63039 (= lt!132509 e!169896)))

(declare-fun c!44664 () Bool)

(assert (=> d!63039 (= c!44664 lt!132508)))

(declare-fun containsKey!310 (List!3753 (_ BitVec 64)) Bool)

(assert (=> d!63039 (= lt!132508 (containsKey!310 (toList!1911 lt!132405) key!932))))

(assert (=> d!63039 (= (contains!1877 lt!132405 key!932) lt!132506)))

(declare-fun b!262166 () Bool)

(declare-fun lt!132507 () Unit!8134)

(assert (=> b!262166 (= e!169896 lt!132507)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!258 (List!3753 (_ BitVec 64)) Unit!8134)

(assert (=> b!262166 (= lt!132507 (lemmaContainsKeyImpliesGetValueByKeyDefined!258 (toList!1911 lt!132405) key!932))))

(declare-datatypes ((Option!325 0))(
  ( (Some!324 (v!5497 V!8505)) (None!323) )
))
(declare-fun isDefined!259 (Option!325) Bool)

(declare-fun getValueByKey!319 (List!3753 (_ BitVec 64)) Option!325)

(assert (=> b!262166 (isDefined!259 (getValueByKey!319 (toList!1911 lt!132405) key!932))))

(declare-fun b!262167 () Bool)

(declare-fun Unit!8144 () Unit!8134)

(assert (=> b!262167 (= e!169896 Unit!8144)))

(declare-fun b!262168 () Bool)

(assert (=> b!262168 (= e!169895 (isDefined!259 (getValueByKey!319 (toList!1911 lt!132405) key!932)))))

(assert (= (and d!63039 c!44664) b!262166))

(assert (= (and d!63039 (not c!44664)) b!262167))

(assert (= (and d!63039 (not res!128050)) b!262168))

(declare-fun m!278431 () Bool)

(assert (=> d!63039 m!278431))

(declare-fun m!278433 () Bool)

(assert (=> b!262166 m!278433))

(declare-fun m!278435 () Bool)

(assert (=> b!262166 m!278435))

(assert (=> b!262166 m!278435))

(declare-fun m!278437 () Bool)

(assert (=> b!262166 m!278437))

(assert (=> b!262168 m!278435))

(assert (=> b!262168 m!278435))

(assert (=> b!262168 m!278437))

(assert (=> b!262022 d!63039))

(declare-fun b!262211 () Bool)

(declare-fun e!169925 () Bool)

(declare-fun lt!132554 () ListLongMap!3791)

(declare-fun apply!260 (ListLongMap!3791 (_ BitVec 64)) V!8505)

(declare-fun get!3093 (ValueCell!2978 V!8505) V!8505)

(declare-fun dynLambda!603 (Int (_ BitVec 64)) V!8505)

(assert (=> b!262211 (= e!169925 (= (apply!260 lt!132554 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000)) (get!3093 (select (arr!5983 (_values!4809 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!603 (defaultEntry!4826 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262211 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6334 (_values!4809 thiss!1504))))))

(assert (=> b!262211 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun b!262212 () Bool)

(declare-fun e!169929 () ListLongMap!3791)

(declare-fun call!25032 () ListLongMap!3791)

(assert (=> b!262212 (= e!169929 call!25032)))

(declare-fun b!262213 () Bool)

(declare-fun e!169927 () Bool)

(assert (=> b!262213 (= e!169927 (= (apply!260 lt!132554 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4667 thiss!1504)))))

(declare-fun b!262214 () Bool)

(declare-fun e!169933 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!262214 (= e!169933 (validKeyInArray!0 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262215 () Bool)

(declare-fun e!169932 () ListLongMap!3791)

(declare-fun call!25037 () ListLongMap!3791)

(assert (=> b!262215 (= e!169932 call!25037)))

(declare-fun b!262216 () Bool)

(declare-fun e!169935 () Bool)

(declare-fun call!25034 () Bool)

(assert (=> b!262216 (= e!169935 (not call!25034))))

(declare-fun b!262217 () Bool)

(declare-fun res!128069 () Bool)

(declare-fun e!169934 () Bool)

(assert (=> b!262217 (=> (not res!128069) (not e!169934))))

(assert (=> b!262217 (= res!128069 e!169935)))

(declare-fun c!44678 () Bool)

(assert (=> b!262217 (= c!44678 (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262218 () Bool)

(declare-fun e!169926 () Bool)

(declare-fun call!25035 () Bool)

(assert (=> b!262218 (= e!169926 (not call!25035))))

(declare-fun bm!25028 () Bool)

(declare-fun call!25036 () ListLongMap!3791)

(declare-fun getCurrentListMapNoExtraKeys!576 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) Int) ListLongMap!3791)

(assert (=> bm!25028 (= call!25036 (getCurrentListMapNoExtraKeys!576 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun call!25033 () ListLongMap!3791)

(declare-fun call!25031 () ListLongMap!3791)

(declare-fun bm!25029 () Bool)

(declare-fun c!44680 () Bool)

(declare-fun c!44677 () Bool)

(assert (=> bm!25029 (= call!25033 (+!707 (ite c!44677 call!25036 (ite c!44680 call!25031 call!25037)) (ite (or c!44677 c!44680) (tuple2!4877 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4667 thiss!1504)) (tuple2!4877 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4667 thiss!1504)))))))

(declare-fun b!262220 () Bool)

(declare-fun e!169930 () Bool)

(assert (=> b!262220 (= e!169930 (= (apply!260 lt!132554 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4667 thiss!1504)))))

(declare-fun bm!25030 () Bool)

(assert (=> bm!25030 (= call!25035 (contains!1877 lt!132554 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262221 () Bool)

(assert (=> b!262221 (= e!169926 e!169930)))

(declare-fun res!128072 () Bool)

(assert (=> b!262221 (= res!128072 call!25035)))

(assert (=> b!262221 (=> (not res!128072) (not e!169930))))

(declare-fun bm!25031 () Bool)

(assert (=> bm!25031 (= call!25034 (contains!1877 lt!132554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262222 () Bool)

(declare-fun e!169931 () Bool)

(assert (=> b!262222 (= e!169931 (validKeyInArray!0 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!25032 () Bool)

(assert (=> bm!25032 (= call!25037 call!25031)))

(declare-fun d!63041 () Bool)

(assert (=> d!63041 e!169934))

(declare-fun res!128073 () Bool)

(assert (=> d!63041 (=> (not res!128073) (not e!169934))))

(assert (=> d!63041 (= res!128073 (or (bvsge #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))))))))

(declare-fun lt!132568 () ListLongMap!3791)

(assert (=> d!63041 (= lt!132554 lt!132568)))

(declare-fun lt!132562 () Unit!8134)

(declare-fun e!169923 () Unit!8134)

(assert (=> d!63041 (= lt!132562 e!169923)))

(declare-fun c!44681 () Bool)

(assert (=> d!63041 (= c!44681 e!169931)))

(declare-fun res!128070 () Bool)

(assert (=> d!63041 (=> (not res!128070) (not e!169931))))

(assert (=> d!63041 (= res!128070 (bvslt #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun e!169928 () ListLongMap!3791)

(assert (=> d!63041 (= lt!132568 e!169928)))

(assert (=> d!63041 (= c!44677 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63041 (validMask!0 (mask!11178 thiss!1504))))

(assert (=> d!63041 (= (getCurrentListMap!1443 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) lt!132554)))

(declare-fun b!262219 () Bool)

(assert (=> b!262219 (= e!169935 e!169927)))

(declare-fun res!128076 () Bool)

(assert (=> b!262219 (= res!128076 call!25034)))

(assert (=> b!262219 (=> (not res!128076) (not e!169927))))

(declare-fun b!262223 () Bool)

(declare-fun c!44679 () Bool)

(assert (=> b!262223 (= c!44679 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262223 (= e!169929 e!169932)))

(declare-fun b!262224 () Bool)

(declare-fun e!169924 () Bool)

(assert (=> b!262224 (= e!169924 e!169925)))

(declare-fun res!128075 () Bool)

(assert (=> b!262224 (=> (not res!128075) (not e!169925))))

(assert (=> b!262224 (= res!128075 (contains!1877 lt!132554 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!262224 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun b!262225 () Bool)

(declare-fun lt!132561 () Unit!8134)

(assert (=> b!262225 (= e!169923 lt!132561)))

(declare-fun lt!132564 () ListLongMap!3791)

(assert (=> b!262225 (= lt!132564 (getCurrentListMapNoExtraKeys!576 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132558 () (_ BitVec 64))

(assert (=> b!262225 (= lt!132558 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132556 () (_ BitVec 64))

(assert (=> b!262225 (= lt!132556 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132557 () Unit!8134)

(declare-fun addStillContains!236 (ListLongMap!3791 (_ BitVec 64) V!8505 (_ BitVec 64)) Unit!8134)

(assert (=> b!262225 (= lt!132557 (addStillContains!236 lt!132564 lt!132558 (zeroValue!4667 thiss!1504) lt!132556))))

(assert (=> b!262225 (contains!1877 (+!707 lt!132564 (tuple2!4877 lt!132558 (zeroValue!4667 thiss!1504))) lt!132556)))

(declare-fun lt!132569 () Unit!8134)

(assert (=> b!262225 (= lt!132569 lt!132557)))

(declare-fun lt!132566 () ListLongMap!3791)

(assert (=> b!262225 (= lt!132566 (getCurrentListMapNoExtraKeys!576 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132573 () (_ BitVec 64))

(assert (=> b!262225 (= lt!132573 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132555 () (_ BitVec 64))

(assert (=> b!262225 (= lt!132555 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132574 () Unit!8134)

(declare-fun addApplyDifferent!236 (ListLongMap!3791 (_ BitVec 64) V!8505 (_ BitVec 64)) Unit!8134)

(assert (=> b!262225 (= lt!132574 (addApplyDifferent!236 lt!132566 lt!132573 (minValue!4667 thiss!1504) lt!132555))))

(assert (=> b!262225 (= (apply!260 (+!707 lt!132566 (tuple2!4877 lt!132573 (minValue!4667 thiss!1504))) lt!132555) (apply!260 lt!132566 lt!132555))))

(declare-fun lt!132560 () Unit!8134)

(assert (=> b!262225 (= lt!132560 lt!132574)))

(declare-fun lt!132565 () ListLongMap!3791)

(assert (=> b!262225 (= lt!132565 (getCurrentListMapNoExtraKeys!576 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132559 () (_ BitVec 64))

(assert (=> b!262225 (= lt!132559 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132571 () (_ BitVec 64))

(assert (=> b!262225 (= lt!132571 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132570 () Unit!8134)

(assert (=> b!262225 (= lt!132570 (addApplyDifferent!236 lt!132565 lt!132559 (zeroValue!4667 thiss!1504) lt!132571))))

(assert (=> b!262225 (= (apply!260 (+!707 lt!132565 (tuple2!4877 lt!132559 (zeroValue!4667 thiss!1504))) lt!132571) (apply!260 lt!132565 lt!132571))))

(declare-fun lt!132567 () Unit!8134)

(assert (=> b!262225 (= lt!132567 lt!132570)))

(declare-fun lt!132575 () ListLongMap!3791)

(assert (=> b!262225 (= lt!132575 (getCurrentListMapNoExtraKeys!576 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132572 () (_ BitVec 64))

(assert (=> b!262225 (= lt!132572 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132563 () (_ BitVec 64))

(assert (=> b!262225 (= lt!132563 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262225 (= lt!132561 (addApplyDifferent!236 lt!132575 lt!132572 (minValue!4667 thiss!1504) lt!132563))))

(assert (=> b!262225 (= (apply!260 (+!707 lt!132575 (tuple2!4877 lt!132572 (minValue!4667 thiss!1504))) lt!132563) (apply!260 lt!132575 lt!132563))))

(declare-fun bm!25033 () Bool)

(assert (=> bm!25033 (= call!25031 call!25036)))

(declare-fun b!262226 () Bool)

(declare-fun res!128077 () Bool)

(assert (=> b!262226 (=> (not res!128077) (not e!169934))))

(assert (=> b!262226 (= res!128077 e!169924)))

(declare-fun res!128071 () Bool)

(assert (=> b!262226 (=> res!128071 e!169924)))

(assert (=> b!262226 (= res!128071 (not e!169933))))

(declare-fun res!128074 () Bool)

(assert (=> b!262226 (=> (not res!128074) (not e!169933))))

(assert (=> b!262226 (= res!128074 (bvslt #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun b!262227 () Bool)

(declare-fun Unit!8145 () Unit!8134)

(assert (=> b!262227 (= e!169923 Unit!8145)))

(declare-fun b!262228 () Bool)

(assert (=> b!262228 (= e!169934 e!169926)))

(declare-fun c!44682 () Bool)

(assert (=> b!262228 (= c!44682 (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25034 () Bool)

(assert (=> bm!25034 (= call!25032 call!25033)))

(declare-fun b!262229 () Bool)

(assert (=> b!262229 (= e!169932 call!25032)))

(declare-fun b!262230 () Bool)

(assert (=> b!262230 (= e!169928 (+!707 call!25033 (tuple2!4877 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4667 thiss!1504))))))

(declare-fun b!262231 () Bool)

(assert (=> b!262231 (= e!169928 e!169929)))

(assert (=> b!262231 (= c!44680 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!63041 c!44677) b!262230))

(assert (= (and d!63041 (not c!44677)) b!262231))

(assert (= (and b!262231 c!44680) b!262212))

(assert (= (and b!262231 (not c!44680)) b!262223))

(assert (= (and b!262223 c!44679) b!262229))

(assert (= (and b!262223 (not c!44679)) b!262215))

(assert (= (or b!262229 b!262215) bm!25032))

(assert (= (or b!262212 bm!25032) bm!25033))

(assert (= (or b!262212 b!262229) bm!25034))

(assert (= (or b!262230 bm!25033) bm!25028))

(assert (= (or b!262230 bm!25034) bm!25029))

(assert (= (and d!63041 res!128070) b!262222))

(assert (= (and d!63041 c!44681) b!262225))

(assert (= (and d!63041 (not c!44681)) b!262227))

(assert (= (and d!63041 res!128073) b!262226))

(assert (= (and b!262226 res!128074) b!262214))

(assert (= (and b!262226 (not res!128071)) b!262224))

(assert (= (and b!262224 res!128075) b!262211))

(assert (= (and b!262226 res!128077) b!262217))

(assert (= (and b!262217 c!44678) b!262219))

(assert (= (and b!262217 (not c!44678)) b!262216))

(assert (= (and b!262219 res!128076) b!262213))

(assert (= (or b!262219 b!262216) bm!25031))

(assert (= (and b!262217 res!128069) b!262228))

(assert (= (and b!262228 c!44682) b!262221))

(assert (= (and b!262228 (not c!44682)) b!262218))

(assert (= (and b!262221 res!128072) b!262220))

(assert (= (or b!262221 b!262218) bm!25030))

(declare-fun b_lambda!8337 () Bool)

(assert (=> (not b_lambda!8337) (not b!262211)))

(declare-fun t!8823 () Bool)

(declare-fun tb!3025 () Bool)

(assert (=> (and b!262017 (= (defaultEntry!4826 thiss!1504) (defaultEntry!4826 thiss!1504)) t!8823) tb!3025))

(declare-fun result!5413 () Bool)

(assert (=> tb!3025 (= result!5413 tp_is_empty!6643)))

(assert (=> b!262211 t!8823))

(declare-fun b_and!13935 () Bool)

(assert (= b_and!13929 (and (=> t!8823 result!5413) b_and!13935)))

(declare-fun m!278439 () Bool)

(assert (=> bm!25029 m!278439))

(declare-fun m!278441 () Bool)

(assert (=> bm!25030 m!278441))

(declare-fun m!278443 () Bool)

(assert (=> b!262230 m!278443))

(declare-fun m!278445 () Bool)

(assert (=> b!262220 m!278445))

(declare-fun m!278447 () Bool)

(assert (=> b!262224 m!278447))

(assert (=> b!262224 m!278447))

(declare-fun m!278449 () Bool)

(assert (=> b!262224 m!278449))

(assert (=> b!262214 m!278447))

(assert (=> b!262214 m!278447))

(declare-fun m!278451 () Bool)

(assert (=> b!262214 m!278451))

(declare-fun m!278453 () Bool)

(assert (=> b!262213 m!278453))

(declare-fun m!278455 () Bool)

(assert (=> bm!25031 m!278455))

(assert (=> d!63041 m!278263))

(declare-fun m!278457 () Bool)

(assert (=> b!262225 m!278457))

(declare-fun m!278459 () Bool)

(assert (=> b!262225 m!278459))

(declare-fun m!278461 () Bool)

(assert (=> b!262225 m!278461))

(declare-fun m!278463 () Bool)

(assert (=> b!262225 m!278463))

(declare-fun m!278465 () Bool)

(assert (=> b!262225 m!278465))

(declare-fun m!278467 () Bool)

(assert (=> b!262225 m!278467))

(declare-fun m!278469 () Bool)

(assert (=> b!262225 m!278469))

(declare-fun m!278471 () Bool)

(assert (=> b!262225 m!278471))

(assert (=> b!262225 m!278447))

(declare-fun m!278473 () Bool)

(assert (=> b!262225 m!278473))

(assert (=> b!262225 m!278461))

(declare-fun m!278475 () Bool)

(assert (=> b!262225 m!278475))

(assert (=> b!262225 m!278457))

(declare-fun m!278477 () Bool)

(assert (=> b!262225 m!278477))

(assert (=> b!262225 m!278469))

(declare-fun m!278479 () Bool)

(assert (=> b!262225 m!278479))

(declare-fun m!278481 () Bool)

(assert (=> b!262225 m!278481))

(declare-fun m!278483 () Bool)

(assert (=> b!262225 m!278483))

(declare-fun m!278485 () Bool)

(assert (=> b!262225 m!278485))

(declare-fun m!278487 () Bool)

(assert (=> b!262225 m!278487))

(assert (=> b!262225 m!278485))

(assert (=> b!262222 m!278447))

(assert (=> b!262222 m!278447))

(assert (=> b!262222 m!278451))

(declare-fun m!278489 () Bool)

(assert (=> b!262211 m!278489))

(declare-fun m!278491 () Bool)

(assert (=> b!262211 m!278491))

(declare-fun m!278493 () Bool)

(assert (=> b!262211 m!278493))

(assert (=> b!262211 m!278447))

(declare-fun m!278495 () Bool)

(assert (=> b!262211 m!278495))

(assert (=> b!262211 m!278489))

(assert (=> b!262211 m!278491))

(assert (=> b!262211 m!278447))

(assert (=> bm!25028 m!278483))

(assert (=> b!262022 d!63041))

(declare-fun b!262242 () Bool)

(declare-fun e!169941 () (_ BitVec 32))

(declare-fun call!25040 () (_ BitVec 32))

(assert (=> b!262242 (= e!169941 call!25040)))

(declare-fun b!262243 () Bool)

(assert (=> b!262243 (= e!169941 (bvadd #b00000000000000000000000000000001 call!25040))))

(declare-fun bm!25037 () Bool)

(assert (=> bm!25037 (= call!25040 (arrayCountValidKeys!0 lt!132402 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun b!262245 () Bool)

(declare-fun e!169940 () (_ BitVec 32))

(assert (=> b!262245 (= e!169940 #b00000000000000000000000000000000)))

(declare-fun d!63043 () Bool)

(declare-fun lt!132578 () (_ BitVec 32))

(assert (=> d!63043 (and (bvsge lt!132578 #b00000000000000000000000000000000) (bvsle lt!132578 (bvsub (size!6335 lt!132402) #b00000000000000000000000000000000)))))

(assert (=> d!63043 (= lt!132578 e!169940)))

(declare-fun c!44687 () Bool)

(assert (=> d!63043 (= c!44687 (bvsge #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))))))

(assert (=> d!63043 (and (bvsle #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6335 (_keys!7014 thiss!1504)) (size!6335 lt!132402)))))

(assert (=> d!63043 (= (arrayCountValidKeys!0 lt!132402 #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) lt!132578)))

(declare-fun b!262244 () Bool)

(assert (=> b!262244 (= e!169940 e!169941)))

(declare-fun c!44688 () Bool)

(assert (=> b!262244 (= c!44688 (validKeyInArray!0 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)))))

(assert (= (and d!63043 c!44687) b!262245))

(assert (= (and d!63043 (not c!44687)) b!262244))

(assert (= (and b!262244 c!44688) b!262243))

(assert (= (and b!262244 (not c!44688)) b!262242))

(assert (= (or b!262243 b!262242) bm!25037))

(declare-fun m!278497 () Bool)

(assert (=> bm!25037 m!278497))

(declare-fun m!278499 () Bool)

(assert (=> b!262244 m!278499))

(assert (=> b!262244 m!278499))

(declare-fun m!278501 () Bool)

(assert (=> b!262244 m!278501))

(assert (=> b!262033 d!63043))

(declare-fun d!63045 () Bool)

(declare-fun e!169944 () Bool)

(assert (=> d!63045 e!169944))

(declare-fun res!128082 () Bool)

(assert (=> d!63045 (=> (not res!128082) (not e!169944))))

(declare-fun lt!132587 () ListLongMap!3791)

(assert (=> d!63045 (= res!128082 (contains!1877 lt!132587 (_1!2449 (tuple2!4877 key!932 v!346))))))

(declare-fun lt!132589 () List!3753)

(assert (=> d!63045 (= lt!132587 (ListLongMap!3792 lt!132589))))

(declare-fun lt!132590 () Unit!8134)

(declare-fun lt!132588 () Unit!8134)

(assert (=> d!63045 (= lt!132590 lt!132588)))

(assert (=> d!63045 (= (getValueByKey!319 lt!132589 (_1!2449 (tuple2!4877 key!932 v!346))) (Some!324 (_2!2449 (tuple2!4877 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!175 (List!3753 (_ BitVec 64) V!8505) Unit!8134)

(assert (=> d!63045 (= lt!132588 (lemmaContainsTupThenGetReturnValue!175 lt!132589 (_1!2449 (tuple2!4877 key!932 v!346)) (_2!2449 (tuple2!4877 key!932 v!346))))))

(declare-fun insertStrictlySorted!178 (List!3753 (_ BitVec 64) V!8505) List!3753)

(assert (=> d!63045 (= lt!132589 (insertStrictlySorted!178 (toList!1911 lt!132405) (_1!2449 (tuple2!4877 key!932 v!346)) (_2!2449 (tuple2!4877 key!932 v!346))))))

(assert (=> d!63045 (= (+!707 lt!132405 (tuple2!4877 key!932 v!346)) lt!132587)))

(declare-fun b!262250 () Bool)

(declare-fun res!128083 () Bool)

(assert (=> b!262250 (=> (not res!128083) (not e!169944))))

(assert (=> b!262250 (= res!128083 (= (getValueByKey!319 (toList!1911 lt!132587) (_1!2449 (tuple2!4877 key!932 v!346))) (Some!324 (_2!2449 (tuple2!4877 key!932 v!346)))))))

(declare-fun b!262251 () Bool)

(declare-fun contains!1879 (List!3753 tuple2!4876) Bool)

(assert (=> b!262251 (= e!169944 (contains!1879 (toList!1911 lt!132587) (tuple2!4877 key!932 v!346)))))

(assert (= (and d!63045 res!128082) b!262250))

(assert (= (and b!262250 res!128083) b!262251))

(declare-fun m!278503 () Bool)

(assert (=> d!63045 m!278503))

(declare-fun m!278505 () Bool)

(assert (=> d!63045 m!278505))

(declare-fun m!278507 () Bool)

(assert (=> d!63045 m!278507))

(declare-fun m!278509 () Bool)

(assert (=> d!63045 m!278509))

(declare-fun m!278511 () Bool)

(assert (=> b!262250 m!278511))

(declare-fun m!278513 () Bool)

(assert (=> b!262251 m!278513))

(assert (=> b!262033 d!63045))

(declare-fun b!262262 () Bool)

(declare-fun e!169950 () Bool)

(assert (=> b!262262 (= e!169950 (bvslt (size!6335 (_keys!7014 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!262260 () Bool)

(declare-fun res!128092 () Bool)

(assert (=> b!262260 (=> (not res!128092) (not e!169950))))

(assert (=> b!262260 (= res!128092 (not (validKeyInArray!0 (select (arr!5984 (_keys!7014 thiss!1504)) index!297))))))

(declare-fun b!262261 () Bool)

(declare-fun res!128093 () Bool)

(assert (=> b!262261 (=> (not res!128093) (not e!169950))))

(assert (=> b!262261 (= res!128093 (validKeyInArray!0 key!932))))

(declare-fun b!262263 () Bool)

(declare-fun e!169949 () Bool)

(assert (=> b!262263 (= e!169949 (= (arrayCountValidKeys!0 (array!12644 (store (arr!5984 (_keys!7014 thiss!1504)) index!297 key!932) (size!6335 (_keys!7014 thiss!1504))) #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7014 thiss!1504) #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!63047 () Bool)

(assert (=> d!63047 e!169949))

(declare-fun res!128094 () Bool)

(assert (=> d!63047 (=> (not res!128094) (not e!169949))))

(assert (=> d!63047 (= res!128094 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6335 (_keys!7014 thiss!1504)))))))

(declare-fun lt!132593 () Unit!8134)

(declare-fun choose!1 (array!12643 (_ BitVec 32) (_ BitVec 64)) Unit!8134)

(assert (=> d!63047 (= lt!132593 (choose!1 (_keys!7014 thiss!1504) index!297 key!932))))

(assert (=> d!63047 e!169950))

(declare-fun res!128095 () Bool)

(assert (=> d!63047 (=> (not res!128095) (not e!169950))))

(assert (=> d!63047 (= res!128095 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6335 (_keys!7014 thiss!1504)))))))

(assert (=> d!63047 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7014 thiss!1504) index!297 key!932) lt!132593)))

(assert (= (and d!63047 res!128095) b!262260))

(assert (= (and b!262260 res!128092) b!262261))

(assert (= (and b!262261 res!128093) b!262262))

(assert (= (and d!63047 res!128094) b!262263))

(declare-fun m!278515 () Bool)

(assert (=> b!262260 m!278515))

(assert (=> b!262260 m!278515))

(declare-fun m!278517 () Bool)

(assert (=> b!262260 m!278517))

(declare-fun m!278519 () Bool)

(assert (=> b!262261 m!278519))

(assert (=> b!262263 m!278293))

(declare-fun m!278521 () Bool)

(assert (=> b!262263 m!278521))

(assert (=> b!262263 m!278279))

(declare-fun m!278523 () Bool)

(assert (=> d!63047 m!278523))

(assert (=> b!262033 d!63047))

(declare-fun d!63049 () Bool)

(assert (=> d!63049 (= (arrayCountValidKeys!0 lt!132402 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!132596 () Unit!8134)

(declare-fun choose!2 (array!12643 (_ BitVec 32)) Unit!8134)

(assert (=> d!63049 (= lt!132596 (choose!2 lt!132402 index!297))))

(declare-fun e!169953 () Bool)

(assert (=> d!63049 e!169953))

(declare-fun res!128100 () Bool)

(assert (=> d!63049 (=> (not res!128100) (not e!169953))))

(assert (=> d!63049 (= res!128100 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6335 lt!132402))))))

(assert (=> d!63049 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132402 index!297) lt!132596)))

(declare-fun b!262268 () Bool)

(declare-fun res!128101 () Bool)

(assert (=> b!262268 (=> (not res!128101) (not e!169953))))

(assert (=> b!262268 (= res!128101 (validKeyInArray!0 (select (arr!5984 lt!132402) index!297)))))

(declare-fun b!262269 () Bool)

(assert (=> b!262269 (= e!169953 (bvslt (size!6335 lt!132402) #b01111111111111111111111111111111))))

(assert (= (and d!63049 res!128100) b!262268))

(assert (= (and b!262268 res!128101) b!262269))

(declare-fun m!278525 () Bool)

(assert (=> d!63049 m!278525))

(declare-fun m!278527 () Bool)

(assert (=> d!63049 m!278527))

(declare-fun m!278529 () Bool)

(assert (=> b!262268 m!278529))

(assert (=> b!262268 m!278529))

(declare-fun m!278531 () Bool)

(assert (=> b!262268 m!278531))

(assert (=> b!262033 d!63049))

(declare-fun b!262278 () Bool)

(declare-fun e!169960 () Bool)

(declare-fun call!25043 () Bool)

(assert (=> b!262278 (= e!169960 call!25043)))

(declare-fun b!262279 () Bool)

(declare-fun e!169961 () Bool)

(assert (=> b!262279 (= e!169961 e!169960)))

(declare-fun lt!132604 () (_ BitVec 64))

(assert (=> b!262279 (= lt!132604 (select (arr!5984 lt!132402) #b00000000000000000000000000000000))))

(declare-fun lt!132603 () Unit!8134)

(assert (=> b!262279 (= lt!132603 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132402 lt!132604 #b00000000000000000000000000000000))))

(assert (=> b!262279 (arrayContainsKey!0 lt!132402 lt!132604 #b00000000000000000000000000000000)))

(declare-fun lt!132605 () Unit!8134)

(assert (=> b!262279 (= lt!132605 lt!132603)))

(declare-fun res!128107 () Bool)

(assert (=> b!262279 (= res!128107 (= (seekEntryOrOpen!0 (select (arr!5984 lt!132402) #b00000000000000000000000000000000) lt!132402 (mask!11178 thiss!1504)) (Found!1159 #b00000000000000000000000000000000)))))

(assert (=> b!262279 (=> (not res!128107) (not e!169960))))

(declare-fun b!262280 () Bool)

(assert (=> b!262280 (= e!169961 call!25043)))

(declare-fun bm!25040 () Bool)

(assert (=> bm!25040 (= call!25043 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!132402 (mask!11178 thiss!1504)))))

(declare-fun b!262281 () Bool)

(declare-fun e!169962 () Bool)

(assert (=> b!262281 (= e!169962 e!169961)))

(declare-fun c!44691 () Bool)

(assert (=> b!262281 (= c!44691 (validKeyInArray!0 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)))))

(declare-fun d!63051 () Bool)

(declare-fun res!128106 () Bool)

(assert (=> d!63051 (=> res!128106 e!169962)))

(assert (=> d!63051 (= res!128106 (bvsge #b00000000000000000000000000000000 (size!6335 lt!132402)))))

(assert (=> d!63051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132402 (mask!11178 thiss!1504)) e!169962)))

(assert (= (and d!63051 (not res!128106)) b!262281))

(assert (= (and b!262281 c!44691) b!262279))

(assert (= (and b!262281 (not c!44691)) b!262280))

(assert (= (and b!262279 res!128107) b!262278))

(assert (= (or b!262278 b!262280) bm!25040))

(assert (=> b!262279 m!278499))

(declare-fun m!278533 () Bool)

(assert (=> b!262279 m!278533))

(declare-fun m!278535 () Bool)

(assert (=> b!262279 m!278535))

(assert (=> b!262279 m!278499))

(declare-fun m!278537 () Bool)

(assert (=> b!262279 m!278537))

(declare-fun m!278539 () Bool)

(assert (=> bm!25040 m!278539))

(assert (=> b!262281 m!278499))

(assert (=> b!262281 m!278499))

(assert (=> b!262281 m!278501))

(assert (=> b!262033 d!63051))

(declare-fun b!262282 () Bool)

(declare-fun e!169964 () (_ BitVec 32))

(declare-fun call!25044 () (_ BitVec 32))

(assert (=> b!262282 (= e!169964 call!25044)))

(declare-fun b!262283 () Bool)

(assert (=> b!262283 (= e!169964 (bvadd #b00000000000000000000000000000001 call!25044))))

(declare-fun bm!25041 () Bool)

(assert (=> bm!25041 (= call!25044 (arrayCountValidKeys!0 (_keys!7014 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun b!262285 () Bool)

(declare-fun e!169963 () (_ BitVec 32))

(assert (=> b!262285 (= e!169963 #b00000000000000000000000000000000)))

(declare-fun d!63053 () Bool)

(declare-fun lt!132606 () (_ BitVec 32))

(assert (=> d!63053 (and (bvsge lt!132606 #b00000000000000000000000000000000) (bvsle lt!132606 (bvsub (size!6335 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63053 (= lt!132606 e!169963)))

(declare-fun c!44692 () Bool)

(assert (=> d!63053 (= c!44692 (bvsge #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))))))

(assert (=> d!63053 (and (bvsle #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6335 (_keys!7014 thiss!1504)) (size!6335 (_keys!7014 thiss!1504))))))

(assert (=> d!63053 (= (arrayCountValidKeys!0 (_keys!7014 thiss!1504) #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) lt!132606)))

(declare-fun b!262284 () Bool)

(assert (=> b!262284 (= e!169963 e!169964)))

(declare-fun c!44693 () Bool)

(assert (=> b!262284 (= c!44693 (validKeyInArray!0 (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63053 c!44692) b!262285))

(assert (= (and d!63053 (not c!44692)) b!262284))

(assert (= (and b!262284 c!44693) b!262283))

(assert (= (and b!262284 (not c!44693)) b!262282))

(assert (= (or b!262283 b!262282) bm!25041))

(declare-fun m!278541 () Bool)

(assert (=> bm!25041 m!278541))

(assert (=> b!262284 m!278447))

(assert (=> b!262284 m!278447))

(assert (=> b!262284 m!278451))

(assert (=> b!262033 d!63053))

(declare-fun d!63055 () Bool)

(declare-fun e!169967 () Bool)

(assert (=> d!63055 e!169967))

(declare-fun res!128110 () Bool)

(assert (=> d!63055 (=> (not res!128110) (not e!169967))))

(assert (=> d!63055 (= res!128110 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6335 (_keys!7014 thiss!1504))) (bvslt index!297 (size!6334 (_values!4809 thiss!1504)))))))

(declare-fun lt!132609 () Unit!8134)

(declare-fun choose!1287 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) (_ BitVec 64) V!8505 Int) Unit!8134)

(assert (=> d!63055 (= lt!132609 (choose!1287 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) index!297 key!932 v!346 (defaultEntry!4826 thiss!1504)))))

(assert (=> d!63055 (validMask!0 (mask!11178 thiss!1504))))

(assert (=> d!63055 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!122 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) index!297 key!932 v!346 (defaultEntry!4826 thiss!1504)) lt!132609)))

(declare-fun b!262288 () Bool)

(assert (=> b!262288 (= e!169967 (= (+!707 (getCurrentListMap!1443 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) (tuple2!4877 key!932 v!346)) (getCurrentListMap!1443 (array!12644 (store (arr!5984 (_keys!7014 thiss!1504)) index!297 key!932) (size!6335 (_keys!7014 thiss!1504))) (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504))))))

(assert (= (and d!63055 res!128110) b!262288))

(declare-fun m!278543 () Bool)

(assert (=> d!63055 m!278543))

(assert (=> d!63055 m!278263))

(assert (=> b!262288 m!278269))

(assert (=> b!262288 m!278293))

(declare-fun m!278545 () Bool)

(assert (=> b!262288 m!278545))

(assert (=> b!262288 m!278261))

(declare-fun m!278547 () Bool)

(assert (=> b!262288 m!278547))

(assert (=> b!262288 m!278261))

(assert (=> b!262033 d!63055))

(declare-fun d!63057 () Bool)

(assert (=> d!63057 (= (validMask!0 (mask!11178 thiss!1504)) (and (or (= (mask!11178 thiss!1504) #b00000000000000000000000000000111) (= (mask!11178 thiss!1504) #b00000000000000000000000000001111) (= (mask!11178 thiss!1504) #b00000000000000000000000000011111) (= (mask!11178 thiss!1504) #b00000000000000000000000000111111) (= (mask!11178 thiss!1504) #b00000000000000000000000001111111) (= (mask!11178 thiss!1504) #b00000000000000000000000011111111) (= (mask!11178 thiss!1504) #b00000000000000000000000111111111) (= (mask!11178 thiss!1504) #b00000000000000000000001111111111) (= (mask!11178 thiss!1504) #b00000000000000000000011111111111) (= (mask!11178 thiss!1504) #b00000000000000000000111111111111) (= (mask!11178 thiss!1504) #b00000000000000000001111111111111) (= (mask!11178 thiss!1504) #b00000000000000000011111111111111) (= (mask!11178 thiss!1504) #b00000000000000000111111111111111) (= (mask!11178 thiss!1504) #b00000000000000001111111111111111) (= (mask!11178 thiss!1504) #b00000000000000011111111111111111) (= (mask!11178 thiss!1504) #b00000000000000111111111111111111) (= (mask!11178 thiss!1504) #b00000000000001111111111111111111) (= (mask!11178 thiss!1504) #b00000000000011111111111111111111) (= (mask!11178 thiss!1504) #b00000000000111111111111111111111) (= (mask!11178 thiss!1504) #b00000000001111111111111111111111) (= (mask!11178 thiss!1504) #b00000000011111111111111111111111) (= (mask!11178 thiss!1504) #b00000000111111111111111111111111) (= (mask!11178 thiss!1504) #b00000001111111111111111111111111) (= (mask!11178 thiss!1504) #b00000011111111111111111111111111) (= (mask!11178 thiss!1504) #b00000111111111111111111111111111) (= (mask!11178 thiss!1504) #b00001111111111111111111111111111) (= (mask!11178 thiss!1504) #b00011111111111111111111111111111) (= (mask!11178 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11178 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!262033 d!63057))

(declare-fun d!63059 () Bool)

(assert (=> d!63059 (arrayContainsKey!0 lt!132402 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132612 () Unit!8134)

(declare-fun choose!13 (array!12643 (_ BitVec 64) (_ BitVec 32)) Unit!8134)

(assert (=> d!63059 (= lt!132612 (choose!13 lt!132402 key!932 index!297))))

(assert (=> d!63059 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!63059 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132402 key!932 index!297) lt!132612)))

(declare-fun bs!9256 () Bool)

(assert (= bs!9256 d!63059))

(assert (=> bs!9256 m!278291))

(declare-fun m!278549 () Bool)

(assert (=> bs!9256 m!278549))

(assert (=> b!262033 d!63059))

(declare-fun b!262289 () Bool)

(declare-fun e!169969 () (_ BitVec 32))

(declare-fun call!25045 () (_ BitVec 32))

(assert (=> b!262289 (= e!169969 call!25045)))

(declare-fun b!262290 () Bool)

(assert (=> b!262290 (= e!169969 (bvadd #b00000000000000000000000000000001 call!25045))))

(declare-fun bm!25042 () Bool)

(assert (=> bm!25042 (= call!25045 (arrayCountValidKeys!0 lt!132402 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!262292 () Bool)

(declare-fun e!169968 () (_ BitVec 32))

(assert (=> b!262292 (= e!169968 #b00000000000000000000000000000000)))

(declare-fun d!63061 () Bool)

(declare-fun lt!132613 () (_ BitVec 32))

(assert (=> d!63061 (and (bvsge lt!132613 #b00000000000000000000000000000000) (bvsle lt!132613 (bvsub (size!6335 lt!132402) index!297)))))

(assert (=> d!63061 (= lt!132613 e!169968)))

(declare-fun c!44694 () Bool)

(assert (=> d!63061 (= c!44694 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63061 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6335 lt!132402)))))

(assert (=> d!63061 (= (arrayCountValidKeys!0 lt!132402 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!132613)))

(declare-fun b!262291 () Bool)

(assert (=> b!262291 (= e!169968 e!169969)))

(declare-fun c!44695 () Bool)

(assert (=> b!262291 (= c!44695 (validKeyInArray!0 (select (arr!5984 lt!132402) index!297)))))

(assert (= (and d!63061 c!44694) b!262292))

(assert (= (and d!63061 (not c!44694)) b!262291))

(assert (= (and b!262291 c!44695) b!262290))

(assert (= (and b!262291 (not c!44695)) b!262289))

(assert (= (or b!262290 b!262289) bm!25042))

(declare-fun m!278551 () Bool)

(assert (=> bm!25042 m!278551))

(assert (=> b!262291 m!278529))

(assert (=> b!262291 m!278529))

(assert (=> b!262291 m!278531))

(assert (=> b!262033 d!63061))

(declare-fun d!63063 () Bool)

(declare-fun res!128115 () Bool)

(declare-fun e!169974 () Bool)

(assert (=> d!63063 (=> res!128115 e!169974)))

(assert (=> d!63063 (= res!128115 (= (select (arr!5984 lt!132402) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63063 (= (arrayContainsKey!0 lt!132402 key!932 #b00000000000000000000000000000000) e!169974)))

(declare-fun b!262297 () Bool)

(declare-fun e!169975 () Bool)

(assert (=> b!262297 (= e!169974 e!169975)))

(declare-fun res!128116 () Bool)

(assert (=> b!262297 (=> (not res!128116) (not e!169975))))

(assert (=> b!262297 (= res!128116 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6335 lt!132402)))))

(declare-fun b!262298 () Bool)

(assert (=> b!262298 (= e!169975 (arrayContainsKey!0 lt!132402 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63063 (not res!128115)) b!262297))

(assert (= (and b!262297 res!128116) b!262298))

(assert (=> d!63063 m!278499))

(declare-fun m!278553 () Bool)

(assert (=> b!262298 m!278553))

(assert (=> b!262033 d!63063))

(declare-fun lt!132614 () ListLongMap!3791)

(declare-fun e!169978 () Bool)

(declare-fun b!262299 () Bool)

(assert (=> b!262299 (= e!169978 (= (apply!260 lt!132614 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)) (get!3093 (select (arr!5983 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!603 (defaultEntry!4826 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6334 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))))))))

(assert (=> b!262299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6335 lt!132402)))))

(declare-fun b!262300 () Bool)

(declare-fun e!169982 () ListLongMap!3791)

(declare-fun call!25047 () ListLongMap!3791)

(assert (=> b!262300 (= e!169982 call!25047)))

(declare-fun b!262301 () Bool)

(declare-fun e!169980 () Bool)

(assert (=> b!262301 (= e!169980 (= (apply!260 lt!132614 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4667 thiss!1504)))))

(declare-fun b!262302 () Bool)

(declare-fun e!169986 () Bool)

(assert (=> b!262302 (= e!169986 (validKeyInArray!0 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)))))

(declare-fun b!262303 () Bool)

(declare-fun e!169985 () ListLongMap!3791)

(declare-fun call!25052 () ListLongMap!3791)

(assert (=> b!262303 (= e!169985 call!25052)))

(declare-fun b!262304 () Bool)

(declare-fun e!169988 () Bool)

(declare-fun call!25049 () Bool)

(assert (=> b!262304 (= e!169988 (not call!25049))))

(declare-fun b!262305 () Bool)

(declare-fun res!128117 () Bool)

(declare-fun e!169987 () Bool)

(assert (=> b!262305 (=> (not res!128117) (not e!169987))))

(assert (=> b!262305 (= res!128117 e!169988)))

(declare-fun c!44697 () Bool)

(assert (=> b!262305 (= c!44697 (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262306 () Bool)

(declare-fun e!169979 () Bool)

(declare-fun call!25050 () Bool)

(assert (=> b!262306 (= e!169979 (not call!25050))))

(declare-fun call!25051 () ListLongMap!3791)

(declare-fun bm!25043 () Bool)

(assert (=> bm!25043 (= call!25051 (getCurrentListMapNoExtraKeys!576 lt!132402 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun call!25048 () ListLongMap!3791)

(declare-fun c!44696 () Bool)

(declare-fun call!25046 () ListLongMap!3791)

(declare-fun c!44699 () Bool)

(declare-fun bm!25044 () Bool)

(assert (=> bm!25044 (= call!25048 (+!707 (ite c!44696 call!25051 (ite c!44699 call!25046 call!25052)) (ite (or c!44696 c!44699) (tuple2!4877 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4667 thiss!1504)) (tuple2!4877 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4667 thiss!1504)))))))

(declare-fun b!262308 () Bool)

(declare-fun e!169983 () Bool)

(assert (=> b!262308 (= e!169983 (= (apply!260 lt!132614 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4667 thiss!1504)))))

(declare-fun bm!25045 () Bool)

(assert (=> bm!25045 (= call!25050 (contains!1877 lt!132614 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262309 () Bool)

(assert (=> b!262309 (= e!169979 e!169983)))

(declare-fun res!128120 () Bool)

(assert (=> b!262309 (= res!128120 call!25050)))

(assert (=> b!262309 (=> (not res!128120) (not e!169983))))

(declare-fun bm!25046 () Bool)

(assert (=> bm!25046 (= call!25049 (contains!1877 lt!132614 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262310 () Bool)

(declare-fun e!169984 () Bool)

(assert (=> b!262310 (= e!169984 (validKeyInArray!0 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)))))

(declare-fun bm!25047 () Bool)

(assert (=> bm!25047 (= call!25052 call!25046)))

(declare-fun d!63065 () Bool)

(assert (=> d!63065 e!169987))

(declare-fun res!128121 () Bool)

(assert (=> d!63065 (=> (not res!128121) (not e!169987))))

(assert (=> d!63065 (= res!128121 (or (bvsge #b00000000000000000000000000000000 (size!6335 lt!132402)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6335 lt!132402)))))))

(declare-fun lt!132628 () ListLongMap!3791)

(assert (=> d!63065 (= lt!132614 lt!132628)))

(declare-fun lt!132622 () Unit!8134)

(declare-fun e!169976 () Unit!8134)

(assert (=> d!63065 (= lt!132622 e!169976)))

(declare-fun c!44700 () Bool)

(assert (=> d!63065 (= c!44700 e!169984)))

(declare-fun res!128118 () Bool)

(assert (=> d!63065 (=> (not res!128118) (not e!169984))))

(assert (=> d!63065 (= res!128118 (bvslt #b00000000000000000000000000000000 (size!6335 lt!132402)))))

(declare-fun e!169981 () ListLongMap!3791)

(assert (=> d!63065 (= lt!132628 e!169981)))

(assert (=> d!63065 (= c!44696 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63065 (validMask!0 (mask!11178 thiss!1504))))

(assert (=> d!63065 (= (getCurrentListMap!1443 lt!132402 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) lt!132614)))

(declare-fun b!262307 () Bool)

(assert (=> b!262307 (= e!169988 e!169980)))

(declare-fun res!128124 () Bool)

(assert (=> b!262307 (= res!128124 call!25049)))

(assert (=> b!262307 (=> (not res!128124) (not e!169980))))

(declare-fun b!262311 () Bool)

(declare-fun c!44698 () Bool)

(assert (=> b!262311 (= c!44698 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262311 (= e!169982 e!169985)))

(declare-fun b!262312 () Bool)

(declare-fun e!169977 () Bool)

(assert (=> b!262312 (= e!169977 e!169978)))

(declare-fun res!128123 () Bool)

(assert (=> b!262312 (=> (not res!128123) (not e!169978))))

(assert (=> b!262312 (= res!128123 (contains!1877 lt!132614 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)))))

(assert (=> b!262312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6335 lt!132402)))))

(declare-fun b!262313 () Bool)

(declare-fun lt!132621 () Unit!8134)

(assert (=> b!262313 (= e!169976 lt!132621)))

(declare-fun lt!132624 () ListLongMap!3791)

(assert (=> b!262313 (= lt!132624 (getCurrentListMapNoExtraKeys!576 lt!132402 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132618 () (_ BitVec 64))

(assert (=> b!262313 (= lt!132618 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132616 () (_ BitVec 64))

(assert (=> b!262313 (= lt!132616 (select (arr!5984 lt!132402) #b00000000000000000000000000000000))))

(declare-fun lt!132617 () Unit!8134)

(assert (=> b!262313 (= lt!132617 (addStillContains!236 lt!132624 lt!132618 (zeroValue!4667 thiss!1504) lt!132616))))

(assert (=> b!262313 (contains!1877 (+!707 lt!132624 (tuple2!4877 lt!132618 (zeroValue!4667 thiss!1504))) lt!132616)))

(declare-fun lt!132629 () Unit!8134)

(assert (=> b!262313 (= lt!132629 lt!132617)))

(declare-fun lt!132626 () ListLongMap!3791)

(assert (=> b!262313 (= lt!132626 (getCurrentListMapNoExtraKeys!576 lt!132402 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132633 () (_ BitVec 64))

(assert (=> b!262313 (= lt!132633 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132615 () (_ BitVec 64))

(assert (=> b!262313 (= lt!132615 (select (arr!5984 lt!132402) #b00000000000000000000000000000000))))

(declare-fun lt!132634 () Unit!8134)

(assert (=> b!262313 (= lt!132634 (addApplyDifferent!236 lt!132626 lt!132633 (minValue!4667 thiss!1504) lt!132615))))

(assert (=> b!262313 (= (apply!260 (+!707 lt!132626 (tuple2!4877 lt!132633 (minValue!4667 thiss!1504))) lt!132615) (apply!260 lt!132626 lt!132615))))

(declare-fun lt!132620 () Unit!8134)

(assert (=> b!262313 (= lt!132620 lt!132634)))

(declare-fun lt!132625 () ListLongMap!3791)

(assert (=> b!262313 (= lt!132625 (getCurrentListMapNoExtraKeys!576 lt!132402 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132619 () (_ BitVec 64))

(assert (=> b!262313 (= lt!132619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132631 () (_ BitVec 64))

(assert (=> b!262313 (= lt!132631 (select (arr!5984 lt!132402) #b00000000000000000000000000000000))))

(declare-fun lt!132630 () Unit!8134)

(assert (=> b!262313 (= lt!132630 (addApplyDifferent!236 lt!132625 lt!132619 (zeroValue!4667 thiss!1504) lt!132631))))

(assert (=> b!262313 (= (apply!260 (+!707 lt!132625 (tuple2!4877 lt!132619 (zeroValue!4667 thiss!1504))) lt!132631) (apply!260 lt!132625 lt!132631))))

(declare-fun lt!132627 () Unit!8134)

(assert (=> b!262313 (= lt!132627 lt!132630)))

(declare-fun lt!132635 () ListLongMap!3791)

(assert (=> b!262313 (= lt!132635 (getCurrentListMapNoExtraKeys!576 lt!132402 (array!12642 (store (arr!5983 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6334 (_values!4809 thiss!1504))) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132632 () (_ BitVec 64))

(assert (=> b!262313 (= lt!132632 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132623 () (_ BitVec 64))

(assert (=> b!262313 (= lt!132623 (select (arr!5984 lt!132402) #b00000000000000000000000000000000))))

(assert (=> b!262313 (= lt!132621 (addApplyDifferent!236 lt!132635 lt!132632 (minValue!4667 thiss!1504) lt!132623))))

(assert (=> b!262313 (= (apply!260 (+!707 lt!132635 (tuple2!4877 lt!132632 (minValue!4667 thiss!1504))) lt!132623) (apply!260 lt!132635 lt!132623))))

(declare-fun bm!25048 () Bool)

(assert (=> bm!25048 (= call!25046 call!25051)))

(declare-fun b!262314 () Bool)

(declare-fun res!128125 () Bool)

(assert (=> b!262314 (=> (not res!128125) (not e!169987))))

(assert (=> b!262314 (= res!128125 e!169977)))

(declare-fun res!128119 () Bool)

(assert (=> b!262314 (=> res!128119 e!169977)))

(assert (=> b!262314 (= res!128119 (not e!169986))))

(declare-fun res!128122 () Bool)

(assert (=> b!262314 (=> (not res!128122) (not e!169986))))

(assert (=> b!262314 (= res!128122 (bvslt #b00000000000000000000000000000000 (size!6335 lt!132402)))))

(declare-fun b!262315 () Bool)

(declare-fun Unit!8146 () Unit!8134)

(assert (=> b!262315 (= e!169976 Unit!8146)))

(declare-fun b!262316 () Bool)

(assert (=> b!262316 (= e!169987 e!169979)))

(declare-fun c!44701 () Bool)

(assert (=> b!262316 (= c!44701 (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25049 () Bool)

(assert (=> bm!25049 (= call!25047 call!25048)))

(declare-fun b!262317 () Bool)

(assert (=> b!262317 (= e!169985 call!25047)))

(declare-fun b!262318 () Bool)

(assert (=> b!262318 (= e!169981 (+!707 call!25048 (tuple2!4877 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4667 thiss!1504))))))

(declare-fun b!262319 () Bool)

(assert (=> b!262319 (= e!169981 e!169982)))

(assert (=> b!262319 (= c!44699 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!63065 c!44696) b!262318))

(assert (= (and d!63065 (not c!44696)) b!262319))

(assert (= (and b!262319 c!44699) b!262300))

(assert (= (and b!262319 (not c!44699)) b!262311))

(assert (= (and b!262311 c!44698) b!262317))

(assert (= (and b!262311 (not c!44698)) b!262303))

(assert (= (or b!262317 b!262303) bm!25047))

(assert (= (or b!262300 bm!25047) bm!25048))

(assert (= (or b!262300 b!262317) bm!25049))

(assert (= (or b!262318 bm!25048) bm!25043))

(assert (= (or b!262318 bm!25049) bm!25044))

(assert (= (and d!63065 res!128118) b!262310))

(assert (= (and d!63065 c!44700) b!262313))

(assert (= (and d!63065 (not c!44700)) b!262315))

(assert (= (and d!63065 res!128121) b!262314))

(assert (= (and b!262314 res!128122) b!262302))

(assert (= (and b!262314 (not res!128119)) b!262312))

(assert (= (and b!262312 res!128123) b!262299))

(assert (= (and b!262314 res!128125) b!262305))

(assert (= (and b!262305 c!44697) b!262307))

(assert (= (and b!262305 (not c!44697)) b!262304))

(assert (= (and b!262307 res!128124) b!262301))

(assert (= (or b!262307 b!262304) bm!25046))

(assert (= (and b!262305 res!128117) b!262316))

(assert (= (and b!262316 c!44701) b!262309))

(assert (= (and b!262316 (not c!44701)) b!262306))

(assert (= (and b!262309 res!128120) b!262308))

(assert (= (or b!262309 b!262306) bm!25045))

(declare-fun b_lambda!8339 () Bool)

(assert (=> (not b_lambda!8339) (not b!262299)))

(assert (=> b!262299 t!8823))

(declare-fun b_and!13937 () Bool)

(assert (= b_and!13935 (and (=> t!8823 result!5413) b_and!13937)))

(declare-fun m!278555 () Bool)

(assert (=> bm!25044 m!278555))

(declare-fun m!278557 () Bool)

(assert (=> bm!25045 m!278557))

(declare-fun m!278559 () Bool)

(assert (=> b!262318 m!278559))

(declare-fun m!278561 () Bool)

(assert (=> b!262308 m!278561))

(assert (=> b!262312 m!278499))

(assert (=> b!262312 m!278499))

(declare-fun m!278563 () Bool)

(assert (=> b!262312 m!278563))

(assert (=> b!262302 m!278499))

(assert (=> b!262302 m!278499))

(assert (=> b!262302 m!278501))

(declare-fun m!278565 () Bool)

(assert (=> b!262301 m!278565))

(declare-fun m!278567 () Bool)

(assert (=> bm!25046 m!278567))

(assert (=> d!63065 m!278263))

(declare-fun m!278569 () Bool)

(assert (=> b!262313 m!278569))

(declare-fun m!278571 () Bool)

(assert (=> b!262313 m!278571))

(declare-fun m!278573 () Bool)

(assert (=> b!262313 m!278573))

(declare-fun m!278575 () Bool)

(assert (=> b!262313 m!278575))

(declare-fun m!278577 () Bool)

(assert (=> b!262313 m!278577))

(declare-fun m!278579 () Bool)

(assert (=> b!262313 m!278579))

(declare-fun m!278581 () Bool)

(assert (=> b!262313 m!278581))

(declare-fun m!278583 () Bool)

(assert (=> b!262313 m!278583))

(assert (=> b!262313 m!278499))

(declare-fun m!278585 () Bool)

(assert (=> b!262313 m!278585))

(assert (=> b!262313 m!278573))

(declare-fun m!278587 () Bool)

(assert (=> b!262313 m!278587))

(assert (=> b!262313 m!278569))

(declare-fun m!278589 () Bool)

(assert (=> b!262313 m!278589))

(assert (=> b!262313 m!278581))

(declare-fun m!278591 () Bool)

(assert (=> b!262313 m!278591))

(declare-fun m!278593 () Bool)

(assert (=> b!262313 m!278593))

(declare-fun m!278595 () Bool)

(assert (=> b!262313 m!278595))

(declare-fun m!278597 () Bool)

(assert (=> b!262313 m!278597))

(declare-fun m!278599 () Bool)

(assert (=> b!262313 m!278599))

(assert (=> b!262313 m!278597))

(assert (=> b!262310 m!278499))

(assert (=> b!262310 m!278499))

(assert (=> b!262310 m!278501))

(declare-fun m!278601 () Bool)

(assert (=> b!262299 m!278601))

(assert (=> b!262299 m!278491))

(declare-fun m!278603 () Bool)

(assert (=> b!262299 m!278603))

(assert (=> b!262299 m!278499))

(declare-fun m!278605 () Bool)

(assert (=> b!262299 m!278605))

(assert (=> b!262299 m!278601))

(assert (=> b!262299 m!278491))

(assert (=> b!262299 m!278499))

(assert (=> bm!25043 m!278595))

(assert (=> b!262033 d!63065))

(declare-fun d!63067 () Bool)

(declare-fun e!169991 () Bool)

(assert (=> d!63067 e!169991))

(declare-fun res!128128 () Bool)

(assert (=> d!63067 (=> (not res!128128) (not e!169991))))

(assert (=> d!63067 (= res!128128 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6335 (_keys!7014 thiss!1504)))))))

(declare-fun lt!132638 () Unit!8134)

(declare-fun choose!41 (array!12643 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3754) Unit!8134)

(assert (=> d!63067 (= lt!132638 (choose!41 (_keys!7014 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3751))))

(assert (=> d!63067 (bvslt (size!6335 (_keys!7014 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!63067 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7014 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3751) lt!132638)))

(declare-fun b!262322 () Bool)

(assert (=> b!262322 (= e!169991 (arrayNoDuplicates!0 (array!12644 (store (arr!5984 (_keys!7014 thiss!1504)) index!297 key!932) (size!6335 (_keys!7014 thiss!1504))) #b00000000000000000000000000000000 Nil!3751))))

(assert (= (and d!63067 res!128128) b!262322))

(declare-fun m!278607 () Bool)

(assert (=> d!63067 m!278607))

(assert (=> b!262322 m!278293))

(declare-fun m!278609 () Bool)

(assert (=> b!262322 m!278609))

(assert (=> b!262033 d!63067))

(declare-fun b!262333 () Bool)

(declare-fun e!170000 () Bool)

(declare-fun e!170002 () Bool)

(assert (=> b!262333 (= e!170000 e!170002)))

(declare-fun res!128135 () Bool)

(assert (=> b!262333 (=> (not res!128135) (not e!170002))))

(declare-fun e!170003 () Bool)

(assert (=> b!262333 (= res!128135 (not e!170003))))

(declare-fun res!128137 () Bool)

(assert (=> b!262333 (=> (not res!128137) (not e!170003))))

(assert (=> b!262333 (= res!128137 (validKeyInArray!0 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)))))

(declare-fun b!262334 () Bool)

(declare-fun e!170001 () Bool)

(assert (=> b!262334 (= e!170002 e!170001)))

(declare-fun c!44704 () Bool)

(assert (=> b!262334 (= c!44704 (validKeyInArray!0 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)))))

(declare-fun b!262335 () Bool)

(declare-fun contains!1880 (List!3754 (_ BitVec 64)) Bool)

(assert (=> b!262335 (= e!170003 (contains!1880 Nil!3751 (select (arr!5984 lt!132402) #b00000000000000000000000000000000)))))

(declare-fun b!262336 () Bool)

(declare-fun call!25055 () Bool)

(assert (=> b!262336 (= e!170001 call!25055)))

(declare-fun d!63069 () Bool)

(declare-fun res!128136 () Bool)

(assert (=> d!63069 (=> res!128136 e!170000)))

(assert (=> d!63069 (= res!128136 (bvsge #b00000000000000000000000000000000 (size!6335 lt!132402)))))

(assert (=> d!63069 (= (arrayNoDuplicates!0 lt!132402 #b00000000000000000000000000000000 Nil!3751) e!170000)))

(declare-fun bm!25052 () Bool)

(assert (=> bm!25052 (= call!25055 (arrayNoDuplicates!0 lt!132402 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44704 (Cons!3750 (select (arr!5984 lt!132402) #b00000000000000000000000000000000) Nil!3751) Nil!3751)))))

(declare-fun b!262337 () Bool)

(assert (=> b!262337 (= e!170001 call!25055)))

(assert (= (and d!63069 (not res!128136)) b!262333))

(assert (= (and b!262333 res!128137) b!262335))

(assert (= (and b!262333 res!128135) b!262334))

(assert (= (and b!262334 c!44704) b!262336))

(assert (= (and b!262334 (not c!44704)) b!262337))

(assert (= (or b!262336 b!262337) bm!25052))

(assert (=> b!262333 m!278499))

(assert (=> b!262333 m!278499))

(assert (=> b!262333 m!278501))

(assert (=> b!262334 m!278499))

(assert (=> b!262334 m!278499))

(assert (=> b!262334 m!278501))

(assert (=> b!262335 m!278499))

(assert (=> b!262335 m!278499))

(declare-fun m!278611 () Bool)

(assert (=> b!262335 m!278611))

(assert (=> bm!25052 m!278499))

(declare-fun m!278613 () Bool)

(assert (=> bm!25052 m!278613))

(assert (=> b!262033 d!63069))

(declare-fun d!63071 () Bool)

(declare-fun res!128138 () Bool)

(declare-fun e!170004 () Bool)

(assert (=> d!63071 (=> res!128138 e!170004)))

(assert (=> d!63071 (= res!128138 (= (select (arr!5984 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63071 (= (arrayContainsKey!0 (_keys!7014 thiss!1504) key!932 #b00000000000000000000000000000000) e!170004)))

(declare-fun b!262338 () Bool)

(declare-fun e!170005 () Bool)

(assert (=> b!262338 (= e!170004 e!170005)))

(declare-fun res!128139 () Bool)

(assert (=> b!262338 (=> (not res!128139) (not e!170005))))

(assert (=> b!262338 (= res!128139 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun b!262339 () Bool)

(assert (=> b!262339 (= e!170005 (arrayContainsKey!0 (_keys!7014 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63071 (not res!128138)) b!262338))

(assert (= (and b!262338 res!128139) b!262339))

(assert (=> d!63071 m!278447))

(declare-fun m!278615 () Bool)

(assert (=> b!262339 m!278615))

(assert (=> b!262033 d!63071))

(declare-fun d!63073 () Bool)

(declare-fun e!170008 () Bool)

(assert (=> d!63073 e!170008))

(declare-fun res!128142 () Bool)

(assert (=> d!63073 (=> (not res!128142) (not e!170008))))

(assert (=> d!63073 (= res!128142 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6335 (_keys!7014 thiss!1504)))))))

(declare-fun lt!132641 () Unit!8134)

(declare-fun choose!102 ((_ BitVec 64) array!12643 (_ BitVec 32) (_ BitVec 32)) Unit!8134)

(assert (=> d!63073 (= lt!132641 (choose!102 key!932 (_keys!7014 thiss!1504) index!297 (mask!11178 thiss!1504)))))

(assert (=> d!63073 (validMask!0 (mask!11178 thiss!1504))))

(assert (=> d!63073 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7014 thiss!1504) index!297 (mask!11178 thiss!1504)) lt!132641)))

(declare-fun b!262342 () Bool)

(assert (=> b!262342 (= e!170008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12644 (store (arr!5984 (_keys!7014 thiss!1504)) index!297 key!932) (size!6335 (_keys!7014 thiss!1504))) (mask!11178 thiss!1504)))))

(assert (= (and d!63073 res!128142) b!262342))

(declare-fun m!278617 () Bool)

(assert (=> d!63073 m!278617))

(assert (=> d!63073 m!278263))

(assert (=> b!262342 m!278293))

(declare-fun m!278619 () Bool)

(assert (=> b!262342 m!278619))

(assert (=> b!262033 d!63073))

(assert (=> bm!25000 d!63071))

(declare-fun b!262359 () Bool)

(declare-fun e!170019 () Bool)

(declare-fun e!170017 () Bool)

(assert (=> b!262359 (= e!170019 e!170017)))

(declare-fun c!44710 () Bool)

(declare-fun lt!132647 () SeekEntryResult!1159)

(assert (=> b!262359 (= c!44710 ((_ is MissingVacant!1159) lt!132647))))

(declare-fun bm!25057 () Bool)

(declare-fun c!44709 () Bool)

(declare-fun call!25060 () Bool)

(assert (=> bm!25057 (= call!25060 (inRange!0 (ite c!44709 (index!6806 lt!132647) (index!6809 lt!132647)) (mask!11178 thiss!1504)))))

(declare-fun b!262360 () Bool)

(declare-fun e!170020 () Bool)

(declare-fun call!25061 () Bool)

(assert (=> b!262360 (= e!170020 (not call!25061))))

(declare-fun b!262361 () Bool)

(assert (=> b!262361 (= e!170017 ((_ is Undefined!1159) lt!132647))))

(declare-fun d!63075 () Bool)

(assert (=> d!63075 e!170019))

(assert (=> d!63075 (= c!44709 ((_ is MissingZero!1159) lt!132647))))

(assert (=> d!63075 (= lt!132647 (seekEntryOrOpen!0 key!932 (_keys!7014 thiss!1504) (mask!11178 thiss!1504)))))

(declare-fun lt!132646 () Unit!8134)

(declare-fun choose!1288 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8134)

(assert (=> d!63075 (= lt!132646 (choose!1288 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> d!63075 (validMask!0 (mask!11178 thiss!1504))))

(assert (=> d!63075 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!437 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)) lt!132646)))

(declare-fun b!262362 () Bool)

(assert (=> b!262362 (and (bvsge (index!6806 lt!132647) #b00000000000000000000000000000000) (bvslt (index!6806 lt!132647) (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun res!128152 () Bool)

(assert (=> b!262362 (= res!128152 (= (select (arr!5984 (_keys!7014 thiss!1504)) (index!6806 lt!132647)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170018 () Bool)

(assert (=> b!262362 (=> (not res!128152) (not e!170018))))

(declare-fun bm!25058 () Bool)

(assert (=> bm!25058 (= call!25061 (arrayContainsKey!0 (_keys!7014 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262363 () Bool)

(assert (=> b!262363 (= e!170018 (not call!25061))))

(declare-fun b!262364 () Bool)

(declare-fun res!128151 () Bool)

(assert (=> b!262364 (=> (not res!128151) (not e!170020))))

(assert (=> b!262364 (= res!128151 (= (select (arr!5984 (_keys!7014 thiss!1504)) (index!6809 lt!132647)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262364 (and (bvsge (index!6809 lt!132647) #b00000000000000000000000000000000) (bvslt (index!6809 lt!132647) (size!6335 (_keys!7014 thiss!1504))))))

(declare-fun b!262365 () Bool)

(assert (=> b!262365 (= e!170019 e!170018)))

(declare-fun res!128154 () Bool)

(assert (=> b!262365 (= res!128154 call!25060)))

(assert (=> b!262365 (=> (not res!128154) (not e!170018))))

(declare-fun b!262366 () Bool)

(declare-fun res!128153 () Bool)

(assert (=> b!262366 (=> (not res!128153) (not e!170020))))

(assert (=> b!262366 (= res!128153 call!25060)))

(assert (=> b!262366 (= e!170017 e!170020)))

(assert (= (and d!63075 c!44709) b!262365))

(assert (= (and d!63075 (not c!44709)) b!262359))

(assert (= (and b!262365 res!128154) b!262362))

(assert (= (and b!262362 res!128152) b!262363))

(assert (= (and b!262359 c!44710) b!262366))

(assert (= (and b!262359 (not c!44710)) b!262361))

(assert (= (and b!262366 res!128153) b!262364))

(assert (= (and b!262364 res!128151) b!262360))

(assert (= (or b!262365 b!262366) bm!25057))

(assert (= (or b!262363 b!262360) bm!25058))

(declare-fun m!278621 () Bool)

(assert (=> b!262362 m!278621))

(assert (=> bm!25058 m!278243))

(assert (=> d!63075 m!278301))

(declare-fun m!278623 () Bool)

(assert (=> d!63075 m!278623))

(assert (=> d!63075 m!278263))

(declare-fun m!278625 () Bool)

(assert (=> bm!25057 m!278625))

(declare-fun m!278627 () Bool)

(assert (=> b!262364 m!278627))

(assert (=> b!262023 d!63075))

(declare-fun d!63077 () Bool)

(declare-fun e!170023 () Bool)

(assert (=> d!63077 e!170023))

(declare-fun res!128159 () Bool)

(assert (=> d!63077 (=> (not res!128159) (not e!170023))))

(declare-fun lt!132652 () SeekEntryResult!1159)

(assert (=> d!63077 (= res!128159 ((_ is Found!1159) lt!132652))))

(assert (=> d!63077 (= lt!132652 (seekEntryOrOpen!0 key!932 (_keys!7014 thiss!1504) (mask!11178 thiss!1504)))))

(declare-fun lt!132653 () Unit!8134)

(declare-fun choose!1289 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8134)

(assert (=> d!63077 (= lt!132653 (choose!1289 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> d!63077 (validMask!0 (mask!11178 thiss!1504))))

(assert (=> d!63077 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!446 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)) lt!132653)))

(declare-fun b!262371 () Bool)

(declare-fun res!128160 () Bool)

(assert (=> b!262371 (=> (not res!128160) (not e!170023))))

(assert (=> b!262371 (= res!128160 (inRange!0 (index!6807 lt!132652) (mask!11178 thiss!1504)))))

(declare-fun b!262372 () Bool)

(assert (=> b!262372 (= e!170023 (= (select (arr!5984 (_keys!7014 thiss!1504)) (index!6807 lt!132652)) key!932))))

(assert (=> b!262372 (and (bvsge (index!6807 lt!132652) #b00000000000000000000000000000000) (bvslt (index!6807 lt!132652) (size!6335 (_keys!7014 thiss!1504))))))

(assert (= (and d!63077 res!128159) b!262371))

(assert (= (and b!262371 res!128160) b!262372))

(assert (=> d!63077 m!278301))

(declare-fun m!278629 () Bool)

(assert (=> d!63077 m!278629))

(assert (=> d!63077 m!278263))

(declare-fun m!278631 () Bool)

(assert (=> b!262371 m!278631))

(declare-fun m!278633 () Bool)

(assert (=> b!262372 m!278633))

(assert (=> b!262019 d!63077))

(declare-fun d!63079 () Bool)

(declare-fun res!128167 () Bool)

(declare-fun e!170026 () Bool)

(assert (=> d!63079 (=> (not res!128167) (not e!170026))))

(declare-fun simpleValid!283 (LongMapFixedSize!3856) Bool)

(assert (=> d!63079 (= res!128167 (simpleValid!283 thiss!1504))))

(assert (=> d!63079 (= (valid!1509 thiss!1504) e!170026)))

(declare-fun b!262379 () Bool)

(declare-fun res!128168 () Bool)

(assert (=> b!262379 (=> (not res!128168) (not e!170026))))

(assert (=> b!262379 (= res!128168 (= (arrayCountValidKeys!0 (_keys!7014 thiss!1504) #b00000000000000000000000000000000 (size!6335 (_keys!7014 thiss!1504))) (_size!1977 thiss!1504)))))

(declare-fun b!262380 () Bool)

(declare-fun res!128169 () Bool)

(assert (=> b!262380 (=> (not res!128169) (not e!170026))))

(assert (=> b!262380 (= res!128169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7014 thiss!1504) (mask!11178 thiss!1504)))))

(declare-fun b!262381 () Bool)

(assert (=> b!262381 (= e!170026 (arrayNoDuplicates!0 (_keys!7014 thiss!1504) #b00000000000000000000000000000000 Nil!3751))))

(assert (= (and d!63079 res!128167) b!262379))

(assert (= (and b!262379 res!128168) b!262380))

(assert (= (and b!262380 res!128169) b!262381))

(declare-fun m!278635 () Bool)

(assert (=> d!63079 m!278635))

(assert (=> b!262379 m!278279))

(declare-fun m!278637 () Bool)

(assert (=> b!262380 m!278637))

(declare-fun m!278639 () Bool)

(assert (=> b!262381 m!278639))

(assert (=> start!25138 d!63079))

(declare-fun d!63081 () Bool)

(assert (=> d!63081 (= (inRange!0 (ite c!44636 (index!6806 lt!132411) (index!6809 lt!132411)) (mask!11178 thiss!1504)) (and (bvsge (ite c!44636 (index!6806 lt!132411) (index!6809 lt!132411)) #b00000000000000000000000000000000) (bvslt (ite c!44636 (index!6806 lt!132411) (index!6809 lt!132411)) (bvadd (mask!11178 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25001 d!63081))

(declare-fun d!63083 () Bool)

(declare-fun lt!132660 () SeekEntryResult!1159)

(assert (=> d!63083 (and (or ((_ is Undefined!1159) lt!132660) (not ((_ is Found!1159) lt!132660)) (and (bvsge (index!6807 lt!132660) #b00000000000000000000000000000000) (bvslt (index!6807 lt!132660) (size!6335 (_keys!7014 thiss!1504))))) (or ((_ is Undefined!1159) lt!132660) ((_ is Found!1159) lt!132660) (not ((_ is MissingZero!1159) lt!132660)) (and (bvsge (index!6806 lt!132660) #b00000000000000000000000000000000) (bvslt (index!6806 lt!132660) (size!6335 (_keys!7014 thiss!1504))))) (or ((_ is Undefined!1159) lt!132660) ((_ is Found!1159) lt!132660) ((_ is MissingZero!1159) lt!132660) (not ((_ is MissingVacant!1159) lt!132660)) (and (bvsge (index!6809 lt!132660) #b00000000000000000000000000000000) (bvslt (index!6809 lt!132660) (size!6335 (_keys!7014 thiss!1504))))) (or ((_ is Undefined!1159) lt!132660) (ite ((_ is Found!1159) lt!132660) (= (select (arr!5984 (_keys!7014 thiss!1504)) (index!6807 lt!132660)) key!932) (ite ((_ is MissingZero!1159) lt!132660) (= (select (arr!5984 (_keys!7014 thiss!1504)) (index!6806 lt!132660)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1159) lt!132660) (= (select (arr!5984 (_keys!7014 thiss!1504)) (index!6809 lt!132660)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!170035 () SeekEntryResult!1159)

(assert (=> d!63083 (= lt!132660 e!170035)))

(declare-fun c!44717 () Bool)

(declare-fun lt!132661 () SeekEntryResult!1159)

(assert (=> d!63083 (= c!44717 (and ((_ is Intermediate!1159) lt!132661) (undefined!1971 lt!132661)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12643 (_ BitVec 32)) SeekEntryResult!1159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63083 (= lt!132661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11178 thiss!1504)) key!932 (_keys!7014 thiss!1504) (mask!11178 thiss!1504)))))

(assert (=> d!63083 (validMask!0 (mask!11178 thiss!1504))))

(assert (=> d!63083 (= (seekEntryOrOpen!0 key!932 (_keys!7014 thiss!1504) (mask!11178 thiss!1504)) lt!132660)))

(declare-fun b!262394 () Bool)

(declare-fun c!44718 () Bool)

(declare-fun lt!132662 () (_ BitVec 64))

(assert (=> b!262394 (= c!44718 (= lt!132662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170034 () SeekEntryResult!1159)

(declare-fun e!170033 () SeekEntryResult!1159)

(assert (=> b!262394 (= e!170034 e!170033)))

(declare-fun b!262395 () Bool)

(assert (=> b!262395 (= e!170035 Undefined!1159)))

(declare-fun b!262396 () Bool)

(assert (=> b!262396 (= e!170034 (Found!1159 (index!6808 lt!132661)))))

(declare-fun b!262397 () Bool)

(assert (=> b!262397 (= e!170035 e!170034)))

(assert (=> b!262397 (= lt!132662 (select (arr!5984 (_keys!7014 thiss!1504)) (index!6808 lt!132661)))))

(declare-fun c!44719 () Bool)

(assert (=> b!262397 (= c!44719 (= lt!132662 key!932))))

(declare-fun b!262398 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12643 (_ BitVec 32)) SeekEntryResult!1159)

(assert (=> b!262398 (= e!170033 (seekKeyOrZeroReturnVacant!0 (x!25165 lt!132661) (index!6808 lt!132661) (index!6808 lt!132661) key!932 (_keys!7014 thiss!1504) (mask!11178 thiss!1504)))))

(declare-fun b!262399 () Bool)

(assert (=> b!262399 (= e!170033 (MissingZero!1159 (index!6808 lt!132661)))))

(assert (= (and d!63083 c!44717) b!262395))

(assert (= (and d!63083 (not c!44717)) b!262397))

(assert (= (and b!262397 c!44719) b!262396))

(assert (= (and b!262397 (not c!44719)) b!262394))

(assert (= (and b!262394 c!44718) b!262399))

(assert (= (and b!262394 (not c!44718)) b!262398))

(assert (=> d!63083 m!278263))

(declare-fun m!278641 () Bool)

(assert (=> d!63083 m!278641))

(declare-fun m!278643 () Bool)

(assert (=> d!63083 m!278643))

(declare-fun m!278645 () Bool)

(assert (=> d!63083 m!278645))

(declare-fun m!278647 () Bool)

(assert (=> d!63083 m!278647))

(declare-fun m!278649 () Bool)

(assert (=> d!63083 m!278649))

(assert (=> d!63083 m!278645))

(declare-fun m!278651 () Bool)

(assert (=> b!262397 m!278651))

(declare-fun m!278653 () Bool)

(assert (=> b!262398 m!278653))

(assert (=> b!262016 d!63083))

(declare-fun d!63085 () Bool)

(assert (=> d!63085 (contains!1877 (getCurrentListMap!1443 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) key!932)))

(declare-fun lt!132665 () Unit!8134)

(declare-fun choose!1290 (array!12643 array!12641 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) (_ BitVec 32) Int) Unit!8134)

(assert (=> d!63085 (= lt!132665 (choose!1290 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(assert (=> d!63085 (validMask!0 (mask!11178 thiss!1504))))

(assert (=> d!63085 (= (lemmaArrayContainsKeyThenInListMap!265 (_keys!7014 thiss!1504) (_values!4809 thiss!1504) (mask!11178 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) lt!132665)))

(declare-fun bs!9257 () Bool)

(assert (= bs!9257 d!63085))

(assert (=> bs!9257 m!278261))

(assert (=> bs!9257 m!278261))

(declare-fun m!278655 () Bool)

(assert (=> bs!9257 m!278655))

(declare-fun m!278657 () Bool)

(assert (=> bs!9257 m!278657))

(assert (=> bs!9257 m!278263))

(assert (=> b!262031 d!63085))

(declare-fun d!63087 () Bool)

(assert (=> d!63087 (= (array_inv!3937 (_keys!7014 thiss!1504)) (bvsge (size!6335 (_keys!7014 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262017 d!63087))

(declare-fun d!63089 () Bool)

(assert (=> d!63089 (= (array_inv!3938 (_values!4809 thiss!1504)) (bvsge (size!6334 (_values!4809 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262017 d!63089))

(declare-fun mapNonEmpty!11332 () Bool)

(declare-fun mapRes!11332 () Bool)

(declare-fun tp!23689 () Bool)

(declare-fun e!170040 () Bool)

(assert (=> mapNonEmpty!11332 (= mapRes!11332 (and tp!23689 e!170040))))

(declare-fun mapValue!11332 () ValueCell!2978)

(declare-fun mapRest!11332 () (Array (_ BitVec 32) ValueCell!2978))

(declare-fun mapKey!11332 () (_ BitVec 32))

(assert (=> mapNonEmpty!11332 (= mapRest!11323 (store mapRest!11332 mapKey!11332 mapValue!11332))))

(declare-fun b!262407 () Bool)

(declare-fun e!170041 () Bool)

(assert (=> b!262407 (= e!170041 tp_is_empty!6643)))

(declare-fun mapIsEmpty!11332 () Bool)

(assert (=> mapIsEmpty!11332 mapRes!11332))

(declare-fun b!262406 () Bool)

(assert (=> b!262406 (= e!170040 tp_is_empty!6643)))

(declare-fun condMapEmpty!11332 () Bool)

(declare-fun mapDefault!11332 () ValueCell!2978)

(assert (=> mapNonEmpty!11323 (= condMapEmpty!11332 (= mapRest!11323 ((as const (Array (_ BitVec 32) ValueCell!2978)) mapDefault!11332)))))

(assert (=> mapNonEmpty!11323 (= tp!23673 (and e!170041 mapRes!11332))))

(assert (= (and mapNonEmpty!11323 condMapEmpty!11332) mapIsEmpty!11332))

(assert (= (and mapNonEmpty!11323 (not condMapEmpty!11332)) mapNonEmpty!11332))

(assert (= (and mapNonEmpty!11332 ((_ is ValueCellFull!2978) mapValue!11332)) b!262406))

(assert (= (and mapNonEmpty!11323 ((_ is ValueCellFull!2978) mapDefault!11332)) b!262407))

(declare-fun m!278659 () Bool)

(assert (=> mapNonEmpty!11332 m!278659))

(declare-fun b_lambda!8341 () Bool)

(assert (= b_lambda!8339 (or (and b!262017 b_free!6781) b_lambda!8341)))

(declare-fun b_lambda!8343 () Bool)

(assert (= b_lambda!8337 (or (and b!262017 b_free!6781) b_lambda!8343)))

(check-sat (not b!262220) (not b!262211) (not d!63065) (not b!262301) (not b!262213) (not d!63041) (not b!262222) (not b!262250) (not b!262260) (not d!63045) (not d!63073) (not b!262244) (not d!63083) (not d!63049) (not b!262308) (not bm!25058) (not b!262281) (not b!262225) (not bm!25042) (not b!262380) (not b!262334) (not b!262312) (not b!262381) (not bm!25030) (not bm!25046) (not d!63067) (not b!262333) (not b!262263) (not b_lambda!8341) (not b!262214) (not b!262251) (not b!262322) (not b!262168) (not b_next!6781) (not bm!25043) (not d!63059) (not d!63085) (not b!262298) (not d!63075) (not b!262398) (not bm!25037) (not d!63047) (not bm!25041) (not b!262166) (not b!262279) (not d!63039) (not b!262268) (not b!262339) (not bm!25044) (not d!63055) (not b!262261) (not b!262302) (not b!262335) (not b!262379) (not b!262299) (not mapNonEmpty!11332) (not bm!25040) (not bm!25029) (not b!262342) (not b!262288) (not b!262313) (not b!262291) (not b!262284) (not bm!25045) (not bm!25031) (not b!262318) (not b_lambda!8343) (not b!262224) (not bm!25057) (not b!262371) (not bm!25028) (not b!262310) (not d!63077) (not bm!25052) (not b!262230) tp_is_empty!6643 (not d!63079) b_and!13937)
(check-sat b_and!13937 (not b_next!6781))
