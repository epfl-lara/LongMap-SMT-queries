; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77900 () Bool)

(assert start!77900)

(declare-fun b_free!16459 () Bool)

(declare-fun b_next!16459 () Bool)

(assert (=> start!77900 (= b_free!16459 (not b_next!16459))))

(declare-fun tp!57642 () Bool)

(declare-fun b_and!27027 () Bool)

(assert (=> start!77900 (= tp!57642 b_and!27027)))

(declare-fun b!909584 () Bool)

(declare-fun e!509883 () Bool)

(declare-fun tp_is_empty!18877 () Bool)

(assert (=> b!909584 (= e!509883 tp_is_empty!18877)))

(declare-fun b!909585 () Bool)

(declare-fun e!509882 () Bool)

(assert (=> b!909585 (= e!509882 tp_is_empty!18877)))

(declare-fun mapNonEmpty!30031 () Bool)

(declare-fun mapRes!30031 () Bool)

(declare-fun tp!57641 () Bool)

(assert (=> mapNonEmpty!30031 (= mapRes!30031 (and tp!57641 e!509882))))

(declare-datatypes ((V!30135 0))(
  ( (V!30136 (val!9489 Int)) )
))
(declare-datatypes ((ValueCell!8957 0))(
  ( (ValueCellFull!8957 (v!11996 V!30135)) (EmptyCell!8957) )
))
(declare-datatypes ((array!53778 0))(
  ( (array!53779 (arr!25847 (Array (_ BitVec 32) ValueCell!8957)) (size!26306 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53778)

(declare-fun mapValue!30031 () ValueCell!8957)

(declare-fun mapRest!30031 () (Array (_ BitVec 32) ValueCell!8957))

(declare-fun mapKey!30031 () (_ BitVec 32))

(assert (=> mapNonEmpty!30031 (= (arr!25847 _values!1152) (store mapRest!30031 mapKey!30031 mapValue!30031))))

(declare-fun b!909586 () Bool)

(declare-fun e!509884 () Bool)

(assert (=> b!909586 (= e!509884 (and e!509883 mapRes!30031))))

(declare-fun condMapEmpty!30031 () Bool)

(declare-fun mapDefault!30031 () ValueCell!8957)

