; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78140 () Bool)

(assert start!78140)

(declare-fun b_free!16651 () Bool)

(declare-fun b_next!16651 () Bool)

(assert (=> start!78140 (= b_free!16651 (not b_next!16651))))

(declare-fun tp!58226 () Bool)

(declare-fun b_and!27225 () Bool)

(assert (=> start!78140 (= tp!58226 b_and!27225)))

(declare-fun b!911977 () Bool)

(declare-fun e!511542 () Bool)

(declare-fun tp_is_empty!19069 () Bool)

(assert (=> b!911977 (= e!511542 tp_is_empty!19069)))

(declare-fun b!911978 () Bool)

(declare-fun e!511539 () Bool)

(assert (=> b!911978 (= e!511539 false)))

(declare-datatypes ((V!30391 0))(
  ( (V!30392 (val!9585 Int)) )
))
(declare-datatypes ((ValueCell!9053 0))(
  ( (ValueCellFull!9053 (v!12095 V!30391)) (EmptyCell!9053) )
))
(declare-datatypes ((array!54138 0))(
  ( (array!54139 (arr!26024 (Array (_ BitVec 32) ValueCell!9053)) (size!26483 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54138)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30391)

(declare-datatypes ((array!54140 0))(
  ( (array!54141 (arr!26025 (Array (_ BitVec 32) (_ BitVec 64))) (size!26484 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54140)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30391)

(declare-fun lt!410537 () Bool)

(declare-datatypes ((tuple2!12488 0))(
  ( (tuple2!12489 (_1!6255 (_ BitVec 64)) (_2!6255 V!30391)) )
))
(declare-datatypes ((List!18279 0))(
  ( (Nil!18276) (Cons!18275 (h!19421 tuple2!12488) (t!25866 List!18279)) )
))
(declare-datatypes ((ListLongMap!11185 0))(
  ( (ListLongMap!11186 (toList!5608 List!18279)) )
))
(declare-fun contains!4653 (ListLongMap!11185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2870 (array!54140 array!54138 (_ BitVec 32) (_ BitVec 32) V!30391 V!30391 (_ BitVec 32) Int) ListLongMap!11185)

(assert (=> b!911978 (= lt!410537 (contains!4653 (getCurrentListMap!2870 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!911979 () Bool)

(declare-fun res!615233 () Bool)

(assert (=> b!911979 (=> (not res!615233) (not e!511539))))

(assert (=> b!911979 (= res!615233 (and (= (size!26483 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26484 _keys!1386) (size!26483 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30328 () Bool)

(declare-fun mapRes!30328 () Bool)

(declare-fun tp!58227 () Bool)

(declare-fun e!511540 () Bool)

(assert (=> mapNonEmpty!30328 (= mapRes!30328 (and tp!58227 e!511540))))

(declare-fun mapRest!30328 () (Array (_ BitVec 32) ValueCell!9053))

(declare-fun mapValue!30328 () ValueCell!9053)

(declare-fun mapKey!30328 () (_ BitVec 32))

(assert (=> mapNonEmpty!30328 (= (arr!26024 _values!1152) (store mapRest!30328 mapKey!30328 mapValue!30328))))

(declare-fun mapIsEmpty!30328 () Bool)

(assert (=> mapIsEmpty!30328 mapRes!30328))

(declare-fun b!911980 () Bool)

(declare-fun e!511538 () Bool)

(assert (=> b!911980 (= e!511538 (and e!511542 mapRes!30328))))

(declare-fun condMapEmpty!30328 () Bool)

(declare-fun mapDefault!30328 () ValueCell!9053)

