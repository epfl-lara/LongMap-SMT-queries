; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16570 () Bool)

(assert start!16570)

(declare-fun b!165075 () Bool)

(declare-fun b_free!3875 () Bool)

(declare-fun b_next!3875 () Bool)

(assert (=> b!165075 (= b_free!3875 (not b_next!3875))))

(declare-fun tp!14225 () Bool)

(declare-fun b_and!10289 () Bool)

(assert (=> b!165075 (= tp!14225 b_and!10289)))

(declare-fun b!165074 () Bool)

(declare-fun e!108295 () Bool)

(declare-fun tp_is_empty!3677 () Bool)

(assert (=> b!165074 (= e!108295 tp_is_empty!3677)))

(declare-fun e!108292 () Bool)

(declare-fun e!108296 () Bool)

(declare-datatypes ((V!4549 0))(
  ( (V!4550 (val!1883 Int)) )
))
(declare-datatypes ((ValueCell!1495 0))(
  ( (ValueCellFull!1495 (v!3748 V!4549)) (EmptyCell!1495) )
))
(declare-datatypes ((array!6451 0))(
  ( (array!6452 (arr!3061 (Array (_ BitVec 32) (_ BitVec 64))) (size!3349 (_ BitVec 32))) )
))
(declare-datatypes ((array!6453 0))(
  ( (array!6454 (arr!3062 (Array (_ BitVec 32) ValueCell!1495)) (size!3350 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1898 0))(
  ( (LongMapFixedSize!1899 (defaultEntry!3391 Int) (mask!8094 (_ BitVec 32)) (extraKeys!3132 (_ BitVec 32)) (zeroValue!3234 V!4549) (minValue!3234 V!4549) (_size!998 (_ BitVec 32)) (_keys!5216 array!6451) (_values!3374 array!6453) (_vacant!998 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1898)

(declare-fun array_inv!1965 (array!6451) Bool)

(declare-fun array_inv!1966 (array!6453) Bool)

(assert (=> b!165075 (= e!108292 (and tp!14225 tp_is_empty!3677 (array_inv!1965 (_keys!5216 thiss!1248)) (array_inv!1966 (_values!3374 thiss!1248)) e!108296))))

(declare-fun b!165076 () Bool)

(declare-fun e!108294 () Bool)

(declare-fun mapRes!6234 () Bool)

(assert (=> b!165076 (= e!108296 (and e!108294 mapRes!6234))))

(declare-fun condMapEmpty!6234 () Bool)

(declare-fun mapDefault!6234 () ValueCell!1495)

