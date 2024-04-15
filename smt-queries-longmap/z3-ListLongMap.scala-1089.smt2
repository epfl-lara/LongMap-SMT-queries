; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22220 () Bool)

(assert start!22220)

(declare-fun b!232985 () Bool)

(declare-fun b_free!6283 () Bool)

(declare-fun b_next!6283 () Bool)

(assert (=> b!232985 (= b_free!6283 (not b_next!6283))))

(declare-fun tp!21991 () Bool)

(declare-fun b_and!13155 () Bool)

(assert (=> b!232985 (= tp!21991 b_and!13155)))

(declare-fun b!232980 () Bool)

(declare-fun res!114333 () Bool)

(declare-fun e!151334 () Bool)

(assert (=> b!232980 (=> (not res!114333) (not e!151334))))

(declare-datatypes ((V!7841 0))(
  ( (V!7842 (val!3117 Int)) )
))
(declare-datatypes ((ValueCell!2729 0))(
  ( (ValueCellFull!2729 (v!5131 V!7841)) (EmptyCell!2729) )
))
(declare-datatypes ((array!11525 0))(
  ( (array!11526 (arr!5481 (Array (_ BitVec 32) ValueCell!2729)) (size!5815 (_ BitVec 32))) )
))
(declare-datatypes ((array!11527 0))(
  ( (array!11528 (arr!5482 (Array (_ BitVec 32) (_ BitVec 64))) (size!5816 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3358 0))(
  ( (LongMapFixedSize!3359 (defaultEntry!4338 Int) (mask!10259 (_ BitVec 32)) (extraKeys!4075 (_ BitVec 32)) (zeroValue!4179 V!7841) (minValue!4179 V!7841) (_size!1728 (_ BitVec 32)) (_keys!6391 array!11527) (_values!4321 array!11525) (_vacant!1728 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3358)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4580 0))(
  ( (tuple2!4581 (_1!2301 (_ BitVec 64)) (_2!2301 V!7841)) )
))
(declare-datatypes ((List!3511 0))(
  ( (Nil!3508) (Cons!3507 (h!4155 tuple2!4580) (t!8461 List!3511)) )
))
(declare-datatypes ((ListLongMap!3483 0))(
  ( (ListLongMap!3484 (toList!1757 List!3511)) )
))
(declare-fun contains!1628 (ListLongMap!3483 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1266 (array!11527 array!11525 (_ BitVec 32) (_ BitVec 32) V!7841 V!7841 (_ BitVec 32) Int) ListLongMap!3483)

(assert (=> b!232980 (= res!114333 (contains!1628 (getCurrentListMap!1266 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)) key!932))))

(declare-fun b!232981 () Bool)

(declare-fun e!151333 () Bool)

(assert (=> b!232981 (= e!151333 e!151334)))

(declare-fun res!114332 () Bool)

(assert (=> b!232981 (=> (not res!114332) (not e!151334))))

(declare-datatypes ((SeekEntryResult!979 0))(
  ( (MissingZero!979 (index!6086 (_ BitVec 32))) (Found!979 (index!6087 (_ BitVec 32))) (Intermediate!979 (undefined!1791 Bool) (index!6088 (_ BitVec 32)) (x!23606 (_ BitVec 32))) (Undefined!979) (MissingVacant!979 (index!6089 (_ BitVec 32))) )
))
(declare-fun lt!117727 () SeekEntryResult!979)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232981 (= res!114332 (or (= lt!117727 (MissingZero!979 index!297)) (= lt!117727 (MissingVacant!979 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11527 (_ BitVec 32)) SeekEntryResult!979)

(assert (=> b!232981 (= lt!117727 (seekEntryOrOpen!0 key!932 (_keys!6391 thiss!1504) (mask!10259 thiss!1504)))))

(declare-fun mapIsEmpty!10387 () Bool)

(declare-fun mapRes!10387 () Bool)

(assert (=> mapIsEmpty!10387 mapRes!10387))

(declare-fun b!232982 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!232982 (= e!151334 (not (validMask!0 (mask!10259 thiss!1504))))))

(declare-fun mapNonEmpty!10387 () Bool)

(declare-fun tp!21990 () Bool)

(declare-fun e!151332 () Bool)

(assert (=> mapNonEmpty!10387 (= mapRes!10387 (and tp!21990 e!151332))))

(declare-fun mapValue!10387 () ValueCell!2729)

(declare-fun mapKey!10387 () (_ BitVec 32))

(declare-fun mapRest!10387 () (Array (_ BitVec 32) ValueCell!2729))

(assert (=> mapNonEmpty!10387 (= (arr!5481 (_values!4321 thiss!1504)) (store mapRest!10387 mapKey!10387 mapValue!10387))))

(declare-fun b!232983 () Bool)

(declare-fun tp_is_empty!6145 () Bool)

(assert (=> b!232983 (= e!151332 tp_is_empty!6145)))

(declare-fun b!232984 () Bool)

(declare-fun e!151336 () Bool)

(declare-fun e!151337 () Bool)

(assert (=> b!232984 (= e!151336 (and e!151337 mapRes!10387))))

(declare-fun condMapEmpty!10387 () Bool)

(declare-fun mapDefault!10387 () ValueCell!2729)

(assert (=> b!232984 (= condMapEmpty!10387 (= (arr!5481 (_values!4321 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2729)) mapDefault!10387)))))

(declare-fun res!114335 () Bool)

(assert (=> start!22220 (=> (not res!114335) (not e!151333))))

(declare-fun valid!1344 (LongMapFixedSize!3358) Bool)

(assert (=> start!22220 (= res!114335 (valid!1344 thiss!1504))))

(assert (=> start!22220 e!151333))

(declare-fun e!151338 () Bool)

(assert (=> start!22220 e!151338))

(assert (=> start!22220 true))

(declare-fun array_inv!3617 (array!11527) Bool)

(declare-fun array_inv!3618 (array!11525) Bool)

(assert (=> b!232985 (= e!151338 (and tp!21991 tp_is_empty!6145 (array_inv!3617 (_keys!6391 thiss!1504)) (array_inv!3618 (_values!4321 thiss!1504)) e!151336))))

(declare-fun b!232986 () Bool)

(declare-fun res!114334 () Bool)

(assert (=> b!232986 (=> (not res!114334) (not e!151333))))

(assert (=> b!232986 (= res!114334 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232987 () Bool)

(assert (=> b!232987 (= e!151337 tp_is_empty!6145)))

(assert (= (and start!22220 res!114335) b!232986))

(assert (= (and b!232986 res!114334) b!232981))

(assert (= (and b!232981 res!114332) b!232980))

(assert (= (and b!232980 res!114333) b!232982))

(assert (= (and b!232984 condMapEmpty!10387) mapIsEmpty!10387))

(assert (= (and b!232984 (not condMapEmpty!10387)) mapNonEmpty!10387))

(get-info :version)

(assert (= (and mapNonEmpty!10387 ((_ is ValueCellFull!2729) mapValue!10387)) b!232983))

(assert (= (and b!232984 ((_ is ValueCellFull!2729) mapDefault!10387)) b!232987))

(assert (= b!232985 b!232984))

(assert (= start!22220 b!232985))

(declare-fun m!253969 () Bool)

(assert (=> start!22220 m!253969))

(declare-fun m!253971 () Bool)

(assert (=> b!232985 m!253971))

(declare-fun m!253973 () Bool)

(assert (=> b!232985 m!253973))

(declare-fun m!253975 () Bool)

(assert (=> b!232981 m!253975))

(declare-fun m!253977 () Bool)

(assert (=> mapNonEmpty!10387 m!253977))

(declare-fun m!253979 () Bool)

(assert (=> b!232980 m!253979))

(assert (=> b!232980 m!253979))

(declare-fun m!253981 () Bool)

(assert (=> b!232980 m!253981))

(declare-fun m!253983 () Bool)

(assert (=> b!232982 m!253983))

(check-sat tp_is_empty!6145 b_and!13155 (not mapNonEmpty!10387) (not b!232985) (not b!232982) (not start!22220) (not b_next!6283) (not b!232981) (not b!232980))
(check-sat b_and!13155 (not b_next!6283))
(get-model)

(declare-fun d!58715 () Bool)

(declare-fun e!151385 () Bool)

(assert (=> d!58715 e!151385))

(declare-fun res!114362 () Bool)

(assert (=> d!58715 (=> res!114362 e!151385)))

(declare-fun lt!117742 () Bool)

(assert (=> d!58715 (= res!114362 (not lt!117742))))

(declare-fun lt!117743 () Bool)

(assert (=> d!58715 (= lt!117742 lt!117743)))

(declare-datatypes ((Unit!7206 0))(
  ( (Unit!7207) )
))
(declare-fun lt!117744 () Unit!7206)

(declare-fun e!151386 () Unit!7206)

(assert (=> d!58715 (= lt!117744 e!151386)))

(declare-fun c!38752 () Bool)

(assert (=> d!58715 (= c!38752 lt!117743)))

(declare-fun containsKey!251 (List!3511 (_ BitVec 64)) Bool)

(assert (=> d!58715 (= lt!117743 (containsKey!251 (toList!1757 (getCurrentListMap!1266 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504))) key!932))))

(assert (=> d!58715 (= (contains!1628 (getCurrentListMap!1266 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)) key!932) lt!117742)))

(declare-fun b!233042 () Bool)

(declare-fun lt!117745 () Unit!7206)

(assert (=> b!233042 (= e!151386 lt!117745)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!200 (List!3511 (_ BitVec 64)) Unit!7206)

(assert (=> b!233042 (= lt!117745 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1757 (getCurrentListMap!1266 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504))) key!932))))

(declare-datatypes ((Option!265 0))(
  ( (Some!264 (v!5134 V!7841)) (None!263) )
))
(declare-fun isDefined!201 (Option!265) Bool)

(declare-fun getValueByKey!259 (List!3511 (_ BitVec 64)) Option!265)

(assert (=> b!233042 (isDefined!201 (getValueByKey!259 (toList!1757 (getCurrentListMap!1266 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504))) key!932))))

