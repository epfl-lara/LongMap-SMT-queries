; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23452 () Bool)

(assert start!23452)

(declare-fun b!246327 () Bool)

(declare-fun b_free!6565 () Bool)

(declare-fun b_next!6565 () Bool)

(assert (=> b!246327 (= b_free!6565 (not b_next!6565))))

(declare-fun tp!22934 () Bool)

(declare-fun b_and!13575 () Bool)

(assert (=> b!246327 (= tp!22934 b_and!13575)))

(declare-fun b!246313 () Bool)

(declare-fun e!159789 () Bool)

(declare-fun tp_is_empty!6427 () Bool)

(assert (=> b!246313 (= e!159789 tp_is_empty!6427)))

(declare-fun b!246314 () Bool)

(declare-fun e!159781 () Bool)

(declare-fun e!159779 () Bool)

(assert (=> b!246314 (= e!159781 e!159779)))

(declare-fun res!120784 () Bool)

(declare-fun call!23003 () Bool)

(assert (=> b!246314 (= res!120784 call!23003)))

(assert (=> b!246314 (=> (not res!120784) (not e!159779))))

(declare-fun b!246315 () Bool)

(declare-fun res!120781 () Bool)

(declare-fun e!159778 () Bool)

(assert (=> b!246315 (=> (not res!120781) (not e!159778))))

(assert (=> b!246315 (= res!120781 call!23003)))

(declare-fun e!159790 () Bool)

(assert (=> b!246315 (= e!159790 e!159778)))

(declare-fun b!246316 () Bool)

(declare-datatypes ((Unit!7587 0))(
  ( (Unit!7588) )
))
(declare-fun e!159780 () Unit!7587)

(declare-fun Unit!7589 () Unit!7587)

(assert (=> b!246316 (= e!159780 Unit!7589)))

(declare-fun lt!123400 () Unit!7587)

