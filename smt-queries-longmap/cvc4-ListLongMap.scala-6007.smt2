; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77898 () Bool)

(assert start!77898)

(declare-fun b_free!16457 () Bool)

(declare-fun b_next!16457 () Bool)

(assert (=> start!77898 (= b_free!16457 (not b_next!16457))))

(declare-fun tp!57635 () Bool)

(declare-fun b_and!27025 () Bool)

(assert (=> start!77898 (= tp!57635 b_and!27025)))

(declare-fun res!613881 () Bool)

(declare-fun e!509871 () Bool)

(assert (=> start!77898 (=> (not res!613881) (not e!509871))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77898 (= res!613881 (validMask!0 mask!1756))))

(assert (=> start!77898 e!509871))

(declare-datatypes ((V!30131 0))(
  ( (V!30132 (val!9488 Int)) )
))
(declare-datatypes ((ValueCell!8956 0))(
  ( (ValueCellFull!8956 (v!11995 V!30131)) (EmptyCell!8956) )
))
(declare-datatypes ((array!53774 0))(
  ( (array!53775 (arr!25845 (Array (_ BitVec 32) ValueCell!8956)) (size!26304 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53774)

(declare-fun e!509868 () Bool)

(declare-fun array_inv!20218 (array!53774) Bool)

(assert (=> start!77898 (and (array_inv!20218 _values!1152) e!509868)))

(assert (=> start!77898 tp!57635))

(assert (=> start!77898 true))

(declare-fun tp_is_empty!18875 () Bool)

(assert (=> start!77898 tp_is_empty!18875))

(declare-datatypes ((array!53776 0))(
  ( (array!53777 (arr!25846 (Array (_ BitVec 32) (_ BitVec 64))) (size!26305 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53776)

(declare-fun array_inv!20219 (array!53776) Bool)

(assert (=> start!77898 (array_inv!20219 _keys!1386)))

(declare-fun b!909559 () Bool)

(declare-fun res!613880 () Bool)

(assert (=> b!909559 (=> (not res!613880) (not e!509871))))

(declare-datatypes ((List!18157 0))(
  ( (Nil!18154) (Cons!18153 (h!19299 (_ BitVec 64)) (t!25738 List!18157)) )
))
(declare-fun arrayNoDuplicates!0 (array!53776 (_ BitVec 32) List!18157) Bool)

(assert (=> b!909559 (= res!613880 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18154))))

(declare-fun b!909560 () Bool)

(declare-fun e!509867 () Bool)

(assert (=> b!909560 (= e!509867 tp_is_empty!18875)))

(declare-fun b!909561 () Bool)

(declare-fun e!509870 () Bool)

(assert (=> b!909561 (= e!509870 tp_is_empty!18875)))

(declare-fun mapNonEmpty!30028 () Bool)

(declare-fun mapRes!30028 () Bool)

(declare-fun tp!57636 () Bool)

(assert (=> mapNonEmpty!30028 (= mapRes!30028 (and tp!57636 e!509867))))

(declare-fun mapRest!30028 () (Array (_ BitVec 32) ValueCell!8956))

(declare-fun mapValue!30028 () ValueCell!8956)

(declare-fun mapKey!30028 () (_ BitVec 32))

(assert (=> mapNonEmpty!30028 (= (arr!25845 _values!1152) (store mapRest!30028 mapKey!30028 mapValue!30028))))

(declare-fun b!909562 () Bool)

(declare-fun res!613879 () Bool)

(assert (=> b!909562 (=> (not res!613879) (not e!509871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53776 (_ BitVec 32)) Bool)

(assert (=> b!909562 (= res!613879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30028 () Bool)

(assert (=> mapIsEmpty!30028 mapRes!30028))

(declare-fun b!909563 () Bool)

(assert (=> b!909563 (= e!509868 (and e!509870 mapRes!30028))))

(declare-fun condMapEmpty!30028 () Bool)

(declare-fun mapDefault!30028 () ValueCell!8956)

