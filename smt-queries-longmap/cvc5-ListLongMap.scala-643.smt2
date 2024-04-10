; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16206 () Bool)

(assert start!16206)

(declare-fun b!161662 () Bool)

(declare-fun b_free!3667 () Bool)

(declare-fun b_next!3667 () Bool)

(assert (=> b!161662 (= b_free!3667 (not b_next!3667))))

(declare-fun tp!13570 () Bool)

(declare-fun b_and!10081 () Bool)

(assert (=> b!161662 (= tp!13570 b_and!10081)))

(declare-fun b!161660 () Bool)

(declare-fun e!105696 () Bool)

(declare-fun tp_is_empty!3469 () Bool)

(assert (=> b!161660 (= e!105696 tp_is_empty!3469)))

(declare-fun b!161661 () Bool)

(declare-fun e!105698 () Bool)

(assert (=> b!161661 (= e!105698 tp_is_empty!3469)))

(declare-datatypes ((V!4273 0))(
  ( (V!4274 (val!1779 Int)) )
))
(declare-datatypes ((ValueCell!1391 0))(
  ( (ValueCellFull!1391 (v!3644 V!4273)) (EmptyCell!1391) )
))
(declare-datatypes ((array!6017 0))(
  ( (array!6018 (arr!2853 (Array (_ BitVec 32) (_ BitVec 64))) (size!3137 (_ BitVec 32))) )
))
(declare-datatypes ((array!6019 0))(
  ( (array!6020 (arr!2854 (Array (_ BitVec 32) ValueCell!1391)) (size!3138 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1690 0))(
  ( (LongMapFixedSize!1691 (defaultEntry!3287 Int) (mask!7885 (_ BitVec 32)) (extraKeys!3028 (_ BitVec 32)) (zeroValue!3130 V!4273) (minValue!3130 V!4273) (_size!894 (_ BitVec 32)) (_keys!5088 array!6017) (_values!3270 array!6019) (_vacant!894 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1690)

(declare-fun e!105699 () Bool)

(declare-fun e!105697 () Bool)

(declare-fun array_inv!1821 (array!6017) Bool)

(declare-fun array_inv!1822 (array!6019) Bool)

(assert (=> b!161662 (= e!105697 (and tp!13570 tp_is_empty!3469 (array_inv!1821 (_keys!5088 thiss!1248)) (array_inv!1822 (_values!3270 thiss!1248)) e!105699))))

(declare-fun mapIsEmpty!5891 () Bool)

(declare-fun mapRes!5891 () Bool)

(assert (=> mapIsEmpty!5891 mapRes!5891))

(declare-fun b!161663 () Bool)

(assert (=> b!161663 (= e!105699 (and e!105696 mapRes!5891))))

(declare-fun condMapEmpty!5891 () Bool)

(declare-fun mapDefault!5891 () ValueCell!1391)

