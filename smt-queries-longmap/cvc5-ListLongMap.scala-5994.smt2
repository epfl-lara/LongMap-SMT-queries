; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77816 () Bool)

(assert start!77816)

(declare-fun b_free!16375 () Bool)

(declare-fun b_next!16375 () Bool)

(assert (=> start!77816 (= b_free!16375 (not b_next!16375))))

(declare-fun tp!57390 () Bool)

(declare-fun b_and!26907 () Bool)

(assert (=> start!77816 (= tp!57390 b_and!26907)))

(declare-fun b!908350 () Bool)

(declare-fun e!509098 () Bool)

(declare-fun e!509096 () Bool)

(assert (=> b!908350 (= e!509098 e!509096)))

(declare-fun res!613080 () Bool)

(assert (=> b!908350 (=> res!613080 e!509096)))

(declare-datatypes ((V!30023 0))(
  ( (V!30024 (val!9447 Int)) )
))
(declare-datatypes ((tuple2!12308 0))(
  ( (tuple2!12309 (_1!6165 (_ BitVec 64)) (_2!6165 V!30023)) )
))
(declare-datatypes ((List!18106 0))(
  ( (Nil!18103) (Cons!18102 (h!19248 tuple2!12308) (t!25653 List!18106)) )
))
(declare-datatypes ((ListLongMap!11005 0))(
  ( (ListLongMap!11006 (toList!5518 List!18106)) )
))
(declare-fun lt!409682 () ListLongMap!11005)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4561 (ListLongMap!11005 (_ BitVec 64)) Bool)

(assert (=> b!908350 (= res!613080 (not (contains!4561 lt!409682 k!1033)))))

(declare-datatypes ((ValueCell!8915 0))(
  ( (ValueCellFull!8915 (v!11954 V!30023)) (EmptyCell!8915) )
))
(declare-datatypes ((array!53620 0))(
  ( (array!53621 (arr!25768 (Array (_ BitVec 32) ValueCell!8915)) (size!26227 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53620)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30023)

(declare-datatypes ((array!53622 0))(
  ( (array!53623 (arr!25769 (Array (_ BitVec 32) (_ BitVec 64))) (size!26228 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53622)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30023)

(declare-fun getCurrentListMap!2781 (array!53622 array!53620 (_ BitVec 32) (_ BitVec 32) V!30023 V!30023 (_ BitVec 32) Int) ListLongMap!11005)

(assert (=> b!908350 (= lt!409682 (getCurrentListMap!2781 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29905 () Bool)

(declare-fun mapRes!29905 () Bool)

(declare-fun tp!57389 () Bool)

(declare-fun e!509101 () Bool)

(assert (=> mapNonEmpty!29905 (= mapRes!29905 (and tp!57389 e!509101))))

(declare-fun mapValue!29905 () ValueCell!8915)

(declare-fun mapKey!29905 () (_ BitVec 32))

(declare-fun mapRest!29905 () (Array (_ BitVec 32) ValueCell!8915))

(assert (=> mapNonEmpty!29905 (= (arr!25768 _values!1152) (store mapRest!29905 mapKey!29905 mapValue!29905))))

(declare-fun b!908351 () Bool)

(declare-fun e!509103 () Bool)

(declare-fun e!509097 () Bool)

(assert (=> b!908351 (= e!509103 (and e!509097 mapRes!29905))))

(declare-fun condMapEmpty!29905 () Bool)

(declare-fun mapDefault!29905 () ValueCell!8915)

