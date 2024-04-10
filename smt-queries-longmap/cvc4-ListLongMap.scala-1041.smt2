; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21932 () Bool)

(assert start!21932)

(declare-fun b!223425 () Bool)

(declare-fun b_free!5999 () Bool)

(declare-fun b_next!5999 () Bool)

(assert (=> b!223425 (= b_free!5999 (not b_next!5999))))

(declare-fun tp!21139 () Bool)

(declare-fun b_and!12897 () Bool)

(assert (=> b!223425 (= tp!21139 b_and!12897)))

(declare-fun b!223413 () Bool)

(declare-fun res!109809 () Bool)

(declare-fun e!145128 () Bool)

(assert (=> b!223413 (=> (not res!109809) (not e!145128))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!223413 (= res!109809 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223414 () Bool)

(declare-fun e!145138 () Bool)

(declare-fun call!20832 () Bool)

(assert (=> b!223414 (= e!145138 (not call!20832))))

(declare-fun b!223415 () Bool)

(declare-fun e!145136 () Bool)

(assert (=> b!223415 (= e!145128 e!145136)))

(declare-fun res!109794 () Bool)

(assert (=> b!223415 (=> (not res!109794) (not e!145136))))

(declare-datatypes ((SeekEntryResult!848 0))(
  ( (MissingZero!848 (index!5562 (_ BitVec 32))) (Found!848 (index!5563 (_ BitVec 32))) (Intermediate!848 (undefined!1660 Bool) (index!5564 (_ BitVec 32)) (x!23092 (_ BitVec 32))) (Undefined!848) (MissingVacant!848 (index!5565 (_ BitVec 32))) )
))
(declare-fun lt!112896 () SeekEntryResult!848)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223415 (= res!109794 (or (= lt!112896 (MissingZero!848 index!297)) (= lt!112896 (MissingVacant!848 index!297))))))

