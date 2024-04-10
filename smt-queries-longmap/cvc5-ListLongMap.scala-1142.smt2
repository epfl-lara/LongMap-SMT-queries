; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23618 () Bool)

(assert start!23618)

(declare-fun b!248250 () Bool)

(declare-fun b_free!6601 () Bool)

(declare-fun b_next!6601 () Bool)

(assert (=> b!248250 (= b_free!6601 (not b_next!6601))))

(declare-fun tp!23054 () Bool)

(declare-fun b_and!13605 () Bool)

(assert (=> b!248250 (= tp!23054 b_and!13605)))

(declare-fun b!248229 () Bool)

(declare-fun c!41584 () Bool)

(declare-datatypes ((SeekEntryResult!1109 0))(
  ( (MissingZero!1109 (index!6606 (_ BitVec 32))) (Found!1109 (index!6607 (_ BitVec 32))) (Intermediate!1109 (undefined!1921 Bool) (index!6608 (_ BitVec 32)) (x!24571 (_ BitVec 32))) (Undefined!1109) (MissingVacant!1109 (index!6609 (_ BitVec 32))) )
))
(declare-fun lt!124303 () SeekEntryResult!1109)

(assert (=> b!248229 (= c!41584 (is-MissingVacant!1109 lt!124303))))

(declare-fun e!161028 () Bool)

(declare-fun e!161029 () Bool)

(assert (=> b!248229 (= e!161028 e!161029)))

(declare-fun b!248230 () Bool)

(declare-datatypes ((Unit!7683 0))(
  ( (Unit!7684) )
))
(declare-fun e!161017 () Unit!7683)

(declare-fun Unit!7685 () Unit!7683)

(assert (=> b!248230 (= e!161017 Unit!7685)))

(declare-fun lt!124306 () Unit!7683)

(declare-datatypes ((V!8265 0))(
  ( (V!8266 (val!3276 Int)) )
))
(declare-datatypes ((ValueCell!2888 0))(
  ( (ValueCellFull!2888 (v!5335 V!8265)) (EmptyCell!2888) )
))
(declare-datatypes ((array!12235 0))(
  ( (array!12236 (arr!5804 (Array (_ BitVec 32) ValueCell!2888)) (size!6147 (_ BitVec 32))) )
))
(declare-datatypes ((array!12237 0))(
  ( (array!12238 (arr!5805 (Array (_ BitVec 32) (_ BitVec 64))) (size!6148 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3676 0))(
  ( (LongMapFixedSize!3677 (defaultEntry!4591 Int) (mask!10739 (_ BitVec 32)) (extraKeys!4328 (_ BitVec 32)) (zeroValue!4432 V!8265) (minValue!4432 V!8265) (_size!1887 (_ BitVec 32)) (_keys!6715 array!12237) (_values!4574 array!12235) (_vacant!1887 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3676)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!191 (array!12237 array!12235 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) (_ BitVec 32) Int) Unit!7683)

(assert (=> b!248230 (= lt!124306 (lemmaArrayContainsKeyThenInListMap!191 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(assert (=> b!248230 false))

(declare-fun b!248231 () Bool)

(declare-fun res!121653 () Bool)

(declare-fun e!161026 () Bool)

(assert (=> b!248231 (=> res!121653 e!161026)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!248231 (= res!121653 (or (not (= (size!6148 (_keys!6715 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10739 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6148 (_keys!6715 thiss!1504)))))))

(declare-fun b!248232 () Bool)

(declare-fun e!161019 () Bool)

(declare-fun e!161016 () Bool)

(assert (=> b!248232 (= e!161019 e!161016)))

(declare-fun res!121663 () Bool)

(assert (=> b!248232 (=> (not res!121663) (not e!161016))))

(assert (=> b!248232 (= res!121663 (or (= lt!124303 (MissingZero!1109 index!297)) (= lt!124303 (MissingVacant!1109 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12237 (_ BitVec 32)) SeekEntryResult!1109)

(assert (=> b!248232 (= lt!124303 (seekEntryOrOpen!0 key!932 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)))))

(declare-fun c!41581 () Bool)

(declare-fun bm!23258 () Bool)

(declare-fun call!23262 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23258 (= call!23262 (inRange!0 (ite c!41581 (index!6606 lt!124303) (index!6609 lt!124303)) (mask!10739 thiss!1504)))))

(declare-fun b!248234 () Bool)

(declare-fun e!161027 () Bool)

(declare-fun tp_is_empty!6463 () Bool)

(assert (=> b!248234 (= e!161027 tp_is_empty!6463)))

(declare-fun b!248235 () Bool)

(declare-fun e!161022 () Unit!7683)

(declare-fun lt!124311 () Unit!7683)

(assert (=> b!248235 (= e!161022 lt!124311)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!391 (array!12237 array!12235 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7683)

(assert (=> b!248235 (= lt!124311 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!391 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(assert (=> b!248235 (= c!41581 (is-MissingZero!1109 lt!124303))))

(assert (=> b!248235 e!161028))

(declare-fun b!248236 () Bool)

(declare-fun e!161024 () Bool)

(declare-fun e!161020 () Bool)

(declare-fun mapRes!10973 () Bool)

(assert (=> b!248236 (= e!161024 (and e!161020 mapRes!10973))))

(declare-fun condMapEmpty!10973 () Bool)

(declare-fun mapDefault!10973 () ValueCell!2888)

