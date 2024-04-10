; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23524 () Bool)

(assert start!23524)

(declare-fun b!247046 () Bool)

(declare-fun b_free!6577 () Bool)

(declare-fun b_next!6577 () Bool)

(assert (=> b!247046 (= b_free!6577 (not b_next!6577))))

(declare-fun tp!22976 () Bool)

(declare-fun b_and!13577 () Bool)

(assert (=> b!247046 (= tp!22976 b_and!13577)))

(declare-fun b!247028 () Bool)

(declare-fun e!160264 () Bool)

(declare-datatypes ((SeekEntryResult!1097 0))(
  ( (MissingZero!1097 (index!6558 (_ BitVec 32))) (Found!1097 (index!6559 (_ BitVec 32))) (Intermediate!1097 (undefined!1909 Bool) (index!6560 (_ BitVec 32)) (x!24507 (_ BitVec 32))) (Undefined!1097) (MissingVacant!1097 (index!6561 (_ BitVec 32))) )
))
(declare-fun lt!123734 () SeekEntryResult!1097)

(assert (=> b!247028 (= e!160264 (is-Undefined!1097 lt!123734))))

(declare-fun b!247029 () Bool)

(declare-fun e!160257 () Bool)

(declare-fun e!160252 () Bool)

(assert (=> b!247029 (= e!160257 (not e!160252))))

(declare-fun res!121100 () Bool)

(assert (=> b!247029 (=> res!121100 e!160252)))

