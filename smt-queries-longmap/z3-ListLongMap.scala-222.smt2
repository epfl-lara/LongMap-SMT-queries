; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4004 () Bool)

(assert start!4004)

(declare-fun b_free!919 () Bool)

(declare-fun b_next!919 () Bool)

(assert (=> start!4004 (= b_free!919 (not b_next!919))))

(declare-fun tp!4177 () Bool)

(declare-fun b_and!1723 () Bool)

(assert (=> start!4004 (= tp!4177 b_and!1723)))

(declare-fun b!29157 () Bool)

(declare-fun res!17462 () Bool)

(declare-fun e!18827 () Bool)

(assert (=> b!29157 (=> (not res!17462) (not e!18827))))

(declare-datatypes ((array!1753 0))(
  ( (array!1754 (arr!830 (Array (_ BitVec 32) (_ BitVec 64))) (size!931 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1753)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29157 (= res!17462 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!29158 () Bool)

(assert (=> b!29158 (= e!18827 (not true))))

(declare-datatypes ((SeekEntryResult!83 0))(
  ( (MissingZero!83 (index!2454 (_ BitVec 32))) (Found!83 (index!2455 (_ BitVec 32))) (Intermediate!83 (undefined!895 Bool) (index!2456 (_ BitVec 32)) (x!6401 (_ BitVec 32))) (Undefined!83) (MissingVacant!83 (index!2457 (_ BitVec 32))) )
))
(declare-fun lt!11140 () SeekEntryResult!83)

(declare-fun lt!11138 () (_ BitVec 32))

(get-info :version)

(assert (=> b!29158 (and ((_ is Found!83) lt!11140) (= (index!2455 lt!11140) lt!11138))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1753 (_ BitVec 32)) SeekEntryResult!83)

(assert (=> b!29158 (= lt!11140 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!676 0))(
  ( (Unit!677) )
))
(declare-fun lt!11137 () Unit!676)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1753 (_ BitVec 32)) Unit!676)

(assert (=> b!29158 (= lt!11137 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11138 _keys!1833 mask!2294))))

(declare-datatypes ((V!1523 0))(
  ( (V!1524 (val!663 Int)) )
))
(declare-datatypes ((tuple2!1108 0))(
  ( (tuple2!1109 (_1!565 (_ BitVec 64)) (_2!565 V!1523)) )
))
(declare-datatypes ((List!691 0))(
  ( (Nil!688) (Cons!687 (h!1254 tuple2!1108) (t!3377 List!691)) )
))
(declare-datatypes ((ListLongMap!673 0))(
  ( (ListLongMap!674 (toList!352 List!691)) )
))
(declare-fun lt!11136 () ListLongMap!673)

(declare-fun contains!293 (ListLongMap!673 (_ BitVec 64)) Bool)

(assert (=> b!29158 (contains!293 lt!11136 (select (arr!830 _keys!1833) lt!11138))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!437 0))(
  ( (ValueCellFull!437 (v!1751 V!1523)) (EmptyCell!437) )
))
(declare-datatypes ((array!1755 0))(
  ( (array!1756 (arr!831 (Array (_ BitVec 32) ValueCell!437)) (size!932 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1755)

(declare-fun lt!11139 () Unit!676)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1523)

(declare-fun minValue!1443 () V!1523)

(declare-fun lemmaValidKeyInArrayIsInListMap!28 (array!1753 array!1755 (_ BitVec 32) (_ BitVec 32) V!1523 V!1523 (_ BitVec 32) Int) Unit!676)

(assert (=> b!29158 (= lt!11139 (lemmaValidKeyInArrayIsInListMap!28 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11138 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1753 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!29158 (= lt!11138 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!17466 () Bool)

(declare-fun e!18824 () Bool)

(assert (=> start!4004 (=> (not res!17466) (not e!18824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4004 (= res!17466 (validMask!0 mask!2294))))

(assert (=> start!4004 e!18824))

(assert (=> start!4004 true))

(assert (=> start!4004 tp!4177))

(declare-fun e!18825 () Bool)

(declare-fun array_inv!581 (array!1755) Bool)

(assert (=> start!4004 (and (array_inv!581 _values!1501) e!18825)))

(declare-fun array_inv!582 (array!1753) Bool)

(assert (=> start!4004 (array_inv!582 _keys!1833)))

(declare-fun tp_is_empty!1273 () Bool)

(assert (=> start!4004 tp_is_empty!1273))

(declare-fun b!29159 () Bool)

(declare-fun e!18826 () Bool)

(assert (=> b!29159 (= e!18826 tp_is_empty!1273)))

(declare-fun b!29160 () Bool)

(declare-fun res!17465 () Bool)

(assert (=> b!29160 (=> (not res!17465) (not e!18824))))

(declare-datatypes ((List!692 0))(
  ( (Nil!689) (Cons!688 (h!1255 (_ BitVec 64)) (t!3378 List!692)) )
))
(declare-fun arrayNoDuplicates!0 (array!1753 (_ BitVec 32) List!692) Bool)

(assert (=> b!29160 (= res!17465 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!689))))

(declare-fun b!29161 () Bool)

(declare-fun res!17463 () Bool)

(assert (=> b!29161 (=> (not res!17463) (not e!18824))))

(assert (=> b!29161 (= res!17463 (and (= (size!932 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!931 _keys!1833) (size!932 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29162 () Bool)

(declare-fun mapRes!1438 () Bool)

(assert (=> b!29162 (= e!18825 (and e!18826 mapRes!1438))))

(declare-fun condMapEmpty!1438 () Bool)

(declare-fun mapDefault!1438 () ValueCell!437)

(assert (=> b!29162 (= condMapEmpty!1438 (= (arr!831 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!437)) mapDefault!1438)))))

(declare-fun b!29163 () Bool)

(assert (=> b!29163 (= e!18824 e!18827)))

(declare-fun res!17461 () Bool)

(assert (=> b!29163 (=> (not res!17461) (not e!18827))))

(assert (=> b!29163 (= res!17461 (not (contains!293 lt!11136 k0!1304)))))

(declare-fun getCurrentListMap!180 (array!1753 array!1755 (_ BitVec 32) (_ BitVec 32) V!1523 V!1523 (_ BitVec 32) Int) ListLongMap!673)

(assert (=> b!29163 (= lt!11136 (getCurrentListMap!180 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!29164 () Bool)

(declare-fun res!17464 () Bool)

(assert (=> b!29164 (=> (not res!17464) (not e!18824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1753 (_ BitVec 32)) Bool)

(assert (=> b!29164 (= res!17464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29165 () Bool)

(declare-fun res!17467 () Bool)

(assert (=> b!29165 (=> (not res!17467) (not e!18824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29165 (= res!17467 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1438 () Bool)

(declare-fun tp!4176 () Bool)

(declare-fun e!18829 () Bool)

(assert (=> mapNonEmpty!1438 (= mapRes!1438 (and tp!4176 e!18829))))

(declare-fun mapValue!1438 () ValueCell!437)

(declare-fun mapRest!1438 () (Array (_ BitVec 32) ValueCell!437))

(declare-fun mapKey!1438 () (_ BitVec 32))

(assert (=> mapNonEmpty!1438 (= (arr!831 _values!1501) (store mapRest!1438 mapKey!1438 mapValue!1438))))

(declare-fun mapIsEmpty!1438 () Bool)

(assert (=> mapIsEmpty!1438 mapRes!1438))

(declare-fun b!29166 () Bool)

(assert (=> b!29166 (= e!18829 tp_is_empty!1273)))

(assert (= (and start!4004 res!17466) b!29161))

(assert (= (and b!29161 res!17463) b!29164))

(assert (= (and b!29164 res!17464) b!29160))

(assert (= (and b!29160 res!17465) b!29165))

(assert (= (and b!29165 res!17467) b!29163))

(assert (= (and b!29163 res!17461) b!29157))

(assert (= (and b!29157 res!17462) b!29158))

(assert (= (and b!29162 condMapEmpty!1438) mapIsEmpty!1438))

(assert (= (and b!29162 (not condMapEmpty!1438)) mapNonEmpty!1438))

(assert (= (and mapNonEmpty!1438 ((_ is ValueCellFull!437) mapValue!1438)) b!29166))

(assert (= (and b!29162 ((_ is ValueCellFull!437) mapDefault!1438)) b!29159))

(assert (= start!4004 b!29162))

(declare-fun m!23331 () Bool)

(assert (=> b!29160 m!23331))

(declare-fun m!23333 () Bool)

(assert (=> b!29157 m!23333))

(declare-fun m!23335 () Bool)

(assert (=> b!29163 m!23335))

(declare-fun m!23337 () Bool)

(assert (=> b!29163 m!23337))

(declare-fun m!23339 () Bool)

(assert (=> mapNonEmpty!1438 m!23339))

(declare-fun m!23341 () Bool)

(assert (=> start!4004 m!23341))

(declare-fun m!23343 () Bool)

(assert (=> start!4004 m!23343))

(declare-fun m!23345 () Bool)

(assert (=> start!4004 m!23345))

(declare-fun m!23347 () Bool)

(assert (=> b!29164 m!23347))

(declare-fun m!23349 () Bool)

(assert (=> b!29158 m!23349))

(declare-fun m!23351 () Bool)

(assert (=> b!29158 m!23351))

(declare-fun m!23353 () Bool)

(assert (=> b!29158 m!23353))

(declare-fun m!23355 () Bool)

(assert (=> b!29158 m!23355))

(declare-fun m!23357 () Bool)

(assert (=> b!29158 m!23357))

(assert (=> b!29158 m!23349))

(declare-fun m!23359 () Bool)

(assert (=> b!29158 m!23359))

(declare-fun m!23361 () Bool)

(assert (=> b!29165 m!23361))

(check-sat (not start!4004) (not b!29158) (not b!29157) (not b!29164) (not mapNonEmpty!1438) (not b!29163) (not b!29160) b_and!1723 (not b_next!919) (not b!29165) tp_is_empty!1273)
(check-sat b_and!1723 (not b_next!919))
