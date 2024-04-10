; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75720 () Bool)

(assert start!75720)

(declare-fun b!890276 () Bool)

(declare-fun b_free!15691 () Bool)

(declare-fun b_next!15691 () Bool)

(assert (=> b!890276 (= b_free!15691 (not b_next!15691))))

(declare-fun tp!55042 () Bool)

(declare-fun b_and!25931 () Bool)

(assert (=> b!890276 (= tp!55042 b_and!25931)))

(declare-fun b!890267 () Bool)

(declare-fun e!496493 () Bool)

(declare-fun tp_is_empty!18019 () Bool)

(assert (=> b!890267 (= e!496493 tp_is_empty!18019)))

(declare-fun mapIsEmpty!28583 () Bool)

(declare-fun mapRes!28583 () Bool)

(assert (=> mapIsEmpty!28583 mapRes!28583))

(declare-fun b!890268 () Bool)

(declare-fun e!496492 () Bool)

(declare-fun e!496494 () Bool)

(assert (=> b!890268 (= e!496492 (and e!496494 mapRes!28583))))

(declare-fun condMapEmpty!28583 () Bool)

(declare-datatypes ((array!52018 0))(
  ( (array!52019 (arr!25015 (Array (_ BitVec 32) (_ BitVec 64))) (size!25459 (_ BitVec 32))) )
))
(declare-datatypes ((V!28991 0))(
  ( (V!28992 (val!9060 Int)) )
))
(declare-datatypes ((ValueCell!8528 0))(
  ( (ValueCellFull!8528 (v!11538 V!28991)) (EmptyCell!8528) )
))
(declare-datatypes ((array!52020 0))(
  ( (array!52021 (arr!25016 (Array (_ BitVec 32) ValueCell!8528)) (size!25460 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4072 0))(
  ( (LongMapFixedSize!4073 (defaultEntry!5233 Int) (mask!25704 (_ BitVec 32)) (extraKeys!4927 (_ BitVec 32)) (zeroValue!5031 V!28991) (minValue!5031 V!28991) (_size!2091 (_ BitVec 32)) (_keys!9916 array!52018) (_values!5218 array!52020) (_vacant!2091 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4072)

(declare-fun mapDefault!28583 () ValueCell!8528)

