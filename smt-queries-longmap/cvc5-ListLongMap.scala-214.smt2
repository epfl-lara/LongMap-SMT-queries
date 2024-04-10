; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3966 () Bool)

(assert start!3966)

(declare-fun b_free!871 () Bool)

(declare-fun b_next!871 () Bool)

(assert (=> start!3966 (= b_free!871 (not b_next!871))))

(declare-fun tp!4032 () Bool)

(declare-fun b_and!1681 () Bool)

(assert (=> start!3966 (= tp!4032 b_and!1681)))

(declare-fun b!28457 () Bool)

(declare-fun res!16956 () Bool)

(declare-fun e!18404 () Bool)

(assert (=> b!28457 (=> (not res!16956) (not e!18404))))

(declare-datatypes ((array!1685 0))(
  ( (array!1686 (arr!796 (Array (_ BitVec 32) (_ BitVec 64))) (size!897 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1685)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1685 (_ BitVec 32)) Bool)

(assert (=> b!28457 (= res!16956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1366 () Bool)

(declare-fun mapRes!1366 () Bool)

(assert (=> mapIsEmpty!1366 mapRes!1366))

(declare-fun mapNonEmpty!1366 () Bool)

(declare-fun tp!4033 () Bool)

(declare-fun e!18402 () Bool)

(assert (=> mapNonEmpty!1366 (= mapRes!1366 (and tp!4033 e!18402))))

(declare-datatypes ((V!1459 0))(
  ( (V!1460 (val!639 Int)) )
))
(declare-datatypes ((ValueCell!413 0))(
  ( (ValueCellFull!413 (v!1728 V!1459)) (EmptyCell!413) )
))
(declare-fun mapValue!1366 () ValueCell!413)

(declare-fun mapRest!1366 () (Array (_ BitVec 32) ValueCell!413))

(declare-fun mapKey!1366 () (_ BitVec 32))

(declare-datatypes ((array!1687 0))(
  ( (array!1688 (arr!797 (Array (_ BitVec 32) ValueCell!413)) (size!898 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1687)

(assert (=> mapNonEmpty!1366 (= (arr!797 _values!1501) (store mapRest!1366 mapKey!1366 mapValue!1366))))

(declare-fun b!28458 () Bool)

(declare-fun e!18406 () Bool)

(declare-fun tp_is_empty!1225 () Bool)

(assert (=> b!28458 (= e!18406 tp_is_empty!1225)))

(declare-fun b!28459 () Bool)

(declare-fun res!16961 () Bool)

(assert (=> b!28459 (=> (not res!16961) (not e!18404))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28459 (= res!16961 (validKeyInArray!0 k!1304))))

(declare-fun b!28460 () Bool)

(declare-fun e!18405 () Bool)

(assert (=> b!28460 (= e!18404 e!18405)))

(declare-fun res!16959 () Bool)

(assert (=> b!28460 (=> (not res!16959) (not e!18405))))

(declare-datatypes ((tuple2!1062 0))(
  ( (tuple2!1063 (_1!542 (_ BitVec 64)) (_2!542 V!1459)) )
))
(declare-datatypes ((List!662 0))(
  ( (Nil!659) (Cons!658 (h!1225 tuple2!1062) (t!3355 List!662)) )
))
(declare-datatypes ((ListLongMap!639 0))(
  ( (ListLongMap!640 (toList!335 List!662)) )
))
(declare-fun lt!10814 () ListLongMap!639)

(declare-fun contains!275 (ListLongMap!639 (_ BitVec 64)) Bool)

(assert (=> b!28460 (= res!16959 (not (contains!275 lt!10814 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1459)

(declare-fun minValue!1443 () V!1459)

(declare-fun getCurrentListMap!165 (array!1685 array!1687 (_ BitVec 32) (_ BitVec 32) V!1459 V!1459 (_ BitVec 32) Int) ListLongMap!639)

(assert (=> b!28460 (= lt!10814 (getCurrentListMap!165 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28461 () Bool)

(declare-fun res!16962 () Bool)

(assert (=> b!28461 (=> (not res!16962) (not e!18404))))

(assert (=> b!28461 (= res!16962 (and (= (size!898 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!897 _keys!1833) (size!898 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!16955 () Bool)

(assert (=> start!3966 (=> (not res!16955) (not e!18404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3966 (= res!16955 (validMask!0 mask!2294))))

(assert (=> start!3966 e!18404))

(assert (=> start!3966 true))

(assert (=> start!3966 tp!4032))

(declare-fun e!18401 () Bool)

(declare-fun array_inv!545 (array!1687) Bool)

(assert (=> start!3966 (and (array_inv!545 _values!1501) e!18401)))

(declare-fun array_inv!546 (array!1685) Bool)

(assert (=> start!3966 (array_inv!546 _keys!1833)))

(assert (=> start!3966 tp_is_empty!1225))

(declare-fun b!28462 () Bool)

(declare-fun res!16958 () Bool)

(assert (=> b!28462 (=> (not res!16958) (not e!18405))))

(declare-fun arrayContainsKey!0 (array!1685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28462 (= res!16958 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28463 () Bool)

(assert (=> b!28463 (= e!18401 (and e!18406 mapRes!1366))))

(declare-fun condMapEmpty!1366 () Bool)

(declare-fun mapDefault!1366 () ValueCell!413)

