; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13550 () Bool)

(assert start!13550)

(declare-fun b!124436 () Bool)

(declare-fun b_free!2841 () Bool)

(declare-fun b_next!2841 () Bool)

(assert (=> b!124436 (= b_free!2841 (not b_next!2841))))

(declare-fun tp!10921 () Bool)

(declare-fun b_and!7651 () Bool)

(assert (=> b!124436 (= tp!10921 b_and!7651)))

(declare-fun b!124422 () Bool)

(declare-fun b_free!2843 () Bool)

(declare-fun b_next!2843 () Bool)

(assert (=> b!124422 (= b_free!2843 (not b_next!2843))))

(declare-fun tp!10923 () Bool)

(declare-fun b_and!7653 () Bool)

(assert (=> b!124422 (= tp!10923 b_and!7653)))

(declare-fun mapIsEmpty!4479 () Bool)

(declare-fun mapRes!4479 () Bool)

(assert (=> mapIsEmpty!4479 mapRes!4479))

(declare-fun b!124420 () Bool)

(declare-fun e!81365 () Bool)

(declare-fun e!81364 () Bool)

(assert (=> b!124420 (= e!81365 e!81364)))

(declare-fun mapNonEmpty!4479 () Bool)

(declare-fun tp!10922 () Bool)

(declare-fun e!81361 () Bool)

(assert (=> mapNonEmpty!4479 (= mapRes!4479 (and tp!10922 e!81361))))

(declare-datatypes ((V!3429 0))(
  ( (V!3430 (val!1463 Int)) )
))
(declare-datatypes ((ValueCell!1075 0))(
  ( (ValueCellFull!1075 (v!3109 V!3429)) (EmptyCell!1075) )
))
(declare-fun mapRest!4479 () (Array (_ BitVec 32) ValueCell!1075))

(declare-datatypes ((array!4689 0))(
  ( (array!4690 (arr!2221 (Array (_ BitVec 32) (_ BitVec 64))) (size!2484 (_ BitVec 32))) )
))
(declare-datatypes ((array!4691 0))(
  ( (array!4692 (arr!2222 (Array (_ BitVec 32) ValueCell!1075)) (size!2485 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1058 0))(
  ( (LongMapFixedSize!1059 (defaultEntry!2765 Int) (mask!7011 (_ BitVec 32)) (extraKeys!2550 (_ BitVec 32)) (zeroValue!2630 V!3429) (minValue!2630 V!3429) (_size!578 (_ BitVec 32)) (_keys!4494 array!4689) (_values!2748 array!4691) (_vacant!578 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!852 0))(
  ( (Cell!853 (v!3110 LongMapFixedSize!1058)) )
))
(declare-datatypes ((LongMap!852 0))(
  ( (LongMap!853 (underlying!437 Cell!852)) )
))
(declare-fun thiss!992 () LongMap!852)

(declare-fun mapKey!4479 () (_ BitVec 32))

(declare-fun mapValue!4480 () ValueCell!1075)

(assert (=> mapNonEmpty!4479 (= (arr!2222 (_values!2748 (v!3110 (underlying!437 thiss!992)))) (store mapRest!4479 mapKey!4479 mapValue!4480))))

(declare-fun b!124421 () Bool)

(declare-fun e!81358 () Bool)

(declare-fun e!81351 () Bool)

(assert (=> b!124421 (= e!81358 (and e!81351 mapRes!4479))))

(declare-fun condMapEmpty!4480 () Bool)

(declare-fun mapDefault!4480 () ValueCell!1075)

