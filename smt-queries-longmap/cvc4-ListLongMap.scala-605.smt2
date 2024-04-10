; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15792 () Bool)

(assert start!15792)

(declare-fun b!157502 () Bool)

(declare-fun b_free!3443 () Bool)

(declare-fun b_next!3443 () Bool)

(assert (=> b!157502 (= b_free!3443 (not b_next!3443))))

(declare-fun tp!12858 () Bool)

(declare-fun b_and!9857 () Bool)

(assert (=> b!157502 (= tp!12858 b_and!9857)))

(declare-fun b!157497 () Bool)

(declare-fun e!103140 () Bool)

(declare-fun tp_is_empty!3245 () Bool)

(assert (=> b!157497 (= e!103140 tp_is_empty!3245)))

(declare-fun b!157498 () Bool)

(declare-fun e!103141 () Bool)

(declare-fun mapRes!5514 () Bool)

(assert (=> b!157498 (= e!103141 (and e!103140 mapRes!5514))))

(declare-fun condMapEmpty!5514 () Bool)

(declare-datatypes ((V!3973 0))(
  ( (V!3974 (val!1667 Int)) )
))
(declare-datatypes ((ValueCell!1279 0))(
  ( (ValueCellFull!1279 (v!3532 V!3973)) (EmptyCell!1279) )
))
(declare-datatypes ((array!5545 0))(
  ( (array!5546 (arr!2629 (Array (_ BitVec 32) (_ BitVec 64))) (size!2908 (_ BitVec 32))) )
))
(declare-datatypes ((array!5547 0))(
  ( (array!5548 (arr!2630 (Array (_ BitVec 32) ValueCell!1279)) (size!2909 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1466 0))(
  ( (LongMapFixedSize!1467 (defaultEntry!3175 Int) (mask!7656 (_ BitVec 32)) (extraKeys!2916 (_ BitVec 32)) (zeroValue!3018 V!3973) (minValue!3018 V!3973) (_size!782 (_ BitVec 32)) (_keys!4951 array!5545) (_values!3158 array!5547) (_vacant!782 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1466)

(declare-fun mapDefault!5514 () ValueCell!1279)