(declare-datatypes ((V!8217 0))(
  ( (V!8218 (val!3258 Int)) )
))
(declare-datatypes ((ValueCell!2870 0))(
  ( (ValueCellFull!2870 (v!5314 V!8217)) (EmptyCell!2870) )
))
(declare-datatypes ((array!12153 0))(
  ( (array!12154 (arr!5767 (Array (_ BitVec 32) ValueCell!2870)) (size!6110 (_ BitVec 32))) )
))
(declare-datatypes ((array!12155 0))(
  ( (array!12156 (arr!5768 (Array (_ BitVec 32) (_ BitVec 64))) (size!6111 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3640 0))(
  ( (LongMapFixedSize!3641 (defaultEntry!4557 Int) (mask!10680 (_ BitVec 32)) (extraKeys!4294 (_ BitVec 32)) (zeroValue!4398 V!8217) (minValue!4398 V!8217) (_size!1869 (_ BitVec 32)) (_keys!6676 array!12155) (_values!4540 array!12153) (_vacant!1869 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3640)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!190 (array!12155 array!12153 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) (_ BitVec 32) Int) Unit!7587)

(assert (=> b!246316 (= lt!123400 (lemmaArrayContainsKeyThenInListMap!190 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(assert (=> b!246316 false))

(declare-fun b!246317 () Bool)

(declare-fun e!159784 () Bool)

(declare-fun e!159787 () Bool)

(declare-fun mapRes!10907 () Bool)

(assert (=> b!246317 (= e!159784 (and e!159787 mapRes!10907))))

(declare-fun condMapEmpty!10907 () Bool)

(declare-fun mapDefault!10907 () ValueCell!2870)

(assert (=> b!246317 (= condMapEmpty!10907 (= (arr!5767 (_values!4540 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2870)) mapDefault!10907)))))

(declare-fun b!246318 () Bool)

(declare-fun e!159788 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!246318 (= e!159788 (or (not (= (size!6111 (_keys!6676 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10680 thiss!1504)))) (bvsge index!297 #b00000000000000000000000000000000)))))

(declare-fun res!120785 () Bool)

(declare-fun e!159785 () Bool)

(assert (=> start!23452 (=> (not res!120785) (not e!159785))))

(declare-fun valid!1437 (LongMapFixedSize!3640) Bool)

(assert (=> start!23452 (= res!120785 (valid!1437 thiss!1504))))

(assert (=> start!23452 e!159785))

(declare-fun e!159792 () Bool)

(assert (=> start!23452 e!159792))

(assert (=> start!23452 true))

(declare-fun b!246319 () Bool)

(declare-fun e!159783 () Unit!7587)

(declare-fun lt!123407 () Unit!7587)

(assert (=> b!246319 (= e!159783 lt!123407)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (array!12155 array!12153 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7587)

(assert (=> b!246319 (= lt!123407 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(declare-fun c!41187 () Bool)

(declare-datatypes ((SeekEntryResult!1060 0))(
  ( (MissingZero!1060 (index!6410 (_ BitVec 32))) (Found!1060 (index!6411 (_ BitVec 32))) (Intermediate!1060 (undefined!1872 Bool) (index!6412 (_ BitVec 32)) (x!24434 (_ BitVec 32))) (Undefined!1060) (MissingVacant!1060 (index!6413 (_ BitVec 32))) )
))
(declare-fun lt!123399 () SeekEntryResult!1060)

(get-info :version)

(assert (=> b!246319 (= c!41187 ((_ is MissingZero!1060) lt!123399))))

(assert (=> b!246319 e!159790))

(declare-fun b!246320 () Bool)

(declare-fun Unit!7590 () Unit!7587)

(assert (=> b!246320 (= e!159783 Unit!7590)))

(declare-fun lt!123404 () Unit!7587)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!374 (array!12155 array!12153 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7587)

(assert (=> b!246320 (= lt!123404 (lemmaInListMapThenSeekEntryOrOpenFindsIt!374 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(assert (=> b!246320 false))

(declare-fun b!246321 () Bool)

(declare-fun call!23002 () Bool)

(assert (=> b!246321 (= e!159779 (not call!23002))))

(declare-fun b!246322 () Bool)

(declare-fun res!120780 () Bool)

(assert (=> b!246322 (=> (not res!120780) (not e!159785))))

(assert (=> b!246322 (= res!120780 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246323 () Bool)

(declare-fun Unit!7591 () Unit!7587)

(assert (=> b!246323 (= e!159780 Unit!7591)))

(declare-fun b!246324 () Bool)

(assert (=> b!246324 (= e!159778 (not call!23002))))

(declare-fun b!246325 () Bool)

(assert (=> b!246325 (= e!159781 ((_ is Undefined!1060) lt!123399))))

(declare-fun b!246326 () Bool)

(declare-fun e!159791 () Bool)

(declare-fun e!159782 () Bool)

(assert (=> b!246326 (= e!159791 e!159782)))

(declare-fun res!120779 () Bool)

(assert (=> b!246326 (=> (not res!120779) (not e!159782))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246326 (= res!120779 (inRange!0 index!297 (mask!10680 thiss!1504)))))

(declare-fun lt!123401 () Unit!7587)

(assert (=> b!246326 (= lt!123401 e!159783)))

(declare-fun c!41190 () Bool)

(declare-datatypes ((tuple2!4726 0))(
  ( (tuple2!4727 (_1!2374 (_ BitVec 64)) (_2!2374 V!8217)) )
))
(declare-datatypes ((List!3602 0))(
  ( (Nil!3599) (Cons!3598 (h!4256 tuple2!4726) (t!8611 List!3602)) )
))
(declare-datatypes ((ListLongMap!3641 0))(
  ( (ListLongMap!3642 (toList!1836 List!3602)) )
))
(declare-fun contains!1763 (ListLongMap!3641 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1368 (array!12155 array!12153 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 32) Int) ListLongMap!3641)

(assert (=> b!246326 (= c!41190 (contains!1763 (getCurrentListMap!1368 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10907 () Bool)

(declare-fun tp!22933 () Bool)

(assert (=> mapNonEmpty!10907 (= mapRes!10907 (and tp!22933 e!159789))))

(declare-fun mapRest!10907 () (Array (_ BitVec 32) ValueCell!2870))

(declare-fun mapValue!10907 () ValueCell!2870)

(declare-fun mapKey!10907 () (_ BitVec 32))

(assert (=> mapNonEmpty!10907 (= (arr!5767 (_values!4540 thiss!1504)) (store mapRest!10907 mapKey!10907 mapValue!10907))))

(declare-fun array_inv!3793 (array!12155) Bool)

(declare-fun array_inv!3794 (array!12153) Bool)

(assert (=> b!246327 (= e!159792 (and tp!22934 tp_is_empty!6427 (array_inv!3793 (_keys!6676 thiss!1504)) (array_inv!3794 (_values!4540 thiss!1504)) e!159784))))

(declare-fun mapIsEmpty!10907 () Bool)

(assert (=> mapIsEmpty!10907 mapRes!10907))

(declare-fun b!246328 () Bool)

(declare-fun res!120787 () Bool)

(assert (=> b!246328 (= res!120787 (= (select (arr!5768 (_keys!6676 thiss!1504)) (index!6413 lt!123399)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246328 (=> (not res!120787) (not e!159779))))

(declare-fun bm!22999 () Bool)

(assert (=> bm!22999 (= call!23003 (inRange!0 (ite c!41187 (index!6410 lt!123399) (index!6413 lt!123399)) (mask!10680 thiss!1504)))))

(declare-fun b!246329 () Bool)

(declare-fun c!41188 () Bool)

(assert (=> b!246329 (= c!41188 ((_ is MissingVacant!1060) lt!123399))))

(assert (=> b!246329 (= e!159790 e!159781)))

(declare-fun b!246330 () Bool)

(assert (=> b!246330 (= e!159785 e!159791)))

(declare-fun res!120782 () Bool)

(assert (=> b!246330 (=> (not res!120782) (not e!159791))))

(assert (=> b!246330 (= res!120782 (or (= lt!123399 (MissingZero!1060 index!297)) (= lt!123399 (MissingVacant!1060 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12155 (_ BitVec 32)) SeekEntryResult!1060)

(assert (=> b!246330 (= lt!123399 (seekEntryOrOpen!0 key!932 (_keys!6676 thiss!1504) (mask!10680 thiss!1504)))))

(declare-fun b!246331 () Bool)

(assert (=> b!246331 (= e!159782 (not e!159788))))

(declare-fun res!120786 () Bool)

(assert (=> b!246331 (=> res!120786 e!159788)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!246331 (= res!120786 (not (validMask!0 (mask!10680 thiss!1504))))))

(declare-fun lt!123405 () array!12155)

(declare-fun arrayCountValidKeys!0 (array!12155 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246331 (= (arrayCountValidKeys!0 lt!123405 #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6676 thiss!1504) #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504)))))))

(declare-fun lt!123402 () Unit!7587)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12155 (_ BitVec 32) (_ BitVec 64)) Unit!7587)

(assert (=> b!246331 (= lt!123402 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6676 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3603 0))(
  ( (Nil!3600) (Cons!3599 (h!4257 (_ BitVec 64)) (t!8612 List!3603)) )
))
(declare-fun arrayNoDuplicates!0 (array!12155 (_ BitVec 32) List!3603) Bool)

(assert (=> b!246331 (arrayNoDuplicates!0 lt!123405 #b00000000000000000000000000000000 Nil!3600)))

(assert (=> b!246331 (= lt!123405 (array!12156 (store (arr!5768 (_keys!6676 thiss!1504)) index!297 key!932) (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun lt!123403 () Unit!7587)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3603) Unit!7587)

(assert (=> b!246331 (= lt!123403 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6676 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3600))))

(declare-fun lt!123406 () Unit!7587)

(assert (=> b!246331 (= lt!123406 e!159780)))

(declare-fun c!41189 () Bool)

(declare-fun arrayContainsKey!0 (array!12155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!246331 (= c!41189 (arrayContainsKey!0 (_keys!6676 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246332 () Bool)

(declare-fun res!120783 () Bool)

(assert (=> b!246332 (=> (not res!120783) (not e!159778))))

(assert (=> b!246332 (= res!120783 (= (select (arr!5768 (_keys!6676 thiss!1504)) (index!6410 lt!123399)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23000 () Bool)

(assert (=> bm!23000 (= call!23002 (arrayContainsKey!0 (_keys!6676 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246333 () Bool)

(assert (=> b!246333 (= e!159787 tp_is_empty!6427)))

(assert (= (and start!23452 res!120785) b!246322))

(assert (= (and b!246322 res!120780) b!246330))

(assert (= (and b!246330 res!120782) b!246326))

(assert (= (and b!246326 c!41190) b!246320))

(assert (= (and b!246326 (not c!41190)) b!246319))

(assert (= (and b!246319 c!41187) b!246315))

(assert (= (and b!246319 (not c!41187)) b!246329))

(assert (= (and b!246315 res!120781) b!246332))

(assert (= (and b!246332 res!120783) b!246324))

(assert (= (and b!246329 c!41188) b!246314))

(assert (= (and b!246329 (not c!41188)) b!246325))

(assert (= (and b!246314 res!120784) b!246328))

(assert (= (and b!246328 res!120787) b!246321))

(assert (= (or b!246315 b!246314) bm!22999))

(assert (= (or b!246324 b!246321) bm!23000))

(assert (= (and b!246326 res!120779) b!246331))

(assert (= (and b!246331 c!41189) b!246316))

(assert (= (and b!246331 (not c!41189)) b!246323))

(assert (= (and b!246331 (not res!120786)) b!246318))

(assert (= (and b!246317 condMapEmpty!10907) mapIsEmpty!10907))

(assert (= (and b!246317 (not condMapEmpty!10907)) mapNonEmpty!10907))

(assert (= (and mapNonEmpty!10907 ((_ is ValueCellFull!2870) mapValue!10907)) b!246313))

(assert (= (and b!246317 ((_ is ValueCellFull!2870) mapDefault!10907)) b!246333))

(assert (= b!246327 b!246317))

(assert (= start!23452 b!246327))

(declare-fun m!263879 () Bool)

(assert (=> b!246331 m!263879))

(declare-fun m!263881 () Bool)

(assert (=> b!246331 m!263881))

(declare-fun m!263883 () Bool)

(assert (=> b!246331 m!263883))

(declare-fun m!263885 () Bool)

(assert (=> b!246331 m!263885))

(declare-fun m!263887 () Bool)

(assert (=> b!246331 m!263887))

(declare-fun m!263889 () Bool)

(assert (=> b!246331 m!263889))

(declare-fun m!263891 () Bool)

(assert (=> b!246331 m!263891))

(declare-fun m!263893 () Bool)

(assert (=> b!246331 m!263893))

(assert (=> bm!23000 m!263881))

(declare-fun m!263895 () Bool)

(assert (=> bm!22999 m!263895))

(declare-fun m!263897 () Bool)

(assert (=> b!246332 m!263897))

(declare-fun m!263899 () Bool)

(assert (=> mapNonEmpty!10907 m!263899))

(declare-fun m!263901 () Bool)

(assert (=> b!246326 m!263901))

(declare-fun m!263903 () Bool)

(assert (=> b!246326 m!263903))

(assert (=> b!246326 m!263903))

(declare-fun m!263905 () Bool)

(assert (=> b!246326 m!263905))

(declare-fun m!263907 () Bool)

(assert (=> b!246327 m!263907))

(declare-fun m!263909 () Bool)

(assert (=> b!246327 m!263909))

(declare-fun m!263911 () Bool)

(assert (=> b!246320 m!263911))

(declare-fun m!263913 () Bool)

(assert (=> b!246319 m!263913))

(declare-fun m!263915 () Bool)

(assert (=> b!246316 m!263915))

(declare-fun m!263917 () Bool)

(assert (=> b!246330 m!263917))

(declare-fun m!263919 () Bool)

(assert (=> start!23452 m!263919))

(declare-fun m!263921 () Bool)

(assert (=> b!246328 m!263921))

(check-sat (not b!246316) (not b!246330) (not b_next!6565) (not b!246319) (not bm!23000) (not b!246331) (not b!246320) (not b!246326) tp_is_empty!6427 (not start!23452) (not mapNonEmpty!10907) (not bm!22999) (not b!246327) b_and!13575)
(check-sat b_and!13575 (not b_next!6565))
(get-model)

(declare-fun b!246476 () Bool)

(declare-fun e!159891 () Bool)

(declare-fun call!23021 () Bool)

(assert (=> b!246476 (= e!159891 (not call!23021))))

(declare-fun b!246477 () Bool)

(declare-fun res!120850 () Bool)

(declare-fun e!159893 () Bool)

(assert (=> b!246477 (=> (not res!120850) (not e!159893))))

(declare-fun lt!123466 () SeekEntryResult!1060)

(assert (=> b!246477 (= res!120850 (= (select (arr!5768 (_keys!6676 thiss!1504)) (index!6413 lt!123466)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246477 (and (bvsge (index!6413 lt!123466) #b00000000000000000000000000000000) (bvslt (index!6413 lt!123466) (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun bm!23017 () Bool)

(declare-fun c!41219 () Bool)

(declare-fun call!23020 () Bool)

(assert (=> bm!23017 (= call!23020 (inRange!0 (ite c!41219 (index!6410 lt!123466) (index!6413 lt!123466)) (mask!10680 thiss!1504)))))

(declare-fun b!246478 () Bool)

(declare-fun e!159894 () Bool)

(declare-fun e!159892 () Bool)

(assert (=> b!246478 (= e!159894 e!159892)))

(declare-fun c!41220 () Bool)

(assert (=> b!246478 (= c!41220 ((_ is MissingVacant!1060) lt!123466))))

(declare-fun b!246479 () Bool)

(declare-fun res!120852 () Bool)

(assert (=> b!246479 (=> (not res!120852) (not e!159893))))

(assert (=> b!246479 (= res!120852 call!23020)))

(assert (=> b!246479 (= e!159892 e!159893)))

(declare-fun b!246480 () Bool)

(assert (=> b!246480 (= e!159892 ((_ is Undefined!1060) lt!123466))))

(declare-fun b!246481 () Bool)

(assert (=> b!246481 (= e!159894 e!159891)))

(declare-fun res!120851 () Bool)

(assert (=> b!246481 (= res!120851 call!23020)))

(assert (=> b!246481 (=> (not res!120851) (not e!159891))))

(declare-fun b!246482 () Bool)

(assert (=> b!246482 (= e!159893 (not call!23021))))

(declare-fun d!60437 () Bool)

(assert (=> d!60437 e!159894))

(assert (=> d!60437 (= c!41219 ((_ is MissingZero!1060) lt!123466))))

(assert (=> d!60437 (= lt!123466 (seekEntryOrOpen!0 key!932 (_keys!6676 thiss!1504) (mask!10680 thiss!1504)))))

(declare-fun lt!123467 () Unit!7587)

(declare-fun choose!1162 (array!12155 array!12153 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7587)

(assert (=> d!60437 (= lt!123467 (choose!1162 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(assert (=> d!60437 (validMask!0 (mask!10680 thiss!1504))))

(assert (=> d!60437 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!366 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)) lt!123467)))

(declare-fun b!246483 () Bool)

(assert (=> b!246483 (and (bvsge (index!6410 lt!123466) #b00000000000000000000000000000000) (bvslt (index!6410 lt!123466) (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun res!120853 () Bool)

(assert (=> b!246483 (= res!120853 (= (select (arr!5768 (_keys!6676 thiss!1504)) (index!6410 lt!123466)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246483 (=> (not res!120853) (not e!159891))))

(declare-fun bm!23018 () Bool)

(assert (=> bm!23018 (= call!23021 (arrayContainsKey!0 (_keys!6676 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!60437 c!41219) b!246481))

(assert (= (and d!60437 (not c!41219)) b!246478))

(assert (= (and b!246481 res!120851) b!246483))

(assert (= (and b!246483 res!120853) b!246476))

(assert (= (and b!246478 c!41220) b!246479))

(assert (= (and b!246478 (not c!41220)) b!246480))

(assert (= (and b!246479 res!120852) b!246477))

(assert (= (and b!246477 res!120850) b!246482))

(assert (= (or b!246481 b!246479) bm!23017))

(assert (= (or b!246476 b!246482) bm!23018))

(declare-fun m!264011 () Bool)

(assert (=> b!246483 m!264011))

(declare-fun m!264013 () Bool)

(assert (=> b!246477 m!264013))

(assert (=> bm!23018 m!263881))

(assert (=> d!60437 m!263917))

(declare-fun m!264015 () Bool)

(assert (=> d!60437 m!264015))

(assert (=> d!60437 m!263879))

(declare-fun m!264017 () Bool)

(assert (=> bm!23017 m!264017))

(assert (=> b!246319 d!60437))

(declare-fun d!60439 () Bool)

(declare-fun res!120858 () Bool)

(declare-fun e!159899 () Bool)

(assert (=> d!60439 (=> res!120858 e!159899)))

(assert (=> d!60439 (= res!120858 (= (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60439 (= (arrayContainsKey!0 (_keys!6676 thiss!1504) key!932 #b00000000000000000000000000000000) e!159899)))

(declare-fun b!246488 () Bool)

(declare-fun e!159900 () Bool)

(assert (=> b!246488 (= e!159899 e!159900)))

(declare-fun res!120859 () Bool)

(assert (=> b!246488 (=> (not res!120859) (not e!159900))))

(assert (=> b!246488 (= res!120859 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun b!246489 () Bool)

(assert (=> b!246489 (= e!159900 (arrayContainsKey!0 (_keys!6676 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60439 (not res!120858)) b!246488))

(assert (= (and b!246488 res!120859) b!246489))

(declare-fun m!264019 () Bool)

(assert (=> d!60439 m!264019))

(declare-fun m!264021 () Bool)

(assert (=> b!246489 m!264021))

(assert (=> bm!23000 d!60439))

(declare-fun d!60441 () Bool)

(declare-fun e!159903 () Bool)

(assert (=> d!60441 e!159903))

(declare-fun res!120864 () Bool)

(assert (=> d!60441 (=> (not res!120864) (not e!159903))))

(declare-fun lt!123472 () SeekEntryResult!1060)

(assert (=> d!60441 (= res!120864 ((_ is Found!1060) lt!123472))))

(assert (=> d!60441 (= lt!123472 (seekEntryOrOpen!0 key!932 (_keys!6676 thiss!1504) (mask!10680 thiss!1504)))))

(declare-fun lt!123473 () Unit!7587)

(declare-fun choose!1163 (array!12155 array!12153 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) Int) Unit!7587)

(assert (=> d!60441 (= lt!123473 (choose!1163 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)))))

(assert (=> d!60441 (validMask!0 (mask!10680 thiss!1504))))

(assert (=> d!60441 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!374 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 (defaultEntry!4557 thiss!1504)) lt!123473)))

(declare-fun b!246494 () Bool)

(declare-fun res!120865 () Bool)

(assert (=> b!246494 (=> (not res!120865) (not e!159903))))

(assert (=> b!246494 (= res!120865 (inRange!0 (index!6411 lt!123472) (mask!10680 thiss!1504)))))

(declare-fun b!246495 () Bool)

(assert (=> b!246495 (= e!159903 (= (select (arr!5768 (_keys!6676 thiss!1504)) (index!6411 lt!123472)) key!932))))

(assert (=> b!246495 (and (bvsge (index!6411 lt!123472) #b00000000000000000000000000000000) (bvslt (index!6411 lt!123472) (size!6111 (_keys!6676 thiss!1504))))))

(assert (= (and d!60441 res!120864) b!246494))

(assert (= (and b!246494 res!120865) b!246495))

(assert (=> d!60441 m!263917))

(declare-fun m!264023 () Bool)

(assert (=> d!60441 m!264023))

(assert (=> d!60441 m!263879))

(declare-fun m!264025 () Bool)

(assert (=> b!246494 m!264025))

(declare-fun m!264027 () Bool)

(assert (=> b!246495 m!264027))

(assert (=> b!246320 d!60441))

(declare-fun b!246504 () Bool)

(declare-fun e!159909 () (_ BitVec 32))

(declare-fun e!159908 () (_ BitVec 32))

(assert (=> b!246504 (= e!159909 e!159908)))

(declare-fun c!41225 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!246504 (= c!41225 (validKeyInArray!0 (select (arr!5768 lt!123405) #b00000000000000000000000000000000)))))

(declare-fun b!246505 () Bool)

(assert (=> b!246505 (= e!159909 #b00000000000000000000000000000000)))

(declare-fun d!60443 () Bool)

(declare-fun lt!123476 () (_ BitVec 32))

(assert (=> d!60443 (and (bvsge lt!123476 #b00000000000000000000000000000000) (bvsle lt!123476 (bvsub (size!6111 lt!123405) #b00000000000000000000000000000000)))))

(assert (=> d!60443 (= lt!123476 e!159909)))

(declare-fun c!41226 () Bool)

(assert (=> d!60443 (= c!41226 (bvsge #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))))))

(assert (=> d!60443 (and (bvsle #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6111 (_keys!6676 thiss!1504)) (size!6111 lt!123405)))))

(assert (=> d!60443 (= (arrayCountValidKeys!0 lt!123405 #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) lt!123476)))

(declare-fun b!246506 () Bool)

(declare-fun call!23024 () (_ BitVec 32))

(assert (=> b!246506 (= e!159908 (bvadd #b00000000000000000000000000000001 call!23024))))

(declare-fun bm!23021 () Bool)

(assert (=> bm!23021 (= call!23024 (arrayCountValidKeys!0 lt!123405 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun b!246507 () Bool)

(assert (=> b!246507 (= e!159908 call!23024)))

(assert (= (and d!60443 c!41226) b!246505))

(assert (= (and d!60443 (not c!41226)) b!246504))

(assert (= (and b!246504 c!41225) b!246506))

(assert (= (and b!246504 (not c!41225)) b!246507))

(assert (= (or b!246506 b!246507) bm!23021))

(declare-fun m!264029 () Bool)

(assert (=> b!246504 m!264029))

(assert (=> b!246504 m!264029))

(declare-fun m!264031 () Bool)

(assert (=> b!246504 m!264031))

(declare-fun m!264033 () Bool)

(assert (=> bm!23021 m!264033))

(assert (=> b!246331 d!60443))

(declare-fun d!60445 () Bool)

(declare-fun e!159915 () Bool)

(assert (=> d!60445 e!159915))

(declare-fun res!120874 () Bool)

(assert (=> d!60445 (=> (not res!120874) (not e!159915))))

(assert (=> d!60445 (= res!120874 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6111 (_keys!6676 thiss!1504)))))))

(declare-fun lt!123479 () Unit!7587)

(declare-fun choose!1 (array!12155 (_ BitVec 32) (_ BitVec 64)) Unit!7587)

(assert (=> d!60445 (= lt!123479 (choose!1 (_keys!6676 thiss!1504) index!297 key!932))))

(declare-fun e!159914 () Bool)

(assert (=> d!60445 e!159914))

(declare-fun res!120877 () Bool)

(assert (=> d!60445 (=> (not res!120877) (not e!159914))))

(assert (=> d!60445 (= res!120877 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6111 (_keys!6676 thiss!1504)))))))

(assert (=> d!60445 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6676 thiss!1504) index!297 key!932) lt!123479)))

(declare-fun b!246519 () Bool)

(assert (=> b!246519 (= e!159915 (= (arrayCountValidKeys!0 (array!12156 (store (arr!5768 (_keys!6676 thiss!1504)) index!297 key!932) (size!6111 (_keys!6676 thiss!1504))) #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6676 thiss!1504) #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!246516 () Bool)

(declare-fun res!120876 () Bool)

(assert (=> b!246516 (=> (not res!120876) (not e!159914))))

(assert (=> b!246516 (= res!120876 (not (validKeyInArray!0 (select (arr!5768 (_keys!6676 thiss!1504)) index!297))))))

(declare-fun b!246517 () Bool)

(declare-fun res!120875 () Bool)

(assert (=> b!246517 (=> (not res!120875) (not e!159914))))

(assert (=> b!246517 (= res!120875 (validKeyInArray!0 key!932))))

(declare-fun b!246518 () Bool)

(assert (=> b!246518 (= e!159914 (bvslt (size!6111 (_keys!6676 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60445 res!120877) b!246516))

(assert (= (and b!246516 res!120876) b!246517))

(assert (= (and b!246517 res!120875) b!246518))

(assert (= (and d!60445 res!120874) b!246519))

(declare-fun m!264035 () Bool)

(assert (=> d!60445 m!264035))

(assert (=> b!246519 m!263889))

(declare-fun m!264037 () Bool)

(assert (=> b!246519 m!264037))

(assert (=> b!246519 m!263891))

(declare-fun m!264039 () Bool)

(assert (=> b!246516 m!264039))

(assert (=> b!246516 m!264039))

(declare-fun m!264041 () Bool)

(assert (=> b!246516 m!264041))

(declare-fun m!264043 () Bool)

(assert (=> b!246517 m!264043))

(assert (=> b!246331 d!60445))

(assert (=> b!246331 d!60439))

(declare-fun b!246530 () Bool)

(declare-fun e!159925 () Bool)

(declare-fun contains!1765 (List!3603 (_ BitVec 64)) Bool)

(assert (=> b!246530 (= e!159925 (contains!1765 Nil!3600 (select (arr!5768 lt!123405) #b00000000000000000000000000000000)))))

(declare-fun d!60447 () Bool)

(declare-fun res!120886 () Bool)

(declare-fun e!159926 () Bool)

(assert (=> d!60447 (=> res!120886 e!159926)))

(assert (=> d!60447 (= res!120886 (bvsge #b00000000000000000000000000000000 (size!6111 lt!123405)))))

(assert (=> d!60447 (= (arrayNoDuplicates!0 lt!123405 #b00000000000000000000000000000000 Nil!3600) e!159926)))

(declare-fun bm!23024 () Bool)

(declare-fun call!23027 () Bool)

(declare-fun c!41229 () Bool)

(assert (=> bm!23024 (= call!23027 (arrayNoDuplicates!0 lt!123405 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41229 (Cons!3599 (select (arr!5768 lt!123405) #b00000000000000000000000000000000) Nil!3600) Nil!3600)))))

(declare-fun b!246531 () Bool)

(declare-fun e!159924 () Bool)

(assert (=> b!246531 (= e!159926 e!159924)))

(declare-fun res!120885 () Bool)

(assert (=> b!246531 (=> (not res!120885) (not e!159924))))

(assert (=> b!246531 (= res!120885 (not e!159925))))

(declare-fun res!120884 () Bool)

(assert (=> b!246531 (=> (not res!120884) (not e!159925))))

(assert (=> b!246531 (= res!120884 (validKeyInArray!0 (select (arr!5768 lt!123405) #b00000000000000000000000000000000)))))

(declare-fun b!246532 () Bool)

(declare-fun e!159927 () Bool)

(assert (=> b!246532 (= e!159927 call!23027)))

(declare-fun b!246533 () Bool)

(assert (=> b!246533 (= e!159924 e!159927)))

(assert (=> b!246533 (= c!41229 (validKeyInArray!0 (select (arr!5768 lt!123405) #b00000000000000000000000000000000)))))

(declare-fun b!246534 () Bool)

(assert (=> b!246534 (= e!159927 call!23027)))

(assert (= (and d!60447 (not res!120886)) b!246531))

(assert (= (and b!246531 res!120884) b!246530))

(assert (= (and b!246531 res!120885) b!246533))

(assert (= (and b!246533 c!41229) b!246534))

(assert (= (and b!246533 (not c!41229)) b!246532))

(assert (= (or b!246534 b!246532) bm!23024))

(assert (=> b!246530 m!264029))

(assert (=> b!246530 m!264029))

(declare-fun m!264045 () Bool)

(assert (=> b!246530 m!264045))

(assert (=> bm!23024 m!264029))

(declare-fun m!264047 () Bool)

(assert (=> bm!23024 m!264047))

(assert (=> b!246531 m!264029))

(assert (=> b!246531 m!264029))

(assert (=> b!246531 m!264031))

(assert (=> b!246533 m!264029))

(assert (=> b!246533 m!264029))

(assert (=> b!246533 m!264031))

(assert (=> b!246331 d!60447))

(declare-fun b!246535 () Bool)

(declare-fun e!159929 () (_ BitVec 32))

(declare-fun e!159928 () (_ BitVec 32))

(assert (=> b!246535 (= e!159929 e!159928)))

(declare-fun c!41230 () Bool)

(assert (=> b!246535 (= c!41230 (validKeyInArray!0 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246536 () Bool)

(assert (=> b!246536 (= e!159929 #b00000000000000000000000000000000)))

(declare-fun d!60449 () Bool)

(declare-fun lt!123480 () (_ BitVec 32))

(assert (=> d!60449 (and (bvsge lt!123480 #b00000000000000000000000000000000) (bvsle lt!123480 (bvsub (size!6111 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60449 (= lt!123480 e!159929)))

(declare-fun c!41231 () Bool)

(assert (=> d!60449 (= c!41231 (bvsge #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))))))

(assert (=> d!60449 (and (bvsle #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6111 (_keys!6676 thiss!1504)) (size!6111 (_keys!6676 thiss!1504))))))

(assert (=> d!60449 (= (arrayCountValidKeys!0 (_keys!6676 thiss!1504) #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) lt!123480)))

(declare-fun b!246537 () Bool)

(declare-fun call!23028 () (_ BitVec 32))

(assert (=> b!246537 (= e!159928 (bvadd #b00000000000000000000000000000001 call!23028))))

(declare-fun bm!23025 () Bool)

(assert (=> bm!23025 (= call!23028 (arrayCountValidKeys!0 (_keys!6676 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun b!246538 () Bool)

(assert (=> b!246538 (= e!159928 call!23028)))

(assert (= (and d!60449 c!41231) b!246536))

(assert (= (and d!60449 (not c!41231)) b!246535))

(assert (= (and b!246535 c!41230) b!246537))

(assert (= (and b!246535 (not c!41230)) b!246538))

(assert (= (or b!246537 b!246538) bm!23025))

(assert (=> b!246535 m!264019))

(assert (=> b!246535 m!264019))

(declare-fun m!264049 () Bool)

(assert (=> b!246535 m!264049))

(declare-fun m!264051 () Bool)

(assert (=> bm!23025 m!264051))

(assert (=> b!246331 d!60449))

(declare-fun d!60451 () Bool)

(assert (=> d!60451 (= (validMask!0 (mask!10680 thiss!1504)) (and (or (= (mask!10680 thiss!1504) #b00000000000000000000000000000111) (= (mask!10680 thiss!1504) #b00000000000000000000000000001111) (= (mask!10680 thiss!1504) #b00000000000000000000000000011111) (= (mask!10680 thiss!1504) #b00000000000000000000000000111111) (= (mask!10680 thiss!1504) #b00000000000000000000000001111111) (= (mask!10680 thiss!1504) #b00000000000000000000000011111111) (= (mask!10680 thiss!1504) #b00000000000000000000000111111111) (= (mask!10680 thiss!1504) #b00000000000000000000001111111111) (= (mask!10680 thiss!1504) #b00000000000000000000011111111111) (= (mask!10680 thiss!1504) #b00000000000000000000111111111111) (= (mask!10680 thiss!1504) #b00000000000000000001111111111111) (= (mask!10680 thiss!1504) #b00000000000000000011111111111111) (= (mask!10680 thiss!1504) #b00000000000000000111111111111111) (= (mask!10680 thiss!1504) #b00000000000000001111111111111111) (= (mask!10680 thiss!1504) #b00000000000000011111111111111111) (= (mask!10680 thiss!1504) #b00000000000000111111111111111111) (= (mask!10680 thiss!1504) #b00000000000001111111111111111111) (= (mask!10680 thiss!1504) #b00000000000011111111111111111111) (= (mask!10680 thiss!1504) #b00000000000111111111111111111111) (= (mask!10680 thiss!1504) #b00000000001111111111111111111111) (= (mask!10680 thiss!1504) #b00000000011111111111111111111111) (= (mask!10680 thiss!1504) #b00000000111111111111111111111111) (= (mask!10680 thiss!1504) #b00000001111111111111111111111111) (= (mask!10680 thiss!1504) #b00000011111111111111111111111111) (= (mask!10680 thiss!1504) #b00000111111111111111111111111111) (= (mask!10680 thiss!1504) #b00001111111111111111111111111111) (= (mask!10680 thiss!1504) #b00011111111111111111111111111111) (= (mask!10680 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10680 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!246331 d!60451))

(declare-fun d!60453 () Bool)

(declare-fun e!159932 () Bool)

(assert (=> d!60453 e!159932))

(declare-fun res!120889 () Bool)

(assert (=> d!60453 (=> (not res!120889) (not e!159932))))

(assert (=> d!60453 (= res!120889 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6111 (_keys!6676 thiss!1504)))))))

(declare-fun lt!123483 () Unit!7587)

(declare-fun choose!41 (array!12155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3603) Unit!7587)

(assert (=> d!60453 (= lt!123483 (choose!41 (_keys!6676 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3600))))

(assert (=> d!60453 (bvslt (size!6111 (_keys!6676 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60453 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6676 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3600) lt!123483)))

(declare-fun b!246541 () Bool)

(assert (=> b!246541 (= e!159932 (arrayNoDuplicates!0 (array!12156 (store (arr!5768 (_keys!6676 thiss!1504)) index!297 key!932) (size!6111 (_keys!6676 thiss!1504))) #b00000000000000000000000000000000 Nil!3600))))

(assert (= (and d!60453 res!120889) b!246541))

(declare-fun m!264053 () Bool)

(assert (=> d!60453 m!264053))

(assert (=> b!246541 m!263889))

(declare-fun m!264055 () Bool)

(assert (=> b!246541 m!264055))

(assert (=> b!246331 d!60453))

(declare-fun d!60455 () Bool)

(declare-fun res!120896 () Bool)

(declare-fun e!159935 () Bool)

(assert (=> d!60455 (=> (not res!120896) (not e!159935))))

(declare-fun simpleValid!255 (LongMapFixedSize!3640) Bool)

(assert (=> d!60455 (= res!120896 (simpleValid!255 thiss!1504))))

(assert (=> d!60455 (= (valid!1437 thiss!1504) e!159935)))

(declare-fun b!246548 () Bool)

(declare-fun res!120897 () Bool)

(assert (=> b!246548 (=> (not res!120897) (not e!159935))))

(assert (=> b!246548 (= res!120897 (= (arrayCountValidKeys!0 (_keys!6676 thiss!1504) #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) (_size!1869 thiss!1504)))))

(declare-fun b!246549 () Bool)

(declare-fun res!120898 () Bool)

(assert (=> b!246549 (=> (not res!120898) (not e!159935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12155 (_ BitVec 32)) Bool)

(assert (=> b!246549 (= res!120898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6676 thiss!1504) (mask!10680 thiss!1504)))))

(declare-fun b!246550 () Bool)

(assert (=> b!246550 (= e!159935 (arrayNoDuplicates!0 (_keys!6676 thiss!1504) #b00000000000000000000000000000000 Nil!3600))))

(assert (= (and d!60455 res!120896) b!246548))

(assert (= (and b!246548 res!120897) b!246549))

(assert (= (and b!246549 res!120898) b!246550))

(declare-fun m!264057 () Bool)

(assert (=> d!60455 m!264057))

(assert (=> b!246548 m!263891))

(declare-fun m!264059 () Bool)

(assert (=> b!246549 m!264059))

(declare-fun m!264061 () Bool)

(assert (=> b!246550 m!264061))

(assert (=> start!23452 d!60455))

(declare-fun b!246563 () Bool)

(declare-fun e!159944 () SeekEntryResult!1060)

(declare-fun lt!123490 () SeekEntryResult!1060)

(assert (=> b!246563 (= e!159944 (MissingZero!1060 (index!6412 lt!123490)))))

(declare-fun b!246564 () Bool)

(declare-fun e!159942 () SeekEntryResult!1060)

(declare-fun e!159943 () SeekEntryResult!1060)

(assert (=> b!246564 (= e!159942 e!159943)))

(declare-fun lt!123491 () (_ BitVec 64))

(assert (=> b!246564 (= lt!123491 (select (arr!5768 (_keys!6676 thiss!1504)) (index!6412 lt!123490)))))

(declare-fun c!41240 () Bool)

(assert (=> b!246564 (= c!41240 (= lt!123491 key!932))))

(declare-fun b!246565 () Bool)

(assert (=> b!246565 (= e!159943 (Found!1060 (index!6412 lt!123490)))))

(declare-fun b!246566 () Bool)

(assert (=> b!246566 (= e!159942 Undefined!1060)))

(declare-fun b!246567 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12155 (_ BitVec 32)) SeekEntryResult!1060)

(assert (=> b!246567 (= e!159944 (seekKeyOrZeroReturnVacant!0 (x!24434 lt!123490) (index!6412 lt!123490) (index!6412 lt!123490) key!932 (_keys!6676 thiss!1504) (mask!10680 thiss!1504)))))

(declare-fun d!60457 () Bool)

(declare-fun lt!123492 () SeekEntryResult!1060)

(assert (=> d!60457 (and (or ((_ is Undefined!1060) lt!123492) (not ((_ is Found!1060) lt!123492)) (and (bvsge (index!6411 lt!123492) #b00000000000000000000000000000000) (bvslt (index!6411 lt!123492) (size!6111 (_keys!6676 thiss!1504))))) (or ((_ is Undefined!1060) lt!123492) ((_ is Found!1060) lt!123492) (not ((_ is MissingZero!1060) lt!123492)) (and (bvsge (index!6410 lt!123492) #b00000000000000000000000000000000) (bvslt (index!6410 lt!123492) (size!6111 (_keys!6676 thiss!1504))))) (or ((_ is Undefined!1060) lt!123492) ((_ is Found!1060) lt!123492) ((_ is MissingZero!1060) lt!123492) (not ((_ is MissingVacant!1060) lt!123492)) (and (bvsge (index!6413 lt!123492) #b00000000000000000000000000000000) (bvslt (index!6413 lt!123492) (size!6111 (_keys!6676 thiss!1504))))) (or ((_ is Undefined!1060) lt!123492) (ite ((_ is Found!1060) lt!123492) (= (select (arr!5768 (_keys!6676 thiss!1504)) (index!6411 lt!123492)) key!932) (ite ((_ is MissingZero!1060) lt!123492) (= (select (arr!5768 (_keys!6676 thiss!1504)) (index!6410 lt!123492)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1060) lt!123492) (= (select (arr!5768 (_keys!6676 thiss!1504)) (index!6413 lt!123492)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60457 (= lt!123492 e!159942)))

(declare-fun c!41238 () Bool)

(assert (=> d!60457 (= c!41238 (and ((_ is Intermediate!1060) lt!123490) (undefined!1872 lt!123490)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12155 (_ BitVec 32)) SeekEntryResult!1060)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60457 (= lt!123490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10680 thiss!1504)) key!932 (_keys!6676 thiss!1504) (mask!10680 thiss!1504)))))

(assert (=> d!60457 (validMask!0 (mask!10680 thiss!1504))))

(assert (=> d!60457 (= (seekEntryOrOpen!0 key!932 (_keys!6676 thiss!1504) (mask!10680 thiss!1504)) lt!123492)))

(declare-fun b!246568 () Bool)

(declare-fun c!41239 () Bool)

(assert (=> b!246568 (= c!41239 (= lt!123491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246568 (= e!159943 e!159944)))

(assert (= (and d!60457 c!41238) b!246566))

(assert (= (and d!60457 (not c!41238)) b!246564))

(assert (= (and b!246564 c!41240) b!246565))

(assert (= (and b!246564 (not c!41240)) b!246568))

(assert (= (and b!246568 c!41239) b!246563))

(assert (= (and b!246568 (not c!41239)) b!246567))

(declare-fun m!264063 () Bool)

(assert (=> b!246564 m!264063))

(declare-fun m!264065 () Bool)

(assert (=> b!246567 m!264065))

(declare-fun m!264067 () Bool)

(assert (=> d!60457 m!264067))

(assert (=> d!60457 m!263879))

(declare-fun m!264069 () Bool)

(assert (=> d!60457 m!264069))

(declare-fun m!264071 () Bool)

(assert (=> d!60457 m!264071))

(declare-fun m!264073 () Bool)

(assert (=> d!60457 m!264073))

(assert (=> d!60457 m!264067))

(declare-fun m!264075 () Bool)

(assert (=> d!60457 m!264075))

(assert (=> b!246330 d!60457))

(declare-fun d!60459 () Bool)

(assert (=> d!60459 (= (array_inv!3793 (_keys!6676 thiss!1504)) (bvsge (size!6111 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246327 d!60459))

(declare-fun d!60461 () Bool)

(assert (=> d!60461 (= (array_inv!3794 (_values!4540 thiss!1504)) (bvsge (size!6110 (_values!4540 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246327 d!60461))

(declare-fun d!60463 () Bool)

(assert (=> d!60463 (= (inRange!0 (ite c!41187 (index!6410 lt!123399) (index!6413 lt!123399)) (mask!10680 thiss!1504)) (and (bvsge (ite c!41187 (index!6410 lt!123399) (index!6413 lt!123399)) #b00000000000000000000000000000000) (bvslt (ite c!41187 (index!6410 lt!123399) (index!6413 lt!123399)) (bvadd (mask!10680 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22999 d!60463))

(declare-fun d!60465 () Bool)

(assert (=> d!60465 (= (inRange!0 index!297 (mask!10680 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10680 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!246326 d!60465))

(declare-fun d!60467 () Bool)

(declare-fun e!159949 () Bool)

(assert (=> d!60467 e!159949))

(declare-fun res!120901 () Bool)

(assert (=> d!60467 (=> res!120901 e!159949)))

(declare-fun lt!123504 () Bool)

(assert (=> d!60467 (= res!120901 (not lt!123504))))

(declare-fun lt!123501 () Bool)

(assert (=> d!60467 (= lt!123504 lt!123501)))

(declare-fun lt!123503 () Unit!7587)

(declare-fun e!159950 () Unit!7587)

(assert (=> d!60467 (= lt!123503 e!159950)))

(declare-fun c!41243 () Bool)

(assert (=> d!60467 (= c!41243 lt!123501)))

(declare-fun containsKey!282 (List!3602 (_ BitVec 64)) Bool)

(assert (=> d!60467 (= lt!123501 (containsKey!282 (toList!1836 (getCurrentListMap!1368 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504))) key!932))))

(assert (=> d!60467 (= (contains!1763 (getCurrentListMap!1368 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) key!932) lt!123504)))

(declare-fun b!246575 () Bool)

(declare-fun lt!123502 () Unit!7587)

(assert (=> b!246575 (= e!159950 lt!123502)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!230 (List!3602 (_ BitVec 64)) Unit!7587)

(assert (=> b!246575 (= lt!123502 (lemmaContainsKeyImpliesGetValueByKeyDefined!230 (toList!1836 (getCurrentListMap!1368 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504))) key!932))))

(declare-datatypes ((Option!297 0))(
  ( (Some!296 (v!5317 V!8217)) (None!295) )
))
(declare-fun isDefined!231 (Option!297) Bool)

(declare-fun getValueByKey!291 (List!3602 (_ BitVec 64)) Option!297)

(assert (=> b!246575 (isDefined!231 (getValueByKey!291 (toList!1836 (getCurrentListMap!1368 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504))) key!932))))

(declare-fun b!246576 () Bool)

(declare-fun Unit!7596 () Unit!7587)

(assert (=> b!246576 (= e!159950 Unit!7596)))

(declare-fun b!246577 () Bool)

(assert (=> b!246577 (= e!159949 (isDefined!231 (getValueByKey!291 (toList!1836 (getCurrentListMap!1368 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504))) key!932)))))

(assert (= (and d!60467 c!41243) b!246575))

(assert (= (and d!60467 (not c!41243)) b!246576))

(assert (= (and d!60467 (not res!120901)) b!246577))

(declare-fun m!264077 () Bool)

(assert (=> d!60467 m!264077))

(declare-fun m!264079 () Bool)

(assert (=> b!246575 m!264079))

(declare-fun m!264081 () Bool)

(assert (=> b!246575 m!264081))

(assert (=> b!246575 m!264081))

(declare-fun m!264083 () Bool)

(assert (=> b!246575 m!264083))

(assert (=> b!246577 m!264081))

(assert (=> b!246577 m!264081))

(assert (=> b!246577 m!264083))

(assert (=> b!246326 d!60467))

(declare-fun b!246620 () Bool)

(declare-fun e!159984 () Bool)

(declare-fun call!23049 () Bool)

(assert (=> b!246620 (= e!159984 (not call!23049))))

(declare-fun b!246621 () Bool)

(declare-fun e!159987 () Unit!7587)

(declare-fun Unit!7597 () Unit!7587)

(assert (=> b!246621 (= e!159987 Unit!7597)))

(declare-fun b!246622 () Bool)

(declare-fun e!159985 () ListLongMap!3641)

(declare-fun e!159981 () ListLongMap!3641)

(assert (=> b!246622 (= e!159985 e!159981)))

(declare-fun c!41261 () Bool)

(assert (=> b!246622 (= c!41261 (and (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246623 () Bool)

(declare-fun e!159989 () Bool)

(declare-fun e!159978 () Bool)

(assert (=> b!246623 (= e!159989 e!159978)))

(declare-fun res!120928 () Bool)

(declare-fun call!23046 () Bool)

(assert (=> b!246623 (= res!120928 call!23046)))

(assert (=> b!246623 (=> (not res!120928) (not e!159978))))

(declare-fun b!246624 () Bool)

(declare-fun e!159982 () ListLongMap!3641)

(declare-fun call!23047 () ListLongMap!3641)

(assert (=> b!246624 (= e!159982 call!23047)))

(declare-fun b!246625 () Bool)

(declare-fun res!120924 () Bool)

(declare-fun e!159977 () Bool)

(assert (=> b!246625 (=> (not res!120924) (not e!159977))))

(assert (=> b!246625 (= res!120924 e!159989)))

(declare-fun c!41260 () Bool)

(assert (=> b!246625 (= c!41260 (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!246626 () Bool)

(declare-fun lt!123554 () ListLongMap!3641)

(declare-fun apply!232 (ListLongMap!3641 (_ BitVec 64)) V!8217)

(assert (=> b!246626 (= e!159978 (= (apply!232 lt!123554 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4398 thiss!1504)))))

(declare-fun b!246627 () Bool)

(declare-fun e!159983 () Bool)

(assert (=> b!246627 (= e!159984 e!159983)))

(declare-fun res!120925 () Bool)

(assert (=> b!246627 (= res!120925 call!23049)))

(assert (=> b!246627 (=> (not res!120925) (not e!159983))))

(declare-fun b!246628 () Bool)

(declare-fun call!23045 () ListLongMap!3641)

(assert (=> b!246628 (= e!159982 call!23045)))

(declare-fun b!246629 () Bool)

(declare-fun lt!123568 () Unit!7587)

(assert (=> b!246629 (= e!159987 lt!123568)))

(declare-fun lt!123570 () ListLongMap!3641)

(declare-fun getCurrentListMapNoExtraKeys!548 (array!12155 array!12153 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 32) Int) ListLongMap!3641)

(assert (=> b!246629 (= lt!123570 (getCurrentListMapNoExtraKeys!548 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun lt!123549 () (_ BitVec 64))

(assert (=> b!246629 (= lt!123549 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123567 () (_ BitVec 64))

(assert (=> b!246629 (= lt!123567 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123550 () Unit!7587)

(declare-fun addStillContains!208 (ListLongMap!3641 (_ BitVec 64) V!8217 (_ BitVec 64)) Unit!7587)

(assert (=> b!246629 (= lt!123550 (addStillContains!208 lt!123570 lt!123549 (zeroValue!4398 thiss!1504) lt!123567))))

(declare-fun +!659 (ListLongMap!3641 tuple2!4726) ListLongMap!3641)

(assert (=> b!246629 (contains!1763 (+!659 lt!123570 (tuple2!4727 lt!123549 (zeroValue!4398 thiss!1504))) lt!123567)))

(declare-fun lt!123553 () Unit!7587)

(assert (=> b!246629 (= lt!123553 lt!123550)))

(declare-fun lt!123555 () ListLongMap!3641)

(assert (=> b!246629 (= lt!123555 (getCurrentListMapNoExtraKeys!548 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun lt!123560 () (_ BitVec 64))

(assert (=> b!246629 (= lt!123560 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123556 () (_ BitVec 64))

(assert (=> b!246629 (= lt!123556 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123569 () Unit!7587)

(declare-fun addApplyDifferent!208 (ListLongMap!3641 (_ BitVec 64) V!8217 (_ BitVec 64)) Unit!7587)

(assert (=> b!246629 (= lt!123569 (addApplyDifferent!208 lt!123555 lt!123560 (minValue!4398 thiss!1504) lt!123556))))

(assert (=> b!246629 (= (apply!232 (+!659 lt!123555 (tuple2!4727 lt!123560 (minValue!4398 thiss!1504))) lt!123556) (apply!232 lt!123555 lt!123556))))

(declare-fun lt!123551 () Unit!7587)

(assert (=> b!246629 (= lt!123551 lt!123569)))

(declare-fun lt!123564 () ListLongMap!3641)

(assert (=> b!246629 (= lt!123564 (getCurrentListMapNoExtraKeys!548 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun lt!123565 () (_ BitVec 64))

(assert (=> b!246629 (= lt!123565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123562 () (_ BitVec 64))

(assert (=> b!246629 (= lt!123562 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123561 () Unit!7587)

(assert (=> b!246629 (= lt!123561 (addApplyDifferent!208 lt!123564 lt!123565 (zeroValue!4398 thiss!1504) lt!123562))))

(assert (=> b!246629 (= (apply!232 (+!659 lt!123564 (tuple2!4727 lt!123565 (zeroValue!4398 thiss!1504))) lt!123562) (apply!232 lt!123564 lt!123562))))

(declare-fun lt!123552 () Unit!7587)

(assert (=> b!246629 (= lt!123552 lt!123561)))

(declare-fun lt!123566 () ListLongMap!3641)

(assert (=> b!246629 (= lt!123566 (getCurrentListMapNoExtraKeys!548 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun lt!123559 () (_ BitVec 64))

(assert (=> b!246629 (= lt!123559 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123558 () (_ BitVec 64))

(assert (=> b!246629 (= lt!123558 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246629 (= lt!123568 (addApplyDifferent!208 lt!123566 lt!123559 (minValue!4398 thiss!1504) lt!123558))))

(assert (=> b!246629 (= (apply!232 (+!659 lt!123566 (tuple2!4727 lt!123559 (minValue!4398 thiss!1504))) lt!123558) (apply!232 lt!123566 lt!123558))))

(declare-fun b!246630 () Bool)

(declare-fun e!159988 () Bool)

(declare-fun e!159986 () Bool)

(assert (=> b!246630 (= e!159988 e!159986)))

(declare-fun res!120922 () Bool)

(assert (=> b!246630 (=> (not res!120922) (not e!159986))))

(assert (=> b!246630 (= res!120922 (contains!1763 lt!123554 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246630 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun b!246631 () Bool)

(declare-fun e!159980 () Bool)

(assert (=> b!246631 (= e!159980 (validKeyInArray!0 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246632 () Bool)

(assert (=> b!246632 (= e!159989 (not call!23046))))

(declare-fun b!246633 () Bool)

(declare-fun c!41257 () Bool)

(assert (=> b!246633 (= c!41257 (and (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!246633 (= e!159981 e!159982)))

(declare-fun d!60469 () Bool)

(assert (=> d!60469 e!159977))

(declare-fun res!120920 () Bool)

(assert (=> d!60469 (=> (not res!120920) (not e!159977))))

(assert (=> d!60469 (= res!120920 (or (bvsge #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))))))))

(declare-fun lt!123563 () ListLongMap!3641)

(assert (=> d!60469 (= lt!123554 lt!123563)))

(declare-fun lt!123557 () Unit!7587)

(assert (=> d!60469 (= lt!123557 e!159987)))

(declare-fun c!41256 () Bool)

(assert (=> d!60469 (= c!41256 e!159980)))

(declare-fun res!120926 () Bool)

(assert (=> d!60469 (=> (not res!120926) (not e!159980))))

(assert (=> d!60469 (= res!120926 (bvslt #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))))))

(assert (=> d!60469 (= lt!123563 e!159985)))

(declare-fun c!41258 () Bool)

(assert (=> d!60469 (= c!41258 (and (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60469 (validMask!0 (mask!10680 thiss!1504))))

(assert (=> d!60469 (= (getCurrentListMap!1368 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) lt!123554)))

(declare-fun bm!23040 () Bool)

(declare-fun call!23048 () ListLongMap!3641)

(assert (=> bm!23040 (= call!23047 call!23048)))

(declare-fun b!246634 () Bool)

(declare-fun res!120927 () Bool)

(assert (=> b!246634 (=> (not res!120927) (not e!159977))))

(assert (=> b!246634 (= res!120927 e!159988)))

(declare-fun res!120921 () Bool)

(assert (=> b!246634 (=> res!120921 e!159988)))

(declare-fun e!159979 () Bool)

(assert (=> b!246634 (= res!120921 (not e!159979))))

(declare-fun res!120923 () Bool)

(assert (=> b!246634 (=> (not res!120923) (not e!159979))))

(assert (=> b!246634 (= res!120923 (bvslt #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun bm!23041 () Bool)

(declare-fun call!23044 () ListLongMap!3641)

(declare-fun call!23043 () ListLongMap!3641)

(assert (=> bm!23041 (= call!23044 call!23043)))

(declare-fun bm!23042 () Bool)

(assert (=> bm!23042 (= call!23048 (+!659 (ite c!41258 call!23043 (ite c!41261 call!23044 call!23045)) (ite (or c!41258 c!41261) (tuple2!4727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4398 thiss!1504)) (tuple2!4727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4398 thiss!1504)))))))

(declare-fun b!246635 () Bool)

(assert (=> b!246635 (= e!159983 (= (apply!232 lt!123554 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4398 thiss!1504)))))

(declare-fun bm!23043 () Bool)

(assert (=> bm!23043 (= call!23043 (getCurrentListMapNoExtraKeys!548 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(declare-fun b!246636 () Bool)

(assert (=> b!246636 (= e!159977 e!159984)))

(declare-fun c!41259 () Bool)

(assert (=> b!246636 (= c!41259 (not (= (bvand (extraKeys!4294 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246637 () Bool)

(declare-fun get!2969 (ValueCell!2870 V!8217) V!8217)

(declare-fun dynLambda!575 (Int (_ BitVec 64)) V!8217)

(assert (=> b!246637 (= e!159986 (= (apply!232 lt!123554 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000)) (get!2969 (select (arr!5767 (_values!4540 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!575 (defaultEntry!4557 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6110 (_values!4540 thiss!1504))))))

(assert (=> b!246637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6111 (_keys!6676 thiss!1504))))))

(declare-fun b!246638 () Bool)

(assert (=> b!246638 (= e!159981 call!23047)))

(declare-fun bm!23044 () Bool)

(assert (=> bm!23044 (= call!23049 (contains!1763 lt!123554 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246639 () Bool)

(assert (=> b!246639 (= e!159985 (+!659 call!23048 (tuple2!4727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4398 thiss!1504))))))

(declare-fun bm!23045 () Bool)

(assert (=> bm!23045 (= call!23045 call!23044)))

(declare-fun b!246640 () Bool)

(assert (=> b!246640 (= e!159979 (validKeyInArray!0 (select (arr!5768 (_keys!6676 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23046 () Bool)

(assert (=> bm!23046 (= call!23046 (contains!1763 lt!123554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60469 c!41258) b!246639))

(assert (= (and d!60469 (not c!41258)) b!246622))

(assert (= (and b!246622 c!41261) b!246638))

(assert (= (and b!246622 (not c!41261)) b!246633))

(assert (= (and b!246633 c!41257) b!246624))

(assert (= (and b!246633 (not c!41257)) b!246628))

(assert (= (or b!246624 b!246628) bm!23045))

(assert (= (or b!246638 bm!23045) bm!23041))

(assert (= (or b!246638 b!246624) bm!23040))

(assert (= (or b!246639 bm!23041) bm!23043))

(assert (= (or b!246639 bm!23040) bm!23042))

(assert (= (and d!60469 res!120926) b!246631))

(assert (= (and d!60469 c!41256) b!246629))

(assert (= (and d!60469 (not c!41256)) b!246621))

(assert (= (and d!60469 res!120920) b!246634))

(assert (= (and b!246634 res!120923) b!246640))

(assert (= (and b!246634 (not res!120921)) b!246630))

(assert (= (and b!246630 res!120922) b!246637))

(assert (= (and b!246634 res!120927) b!246625))

(assert (= (and b!246625 c!41260) b!246623))

(assert (= (and b!246625 (not c!41260)) b!246632))

(assert (= (and b!246623 res!120928) b!246626))

(assert (= (or b!246623 b!246632) bm!23046))

(assert (= (and b!246625 res!120924) b!246636))

(assert (= (and b!246636 c!41259) b!246627))

(assert (= (and b!246636 (not c!41259)) b!246620))

(assert (= (and b!246627 res!120925) b!246635))

(assert (= (or b!246627 b!246620) bm!23044))

(declare-fun b_lambda!8061 () Bool)

(assert (=> (not b_lambda!8061) (not b!246637)))

(declare-fun t!8616 () Bool)

(declare-fun tb!2969 () Bool)

(assert (=> (and b!246327 (= (defaultEntry!4557 thiss!1504) (defaultEntry!4557 thiss!1504)) t!8616) tb!2969))

(declare-fun result!5245 () Bool)

(assert (=> tb!2969 (= result!5245 tp_is_empty!6427)))

(assert (=> b!246637 t!8616))

(declare-fun b_and!13581 () Bool)

(assert (= b_and!13575 (and (=> t!8616 result!5245) b_and!13581)))

(assert (=> b!246631 m!264019))

(assert (=> b!246631 m!264019))

(assert (=> b!246631 m!264049))

(declare-fun m!264085 () Bool)

(assert (=> b!246635 m!264085))

(declare-fun m!264087 () Bool)

(assert (=> bm!23044 m!264087))

(declare-fun m!264089 () Bool)

(assert (=> b!246629 m!264089))

(declare-fun m!264091 () Bool)

(assert (=> b!246629 m!264091))

(declare-fun m!264093 () Bool)

(assert (=> b!246629 m!264093))

(declare-fun m!264095 () Bool)

(assert (=> b!246629 m!264095))

(declare-fun m!264097 () Bool)

(assert (=> b!246629 m!264097))

(assert (=> b!246629 m!264093))

(declare-fun m!264099 () Bool)

(assert (=> b!246629 m!264099))

(declare-fun m!264101 () Bool)

(assert (=> b!246629 m!264101))

(assert (=> b!246629 m!264095))

(declare-fun m!264103 () Bool)

(assert (=> b!246629 m!264103))

(assert (=> b!246629 m!264019))

(declare-fun m!264105 () Bool)

(assert (=> b!246629 m!264105))

(declare-fun m!264107 () Bool)

(assert (=> b!246629 m!264107))

(assert (=> b!246629 m!264091))

(declare-fun m!264109 () Bool)

(assert (=> b!246629 m!264109))

(declare-fun m!264111 () Bool)

(assert (=> b!246629 m!264111))

(declare-fun m!264113 () Bool)

(assert (=> b!246629 m!264113))

(assert (=> b!246629 m!264089))

(declare-fun m!264115 () Bool)

(assert (=> b!246629 m!264115))

(declare-fun m!264117 () Bool)

(assert (=> b!246629 m!264117))

(declare-fun m!264119 () Bool)

(assert (=> b!246629 m!264119))

(assert (=> b!246637 m!264019))

(declare-fun m!264121 () Bool)

(assert (=> b!246637 m!264121))

(assert (=> b!246637 m!264019))

(declare-fun m!264123 () Bool)

(assert (=> b!246637 m!264123))

(declare-fun m!264125 () Bool)

(assert (=> b!246637 m!264125))

(assert (=> b!246637 m!264125))

(assert (=> b!246637 m!264121))

(declare-fun m!264127 () Bool)

(assert (=> b!246637 m!264127))

(declare-fun m!264129 () Bool)

(assert (=> bm!23046 m!264129))

(assert (=> b!246630 m!264019))

(assert (=> b!246630 m!264019))

(declare-fun m!264131 () Bool)

(assert (=> b!246630 m!264131))

(assert (=> bm!23043 m!264105))

(declare-fun m!264133 () Bool)

(assert (=> bm!23042 m!264133))

(declare-fun m!264135 () Bool)

(assert (=> b!246626 m!264135))

(assert (=> d!60469 m!263879))

(assert (=> b!246640 m!264019))

(assert (=> b!246640 m!264019))

(assert (=> b!246640 m!264049))

(declare-fun m!264137 () Bool)

(assert (=> b!246639 m!264137))

(assert (=> b!246326 d!60469))

(declare-fun d!60471 () Bool)

(assert (=> d!60471 (contains!1763 (getCurrentListMap!1368 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) key!932)))

(declare-fun lt!123573 () Unit!7587)

(declare-fun choose!1164 (array!12155 array!12153 (_ BitVec 32) (_ BitVec 32) V!8217 V!8217 (_ BitVec 64) (_ BitVec 32) Int) Unit!7587)

(assert (=> d!60471 (= lt!123573 (choose!1164 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)))))

(assert (=> d!60471 (validMask!0 (mask!10680 thiss!1504))))

(assert (=> d!60471 (= (lemmaArrayContainsKeyThenInListMap!190 (_keys!6676 thiss!1504) (_values!4540 thiss!1504) (mask!10680 thiss!1504) (extraKeys!4294 thiss!1504) (zeroValue!4398 thiss!1504) (minValue!4398 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4557 thiss!1504)) lt!123573)))

(declare-fun bs!8932 () Bool)

(assert (= bs!8932 d!60471))

(assert (=> bs!8932 m!263903))

(assert (=> bs!8932 m!263903))

(assert (=> bs!8932 m!263905))

(declare-fun m!264139 () Bool)

(assert (=> bs!8932 m!264139))

(assert (=> bs!8932 m!263879))

(assert (=> b!246316 d!60471))

(declare-fun mapNonEmpty!10916 () Bool)

(declare-fun mapRes!10916 () Bool)

(declare-fun tp!22949 () Bool)

(declare-fun e!159995 () Bool)

(assert (=> mapNonEmpty!10916 (= mapRes!10916 (and tp!22949 e!159995))))

(declare-fun mapKey!10916 () (_ BitVec 32))

(declare-fun mapRest!10916 () (Array (_ BitVec 32) ValueCell!2870))

(declare-fun mapValue!10916 () ValueCell!2870)

(assert (=> mapNonEmpty!10916 (= mapRest!10907 (store mapRest!10916 mapKey!10916 mapValue!10916))))

(declare-fun mapIsEmpty!10916 () Bool)

(assert (=> mapIsEmpty!10916 mapRes!10916))

(declare-fun b!246650 () Bool)

(declare-fun e!159994 () Bool)

(assert (=> b!246650 (= e!159994 tp_is_empty!6427)))

(declare-fun condMapEmpty!10916 () Bool)

(declare-fun mapDefault!10916 () ValueCell!2870)

(assert (=> mapNonEmpty!10907 (= condMapEmpty!10916 (= mapRest!10907 ((as const (Array (_ BitVec 32) ValueCell!2870)) mapDefault!10916)))))

(assert (=> mapNonEmpty!10907 (= tp!22933 (and e!159994 mapRes!10916))))

(declare-fun b!246649 () Bool)

(assert (=> b!246649 (= e!159995 tp_is_empty!6427)))

(assert (= (and mapNonEmpty!10907 condMapEmpty!10916) mapIsEmpty!10916))

(assert (= (and mapNonEmpty!10907 (not condMapEmpty!10916)) mapNonEmpty!10916))

(assert (= (and mapNonEmpty!10916 ((_ is ValueCellFull!2870) mapValue!10916)) b!246649))

(assert (= (and mapNonEmpty!10907 ((_ is ValueCellFull!2870) mapDefault!10916)) b!246650))

(declare-fun m!264141 () Bool)

(assert (=> mapNonEmpty!10916 m!264141))

(declare-fun b_lambda!8063 () Bool)

(assert (= b_lambda!8061 (or (and b!246327 b_free!6565) b_lambda!8063)))

(check-sat (not b!246516) (not bm!23042) (not b!246530) (not b!246567) (not mapNonEmpty!10916) (not d!60441) (not d!60455) (not bm!23018) (not bm!23043) (not bm!23044) (not b!246637) (not b!246640) (not b!246535) (not b!246549) (not b!246494) (not b!246517) (not bm!23046) (not d!60471) (not b!246548) (not bm!23025) (not b_next!6565) (not b!246639) (not b!246504) (not b!246531) (not d!60437) (not b!246489) (not b!246575) (not bm!23017) (not b!246533) (not bm!23024) (not b!246631) (not d!60445) (not b!246629) (not b!246635) (not b!246630) (not bm!23021) b_and!13581 (not b!246550) (not d!60467) (not b!246626) tp_is_empty!6427 (not b!246541) (not b!246577) (not b_lambda!8063) (not d!60469) (not b!246519) (not d!60457) (not d!60453))
(check-sat b_and!13581 (not b_next!6565))
