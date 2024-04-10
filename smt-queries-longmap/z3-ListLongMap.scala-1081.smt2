; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22170 () Bool)

(assert start!22170)

(declare-fun b!231794 () Bool)

(declare-fun b_free!6237 () Bool)

(declare-fun b_next!6237 () Bool)

(assert (=> b!231794 (= b_free!6237 (not b_next!6237))))

(declare-fun tp!21853 () Bool)

(declare-fun b_and!13135 () Bool)

(assert (=> b!231794 (= tp!21853 b_and!13135)))

(declare-fun b!231780 () Bool)

(declare-fun e!150484 () Bool)

(declare-fun tp_is_empty!6099 () Bool)

(assert (=> b!231780 (= e!150484 tp_is_empty!6099)))

(declare-fun b!231781 () Bool)

(declare-fun e!150485 () Bool)

(declare-datatypes ((SeekEntryResult!956 0))(
  ( (MissingZero!956 (index!5994 (_ BitVec 32))) (Found!956 (index!5995 (_ BitVec 32))) (Intermediate!956 (undefined!1768 Bool) (index!5996 (_ BitVec 32)) (x!23520 (_ BitVec 32))) (Undefined!956) (MissingVacant!956 (index!5997 (_ BitVec 32))) )
))
(declare-fun lt!116909 () SeekEntryResult!956)

(get-info :version)

(assert (=> b!231781 (= e!150485 ((_ is Undefined!956) lt!116909))))

(declare-fun b!231782 () Bool)

(declare-fun res!113875 () Bool)

(declare-fun e!150492 () Bool)

(assert (=> b!231782 (=> (not res!113875) (not e!150492))))