(declare-fun b!233043 () Bool)

(declare-fun Unit!7208 () Unit!7206)

(assert (=> b!233043 (= e!151386 Unit!7208)))

(declare-fun b!233044 () Bool)

(assert (=> b!233044 (= e!151385 (isDefined!201 (getValueByKey!259 (toList!1757 (getCurrentListMap!1266 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504))) key!932)))))

(assert (= (and d!58715 c!38752) b!233042))

(assert (= (and d!58715 (not c!38752)) b!233043))

(assert (= (and d!58715 (not res!114362)) b!233044))

(declare-fun m!254017 () Bool)

(assert (=> d!58715 m!254017))

(declare-fun m!254019 () Bool)

(assert (=> b!233042 m!254019))

(declare-fun m!254021 () Bool)

(assert (=> b!233042 m!254021))

(assert (=> b!233042 m!254021))

(declare-fun m!254023 () Bool)

(assert (=> b!233042 m!254023))

(assert (=> b!233044 m!254021))

(assert (=> b!233044 m!254021))

(assert (=> b!233044 m!254023))

(assert (=> b!232980 d!58715))

(declare-fun bm!21666 () Bool)

(declare-fun call!21669 () ListLongMap!3483)

(declare-fun call!21673 () ListLongMap!3483)

(assert (=> bm!21666 (= call!21669 call!21673)))

