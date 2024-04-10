; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77820 () Bool)

(assert start!77820)

(declare-fun b_free!16379 () Bool)

(declare-fun b_next!16379 () Bool)

(assert (=> start!77820 (= b_free!16379 (not b_next!16379))))

(declare-fun tp!57401 () Bool)

(declare-fun b_and!26915 () Bool)

(assert (=> start!77820 (= tp!57401 b_and!26915)))

(declare-fun b!908432 () Bool)

(declare-fun res!613135 () Bool)

(declare-fun e!509149 () Bool)

(assert (=> b!908432 (=> (not res!613135) (not e!509149))))

(declare-datatypes ((array!53628 0))(
  ( (array!53629 (arr!25772 (Array (_ BitVec 32) (_ BitVec 64))) (size!26231 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53628)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53628 (_ BitVec 32)) Bool)

(assert (=> b!908432 (= res!613135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908433 () Bool)

(declare-fun res!613140 () Bool)

(assert (=> b!908433 (=> (not res!613140) (not e!509149))))

(declare-datatypes ((V!30027 0))(
  ( (V!30028 (val!9449 Int)) )
))
(declare-datatypes ((ValueCell!8917 0))(
  ( (ValueCellFull!8917 (v!11956 V!30027)) (EmptyCell!8917) )
))
(declare-datatypes ((array!53630 0))(
  ( (array!53631 (arr!25773 (Array (_ BitVec 32) ValueCell!8917)) (size!26232 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53630)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!908433 (= res!613140 (and (= (size!26232 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26231 _keys!1386) (size!26232 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908434 () Bool)

(declare-fun e!509145 () Bool)

(declare-fun tp_is_empty!18797 () Bool)

(assert (=> b!908434 (= e!509145 tp_is_empty!18797)))

(declare-fun b!908435 () Bool)

(declare-fun e!509146 () Bool)

(assert (=> b!908435 (= e!509149 e!509146)))

(declare-fun res!613139 () Bool)

(assert (=> b!908435 (=> (not res!613139) (not e!509146))))

(declare-datatypes ((tuple2!12312 0))(
  ( (tuple2!12313 (_1!6167 (_ BitVec 64)) (_2!6167 V!30027)) )
))
(declare-datatypes ((List!18109 0))(
  ( (Nil!18106) (Cons!18105 (h!19251 tuple2!12312) (t!25660 List!18109)) )
))
(declare-datatypes ((ListLongMap!11009 0))(
  ( (ListLongMap!11010 (toList!5520 List!18109)) )
))
(declare-fun lt!409715 () ListLongMap!11009)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4563 (ListLongMap!11009 (_ BitVec 64)) Bool)

(assert (=> b!908435 (= res!613139 (contains!4563 lt!409715 k!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30027)

(declare-fun minValue!1094 () V!30027)

(declare-fun getCurrentListMap!2783 (array!53628 array!53630 (_ BitVec 32) (_ BitVec 32) V!30027 V!30027 (_ BitVec 32) Int) ListLongMap!11009)

(assert (=> b!908435 (= lt!409715 (getCurrentListMap!2783 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapNonEmpty!29911 () Bool)

(declare-fun mapRes!29911 () Bool)

(declare-fun tp!57402 () Bool)

(assert (=> mapNonEmpty!29911 (= mapRes!29911 (and tp!57402 e!509145))))

(declare-fun mapRest!29911 () (Array (_ BitVec 32) ValueCell!8917))

(declare-fun mapKey!29911 () (_ BitVec 32))

(declare-fun mapValue!29911 () ValueCell!8917)

(assert (=> mapNonEmpty!29911 (= (arr!25773 _values!1152) (store mapRest!29911 mapKey!29911 mapValue!29911))))

(declare-fun b!908436 () Bool)

(declare-fun e!509150 () Bool)

(declare-fun e!509151 () Bool)

(assert (=> b!908436 (= e!509150 (and e!509151 mapRes!29911))))

(declare-fun condMapEmpty!29911 () Bool)

(declare-fun mapDefault!29911 () ValueCell!8917)

