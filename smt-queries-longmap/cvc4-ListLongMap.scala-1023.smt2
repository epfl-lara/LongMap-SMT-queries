; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21762 () Bool)

(assert start!21762)

(declare-fun b!219033 () Bool)

(declare-fun b_free!5891 () Bool)

(declare-fun b_next!5891 () Bool)

(assert (=> b!219033 (= b_free!5891 (not b_next!5891))))

(declare-fun tp!20810 () Bool)

(declare-fun b_and!12783 () Bool)

(assert (=> b!219033 (= tp!20810 b_and!12783)))

(declare-fun mapNonEmpty!9795 () Bool)

(declare-fun mapRes!9795 () Bool)

(declare-fun tp!20811 () Bool)

(declare-fun e!142499 () Bool)

(assert (=> mapNonEmpty!9795 (= mapRes!9795 (and tp!20811 e!142499))))

(declare-fun mapKey!9795 () (_ BitVec 32))

(declare-datatypes ((V!7317 0))(
  ( (V!7318 (val!2921 Int)) )
))
(declare-datatypes ((ValueCell!2533 0))(
  ( (ValueCellFull!2533 (v!4940 V!7317)) (EmptyCell!2533) )
))
(declare-datatypes ((array!10747 0))(
  ( (array!10748 (arr!5094 (Array (_ BitVec 32) ValueCell!2533)) (size!5426 (_ BitVec 32))) )
))
(declare-datatypes ((array!10749 0))(
  ( (array!10750 (arr!5095 (Array (_ BitVec 32) (_ BitVec 64))) (size!5427 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2966 0))(
  ( (LongMapFixedSize!2967 (defaultEntry!4136 Int) (mask!9919 (_ BitVec 32)) (extraKeys!3873 (_ BitVec 32)) (zeroValue!3977 V!7317) (minValue!3977 V!7317) (_size!1532 (_ BitVec 32)) (_keys!6186 array!10749) (_values!4119 array!10747) (_vacant!1532 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2966)

(declare-fun mapValue!9795 () ValueCell!2533)

(declare-fun mapRest!9795 () (Array (_ BitVec 32) ValueCell!2533))

(assert (=> mapNonEmpty!9795 (= (arr!5094 (_values!4119 thiss!1504)) (store mapRest!9795 mapKey!9795 mapValue!9795))))

(declare-fun b!219031 () Bool)

(declare-fun e!142496 () Bool)

(declare-fun e!142502 () Bool)

(assert (=> b!219031 (= e!142496 e!142502)))

(declare-fun res!107361 () Bool)

(declare-fun call!20462 () Bool)

(assert (=> b!219031 (= res!107361 call!20462)))

(assert (=> b!219031 (=> (not res!107361) (not e!142502))))

(declare-fun mapIsEmpty!9795 () Bool)

(assert (=> mapIsEmpty!9795 mapRes!9795))

(declare-fun res!107364 () Bool)

(declare-fun e!142505 () Bool)

(assert (=> start!21762 (=> (not res!107364) (not e!142505))))

(declare-fun valid!1200 (LongMapFixedSize!2966) Bool)

(assert (=> start!21762 (= res!107364 (valid!1200 thiss!1504))))

(assert (=> start!21762 e!142505))

(declare-fun e!142501 () Bool)

(assert (=> start!21762 e!142501))

(assert (=> start!21762 true))

(declare-fun b!219032 () Bool)

(declare-fun call!20463 () Bool)

(assert (=> b!219032 (= e!142502 (not call!20463))))

(declare-fun e!142503 () Bool)

(declare-fun tp_is_empty!5753 () Bool)

(declare-fun array_inv!3373 (array!10749) Bool)

(declare-fun array_inv!3374 (array!10747) Bool)

(assert (=> b!219033 (= e!142501 (and tp!20810 tp_is_empty!5753 (array_inv!3373 (_keys!6186 thiss!1504)) (array_inv!3374 (_values!4119 thiss!1504)) e!142503))))

(declare-fun bm!20459 () Bool)

(declare-datatypes ((SeekEntryResult!796 0))(
  ( (MissingZero!796 (index!5354 (_ BitVec 32))) (Found!796 (index!5355 (_ BitVec 32))) (Intermediate!796 (undefined!1608 Bool) (index!5356 (_ BitVec 32)) (x!22878 (_ BitVec 32))) (Undefined!796) (MissingVacant!796 (index!5357 (_ BitVec 32))) )
))
(declare-fun lt!111731 () SeekEntryResult!796)

(declare-fun c!36444 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20459 (= call!20462 (inRange!0 (ite c!36444 (index!5354 lt!111731) (index!5357 lt!111731)) (mask!9919 thiss!1504)))))

(declare-fun b!219034 () Bool)

(declare-fun res!107362 () Bool)

(assert (=> b!219034 (= res!107362 (= (select (arr!5095 (_keys!6186 thiss!1504)) (index!5357 lt!111731)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219034 (=> (not res!107362) (not e!142502))))

(declare-fun b!219035 () Bool)

(declare-fun res!107367 () Bool)

(declare-fun e!142500 () Bool)

(assert (=> b!219035 (=> (not res!107367) (not e!142500))))

(assert (=> b!219035 (= res!107367 call!20462)))

(declare-fun e!142498 () Bool)

(assert (=> b!219035 (= e!142498 e!142500)))

(declare-fun b!219036 () Bool)

(declare-fun e!142507 () Bool)

(declare-fun e!142506 () Bool)

(assert (=> b!219036 (= e!142507 e!142506)))

(declare-fun res!107365 () Bool)

(assert (=> b!219036 (=> (not res!107365) (not e!142506))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219036 (= res!107365 (inRange!0 index!297 (mask!9919 thiss!1504)))))

(declare-datatypes ((Unit!6532 0))(
  ( (Unit!6533) )
))
(declare-fun lt!111729 () Unit!6532)

(declare-fun e!142497 () Unit!6532)

(assert (=> b!219036 (= lt!111729 e!142497)))

(declare-fun c!36446 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4336 0))(
  ( (tuple2!4337 (_1!2179 (_ BitVec 64)) (_2!2179 V!7317)) )
))
(declare-datatypes ((List!3238 0))(
  ( (Nil!3235) (Cons!3234 (h!3881 tuple2!4336) (t!8195 List!3238)) )
))
(declare-datatypes ((ListLongMap!3249 0))(
  ( (ListLongMap!3250 (toList!1640 List!3238)) )
))
(declare-fun contains!1481 (ListLongMap!3249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1168 (array!10749 array!10747 (_ BitVec 32) (_ BitVec 32) V!7317 V!7317 (_ BitVec 32) Int) ListLongMap!3249)

(assert (=> b!219036 (= c!36446 (contains!1481 (getCurrentListMap!1168 (_keys!6186 thiss!1504) (_values!4119 thiss!1504) (mask!9919 thiss!1504) (extraKeys!3873 thiss!1504) (zeroValue!3977 thiss!1504) (minValue!3977 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4136 thiss!1504)) key!932))))

(declare-fun b!219037 () Bool)

(declare-fun res!107366 () Bool)

(assert (=> b!219037 (=> (not res!107366) (not e!142500))))

(assert (=> b!219037 (= res!107366 (= (select (arr!5095 (_keys!6186 thiss!1504)) (index!5354 lt!111731)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219038 () Bool)

(declare-fun Unit!6534 () Unit!6532)

(assert (=> b!219038 (= e!142497 Unit!6534)))

(declare-fun lt!111732 () Unit!6532)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!193 (array!10749 array!10747 (_ BitVec 32) (_ BitVec 32) V!7317 V!7317 (_ BitVec 64) Int) Unit!6532)

(assert (=> b!219038 (= lt!111732 (lemmaInListMapThenSeekEntryOrOpenFindsIt!193 (_keys!6186 thiss!1504) (_values!4119 thiss!1504) (mask!9919 thiss!1504) (extraKeys!3873 thiss!1504) (zeroValue!3977 thiss!1504) (minValue!3977 thiss!1504) key!932 (defaultEntry!4136 thiss!1504)))))

(assert (=> b!219038 false))

(declare-fun b!219039 () Bool)

(declare-fun res!107360 () Bool)

(assert (=> b!219039 (=> (not res!107360) (not e!142505))))

(assert (=> b!219039 (= res!107360 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219040 () Bool)

(declare-fun c!36445 () Bool)

(assert (=> b!219040 (= c!36445 (is-MissingVacant!796 lt!111731))))

(assert (=> b!219040 (= e!142498 e!142496)))

(declare-fun b!219041 () Bool)

(declare-fun lt!111730 () Unit!6532)

(assert (=> b!219041 (= e!142497 lt!111730)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!204 (array!10749 array!10747 (_ BitVec 32) (_ BitVec 32) V!7317 V!7317 (_ BitVec 64) Int) Unit!6532)

(assert (=> b!219041 (= lt!111730 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!204 (_keys!6186 thiss!1504) (_values!4119 thiss!1504) (mask!9919 thiss!1504) (extraKeys!3873 thiss!1504) (zeroValue!3977 thiss!1504) (minValue!3977 thiss!1504) key!932 (defaultEntry!4136 thiss!1504)))))

(assert (=> b!219041 (= c!36444 (is-MissingZero!796 lt!111731))))

(assert (=> b!219041 e!142498))

(declare-fun b!219042 () Bool)

(assert (=> b!219042 (= e!142500 (not call!20463))))

(declare-fun b!219043 () Bool)

(assert (=> b!219043 (= e!142499 tp_is_empty!5753)))

(declare-fun bm!20460 () Bool)

(declare-fun arrayContainsKey!0 (array!10749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20460 (= call!20463 (arrayContainsKey!0 (_keys!6186 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219044 () Bool)

(assert (=> b!219044 (= e!142505 e!142507)))

(declare-fun res!107363 () Bool)

(assert (=> b!219044 (=> (not res!107363) (not e!142507))))

(assert (=> b!219044 (= res!107363 (or (= lt!111731 (MissingZero!796 index!297)) (= lt!111731 (MissingVacant!796 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10749 (_ BitVec 32)) SeekEntryResult!796)

(assert (=> b!219044 (= lt!111731 (seekEntryOrOpen!0 key!932 (_keys!6186 thiss!1504) (mask!9919 thiss!1504)))))

(declare-fun b!219045 () Bool)

(declare-fun e!142504 () Bool)

(assert (=> b!219045 (= e!142503 (and e!142504 mapRes!9795))))

(declare-fun condMapEmpty!9795 () Bool)

(declare-fun mapDefault!9795 () ValueCell!2533)