(declare-fun b!233087 () Bool)

(declare-fun res!114388 () Bool)

(declare-fun e!151424 () Bool)

(assert (=> b!233087 (=> (not res!114388) (not e!151424))))

(declare-fun e!151414 () Bool)

(assert (=> b!233087 (= res!114388 e!151414)))

(declare-fun res!114382 () Bool)

(assert (=> b!233087 (=> res!114382 e!151414)))

(declare-fun e!151423 () Bool)

(assert (=> b!233087 (= res!114382 (not e!151423))))

(declare-fun res!114383 () Bool)

(assert (=> b!233087 (=> (not res!114383) (not e!151423))))

(assert (=> b!233087 (= res!114383 (bvslt #b00000000000000000000000000000000 (size!5816 (_keys!6391 thiss!1504))))))

(declare-fun bm!21667 () Bool)

(declare-fun call!21675 () Bool)

(declare-fun lt!117806 () ListLongMap!3483)

(assert (=> bm!21667 (= call!21675 (contains!1628 lt!117806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233088 () Bool)

(declare-fun e!151417 () Unit!7206)

(declare-fun lt!117790 () Unit!7206)

(assert (=> b!233088 (= e!151417 lt!117790)))

(declare-fun lt!117808 () ListLongMap!3483)

(declare-fun getCurrentListMapNoExtraKeys!519 (array!11527 array!11525 (_ BitVec 32) (_ BitVec 32) V!7841 V!7841 (_ BitVec 32) Int) ListLongMap!3483)

(assert (=> b!233088 (= lt!117808 (getCurrentListMapNoExtraKeys!519 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun lt!117801 () (_ BitVec 64))

(assert (=> b!233088 (= lt!117801 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117794 () (_ BitVec 64))

(assert (=> b!233088 (= lt!117794 (select (arr!5482 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117802 () Unit!7206)

(declare-fun addStillContains!179 (ListLongMap!3483 (_ BitVec 64) V!7841 (_ BitVec 64)) Unit!7206)

(assert (=> b!233088 (= lt!117802 (addStillContains!179 lt!117808 lt!117801 (zeroValue!4179 thiss!1504) lt!117794))))

(declare-fun +!636 (ListLongMap!3483 tuple2!4580) ListLongMap!3483)

(assert (=> b!233088 (contains!1628 (+!636 lt!117808 (tuple2!4581 lt!117801 (zeroValue!4179 thiss!1504))) lt!117794)))

(declare-fun lt!117793 () Unit!7206)

(assert (=> b!233088 (= lt!117793 lt!117802)))

(declare-fun lt!117804 () ListLongMap!3483)

(assert (=> b!233088 (= lt!117804 (getCurrentListMapNoExtraKeys!519 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun lt!117807 () (_ BitVec 64))

(assert (=> b!233088 (= lt!117807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117796 () (_ BitVec 64))

(assert (=> b!233088 (= lt!117796 (select (arr!5482 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117809 () Unit!7206)

(declare-fun addApplyDifferent!179 (ListLongMap!3483 (_ BitVec 64) V!7841 (_ BitVec 64)) Unit!7206)

(assert (=> b!233088 (= lt!117809 (addApplyDifferent!179 lt!117804 lt!117807 (minValue!4179 thiss!1504) lt!117796))))

(declare-fun apply!203 (ListLongMap!3483 (_ BitVec 64)) V!7841)

(assert (=> b!233088 (= (apply!203 (+!636 lt!117804 (tuple2!4581 lt!117807 (minValue!4179 thiss!1504))) lt!117796) (apply!203 lt!117804 lt!117796))))

(declare-fun lt!117799 () Unit!7206)

(assert (=> b!233088 (= lt!117799 lt!117809)))

(declare-fun lt!117800 () ListLongMap!3483)

(assert (=> b!233088 (= lt!117800 (getCurrentListMapNoExtraKeys!519 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun lt!117805 () (_ BitVec 64))

(assert (=> b!233088 (= lt!117805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117810 () (_ BitVec 64))

(assert (=> b!233088 (= lt!117810 (select (arr!5482 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117792 () Unit!7206)

(assert (=> b!233088 (= lt!117792 (addApplyDifferent!179 lt!117800 lt!117805 (zeroValue!4179 thiss!1504) lt!117810))))

(assert (=> b!233088 (= (apply!203 (+!636 lt!117800 (tuple2!4581 lt!117805 (zeroValue!4179 thiss!1504))) lt!117810) (apply!203 lt!117800 lt!117810))))

(declare-fun lt!117795 () Unit!7206)

(assert (=> b!233088 (= lt!117795 lt!117792)))

(declare-fun lt!117797 () ListLongMap!3483)

(assert (=> b!233088 (= lt!117797 (getCurrentListMapNoExtraKeys!519 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun lt!117791 () (_ BitVec 64))

(assert (=> b!233088 (= lt!117791 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117803 () (_ BitVec 64))

(assert (=> b!233088 (= lt!117803 (select (arr!5482 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233088 (= lt!117790 (addApplyDifferent!179 lt!117797 lt!117791 (minValue!4179 thiss!1504) lt!117803))))

(assert (=> b!233088 (= (apply!203 (+!636 lt!117797 (tuple2!4581 lt!117791 (minValue!4179 thiss!1504))) lt!117803) (apply!203 lt!117797 lt!117803))))

(declare-fun b!233089 () Bool)

(declare-fun e!151420 () Bool)

(declare-fun e!151425 () Bool)

(assert (=> b!233089 (= e!151420 e!151425)))

(declare-fun res!114387 () Bool)

(assert (=> b!233089 (= res!114387 call!21675)))

(assert (=> b!233089 (=> (not res!114387) (not e!151425))))

(declare-fun b!233090 () Bool)

(declare-fun e!151421 () Bool)

(declare-fun get!2804 (ValueCell!2729 V!7841) V!7841)

(declare-fun dynLambda!537 (Int (_ BitVec 64)) V!7841)

(assert (=> b!233090 (= e!151421 (= (apply!203 lt!117806 (select (arr!5482 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000)) (get!2804 (select (arr!5481 (_values!4321 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!537 (defaultEntry!4338 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5815 (_values!4321 thiss!1504))))))

(assert (=> b!233090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5816 (_keys!6391 thiss!1504))))))

(declare-fun b!233091 () Bool)

(declare-fun res!114385 () Bool)

(assert (=> b!233091 (=> (not res!114385) (not e!151424))))

(declare-fun e!151422 () Bool)

(assert (=> b!233091 (= res!114385 e!151422)))

(declare-fun c!38766 () Bool)

(assert (=> b!233091 (= c!38766 (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!233092 () Bool)

(declare-fun e!151419 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233092 (= e!151419 (validKeyInArray!0 (select (arr!5482 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233093 () Bool)

(assert (=> b!233093 (= e!151424 e!151420)))

(declare-fun c!38768 () Bool)

(assert (=> b!233093 (= c!38768 (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233094 () Bool)

(declare-fun c!38767 () Bool)

(assert (=> b!233094 (= c!38767 (and (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!151415 () ListLongMap!3483)

(declare-fun e!151416 () ListLongMap!3483)

(assert (=> b!233094 (= e!151415 e!151416)))

(declare-fun b!233095 () Bool)

(assert (=> b!233095 (= e!151425 (= (apply!203 lt!117806 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4179 thiss!1504)))))

(declare-fun b!233096 () Bool)

(declare-fun call!21670 () Bool)

(assert (=> b!233096 (= e!151422 (not call!21670))))

(declare-fun bm!21668 () Bool)

(assert (=> bm!21668 (= call!21670 (contains!1628 lt!117806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!58717 () Bool)

(assert (=> d!58717 e!151424))

(declare-fun res!114386 () Bool)

(assert (=> d!58717 (=> (not res!114386) (not e!151424))))

(assert (=> d!58717 (= res!114386 (or (bvsge #b00000000000000000000000000000000 (size!5816 (_keys!6391 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5816 (_keys!6391 thiss!1504))))))))

(declare-fun lt!117811 () ListLongMap!3483)

(assert (=> d!58717 (= lt!117806 lt!117811)))

(declare-fun lt!117798 () Unit!7206)

(assert (=> d!58717 (= lt!117798 e!151417)))

(declare-fun c!38770 () Bool)

(assert (=> d!58717 (= c!38770 e!151419)))

(declare-fun res!114384 () Bool)

(assert (=> d!58717 (=> (not res!114384) (not e!151419))))

(assert (=> d!58717 (= res!114384 (bvslt #b00000000000000000000000000000000 (size!5816 (_keys!6391 thiss!1504))))))

(declare-fun e!151418 () ListLongMap!3483)

(assert (=> d!58717 (= lt!117811 e!151418)))

(declare-fun c!38769 () Bool)

(assert (=> d!58717 (= c!38769 (and (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58717 (validMask!0 (mask!10259 thiss!1504))))

(assert (=> d!58717 (= (getCurrentListMap!1266 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)) lt!117806)))

(declare-fun b!233097 () Bool)

(declare-fun e!151413 () Bool)

(assert (=> b!233097 (= e!151413 (= (apply!203 lt!117806 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4179 thiss!1504)))))

(declare-fun bm!21669 () Bool)

(declare-fun call!21672 () ListLongMap!3483)

(declare-fun call!21671 () ListLongMap!3483)

(assert (=> bm!21669 (= call!21672 call!21671)))

(declare-fun bm!21670 () Bool)

(declare-fun call!21674 () ListLongMap!3483)

(assert (=> bm!21670 (= call!21674 (getCurrentListMapNoExtraKeys!519 (_keys!6391 thiss!1504) (_values!4321 thiss!1504) (mask!10259 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun b!233098 () Bool)

(assert (=> b!233098 (= e!151422 e!151413)))

(declare-fun res!114381 () Bool)

(assert (=> b!233098 (= res!114381 call!21670)))

(assert (=> b!233098 (=> (not res!114381) (not e!151413))))

(declare-fun b!233099 () Bool)

(declare-fun Unit!7209 () Unit!7206)

(assert (=> b!233099 (= e!151417 Unit!7209)))

(declare-fun b!233100 () Bool)

(assert (=> b!233100 (= e!151418 (+!636 call!21673 (tuple2!4581 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4179 thiss!1504))))))

(declare-fun b!233101 () Bool)

(assert (=> b!233101 (= e!151416 call!21669)))

(declare-fun bm!21671 () Bool)

(assert (=> bm!21671 (= call!21671 call!21674)))

(declare-fun b!233102 () Bool)

(assert (=> b!233102 (= e!151416 call!21672)))

(declare-fun b!233103 () Bool)

(assert (=> b!233103 (= e!151423 (validKeyInArray!0 (select (arr!5482 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233104 () Bool)

(assert (=> b!233104 (= e!151418 e!151415)))

(declare-fun c!38765 () Bool)

(assert (=> b!233104 (= c!38765 (and (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233105 () Bool)

(assert (=> b!233105 (= e!151415 call!21669)))

(declare-fun b!233106 () Bool)

(assert (=> b!233106 (= e!151420 (not call!21675))))

(declare-fun b!233107 () Bool)

(assert (=> b!233107 (= e!151414 e!151421)))

(declare-fun res!114389 () Bool)

(assert (=> b!233107 (=> (not res!114389) (not e!151421))))

(assert (=> b!233107 (= res!114389 (contains!1628 lt!117806 (select (arr!5482 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5816 (_keys!6391 thiss!1504))))))

(declare-fun bm!21672 () Bool)

(assert (=> bm!21672 (= call!21673 (+!636 (ite c!38769 call!21674 (ite c!38765 call!21671 call!21672)) (ite (or c!38769 c!38765) (tuple2!4581 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4179 thiss!1504)) (tuple2!4581 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4179 thiss!1504)))))))

(assert (= (and d!58717 c!38769) b!233100))

(assert (= (and d!58717 (not c!38769)) b!233104))

(assert (= (and b!233104 c!38765) b!233105))

(assert (= (and b!233104 (not c!38765)) b!233094))

(assert (= (and b!233094 c!38767) b!233101))

(assert (= (and b!233094 (not c!38767)) b!233102))

(assert (= (or b!233101 b!233102) bm!21669))

(assert (= (or b!233105 bm!21669) bm!21671))

(assert (= (or b!233105 b!233101) bm!21666))

(assert (= (or b!233100 bm!21671) bm!21670))

(assert (= (or b!233100 bm!21666) bm!21672))

(assert (= (and d!58717 res!114384) b!233092))

(assert (= (and d!58717 c!38770) b!233088))

(assert (= (and d!58717 (not c!38770)) b!233099))

(assert (= (and d!58717 res!114386) b!233087))

(assert (= (and b!233087 res!114383) b!233103))

(assert (= (and b!233087 (not res!114382)) b!233107))

(assert (= (and b!233107 res!114389) b!233090))

(assert (= (and b!233087 res!114388) b!233091))

(assert (= (and b!233091 c!38766) b!233098))

(assert (= (and b!233091 (not c!38766)) b!233096))

(assert (= (and b!233098 res!114381) b!233097))

(assert (= (or b!233098 b!233096) bm!21668))

(assert (= (and b!233091 res!114385) b!233093))

(assert (= (and b!233093 c!38768) b!233089))

(assert (= (and b!233093 (not c!38768)) b!233106))

(assert (= (and b!233089 res!114387) b!233095))

(assert (= (or b!233089 b!233106) bm!21667))

(declare-fun b_lambda!7825 () Bool)

(assert (=> (not b_lambda!7825) (not b!233090)))

(declare-fun t!8465 () Bool)

(declare-fun tb!2911 () Bool)

(assert (=> (and b!232985 (= (defaultEntry!4338 thiss!1504) (defaultEntry!4338 thiss!1504)) t!8465) tb!2911))

(declare-fun result!5071 () Bool)

(assert (=> tb!2911 (= result!5071 tp_is_empty!6145)))

(assert (=> b!233090 t!8465))

(declare-fun b_and!13161 () Bool)

(assert (= b_and!13155 (and (=> t!8465 result!5071) b_and!13161)))

(assert (=> d!58717 m!253983))

(declare-fun m!254025 () Bool)

(assert (=> bm!21672 m!254025))

(declare-fun m!254027 () Bool)

(assert (=> bm!21670 m!254027))

(declare-fun m!254029 () Bool)

(assert (=> b!233097 m!254029))

(declare-fun m!254031 () Bool)

(assert (=> b!233100 m!254031))

(declare-fun m!254033 () Bool)

(assert (=> b!233103 m!254033))

(assert (=> b!233103 m!254033))

(declare-fun m!254035 () Bool)

(assert (=> b!233103 m!254035))

(declare-fun m!254037 () Bool)

(assert (=> bm!21667 m!254037))

(declare-fun m!254039 () Bool)

(assert (=> bm!21668 m!254039))

(declare-fun m!254041 () Bool)

(assert (=> b!233088 m!254041))

(declare-fun m!254043 () Bool)

(assert (=> b!233088 m!254043))

(assert (=> b!233088 m!254043))

(declare-fun m!254045 () Bool)

(assert (=> b!233088 m!254045))

(declare-fun m!254047 () Bool)

(assert (=> b!233088 m!254047))

(declare-fun m!254049 () Bool)

(assert (=> b!233088 m!254049))

(declare-fun m!254051 () Bool)

(assert (=> b!233088 m!254051))

(declare-fun m!254053 () Bool)

(assert (=> b!233088 m!254053))

(declare-fun m!254055 () Bool)

(assert (=> b!233088 m!254055))

(declare-fun m!254057 () Bool)

(assert (=> b!233088 m!254057))

(declare-fun m!254059 () Bool)

(assert (=> b!233088 m!254059))

(declare-fun m!254061 () Bool)

(assert (=> b!233088 m!254061))

(assert (=> b!233088 m!254061))

(declare-fun m!254063 () Bool)

(assert (=> b!233088 m!254063))

(assert (=> b!233088 m!254055))

(declare-fun m!254065 () Bool)

(assert (=> b!233088 m!254065))

(assert (=> b!233088 m!254027))

(assert (=> b!233088 m!254057))

(declare-fun m!254067 () Bool)

(assert (=> b!233088 m!254067))

(declare-fun m!254069 () Bool)

(assert (=> b!233088 m!254069))

(assert (=> b!233088 m!254033))

(assert (=> b!233107 m!254033))

(assert (=> b!233107 m!254033))

(declare-fun m!254071 () Bool)

(assert (=> b!233107 m!254071))

(declare-fun m!254073 () Bool)

(assert (=> b!233095 m!254073))

(declare-fun m!254075 () Bool)

(assert (=> b!233090 m!254075))

(assert (=> b!233090 m!254033))

(assert (=> b!233090 m!254075))

(declare-fun m!254077 () Bool)

(assert (=> b!233090 m!254077))

(declare-fun m!254079 () Bool)

(assert (=> b!233090 m!254079))

(assert (=> b!233090 m!254077))

(assert (=> b!233090 m!254033))

(declare-fun m!254081 () Bool)

(assert (=> b!233090 m!254081))

(assert (=> b!233092 m!254033))

(assert (=> b!233092 m!254033))

(assert (=> b!233092 m!254035))

(assert (=> b!232980 d!58717))

(declare-fun d!58719 () Bool)

(assert (=> d!58719 (= (array_inv!3617 (_keys!6391 thiss!1504)) (bvsge (size!5816 (_keys!6391 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!232985 d!58719))

(declare-fun d!58721 () Bool)

(assert (=> d!58721 (= (array_inv!3618 (_values!4321 thiss!1504)) (bvsge (size!5815 (_values!4321 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!232985 d!58721))

(declare-fun b!233122 () Bool)

(declare-fun e!151432 () SeekEntryResult!979)

(assert (=> b!233122 (= e!151432 Undefined!979)))

(declare-fun d!58723 () Bool)

(declare-fun lt!117819 () SeekEntryResult!979)

(assert (=> d!58723 (and (or ((_ is Undefined!979) lt!117819) (not ((_ is Found!979) lt!117819)) (and (bvsge (index!6087 lt!117819) #b00000000000000000000000000000000) (bvslt (index!6087 lt!117819) (size!5816 (_keys!6391 thiss!1504))))) (or ((_ is Undefined!979) lt!117819) ((_ is Found!979) lt!117819) (not ((_ is MissingZero!979) lt!117819)) (and (bvsge (index!6086 lt!117819) #b00000000000000000000000000000000) (bvslt (index!6086 lt!117819) (size!5816 (_keys!6391 thiss!1504))))) (or ((_ is Undefined!979) lt!117819) ((_ is Found!979) lt!117819) ((_ is MissingZero!979) lt!117819) (not ((_ is MissingVacant!979) lt!117819)) (and (bvsge (index!6089 lt!117819) #b00000000000000000000000000000000) (bvslt (index!6089 lt!117819) (size!5816 (_keys!6391 thiss!1504))))) (or ((_ is Undefined!979) lt!117819) (ite ((_ is Found!979) lt!117819) (= (select (arr!5482 (_keys!6391 thiss!1504)) (index!6087 lt!117819)) key!932) (ite ((_ is MissingZero!979) lt!117819) (= (select (arr!5482 (_keys!6391 thiss!1504)) (index!6086 lt!117819)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!979) lt!117819) (= (select (arr!5482 (_keys!6391 thiss!1504)) (index!6089 lt!117819)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58723 (= lt!117819 e!151432)))

(declare-fun c!38779 () Bool)

(declare-fun lt!117820 () SeekEntryResult!979)

(assert (=> d!58723 (= c!38779 (and ((_ is Intermediate!979) lt!117820) (undefined!1791 lt!117820)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11527 (_ BitVec 32)) SeekEntryResult!979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58723 (= lt!117820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10259 thiss!1504)) key!932 (_keys!6391 thiss!1504) (mask!10259 thiss!1504)))))

(assert (=> d!58723 (validMask!0 (mask!10259 thiss!1504))))

(assert (=> d!58723 (= (seekEntryOrOpen!0 key!932 (_keys!6391 thiss!1504) (mask!10259 thiss!1504)) lt!117819)))

(declare-fun b!233123 () Bool)

(declare-fun e!151433 () SeekEntryResult!979)

(assert (=> b!233123 (= e!151432 e!151433)))

(declare-fun lt!117818 () (_ BitVec 64))

(assert (=> b!233123 (= lt!117818 (select (arr!5482 (_keys!6391 thiss!1504)) (index!6088 lt!117820)))))

(declare-fun c!38777 () Bool)

(assert (=> b!233123 (= c!38777 (= lt!117818 key!932))))

(declare-fun b!233124 () Bool)

(declare-fun e!151434 () SeekEntryResult!979)

(assert (=> b!233124 (= e!151434 (MissingZero!979 (index!6088 lt!117820)))))

(declare-fun b!233125 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11527 (_ BitVec 32)) SeekEntryResult!979)

(assert (=> b!233125 (= e!151434 (seekKeyOrZeroReturnVacant!0 (x!23606 lt!117820) (index!6088 lt!117820) (index!6088 lt!117820) key!932 (_keys!6391 thiss!1504) (mask!10259 thiss!1504)))))

(declare-fun b!233126 () Bool)

(declare-fun c!38778 () Bool)

(assert (=> b!233126 (= c!38778 (= lt!117818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233126 (= e!151433 e!151434)))

(declare-fun b!233127 () Bool)

(assert (=> b!233127 (= e!151433 (Found!979 (index!6088 lt!117820)))))

(assert (= (and d!58723 c!38779) b!233122))

(assert (= (and d!58723 (not c!38779)) b!233123))

(assert (= (and b!233123 c!38777) b!233127))

(assert (= (and b!233123 (not c!38777)) b!233126))

(assert (= (and b!233126 c!38778) b!233124))

(assert (= (and b!233126 (not c!38778)) b!233125))

(declare-fun m!254083 () Bool)

(assert (=> d!58723 m!254083))

(declare-fun m!254085 () Bool)

(assert (=> d!58723 m!254085))

(assert (=> d!58723 m!253983))

(declare-fun m!254087 () Bool)

(assert (=> d!58723 m!254087))

(declare-fun m!254089 () Bool)

(assert (=> d!58723 m!254089))

(declare-fun m!254091 () Bool)

(assert (=> d!58723 m!254091))

(assert (=> d!58723 m!254087))

(declare-fun m!254093 () Bool)

(assert (=> b!233123 m!254093))

(declare-fun m!254095 () Bool)

(assert (=> b!233125 m!254095))

(assert (=> b!232981 d!58723))

(declare-fun d!58725 () Bool)

(assert (=> d!58725 (= (validMask!0 (mask!10259 thiss!1504)) (and (or (= (mask!10259 thiss!1504) #b00000000000000000000000000000111) (= (mask!10259 thiss!1504) #b00000000000000000000000000001111) (= (mask!10259 thiss!1504) #b00000000000000000000000000011111) (= (mask!10259 thiss!1504) #b00000000000000000000000000111111) (= (mask!10259 thiss!1504) #b00000000000000000000000001111111) (= (mask!10259 thiss!1504) #b00000000000000000000000011111111) (= (mask!10259 thiss!1504) #b00000000000000000000000111111111) (= (mask!10259 thiss!1504) #b00000000000000000000001111111111) (= (mask!10259 thiss!1504) #b00000000000000000000011111111111) (= (mask!10259 thiss!1504) #b00000000000000000000111111111111) (= (mask!10259 thiss!1504) #b00000000000000000001111111111111) (= (mask!10259 thiss!1504) #b00000000000000000011111111111111) (= (mask!10259 thiss!1504) #b00000000000000000111111111111111) (= (mask!10259 thiss!1504) #b00000000000000001111111111111111) (= (mask!10259 thiss!1504) #b00000000000000011111111111111111) (= (mask!10259 thiss!1504) #b00000000000000111111111111111111) (= (mask!10259 thiss!1504) #b00000000000001111111111111111111) (= (mask!10259 thiss!1504) #b00000000000011111111111111111111) (= (mask!10259 thiss!1504) #b00000000000111111111111111111111) (= (mask!10259 thiss!1504) #b00000000001111111111111111111111) (= (mask!10259 thiss!1504) #b00000000011111111111111111111111) (= (mask!10259 thiss!1504) #b00000000111111111111111111111111) (= (mask!10259 thiss!1504) #b00000001111111111111111111111111) (= (mask!10259 thiss!1504) #b00000011111111111111111111111111) (= (mask!10259 thiss!1504) #b00000111111111111111111111111111) (= (mask!10259 thiss!1504) #b00001111111111111111111111111111) (= (mask!10259 thiss!1504) #b00011111111111111111111111111111) (= (mask!10259 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10259 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!232982 d!58725))

(declare-fun d!58727 () Bool)

(declare-fun res!114396 () Bool)

(declare-fun e!151437 () Bool)

(assert (=> d!58727 (=> (not res!114396) (not e!151437))))

(declare-fun simpleValid!226 (LongMapFixedSize!3358) Bool)

(assert (=> d!58727 (= res!114396 (simpleValid!226 thiss!1504))))

(assert (=> d!58727 (= (valid!1344 thiss!1504) e!151437)))

(declare-fun b!233134 () Bool)

(declare-fun res!114397 () Bool)

(assert (=> b!233134 (=> (not res!114397) (not e!151437))))

(declare-fun arrayCountValidKeys!0 (array!11527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233134 (= res!114397 (= (arrayCountValidKeys!0 (_keys!6391 thiss!1504) #b00000000000000000000000000000000 (size!5816 (_keys!6391 thiss!1504))) (_size!1728 thiss!1504)))))

(declare-fun b!233135 () Bool)

(declare-fun res!114398 () Bool)

(assert (=> b!233135 (=> (not res!114398) (not e!151437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11527 (_ BitVec 32)) Bool)

(assert (=> b!233135 (= res!114398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6391 thiss!1504) (mask!10259 thiss!1504)))))

(declare-fun b!233136 () Bool)

(declare-datatypes ((List!3514 0))(
  ( (Nil!3511) (Cons!3510 (h!4158 (_ BitVec 64)) (t!8466 List!3514)) )
))
(declare-fun arrayNoDuplicates!0 (array!11527 (_ BitVec 32) List!3514) Bool)

(assert (=> b!233136 (= e!151437 (arrayNoDuplicates!0 (_keys!6391 thiss!1504) #b00000000000000000000000000000000 Nil!3511))))

(assert (= (and d!58727 res!114396) b!233134))

(assert (= (and b!233134 res!114397) b!233135))

(assert (= (and b!233135 res!114398) b!233136))

(declare-fun m!254097 () Bool)

(assert (=> d!58727 m!254097))

(declare-fun m!254099 () Bool)

(assert (=> b!233134 m!254099))

(declare-fun m!254101 () Bool)

(assert (=> b!233135 m!254101))

(declare-fun m!254103 () Bool)

(assert (=> b!233136 m!254103))

(assert (=> start!22220 d!58727))

(declare-fun mapIsEmpty!10396 () Bool)

(declare-fun mapRes!10396 () Bool)

(assert (=> mapIsEmpty!10396 mapRes!10396))

(declare-fun mapNonEmpty!10396 () Bool)

(declare-fun tp!22006 () Bool)

(declare-fun e!151443 () Bool)

(assert (=> mapNonEmpty!10396 (= mapRes!10396 (and tp!22006 e!151443))))

(declare-fun mapKey!10396 () (_ BitVec 32))

(declare-fun mapRest!10396 () (Array (_ BitVec 32) ValueCell!2729))

(declare-fun mapValue!10396 () ValueCell!2729)

(assert (=> mapNonEmpty!10396 (= mapRest!10387 (store mapRest!10396 mapKey!10396 mapValue!10396))))

(declare-fun b!233144 () Bool)

(declare-fun e!151442 () Bool)

(assert (=> b!233144 (= e!151442 tp_is_empty!6145)))

(declare-fun b!233143 () Bool)

(assert (=> b!233143 (= e!151443 tp_is_empty!6145)))

(declare-fun condMapEmpty!10396 () Bool)

(declare-fun mapDefault!10396 () ValueCell!2729)

(assert (=> mapNonEmpty!10387 (= condMapEmpty!10396 (= mapRest!10387 ((as const (Array (_ BitVec 32) ValueCell!2729)) mapDefault!10396)))))

(assert (=> mapNonEmpty!10387 (= tp!21990 (and e!151442 mapRes!10396))))

(assert (= (and mapNonEmpty!10387 condMapEmpty!10396) mapIsEmpty!10396))

(assert (= (and mapNonEmpty!10387 (not condMapEmpty!10396)) mapNonEmpty!10396))

(assert (= (and mapNonEmpty!10396 ((_ is ValueCellFull!2729) mapValue!10396)) b!233143))

(assert (= (and mapNonEmpty!10387 ((_ is ValueCellFull!2729) mapDefault!10396)) b!233144))

(declare-fun m!254105 () Bool)

(assert (=> mapNonEmpty!10396 m!254105))

(declare-fun b_lambda!7827 () Bool)

(assert (= b_lambda!7825 (or (and b!232985 b_free!6283) b_lambda!7827)))

(check-sat (not b!233097) (not d!58715) (not bm!21670) (not bm!21672) (not b!233100) (not bm!21668) (not b!233103) (not b!233090) (not b!233042) (not d!58717) (not b!233088) (not b!233125) (not b!233092) (not b!233095) (not b!233107) tp_is_empty!6145 (not b!233135) (not mapNonEmpty!10396) (not bm!21667) (not d!58723) (not b!233044) (not b_lambda!7827) b_and!13161 (not d!58727) (not b!233134) (not b_next!6283) (not b!233136))
(check-sat b_and!13161 (not b_next!6283))
