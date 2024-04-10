; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23088 () Bool)

(assert start!23088)

(declare-fun b!242100 () Bool)

(declare-fun b_free!6503 () Bool)

(declare-fun b_next!6503 () Bool)

(assert (=> b!242100 (= b_free!6503 (not b_next!6503))))

(declare-fun tp!22720 () Bool)

(declare-fun b_and!13477 () Bool)

(assert (=> b!242100 (= tp!22720 b_and!13477)))

(declare-fun b!242085 () Bool)

(declare-datatypes ((Unit!7465 0))(
  ( (Unit!7466) )
))
(declare-fun e!157122 () Unit!7465)

(declare-fun lt!121613 () Unit!7465)

(assert (=> b!242085 (= e!157122 lt!121613)))

(declare-datatypes ((V!8133 0))(
  ( (V!8134 (val!3227 Int)) )
))
(declare-datatypes ((ValueCell!2839 0))(
  ( (ValueCellFull!2839 (v!5267 V!8133)) (EmptyCell!2839) )
))
(declare-datatypes ((array!12013 0))(
  ( (array!12014 (arr!5706 (Array (_ BitVec 32) ValueCell!2839)) (size!6048 (_ BitVec 32))) )
))
(declare-datatypes ((array!12015 0))(
  ( (array!12016 (arr!5707 (Array (_ BitVec 32) (_ BitVec 64))) (size!6049 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3578 0))(
  ( (LongMapFixedSize!3579 (defaultEntry!4486 Int) (mask!10563 (_ BitVec 32)) (extraKeys!4223 (_ BitVec 32)) (zeroValue!4327 V!8133) (minValue!4327 V!8133) (_size!1838 (_ BitVec 32)) (_keys!6593 array!12015) (_values!4469 array!12013) (_vacant!1838 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3578)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!363 (array!12015 array!12013 (_ BitVec 32) (_ BitVec 32) V!8133 V!8133 (_ BitVec 64) Int) Unit!7465)

(assert (=> b!242085 (= lt!121613 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!363 (_keys!6593 thiss!1504) (_values!4469 thiss!1504) (mask!10563 thiss!1504) (extraKeys!4223 thiss!1504) (zeroValue!4327 thiss!1504) (minValue!4327 thiss!1504) key!932 (defaultEntry!4486 thiss!1504)))))

(declare-fun c!40386 () Bool)

(declare-datatypes ((SeekEntryResult!1063 0))(
  ( (MissingZero!1063 (index!6422 (_ BitVec 32))) (Found!1063 (index!6423 (_ BitVec 32))) (Intermediate!1063 (undefined!1875 Bool) (index!6424 (_ BitVec 32)) (x!24251 (_ BitVec 32))) (Undefined!1063) (MissingVacant!1063 (index!6425 (_ BitVec 32))) )
))
(declare-fun lt!121611 () SeekEntryResult!1063)

(assert (=> b!242085 (= c!40386 (is-MissingZero!1063 lt!121611))))

(declare-fun e!157131 () Bool)

(assert (=> b!242085 e!157131))

(declare-fun b!242086 () Bool)

(declare-fun res!118628 () Bool)

(assert (=> b!242086 (= res!118628 (= (select (arr!5707 (_keys!6593 thiss!1504)) (index!6425 lt!121611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157128 () Bool)

(assert (=> b!242086 (=> (not res!118628) (not e!157128))))

(declare-fun b!242088 () Bool)

(declare-fun e!157130 () Bool)

(declare-fun e!157125 () Bool)

(assert (=> b!242088 (= e!157130 e!157125)))

(declare-fun res!118625 () Bool)

(assert (=> b!242088 (=> (not res!118625) (not e!157125))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242088 (= res!118625 (inRange!0 index!297 (mask!10563 thiss!1504)))))

(declare-fun lt!121615 () Unit!7465)

(assert (=> b!242088 (= lt!121615 e!157122)))

(declare-fun c!40383 () Bool)

(declare-datatypes ((tuple2!4754 0))(
  ( (tuple2!4755 (_1!2388 (_ BitVec 64)) (_2!2388 V!8133)) )
))
(declare-datatypes ((List!3632 0))(
  ( (Nil!3629) (Cons!3628 (h!4285 tuple2!4754) (t!8631 List!3632)) )
))
(declare-datatypes ((ListLongMap!3667 0))(
  ( (ListLongMap!3668 (toList!1849 List!3632)) )
))
(declare-fun contains!1739 (ListLongMap!3667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1377 (array!12015 array!12013 (_ BitVec 32) (_ BitVec 32) V!8133 V!8133 (_ BitVec 32) Int) ListLongMap!3667)

(assert (=> b!242088 (= c!40383 (contains!1739 (getCurrentListMap!1377 (_keys!6593 thiss!1504) (_values!4469 thiss!1504) (mask!10563 thiss!1504) (extraKeys!4223 thiss!1504) (zeroValue!4327 thiss!1504) (minValue!4327 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4486 thiss!1504)) key!932))))

(declare-fun b!242089 () Bool)

(declare-fun Unit!7467 () Unit!7465)

(assert (=> b!242089 (= e!157122 Unit!7467)))

(declare-fun lt!121616 () Unit!7465)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!354 (array!12015 array!12013 (_ BitVec 32) (_ BitVec 32) V!8133 V!8133 (_ BitVec 64) Int) Unit!7465)

(assert (=> b!242089 (= lt!121616 (lemmaInListMapThenSeekEntryOrOpenFindsIt!354 (_keys!6593 thiss!1504) (_values!4469 thiss!1504) (mask!10563 thiss!1504) (extraKeys!4223 thiss!1504) (zeroValue!4327 thiss!1504) (minValue!4327 thiss!1504) key!932 (defaultEntry!4486 thiss!1504)))))

(assert (=> b!242089 false))

(declare-fun b!242090 () Bool)

(declare-fun e!157129 () Unit!7465)

(declare-fun Unit!7468 () Unit!7465)

(assert (=> b!242090 (= e!157129 Unit!7468)))

(declare-fun lt!121614 () Unit!7465)

(declare-fun lemmaArrayContainsKeyThenInListMap!157 (array!12015 array!12013 (_ BitVec 32) (_ BitVec 32) V!8133 V!8133 (_ BitVec 64) (_ BitVec 32) Int) Unit!7465)

(assert (=> b!242090 (= lt!121614 (lemmaArrayContainsKeyThenInListMap!157 (_keys!6593 thiss!1504) (_values!4469 thiss!1504) (mask!10563 thiss!1504) (extraKeys!4223 thiss!1504) (zeroValue!4327 thiss!1504) (minValue!4327 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4486 thiss!1504)))))

(assert (=> b!242090 false))

(declare-fun mapIsEmpty!10786 () Bool)

(declare-fun mapRes!10786 () Bool)

(assert (=> mapIsEmpty!10786 mapRes!10786))

(declare-fun mapNonEmpty!10786 () Bool)

(declare-fun tp!22719 () Bool)

(declare-fun e!157123 () Bool)

(assert (=> mapNonEmpty!10786 (= mapRes!10786 (and tp!22719 e!157123))))

(declare-fun mapRest!10786 () (Array (_ BitVec 32) ValueCell!2839))

(declare-fun mapKey!10786 () (_ BitVec 32))

(declare-fun mapValue!10786 () ValueCell!2839)

(assert (=> mapNonEmpty!10786 (= (arr!5706 (_values!4469 thiss!1504)) (store mapRest!10786 mapKey!10786 mapValue!10786))))

(declare-fun b!242091 () Bool)

(declare-fun e!157119 () Bool)

(assert (=> b!242091 (= e!157119 (is-Undefined!1063 lt!121611))))

(declare-fun b!242092 () Bool)

(declare-fun e!157118 () Bool)

(declare-fun e!157132 () Bool)

(assert (=> b!242092 (= e!157118 (and e!157132 mapRes!10786))))

(declare-fun condMapEmpty!10786 () Bool)

(declare-fun mapDefault!10786 () ValueCell!2839)

