; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22928 () Bool)

(assert start!22928)

(declare-fun b!239312 () Bool)

(declare-fun b_free!6431 () Bool)

(declare-fun b_next!6431 () Bool)

(assert (=> b!239312 (= b_free!6431 (not b_next!6431))))

(declare-fun tp!22496 () Bool)

(declare-fun b_and!13397 () Bool)

(assert (=> b!239312 (= tp!22496 b_and!13397)))

(declare-fun b!239300 () Bool)

(declare-fun e!155375 () Bool)

(declare-fun e!155382 () Bool)

(assert (=> b!239300 (= e!155375 e!155382)))

(declare-fun res!117287 () Bool)

(declare-fun call!22253 () Bool)

(assert (=> b!239300 (= res!117287 call!22253)))

(assert (=> b!239300 (=> (not res!117287) (not e!155382))))

(declare-fun b!239301 () Bool)

(declare-fun res!117280 () Bool)

(declare-fun e!155380 () Bool)

(assert (=> b!239301 (=> (not res!117280) (not e!155380))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!239301 (= res!117280 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239302 () Bool)

(declare-datatypes ((Unit!7347 0))(
  ( (Unit!7348) )
))
(declare-fun e!155372 () Unit!7347)

(declare-fun Unit!7349 () Unit!7347)

(assert (=> b!239302 (= e!155372 Unit!7349)))

(declare-fun lt!120764 () Unit!7347)

(declare-datatypes ((V!8037 0))(
  ( (V!8038 (val!3191 Int)) )
))
(declare-datatypes ((ValueCell!2803 0))(
  ( (ValueCellFull!2803 (v!5229 V!8037)) (EmptyCell!2803) )
))
(declare-datatypes ((array!11865 0))(
  ( (array!11866 (arr!5634 (Array (_ BitVec 32) ValueCell!2803)) (size!5975 (_ BitVec 32))) )
))
(declare-datatypes ((array!11867 0))(
  ( (array!11868 (arr!5635 (Array (_ BitVec 32) (_ BitVec 64))) (size!5976 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3506 0))(
  ( (LongMapFixedSize!3507 (defaultEntry!4438 Int) (mask!10482 (_ BitVec 32)) (extraKeys!4175 (_ BitVec 32)) (zeroValue!4279 V!8037) (minValue!4279 V!8037) (_size!1802 (_ BitVec 32)) (_keys!6540 array!11867) (_values!4421 array!11865) (_vacant!1802 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3506)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!325 (array!11867 array!11865 (_ BitVec 32) (_ BitVec 32) V!8037 V!8037 (_ BitVec 64) Int) Unit!7347)

(assert (=> b!239302 (= lt!120764 (lemmaInListMapThenSeekEntryOrOpenFindsIt!325 (_keys!6540 thiss!1504) (_values!4421 thiss!1504) (mask!10482 thiss!1504) (extraKeys!4175 thiss!1504) (zeroValue!4279 thiss!1504) (minValue!4279 thiss!1504) key!932 (defaultEntry!4438 thiss!1504)))))

(assert (=> b!239302 false))

(declare-fun b!239303 () Bool)

(declare-fun e!155376 () Bool)

(declare-fun e!155378 () Bool)

(declare-fun mapRes!10671 () Bool)

(assert (=> b!239303 (= e!155376 (and e!155378 mapRes!10671))))

(declare-fun condMapEmpty!10671 () Bool)

(declare-fun mapDefault!10671 () ValueCell!2803)

