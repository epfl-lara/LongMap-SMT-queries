; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22976 () Bool)

(assert start!22976)

(declare-fun b!240845 () Bool)

(declare-fun b_free!6479 () Bool)

(declare-fun b_next!6479 () Bool)

(assert (=> b!240845 (= b_free!6479 (not b_next!6479))))

(declare-fun tp!22640 () Bool)

(declare-fun b_and!13445 () Bool)

(assert (=> b!240845 (= tp!22640 b_and!13445)))

(declare-fun b!240840 () Bool)

(declare-datatypes ((Unit!7412 0))(
  ( (Unit!7413) )
))
(declare-fun e!156317 () Unit!7412)

(declare-fun Unit!7414 () Unit!7412)

(assert (=> b!240840 (= e!156317 Unit!7414)))

(declare-fun lt!121075 () Unit!7412)

(declare-datatypes ((V!8101 0))(
  ( (V!8102 (val!3215 Int)) )
))
(declare-datatypes ((ValueCell!2827 0))(
  ( (ValueCellFull!2827 (v!5253 V!8101)) (EmptyCell!2827) )
))
(declare-datatypes ((array!11961 0))(
  ( (array!11962 (arr!5682 (Array (_ BitVec 32) ValueCell!2827)) (size!6023 (_ BitVec 32))) )
))
(declare-datatypes ((array!11963 0))(
  ( (array!11964 (arr!5683 (Array (_ BitVec 32) (_ BitVec 64))) (size!6024 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3554 0))(
  ( (LongMapFixedSize!3555 (defaultEntry!4462 Int) (mask!10522 (_ BitVec 32)) (extraKeys!4199 (_ BitVec 32)) (zeroValue!4303 V!8101) (minValue!4303 V!8101) (_size!1826 (_ BitVec 32)) (_keys!6564 array!11963) (_values!4445 array!11961) (_vacant!1826 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3554)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!344 (array!11963 array!11961 (_ BitVec 32) (_ BitVec 32) V!8101 V!8101 (_ BitVec 64) Int) Unit!7412)

(assert (=> b!240840 (= lt!121075 (lemmaInListMapThenSeekEntryOrOpenFindsIt!344 (_keys!6564 thiss!1504) (_values!4445 thiss!1504) (mask!10522 thiss!1504) (extraKeys!4199 thiss!1504) (zeroValue!4303 thiss!1504) (minValue!4303 thiss!1504) key!932 (defaultEntry!4462 thiss!1504)))))

(assert (=> b!240840 false))

(declare-fun mapNonEmpty!10743 () Bool)

(declare-fun mapRes!10743 () Bool)

(declare-fun tp!22641 () Bool)

(declare-fun e!156308 () Bool)

(assert (=> mapNonEmpty!10743 (= mapRes!10743 (and tp!22641 e!156308))))

(declare-fun mapValue!10743 () ValueCell!2827)

(declare-fun mapRest!10743 () (Array (_ BitVec 32) ValueCell!2827))

(declare-fun mapKey!10743 () (_ BitVec 32))

(assert (=> mapNonEmpty!10743 (= (arr!5682 (_values!4445 thiss!1504)) (store mapRest!10743 mapKey!10743 mapValue!10743))))

(declare-fun b!240841 () Bool)

(declare-fun e!156318 () Bool)

(declare-fun e!156313 () Bool)

(assert (=> b!240841 (= e!156318 (and e!156313 mapRes!10743))))

(declare-fun condMapEmpty!10743 () Bool)

(declare-fun mapDefault!10743 () ValueCell!2827)

