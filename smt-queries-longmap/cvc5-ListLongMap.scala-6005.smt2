; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77882 () Bool)

(assert start!77882)

(declare-fun b_free!16441 () Bool)

(declare-fun b_next!16441 () Bool)

(assert (=> start!77882 (= b_free!16441 (not b_next!16441))))

(declare-fun tp!57587 () Bool)

(declare-fun b_and!27009 () Bool)

(assert (=> start!77882 (= tp!57587 b_and!27009)))

(declare-fun b!909391 () Bool)

(declare-fun e!509749 () Bool)

(assert (=> b!909391 (= e!509749 false)))

(declare-datatypes ((V!30111 0))(
  ( (V!30112 (val!9480 Int)) )
))
(declare-datatypes ((ValueCell!8948 0))(
  ( (ValueCellFull!8948 (v!11987 V!30111)) (EmptyCell!8948) )
))
(declare-datatypes ((array!53744 0))(
  ( (array!53745 (arr!25830 (Array (_ BitVec 32) ValueCell!8948)) (size!26289 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53744)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!409988 () Bool)

(declare-fun zeroValue!1094 () V!30111)

(declare-datatypes ((array!53746 0))(
  ( (array!53747 (arr!25831 (Array (_ BitVec 32) (_ BitVec 64))) (size!26290 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53746)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30111)

(declare-datatypes ((tuple2!12358 0))(
  ( (tuple2!12359 (_1!6190 (_ BitVec 64)) (_2!6190 V!30111)) )
))
(declare-datatypes ((List!18150 0))(
  ( (Nil!18147) (Cons!18146 (h!19292 tuple2!12358) (t!25731 List!18150)) )
))
(declare-datatypes ((ListLongMap!11055 0))(
  ( (ListLongMap!11056 (toList!5543 List!18150)) )
))
(declare-fun contains!4585 (ListLongMap!11055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2805 (array!53746 array!53744 (_ BitVec 32) (_ BitVec 32) V!30111 V!30111 (_ BitVec 32) Int) ListLongMap!11055)

(assert (=> b!909391 (= lt!409988 (contains!4585 (getCurrentListMap!2805 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909392 () Bool)

(declare-fun e!509748 () Bool)

(declare-fun tp_is_empty!18859 () Bool)

(assert (=> b!909392 (= e!509748 tp_is_empty!18859)))

(declare-fun mapNonEmpty!30004 () Bool)

(declare-fun mapRes!30004 () Bool)

(declare-fun tp!57588 () Bool)

(assert (=> mapNonEmpty!30004 (= mapRes!30004 (and tp!57588 e!509748))))

(declare-fun mapKey!30004 () (_ BitVec 32))

(declare-fun mapValue!30004 () ValueCell!8948)

(declare-fun mapRest!30004 () (Array (_ BitVec 32) ValueCell!8948))

(assert (=> mapNonEmpty!30004 (= (arr!25830 _values!1152) (store mapRest!30004 mapKey!30004 mapValue!30004))))

(declare-fun b!909393 () Bool)

(declare-fun e!509751 () Bool)

(declare-fun e!509747 () Bool)

(assert (=> b!909393 (= e!509751 (and e!509747 mapRes!30004))))

(declare-fun condMapEmpty!30004 () Bool)

(declare-fun mapDefault!30004 () ValueCell!8948)

