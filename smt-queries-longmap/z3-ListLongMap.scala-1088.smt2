; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22214 () Bool)

(assert start!22214)

(declare-fun b!232850 () Bool)

(declare-fun b_free!6277 () Bool)

(declare-fun b_next!6277 () Bool)

(assert (=> b!232850 (= b_free!6277 (not b_next!6277))))

(declare-fun tp!21973 () Bool)

(declare-fun b_and!13149 () Bool)

(assert (=> b!232850 (= tp!21973 b_and!13149)))

(declare-fun b!232845 () Bool)

(declare-fun e!151244 () Bool)

(declare-fun tp_is_empty!6139 () Bool)

(assert (=> b!232845 (= e!151244 tp_is_empty!6139)))

(declare-fun b!232846 () Bool)

(declare-datatypes ((Unit!7199 0))(
  ( (Unit!7200) )
))
(declare-fun e!151238 () Unit!7199)

(declare-fun Unit!7201 () Unit!7199)

(assert (=> b!232846 (= e!151238 Unit!7201)))

(declare-fun lt!117697 () Unit!7199)

(declare-datatypes ((V!7833 0))(
  ( (V!7834 (val!3114 Int)) )
))
(declare-datatypes ((ValueCell!2726 0))(
  ( (ValueCellFull!2726 (v!5128 V!7833)) (EmptyCell!2726) )
))
(declare-datatypes ((array!11513 0))(
  ( (array!11514 (arr!5475 (Array (_ BitVec 32) ValueCell!2726)) (size!5809 (_ BitVec 32))) )
))
(declare-datatypes ((array!11515 0))(
  ( (array!11516 (arr!5476 (Array (_ BitVec 32) (_ BitVec 64))) (size!5810 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3352 0))(
  ( (LongMapFixedSize!3353 (defaultEntry!4335 Int) (mask!10254 (_ BitVec 32)) (extraKeys!4072 (_ BitVec 32)) (zeroValue!4176 V!7833) (minValue!4176 V!7833) (_size!1725 (_ BitVec 32)) (_keys!6388 array!11515) (_values!4318 array!11513) (_vacant!1725 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3352)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!324 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7833 V!7833 (_ BitVec 64) Int) Unit!7199)

(assert (=> b!232846 (= lt!117697 (lemmaInListMapThenSeekEntryOrOpenFindsIt!324 (_keys!6388 thiss!1504) (_values!4318 thiss!1504) (mask!10254 thiss!1504) (extraKeys!4072 thiss!1504) (zeroValue!4176 thiss!1504) (minValue!4176 thiss!1504) key!932 (defaultEntry!4335 thiss!1504)))))

(assert (=> b!232846 false))

(declare-fun b!232847 () Bool)

(declare-fun res!114280 () Bool)

(declare-fun e!151239 () Bool)

(assert (=> b!232847 (=> (not res!114280) (not e!151239))))

(assert (=> b!232847 (= res!114280 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21638 () Bool)

(declare-fun call!21641 () Bool)

(declare-fun arrayContainsKey!0 (array!11515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21638 (= call!21641 (arrayContainsKey!0 (_keys!6388 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!976 0))(
  ( (MissingZero!976 (index!6074 (_ BitVec 32))) (Found!976 (index!6075 (_ BitVec 32))) (Intermediate!976 (undefined!1788 Bool) (index!6076 (_ BitVec 32)) (x!23595 (_ BitVec 32))) (Undefined!976) (MissingVacant!976 (index!6077 (_ BitVec 32))) )
))
(declare-fun lt!117699 () SeekEntryResult!976)

(declare-fun bm!21639 () Bool)

(declare-fun call!21642 () Bool)

(declare-fun c!38731 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21639 (= call!21642 (inRange!0 (ite c!38731 (index!6074 lt!117699) (index!6077 lt!117699)) (mask!10254 thiss!1504)))))

(declare-fun mapNonEmpty!10378 () Bool)

(declare-fun mapRes!10378 () Bool)

(declare-fun tp!21972 () Bool)

(declare-fun e!151245 () Bool)

(assert (=> mapNonEmpty!10378 (= mapRes!10378 (and tp!21972 e!151245))))

(declare-fun mapValue!10378 () ValueCell!2726)

(declare-fun mapRest!10378 () (Array (_ BitVec 32) ValueCell!2726))

(declare-fun mapKey!10378 () (_ BitVec 32))

(assert (=> mapNonEmpty!10378 (= (arr!5475 (_values!4318 thiss!1504)) (store mapRest!10378 mapKey!10378 mapValue!10378))))

(declare-fun b!232848 () Bool)

(declare-fun res!114275 () Bool)

(assert (=> b!232848 (= res!114275 (= (select (arr!5476 (_keys!6388 thiss!1504)) (index!6077 lt!117699)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151235 () Bool)

(assert (=> b!232848 (=> (not res!114275) (not e!151235))))

(declare-fun b!232849 () Bool)

(declare-fun res!114276 () Bool)

(declare-fun e!151234 () Bool)

(assert (=> b!232849 (=> (not res!114276) (not e!151234))))

(assert (=> b!232849 (= res!114276 call!21642)))

(declare-fun e!151242 () Bool)

(assert (=> b!232849 (= e!151242 e!151234)))

(declare-fun e!151240 () Bool)

(declare-fun e!151243 () Bool)

(declare-fun array_inv!3613 (array!11515) Bool)

(declare-fun array_inv!3614 (array!11513) Bool)

(assert (=> b!232850 (= e!151243 (and tp!21973 tp_is_empty!6139 (array_inv!3613 (_keys!6388 thiss!1504)) (array_inv!3614 (_values!4318 thiss!1504)) e!151240))))

(declare-fun b!232851 () Bool)

(assert (=> b!232851 (= e!151235 (not call!21641))))

(declare-fun b!232852 () Bool)

(declare-fun e!151237 () Bool)

(assert (=> b!232852 (= e!151239 e!151237)))

(declare-fun res!114279 () Bool)

(assert (=> b!232852 (=> (not res!114279) (not e!151237))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232852 (= res!114279 (or (= lt!117699 (MissingZero!976 index!297)) (= lt!117699 (MissingVacant!976 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11515 (_ BitVec 32)) SeekEntryResult!976)

(assert (=> b!232852 (= lt!117699 (seekEntryOrOpen!0 key!932 (_keys!6388 thiss!1504) (mask!10254 thiss!1504)))))

(declare-fun mapIsEmpty!10378 () Bool)

(assert (=> mapIsEmpty!10378 mapRes!10378))

(declare-fun b!232853 () Bool)

(declare-fun lt!117700 () Unit!7199)

(assert (=> b!232853 (= e!151238 lt!117700)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!320 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7833 V!7833 (_ BitVec 64) Int) Unit!7199)

(assert (=> b!232853 (= lt!117700 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!320 (_keys!6388 thiss!1504) (_values!4318 thiss!1504) (mask!10254 thiss!1504) (extraKeys!4072 thiss!1504) (zeroValue!4176 thiss!1504) (minValue!4176 thiss!1504) key!932 (defaultEntry!4335 thiss!1504)))))

(get-info :version)

(assert (=> b!232853 (= c!38731 ((_ is MissingZero!976) lt!117699))))

(assert (=> b!232853 e!151242))

(declare-fun b!232854 () Bool)

(declare-fun e!151236 () Bool)

(assert (=> b!232854 (= e!151236 ((_ is Undefined!976) lt!117699))))

(declare-fun b!232855 () Bool)

(assert (=> b!232855 (= e!151245 tp_is_empty!6139)))

(declare-fun res!114281 () Bool)

(assert (=> start!22214 (=> (not res!114281) (not e!151239))))

(declare-fun valid!1341 (LongMapFixedSize!3352) Bool)

(assert (=> start!22214 (= res!114281 (valid!1341 thiss!1504))))

(assert (=> start!22214 e!151239))

(assert (=> start!22214 e!151243))

(assert (=> start!22214 true))

(declare-fun b!232856 () Bool)

(declare-fun res!114278 () Bool)

(assert (=> b!232856 (=> (not res!114278) (not e!151234))))

(assert (=> b!232856 (= res!114278 (= (select (arr!5476 (_keys!6388 thiss!1504)) (index!6074 lt!117699)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232857 () Bool)

(declare-fun c!38730 () Bool)

(assert (=> b!232857 (= c!38730 ((_ is MissingVacant!976) lt!117699))))

(assert (=> b!232857 (= e!151242 e!151236)))

(declare-fun b!232858 () Bool)

(assert (=> b!232858 (= e!151236 e!151235)))

(declare-fun res!114277 () Bool)

(assert (=> b!232858 (= res!114277 call!21642)))

(assert (=> b!232858 (=> (not res!114277) (not e!151235))))

(declare-fun b!232859 () Bool)

(assert (=> b!232859 (= e!151240 (and e!151244 mapRes!10378))))

(declare-fun condMapEmpty!10378 () Bool)

(declare-fun mapDefault!10378 () ValueCell!2726)

(assert (=> b!232859 (= condMapEmpty!10378 (= (arr!5475 (_values!4318 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2726)) mapDefault!10378)))))

(declare-fun b!232860 () Bool)

(assert (=> b!232860 (= e!151234 (not call!21641))))

(declare-fun b!232861 () Bool)

(assert (=> b!232861 (= e!151237 (not (inRange!0 index!297 (mask!10254 thiss!1504))))))

(declare-fun lt!117698 () Unit!7199)

(assert (=> b!232861 (= lt!117698 e!151238)))

(declare-fun c!38729 () Bool)

(declare-datatypes ((tuple2!4574 0))(
  ( (tuple2!4575 (_1!2298 (_ BitVec 64)) (_2!2298 V!7833)) )
))
(declare-datatypes ((List!3508 0))(
  ( (Nil!3505) (Cons!3504 (h!4152 tuple2!4574) (t!8458 List!3508)) )
))
(declare-datatypes ((ListLongMap!3477 0))(
  ( (ListLongMap!3478 (toList!1754 List!3508)) )
))
(declare-fun contains!1625 (ListLongMap!3477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1263 (array!11515 array!11513 (_ BitVec 32) (_ BitVec 32) V!7833 V!7833 (_ BitVec 32) Int) ListLongMap!3477)

(assert (=> b!232861 (= c!38729 (contains!1625 (getCurrentListMap!1263 (_keys!6388 thiss!1504) (_values!4318 thiss!1504) (mask!10254 thiss!1504) (extraKeys!4072 thiss!1504) (zeroValue!4176 thiss!1504) (minValue!4176 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4335 thiss!1504)) key!932))))

(assert (= (and start!22214 res!114281) b!232847))

(assert (= (and b!232847 res!114280) b!232852))

(assert (= (and b!232852 res!114279) b!232861))

(assert (= (and b!232861 c!38729) b!232846))

(assert (= (and b!232861 (not c!38729)) b!232853))

(assert (= (and b!232853 c!38731) b!232849))

(assert (= (and b!232853 (not c!38731)) b!232857))

(assert (= (and b!232849 res!114276) b!232856))

(assert (= (and b!232856 res!114278) b!232860))

(assert (= (and b!232857 c!38730) b!232858))

(assert (= (and b!232857 (not c!38730)) b!232854))

(assert (= (and b!232858 res!114277) b!232848))

(assert (= (and b!232848 res!114275) b!232851))

(assert (= (or b!232849 b!232858) bm!21639))

(assert (= (or b!232860 b!232851) bm!21638))

(assert (= (and b!232859 condMapEmpty!10378) mapIsEmpty!10378))

(assert (= (and b!232859 (not condMapEmpty!10378)) mapNonEmpty!10378))

(assert (= (and mapNonEmpty!10378 ((_ is ValueCellFull!2726) mapValue!10378)) b!232855))

(assert (= (and b!232859 ((_ is ValueCellFull!2726) mapDefault!10378)) b!232845))

(assert (= b!232850 b!232859))

(assert (= start!22214 b!232850))

(declare-fun m!253885 () Bool)

(assert (=> b!232846 m!253885))

(declare-fun m!253887 () Bool)

(assert (=> b!232848 m!253887))

(declare-fun m!253889 () Bool)

(assert (=> b!232856 m!253889))

(declare-fun m!253891 () Bool)

(assert (=> bm!21639 m!253891))

(declare-fun m!253893 () Bool)

(assert (=> b!232852 m!253893))

(declare-fun m!253895 () Bool)

(assert (=> b!232853 m!253895))

(declare-fun m!253897 () Bool)

(assert (=> b!232850 m!253897))

(declare-fun m!253899 () Bool)

(assert (=> b!232850 m!253899))

(declare-fun m!253901 () Bool)

(assert (=> start!22214 m!253901))

(declare-fun m!253903 () Bool)

(assert (=> b!232861 m!253903))

(declare-fun m!253905 () Bool)

(assert (=> b!232861 m!253905))

(assert (=> b!232861 m!253905))

(declare-fun m!253907 () Bool)

(assert (=> b!232861 m!253907))

(declare-fun m!253909 () Bool)

(assert (=> mapNonEmpty!10378 m!253909))

(declare-fun m!253911 () Bool)

(assert (=> bm!21638 m!253911))

(check-sat (not b!232861) (not bm!21639) tp_is_empty!6139 (not b!232853) (not mapNonEmpty!10378) (not b_next!6277) (not b!232852) (not b!232846) (not b!232850) b_and!13149 (not bm!21638) (not start!22214))
(check-sat b_and!13149 (not b_next!6277))
