; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16816 () Bool)

(assert start!16816)

(declare-fun b!169526 () Bool)

(declare-fun b_free!4143 () Bool)

(declare-fun b_next!4143 () Bool)

(assert (=> b!169526 (= b_free!4143 (not b_next!4143))))

(declare-fun tp!15033 () Bool)

(declare-fun b_and!10557 () Bool)

(assert (=> b!169526 (= tp!15033 b_and!10557)))

(declare-fun b!169525 () Bool)

(declare-fun b_free!4145 () Bool)

(declare-fun b_next!4145 () Bool)

(assert (=> b!169525 (= b_free!4145 (not b_next!4145))))

(declare-fun tp!15036 () Bool)

(declare-fun b_and!10559 () Bool)

(assert (=> b!169525 (= tp!15036 b_and!10559)))

(declare-fun mapNonEmpty!6638 () Bool)

(declare-fun mapRes!6639 () Bool)

(declare-fun tp!15034 () Bool)

(declare-fun e!111747 () Bool)

(assert (=> mapNonEmpty!6638 (= mapRes!6639 (and tp!15034 e!111747))))

(declare-fun mapKey!6638 () (_ BitVec 32))

(declare-datatypes ((V!4877 0))(
  ( (V!4878 (val!2006 Int)) )
))
(declare-datatypes ((ValueCell!1618 0))(
  ( (ValueCellFull!1618 (v!3871 V!4877)) (EmptyCell!1618) )
))
(declare-fun mapValue!6639 () ValueCell!1618)

(declare-datatypes ((array!6943 0))(
  ( (array!6944 (arr!3307 (Array (_ BitVec 32) (_ BitVec 64))) (size!3595 (_ BitVec 32))) )
))
(declare-datatypes ((array!6945 0))(
  ( (array!6946 (arr!3308 (Array (_ BitVec 32) ValueCell!1618)) (size!3596 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2144 0))(
  ( (LongMapFixedSize!2145 (defaultEntry!3514 Int) (mask!8299 (_ BitVec 32)) (extraKeys!3255 (_ BitVec 32)) (zeroValue!3357 V!4877) (minValue!3357 V!4877) (_size!1121 (_ BitVec 32)) (_keys!5339 array!6943) (_values!3497 array!6945) (_vacant!1121 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2144)

(declare-fun mapRest!6638 () (Array (_ BitVec 32) ValueCell!1618))

(assert (=> mapNonEmpty!6638 (= (arr!3308 (_values!3497 thiss!1248)) (store mapRest!6638 mapKey!6638 mapValue!6639))))

(declare-fun b!169520 () Bool)

(declare-fun e!111752 () Bool)

(declare-fun e!111745 () Bool)

(declare-fun mapRes!6638 () Bool)

(assert (=> b!169520 (= e!111752 (and e!111745 mapRes!6638))))

(declare-fun condMapEmpty!6638 () Bool)

(declare-datatypes ((tuple2!3224 0))(
  ( (tuple2!3225 (_1!1623 Bool) (_2!1623 LongMapFixedSize!2144)) )
))
(declare-fun err!83 () tuple2!3224)

(declare-fun mapDefault!6639 () ValueCell!1618)

