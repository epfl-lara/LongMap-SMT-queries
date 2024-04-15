; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24100 () Bool)

(assert start!24100)

(declare-fun b!251857 () Bool)

(declare-fun b_free!6643 () Bool)

(declare-fun b_next!6643 () Bool)

(assert (=> b!251857 (= b_free!6643 (not b_next!6643))))

(declare-fun tp!23204 () Bool)

(declare-fun b_and!13651 () Bool)

(assert (=> b!251857 (= tp!23204 b_and!13651)))

(declare-fun b!251838 () Bool)

(declare-fun e!163312 () Bool)

(declare-fun tp_is_empty!6505 () Bool)

(assert (=> b!251838 (= e!163312 tp_is_empty!6505)))

(declare-fun b!251839 () Bool)

(declare-datatypes ((Unit!7773 0))(
  ( (Unit!7774) )
))
(declare-fun e!163306 () Unit!7773)

(declare-fun Unit!7775 () Unit!7773)

(assert (=> b!251839 (= e!163306 Unit!7775)))

(declare-fun lt!126125 () Unit!7773)

(declare-datatypes ((V!8321 0))(
  ( (V!8322 (val!3297 Int)) )
))
(declare-datatypes ((ValueCell!2909 0))(
  ( (ValueCellFull!2909 (v!5361 V!8321)) (EmptyCell!2909) )
))
(declare-datatypes ((array!12325 0))(
  ( (array!12326 (arr!5841 (Array (_ BitVec 32) ValueCell!2909)) (size!6189 (_ BitVec 32))) )
))
(declare-datatypes ((array!12327 0))(
  ( (array!12328 (arr!5842 (Array (_ BitVec 32) (_ BitVec 64))) (size!6190 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3718 0))(
  ( (LongMapFixedSize!3719 (defaultEntry!4656 Int) (mask!10867 (_ BitVec 32)) (extraKeys!4393 (_ BitVec 32)) (zeroValue!4497 V!8321) (minValue!4497 V!8321) (_size!1908 (_ BitVec 32)) (_keys!6801 array!12327) (_values!4639 array!12325) (_vacant!1908 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3718)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (array!12327 array!12325 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7773)

(assert (=> b!251839 (= lt!126125 (lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(assert (=> b!251839 false))

(declare-fun b!251840 () Bool)

(declare-fun lt!126121 () Unit!7773)

(assert (=> b!251840 (= e!163306 lt!126121)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!403 (array!12327 array!12325 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7773)

(assert (=> b!251840 (= lt!126121 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!403 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(declare-fun c!42415 () Bool)

(declare-datatypes ((SeekEntryResult!1128 0))(
  ( (MissingZero!1128 (index!6682 (_ BitVec 32))) (Found!1128 (index!6683 (_ BitVec 32))) (Intermediate!1128 (undefined!1940 Bool) (index!6684 (_ BitVec 32)) (x!24747 (_ BitVec 32))) (Undefined!1128) (MissingVacant!1128 (index!6685 (_ BitVec 32))) )
))
(declare-fun lt!126118 () SeekEntryResult!1128)

(get-info :version)

(assert (=> b!251840 (= c!42415 ((_ is MissingZero!1128) lt!126118))))

(declare-fun e!163303 () Bool)

(assert (=> b!251840 e!163303))

(declare-fun b!251841 () Bool)

(declare-fun res!123265 () Bool)

(declare-fun e!163310 () Bool)

(assert (=> b!251841 (=> (not res!123265) (not e!163310))))

(assert (=> b!251841 (= res!123265 (= (select (arr!5842 (_keys!6801 thiss!1504)) (index!6682 lt!126118)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251842 () Bool)

(declare-fun res!123264 () Bool)

(declare-fun e!163311 () Bool)

(assert (=> b!251842 (=> (not res!123264) (not e!163311))))

(assert (=> b!251842 (= res!123264 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251843 () Bool)

(declare-fun e!163314 () Unit!7773)

(declare-fun Unit!7776 () Unit!7773)

(assert (=> b!251843 (= e!163314 Unit!7776)))

(declare-fun bm!23692 () Bool)

(declare-fun call!23695 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23692 (= call!23695 (inRange!0 (ite c!42415 (index!6682 lt!126118) (index!6685 lt!126118)) (mask!10867 thiss!1504)))))

(declare-fun b!251844 () Bool)

(declare-fun e!163305 () Bool)

(declare-fun e!163309 () Bool)

(assert (=> b!251844 (= e!163305 e!163309)))

(declare-fun res!123267 () Bool)

(assert (=> b!251844 (=> (not res!123267) (not e!163309))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!251844 (= res!123267 (inRange!0 index!297 (mask!10867 thiss!1504)))))

(declare-fun lt!126117 () Unit!7773)

(assert (=> b!251844 (= lt!126117 e!163306)))

(declare-fun c!42416 () Bool)

(declare-datatypes ((tuple2!4818 0))(
  ( (tuple2!4819 (_1!2420 (_ BitVec 64)) (_2!2420 V!8321)) )
))
(declare-datatypes ((List!3718 0))(
  ( (Nil!3715) (Cons!3714 (h!4376 tuple2!4818) (t!8748 List!3718)) )
))
(declare-datatypes ((ListLongMap!3721 0))(
  ( (ListLongMap!3722 (toList!1876 List!3718)) )
))
(declare-fun contains!1807 (ListLongMap!3721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1385 (array!12327 array!12325 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 32) Int) ListLongMap!3721)

(assert (=> b!251844 (= c!42416 (contains!1807 (getCurrentListMap!1385 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) key!932))))

(declare-fun b!251845 () Bool)

(declare-fun e!163308 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12327 (_ BitVec 32)) Bool)

(assert (=> b!251845 (= e!163308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)))))

(declare-fun b!251846 () Bool)

(declare-fun call!23696 () Bool)

(assert (=> b!251846 (= e!163310 (not call!23696))))

(declare-fun mapIsEmpty!11061 () Bool)

(declare-fun mapRes!11061 () Bool)

(assert (=> mapIsEmpty!11061 mapRes!11061))

(declare-fun bm!23693 () Bool)

(declare-fun arrayContainsKey!0 (array!12327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23693 (= call!23696 (arrayContainsKey!0 (_keys!6801 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251847 () Bool)

(declare-fun e!163316 () Bool)

(assert (=> b!251847 (= e!163316 ((_ is Undefined!1128) lt!126118))))

(declare-fun b!251848 () Bool)

(declare-fun res!123266 () Bool)

(assert (=> b!251848 (= res!123266 (= (select (arr!5842 (_keys!6801 thiss!1504)) (index!6685 lt!126118)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163304 () Bool)

(assert (=> b!251848 (=> (not res!123266) (not e!163304))))

(declare-fun b!251849 () Bool)

(declare-fun c!42414 () Bool)

(assert (=> b!251849 (= c!42414 ((_ is MissingVacant!1128) lt!126118))))

(assert (=> b!251849 (= e!163303 e!163316)))

(declare-fun b!251850 () Bool)

(declare-fun res!123269 () Bool)

(assert (=> b!251850 (=> (not res!123269) (not e!163310))))

(assert (=> b!251850 (= res!123269 call!23695)))

(assert (=> b!251850 (= e!163303 e!163310)))

(declare-fun b!251851 () Bool)

(declare-fun res!123261 () Bool)

(assert (=> b!251851 (=> res!123261 e!163308)))

(assert (=> b!251851 (= res!123261 (or (not (= (size!6189 (_values!4639 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10867 thiss!1504)))) (not (= (size!6190 (_keys!6801 thiss!1504)) (size!6189 (_values!4639 thiss!1504)))) (bvslt (mask!10867 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4393 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4393 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!123268 () Bool)

(assert (=> start!24100 (=> (not res!123268) (not e!163311))))

(declare-fun valid!1457 (LongMapFixedSize!3718) Bool)

(assert (=> start!24100 (= res!123268 (valid!1457 thiss!1504))))

(assert (=> start!24100 e!163311))

(declare-fun e!163313 () Bool)

(assert (=> start!24100 e!163313))

(assert (=> start!24100 true))

(declare-fun mapNonEmpty!11061 () Bool)

(declare-fun tp!23205 () Bool)

(declare-fun e!163307 () Bool)

(assert (=> mapNonEmpty!11061 (= mapRes!11061 (and tp!23205 e!163307))))

(declare-fun mapValue!11061 () ValueCell!2909)

(declare-fun mapRest!11061 () (Array (_ BitVec 32) ValueCell!2909))

(declare-fun mapKey!11061 () (_ BitVec 32))

(assert (=> mapNonEmpty!11061 (= (arr!5841 (_values!4639 thiss!1504)) (store mapRest!11061 mapKey!11061 mapValue!11061))))

(declare-fun b!251852 () Bool)

(assert (=> b!251852 (= e!163311 e!163305)))

(declare-fun res!123260 () Bool)

(assert (=> b!251852 (=> (not res!123260) (not e!163305))))

(assert (=> b!251852 (= res!123260 (or (= lt!126118 (MissingZero!1128 index!297)) (= lt!126118 (MissingVacant!1128 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12327 (_ BitVec 32)) SeekEntryResult!1128)

(assert (=> b!251852 (= lt!126118 (seekEntryOrOpen!0 key!932 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)))))

(declare-fun b!251853 () Bool)

(declare-fun e!163315 () Bool)

(assert (=> b!251853 (= e!163315 (and e!163312 mapRes!11061))))

(declare-fun condMapEmpty!11061 () Bool)

(declare-fun mapDefault!11061 () ValueCell!2909)

(assert (=> b!251853 (= condMapEmpty!11061 (= (arr!5841 (_values!4639 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2909)) mapDefault!11061)))))

(declare-fun b!251854 () Bool)

(declare-fun Unit!7777 () Unit!7773)

(assert (=> b!251854 (= e!163314 Unit!7777)))

(declare-fun lt!126119 () Unit!7773)

(declare-fun lemmaArrayContainsKeyThenInListMap!213 (array!12327 array!12325 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) (_ BitVec 32) Int) Unit!7773)

(assert (=> b!251854 (= lt!126119 (lemmaArrayContainsKeyThenInListMap!213 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(assert (=> b!251854 false))

(declare-fun b!251855 () Bool)

(assert (=> b!251855 (= e!163307 tp_is_empty!6505)))

(declare-fun b!251856 () Bool)

(assert (=> b!251856 (= e!163309 (not e!163308))))

(declare-fun res!123263 () Bool)

(assert (=> b!251856 (=> res!123263 e!163308)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!251856 (= res!123263 (not (validMask!0 (mask!10867 thiss!1504))))))

(declare-fun lt!126120 () array!12327)

(assert (=> b!251856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126120 (mask!10867 thiss!1504))))

(declare-fun lt!126124 () Unit!7773)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12327 (_ BitVec 32) (_ BitVec 32)) Unit!7773)

(assert (=> b!251856 (= lt!126124 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6801 thiss!1504) index!297 (mask!10867 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12327 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251856 (= (arrayCountValidKeys!0 lt!126120 #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6801 thiss!1504) #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504)))))))

(declare-fun lt!126122 () Unit!7773)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12327 (_ BitVec 32) (_ BitVec 64)) Unit!7773)

(assert (=> b!251856 (= lt!126122 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6801 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3719 0))(
  ( (Nil!3716) (Cons!3715 (h!4377 (_ BitVec 64)) (t!8749 List!3719)) )
))
(declare-fun arrayNoDuplicates!0 (array!12327 (_ BitVec 32) List!3719) Bool)

(assert (=> b!251856 (arrayNoDuplicates!0 lt!126120 #b00000000000000000000000000000000 Nil!3716)))

(assert (=> b!251856 (= lt!126120 (array!12328 (store (arr!5842 (_keys!6801 thiss!1504)) index!297 key!932) (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun lt!126123 () Unit!7773)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12327 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3719) Unit!7773)

(assert (=> b!251856 (= lt!126123 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6801 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3716))))

(declare-fun lt!126126 () Unit!7773)

(assert (=> b!251856 (= lt!126126 e!163314)))

(declare-fun c!42417 () Bool)

(assert (=> b!251856 (= c!42417 (arrayContainsKey!0 (_keys!6801 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3853 (array!12327) Bool)

(declare-fun array_inv!3854 (array!12325) Bool)

(assert (=> b!251857 (= e!163313 (and tp!23204 tp_is_empty!6505 (array_inv!3853 (_keys!6801 thiss!1504)) (array_inv!3854 (_values!4639 thiss!1504)) e!163315))))

(declare-fun b!251858 () Bool)

(assert (=> b!251858 (= e!163316 e!163304)))

(declare-fun res!123262 () Bool)

(assert (=> b!251858 (= res!123262 call!23695)))

(assert (=> b!251858 (=> (not res!123262) (not e!163304))))

(declare-fun b!251859 () Bool)

(assert (=> b!251859 (= e!163304 (not call!23696))))

(assert (= (and start!24100 res!123268) b!251842))

(assert (= (and b!251842 res!123264) b!251852))

(assert (= (and b!251852 res!123260) b!251844))

(assert (= (and b!251844 c!42416) b!251839))

(assert (= (and b!251844 (not c!42416)) b!251840))

(assert (= (and b!251840 c!42415) b!251850))

(assert (= (and b!251840 (not c!42415)) b!251849))

(assert (= (and b!251850 res!123269) b!251841))

(assert (= (and b!251841 res!123265) b!251846))

(assert (= (and b!251849 c!42414) b!251858))

(assert (= (and b!251849 (not c!42414)) b!251847))

(assert (= (and b!251858 res!123262) b!251848))

(assert (= (and b!251848 res!123266) b!251859))

(assert (= (or b!251850 b!251858) bm!23692))

(assert (= (or b!251846 b!251859) bm!23693))

(assert (= (and b!251844 res!123267) b!251856))

(assert (= (and b!251856 c!42417) b!251854))

(assert (= (and b!251856 (not c!42417)) b!251843))

(assert (= (and b!251856 (not res!123263)) b!251851))

(assert (= (and b!251851 (not res!123261)) b!251845))

(assert (= (and b!251853 condMapEmpty!11061) mapIsEmpty!11061))

(assert (= (and b!251853 (not condMapEmpty!11061)) mapNonEmpty!11061))

(assert (= (and mapNonEmpty!11061 ((_ is ValueCellFull!2909) mapValue!11061)) b!251855))

(assert (= (and b!251853 ((_ is ValueCellFull!2909) mapDefault!11061)) b!251838))

(assert (= b!251857 b!251853))

(assert (= start!24100 b!251857))

(declare-fun m!267613 () Bool)

(assert (=> mapNonEmpty!11061 m!267613))

(declare-fun m!267615 () Bool)

(assert (=> start!24100 m!267615))

(declare-fun m!267617 () Bool)

(assert (=> b!251848 m!267617))

(declare-fun m!267619 () Bool)

(assert (=> b!251845 m!267619))

(declare-fun m!267621 () Bool)

(assert (=> bm!23692 m!267621))

(declare-fun m!267623 () Bool)

(assert (=> b!251857 m!267623))

(declare-fun m!267625 () Bool)

(assert (=> b!251857 m!267625))

(declare-fun m!267627 () Bool)

(assert (=> b!251844 m!267627))

(declare-fun m!267629 () Bool)

(assert (=> b!251844 m!267629))

(assert (=> b!251844 m!267629))

(declare-fun m!267631 () Bool)

(assert (=> b!251844 m!267631))

(declare-fun m!267633 () Bool)

(assert (=> b!251856 m!267633))

(declare-fun m!267635 () Bool)

(assert (=> b!251856 m!267635))

(declare-fun m!267637 () Bool)

(assert (=> b!251856 m!267637))

(declare-fun m!267639 () Bool)

(assert (=> b!251856 m!267639))

(declare-fun m!267641 () Bool)

(assert (=> b!251856 m!267641))

(declare-fun m!267643 () Bool)

(assert (=> b!251856 m!267643))

(declare-fun m!267645 () Bool)

(assert (=> b!251856 m!267645))

(declare-fun m!267647 () Bool)

(assert (=> b!251856 m!267647))

(declare-fun m!267649 () Bool)

(assert (=> b!251856 m!267649))

(declare-fun m!267651 () Bool)

(assert (=> b!251856 m!267651))

(declare-fun m!267653 () Bool)

(assert (=> b!251854 m!267653))

(declare-fun m!267655 () Bool)

(assert (=> b!251841 m!267655))

(assert (=> bm!23693 m!267635))

(declare-fun m!267657 () Bool)

(assert (=> b!251852 m!267657))

(declare-fun m!267659 () Bool)

(assert (=> b!251840 m!267659))

(declare-fun m!267661 () Bool)

(assert (=> b!251839 m!267661))

(check-sat b_and!13651 (not mapNonEmpty!11061) (not b!251844) (not b_next!6643) (not bm!23693) (not start!24100) (not b!251856) (not b!251857) (not b!251845) (not b!251854) (not b!251840) tp_is_empty!6505 (not bm!23692) (not b!251852) (not b!251839))
(check-sat b_and!13651 (not b_next!6643))
(get-model)

(declare-fun b!252008 () Bool)

(declare-fun e!163419 () Bool)

(declare-fun lt!126191 () SeekEntryResult!1128)

(assert (=> b!252008 (= e!163419 ((_ is Undefined!1128) lt!126191))))

(declare-fun bm!23710 () Bool)

(declare-fun call!23714 () Bool)

(assert (=> bm!23710 (= call!23714 (arrayContainsKey!0 (_keys!6801 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252009 () Bool)

(declare-fun res!123338 () Bool)

(declare-fun e!163416 () Bool)

(assert (=> b!252009 (=> (not res!123338) (not e!163416))))

(declare-fun call!23713 () Bool)

(assert (=> b!252009 (= res!123338 call!23713)))

(assert (=> b!252009 (= e!163419 e!163416)))

(declare-fun b!252010 () Bool)

(assert (=> b!252010 (= e!163416 (not call!23714))))

(declare-fun d!61145 () Bool)

(declare-fun e!163417 () Bool)

(assert (=> d!61145 e!163417))

(declare-fun c!42446 () Bool)

(assert (=> d!61145 (= c!42446 ((_ is MissingZero!1128) lt!126191))))

(assert (=> d!61145 (= lt!126191 (seekEntryOrOpen!0 key!932 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)))))

(declare-fun lt!126192 () Unit!7773)

(declare-fun choose!1207 (array!12327 array!12325 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7773)

(assert (=> d!61145 (= lt!126192 (choose!1207 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(assert (=> d!61145 (validMask!0 (mask!10867 thiss!1504))))

(assert (=> d!61145 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!403 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)) lt!126192)))

(declare-fun b!252011 () Bool)

(assert (=> b!252011 (= e!163417 e!163419)))

(declare-fun c!42447 () Bool)

(assert (=> b!252011 (= c!42447 ((_ is MissingVacant!1128) lt!126191))))

(declare-fun b!252012 () Bool)

(declare-fun e!163418 () Bool)

(assert (=> b!252012 (= e!163417 e!163418)))

(declare-fun res!123341 () Bool)

(assert (=> b!252012 (= res!123341 call!23713)))

(assert (=> b!252012 (=> (not res!123341) (not e!163418))))

(declare-fun b!252013 () Bool)

(declare-fun res!123340 () Bool)

(assert (=> b!252013 (=> (not res!123340) (not e!163416))))

(assert (=> b!252013 (= res!123340 (= (select (arr!5842 (_keys!6801 thiss!1504)) (index!6685 lt!126191)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252013 (and (bvsge (index!6685 lt!126191) #b00000000000000000000000000000000) (bvslt (index!6685 lt!126191) (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun b!252014 () Bool)

(assert (=> b!252014 (= e!163418 (not call!23714))))

(declare-fun bm!23711 () Bool)

(assert (=> bm!23711 (= call!23713 (inRange!0 (ite c!42446 (index!6682 lt!126191) (index!6685 lt!126191)) (mask!10867 thiss!1504)))))

(declare-fun b!252015 () Bool)

(assert (=> b!252015 (and (bvsge (index!6682 lt!126191) #b00000000000000000000000000000000) (bvslt (index!6682 lt!126191) (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun res!123339 () Bool)

(assert (=> b!252015 (= res!123339 (= (select (arr!5842 (_keys!6801 thiss!1504)) (index!6682 lt!126191)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252015 (=> (not res!123339) (not e!163418))))

(assert (= (and d!61145 c!42446) b!252012))

(assert (= (and d!61145 (not c!42446)) b!252011))

(assert (= (and b!252012 res!123341) b!252015))

(assert (= (and b!252015 res!123339) b!252014))

(assert (= (and b!252011 c!42447) b!252009))

(assert (= (and b!252011 (not c!42447)) b!252008))

(assert (= (and b!252009 res!123338) b!252013))

(assert (= (and b!252013 res!123340) b!252010))

(assert (= (or b!252012 b!252009) bm!23711))

(assert (= (or b!252014 b!252010) bm!23710))

(assert (=> bm!23710 m!267635))

(declare-fun m!267763 () Bool)

(assert (=> b!252013 m!267763))

(declare-fun m!267765 () Bool)

(assert (=> bm!23711 m!267765))

(declare-fun m!267767 () Bool)

(assert (=> b!252015 m!267767))

(assert (=> d!61145 m!267657))

(declare-fun m!267769 () Bool)

(assert (=> d!61145 m!267769))

(assert (=> d!61145 m!267633))

(assert (=> b!251840 d!61145))

(declare-fun d!61147 () Bool)

(assert (=> d!61147 (= (array_inv!3853 (_keys!6801 thiss!1504)) (bvsge (size!6190 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251857 d!61147))

(declare-fun d!61149 () Bool)

(assert (=> d!61149 (= (array_inv!3854 (_values!4639 thiss!1504)) (bvsge (size!6189 (_values!4639 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251857 d!61149))

(declare-fun d!61151 () Bool)

(declare-fun res!123346 () Bool)

(declare-fun e!163424 () Bool)

(assert (=> d!61151 (=> res!123346 e!163424)))

(assert (=> d!61151 (= res!123346 (= (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61151 (= (arrayContainsKey!0 (_keys!6801 thiss!1504) key!932 #b00000000000000000000000000000000) e!163424)))

(declare-fun b!252020 () Bool)

(declare-fun e!163425 () Bool)

(assert (=> b!252020 (= e!163424 e!163425)))

(declare-fun res!123347 () Bool)

(assert (=> b!252020 (=> (not res!123347) (not e!163425))))

(assert (=> b!252020 (= res!123347 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun b!252021 () Bool)

(assert (=> b!252021 (= e!163425 (arrayContainsKey!0 (_keys!6801 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61151 (not res!123346)) b!252020))

(assert (= (and b!252020 res!123347) b!252021))

(declare-fun m!267771 () Bool)

(assert (=> d!61151 m!267771))

(declare-fun m!267773 () Bool)

(assert (=> b!252021 m!267773))

(assert (=> bm!23693 d!61151))

(declare-fun d!61153 () Bool)

(declare-fun e!163428 () Bool)

(assert (=> d!61153 e!163428))

(declare-fun res!123352 () Bool)

(assert (=> d!61153 (=> (not res!123352) (not e!163428))))

(declare-fun lt!126197 () SeekEntryResult!1128)

(assert (=> d!61153 (= res!123352 ((_ is Found!1128) lt!126197))))

(assert (=> d!61153 (= lt!126197 (seekEntryOrOpen!0 key!932 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)))))

(declare-fun lt!126198 () Unit!7773)

(declare-fun choose!1208 (array!12327 array!12325 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7773)

(assert (=> d!61153 (= lt!126198 (choose!1208 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(assert (=> d!61153 (validMask!0 (mask!10867 thiss!1504))))

(assert (=> d!61153 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)) lt!126198)))

(declare-fun b!252026 () Bool)

(declare-fun res!123353 () Bool)

(assert (=> b!252026 (=> (not res!123353) (not e!163428))))

(assert (=> b!252026 (= res!123353 (inRange!0 (index!6683 lt!126197) (mask!10867 thiss!1504)))))

(declare-fun b!252027 () Bool)

(assert (=> b!252027 (= e!163428 (= (select (arr!5842 (_keys!6801 thiss!1504)) (index!6683 lt!126197)) key!932))))

(assert (=> b!252027 (and (bvsge (index!6683 lt!126197) #b00000000000000000000000000000000) (bvslt (index!6683 lt!126197) (size!6190 (_keys!6801 thiss!1504))))))

(assert (= (and d!61153 res!123352) b!252026))

(assert (= (and b!252026 res!123353) b!252027))

(assert (=> d!61153 m!267657))

(declare-fun m!267775 () Bool)

(assert (=> d!61153 m!267775))

(assert (=> d!61153 m!267633))

(declare-fun m!267777 () Bool)

(assert (=> b!252026 m!267777))

(declare-fun m!267779 () Bool)

(assert (=> b!252027 m!267779))

(assert (=> b!251839 d!61153))

(declare-fun d!61155 () Bool)

(declare-fun e!163433 () Bool)

(assert (=> d!61155 e!163433))

(declare-fun res!123362 () Bool)

(assert (=> d!61155 (=> (not res!123362) (not e!163433))))

(assert (=> d!61155 (= res!123362 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6190 (_keys!6801 thiss!1504)))))))

(declare-fun lt!126201 () Unit!7773)

(declare-fun choose!1 (array!12327 (_ BitVec 32) (_ BitVec 64)) Unit!7773)

(assert (=> d!61155 (= lt!126201 (choose!1 (_keys!6801 thiss!1504) index!297 key!932))))

(declare-fun e!163434 () Bool)

(assert (=> d!61155 e!163434))

(declare-fun res!123365 () Bool)

(assert (=> d!61155 (=> (not res!123365) (not e!163434))))

(assert (=> d!61155 (= res!123365 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6190 (_keys!6801 thiss!1504)))))))

(assert (=> d!61155 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6801 thiss!1504) index!297 key!932) lt!126201)))

(declare-fun b!252037 () Bool)

(declare-fun res!123364 () Bool)

(assert (=> b!252037 (=> (not res!123364) (not e!163434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!252037 (= res!123364 (validKeyInArray!0 key!932))))

(declare-fun b!252038 () Bool)

(assert (=> b!252038 (= e!163434 (bvslt (size!6190 (_keys!6801 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!252039 () Bool)

(assert (=> b!252039 (= e!163433 (= (arrayCountValidKeys!0 (array!12328 (store (arr!5842 (_keys!6801 thiss!1504)) index!297 key!932) (size!6190 (_keys!6801 thiss!1504))) #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6801 thiss!1504) #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!252036 () Bool)

(declare-fun res!123363 () Bool)

(assert (=> b!252036 (=> (not res!123363) (not e!163434))))

(assert (=> b!252036 (= res!123363 (not (validKeyInArray!0 (select (arr!5842 (_keys!6801 thiss!1504)) index!297))))))

(assert (= (and d!61155 res!123365) b!252036))

(assert (= (and b!252036 res!123363) b!252037))

(assert (= (and b!252037 res!123364) b!252038))

(assert (= (and d!61155 res!123362) b!252039))

(declare-fun m!267781 () Bool)

(assert (=> d!61155 m!267781))

(declare-fun m!267783 () Bool)

(assert (=> b!252037 m!267783))

(assert (=> b!252039 m!267643))

(declare-fun m!267785 () Bool)

(assert (=> b!252039 m!267785))

(assert (=> b!252039 m!267645))

(declare-fun m!267787 () Bool)

(assert (=> b!252036 m!267787))

(assert (=> b!252036 m!267787))

(declare-fun m!267789 () Bool)

(assert (=> b!252036 m!267789))

(assert (=> b!251856 d!61155))

(declare-fun b!252048 () Bool)

(declare-fun e!163439 () (_ BitVec 32))

(declare-fun call!23717 () (_ BitVec 32))

(assert (=> b!252048 (= e!163439 call!23717)))

(declare-fun b!252049 () Bool)

(declare-fun e!163440 () (_ BitVec 32))

(assert (=> b!252049 (= e!163440 e!163439)))

(declare-fun c!42453 () Bool)

(assert (=> b!252049 (= c!42453 (validKeyInArray!0 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252050 () Bool)

(assert (=> b!252050 (= e!163439 (bvadd #b00000000000000000000000000000001 call!23717))))

(declare-fun bm!23714 () Bool)

(assert (=> bm!23714 (= call!23717 (arrayCountValidKeys!0 (_keys!6801 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun b!252051 () Bool)

(assert (=> b!252051 (= e!163440 #b00000000000000000000000000000000)))

(declare-fun d!61157 () Bool)

(declare-fun lt!126204 () (_ BitVec 32))

(assert (=> d!61157 (and (bvsge lt!126204 #b00000000000000000000000000000000) (bvsle lt!126204 (bvsub (size!6190 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61157 (= lt!126204 e!163440)))

(declare-fun c!42452 () Bool)

(assert (=> d!61157 (= c!42452 (bvsge #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))))))

(assert (=> d!61157 (and (bvsle #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6190 (_keys!6801 thiss!1504)) (size!6190 (_keys!6801 thiss!1504))))))

(assert (=> d!61157 (= (arrayCountValidKeys!0 (_keys!6801 thiss!1504) #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) lt!126204)))

(assert (= (and d!61157 c!42452) b!252051))

(assert (= (and d!61157 (not c!42452)) b!252049))

(assert (= (and b!252049 c!42453) b!252050))

(assert (= (and b!252049 (not c!42453)) b!252048))

(assert (= (or b!252050 b!252048) bm!23714))

(assert (=> b!252049 m!267771))

(assert (=> b!252049 m!267771))

(declare-fun m!267791 () Bool)

(assert (=> b!252049 m!267791))

(declare-fun m!267793 () Bool)

(assert (=> bm!23714 m!267793))

(assert (=> b!251856 d!61157))

(declare-fun d!61159 () Bool)

(assert (=> d!61159 (= (validMask!0 (mask!10867 thiss!1504)) (and (or (= (mask!10867 thiss!1504) #b00000000000000000000000000000111) (= (mask!10867 thiss!1504) #b00000000000000000000000000001111) (= (mask!10867 thiss!1504) #b00000000000000000000000000011111) (= (mask!10867 thiss!1504) #b00000000000000000000000000111111) (= (mask!10867 thiss!1504) #b00000000000000000000000001111111) (= (mask!10867 thiss!1504) #b00000000000000000000000011111111) (= (mask!10867 thiss!1504) #b00000000000000000000000111111111) (= (mask!10867 thiss!1504) #b00000000000000000000001111111111) (= (mask!10867 thiss!1504) #b00000000000000000000011111111111) (= (mask!10867 thiss!1504) #b00000000000000000000111111111111) (= (mask!10867 thiss!1504) #b00000000000000000001111111111111) (= (mask!10867 thiss!1504) #b00000000000000000011111111111111) (= (mask!10867 thiss!1504) #b00000000000000000111111111111111) (= (mask!10867 thiss!1504) #b00000000000000001111111111111111) (= (mask!10867 thiss!1504) #b00000000000000011111111111111111) (= (mask!10867 thiss!1504) #b00000000000000111111111111111111) (= (mask!10867 thiss!1504) #b00000000000001111111111111111111) (= (mask!10867 thiss!1504) #b00000000000011111111111111111111) (= (mask!10867 thiss!1504) #b00000000000111111111111111111111) (= (mask!10867 thiss!1504) #b00000000001111111111111111111111) (= (mask!10867 thiss!1504) #b00000000011111111111111111111111) (= (mask!10867 thiss!1504) #b00000000111111111111111111111111) (= (mask!10867 thiss!1504) #b00000001111111111111111111111111) (= (mask!10867 thiss!1504) #b00000011111111111111111111111111) (= (mask!10867 thiss!1504) #b00000111111111111111111111111111) (= (mask!10867 thiss!1504) #b00001111111111111111111111111111) (= (mask!10867 thiss!1504) #b00011111111111111111111111111111) (= (mask!10867 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10867 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!251856 d!61159))

(declare-fun b!252060 () Bool)

(declare-fun e!163447 () Bool)

(declare-fun call!23720 () Bool)

(assert (=> b!252060 (= e!163447 call!23720)))

(declare-fun b!252061 () Bool)

(declare-fun e!163449 () Bool)

(assert (=> b!252061 (= e!163449 call!23720)))

(declare-fun b!252062 () Bool)

(assert (=> b!252062 (= e!163449 e!163447)))

(declare-fun lt!126212 () (_ BitVec 64))

(assert (=> b!252062 (= lt!126212 (select (arr!5842 lt!126120) #b00000000000000000000000000000000))))

(declare-fun lt!126211 () Unit!7773)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12327 (_ BitVec 64) (_ BitVec 32)) Unit!7773)

(assert (=> b!252062 (= lt!126211 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126120 lt!126212 #b00000000000000000000000000000000))))

(assert (=> b!252062 (arrayContainsKey!0 lt!126120 lt!126212 #b00000000000000000000000000000000)))

(declare-fun lt!126213 () Unit!7773)

(assert (=> b!252062 (= lt!126213 lt!126211)))

(declare-fun res!123370 () Bool)

(assert (=> b!252062 (= res!123370 (= (seekEntryOrOpen!0 (select (arr!5842 lt!126120) #b00000000000000000000000000000000) lt!126120 (mask!10867 thiss!1504)) (Found!1128 #b00000000000000000000000000000000)))))

(assert (=> b!252062 (=> (not res!123370) (not e!163447))))

(declare-fun d!61161 () Bool)

(declare-fun res!123371 () Bool)

(declare-fun e!163448 () Bool)

(assert (=> d!61161 (=> res!123371 e!163448)))

(assert (=> d!61161 (= res!123371 (bvsge #b00000000000000000000000000000000 (size!6190 lt!126120)))))

(assert (=> d!61161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126120 (mask!10867 thiss!1504)) e!163448)))

(declare-fun b!252063 () Bool)

(assert (=> b!252063 (= e!163448 e!163449)))

(declare-fun c!42456 () Bool)

(assert (=> b!252063 (= c!42456 (validKeyInArray!0 (select (arr!5842 lt!126120) #b00000000000000000000000000000000)))))

(declare-fun bm!23717 () Bool)

(assert (=> bm!23717 (= call!23720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126120 (mask!10867 thiss!1504)))))

(assert (= (and d!61161 (not res!123371)) b!252063))

(assert (= (and b!252063 c!42456) b!252062))

(assert (= (and b!252063 (not c!42456)) b!252061))

(assert (= (and b!252062 res!123370) b!252060))

(assert (= (or b!252060 b!252061) bm!23717))

(declare-fun m!267795 () Bool)

(assert (=> b!252062 m!267795))

(declare-fun m!267797 () Bool)

(assert (=> b!252062 m!267797))

(declare-fun m!267799 () Bool)

(assert (=> b!252062 m!267799))

(assert (=> b!252062 m!267795))

(declare-fun m!267801 () Bool)

(assert (=> b!252062 m!267801))

(assert (=> b!252063 m!267795))

(assert (=> b!252063 m!267795))

(declare-fun m!267803 () Bool)

(assert (=> b!252063 m!267803))

(declare-fun m!267805 () Bool)

(assert (=> bm!23717 m!267805))

(assert (=> b!251856 d!61161))

(declare-fun b!252074 () Bool)

(declare-fun e!163460 () Bool)

(declare-fun call!23723 () Bool)

(assert (=> b!252074 (= e!163460 call!23723)))

(declare-fun b!252075 () Bool)

(declare-fun e!163461 () Bool)

(declare-fun contains!1810 (List!3719 (_ BitVec 64)) Bool)

(assert (=> b!252075 (= e!163461 (contains!1810 Nil!3716 (select (arr!5842 lt!126120) #b00000000000000000000000000000000)))))

(declare-fun bm!23720 () Bool)

(declare-fun c!42459 () Bool)

(assert (=> bm!23720 (= call!23723 (arrayNoDuplicates!0 lt!126120 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42459 (Cons!3715 (select (arr!5842 lt!126120) #b00000000000000000000000000000000) Nil!3716) Nil!3716)))))

(declare-fun b!252076 () Bool)

(declare-fun e!163458 () Bool)

(declare-fun e!163459 () Bool)

(assert (=> b!252076 (= e!163458 e!163459)))

(declare-fun res!123379 () Bool)

(assert (=> b!252076 (=> (not res!123379) (not e!163459))))

(assert (=> b!252076 (= res!123379 (not e!163461))))

(declare-fun res!123378 () Bool)

(assert (=> b!252076 (=> (not res!123378) (not e!163461))))

(assert (=> b!252076 (= res!123378 (validKeyInArray!0 (select (arr!5842 lt!126120) #b00000000000000000000000000000000)))))

(declare-fun b!252077 () Bool)

(assert (=> b!252077 (= e!163460 call!23723)))

(declare-fun b!252078 () Bool)

(assert (=> b!252078 (= e!163459 e!163460)))

(assert (=> b!252078 (= c!42459 (validKeyInArray!0 (select (arr!5842 lt!126120) #b00000000000000000000000000000000)))))

(declare-fun d!61163 () Bool)

(declare-fun res!123380 () Bool)

(assert (=> d!61163 (=> res!123380 e!163458)))

(assert (=> d!61163 (= res!123380 (bvsge #b00000000000000000000000000000000 (size!6190 lt!126120)))))

(assert (=> d!61163 (= (arrayNoDuplicates!0 lt!126120 #b00000000000000000000000000000000 Nil!3716) e!163458)))

(assert (= (and d!61163 (not res!123380)) b!252076))

(assert (= (and b!252076 res!123378) b!252075))

(assert (= (and b!252076 res!123379) b!252078))

(assert (= (and b!252078 c!42459) b!252074))

(assert (= (and b!252078 (not c!42459)) b!252077))

(assert (= (or b!252074 b!252077) bm!23720))

(assert (=> b!252075 m!267795))

(assert (=> b!252075 m!267795))

(declare-fun m!267807 () Bool)

(assert (=> b!252075 m!267807))

(assert (=> bm!23720 m!267795))

(declare-fun m!267809 () Bool)

(assert (=> bm!23720 m!267809))

(assert (=> b!252076 m!267795))

(assert (=> b!252076 m!267795))

(assert (=> b!252076 m!267803))

(assert (=> b!252078 m!267795))

(assert (=> b!252078 m!267795))

(assert (=> b!252078 m!267803))

(assert (=> b!251856 d!61163))

(declare-fun d!61165 () Bool)

(declare-fun e!163464 () Bool)

(assert (=> d!61165 e!163464))

(declare-fun res!123383 () Bool)

(assert (=> d!61165 (=> (not res!123383) (not e!163464))))

(assert (=> d!61165 (= res!123383 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6190 (_keys!6801 thiss!1504)))))))

(declare-fun lt!126216 () Unit!7773)

(declare-fun choose!41 (array!12327 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3719) Unit!7773)

(assert (=> d!61165 (= lt!126216 (choose!41 (_keys!6801 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3716))))

(assert (=> d!61165 (bvslt (size!6190 (_keys!6801 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61165 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6801 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3716) lt!126216)))

(declare-fun b!252081 () Bool)

(assert (=> b!252081 (= e!163464 (arrayNoDuplicates!0 (array!12328 (store (arr!5842 (_keys!6801 thiss!1504)) index!297 key!932) (size!6190 (_keys!6801 thiss!1504))) #b00000000000000000000000000000000 Nil!3716))))

(assert (= (and d!61165 res!123383) b!252081))

(declare-fun m!267811 () Bool)

(assert (=> d!61165 m!267811))

(assert (=> b!252081 m!267643))

(declare-fun m!267813 () Bool)

(assert (=> b!252081 m!267813))

(assert (=> b!251856 d!61165))

(declare-fun b!252082 () Bool)

(declare-fun e!163465 () (_ BitVec 32))

(declare-fun call!23724 () (_ BitVec 32))

(assert (=> b!252082 (= e!163465 call!23724)))

(declare-fun b!252083 () Bool)

(declare-fun e!163466 () (_ BitVec 32))

(assert (=> b!252083 (= e!163466 e!163465)))

(declare-fun c!42461 () Bool)

(assert (=> b!252083 (= c!42461 (validKeyInArray!0 (select (arr!5842 lt!126120) #b00000000000000000000000000000000)))))

(declare-fun b!252084 () Bool)

(assert (=> b!252084 (= e!163465 (bvadd #b00000000000000000000000000000001 call!23724))))

(declare-fun bm!23721 () Bool)

(assert (=> bm!23721 (= call!23724 (arrayCountValidKeys!0 lt!126120 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun b!252085 () Bool)

(assert (=> b!252085 (= e!163466 #b00000000000000000000000000000000)))

(declare-fun d!61167 () Bool)

(declare-fun lt!126217 () (_ BitVec 32))

(assert (=> d!61167 (and (bvsge lt!126217 #b00000000000000000000000000000000) (bvsle lt!126217 (bvsub (size!6190 lt!126120) #b00000000000000000000000000000000)))))

(assert (=> d!61167 (= lt!126217 e!163466)))

(declare-fun c!42460 () Bool)

(assert (=> d!61167 (= c!42460 (bvsge #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))))))

(assert (=> d!61167 (and (bvsle #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6190 (_keys!6801 thiss!1504)) (size!6190 lt!126120)))))

(assert (=> d!61167 (= (arrayCountValidKeys!0 lt!126120 #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) lt!126217)))

(assert (= (and d!61167 c!42460) b!252085))

(assert (= (and d!61167 (not c!42460)) b!252083))

(assert (= (and b!252083 c!42461) b!252084))

(assert (= (and b!252083 (not c!42461)) b!252082))

(assert (= (or b!252084 b!252082) bm!23721))

(assert (=> b!252083 m!267795))

(assert (=> b!252083 m!267795))

(assert (=> b!252083 m!267803))

(declare-fun m!267815 () Bool)

(assert (=> bm!23721 m!267815))

(assert (=> b!251856 d!61167))

(assert (=> b!251856 d!61151))

(declare-fun d!61169 () Bool)

(declare-fun e!163469 () Bool)

(assert (=> d!61169 e!163469))

(declare-fun res!123386 () Bool)

(assert (=> d!61169 (=> (not res!123386) (not e!163469))))

(assert (=> d!61169 (= res!123386 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6190 (_keys!6801 thiss!1504)))))))

(declare-fun lt!126220 () Unit!7773)

(declare-fun choose!102 ((_ BitVec 64) array!12327 (_ BitVec 32) (_ BitVec 32)) Unit!7773)

(assert (=> d!61169 (= lt!126220 (choose!102 key!932 (_keys!6801 thiss!1504) index!297 (mask!10867 thiss!1504)))))

(assert (=> d!61169 (validMask!0 (mask!10867 thiss!1504))))

(assert (=> d!61169 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6801 thiss!1504) index!297 (mask!10867 thiss!1504)) lt!126220)))

(declare-fun b!252088 () Bool)

(assert (=> b!252088 (= e!163469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12328 (store (arr!5842 (_keys!6801 thiss!1504)) index!297 key!932) (size!6190 (_keys!6801 thiss!1504))) (mask!10867 thiss!1504)))))

(assert (= (and d!61169 res!123386) b!252088))

(declare-fun m!267817 () Bool)

(assert (=> d!61169 m!267817))

(assert (=> d!61169 m!267633))

(assert (=> b!252088 m!267643))

(declare-fun m!267819 () Bool)

(assert (=> b!252088 m!267819))

(assert (=> b!251856 d!61169))

(declare-fun d!61171 () Bool)

(declare-fun res!123393 () Bool)

(declare-fun e!163472 () Bool)

(assert (=> d!61171 (=> (not res!123393) (not e!163472))))

(declare-fun simpleValid!266 (LongMapFixedSize!3718) Bool)

(assert (=> d!61171 (= res!123393 (simpleValid!266 thiss!1504))))

(assert (=> d!61171 (= (valid!1457 thiss!1504) e!163472)))

(declare-fun b!252095 () Bool)

(declare-fun res!123394 () Bool)

(assert (=> b!252095 (=> (not res!123394) (not e!163472))))

(assert (=> b!252095 (= res!123394 (= (arrayCountValidKeys!0 (_keys!6801 thiss!1504) #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) (_size!1908 thiss!1504)))))

(declare-fun b!252096 () Bool)

(declare-fun res!123395 () Bool)

(assert (=> b!252096 (=> (not res!123395) (not e!163472))))

(assert (=> b!252096 (= res!123395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)))))

(declare-fun b!252097 () Bool)

(assert (=> b!252097 (= e!163472 (arrayNoDuplicates!0 (_keys!6801 thiss!1504) #b00000000000000000000000000000000 Nil!3716))))

(assert (= (and d!61171 res!123393) b!252095))

(assert (= (and b!252095 res!123394) b!252096))

(assert (= (and b!252096 res!123395) b!252097))

(declare-fun m!267821 () Bool)

(assert (=> d!61171 m!267821))

(assert (=> b!252095 m!267645))

(assert (=> b!252096 m!267619))

(declare-fun m!267823 () Bool)

(assert (=> b!252097 m!267823))

(assert (=> start!24100 d!61171))

(declare-fun d!61173 () Bool)

(assert (=> d!61173 (contains!1807 (getCurrentListMap!1385 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) key!932)))

(declare-fun lt!126223 () Unit!7773)

(declare-fun choose!1209 (array!12327 array!12325 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) (_ BitVec 32) Int) Unit!7773)

(assert (=> d!61173 (= lt!126223 (choose!1209 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(assert (=> d!61173 (validMask!0 (mask!10867 thiss!1504))))

(assert (=> d!61173 (= (lemmaArrayContainsKeyThenInListMap!213 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) lt!126223)))

(declare-fun bs!9002 () Bool)

(assert (= bs!9002 d!61173))

(assert (=> bs!9002 m!267629))

(assert (=> bs!9002 m!267629))

(assert (=> bs!9002 m!267631))

(declare-fun m!267825 () Bool)

(assert (=> bs!9002 m!267825))

(assert (=> bs!9002 m!267633))

(assert (=> b!251854 d!61173))

(declare-fun b!252098 () Bool)

(declare-fun e!163473 () Bool)

(declare-fun call!23725 () Bool)

(assert (=> b!252098 (= e!163473 call!23725)))

(declare-fun b!252099 () Bool)

(declare-fun e!163475 () Bool)

(assert (=> b!252099 (= e!163475 call!23725)))

(declare-fun b!252100 () Bool)

(assert (=> b!252100 (= e!163475 e!163473)))

(declare-fun lt!126225 () (_ BitVec 64))

(assert (=> b!252100 (= lt!126225 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126224 () Unit!7773)

(assert (=> b!252100 (= lt!126224 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6801 thiss!1504) lt!126225 #b00000000000000000000000000000000))))

(assert (=> b!252100 (arrayContainsKey!0 (_keys!6801 thiss!1504) lt!126225 #b00000000000000000000000000000000)))

(declare-fun lt!126226 () Unit!7773)

(assert (=> b!252100 (= lt!126226 lt!126224)))

(declare-fun res!123396 () Bool)

(assert (=> b!252100 (= res!123396 (= (seekEntryOrOpen!0 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000) (_keys!6801 thiss!1504) (mask!10867 thiss!1504)) (Found!1128 #b00000000000000000000000000000000)))))

(assert (=> b!252100 (=> (not res!123396) (not e!163473))))

(declare-fun d!61175 () Bool)

(declare-fun res!123397 () Bool)

(declare-fun e!163474 () Bool)

(assert (=> d!61175 (=> res!123397 e!163474)))

(assert (=> d!61175 (= res!123397 (bvsge #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))))))

(assert (=> d!61175 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)) e!163474)))

(declare-fun b!252101 () Bool)

(assert (=> b!252101 (= e!163474 e!163475)))

(declare-fun c!42462 () Bool)

(assert (=> b!252101 (= c!42462 (validKeyInArray!0 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23722 () Bool)

(assert (=> bm!23722 (= call!23725 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6801 thiss!1504) (mask!10867 thiss!1504)))))

(assert (= (and d!61175 (not res!123397)) b!252101))

(assert (= (and b!252101 c!42462) b!252100))

(assert (= (and b!252101 (not c!42462)) b!252099))

(assert (= (and b!252100 res!123396) b!252098))

(assert (= (or b!252098 b!252099) bm!23722))

(assert (=> b!252100 m!267771))

(declare-fun m!267827 () Bool)

(assert (=> b!252100 m!267827))

(declare-fun m!267829 () Bool)

(assert (=> b!252100 m!267829))

(assert (=> b!252100 m!267771))

(declare-fun m!267831 () Bool)

(assert (=> b!252100 m!267831))

(assert (=> b!252101 m!267771))

(assert (=> b!252101 m!267771))

(assert (=> b!252101 m!267791))

(declare-fun m!267833 () Bool)

(assert (=> bm!23722 m!267833))

(assert (=> b!251845 d!61175))

(declare-fun d!61177 () Bool)

(assert (=> d!61177 (= (inRange!0 index!297 (mask!10867 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10867 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!251844 d!61177))

(declare-fun d!61179 () Bool)

(declare-fun e!163481 () Bool)

(assert (=> d!61179 e!163481))

(declare-fun res!123400 () Bool)

(assert (=> d!61179 (=> res!123400 e!163481)))

(declare-fun lt!126237 () Bool)

(assert (=> d!61179 (= res!123400 (not lt!126237))))

(declare-fun lt!126236 () Bool)

(assert (=> d!61179 (= lt!126237 lt!126236)))

(declare-fun lt!126238 () Unit!7773)

(declare-fun e!163480 () Unit!7773)

(assert (=> d!61179 (= lt!126238 e!163480)))

(declare-fun c!42465 () Bool)

(assert (=> d!61179 (= c!42465 lt!126236)))

(declare-fun containsKey!291 (List!3718 (_ BitVec 64)) Bool)

(assert (=> d!61179 (= lt!126236 (containsKey!291 (toList!1876 (getCurrentListMap!1385 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504))) key!932))))

(assert (=> d!61179 (= (contains!1807 (getCurrentListMap!1385 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) key!932) lt!126237)))

(declare-fun b!252108 () Bool)

(declare-fun lt!126235 () Unit!7773)

(assert (=> b!252108 (= e!163480 lt!126235)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!240 (List!3718 (_ BitVec 64)) Unit!7773)

(assert (=> b!252108 (= lt!126235 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1876 (getCurrentListMap!1385 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504))) key!932))))

(declare-datatypes ((Option!305 0))(
  ( (Some!304 (v!5364 V!8321)) (None!303) )
))
(declare-fun isDefined!241 (Option!305) Bool)

(declare-fun getValueByKey!299 (List!3718 (_ BitVec 64)) Option!305)

(assert (=> b!252108 (isDefined!241 (getValueByKey!299 (toList!1876 (getCurrentListMap!1385 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504))) key!932))))

(declare-fun b!252109 () Bool)

(declare-fun Unit!7786 () Unit!7773)

(assert (=> b!252109 (= e!163480 Unit!7786)))

(declare-fun b!252110 () Bool)

(assert (=> b!252110 (= e!163481 (isDefined!241 (getValueByKey!299 (toList!1876 (getCurrentListMap!1385 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504))) key!932)))))

(assert (= (and d!61179 c!42465) b!252108))

(assert (= (and d!61179 (not c!42465)) b!252109))

(assert (= (and d!61179 (not res!123400)) b!252110))

(declare-fun m!267835 () Bool)

(assert (=> d!61179 m!267835))

(declare-fun m!267837 () Bool)

(assert (=> b!252108 m!267837))

(declare-fun m!267839 () Bool)

(assert (=> b!252108 m!267839))

(assert (=> b!252108 m!267839))

(declare-fun m!267841 () Bool)

(assert (=> b!252108 m!267841))

(assert (=> b!252110 m!267839))

(assert (=> b!252110 m!267839))

(assert (=> b!252110 m!267841))

(assert (=> b!251844 d!61179))

(declare-fun b!252153 () Bool)

(declare-fun c!42478 () Bool)

(assert (=> b!252153 (= c!42478 (and (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!163511 () ListLongMap!3721)

(declare-fun e!163509 () ListLongMap!3721)

(assert (=> b!252153 (= e!163511 e!163509)))

(declare-fun bm!23737 () Bool)

(declare-fun call!23746 () ListLongMap!3721)

(declare-fun call!23743 () ListLongMap!3721)

(assert (=> bm!23737 (= call!23746 call!23743)))

(declare-fun call!23744 () ListLongMap!3721)

(declare-fun c!42479 () Bool)

(declare-fun c!42480 () Bool)

(declare-fun bm!23738 () Bool)

(declare-fun call!23742 () ListLongMap!3721)

(declare-fun +!676 (ListLongMap!3721 tuple2!4818) ListLongMap!3721)

(assert (=> bm!23738 (= call!23742 (+!676 (ite c!42479 call!23744 (ite c!42480 call!23743 call!23746)) (ite (or c!42479 c!42480) (tuple2!4819 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4497 thiss!1504)) (tuple2!4819 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4497 thiss!1504)))))))

(declare-fun b!252155 () Bool)

(declare-fun res!123421 () Bool)

(declare-fun e!163513 () Bool)

(assert (=> b!252155 (=> (not res!123421) (not e!163513))))

(declare-fun e!163520 () Bool)

(assert (=> b!252155 (= res!123421 e!163520)))

(declare-fun res!123425 () Bool)

(assert (=> b!252155 (=> res!123425 e!163520)))

(declare-fun e!163518 () Bool)

(assert (=> b!252155 (= res!123425 (not e!163518))))

(declare-fun res!123426 () Bool)

(assert (=> b!252155 (=> (not res!123426) (not e!163518))))

(assert (=> b!252155 (= res!123426 (bvslt #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun b!252156 () Bool)

(declare-fun e!163515 () Bool)

(assert (=> b!252156 (= e!163515 (validKeyInArray!0 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252157 () Bool)

(declare-fun res!123420 () Bool)

(assert (=> b!252157 (=> (not res!123420) (not e!163513))))

(declare-fun e!163514 () Bool)

(assert (=> b!252157 (= res!123420 e!163514)))

(declare-fun c!42483 () Bool)

(assert (=> b!252157 (= c!42483 (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!252158 () Bool)

(declare-fun e!163510 () Bool)

(declare-fun e!163516 () Bool)

(assert (=> b!252158 (= e!163510 e!163516)))

(declare-fun res!123419 () Bool)

(declare-fun call!23745 () Bool)

(assert (=> b!252158 (= res!123419 call!23745)))

(assert (=> b!252158 (=> (not res!123419) (not e!163516))))

(declare-fun b!252159 () Bool)

(assert (=> b!252159 (= e!163509 call!23746)))

(declare-fun b!252160 () Bool)

(declare-fun call!23741 () ListLongMap!3721)

(assert (=> b!252160 (= e!163511 call!23741)))

(declare-fun b!252161 () Bool)

(declare-fun e!163519 () Unit!7773)

(declare-fun lt!126298 () Unit!7773)

(assert (=> b!252161 (= e!163519 lt!126298)))

(declare-fun lt!126291 () ListLongMap!3721)

(declare-fun getCurrentListMapNoExtraKeys!559 (array!12327 array!12325 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 32) Int) ListLongMap!3721)

(assert (=> b!252161 (= lt!126291 (getCurrentListMapNoExtraKeys!559 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun lt!126303 () (_ BitVec 64))

(assert (=> b!252161 (= lt!126303 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126301 () (_ BitVec 64))

(assert (=> b!252161 (= lt!126301 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126290 () Unit!7773)

(declare-fun addStillContains!219 (ListLongMap!3721 (_ BitVec 64) V!8321 (_ BitVec 64)) Unit!7773)

(assert (=> b!252161 (= lt!126290 (addStillContains!219 lt!126291 lt!126303 (zeroValue!4497 thiss!1504) lt!126301))))

(assert (=> b!252161 (contains!1807 (+!676 lt!126291 (tuple2!4819 lt!126303 (zeroValue!4497 thiss!1504))) lt!126301)))

(declare-fun lt!126284 () Unit!7773)

(assert (=> b!252161 (= lt!126284 lt!126290)))

(declare-fun lt!126302 () ListLongMap!3721)

(assert (=> b!252161 (= lt!126302 (getCurrentListMapNoExtraKeys!559 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun lt!126285 () (_ BitVec 64))

(assert (=> b!252161 (= lt!126285 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126287 () (_ BitVec 64))

(assert (=> b!252161 (= lt!126287 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126297 () Unit!7773)

(declare-fun addApplyDifferent!219 (ListLongMap!3721 (_ BitVec 64) V!8321 (_ BitVec 64)) Unit!7773)

(assert (=> b!252161 (= lt!126297 (addApplyDifferent!219 lt!126302 lt!126285 (minValue!4497 thiss!1504) lt!126287))))

(declare-fun apply!243 (ListLongMap!3721 (_ BitVec 64)) V!8321)

(assert (=> b!252161 (= (apply!243 (+!676 lt!126302 (tuple2!4819 lt!126285 (minValue!4497 thiss!1504))) lt!126287) (apply!243 lt!126302 lt!126287))))

(declare-fun lt!126283 () Unit!7773)

(assert (=> b!252161 (= lt!126283 lt!126297)))

(declare-fun lt!126286 () ListLongMap!3721)

(assert (=> b!252161 (= lt!126286 (getCurrentListMapNoExtraKeys!559 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun lt!126289 () (_ BitVec 64))

(assert (=> b!252161 (= lt!126289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126293 () (_ BitVec 64))

(assert (=> b!252161 (= lt!126293 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126300 () Unit!7773)

(assert (=> b!252161 (= lt!126300 (addApplyDifferent!219 lt!126286 lt!126289 (zeroValue!4497 thiss!1504) lt!126293))))

(assert (=> b!252161 (= (apply!243 (+!676 lt!126286 (tuple2!4819 lt!126289 (zeroValue!4497 thiss!1504))) lt!126293) (apply!243 lt!126286 lt!126293))))

(declare-fun lt!126292 () Unit!7773)

(assert (=> b!252161 (= lt!126292 lt!126300)))

(declare-fun lt!126296 () ListLongMap!3721)

(assert (=> b!252161 (= lt!126296 (getCurrentListMapNoExtraKeys!559 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun lt!126294 () (_ BitVec 64))

(assert (=> b!252161 (= lt!126294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126288 () (_ BitVec 64))

(assert (=> b!252161 (= lt!126288 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252161 (= lt!126298 (addApplyDifferent!219 lt!126296 lt!126294 (minValue!4497 thiss!1504) lt!126288))))

(assert (=> b!252161 (= (apply!243 (+!676 lt!126296 (tuple2!4819 lt!126294 (minValue!4497 thiss!1504))) lt!126288) (apply!243 lt!126296 lt!126288))))

(declare-fun b!252162 () Bool)

(declare-fun e!163508 () Bool)

(declare-fun lt!126295 () ListLongMap!3721)

(declare-fun get!3006 (ValueCell!2909 V!8321) V!8321)

(declare-fun dynLambda!577 (Int (_ BitVec 64)) V!8321)

(assert (=> b!252162 (= e!163508 (= (apply!243 lt!126295 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000)) (get!3006 (select (arr!5841 (_values!4639 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!577 (defaultEntry!4656 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!252162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6189 (_values!4639 thiss!1504))))))

(assert (=> b!252162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun bm!23739 () Bool)

(assert (=> bm!23739 (= call!23741 call!23742)))

(declare-fun b!252163 () Bool)

(declare-fun e!163512 () ListLongMap!3721)

(assert (=> b!252163 (= e!163512 e!163511)))

(assert (=> b!252163 (= c!42480 (and (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!61181 () Bool)

(assert (=> d!61181 e!163513))

(declare-fun res!123424 () Bool)

(assert (=> d!61181 (=> (not res!123424) (not e!163513))))

(assert (=> d!61181 (= res!123424 (or (bvsge #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))))))))

(declare-fun lt!126304 () ListLongMap!3721)

(assert (=> d!61181 (= lt!126295 lt!126304)))

(declare-fun lt!126299 () Unit!7773)

(assert (=> d!61181 (= lt!126299 e!163519)))

(declare-fun c!42481 () Bool)

(assert (=> d!61181 (= c!42481 e!163515)))

(declare-fun res!123422 () Bool)

(assert (=> d!61181 (=> (not res!123422) (not e!163515))))

(assert (=> d!61181 (= res!123422 (bvslt #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))))))

(assert (=> d!61181 (= lt!126304 e!163512)))

(assert (=> d!61181 (= c!42479 (and (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61181 (validMask!0 (mask!10867 thiss!1504))))

(assert (=> d!61181 (= (getCurrentListMap!1385 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)) lt!126295)))

(declare-fun b!252154 () Bool)

(assert (=> b!252154 (= e!163509 call!23741)))

(declare-fun b!252164 () Bool)

(assert (=> b!252164 (= e!163512 (+!676 call!23742 (tuple2!4819 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4497 thiss!1504))))))

(declare-fun b!252165 () Bool)

(assert (=> b!252165 (= e!163520 e!163508)))

(declare-fun res!123423 () Bool)

(assert (=> b!252165 (=> (not res!123423) (not e!163508))))

(assert (=> b!252165 (= res!123423 (contains!1807 lt!126295 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!252165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6190 (_keys!6801 thiss!1504))))))

(declare-fun b!252166 () Bool)

(declare-fun e!163517 () Bool)

(assert (=> b!252166 (= e!163517 (= (apply!243 lt!126295 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4497 thiss!1504)))))

(declare-fun bm!23740 () Bool)

(assert (=> bm!23740 (= call!23745 (contains!1807 lt!126295 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252167 () Bool)

(assert (=> b!252167 (= e!163513 e!163510)))

(declare-fun c!42482 () Bool)

(assert (=> b!252167 (= c!42482 (not (= (bvand (extraKeys!4393 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!252168 () Bool)

(declare-fun Unit!7787 () Unit!7773)

(assert (=> b!252168 (= e!163519 Unit!7787)))

(declare-fun bm!23741 () Bool)

(declare-fun call!23740 () Bool)

(assert (=> bm!23741 (= call!23740 (contains!1807 lt!126295 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252169 () Bool)

(assert (=> b!252169 (= e!163514 (not call!23740))))

(declare-fun b!252170 () Bool)

(assert (=> b!252170 (= e!163514 e!163517)))

(declare-fun res!123427 () Bool)

(assert (=> b!252170 (= res!123427 call!23740)))

(assert (=> b!252170 (=> (not res!123427) (not e!163517))))

(declare-fun b!252171 () Bool)

(assert (=> b!252171 (= e!163518 (validKeyInArray!0 (select (arr!5842 (_keys!6801 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!252172 () Bool)

(assert (=> b!252172 (= e!163516 (= (apply!243 lt!126295 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4497 thiss!1504)))))

(declare-fun b!252173 () Bool)

(assert (=> b!252173 (= e!163510 (not call!23745))))

(declare-fun bm!23742 () Bool)

(assert (=> bm!23742 (= call!23744 (getCurrentListMapNoExtraKeys!559 (_keys!6801 thiss!1504) (_values!4639 thiss!1504) (mask!10867 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(declare-fun bm!23743 () Bool)

(assert (=> bm!23743 (= call!23743 call!23744)))

(assert (= (and d!61181 c!42479) b!252164))

(assert (= (and d!61181 (not c!42479)) b!252163))

(assert (= (and b!252163 c!42480) b!252160))

(assert (= (and b!252163 (not c!42480)) b!252153))

(assert (= (and b!252153 c!42478) b!252154))

(assert (= (and b!252153 (not c!42478)) b!252159))

(assert (= (or b!252154 b!252159) bm!23737))

(assert (= (or b!252160 bm!23737) bm!23743))

(assert (= (or b!252160 b!252154) bm!23739))

(assert (= (or b!252164 bm!23743) bm!23742))

(assert (= (or b!252164 bm!23739) bm!23738))

(assert (= (and d!61181 res!123422) b!252156))

(assert (= (and d!61181 c!42481) b!252161))

(assert (= (and d!61181 (not c!42481)) b!252168))

(assert (= (and d!61181 res!123424) b!252155))

(assert (= (and b!252155 res!123426) b!252171))

(assert (= (and b!252155 (not res!123425)) b!252165))

(assert (= (and b!252165 res!123423) b!252162))

(assert (= (and b!252155 res!123421) b!252157))

(assert (= (and b!252157 c!42483) b!252170))

(assert (= (and b!252157 (not c!42483)) b!252169))

(assert (= (and b!252170 res!123427) b!252166))

(assert (= (or b!252170 b!252169) bm!23741))

(assert (= (and b!252157 res!123420) b!252167))

(assert (= (and b!252167 c!42482) b!252158))

(assert (= (and b!252167 (not c!42482)) b!252173))

(assert (= (and b!252158 res!123419) b!252172))

(assert (= (or b!252158 b!252173) bm!23740))

(declare-fun b_lambda!8097 () Bool)

(assert (=> (not b_lambda!8097) (not b!252162)))

(declare-fun t!8754 () Bool)

(declare-fun tb!2991 () Bool)

(assert (=> (and b!251857 (= (defaultEntry!4656 thiss!1504) (defaultEntry!4656 thiss!1504)) t!8754) tb!2991))

(declare-fun result!5311 () Bool)

(assert (=> tb!2991 (= result!5311 tp_is_empty!6505)))

(assert (=> b!252162 t!8754))

(declare-fun b_and!13657 () Bool)

(assert (= b_and!13651 (and (=> t!8754 result!5311) b_and!13657)))

(assert (=> d!61181 m!267633))

(declare-fun m!267843 () Bool)

(assert (=> bm!23738 m!267843))

(declare-fun m!267845 () Bool)

(assert (=> bm!23740 m!267845))

(declare-fun m!267847 () Bool)

(assert (=> b!252164 m!267847))

(declare-fun m!267849 () Bool)

(assert (=> bm!23742 m!267849))

(declare-fun m!267851 () Bool)

(assert (=> b!252166 m!267851))

(assert (=> b!252162 m!267771))

(declare-fun m!267853 () Bool)

(assert (=> b!252162 m!267853))

(declare-fun m!267855 () Bool)

(assert (=> b!252162 m!267855))

(declare-fun m!267857 () Bool)

(assert (=> b!252162 m!267857))

(assert (=> b!252162 m!267771))

(declare-fun m!267859 () Bool)

(assert (=> b!252162 m!267859))

(assert (=> b!252162 m!267853))

(assert (=> b!252162 m!267855))

(assert (=> b!252171 m!267771))

(assert (=> b!252171 m!267771))

(assert (=> b!252171 m!267791))

(declare-fun m!267861 () Bool)

(assert (=> b!252161 m!267861))

(declare-fun m!267863 () Bool)

(assert (=> b!252161 m!267863))

(assert (=> b!252161 m!267771))

(declare-fun m!267865 () Bool)

(assert (=> b!252161 m!267865))

(declare-fun m!267867 () Bool)

(assert (=> b!252161 m!267867))

(declare-fun m!267869 () Bool)

(assert (=> b!252161 m!267869))

(declare-fun m!267871 () Bool)

(assert (=> b!252161 m!267871))

(declare-fun m!267873 () Bool)

(assert (=> b!252161 m!267873))

(declare-fun m!267875 () Bool)

(assert (=> b!252161 m!267875))

(declare-fun m!267877 () Bool)

(assert (=> b!252161 m!267877))

(assert (=> b!252161 m!267867))

(declare-fun m!267879 () Bool)

(assert (=> b!252161 m!267879))

(declare-fun m!267881 () Bool)

(assert (=> b!252161 m!267881))

(assert (=> b!252161 m!267881))

(declare-fun m!267883 () Bool)

(assert (=> b!252161 m!267883))

(declare-fun m!267885 () Bool)

(assert (=> b!252161 m!267885))

(assert (=> b!252161 m!267877))

(declare-fun m!267887 () Bool)

(assert (=> b!252161 m!267887))

(assert (=> b!252161 m!267849))

(declare-fun m!267889 () Bool)

(assert (=> b!252161 m!267889))

(assert (=> b!252161 m!267861))

(assert (=> b!252156 m!267771))

(assert (=> b!252156 m!267771))

(assert (=> b!252156 m!267791))

(assert (=> b!252165 m!267771))

(assert (=> b!252165 m!267771))

(declare-fun m!267891 () Bool)

(assert (=> b!252165 m!267891))

(declare-fun m!267893 () Bool)

(assert (=> bm!23741 m!267893))

(declare-fun m!267895 () Bool)

(assert (=> b!252172 m!267895))

(assert (=> b!251844 d!61181))

(declare-fun b!252188 () Bool)

(declare-fun c!42492 () Bool)

(declare-fun lt!126311 () (_ BitVec 64))

(assert (=> b!252188 (= c!42492 (= lt!126311 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163529 () SeekEntryResult!1128)

(declare-fun e!163527 () SeekEntryResult!1128)

(assert (=> b!252188 (= e!163529 e!163527)))

(declare-fun b!252189 () Bool)

(declare-fun lt!126312 () SeekEntryResult!1128)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12327 (_ BitVec 32)) SeekEntryResult!1128)

(assert (=> b!252189 (= e!163527 (seekKeyOrZeroReturnVacant!0 (x!24747 lt!126312) (index!6684 lt!126312) (index!6684 lt!126312) key!932 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)))))

(declare-fun b!252190 () Bool)

(declare-fun e!163528 () SeekEntryResult!1128)

(assert (=> b!252190 (= e!163528 Undefined!1128)))

(declare-fun b!252191 () Bool)

(assert (=> b!252191 (= e!163528 e!163529)))

(assert (=> b!252191 (= lt!126311 (select (arr!5842 (_keys!6801 thiss!1504)) (index!6684 lt!126312)))))

(declare-fun c!42490 () Bool)

(assert (=> b!252191 (= c!42490 (= lt!126311 key!932))))

(declare-fun b!252193 () Bool)

(assert (=> b!252193 (= e!163527 (MissingZero!1128 (index!6684 lt!126312)))))

(declare-fun b!252192 () Bool)

(assert (=> b!252192 (= e!163529 (Found!1128 (index!6684 lt!126312)))))

(declare-fun d!61183 () Bool)

(declare-fun lt!126313 () SeekEntryResult!1128)

(assert (=> d!61183 (and (or ((_ is Undefined!1128) lt!126313) (not ((_ is Found!1128) lt!126313)) (and (bvsge (index!6683 lt!126313) #b00000000000000000000000000000000) (bvslt (index!6683 lt!126313) (size!6190 (_keys!6801 thiss!1504))))) (or ((_ is Undefined!1128) lt!126313) ((_ is Found!1128) lt!126313) (not ((_ is MissingZero!1128) lt!126313)) (and (bvsge (index!6682 lt!126313) #b00000000000000000000000000000000) (bvslt (index!6682 lt!126313) (size!6190 (_keys!6801 thiss!1504))))) (or ((_ is Undefined!1128) lt!126313) ((_ is Found!1128) lt!126313) ((_ is MissingZero!1128) lt!126313) (not ((_ is MissingVacant!1128) lt!126313)) (and (bvsge (index!6685 lt!126313) #b00000000000000000000000000000000) (bvslt (index!6685 lt!126313) (size!6190 (_keys!6801 thiss!1504))))) (or ((_ is Undefined!1128) lt!126313) (ite ((_ is Found!1128) lt!126313) (= (select (arr!5842 (_keys!6801 thiss!1504)) (index!6683 lt!126313)) key!932) (ite ((_ is MissingZero!1128) lt!126313) (= (select (arr!5842 (_keys!6801 thiss!1504)) (index!6682 lt!126313)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1128) lt!126313) (= (select (arr!5842 (_keys!6801 thiss!1504)) (index!6685 lt!126313)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61183 (= lt!126313 e!163528)))

(declare-fun c!42491 () Bool)

(assert (=> d!61183 (= c!42491 (and ((_ is Intermediate!1128) lt!126312) (undefined!1940 lt!126312)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12327 (_ BitVec 32)) SeekEntryResult!1128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61183 (= lt!126312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10867 thiss!1504)) key!932 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)))))

(assert (=> d!61183 (validMask!0 (mask!10867 thiss!1504))))

(assert (=> d!61183 (= (seekEntryOrOpen!0 key!932 (_keys!6801 thiss!1504) (mask!10867 thiss!1504)) lt!126313)))

(assert (= (and d!61183 c!42491) b!252190))

(assert (= (and d!61183 (not c!42491)) b!252191))

(assert (= (and b!252191 c!42490) b!252192))

(assert (= (and b!252191 (not c!42490)) b!252188))

(assert (= (and b!252188 c!42492) b!252193))

(assert (= (and b!252188 (not c!42492)) b!252189))

(declare-fun m!267897 () Bool)

(assert (=> b!252189 m!267897))

(declare-fun m!267899 () Bool)

(assert (=> b!252191 m!267899))

(declare-fun m!267901 () Bool)

(assert (=> d!61183 m!267901))

(declare-fun m!267903 () Bool)

(assert (=> d!61183 m!267903))

(declare-fun m!267905 () Bool)

(assert (=> d!61183 m!267905))

(declare-fun m!267907 () Bool)

(assert (=> d!61183 m!267907))

(declare-fun m!267909 () Bool)

(assert (=> d!61183 m!267909))

(assert (=> d!61183 m!267633))

(assert (=> d!61183 m!267907))

(assert (=> b!251852 d!61183))

(declare-fun d!61185 () Bool)

(assert (=> d!61185 (= (inRange!0 (ite c!42415 (index!6682 lt!126118) (index!6685 lt!126118)) (mask!10867 thiss!1504)) (and (bvsge (ite c!42415 (index!6682 lt!126118) (index!6685 lt!126118)) #b00000000000000000000000000000000) (bvslt (ite c!42415 (index!6682 lt!126118) (index!6685 lt!126118)) (bvadd (mask!10867 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23692 d!61185))

(declare-fun mapNonEmpty!11070 () Bool)

(declare-fun mapRes!11070 () Bool)

(declare-fun tp!23220 () Bool)

(declare-fun e!163534 () Bool)

(assert (=> mapNonEmpty!11070 (= mapRes!11070 (and tp!23220 e!163534))))

(declare-fun mapValue!11070 () ValueCell!2909)

(declare-fun mapRest!11070 () (Array (_ BitVec 32) ValueCell!2909))

(declare-fun mapKey!11070 () (_ BitVec 32))

(assert (=> mapNonEmpty!11070 (= mapRest!11061 (store mapRest!11070 mapKey!11070 mapValue!11070))))

(declare-fun condMapEmpty!11070 () Bool)

(declare-fun mapDefault!11070 () ValueCell!2909)

(assert (=> mapNonEmpty!11061 (= condMapEmpty!11070 (= mapRest!11061 ((as const (Array (_ BitVec 32) ValueCell!2909)) mapDefault!11070)))))

(declare-fun e!163535 () Bool)

(assert (=> mapNonEmpty!11061 (= tp!23205 (and e!163535 mapRes!11070))))

(declare-fun mapIsEmpty!11070 () Bool)

(assert (=> mapIsEmpty!11070 mapRes!11070))

(declare-fun b!252200 () Bool)

(assert (=> b!252200 (= e!163534 tp_is_empty!6505)))

(declare-fun b!252201 () Bool)

(assert (=> b!252201 (= e!163535 tp_is_empty!6505)))

(assert (= (and mapNonEmpty!11061 condMapEmpty!11070) mapIsEmpty!11070))

(assert (= (and mapNonEmpty!11061 (not condMapEmpty!11070)) mapNonEmpty!11070))

(assert (= (and mapNonEmpty!11070 ((_ is ValueCellFull!2909) mapValue!11070)) b!252200))

(assert (= (and mapNonEmpty!11061 ((_ is ValueCellFull!2909) mapDefault!11070)) b!252201))

(declare-fun m!267911 () Bool)

(assert (=> mapNonEmpty!11070 m!267911))

(declare-fun b_lambda!8099 () Bool)

(assert (= b_lambda!8097 (or (and b!251857 b_free!6643) b_lambda!8099)))

(check-sat (not b!252108) (not d!61165) (not d!61153) (not d!61155) (not b_lambda!8099) (not bm!23740) (not b!252166) (not b!252083) (not d!61183) (not b!252171) (not b!252096) (not b!252165) (not bm!23714) (not b!252156) (not b!252100) (not b!252162) (not b_next!6643) (not b!252095) (not b!252088) (not bm!23711) (not d!61173) (not b!252164) (not b!252037) (not b!252062) (not b!252075) (not b!252081) (not b!252021) (not bm!23720) (not b!252076) (not d!61169) (not bm!23742) (not b!252110) (not b!252063) tp_is_empty!6505 (not bm!23738) (not b!252172) (not b!252036) (not bm!23722) (not bm!23741) (not b!252049) b_and!13657 (not d!61145) (not d!61171) (not d!61181) (not b!252161) (not mapNonEmpty!11070) (not b!252026) (not b!252039) (not b!252078) (not bm!23710) (not b!252097) (not bm!23721) (not d!61179) (not bm!23717) (not b!252189) (not b!252101))
(check-sat b_and!13657 (not b_next!6643))
