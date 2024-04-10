; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22974 () Bool)

(assert start!22974)

(declare-fun b!240792 () Bool)

(declare-fun b_free!6477 () Bool)

(declare-fun b_next!6477 () Bool)

(assert (=> b!240792 (= b_free!6477 (not b_next!6477))))

(declare-fun tp!22634 () Bool)

(declare-fun b_and!13443 () Bool)

(assert (=> b!240792 (= tp!22634 b_and!13443)))

(declare-fun b!240783 () Bool)

(declare-fun res!118074 () Bool)

(declare-fun e!156268 () Bool)

(assert (=> b!240783 (=> (not res!118074) (not e!156268))))

(declare-datatypes ((V!8099 0))(
  ( (V!8100 (val!3214 Int)) )
))
(declare-datatypes ((ValueCell!2826 0))(
  ( (ValueCellFull!2826 (v!5252 V!8099)) (EmptyCell!2826) )
))
(declare-datatypes ((array!11957 0))(
  ( (array!11958 (arr!5680 (Array (_ BitVec 32) ValueCell!2826)) (size!6021 (_ BitVec 32))) )
))
(declare-datatypes ((array!11959 0))(
  ( (array!11960 (arr!5681 (Array (_ BitVec 32) (_ BitVec 64))) (size!6022 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3552 0))(
  ( (LongMapFixedSize!3553 (defaultEntry!4461 Int) (mask!10521 (_ BitVec 32)) (extraKeys!4198 (_ BitVec 32)) (zeroValue!4302 V!8099) (minValue!4302 V!8099) (_size!1825 (_ BitVec 32)) (_keys!6563 array!11959) (_values!4444 array!11957) (_vacant!1825 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3552)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240783 (= res!118074 (arrayContainsKey!0 (_keys!6563 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240784 () Bool)

(declare-fun res!118078 () Bool)

(declare-fun e!156267 () Bool)

(assert (=> b!240784 (=> (not res!118078) (not e!156267))))

(declare-fun call!22392 () Bool)

(assert (=> b!240784 (= res!118078 call!22392)))

(declare-fun e!156272 () Bool)

(assert (=> b!240784 (= e!156272 e!156267)))

(declare-fun b!240785 () Bool)

(declare-datatypes ((Unit!7409 0))(
  ( (Unit!7410) )
))
(declare-fun e!156271 () Unit!7409)

(declare-fun Unit!7411 () Unit!7409)

(assert (=> b!240785 (= e!156271 Unit!7411)))

(declare-fun lt!121060 () Unit!7409)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!343 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8099 V!8099 (_ BitVec 64) Int) Unit!7409)

(assert (=> b!240785 (= lt!121060 (lemmaInListMapThenSeekEntryOrOpenFindsIt!343 (_keys!6563 thiss!1504) (_values!4444 thiss!1504) (mask!10521 thiss!1504) (extraKeys!4198 thiss!1504) (zeroValue!4302 thiss!1504) (minValue!4302 thiss!1504) key!932 (defaultEntry!4461 thiss!1504)))))

(assert (=> b!240785 false))

(declare-fun b!240786 () Bool)

(declare-fun e!156276 () Bool)

(declare-fun tp_is_empty!6339 () Bool)

(assert (=> b!240786 (= e!156276 tp_is_empty!6339)))

(declare-fun b!240787 () Bool)

(declare-fun res!118075 () Bool)

(declare-fun e!156270 () Bool)

(assert (=> b!240787 (=> (not res!118075) (not e!156270))))

(assert (=> b!240787 (= res!118075 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240788 () Bool)

(declare-fun res!118071 () Bool)

(declare-datatypes ((SeekEntryResult!1051 0))(
  ( (MissingZero!1051 (index!6374 (_ BitVec 32))) (Found!1051 (index!6375 (_ BitVec 32))) (Intermediate!1051 (undefined!1863 Bool) (index!6376 (_ BitVec 32)) (x!24179 (_ BitVec 32))) (Undefined!1051) (MissingVacant!1051 (index!6377 (_ BitVec 32))) )
))
(declare-fun lt!121057 () SeekEntryResult!1051)

(assert (=> b!240788 (= res!118071 (= (select (arr!5681 (_keys!6563 thiss!1504)) (index!6377 lt!121057)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156277 () Bool)

(assert (=> b!240788 (=> (not res!118071) (not e!156277))))

(declare-fun b!240789 () Bool)

(declare-fun c!40100 () Bool)

(get-info :version)

(assert (=> b!240789 (= c!40100 ((_ is MissingVacant!1051) lt!121057))))

(declare-fun e!156274 () Bool)

(assert (=> b!240789 (= e!156272 e!156274)))

(declare-fun res!118072 () Bool)

(assert (=> start!22974 (=> (not res!118072) (not e!156270))))

(declare-fun valid!1397 (LongMapFixedSize!3552) Bool)

(assert (=> start!22974 (= res!118072 (valid!1397 thiss!1504))))

(assert (=> start!22974 e!156270))

(declare-fun e!156279 () Bool)

(assert (=> start!22974 e!156279))

(assert (=> start!22974 true))

(declare-fun b!240790 () Bool)

(declare-fun e!156278 () Bool)

(assert (=> b!240790 (= e!156278 e!156268)))

(declare-fun res!118076 () Bool)

(assert (=> b!240790 (=> (not res!118076) (not e!156268))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240790 (= res!118076 (inRange!0 index!297 (mask!10521 thiss!1504)))))

(declare-fun lt!121059 () Unit!7409)

(assert (=> b!240790 (= lt!121059 e!156271)))

(declare-fun c!40098 () Bool)

(declare-fun lt!121058 () Bool)

(assert (=> b!240790 (= c!40098 lt!121058)))

(declare-datatypes ((tuple2!4736 0))(
  ( (tuple2!4737 (_1!2379 (_ BitVec 64)) (_2!2379 V!8099)) )
))
(declare-datatypes ((List!3619 0))(
  ( (Nil!3616) (Cons!3615 (h!4271 tuple2!4736) (t!8614 List!3619)) )
))
(declare-datatypes ((ListLongMap!3649 0))(
  ( (ListLongMap!3650 (toList!1840 List!3619)) )
))
(declare-fun contains!1728 (ListLongMap!3649 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1368 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8099 V!8099 (_ BitVec 32) Int) ListLongMap!3649)

(assert (=> b!240790 (= lt!121058 (contains!1728 (getCurrentListMap!1368 (_keys!6563 thiss!1504) (_values!4444 thiss!1504) (mask!10521 thiss!1504) (extraKeys!4198 thiss!1504) (zeroValue!4302 thiss!1504) (minValue!4302 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4461 thiss!1504)) key!932))))

(declare-fun b!240791 () Bool)

(declare-fun e!156273 () Bool)

(assert (=> b!240791 (= e!156273 tp_is_empty!6339)))

(declare-fun e!156269 () Bool)

(declare-fun array_inv!3759 (array!11959) Bool)

(declare-fun array_inv!3760 (array!11957) Bool)

(assert (=> b!240792 (= e!156279 (and tp!22634 tp_is_empty!6339 (array_inv!3759 (_keys!6563 thiss!1504)) (array_inv!3760 (_values!4444 thiss!1504)) e!156269))))

(declare-fun mapNonEmpty!10740 () Bool)

(declare-fun mapRes!10740 () Bool)

(declare-fun tp!22635 () Bool)

(assert (=> mapNonEmpty!10740 (= mapRes!10740 (and tp!22635 e!156273))))

(declare-fun mapRest!10740 () (Array (_ BitVec 32) ValueCell!2826))

(declare-fun mapKey!10740 () (_ BitVec 32))

(declare-fun mapValue!10740 () ValueCell!2826)

(assert (=> mapNonEmpty!10740 (= (arr!5680 (_values!4444 thiss!1504)) (store mapRest!10740 mapKey!10740 mapValue!10740))))

(declare-fun bm!22388 () Bool)

(declare-fun call!22391 () Bool)

(assert (=> bm!22388 (= call!22391 (arrayContainsKey!0 (_keys!6563 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240793 () Bool)

(assert (=> b!240793 (= e!156274 ((_ is Undefined!1051) lt!121057))))

(declare-fun b!240794 () Bool)

(assert (=> b!240794 (= e!156274 e!156277)))

(declare-fun res!118073 () Bool)

(assert (=> b!240794 (= res!118073 call!22392)))

(assert (=> b!240794 (=> (not res!118073) (not e!156277))))

(declare-fun b!240795 () Bool)

(assert (=> b!240795 (= e!156269 (and e!156276 mapRes!10740))))

(declare-fun condMapEmpty!10740 () Bool)

(declare-fun mapDefault!10740 () ValueCell!2826)

(assert (=> b!240795 (= condMapEmpty!10740 (= (arr!5680 (_values!4444 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2826)) mapDefault!10740)))))

(declare-fun b!240796 () Bool)

(declare-fun res!118079 () Bool)

(assert (=> b!240796 (=> (not res!118079) (not e!156267))))

(assert (=> b!240796 (= res!118079 (= (select (arr!5681 (_keys!6563 thiss!1504)) (index!6374 lt!121057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240797 () Bool)

(assert (=> b!240797 (= e!156270 e!156278)))

(declare-fun res!118077 () Bool)

(assert (=> b!240797 (=> (not res!118077) (not e!156278))))

(assert (=> b!240797 (= res!118077 (or (= lt!121057 (MissingZero!1051 index!297)) (= lt!121057 (MissingVacant!1051 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11959 (_ BitVec 32)) SeekEntryResult!1051)

(assert (=> b!240797 (= lt!121057 (seekEntryOrOpen!0 key!932 (_keys!6563 thiss!1504) (mask!10521 thiss!1504)))))

(declare-fun b!240798 () Bool)

(declare-fun lt!121061 () Unit!7409)

(assert (=> b!240798 (= e!156271 lt!121061)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!355 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8099 V!8099 (_ BitVec 64) Int) Unit!7409)

(assert (=> b!240798 (= lt!121061 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!355 (_keys!6563 thiss!1504) (_values!4444 thiss!1504) (mask!10521 thiss!1504) (extraKeys!4198 thiss!1504) (zeroValue!4302 thiss!1504) (minValue!4302 thiss!1504) key!932 (defaultEntry!4461 thiss!1504)))))

(declare-fun c!40099 () Bool)

(assert (=> b!240798 (= c!40099 ((_ is MissingZero!1051) lt!121057))))

(assert (=> b!240798 e!156272))

(declare-fun b!240799 () Bool)

(assert (=> b!240799 (= e!156267 (not call!22391))))

(declare-fun bm!22389 () Bool)

(assert (=> bm!22389 (= call!22392 (inRange!0 (ite c!40099 (index!6374 lt!121057) (index!6377 lt!121057)) (mask!10521 thiss!1504)))))

(declare-fun b!240800 () Bool)

(assert (=> b!240800 (= e!156268 (not false))))

(assert (=> b!240800 lt!121058))

(declare-fun lt!121062 () Unit!7409)

(declare-fun lemmaArrayContainsKeyThenInListMap!150 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8099 V!8099 (_ BitVec 64) (_ BitVec 32) Int) Unit!7409)

(assert (=> b!240800 (= lt!121062 (lemmaArrayContainsKeyThenInListMap!150 (_keys!6563 thiss!1504) (_values!4444 thiss!1504) (mask!10521 thiss!1504) (extraKeys!4198 thiss!1504) (zeroValue!4302 thiss!1504) (minValue!4302 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4461 thiss!1504)))))

(declare-fun b!240801 () Bool)

(assert (=> b!240801 (= e!156277 (not call!22391))))

(declare-fun mapIsEmpty!10740 () Bool)

(assert (=> mapIsEmpty!10740 mapRes!10740))

(assert (= (and start!22974 res!118072) b!240787))

(assert (= (and b!240787 res!118075) b!240797))

(assert (= (and b!240797 res!118077) b!240790))

(assert (= (and b!240790 c!40098) b!240785))

(assert (= (and b!240790 (not c!40098)) b!240798))

(assert (= (and b!240798 c!40099) b!240784))

(assert (= (and b!240798 (not c!40099)) b!240789))

(assert (= (and b!240784 res!118078) b!240796))

(assert (= (and b!240796 res!118079) b!240799))

(assert (= (and b!240789 c!40100) b!240794))

(assert (= (and b!240789 (not c!40100)) b!240793))

(assert (= (and b!240794 res!118073) b!240788))

(assert (= (and b!240788 res!118071) b!240801))

(assert (= (or b!240784 b!240794) bm!22389))

(assert (= (or b!240799 b!240801) bm!22388))

(assert (= (and b!240790 res!118076) b!240783))

(assert (= (and b!240783 res!118074) b!240800))

(assert (= (and b!240795 condMapEmpty!10740) mapIsEmpty!10740))

(assert (= (and b!240795 (not condMapEmpty!10740)) mapNonEmpty!10740))

(assert (= (and mapNonEmpty!10740 ((_ is ValueCellFull!2826) mapValue!10740)) b!240791))

(assert (= (and b!240795 ((_ is ValueCellFull!2826) mapDefault!10740)) b!240786))

(assert (= b!240792 b!240795))

(assert (= start!22974 b!240792))

(declare-fun m!260195 () Bool)

(assert (=> b!240797 m!260195))

(declare-fun m!260197 () Bool)

(assert (=> b!240800 m!260197))

(declare-fun m!260199 () Bool)

(assert (=> b!240798 m!260199))

(declare-fun m!260201 () Bool)

(assert (=> bm!22389 m!260201))

(declare-fun m!260203 () Bool)

(assert (=> b!240783 m!260203))

(declare-fun m!260205 () Bool)

(assert (=> b!240788 m!260205))

(declare-fun m!260207 () Bool)

(assert (=> b!240796 m!260207))

(assert (=> bm!22388 m!260203))

(declare-fun m!260209 () Bool)

(assert (=> b!240790 m!260209))

(declare-fun m!260211 () Bool)

(assert (=> b!240790 m!260211))

(assert (=> b!240790 m!260211))

(declare-fun m!260213 () Bool)

(assert (=> b!240790 m!260213))

(declare-fun m!260215 () Bool)

(assert (=> b!240792 m!260215))

(declare-fun m!260217 () Bool)

(assert (=> b!240792 m!260217))

(declare-fun m!260219 () Bool)

(assert (=> b!240785 m!260219))

(declare-fun m!260221 () Bool)

(assert (=> mapNonEmpty!10740 m!260221))

(declare-fun m!260223 () Bool)

(assert (=> start!22974 m!260223))

(check-sat (not bm!22388) (not b!240797) (not b!240790) (not bm!22389) (not start!22974) (not b!240783) (not b!240792) (not b!240800) (not b!240798) (not mapNonEmpty!10740) (not b!240785) b_and!13443 tp_is_empty!6339 (not b_next!6477))
(check-sat b_and!13443 (not b_next!6477))
