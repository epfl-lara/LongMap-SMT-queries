; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77864 () Bool)

(assert start!77864)

(declare-fun b_free!16423 () Bool)

(declare-fun b_next!16423 () Bool)

(assert (=> start!77864 (= b_free!16423 (not b_next!16423))))

(declare-fun tp!57533 () Bool)

(declare-fun b_and!26991 () Bool)

(assert (=> start!77864 (= tp!57533 b_and!26991)))

(declare-fun b!909202 () Bool)

(declare-fun e!509614 () Bool)

(declare-fun tp_is_empty!18841 () Bool)

(assert (=> b!909202 (= e!509614 tp_is_empty!18841)))

(declare-fun b!909203 () Bool)

(declare-fun res!613674 () Bool)

(declare-fun e!509615 () Bool)

(assert (=> b!909203 (=> (not res!613674) (not e!509615))))

(declare-datatypes ((V!30087 0))(
  ( (V!30088 (val!9471 Int)) )
))
(declare-datatypes ((ValueCell!8939 0))(
  ( (ValueCellFull!8939 (v!11978 V!30087)) (EmptyCell!8939) )
))
(declare-datatypes ((array!53710 0))(
  ( (array!53711 (arr!25813 (Array (_ BitVec 32) ValueCell!8939)) (size!26272 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53710)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53712 0))(
  ( (array!53713 (arr!25814 (Array (_ BitVec 32) (_ BitVec 64))) (size!26273 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53712)

(assert (=> b!909203 (= res!613674 (and (= (size!26272 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26273 _keys!1386) (size!26272 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909204 () Bool)

(declare-fun e!509616 () Bool)

(assert (=> b!909204 (= e!509616 tp_is_empty!18841)))

(declare-fun mapIsEmpty!29977 () Bool)

(declare-fun mapRes!29977 () Bool)

(assert (=> mapIsEmpty!29977 mapRes!29977))

(declare-fun mapNonEmpty!29977 () Bool)

(declare-fun tp!57534 () Bool)

(assert (=> mapNonEmpty!29977 (= mapRes!29977 (and tp!57534 e!509614))))

(declare-fun mapRest!29977 () (Array (_ BitVec 32) ValueCell!8939))

(declare-fun mapValue!29977 () ValueCell!8939)

(declare-fun mapKey!29977 () (_ BitVec 32))

(assert (=> mapNonEmpty!29977 (= (arr!25813 _values!1152) (store mapRest!29977 mapKey!29977 mapValue!29977))))

(declare-fun b!909205 () Bool)

(declare-fun res!613675 () Bool)

(assert (=> b!909205 (=> (not res!613675) (not e!509615))))

(declare-datatypes ((List!18138 0))(
  ( (Nil!18135) (Cons!18134 (h!19280 (_ BitVec 64)) (t!25719 List!18138)) )
))
(declare-fun arrayNoDuplicates!0 (array!53712 (_ BitVec 32) List!18138) Bool)

(assert (=> b!909205 (= res!613675 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18135))))

(declare-fun b!909207 () Bool)

(declare-fun e!509613 () Bool)

(assert (=> b!909207 (= e!509613 (and e!509616 mapRes!29977))))

(declare-fun condMapEmpty!29977 () Bool)

(declare-fun mapDefault!29977 () ValueCell!8939)

