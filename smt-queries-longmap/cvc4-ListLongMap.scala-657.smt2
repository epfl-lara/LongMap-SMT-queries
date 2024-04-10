; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16294 () Bool)

(assert start!16294)

(declare-fun b!162593 () Bool)

(declare-fun b_free!3755 () Bool)

(declare-fun b_next!3755 () Bool)

(assert (=> b!162593 (= b_free!3755 (not b_next!3755))))

(declare-fun tp!13834 () Bool)

(declare-fun b_and!10169 () Bool)

(assert (=> b!162593 (= tp!13834 b_and!10169)))

(declare-fun e!106594 () Bool)

(declare-fun e!106593 () Bool)

(declare-datatypes ((V!4389 0))(
  ( (V!4390 (val!1823 Int)) )
))
(declare-datatypes ((ValueCell!1435 0))(
  ( (ValueCellFull!1435 (v!3688 V!4389)) (EmptyCell!1435) )
))
(declare-datatypes ((array!6193 0))(
  ( (array!6194 (arr!2941 (Array (_ BitVec 32) (_ BitVec 64))) (size!3225 (_ BitVec 32))) )
))
(declare-datatypes ((array!6195 0))(
  ( (array!6196 (arr!2942 (Array (_ BitVec 32) ValueCell!1435)) (size!3226 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1778 0))(
  ( (LongMapFixedSize!1779 (defaultEntry!3331 Int) (mask!7957 (_ BitVec 32)) (extraKeys!3072 (_ BitVec 32)) (zeroValue!3174 V!4389) (minValue!3174 V!4389) (_size!938 (_ BitVec 32)) (_keys!5132 array!6193) (_values!3314 array!6195) (_vacant!938 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1778)

(declare-fun tp_is_empty!3557 () Bool)

(declare-fun array_inv!1881 (array!6193) Bool)

(declare-fun array_inv!1882 (array!6195) Bool)

(assert (=> b!162593 (= e!106594 (and tp!13834 tp_is_empty!3557 (array_inv!1881 (_keys!5132 thiss!1248)) (array_inv!1882 (_values!3314 thiss!1248)) e!106593))))

(declare-fun b!162594 () Bool)

(declare-fun e!106596 () Bool)

(assert (=> b!162594 (= e!106596 tp_is_empty!3557)))

(declare-fun mapNonEmpty!6023 () Bool)

(declare-fun mapRes!6023 () Bool)

(declare-fun tp!13835 () Bool)

(assert (=> mapNonEmpty!6023 (= mapRes!6023 (and tp!13835 e!106596))))

(declare-fun mapKey!6023 () (_ BitVec 32))

(declare-fun mapRest!6023 () (Array (_ BitVec 32) ValueCell!1435))

(declare-fun mapValue!6023 () ValueCell!1435)

(assert (=> mapNonEmpty!6023 (= (arr!2942 (_values!3314 thiss!1248)) (store mapRest!6023 mapKey!6023 mapValue!6023))))

(declare-fun b!162595 () Bool)

(declare-fun e!106599 () Bool)

(assert (=> b!162595 (= e!106593 (and e!106599 mapRes!6023))))

(declare-fun condMapEmpty!6023 () Bool)

(declare-fun mapDefault!6023 () ValueCell!1435)