(declare-datatypes ((V!8233 0))(
  ( (V!8234 (val!3264 Int)) )
))
(declare-datatypes ((ValueCell!2876 0))(
  ( (ValueCellFull!2876 (v!5321 V!8233)) (EmptyCell!2876) )
))
(declare-datatypes ((array!12183 0))(
  ( (array!12184 (arr!5780 (Array (_ BitVec 32) ValueCell!2876)) (size!6123 (_ BitVec 32))) )
))
(declare-datatypes ((array!12185 0))(
  ( (array!12186 (arr!5781 (Array (_ BitVec 32) (_ BitVec 64))) (size!6124 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3652 0))(
  ( (LongMapFixedSize!3653 (defaultEntry!4571 Int) (mask!10704 (_ BitVec 32)) (extraKeys!4308 (_ BitVec 32)) (zeroValue!4412 V!8233) (minValue!4412 V!8233) (_size!1875 (_ BitVec 32)) (_keys!6692 array!12185) (_values!4554 array!12183) (_vacant!1875 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3652)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247029 (= res!121100 (not (validMask!0 (mask!10704 thiss!1504))))))

(declare-fun lt!123733 () array!12185)

(declare-fun arrayCountValidKeys!0 (array!12185 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247029 (= (arrayCountValidKeys!0 lt!123733 #b00000000000000000000000000000000 (size!6124 (_keys!6692 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6692 thiss!1504) #b00000000000000000000000000000000 (size!6124 (_keys!6692 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7626 0))(
  ( (Unit!7627) )
))
(declare-fun lt!123727 () Unit!7626)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12185 (_ BitVec 32) (_ BitVec 64)) Unit!7626)

(assert (=> b!247029 (= lt!123727 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6692 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3683 0))(
  ( (Nil!3680) (Cons!3679 (h!4337 (_ BitVec 64)) (t!8704 List!3683)) )
))
(declare-fun arrayNoDuplicates!0 (array!12185 (_ BitVec 32) List!3683) Bool)

(assert (=> b!247029 (arrayNoDuplicates!0 lt!123733 #b00000000000000000000000000000000 Nil!3680)))

(assert (=> b!247029 (= lt!123733 (array!12186 (store (arr!5781 (_keys!6692 thiss!1504)) index!297 key!932) (size!6124 (_keys!6692 thiss!1504))))))

(declare-fun lt!123732 () Unit!7626)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12185 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3683) Unit!7626)

(assert (=> b!247029 (= lt!123732 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6692 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3680))))

(declare-fun lt!123726 () Unit!7626)

(declare-fun e!160250 () Unit!7626)

(assert (=> b!247029 (= lt!123726 e!160250)))

(declare-fun c!41340 () Bool)

(declare-fun arrayContainsKey!0 (array!12185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247029 (= c!41340 (arrayContainsKey!0 (_keys!6692 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247030 () Bool)

(declare-fun Unit!7628 () Unit!7626)

(assert (=> b!247030 (= e!160250 Unit!7628)))

(declare-fun b!247031 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247031 (= e!160252 (validKeyInArray!0 key!932))))

(declare-fun b!247032 () Bool)

(declare-fun e!160253 () Bool)

(declare-fun e!160259 () Bool)

(assert (=> b!247032 (= e!160253 e!160259)))

(declare-fun res!121101 () Bool)

(assert (=> b!247032 (=> (not res!121101) (not e!160259))))

(assert (=> b!247032 (= res!121101 (or (= lt!123734 (MissingZero!1097 index!297)) (= lt!123734 (MissingVacant!1097 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12185 (_ BitVec 32)) SeekEntryResult!1097)

(assert (=> b!247032 (= lt!123734 (seekEntryOrOpen!0 key!932 (_keys!6692 thiss!1504) (mask!10704 thiss!1504)))))

(declare-fun b!247033 () Bool)

(declare-fun e!160258 () Bool)

(declare-fun call!23119 () Bool)

(assert (=> b!247033 (= e!160258 (not call!23119))))

(declare-fun b!247034 () Bool)

(declare-fun Unit!7629 () Unit!7626)

(assert (=> b!247034 (= e!160250 Unit!7629)))

(declare-fun lt!123731 () Unit!7626)

(declare-fun lemmaArrayContainsKeyThenInListMap!182 (array!12185 array!12183 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) (_ BitVec 32) Int) Unit!7626)

(assert (=> b!247034 (= lt!123731 (lemmaArrayContainsKeyThenInListMap!182 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)))))

(assert (=> b!247034 false))

(declare-fun b!247035 () Bool)

(declare-fun e!160255 () Bool)

(declare-fun tp_is_empty!6439 () Bool)

(assert (=> b!247035 (= e!160255 tp_is_empty!6439)))

(declare-fun b!247036 () Bool)

(declare-fun res!121097 () Bool)

(assert (=> b!247036 (=> (not res!121097) (not e!160253))))

(assert (=> b!247036 (= res!121097 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun c!41342 () Bool)

(declare-fun bm!23115 () Bool)

(declare-fun call!23118 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23115 (= call!23118 (inRange!0 (ite c!41342 (index!6558 lt!123734) (index!6561 lt!123734)) (mask!10704 thiss!1504)))))

(declare-fun mapIsEmpty!10931 () Bool)

(declare-fun mapRes!10931 () Bool)

(assert (=> mapIsEmpty!10931 mapRes!10931))

(declare-fun bm!23116 () Bool)

(assert (=> bm!23116 (= call!23119 (arrayContainsKey!0 (_keys!6692 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10931 () Bool)

(declare-fun tp!22975 () Bool)

(assert (=> mapNonEmpty!10931 (= mapRes!10931 (and tp!22975 e!160255))))

(declare-fun mapKey!10931 () (_ BitVec 32))

(declare-fun mapRest!10931 () (Array (_ BitVec 32) ValueCell!2876))

(declare-fun mapValue!10931 () ValueCell!2876)

(assert (=> mapNonEmpty!10931 (= (arr!5780 (_values!4554 thiss!1504)) (store mapRest!10931 mapKey!10931 mapValue!10931))))

(declare-fun b!247037 () Bool)

(assert (=> b!247037 (= e!160259 e!160257)))

(declare-fun res!121102 () Bool)

(assert (=> b!247037 (=> (not res!121102) (not e!160257))))

(assert (=> b!247037 (= res!121102 (inRange!0 index!297 (mask!10704 thiss!1504)))))

(declare-fun lt!123730 () Unit!7626)

(declare-fun e!160261 () Unit!7626)

(assert (=> b!247037 (= lt!123730 e!160261)))

(declare-fun c!41341 () Bool)

(declare-datatypes ((tuple2!4802 0))(
  ( (tuple2!4803 (_1!2412 (_ BitVec 64)) (_2!2412 V!8233)) )
))
(declare-datatypes ((List!3684 0))(
  ( (Nil!3681) (Cons!3680 (h!4338 tuple2!4802) (t!8705 List!3684)) )
))
(declare-datatypes ((ListLongMap!3715 0))(
  ( (ListLongMap!3716 (toList!1873 List!3684)) )
))
(declare-fun contains!1786 (ListLongMap!3715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1401 (array!12185 array!12183 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 32) Int) ListLongMap!3715)

(assert (=> b!247037 (= c!41341 (contains!1786 (getCurrentListMap!1401 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4571 thiss!1504)) key!932))))

(declare-fun b!247038 () Bool)

(assert (=> b!247038 (= e!160264 e!160258)))

(declare-fun res!121105 () Bool)

(assert (=> b!247038 (= res!121105 call!23118)))

(assert (=> b!247038 (=> (not res!121105) (not e!160258))))

(declare-fun b!247039 () Bool)

(declare-fun Unit!7630 () Unit!7626)

(assert (=> b!247039 (= e!160261 Unit!7630)))

(declare-fun lt!123728 () Unit!7626)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!378 (array!12185 array!12183 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7626)

(assert (=> b!247039 (= lt!123728 (lemmaInListMapThenSeekEntryOrOpenFindsIt!378 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(assert (=> b!247039 false))

(declare-fun b!247040 () Bool)

(declare-fun e!160251 () Bool)

(assert (=> b!247040 (= e!160251 (not call!23119))))

(declare-fun b!247041 () Bool)

(declare-fun res!121103 () Bool)

(assert (=> b!247041 (=> (not res!121103) (not e!160251))))

(assert (=> b!247041 (= res!121103 call!23118)))

(declare-fun e!160263 () Bool)

(assert (=> b!247041 (= e!160263 e!160251)))

(declare-fun b!247042 () Bool)

(declare-fun lt!123729 () Unit!7626)

(assert (=> b!247042 (= e!160261 lt!123729)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!383 (array!12185 array!12183 (_ BitVec 32) (_ BitVec 32) V!8233 V!8233 (_ BitVec 64) Int) Unit!7626)

(assert (=> b!247042 (= lt!123729 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!383 (_keys!6692 thiss!1504) (_values!4554 thiss!1504) (mask!10704 thiss!1504) (extraKeys!4308 thiss!1504) (zeroValue!4412 thiss!1504) (minValue!4412 thiss!1504) key!932 (defaultEntry!4571 thiss!1504)))))

(assert (=> b!247042 (= c!41342 (is-MissingZero!1097 lt!123734))))

(assert (=> b!247042 e!160263))

(declare-fun res!121104 () Bool)

(assert (=> start!23524 (=> (not res!121104) (not e!160253))))

(declare-fun valid!1428 (LongMapFixedSize!3652) Bool)

(assert (=> start!23524 (= res!121104 (valid!1428 thiss!1504))))

(assert (=> start!23524 e!160253))

(declare-fun e!160256 () Bool)

(assert (=> start!23524 e!160256))

(assert (=> start!23524 true))

(declare-fun b!247043 () Bool)

(declare-fun res!121096 () Bool)

(assert (=> b!247043 (=> res!121096 e!160252)))

(assert (=> b!247043 (= res!121096 (or (not (= (size!6124 (_keys!6692 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10704 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6124 (_keys!6692 thiss!1504)))))))

(declare-fun b!247044 () Bool)

(declare-fun res!121099 () Bool)

(assert (=> b!247044 (= res!121099 (= (select (arr!5781 (_keys!6692 thiss!1504)) (index!6561 lt!123734)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247044 (=> (not res!121099) (not e!160258))))

(declare-fun b!247045 () Bool)

(declare-fun res!121098 () Bool)

(assert (=> b!247045 (=> (not res!121098) (not e!160251))))

(assert (=> b!247045 (= res!121098 (= (select (arr!5781 (_keys!6692 thiss!1504)) (index!6558 lt!123734)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160260 () Bool)

(declare-fun array_inv!3817 (array!12185) Bool)

(declare-fun array_inv!3818 (array!12183) Bool)

(assert (=> b!247046 (= e!160256 (and tp!22976 tp_is_empty!6439 (array_inv!3817 (_keys!6692 thiss!1504)) (array_inv!3818 (_values!4554 thiss!1504)) e!160260))))

(declare-fun b!247047 () Bool)

(declare-fun c!41343 () Bool)

(assert (=> b!247047 (= c!41343 (is-MissingVacant!1097 lt!123734))))

(assert (=> b!247047 (= e!160263 e!160264)))

(declare-fun b!247048 () Bool)

(declare-fun e!160262 () Bool)

(assert (=> b!247048 (= e!160262 tp_is_empty!6439)))

(declare-fun b!247049 () Bool)

(assert (=> b!247049 (= e!160260 (and e!160262 mapRes!10931))))

(declare-fun condMapEmpty!10931 () Bool)

(declare-fun mapDefault!10931 () ValueCell!2876)