(declare-datatypes ((V!7779 0))(
  ( (V!7780 (val!3094 Int)) )
))
(declare-datatypes ((ValueCell!2706 0))(
  ( (ValueCellFull!2706 (v!5114 V!7779)) (EmptyCell!2706) )
))
(declare-datatypes ((array!11441 0))(
  ( (array!11442 (arr!5440 (Array (_ BitVec 32) ValueCell!2706)) (size!5773 (_ BitVec 32))) )
))
(declare-datatypes ((array!11443 0))(
  ( (array!11444 (arr!5441 (Array (_ BitVec 32) (_ BitVec 64))) (size!5774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3312 0))(
  ( (LongMapFixedSize!3313 (defaultEntry!4315 Int) (mask!10221 (_ BitVec 32)) (extraKeys!4052 (_ BitVec 32)) (zeroValue!4156 V!7779) (minValue!4156 V!7779) (_size!1705 (_ BitVec 32)) (_keys!6369 array!11443) (_values!4298 array!11441) (_vacant!1705 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3312)

(assert (=> b!231782 (= res!113875 (= (select (arr!5441 (_keys!6369 thiss!1504)) (index!5994 lt!116909)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231783 () Bool)

(declare-datatypes ((Unit!7138 0))(
  ( (Unit!7139) )
))
(declare-fun e!150494 () Unit!7138)

(declare-fun Unit!7140 () Unit!7138)

(assert (=> b!231783 (= e!150494 Unit!7140)))

(declare-fun lt!116910 () Unit!7138)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!303 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7779 V!7779 (_ BitVec 64) Int) Unit!7138)

(assert (=> b!231783 (= lt!116910 (lemmaInListMapThenSeekEntryOrOpenFindsIt!303 (_keys!6369 thiss!1504) (_values!4298 thiss!1504) (mask!10221 thiss!1504) (extraKeys!4052 thiss!1504) (zeroValue!4156 thiss!1504) (minValue!4156 thiss!1504) key!932 (defaultEntry!4315 thiss!1504)))))

(assert (=> b!231783 false))

(declare-fun b!231784 () Bool)

(declare-fun e!150487 () Unit!7138)

(declare-fun Unit!7141 () Unit!7138)

(assert (=> b!231784 (= e!150487 Unit!7141)))

(declare-fun mapNonEmpty!10318 () Bool)

(declare-fun mapRes!10318 () Bool)

(declare-fun tp!21852 () Bool)

(declare-fun e!150486 () Bool)

(assert (=> mapNonEmpty!10318 (= mapRes!10318 (and tp!21852 e!150486))))

(declare-fun mapValue!10318 () ValueCell!2706)

(declare-fun mapRest!10318 () (Array (_ BitVec 32) ValueCell!2706))

(declare-fun mapKey!10318 () (_ BitVec 32))

(assert (=> mapNonEmpty!10318 (= (arr!5440 (_values!4298 thiss!1504)) (store mapRest!10318 mapKey!10318 mapValue!10318))))

(declare-fun res!113878 () Bool)

(declare-fun e!150493 () Bool)

(assert (=> start!22170 (=> (not res!113878) (not e!150493))))

(declare-fun valid!1313 (LongMapFixedSize!3312) Bool)

(assert (=> start!22170 (= res!113878 (valid!1313 thiss!1504))))

(assert (=> start!22170 e!150493))

(declare-fun e!150489 () Bool)

(assert (=> start!22170 e!150489))

(assert (=> start!22170 true))

(assert (=> start!22170 tp_is_empty!6099))

(declare-fun mapIsEmpty!10318 () Bool)

(assert (=> mapIsEmpty!10318 mapRes!10318))

(declare-fun b!231785 () Bool)

(declare-fun call!21546 () Bool)

(assert (=> b!231785 (= e!150492 (not call!21546))))

(declare-fun b!231786 () Bool)

(declare-fun e!150481 () Bool)

(assert (=> b!231786 (= e!150481 (not true))))

(declare-fun lt!116905 () array!11443)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11443 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231786 (= (arrayCountValidKeys!0 lt!116905 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116907 () Unit!7138)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11443 (_ BitVec 32)) Unit!7138)

(assert (=> b!231786 (= lt!116907 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116905 index!297))))

(declare-fun arrayContainsKey!0 (array!11443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231786 (arrayContainsKey!0 lt!116905 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116916 () Unit!7138)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11443 (_ BitVec 64) (_ BitVec 32)) Unit!7138)

(assert (=> b!231786 (= lt!116916 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116905 key!932 index!297))))

(declare-datatypes ((tuple2!4566 0))(
  ( (tuple2!4567 (_1!2294 (_ BitVec 64)) (_2!2294 V!7779)) )
))
(declare-datatypes ((List!3484 0))(
  ( (Nil!3481) (Cons!3480 (h!4128 tuple2!4566) (t!8443 List!3484)) )
))
(declare-datatypes ((ListLongMap!3479 0))(
  ( (ListLongMap!3480 (toList!1755 List!3484)) )
))
(declare-fun lt!116911 () ListLongMap!3479)

(declare-fun v!346 () V!7779)

(declare-fun +!618 (ListLongMap!3479 tuple2!4566) ListLongMap!3479)

(declare-fun getCurrentListMap!1283 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7779 V!7779 (_ BitVec 32) Int) ListLongMap!3479)

(assert (=> b!231786 (= (+!618 lt!116911 (tuple2!4567 key!932 v!346)) (getCurrentListMap!1283 lt!116905 (array!11442 (store (arr!5440 (_values!4298 thiss!1504)) index!297 (ValueCellFull!2706 v!346)) (size!5773 (_values!4298 thiss!1504))) (mask!10221 thiss!1504) (extraKeys!4052 thiss!1504) (zeroValue!4156 thiss!1504) (minValue!4156 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4315 thiss!1504)))))

(declare-fun lt!116908 () Unit!7138)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!72 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7779 V!7779 (_ BitVec 32) (_ BitVec 64) V!7779 Int) Unit!7138)

(assert (=> b!231786 (= lt!116908 (lemmaAddValidKeyToArrayThenAddPairToListMap!72 (_keys!6369 thiss!1504) (_values!4298 thiss!1504) (mask!10221 thiss!1504) (extraKeys!4052 thiss!1504) (zeroValue!4156 thiss!1504) (minValue!4156 thiss!1504) index!297 key!932 v!346 (defaultEntry!4315 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11443 (_ BitVec 32)) Bool)

(assert (=> b!231786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116905 (mask!10221 thiss!1504))))

(declare-fun lt!116914 () Unit!7138)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11443 (_ BitVec 32) (_ BitVec 32)) Unit!7138)

(assert (=> b!231786 (= lt!116914 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6369 thiss!1504) index!297 (mask!10221 thiss!1504)))))

