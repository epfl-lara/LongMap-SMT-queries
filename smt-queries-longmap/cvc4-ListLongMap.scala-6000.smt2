; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77856 () Bool)

(assert start!77856)

(declare-fun b_free!16415 () Bool)

(declare-fun b_next!16415 () Bool)

(assert (=> start!77856 (= b_free!16415 (not b_next!16415))))

(declare-fun tp!57510 () Bool)

(declare-fun b_and!26983 () Bool)

(assert (=> start!77856 (= tp!57510 b_and!26983)))

(declare-fun b!909118 () Bool)

(declare-fun res!613629 () Bool)

(declare-fun e!509552 () Bool)

(assert (=> b!909118 (=> (not res!613629) (not e!509552))))

(declare-datatypes ((array!53694 0))(
  ( (array!53695 (arr!25805 (Array (_ BitVec 32) (_ BitVec 64))) (size!26264 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53694)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53694 (_ BitVec 32)) Bool)

(assert (=> b!909118 (= res!613629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29965 () Bool)

(declare-fun mapRes!29965 () Bool)

(declare-fun tp!57509 () Bool)

(declare-fun e!509553 () Bool)

(assert (=> mapNonEmpty!29965 (= mapRes!29965 (and tp!57509 e!509553))))

(declare-datatypes ((V!30075 0))(
  ( (V!30076 (val!9467 Int)) )
))
(declare-datatypes ((ValueCell!8935 0))(
  ( (ValueCellFull!8935 (v!11974 V!30075)) (EmptyCell!8935) )
))
(declare-datatypes ((array!53696 0))(
  ( (array!53697 (arr!25806 (Array (_ BitVec 32) ValueCell!8935)) (size!26265 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53696)

(declare-fun mapValue!29965 () ValueCell!8935)

(declare-fun mapRest!29965 () (Array (_ BitVec 32) ValueCell!8935))

(declare-fun mapKey!29965 () (_ BitVec 32))

(assert (=> mapNonEmpty!29965 (= (arr!25806 _values!1152) (store mapRest!29965 mapKey!29965 mapValue!29965))))

(declare-fun b!909119 () Bool)

(declare-fun tp_is_empty!18833 () Bool)

(assert (=> b!909119 (= e!509553 tp_is_empty!18833)))

(declare-fun b!909120 () Bool)

(assert (=> b!909120 (= e!509552 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30075)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30075)

(declare-fun lt!409949 () Bool)

(declare-fun k!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12340 0))(
  ( (tuple2!12341 (_1!6181 (_ BitVec 64)) (_2!6181 V!30075)) )
))
(declare-datatypes ((List!18132 0))(
  ( (Nil!18129) (Cons!18128 (h!19274 tuple2!12340) (t!25713 List!18132)) )
))
(declare-datatypes ((ListLongMap!11037 0))(
  ( (ListLongMap!11038 (toList!5534 List!18132)) )
))
(declare-fun contains!4576 (ListLongMap!11037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2796 (array!53694 array!53696 (_ BitVec 32) (_ BitVec 32) V!30075 V!30075 (_ BitVec 32) Int) ListLongMap!11037)

(assert (=> b!909120 (= lt!409949 (contains!4576 (getCurrentListMap!2796 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909121 () Bool)

(declare-fun res!613627 () Bool)

(assert (=> b!909121 (=> (not res!613627) (not e!509552))))

(declare-datatypes ((List!18133 0))(
  ( (Nil!18130) (Cons!18129 (h!19275 (_ BitVec 64)) (t!25714 List!18133)) )
))
(declare-fun arrayNoDuplicates!0 (array!53694 (_ BitVec 32) List!18133) Bool)

(assert (=> b!909121 (= res!613627 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18130))))

(declare-fun b!909122 () Bool)

(declare-fun e!509556 () Bool)

(declare-fun e!509554 () Bool)

(assert (=> b!909122 (= e!509556 (and e!509554 mapRes!29965))))

(declare-fun condMapEmpty!29965 () Bool)

(declare-fun mapDefault!29965 () ValueCell!8935)

