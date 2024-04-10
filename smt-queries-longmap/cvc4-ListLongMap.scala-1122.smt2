; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22982 () Bool)

(assert start!22982)

(declare-fun b!241034 () Bool)

(declare-fun b_free!6485 () Bool)

(declare-fun b_next!6485 () Bool)

(assert (=> b!241034 (= b_free!6485 (not b_next!6485))))

(declare-fun tp!22658 () Bool)

(declare-fun b_and!13451 () Bool)

(assert (=> b!241034 (= tp!22658 b_and!13451)))

(declare-fun b!241019 () Bool)

(declare-fun e!156440 () Bool)

(declare-datatypes ((V!8109 0))(
  ( (V!8110 (val!3218 Int)) )
))
(declare-datatypes ((ValueCell!2830 0))(
  ( (ValueCellFull!2830 (v!5256 V!8109)) (EmptyCell!2830) )
))
(declare-datatypes ((array!11973 0))(
  ( (array!11974 (arr!5688 (Array (_ BitVec 32) ValueCell!2830)) (size!6029 (_ BitVec 32))) )
))
(declare-datatypes ((array!11975 0))(
  ( (array!11976 (arr!5689 (Array (_ BitVec 32) (_ BitVec 64))) (size!6030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3560 0))(
  ( (LongMapFixedSize!3561 (defaultEntry!4465 Int) (mask!10527 (_ BitVec 32)) (extraKeys!4202 (_ BitVec 32)) (zeroValue!4306 V!8109) (minValue!4306 V!8109) (_size!1829 (_ BitVec 32)) (_keys!6567 array!11975) (_values!4448 array!11973) (_vacant!1829 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3560)

(assert (=> b!241019 (= e!156440 (bvsge (size!6030 (_keys!6567 thiss!1504)) #b01111111111111111111111111111111))))

(declare-datatypes ((Unit!7422 0))(
  ( (Unit!7423) )
))
(declare-fun lt!121131 () Unit!7422)

(declare-fun e!156439 () Unit!7422)

(assert (=> b!241019 (= lt!121131 e!156439)))

(declare-fun c!40145 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!241019 (= c!40145 (arrayContainsKey!0 (_keys!6567 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241020 () Bool)

(declare-fun e!156437 () Bool)

(declare-fun e!156438 () Bool)

(assert (=> b!241020 (= e!156437 e!156438)))

(declare-fun res!118171 () Bool)

(declare-fun call!22415 () Bool)

(assert (=> b!241020 (= res!118171 call!22415)))

(assert (=> b!241020 (=> (not res!118171) (not e!156438))))

(declare-fun b!241021 () Bool)

(declare-fun call!22416 () Bool)

(assert (=> b!241021 (= e!156438 (not call!22416))))

(declare-fun b!241022 () Bool)

(declare-fun res!118172 () Bool)

(declare-datatypes ((SeekEntryResult!1054 0))(
  ( (MissingZero!1054 (index!6386 (_ BitVec 32))) (Found!1054 (index!6387 (_ BitVec 32))) (Intermediate!1054 (undefined!1866 Bool) (index!6388 (_ BitVec 32)) (x!24190 (_ BitVec 32))) (Undefined!1054) (MissingVacant!1054 (index!6389 (_ BitVec 32))) )
))
(declare-fun lt!121134 () SeekEntryResult!1054)

(assert (=> b!241022 (= res!118172 (= (select (arr!5689 (_keys!6567 thiss!1504)) (index!6389 lt!121134)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241022 (=> (not res!118172) (not e!156438))))

(declare-fun b!241023 () Bool)

(declare-fun res!118178 () Bool)

(declare-fun e!156433 () Bool)

(assert (=> b!241023 (=> (not res!118178) (not e!156433))))

(assert (=> b!241023 (= res!118178 (= (select (arr!5689 (_keys!6567 thiss!1504)) (index!6386 lt!121134)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241024 () Bool)

(declare-fun Unit!7424 () Unit!7422)

(assert (=> b!241024 (= e!156439 Unit!7424)))

(declare-fun lt!121130 () Unit!7422)

(declare-fun lemmaArrayContainsKeyThenInListMap!152 (array!11975 array!11973 (_ BitVec 32) (_ BitVec 32) V!8109 V!8109 (_ BitVec 64) (_ BitVec 32) Int) Unit!7422)

(assert (=> b!241024 (= lt!121130 (lemmaArrayContainsKeyThenInListMap!152 (_keys!6567 thiss!1504) (_values!4448 thiss!1504) (mask!10527 thiss!1504) (extraKeys!4202 thiss!1504) (zeroValue!4306 thiss!1504) (minValue!4306 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4465 thiss!1504)))))

(assert (=> b!241024 false))

(declare-fun b!241025 () Bool)

(declare-fun e!156434 () Bool)

(assert (=> b!241025 (= e!156434 e!156440)))

(declare-fun res!118176 () Bool)

(assert (=> b!241025 (=> (not res!118176) (not e!156440))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241025 (= res!118176 (inRange!0 index!297 (mask!10527 thiss!1504)))))

(declare-fun lt!121133 () Unit!7422)

(declare-fun e!156432 () Unit!7422)

(assert (=> b!241025 (= lt!121133 e!156432)))

(declare-fun c!40144 () Bool)

(declare-datatypes ((tuple2!4740 0))(
  ( (tuple2!4741 (_1!2381 (_ BitVec 64)) (_2!2381 V!8109)) )
))
(declare-datatypes ((List!3621 0))(
  ( (Nil!3618) (Cons!3617 (h!4273 tuple2!4740) (t!8616 List!3621)) )
))
(declare-datatypes ((ListLongMap!3653 0))(
  ( (ListLongMap!3654 (toList!1842 List!3621)) )
))
(declare-fun contains!1730 (ListLongMap!3653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1370 (array!11975 array!11973 (_ BitVec 32) (_ BitVec 32) V!8109 V!8109 (_ BitVec 32) Int) ListLongMap!3653)

(assert (=> b!241025 (= c!40144 (contains!1730 (getCurrentListMap!1370 (_keys!6567 thiss!1504) (_values!4448 thiss!1504) (mask!10527 thiss!1504) (extraKeys!4202 thiss!1504) (zeroValue!4306 thiss!1504) (minValue!4306 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4465 thiss!1504)) key!932))))

(declare-fun bm!22412 () Bool)

(assert (=> bm!22412 (= call!22416 (arrayContainsKey!0 (_keys!6567 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241026 () Bool)

(declare-fun e!156441 () Bool)

(assert (=> b!241026 (= e!156441 e!156434)))

(declare-fun res!118173 () Bool)

(assert (=> b!241026 (=> (not res!118173) (not e!156434))))

(assert (=> b!241026 (= res!118173 (or (= lt!121134 (MissingZero!1054 index!297)) (= lt!121134 (MissingVacant!1054 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11975 (_ BitVec 32)) SeekEntryResult!1054)

(assert (=> b!241026 (= lt!121134 (seekEntryOrOpen!0 key!932 (_keys!6567 thiss!1504) (mask!10527 thiss!1504)))))

(declare-fun res!118177 () Bool)

(assert (=> start!22982 (=> (not res!118177) (not e!156441))))

(declare-fun valid!1399 (LongMapFixedSize!3560) Bool)

(assert (=> start!22982 (= res!118177 (valid!1399 thiss!1504))))

(assert (=> start!22982 e!156441))

(declare-fun e!156436 () Bool)

(assert (=> start!22982 e!156436))

(assert (=> start!22982 true))

(declare-fun b!241027 () Bool)

(declare-fun Unit!7425 () Unit!7422)

(assert (=> b!241027 (= e!156439 Unit!7425)))

(declare-fun bm!22413 () Bool)

(declare-fun c!40142 () Bool)

(assert (=> bm!22413 (= call!22415 (inRange!0 (ite c!40142 (index!6386 lt!121134) (index!6389 lt!121134)) (mask!10527 thiss!1504)))))

(declare-fun b!241028 () Bool)

(declare-fun Unit!7426 () Unit!7422)

(assert (=> b!241028 (= e!156432 Unit!7426)))

(declare-fun lt!121132 () Unit!7422)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!346 (array!11975 array!11973 (_ BitVec 32) (_ BitVec 32) V!8109 V!8109 (_ BitVec 64) Int) Unit!7422)

(assert (=> b!241028 (= lt!121132 (lemmaInListMapThenSeekEntryOrOpenFindsIt!346 (_keys!6567 thiss!1504) (_values!4448 thiss!1504) (mask!10527 thiss!1504) (extraKeys!4202 thiss!1504) (zeroValue!4306 thiss!1504) (minValue!4306 thiss!1504) key!932 (defaultEntry!4465 thiss!1504)))))

(assert (=> b!241028 false))

(declare-fun b!241029 () Bool)

(declare-fun c!40143 () Bool)

(assert (=> b!241029 (= c!40143 (is-MissingVacant!1054 lt!121134))))

(declare-fun e!156435 () Bool)

(assert (=> b!241029 (= e!156435 e!156437)))

(declare-fun mapIsEmpty!10752 () Bool)

(declare-fun mapRes!10752 () Bool)

(assert (=> mapIsEmpty!10752 mapRes!10752))

(declare-fun b!241030 () Bool)

(assert (=> b!241030 (= e!156437 (is-Undefined!1054 lt!121134))))

(declare-fun b!241031 () Bool)

(declare-fun res!118175 () Bool)

(assert (=> b!241031 (=> (not res!118175) (not e!156441))))

(assert (=> b!241031 (= res!118175 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241032 () Bool)

(declare-fun lt!121129 () Unit!7422)

(assert (=> b!241032 (= e!156432 lt!121129)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!357 (array!11975 array!11973 (_ BitVec 32) (_ BitVec 32) V!8109 V!8109 (_ BitVec 64) Int) Unit!7422)

(assert (=> b!241032 (= lt!121129 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!357 (_keys!6567 thiss!1504) (_values!4448 thiss!1504) (mask!10527 thiss!1504) (extraKeys!4202 thiss!1504) (zeroValue!4306 thiss!1504) (minValue!4306 thiss!1504) key!932 (defaultEntry!4465 thiss!1504)))))

(assert (=> b!241032 (= c!40142 (is-MissingZero!1054 lt!121134))))

(assert (=> b!241032 e!156435))

(declare-fun b!241033 () Bool)

(declare-fun e!156443 () Bool)

(declare-fun tp_is_empty!6347 () Bool)

(assert (=> b!241033 (= e!156443 tp_is_empty!6347)))

(declare-fun mapNonEmpty!10752 () Bool)

(declare-fun tp!22659 () Bool)

(assert (=> mapNonEmpty!10752 (= mapRes!10752 (and tp!22659 e!156443))))

(declare-fun mapKey!10752 () (_ BitVec 32))

(declare-fun mapValue!10752 () ValueCell!2830)

(declare-fun mapRest!10752 () (Array (_ BitVec 32) ValueCell!2830))

(assert (=> mapNonEmpty!10752 (= (arr!5688 (_values!4448 thiss!1504)) (store mapRest!10752 mapKey!10752 mapValue!10752))))

(declare-fun e!156442 () Bool)

(declare-fun array_inv!3765 (array!11975) Bool)

(declare-fun array_inv!3766 (array!11973) Bool)

(assert (=> b!241034 (= e!156436 (and tp!22658 tp_is_empty!6347 (array_inv!3765 (_keys!6567 thiss!1504)) (array_inv!3766 (_values!4448 thiss!1504)) e!156442))))

(declare-fun b!241035 () Bool)

(declare-fun e!156431 () Bool)

(assert (=> b!241035 (= e!156431 tp_is_empty!6347)))

(declare-fun b!241036 () Bool)

(assert (=> b!241036 (= e!156433 (not call!22416))))

(declare-fun b!241037 () Bool)

(assert (=> b!241037 (= e!156442 (and e!156431 mapRes!10752))))

(declare-fun condMapEmpty!10752 () Bool)

(declare-fun mapDefault!10752 () ValueCell!2830)

