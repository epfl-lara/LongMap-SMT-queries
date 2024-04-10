; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39418 () Bool)

(assert start!39418)

(declare-fun b_free!9685 () Bool)

(declare-fun b_next!9685 () Bool)

(assert (=> start!39418 (= b_free!9685 (not b_next!9685))))

(declare-fun tp!34584 () Bool)

(declare-fun b_and!17245 () Bool)

(assert (=> start!39418 (= tp!34584 b_and!17245)))

(declare-fun b!419495 () Bool)

(declare-fun res!244568 () Bool)

(declare-fun e!249997 () Bool)

(assert (=> b!419495 (=> (not res!244568) (not e!249997))))

(declare-datatypes ((array!25523 0))(
  ( (array!25524 (arr!12211 (Array (_ BitVec 32) (_ BitVec 64))) (size!12563 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25523)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25523 (_ BitVec 32)) Bool)

(assert (=> b!419495 (= res!244568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!419496 () Bool)

(declare-fun e!250004 () Bool)

(declare-fun tp_is_empty!10837 () Bool)

(assert (=> b!419496 (= e!250004 tp_is_empty!10837)))

(declare-fun mapNonEmpty!17877 () Bool)

(declare-fun mapRes!17877 () Bool)

(declare-fun tp!34583 () Bool)

(declare-fun e!249999 () Bool)

(assert (=> mapNonEmpty!17877 (= mapRes!17877 (and tp!34583 e!249999))))

(declare-fun mapKey!17877 () (_ BitVec 32))

(declare-datatypes ((V!15555 0))(
  ( (V!15556 (val!5463 Int)) )
))
(declare-datatypes ((ValueCell!5075 0))(
  ( (ValueCellFull!5075 (v!7710 V!15555)) (EmptyCell!5075) )
))
(declare-datatypes ((array!25525 0))(
  ( (array!25526 (arr!12212 (Array (_ BitVec 32) ValueCell!5075)) (size!12564 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25525)

(declare-fun mapRest!17877 () (Array (_ BitVec 32) ValueCell!5075))

(declare-fun mapValue!17877 () ValueCell!5075)

(assert (=> mapNonEmpty!17877 (= (arr!12212 _values!549) (store mapRest!17877 mapKey!17877 mapValue!17877))))

(declare-fun b!419497 () Bool)

(declare-fun e!250000 () Bool)

(assert (=> b!419497 (= e!250000 (and e!250004 mapRes!17877))))

(declare-fun condMapEmpty!17877 () Bool)

(declare-fun mapDefault!17877 () ValueCell!5075)