(declare-datatypes ((V!7461 0))(
  ( (V!7462 (val!2975 Int)) )
))
(declare-datatypes ((ValueCell!2587 0))(
  ( (ValueCellFull!2587 (v!4995 V!7461)) (EmptyCell!2587) )
))
(declare-datatypes ((array!10965 0))(
  ( (array!10966 (arr!5202 (Array (_ BitVec 32) ValueCell!2587)) (size!5535 (_ BitVec 32))) )
))
(declare-datatypes ((array!10967 0))(
  ( (array!10968 (arr!5203 (Array (_ BitVec 32) (_ BitVec 64))) (size!5536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3074 0))(
  ( (LongMapFixedSize!3075 (defaultEntry!4196 Int) (mask!10022 (_ BitVec 32)) (extraKeys!3933 (_ BitVec 32)) (zeroValue!4037 V!7461) (minValue!4037 V!7461) (_size!1586 (_ BitVec 32)) (_keys!6250 array!10967) (_values!4179 array!10965) (_vacant!1586 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3074)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10967 (_ BitVec 32)) SeekEntryResult!848)

(assert (=> b!223415 (= lt!112896 (seekEntryOrOpen!0 key!932 (_keys!6250 thiss!1504) (mask!10022 thiss!1504)))))

(declare-fun b!223416 () Bool)

(declare-fun e!145130 () Bool)

(declare-fun e!145142 () Bool)

(assert (=> b!223416 (= e!145130 e!145142)))

(declare-fun res!109797 () Bool)

(assert (=> b!223416 (=> (not res!109797) (not e!145142))))

(assert (=> b!223416 (= res!109797 (and (bvslt (size!5536 (_keys!6250 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5536 (_keys!6250 thiss!1504)))))))

(declare-datatypes ((Unit!6713 0))(
  ( (Unit!6714) )
))
(declare-fun lt!112894 () Unit!6713)

(declare-fun e!145133 () Unit!6713)

(assert (=> b!223416 (= lt!112894 e!145133)))

(declare-fun c!37089 () Bool)

(declare-fun lt!112899 () Bool)

(assert (=> b!223416 (= c!37089 lt!112899)))

(declare-fun arrayContainsKey!0 (array!10967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223416 (= lt!112899 (arrayContainsKey!0 (_keys!6250 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223417 () Bool)

(declare-fun res!109810 () Bool)

(assert (=> b!223417 (=> (not res!109810) (not e!145138))))

(assert (=> b!223417 (= res!109810 (= (select (arr!5203 (_keys!6250 thiss!1504)) (index!5562 lt!112896)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223418 () Bool)

(declare-fun res!109801 () Bool)

(assert (=> b!223418 (=> (not res!109801) (not e!145142))))

(declare-datatypes ((List!3320 0))(
  ( (Nil!3317) (Cons!3316 (h!3964 (_ BitVec 64)) (t!8279 List!3320)) )
))
(declare-fun contains!1540 (List!3320 (_ BitVec 64)) Bool)

(assert (=> b!223418 (= res!109801 (not (contains!1540 Nil!3317 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223419 () Bool)

(declare-fun e!145137 () Bool)

(assert (=> b!223419 (= e!145137 (not call!20832))))

(declare-fun b!223420 () Bool)

(assert (=> b!223420 (= e!145136 e!145130)))

(declare-fun res!109802 () Bool)

(assert (=> b!223420 (=> (not res!109802) (not e!145130))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223420 (= res!109802 (inRange!0 index!297 (mask!10022 thiss!1504)))))

(declare-fun lt!112900 () Unit!6713)

(declare-fun e!145131 () Unit!6713)

(assert (=> b!223420 (= lt!112900 e!145131)))

(declare-fun c!37092 () Bool)

(declare-datatypes ((tuple2!4412 0))(
  ( (tuple2!4413 (_1!2217 (_ BitVec 64)) (_2!2217 V!7461)) )
))
(declare-datatypes ((List!3321 0))(
  ( (Nil!3318) (Cons!3317 (h!3965 tuple2!4412) (t!8280 List!3321)) )
))
(declare-datatypes ((ListLongMap!3325 0))(
  ( (ListLongMap!3326 (toList!1678 List!3321)) )
))
(declare-fun contains!1541 (ListLongMap!3325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1206 (array!10967 array!10965 (_ BitVec 32) (_ BitVec 32) V!7461 V!7461 (_ BitVec 32) Int) ListLongMap!3325)

(assert (=> b!223420 (= c!37092 (contains!1541 (getCurrentListMap!1206 (_keys!6250 thiss!1504) (_values!4179 thiss!1504) (mask!10022 thiss!1504) (extraKeys!3933 thiss!1504) (zeroValue!4037 thiss!1504) (minValue!4037 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4196 thiss!1504)) key!932))))

(declare-fun b!223421 () Bool)

(declare-fun res!109807 () Bool)

(assert (=> b!223421 (=> (not res!109807) (not e!145142))))

(assert (=> b!223421 (= res!109807 (not (contains!1540 Nil!3317 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!9961 () Bool)

(declare-fun mapRes!9961 () Bool)

(declare-fun tp!21138 () Bool)

(declare-fun e!145144 () Bool)

(assert (=> mapNonEmpty!9961 (= mapRes!9961 (and tp!21138 e!145144))))

(declare-fun mapValue!9961 () ValueCell!2587)

(declare-fun mapRest!9961 () (Array (_ BitVec 32) ValueCell!2587))

(declare-fun mapKey!9961 () (_ BitVec 32))

(assert (=> mapNonEmpty!9961 (= (arr!5202 (_values!4179 thiss!1504)) (store mapRest!9961 mapKey!9961 mapValue!9961))))

(declare-fun b!223423 () Bool)

(declare-fun res!109799 () Bool)

(assert (=> b!223423 (=> (not res!109799) (not e!145142))))

(assert (=> b!223423 (= res!109799 (not lt!112899))))

(declare-fun b!223424 () Bool)

(declare-fun tp_is_empty!5861 () Bool)

(assert (=> b!223424 (= e!145144 tp_is_empty!5861)))

(declare-fun e!145134 () Bool)

(declare-fun e!145132 () Bool)

(declare-fun array_inv!3443 (array!10967) Bool)

(declare-fun array_inv!3444 (array!10965) Bool)

(assert (=> b!223425 (= e!145132 (and tp!21139 tp_is_empty!5861 (array_inv!3443 (_keys!6250 thiss!1504)) (array_inv!3444 (_values!4179 thiss!1504)) e!145134))))

(declare-fun b!223426 () Bool)

(declare-fun Unit!6715 () Unit!6713)

(assert (=> b!223426 (= e!145133 Unit!6715)))

(declare-fun lt!112901 () Unit!6713)

(declare-fun lemmaArrayContainsKeyThenInListMap!71 (array!10967 array!10965 (_ BitVec 32) (_ BitVec 32) V!7461 V!7461 (_ BitVec 64) (_ BitVec 32) Int) Unit!6713)

(assert (=> b!223426 (= lt!112901 (lemmaArrayContainsKeyThenInListMap!71 (_keys!6250 thiss!1504) (_values!4179 thiss!1504) (mask!10022 thiss!1504) (extraKeys!3933 thiss!1504) (zeroValue!4037 thiss!1504) (minValue!4037 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4196 thiss!1504)))))

(assert (=> b!223426 false))

(declare-fun b!223427 () Bool)

(declare-fun res!109793 () Bool)

(assert (=> b!223427 (=> (not res!109793) (not e!145142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223427 (= res!109793 (validKeyInArray!0 key!932))))

(declare-fun b!223428 () Bool)

(assert (=> b!223428 (= e!145142 false)))

(declare-fun lt!112895 () Bool)

(assert (=> b!223428 (= lt!112895 (contains!1540 Nil!3317 key!932))))

(declare-fun b!223429 () Bool)

(declare-fun Unit!6716 () Unit!6713)

(assert (=> b!223429 (= e!145131 Unit!6716)))

(declare-fun lt!112898 () Unit!6713)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!232 (array!10967 array!10965 (_ BitVec 32) (_ BitVec 32) V!7461 V!7461 (_ BitVec 64) Int) Unit!6713)

(assert (=> b!223429 (= lt!112898 (lemmaInListMapThenSeekEntryOrOpenFindsIt!232 (_keys!6250 thiss!1504) (_values!4179 thiss!1504) (mask!10022 thiss!1504) (extraKeys!3933 thiss!1504) (zeroValue!4037 thiss!1504) (minValue!4037 thiss!1504) key!932 (defaultEntry!4196 thiss!1504)))))

(assert (=> b!223429 false))

(declare-fun b!223430 () Bool)

(declare-fun c!37090 () Bool)

(assert (=> b!223430 (= c!37090 (is-MissingVacant!848 lt!112896))))

(declare-fun e!145141 () Bool)

(declare-fun e!145145 () Bool)

(assert (=> b!223430 (= e!145141 e!145145)))

(declare-fun b!223431 () Bool)

(declare-fun res!109800 () Bool)

(assert (=> b!223431 (=> (not res!109800) (not e!145142))))

(assert (=> b!223431 (= res!109800 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5536 (_keys!6250 thiss!1504)))))))

(declare-fun bm!20828 () Bool)

(assert (=> bm!20828 (= call!20832 (arrayContainsKey!0 (_keys!6250 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20829 () Bool)

(declare-fun c!37091 () Bool)

(declare-fun call!20831 () Bool)

(assert (=> bm!20829 (= call!20831 (inRange!0 (ite c!37091 (index!5562 lt!112896) (index!5565 lt!112896)) (mask!10022 thiss!1504)))))

(declare-fun b!223432 () Bool)

(assert (=> b!223432 (= e!145145 (is-Undefined!848 lt!112896))))

(declare-fun b!223433 () Bool)

(declare-fun res!109798 () Bool)

(assert (=> b!223433 (=> (not res!109798) (not e!145142))))

(declare-fun arrayNoDuplicates!0 (array!10967 (_ BitVec 32) List!3320) Bool)

(assert (=> b!223433 (= res!109798 (arrayNoDuplicates!0 (_keys!6250 thiss!1504) #b00000000000000000000000000000000 Nil!3317))))

(declare-fun mapIsEmpty!9961 () Bool)

(assert (=> mapIsEmpty!9961 mapRes!9961))

(declare-fun b!223434 () Bool)

(declare-fun lt!112897 () Unit!6713)

(assert (=> b!223434 (= e!145131 lt!112897)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!243 (array!10967 array!10965 (_ BitVec 32) (_ BitVec 32) V!7461 V!7461 (_ BitVec 64) Int) Unit!6713)

(assert (=> b!223434 (= lt!112897 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!243 (_keys!6250 thiss!1504) (_values!4179 thiss!1504) (mask!10022 thiss!1504) (extraKeys!3933 thiss!1504) (zeroValue!4037 thiss!1504) (minValue!4037 thiss!1504) key!932 (defaultEntry!4196 thiss!1504)))))

(assert (=> b!223434 (= c!37091 (is-MissingZero!848 lt!112896))))

(assert (=> b!223434 e!145141))

(declare-fun b!223435 () Bool)

(declare-fun e!145139 () Bool)

(assert (=> b!223435 (= e!145139 (contains!1540 Nil!3317 key!932))))

(declare-fun b!223436 () Bool)

(declare-fun res!109803 () Bool)

(assert (=> b!223436 (=> (not res!109803) (not e!145142))))

(declare-fun e!145143 () Bool)

(assert (=> b!223436 (= res!109803 e!145143)))

(declare-fun res!109805 () Bool)

(assert (=> b!223436 (=> res!109805 e!145143)))

(assert (=> b!223436 (= res!109805 e!145139)))

(declare-fun res!109795 () Bool)

(assert (=> b!223436 (=> (not res!109795) (not e!145139))))

(assert (=> b!223436 (= res!109795 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun res!109804 () Bool)

(assert (=> start!21932 (=> (not res!109804) (not e!145128))))

(declare-fun valid!1238 (LongMapFixedSize!3074) Bool)

(assert (=> start!21932 (= res!109804 (valid!1238 thiss!1504))))

(assert (=> start!21932 e!145128))

(assert (=> start!21932 e!145132))

(assert (=> start!21932 true))

(declare-fun b!223422 () Bool)

(declare-fun res!109806 () Bool)

(assert (=> b!223422 (=> (not res!109806) (not e!145142))))

(declare-fun noDuplicate!77 (List!3320) Bool)

(assert (=> b!223422 (= res!109806 (noDuplicate!77 Nil!3317))))

(declare-fun b!223437 () Bool)

(declare-fun res!109792 () Bool)

(assert (=> b!223437 (= res!109792 (= (select (arr!5203 (_keys!6250 thiss!1504)) (index!5565 lt!112896)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223437 (=> (not res!109792) (not e!145137))))

(declare-fun b!223438 () Bool)

(declare-fun e!145140 () Bool)

(assert (=> b!223438 (= e!145140 (not (contains!1540 Nil!3317 key!932)))))

(declare-fun b!223439 () Bool)

(declare-fun e!145135 () Bool)

(assert (=> b!223439 (= e!145134 (and e!145135 mapRes!9961))))

(declare-fun condMapEmpty!9961 () Bool)

(declare-fun mapDefault!9961 () ValueCell!2587)