(assert (=> b!231786 (= (arrayCountValidKeys!0 lt!116905 #b00000000000000000000000000000000 (size!5774 (_keys!6369 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6369 thiss!1504) #b00000000000000000000000000000000 (size!5774 (_keys!6369 thiss!1504)))))))

(declare-fun lt!116917 () Unit!7138)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11443 (_ BitVec 32) (_ BitVec 64)) Unit!7138)

(assert (=> b!231786 (= lt!116917 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6369 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3485 0))(
  ( (Nil!3482) (Cons!3481 (h!4129 (_ BitVec 64)) (t!8444 List!3485)) )
))
(declare-fun arrayNoDuplicates!0 (array!11443 (_ BitVec 32) List!3485) Bool)

(assert (=> b!231786 (arrayNoDuplicates!0 lt!116905 #b00000000000000000000000000000000 Nil!3482)))

(assert (=> b!231786 (= lt!116905 (array!11444 (store (arr!5441 (_keys!6369 thiss!1504)) index!297 key!932) (size!5774 (_keys!6369 thiss!1504))))))

(declare-fun lt!116906 () Unit!7138)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11443 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3485) Unit!7138)

(assert (=> b!231786 (= lt!116906 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6369 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3482))))

(declare-fun lt!116912 () Unit!7138)

(assert (=> b!231786 (= lt!116912 e!150487)))

(declare-fun c!38518 () Bool)

(assert (=> b!231786 (= c!38518 (arrayContainsKey!0 (_keys!6369 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231787 () Bool)

(declare-fun c!38517 () Bool)

(assert (=> b!231787 (= c!38517 ((_ is MissingVacant!956) lt!116909))))

(declare-fun e!150483 () Bool)

(assert (=> b!231787 (= e!150483 e!150485)))

(declare-fun b!231788 () Bool)

(declare-fun e!150491 () Bool)

(assert (=> b!231788 (= e!150493 e!150491)))

(declare-fun res!113874 () Bool)

(assert (=> b!231788 (=> (not res!113874) (not e!150491))))

(assert (=> b!231788 (= res!113874 (or (= lt!116909 (MissingZero!956 index!297)) (= lt!116909 (MissingVacant!956 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11443 (_ BitVec 32)) SeekEntryResult!956)

(assert (=> b!231788 (= lt!116909 (seekEntryOrOpen!0 key!932 (_keys!6369 thiss!1504) (mask!10221 thiss!1504)))))

(declare-fun b!231789 () Bool)

(assert (=> b!231789 (= e!150491 e!150481)))

(declare-fun res!113876 () Bool)

(assert (=> b!231789 (=> (not res!113876) (not e!150481))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231789 (= res!113876 (inRange!0 index!297 (mask!10221 thiss!1504)))))

(declare-fun lt!116913 () Unit!7138)

(assert (=> b!231789 (= lt!116913 e!150494)))

(declare-fun c!38519 () Bool)

(declare-fun contains!1624 (ListLongMap!3479 (_ BitVec 64)) Bool)

(assert (=> b!231789 (= c!38519 (contains!1624 lt!116911 key!932))))

(assert (=> b!231789 (= lt!116911 (getCurrentListMap!1283 (_keys!6369 thiss!1504) (_values!4298 thiss!1504) (mask!10221 thiss!1504) (extraKeys!4052 thiss!1504) (zeroValue!4156 thiss!1504) (minValue!4156 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4315 thiss!1504)))))

(declare-fun bm!21542 () Bool)

(assert (=> bm!21542 (= call!21546 (arrayContainsKey!0 (_keys!6369 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231790 () Bool)

(assert (=> b!231790 (= e!150486 tp_is_empty!6099)))

(declare-fun b!231791 () Bool)

(declare-fun Unit!7142 () Unit!7138)

(assert (=> b!231791 (= e!150487 Unit!7142)))

(declare-fun lt!116918 () Unit!7138)

(declare-fun lemmaArrayContainsKeyThenInListMap!139 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7779 V!7779 (_ BitVec 64) (_ BitVec 32) Int) Unit!7138)

(assert (=> b!231791 (= lt!116918 (lemmaArrayContainsKeyThenInListMap!139 (_keys!6369 thiss!1504) (_values!4298 thiss!1504) (mask!10221 thiss!1504) (extraKeys!4052 thiss!1504) (zeroValue!4156 thiss!1504) (minValue!4156 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4315 thiss!1504)))))

(assert (=> b!231791 false))

(declare-fun b!231792 () Bool)

(declare-fun e!150482 () Bool)

(assert (=> b!231792 (= e!150482 (and e!150484 mapRes!10318))))

(declare-fun condMapEmpty!10318 () Bool)

(declare-fun mapDefault!10318 () ValueCell!2706)

(assert (=> b!231792 (= condMapEmpty!10318 (= (arr!5440 (_values!4298 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2706)) mapDefault!10318)))))

(declare-fun b!231793 () Bool)

(declare-fun e!150488 () Bool)

(assert (=> b!231793 (= e!150485 e!150488)))

(declare-fun res!113881 () Bool)

(declare-fun call!21545 () Bool)

(assert (=> b!231793 (= res!113881 call!21545)))

(assert (=> b!231793 (=> (not res!113881) (not e!150488))))

(declare-fun array_inv!3585 (array!11443) Bool)

(declare-fun array_inv!3586 (array!11441) Bool)

(assert (=> b!231794 (= e!150489 (and tp!21853 tp_is_empty!6099 (array_inv!3585 (_keys!6369 thiss!1504)) (array_inv!3586 (_values!4298 thiss!1504)) e!150482))))

(declare-fun b!231795 () Bool)

(declare-fun lt!116915 () Unit!7138)

(assert (=> b!231795 (= e!150494 lt!116915)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!321 (array!11443 array!11441 (_ BitVec 32) (_ BitVec 32) V!7779 V!7779 (_ BitVec 64) Int) Unit!7138)

(assert (=> b!231795 (= lt!116915 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!321 (_keys!6369 thiss!1504) (_values!4298 thiss!1504) (mask!10221 thiss!1504) (extraKeys!4052 thiss!1504) (zeroValue!4156 thiss!1504) (minValue!4156 thiss!1504) key!932 (defaultEntry!4315 thiss!1504)))))

(declare-fun c!38520 () Bool)

(assert (=> b!231795 (= c!38520 ((_ is MissingZero!956) lt!116909))))

(assert (=> b!231795 e!150483))

(declare-fun b!231796 () Bool)

(assert (=> b!231796 (= e!150488 (not call!21546))))

(declare-fun b!231797 () Bool)

(declare-fun res!113880 () Bool)

(assert (=> b!231797 (= res!113880 (= (select (arr!5441 (_keys!6369 thiss!1504)) (index!5997 lt!116909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231797 (=> (not res!113880) (not e!150488))))

(declare-fun b!231798 () Bool)

(declare-fun res!113877 () Bool)

(assert (=> b!231798 (=> (not res!113877) (not e!150493))))

(assert (=> b!231798 (= res!113877 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21543 () Bool)

(assert (=> bm!21543 (= call!21545 (inRange!0 (ite c!38520 (index!5994 lt!116909) (index!5997 lt!116909)) (mask!10221 thiss!1504)))))

(declare-fun b!231799 () Bool)

(declare-fun res!113879 () Bool)

(assert (=> b!231799 (=> (not res!113879) (not e!150492))))

(assert (=> b!231799 (= res!113879 call!21545)))

(assert (=> b!231799 (= e!150483 e!150492)))

(assert (= (and start!22170 res!113878) b!231798))

(assert (= (and b!231798 res!113877) b!231788))

(assert (= (and b!231788 res!113874) b!231789))

(assert (= (and b!231789 c!38519) b!231783))

(assert (= (and b!231789 (not c!38519)) b!231795))

(assert (= (and b!231795 c!38520) b!231799))

(assert (= (and b!231795 (not c!38520)) b!231787))

(assert (= (and b!231799 res!113879) b!231782))

(assert (= (and b!231782 res!113875) b!231785))

(assert (= (and b!231787 c!38517) b!231793))

(assert (= (and b!231787 (not c!38517)) b!231781))

(assert (= (and b!231793 res!113881) b!231797))

(assert (= (and b!231797 res!113880) b!231796))

(assert (= (or b!231799 b!231793) bm!21543))

(assert (= (or b!231785 b!231796) bm!21542))

(assert (= (and b!231789 res!113876) b!231786))

(assert (= (and b!231786 c!38518) b!231791))

(assert (= (and b!231786 (not c!38518)) b!231784))

(assert (= (and b!231792 condMapEmpty!10318) mapIsEmpty!10318))

(assert (= (and b!231792 (not condMapEmpty!10318)) mapNonEmpty!10318))

(assert (= (and mapNonEmpty!10318 ((_ is ValueCellFull!2706) mapValue!10318)) b!231790))

(assert (= (and b!231792 ((_ is ValueCellFull!2706) mapDefault!10318)) b!231780))

(assert (= b!231794 b!231792))

(assert (= start!22170 b!231794))

(declare-fun m!253183 () Bool)

(assert (=> start!22170 m!253183))

(declare-fun m!253185 () Bool)

(assert (=> b!231788 m!253185))

(declare-fun m!253187 () Bool)

(assert (=> b!231797 m!253187))

(declare-fun m!253189 () Bool)

(assert (=> b!231795 m!253189))

(declare-fun m!253191 () Bool)

(assert (=> bm!21542 m!253191))

(declare-fun m!253193 () Bool)

(assert (=> mapNonEmpty!10318 m!253193))

(declare-fun m!253195 () Bool)

(assert (=> bm!21543 m!253195))

(declare-fun m!253197 () Bool)

(assert (=> b!231789 m!253197))

(declare-fun m!253199 () Bool)

(assert (=> b!231789 m!253199))

(declare-fun m!253201 () Bool)

(assert (=> b!231789 m!253201))

(declare-fun m!253203 () Bool)

(assert (=> b!231786 m!253203))

(assert (=> b!231786 m!253191))

(declare-fun m!253205 () Bool)

(assert (=> b!231786 m!253205))

(declare-fun m!253207 () Bool)

(assert (=> b!231786 m!253207))

(declare-fun m!253209 () Bool)

(assert (=> b!231786 m!253209))

(declare-fun m!253211 () Bool)

(assert (=> b!231786 m!253211))

(declare-fun m!253213 () Bool)

(assert (=> b!231786 m!253213))

(declare-fun m!253215 () Bool)

(assert (=> b!231786 m!253215))

(declare-fun m!253217 () Bool)

(assert (=> b!231786 m!253217))

(declare-fun m!253219 () Bool)

(assert (=> b!231786 m!253219))

(declare-fun m!253221 () Bool)

(assert (=> b!231786 m!253221))

(declare-fun m!253223 () Bool)

(assert (=> b!231786 m!253223))

(declare-fun m!253225 () Bool)

(assert (=> b!231786 m!253225))

(declare-fun m!253227 () Bool)

(assert (=> b!231786 m!253227))

(declare-fun m!253229 () Bool)

(assert (=> b!231786 m!253229))

(declare-fun m!253231 () Bool)

(assert (=> b!231786 m!253231))

(declare-fun m!253233 () Bool)

(assert (=> b!231786 m!253233))

(declare-fun m!253235 () Bool)

(assert (=> b!231782 m!253235))

(declare-fun m!253237 () Bool)

(assert (=> b!231791 m!253237))

(declare-fun m!253239 () Bool)

(assert (=> b!231794 m!253239))

(declare-fun m!253241 () Bool)

(assert (=> b!231794 m!253241))

(declare-fun m!253243 () Bool)

(assert (=> b!231783 m!253243))

(check-sat (not start!22170) tp_is_empty!6099 (not b!231795) (not mapNonEmpty!10318) b_and!13135 (not b!231789) (not bm!21542) (not b!231788) (not b_next!6237) (not b!231791) (not b!231783) (not bm!21543) (not b!231794) (not b!231786))
(check-sat b_and!13135 (not b_next!6237))
