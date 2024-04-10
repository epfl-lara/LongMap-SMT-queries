; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24280 () Bool)

(assert start!24280)

(declare-fun b!254232 () Bool)

(declare-fun b_free!6681 () Bool)

(declare-fun b_next!6681 () Bool)

(assert (=> b!254232 (= b_free!6681 (not b_next!6681))))

(declare-fun tp!23330 () Bool)

(declare-fun b_and!13723 () Bool)

(assert (=> b!254232 (= tp!23330 b_and!13723)))

(declare-fun b!254225 () Bool)

(declare-datatypes ((Unit!7873 0))(
  ( (Unit!7874) )
))
(declare-fun e!164791 () Unit!7873)

(declare-fun Unit!7875 () Unit!7873)

(assert (=> b!254225 (= e!164791 Unit!7875)))

(declare-fun lt!127392 () Unit!7873)

(declare-datatypes ((V!8371 0))(
  ( (V!8372 (val!3316 Int)) )
))
(declare-datatypes ((ValueCell!2928 0))(
  ( (ValueCellFull!2928 (v!5390 V!8371)) (EmptyCell!2928) )
))
(declare-datatypes ((array!12417 0))(
  ( (array!12418 (arr!5884 (Array (_ BitVec 32) ValueCell!2928)) (size!6231 (_ BitVec 32))) )
))
(declare-datatypes ((array!12419 0))(
  ( (array!12420 (arr!5885 (Array (_ BitVec 32) (_ BitVec 64))) (size!6232 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3756 0))(
  ( (LongMapFixedSize!3757 (defaultEntry!4691 Int) (mask!10935 (_ BitVec 32)) (extraKeys!4428 (_ BitVec 32)) (zeroValue!4532 V!8371) (minValue!4532 V!8371) (_size!1927 (_ BitVec 32)) (_keys!6845 array!12419) (_values!4674 array!12417) (_vacant!1927 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3756)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!415 (array!12419 array!12417 (_ BitVec 32) (_ BitVec 32) V!8371 V!8371 (_ BitVec 64) Int) Unit!7873)

(assert (=> b!254225 (= lt!127392 (lemmaInListMapThenSeekEntryOrOpenFindsIt!415 (_keys!6845 thiss!1504) (_values!4674 thiss!1504) (mask!10935 thiss!1504) (extraKeys!4428 thiss!1504) (zeroValue!4532 thiss!1504) (minValue!4532 thiss!1504) key!932 (defaultEntry!4691 thiss!1504)))))

(assert (=> b!254225 false))

(declare-fun b!254226 () Bool)

(declare-fun e!164796 () Bool)

(declare-fun call!23989 () Bool)

(assert (=> b!254226 (= e!164796 (not call!23989))))

(declare-fun mapIsEmpty!11130 () Bool)

(declare-fun mapRes!11130 () Bool)

(assert (=> mapIsEmpty!11130 mapRes!11130))

(declare-fun b!254227 () Bool)

(declare-fun e!164790 () Bool)

(assert (=> b!254227 (= e!164790 e!164796)))

(declare-fun res!124462 () Bool)

(declare-fun call!23988 () Bool)

(assert (=> b!254227 (= res!124462 call!23988)))

(assert (=> b!254227 (=> (not res!124462) (not e!164796))))

(declare-fun b!254228 () Bool)

(declare-fun res!124459 () Bool)

(declare-fun e!164793 () Bool)

(assert (=> b!254228 (=> res!124459 e!164793)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12419 (_ BitVec 32)) Bool)

(assert (=> b!254228 (= res!124459 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6845 thiss!1504) (mask!10935 thiss!1504))))))

(declare-fun mapNonEmpty!11130 () Bool)

(declare-fun tp!23331 () Bool)

(declare-fun e!164792 () Bool)

(assert (=> mapNonEmpty!11130 (= mapRes!11130 (and tp!23331 e!164792))))

(declare-fun mapKey!11130 () (_ BitVec 32))

(declare-fun mapRest!11130 () (Array (_ BitVec 32) ValueCell!2928))

(declare-fun mapValue!11130 () ValueCell!2928)

(assert (=> mapNonEmpty!11130 (= (arr!5884 (_values!4674 thiss!1504)) (store mapRest!11130 mapKey!11130 mapValue!11130))))

(declare-fun b!254229 () Bool)

(declare-fun e!164787 () Unit!7873)

(declare-fun Unit!7876 () Unit!7873)

(assert (=> b!254229 (= e!164787 Unit!7876)))

(declare-fun res!124463 () Bool)

(declare-fun e!164797 () Bool)

(assert (=> start!24280 (=> (not res!124463) (not e!164797))))

(declare-fun valid!1469 (LongMapFixedSize!3756) Bool)

(assert (=> start!24280 (= res!124463 (valid!1469 thiss!1504))))

(assert (=> start!24280 e!164797))

(declare-fun e!164789 () Bool)

(assert (=> start!24280 e!164789))

(assert (=> start!24280 true))

(declare-fun b!254230 () Bool)

(declare-fun e!164786 () Bool)

(declare-fun e!164795 () Bool)

(assert (=> b!254230 (= e!164786 e!164795)))

(declare-fun res!124461 () Bool)

(assert (=> b!254230 (=> (not res!124461) (not e!164795))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254230 (= res!124461 (inRange!0 index!297 (mask!10935 thiss!1504)))))

(declare-fun lt!127390 () Unit!7873)

(assert (=> b!254230 (= lt!127390 e!164791)))

(declare-fun c!42876 () Bool)

(declare-datatypes ((tuple2!4882 0))(
  ( (tuple2!4883 (_1!2452 (_ BitVec 64)) (_2!2452 V!8371)) )
))
(declare-datatypes ((List!3763 0))(
  ( (Nil!3760) (Cons!3759 (h!4421 tuple2!4882) (t!8810 List!3763)) )
))
(declare-datatypes ((ListLongMap!3795 0))(
  ( (ListLongMap!3796 (toList!1913 List!3763)) )
))
(declare-fun contains!1843 (ListLongMap!3795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1441 (array!12419 array!12417 (_ BitVec 32) (_ BitVec 32) V!8371 V!8371 (_ BitVec 32) Int) ListLongMap!3795)

(assert (=> b!254230 (= c!42876 (contains!1843 (getCurrentListMap!1441 (_keys!6845 thiss!1504) (_values!4674 thiss!1504) (mask!10935 thiss!1504) (extraKeys!4428 thiss!1504) (zeroValue!4532 thiss!1504) (minValue!4532 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4691 thiss!1504)) key!932))))

(declare-fun b!254231 () Bool)

(declare-fun e!164794 () Bool)

(assert (=> b!254231 (= e!164794 (not call!23989))))

(declare-fun e!164783 () Bool)

(declare-fun tp_is_empty!6543 () Bool)

(declare-fun array_inv!3891 (array!12419) Bool)

(declare-fun array_inv!3892 (array!12417) Bool)

(assert (=> b!254232 (= e!164789 (and tp!23330 tp_is_empty!6543 (array_inv!3891 (_keys!6845 thiss!1504)) (array_inv!3892 (_values!4674 thiss!1504)) e!164783))))

(declare-fun b!254233 () Bool)

(declare-fun res!124460 () Bool)

(assert (=> b!254233 (=> (not res!124460) (not e!164794))))

(assert (=> b!254233 (= res!124460 call!23988)))

(declare-fun e!164788 () Bool)

(assert (=> b!254233 (= e!164788 e!164794)))

(declare-fun bm!23985 () Bool)

(declare-fun arrayContainsKey!0 (array!12419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23985 (= call!23989 (arrayContainsKey!0 (_keys!6845 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254234 () Bool)

(assert (=> b!254234 (= e!164797 e!164786)))

(declare-fun res!124465 () Bool)

(assert (=> b!254234 (=> (not res!124465) (not e!164786))))

(declare-datatypes ((SeekEntryResult!1147 0))(
  ( (MissingZero!1147 (index!6758 (_ BitVec 32))) (Found!1147 (index!6759 (_ BitVec 32))) (Intermediate!1147 (undefined!1959 Bool) (index!6760 (_ BitVec 32)) (x!24855 (_ BitVec 32))) (Undefined!1147) (MissingVacant!1147 (index!6761 (_ BitVec 32))) )
))
(declare-fun lt!127397 () SeekEntryResult!1147)

(assert (=> b!254234 (= res!124465 (or (= lt!127397 (MissingZero!1147 index!297)) (= lt!127397 (MissingVacant!1147 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12419 (_ BitVec 32)) SeekEntryResult!1147)

(assert (=> b!254234 (= lt!127397 (seekEntryOrOpen!0 key!932 (_keys!6845 thiss!1504) (mask!10935 thiss!1504)))))

(declare-fun b!254235 () Bool)

(declare-fun e!164785 () Bool)

(assert (=> b!254235 (= e!164783 (and e!164785 mapRes!11130))))

(declare-fun condMapEmpty!11130 () Bool)

(declare-fun mapDefault!11130 () ValueCell!2928)

(assert (=> b!254235 (= condMapEmpty!11130 (= (arr!5884 (_values!4674 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2928)) mapDefault!11130)))))

(declare-fun b!254236 () Bool)

(assert (=> b!254236 (= e!164785 tp_is_empty!6543)))

(declare-fun b!254237 () Bool)

(get-info :version)

(assert (=> b!254237 (= e!164790 ((_ is Undefined!1147) lt!127397))))

(declare-fun b!254238 () Bool)

(declare-fun lt!127400 () Unit!7873)

(assert (=> b!254238 (= e!164791 lt!127400)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!418 (array!12419 array!12417 (_ BitVec 32) (_ BitVec 32) V!8371 V!8371 (_ BitVec 64) Int) Unit!7873)

(assert (=> b!254238 (= lt!127400 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!418 (_keys!6845 thiss!1504) (_values!4674 thiss!1504) (mask!10935 thiss!1504) (extraKeys!4428 thiss!1504) (zeroValue!4532 thiss!1504) (minValue!4532 thiss!1504) key!932 (defaultEntry!4691 thiss!1504)))))

(declare-fun c!42877 () Bool)

(assert (=> b!254238 (= c!42877 ((_ is MissingZero!1147) lt!127397))))

(assert (=> b!254238 e!164788))

(declare-fun b!254239 () Bool)

(declare-fun c!42875 () Bool)

(assert (=> b!254239 (= c!42875 ((_ is MissingVacant!1147) lt!127397))))

(assert (=> b!254239 (= e!164788 e!164790)))

(declare-fun b!254240 () Bool)

(assert (=> b!254240 (= e!164795 (not e!164793))))

(declare-fun res!124467 () Bool)

(assert (=> b!254240 (=> res!124467 e!164793)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254240 (= res!124467 (not (validMask!0 (mask!10935 thiss!1504))))))

(declare-fun lt!127399 () array!12419)

(assert (=> b!254240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127399 (mask!10935 thiss!1504))))

(declare-fun lt!127398 () Unit!7873)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12419 (_ BitVec 32) (_ BitVec 32)) Unit!7873)

(assert (=> b!254240 (= lt!127398 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6845 thiss!1504) index!297 (mask!10935 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12419 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254240 (= (arrayCountValidKeys!0 lt!127399 #b00000000000000000000000000000000 (size!6232 (_keys!6845 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6845 thiss!1504) #b00000000000000000000000000000000 (size!6232 (_keys!6845 thiss!1504)))))))

(declare-fun lt!127394 () Unit!7873)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12419 (_ BitVec 32) (_ BitVec 64)) Unit!7873)

(assert (=> b!254240 (= lt!127394 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6845 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3764 0))(
  ( (Nil!3761) (Cons!3760 (h!4422 (_ BitVec 64)) (t!8811 List!3764)) )
))
(declare-fun arrayNoDuplicates!0 (array!12419 (_ BitVec 32) List!3764) Bool)

(assert (=> b!254240 (arrayNoDuplicates!0 lt!127399 #b00000000000000000000000000000000 Nil!3761)))

(assert (=> b!254240 (= lt!127399 (array!12420 (store (arr!5885 (_keys!6845 thiss!1504)) index!297 key!932) (size!6232 (_keys!6845 thiss!1504))))))

(declare-fun lt!127396 () Unit!7873)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3764) Unit!7873)

(assert (=> b!254240 (= lt!127396 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6845 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3761))))

(declare-fun lt!127391 () Unit!7873)

(assert (=> b!254240 (= lt!127391 e!164787)))

(declare-fun c!42878 () Bool)

(assert (=> b!254240 (= c!42878 (arrayContainsKey!0 (_keys!6845 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254241 () Bool)

(declare-fun res!124457 () Bool)

(assert (=> b!254241 (=> res!124457 e!164793)))

(assert (=> b!254241 (= res!124457 (or (not (= (size!6231 (_values!4674 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10935 thiss!1504)))) (not (= (size!6232 (_keys!6845 thiss!1504)) (size!6231 (_values!4674 thiss!1504)))) (bvslt (mask!10935 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4428 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4428 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!254242 () Bool)

(declare-fun res!124464 () Bool)

(assert (=> b!254242 (=> (not res!124464) (not e!164797))))

(assert (=> b!254242 (= res!124464 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254243 () Bool)

(declare-fun Unit!7877 () Unit!7873)

(assert (=> b!254243 (= e!164787 Unit!7877)))

(declare-fun lt!127395 () Unit!7873)

(declare-fun lemmaArrayContainsKeyThenInListMap!221 (array!12419 array!12417 (_ BitVec 32) (_ BitVec 32) V!8371 V!8371 (_ BitVec 64) (_ BitVec 32) Int) Unit!7873)

(assert (=> b!254243 (= lt!127395 (lemmaArrayContainsKeyThenInListMap!221 (_keys!6845 thiss!1504) (_values!4674 thiss!1504) (mask!10935 thiss!1504) (extraKeys!4428 thiss!1504) (zeroValue!4532 thiss!1504) (minValue!4532 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4691 thiss!1504)))))

(assert (=> b!254243 false))

(declare-fun bm!23986 () Bool)

(assert (=> bm!23986 (= call!23988 (inRange!0 (ite c!42877 (index!6758 lt!127397) (index!6761 lt!127397)) (mask!10935 thiss!1504)))))

(declare-fun b!254244 () Bool)

(assert (=> b!254244 (= e!164793 true)))

(declare-fun lt!127393 () Bool)

(assert (=> b!254244 (= lt!127393 (arrayNoDuplicates!0 (_keys!6845 thiss!1504) #b00000000000000000000000000000000 Nil!3761))))

(declare-fun b!254245 () Bool)

(assert (=> b!254245 (= e!164792 tp_is_empty!6543)))

(declare-fun b!254246 () Bool)

(declare-fun res!124466 () Bool)

(assert (=> b!254246 (= res!124466 (= (select (arr!5885 (_keys!6845 thiss!1504)) (index!6761 lt!127397)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254246 (=> (not res!124466) (not e!164796))))

(declare-fun b!254247 () Bool)

(declare-fun res!124458 () Bool)

(assert (=> b!254247 (=> (not res!124458) (not e!164794))))

(assert (=> b!254247 (= res!124458 (= (select (arr!5885 (_keys!6845 thiss!1504)) (index!6758 lt!127397)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!24280 res!124463) b!254242))

(assert (= (and b!254242 res!124464) b!254234))

(assert (= (and b!254234 res!124465) b!254230))

(assert (= (and b!254230 c!42876) b!254225))

(assert (= (and b!254230 (not c!42876)) b!254238))

(assert (= (and b!254238 c!42877) b!254233))

(assert (= (and b!254238 (not c!42877)) b!254239))

(assert (= (and b!254233 res!124460) b!254247))

(assert (= (and b!254247 res!124458) b!254231))

(assert (= (and b!254239 c!42875) b!254227))

(assert (= (and b!254239 (not c!42875)) b!254237))

(assert (= (and b!254227 res!124462) b!254246))

(assert (= (and b!254246 res!124466) b!254226))

(assert (= (or b!254233 b!254227) bm!23986))

(assert (= (or b!254231 b!254226) bm!23985))

(assert (= (and b!254230 res!124461) b!254240))

(assert (= (and b!254240 c!42878) b!254243))

(assert (= (and b!254240 (not c!42878)) b!254229))

(assert (= (and b!254240 (not res!124467)) b!254241))

(assert (= (and b!254241 (not res!124457)) b!254228))

(assert (= (and b!254228 (not res!124459)) b!254244))

(assert (= (and b!254235 condMapEmpty!11130) mapIsEmpty!11130))

(assert (= (and b!254235 (not condMapEmpty!11130)) mapNonEmpty!11130))

(assert (= (and mapNonEmpty!11130 ((_ is ValueCellFull!2928) mapValue!11130)) b!254245))

(assert (= (and b!254235 ((_ is ValueCellFull!2928) mapDefault!11130)) b!254236))

(assert (= b!254232 b!254235))

(assert (= start!24280 b!254232))

(declare-fun m!269845 () Bool)

(assert (=> b!254246 m!269845))

(declare-fun m!269847 () Bool)

(assert (=> b!254240 m!269847))

(declare-fun m!269849 () Bool)

(assert (=> b!254240 m!269849))

(declare-fun m!269851 () Bool)

(assert (=> b!254240 m!269851))

(declare-fun m!269853 () Bool)

(assert (=> b!254240 m!269853))

(declare-fun m!269855 () Bool)

(assert (=> b!254240 m!269855))

(declare-fun m!269857 () Bool)

(assert (=> b!254240 m!269857))

(declare-fun m!269859 () Bool)

(assert (=> b!254240 m!269859))

(declare-fun m!269861 () Bool)

(assert (=> b!254240 m!269861))

(declare-fun m!269863 () Bool)

(assert (=> b!254240 m!269863))

(declare-fun m!269865 () Bool)

(assert (=> b!254240 m!269865))

(declare-fun m!269867 () Bool)

(assert (=> bm!23986 m!269867))

(declare-fun m!269869 () Bool)

(assert (=> b!254238 m!269869))

(declare-fun m!269871 () Bool)

(assert (=> b!254247 m!269871))

(declare-fun m!269873 () Bool)

(assert (=> mapNonEmpty!11130 m!269873))

(declare-fun m!269875 () Bool)

(assert (=> b!254225 m!269875))

(declare-fun m!269877 () Bool)

(assert (=> b!254232 m!269877))

(declare-fun m!269879 () Bool)

(assert (=> b!254232 m!269879))

(declare-fun m!269881 () Bool)

(assert (=> b!254244 m!269881))

(declare-fun m!269883 () Bool)

(assert (=> start!24280 m!269883))

(assert (=> bm!23985 m!269849))

(declare-fun m!269885 () Bool)

(assert (=> b!254243 m!269885))

(declare-fun m!269887 () Bool)

(assert (=> b!254234 m!269887))

(declare-fun m!269889 () Bool)

(assert (=> b!254228 m!269889))

(declare-fun m!269891 () Bool)

(assert (=> b!254230 m!269891))

(declare-fun m!269893 () Bool)

(assert (=> b!254230 m!269893))

(assert (=> b!254230 m!269893))

(declare-fun m!269895 () Bool)

(assert (=> b!254230 m!269895))

(check-sat (not b!254225) (not b!254238) (not b!254240) (not b!254230) (not bm!23986) (not b!254228) tp_is_empty!6543 (not b!254232) (not bm!23985) (not mapNonEmpty!11130) (not b!254243) (not b!254244) b_and!13723 (not b_next!6681) (not start!24280) (not b!254234))
(check-sat b_and!13723 (not b_next!6681))
