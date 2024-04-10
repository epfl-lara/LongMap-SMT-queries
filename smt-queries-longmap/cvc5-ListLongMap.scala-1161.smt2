; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24466 () Bool)

(assert start!24466)

(declare-fun b!256241 () Bool)

(declare-fun b_free!6715 () Bool)

(declare-fun b_next!6715 () Bool)

(assert (=> b!256241 (= b_free!6715 (not b_next!6715))))

(declare-fun tp!23444 () Bool)

(declare-fun b_and!13773 () Bool)

(assert (=> b!256241 (= tp!23444 b_and!13773)))

(declare-fun b!256230 () Bool)

(declare-fun e!166102 () Bool)

(declare-fun e!166100 () Bool)

(assert (=> b!256230 (= e!166102 e!166100)))

(declare-fun res!125369 () Bool)

(assert (=> b!256230 (=> (not res!125369) (not e!166100))))

(declare-datatypes ((SeekEntryResult!1161 0))(
  ( (MissingZero!1161 (index!6814 (_ BitVec 32))) (Found!1161 (index!6815 (_ BitVec 32))) (Intermediate!1161 (undefined!1973 Bool) (index!6816 (_ BitVec 32)) (x!24957 (_ BitVec 32))) (Undefined!1161) (MissingVacant!1161 (index!6817 (_ BitVec 32))) )
))
(declare-fun lt!128644 () SeekEntryResult!1161)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!256230 (= res!125369 (or (= lt!128644 (MissingZero!1161 index!297)) (= lt!128644 (MissingVacant!1161 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8417 0))(
  ( (V!8418 (val!3333 Int)) )
))
(declare-datatypes ((ValueCell!2945 0))(
  ( (ValueCellFull!2945 (v!5419 V!8417)) (EmptyCell!2945) )
))
(declare-datatypes ((array!12493 0))(
  ( (array!12494 (arr!5918 (Array (_ BitVec 32) ValueCell!2945)) (size!6265 (_ BitVec 32))) )
))
(declare-datatypes ((array!12495 0))(
  ( (array!12496 (arr!5919 (Array (_ BitVec 32) (_ BitVec 64))) (size!6266 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3790 0))(
  ( (LongMapFixedSize!3791 (defaultEntry!4728 Int) (mask!11000 (_ BitVec 32)) (extraKeys!4465 (_ BitVec 32)) (zeroValue!4569 V!8417) (minValue!4569 V!8417) (_size!1944 (_ BitVec 32)) (_keys!6890 array!12495) (_values!4711 array!12493) (_vacant!1944 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3790)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12495 (_ BitVec 32)) SeekEntryResult!1161)

(assert (=> b!256230 (= lt!128644 (seekEntryOrOpen!0 key!932 (_keys!6890 thiss!1504) (mask!11000 thiss!1504)))))

(declare-fun call!24266 () Bool)

(declare-fun bm!24263 () Bool)

(declare-fun c!43305 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24263 (= call!24266 (inRange!0 (ite c!43305 (index!6814 lt!128644) (index!6817 lt!128644)) (mask!11000 thiss!1504)))))

(declare-fun b!256231 () Bool)

(declare-fun c!43306 () Bool)

(assert (=> b!256231 (= c!43306 (is-MissingVacant!1161 lt!128644))))

(declare-fun e!166090 () Bool)

(declare-fun e!166097 () Bool)

(assert (=> b!256231 (= e!166090 e!166097)))

(declare-fun b!256232 () Bool)

(declare-fun e!166101 () Bool)

(declare-fun call!24267 () Bool)

(assert (=> b!256232 (= e!166101 (not call!24267))))

(declare-fun mapNonEmpty!11193 () Bool)

(declare-fun mapRes!11193 () Bool)

(declare-fun tp!23445 () Bool)

(declare-fun e!166091 () Bool)

(assert (=> mapNonEmpty!11193 (= mapRes!11193 (and tp!23445 e!166091))))

(declare-fun mapKey!11193 () (_ BitVec 32))

(declare-fun mapRest!11193 () (Array (_ BitVec 32) ValueCell!2945))

(declare-fun mapValue!11193 () ValueCell!2945)

(assert (=> mapNonEmpty!11193 (= (arr!5918 (_values!4711 thiss!1504)) (store mapRest!11193 mapKey!11193 mapValue!11193))))

(declare-fun b!256233 () Bool)

(declare-datatypes ((Unit!7949 0))(
  ( (Unit!7950) )
))
(declare-fun e!166098 () Unit!7949)

(declare-fun Unit!7951 () Unit!7949)

(assert (=> b!256233 (= e!166098 Unit!7951)))

(declare-fun lt!128637 () Unit!7949)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!426 (array!12495 array!12493 (_ BitVec 32) (_ BitVec 32) V!8417 V!8417 (_ BitVec 64) Int) Unit!7949)

(assert (=> b!256233 (= lt!128637 (lemmaInListMapThenSeekEntryOrOpenFindsIt!426 (_keys!6890 thiss!1504) (_values!4711 thiss!1504) (mask!11000 thiss!1504) (extraKeys!4465 thiss!1504) (zeroValue!4569 thiss!1504) (minValue!4569 thiss!1504) key!932 (defaultEntry!4728 thiss!1504)))))

(assert (=> b!256233 false))

(declare-fun res!125366 () Bool)

(assert (=> start!24466 (=> (not res!125366) (not e!166102))))

(declare-fun valid!1481 (LongMapFixedSize!3790) Bool)

(assert (=> start!24466 (= res!125366 (valid!1481 thiss!1504))))

(assert (=> start!24466 e!166102))

(declare-fun e!166096 () Bool)

(assert (=> start!24466 e!166096))

(assert (=> start!24466 true))

(declare-fun tp_is_empty!6577 () Bool)

(assert (=> start!24466 tp_is_empty!6577))

(declare-fun b!256234 () Bool)

(declare-fun e!166093 () Bool)

(declare-fun e!166094 () Bool)

(assert (=> b!256234 (= e!166093 (and e!166094 mapRes!11193))))

(declare-fun condMapEmpty!11193 () Bool)

(declare-fun mapDefault!11193 () ValueCell!2945)

