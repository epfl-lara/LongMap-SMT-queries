; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23328 () Bool)

(assert start!23328)

(declare-fun b!245281 () Bool)

(declare-fun b_free!6553 () Bool)

(declare-fun b_next!6553 () Bool)

(assert (=> b!245281 (= b_free!6553 (not b_next!6553))))

(declare-fun tp!22890 () Bool)

(declare-fun b_and!13541 () Bool)

(assert (=> b!245281 (= tp!22890 b_and!13541)))

(declare-fun b!245279 () Bool)

(declare-fun e!159135 () Bool)

(declare-fun call!22893 () Bool)

(assert (=> b!245279 (= e!159135 (not call!22893))))

(declare-fun mapIsEmpty!10882 () Bool)

(declare-fun mapRes!10882 () Bool)

(assert (=> mapIsEmpty!10882 mapRes!10882))

(declare-fun b!245280 () Bool)

(declare-fun e!159137 () Bool)

(declare-fun e!159128 () Bool)

(assert (=> b!245280 (= e!159137 e!159128)))

(declare-fun res!120326 () Bool)

(assert (=> b!245280 (=> (not res!120326) (not e!159128))))

(declare-datatypes ((SeekEntryResult!1087 0))(
  ( (MissingZero!1087 (index!6518 (_ BitVec 32))) (Found!1087 (index!6519 (_ BitVec 32))) (Intermediate!1087 (undefined!1899 Bool) (index!6520 (_ BitVec 32)) (x!24417 (_ BitVec 32))) (Undefined!1087) (MissingVacant!1087 (index!6521 (_ BitVec 32))) )
))
(declare-fun lt!122835 () SeekEntryResult!1087)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!245280 (= res!120326 (or (= lt!122835 (MissingZero!1087 index!297)) (= lt!122835 (MissingVacant!1087 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8201 0))(
  ( (V!8202 (val!3252 Int)) )
))
(declare-datatypes ((ValueCell!2864 0))(
  ( (ValueCellFull!2864 (v!5304 V!8201)) (EmptyCell!2864) )
))
(declare-datatypes ((array!12127 0))(
  ( (array!12128 (arr!5756 (Array (_ BitVec 32) ValueCell!2864)) (size!6098 (_ BitVec 32))) )
))
(declare-datatypes ((array!12129 0))(
  ( (array!12130 (arr!5757 (Array (_ BitVec 32) (_ BitVec 64))) (size!6099 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3628 0))(
  ( (LongMapFixedSize!3629 (defaultEntry!4539 Int) (mask!10648 (_ BitVec 32)) (extraKeys!4276 (_ BitVec 32)) (zeroValue!4380 V!8201) (minValue!4380 V!8201) (_size!1863 (_ BitVec 32)) (_keys!6653 array!12129) (_values!4522 array!12127) (_vacant!1863 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3628)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12129 (_ BitVec 32)) SeekEntryResult!1087)

(assert (=> b!245280 (= lt!122835 (seekEntryOrOpen!0 key!932 (_keys!6653 thiss!1504) (mask!10648 thiss!1504)))))

(declare-fun e!159127 () Bool)

(declare-fun tp_is_empty!6415 () Bool)

(declare-fun e!159133 () Bool)

(declare-fun array_inv!3803 (array!12129) Bool)

(declare-fun array_inv!3804 (array!12127) Bool)

(assert (=> b!245281 (= e!159127 (and tp!22890 tp_is_empty!6415 (array_inv!3803 (_keys!6653 thiss!1504)) (array_inv!3804 (_values!4522 thiss!1504)) e!159133))))

(declare-fun b!245282 () Bool)

(declare-datatypes ((Unit!7571 0))(
  ( (Unit!7572) )
))
(declare-fun e!159129 () Unit!7571)

(declare-fun Unit!7573 () Unit!7571)

(assert (=> b!245282 (= e!159129 Unit!7573)))

(declare-fun lt!122840 () Unit!7571)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!370 (array!12129 array!12127 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7571)

(assert (=> b!245282 (= lt!122840 (lemmaInListMapThenSeekEntryOrOpenFindsIt!370 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(assert (=> b!245282 false))

(declare-fun b!245283 () Bool)

(declare-fun e!159126 () Bool)

(assert (=> b!245283 (= e!159126 (is-Undefined!1087 lt!122835))))

(declare-fun b!245284 () Bool)

(declare-fun e!159138 () Unit!7571)

(declare-fun Unit!7574 () Unit!7571)

(assert (=> b!245284 (= e!159138 Unit!7574)))

(declare-fun b!245285 () Bool)

(declare-fun e!159132 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245285 (= e!159132 (not (validMask!0 (mask!10648 thiss!1504))))))

(declare-fun lt!122838 () array!12129)

(declare-fun arrayCountValidKeys!0 (array!12129 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245285 (= (arrayCountValidKeys!0 lt!122838 #b00000000000000000000000000000000 (size!6099 (_keys!6653 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6653 thiss!1504) #b00000000000000000000000000000000 (size!6099 (_keys!6653 thiss!1504)))))))

(declare-fun lt!122839 () Unit!7571)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12129 (_ BitVec 32) (_ BitVec 64)) Unit!7571)

(assert (=> b!245285 (= lt!122839 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6653 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3666 0))(
  ( (Nil!3663) (Cons!3662 (h!4319 (_ BitVec 64)) (t!8679 List!3666)) )
))
(declare-fun arrayNoDuplicates!0 (array!12129 (_ BitVec 32) List!3666) Bool)

(assert (=> b!245285 (arrayNoDuplicates!0 lt!122838 #b00000000000000000000000000000000 Nil!3663)))

(assert (=> b!245285 (= lt!122838 (array!12130 (store (arr!5757 (_keys!6653 thiss!1504)) index!297 key!932) (size!6099 (_keys!6653 thiss!1504))))))

(declare-fun lt!122836 () Unit!7571)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12129 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3666) Unit!7571)

(assert (=> b!245285 (= lt!122836 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6653 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3663))))

(declare-fun lt!122842 () Unit!7571)

(assert (=> b!245285 (= lt!122842 e!159138)))

(declare-fun c!40950 () Bool)

(declare-fun arrayContainsKey!0 (array!12129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!245285 (= c!40950 (arrayContainsKey!0 (_keys!6653 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245287 () Bool)

(declare-fun res!120323 () Bool)

(declare-fun e!159134 () Bool)

(assert (=> b!245287 (=> (not res!120323) (not e!159134))))

(assert (=> b!245287 (= res!120323 (= (select (arr!5757 (_keys!6653 thiss!1504)) (index!6518 lt!122835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245288 () Bool)

(declare-fun lt!122841 () Unit!7571)

(assert (=> b!245288 (= e!159129 lt!122841)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!376 (array!12129 array!12127 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7571)

(assert (=> b!245288 (= lt!122841 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!376 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(declare-fun c!40948 () Bool)

(assert (=> b!245288 (= c!40948 (is-MissingZero!1087 lt!122835))))

(declare-fun e!159136 () Bool)

(assert (=> b!245288 e!159136))

(declare-fun b!245289 () Bool)

(assert (=> b!245289 (= e!159126 e!159135)))

(declare-fun res!120327 () Bool)

(declare-fun call!22892 () Bool)

(assert (=> b!245289 (= res!120327 call!22892)))

(assert (=> b!245289 (=> (not res!120327) (not e!159135))))

(declare-fun b!245290 () Bool)

(declare-fun e!159139 () Bool)

(assert (=> b!245290 (= e!159139 tp_is_empty!6415)))

(declare-fun bm!22889 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22889 (= call!22892 (inRange!0 (ite c!40948 (index!6518 lt!122835) (index!6521 lt!122835)) (mask!10648 thiss!1504)))))

(declare-fun b!245291 () Bool)

(assert (=> b!245291 (= e!159128 e!159132)))

(declare-fun res!120322 () Bool)

(assert (=> b!245291 (=> (not res!120322) (not e!159132))))

(assert (=> b!245291 (= res!120322 (inRange!0 index!297 (mask!10648 thiss!1504)))))

(declare-fun lt!122837 () Unit!7571)

(assert (=> b!245291 (= lt!122837 e!159129)))

(declare-fun c!40949 () Bool)

(declare-datatypes ((tuple2!4784 0))(
  ( (tuple2!4785 (_1!2403 (_ BitVec 64)) (_2!2403 V!8201)) )
))
(declare-datatypes ((List!3667 0))(
  ( (Nil!3664) (Cons!3663 (h!4320 tuple2!4784) (t!8680 List!3667)) )
))
(declare-datatypes ((ListLongMap!3697 0))(
  ( (ListLongMap!3698 (toList!1864 List!3667)) )
))
(declare-fun contains!1772 (ListLongMap!3697 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1392 (array!12129 array!12127 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 32) Int) ListLongMap!3697)

(assert (=> b!245291 (= c!40949 (contains!1772 (getCurrentListMap!1392 (_keys!6653 thiss!1504) (_values!4522 thiss!1504) (mask!10648 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) key!932))))

(declare-fun b!245292 () Bool)

(assert (=> b!245292 (= e!159133 (and e!159139 mapRes!10882))))

(declare-fun condMapEmpty!10882 () Bool)

(declare-fun mapDefault!10882 () ValueCell!2864)

