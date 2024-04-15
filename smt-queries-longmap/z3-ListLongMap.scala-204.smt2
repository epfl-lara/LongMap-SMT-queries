; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3896 () Bool)

(assert start!3896)

(declare-fun b_free!811 () Bool)

(declare-fun b_next!811 () Bool)

(assert (=> start!3896 (= b_free!811 (not b_next!811))))

(declare-fun tp!3852 () Bool)

(declare-fun b_and!1615 () Bool)

(assert (=> start!3896 (= tp!3852 b_and!1615)))

(declare-fun mapNonEmpty!1276 () Bool)

(declare-fun mapRes!1276 () Bool)

(declare-fun tp!3853 () Bool)

(declare-fun e!17890 () Bool)

(assert (=> mapNonEmpty!1276 (= mapRes!1276 (and tp!3853 e!17890))))

(declare-datatypes ((V!1379 0))(
  ( (V!1380 (val!609 Int)) )
))
(declare-datatypes ((ValueCell!383 0))(
  ( (ValueCellFull!383 (v!1697 V!1379)) (EmptyCell!383) )
))
(declare-datatypes ((array!1545 0))(
  ( (array!1546 (arr!726 (Array (_ BitVec 32) ValueCell!383)) (size!827 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1545)

(declare-fun mapValue!1276 () ValueCell!383)

(declare-fun mapKey!1276 () (_ BitVec 32))

(declare-fun mapRest!1276 () (Array (_ BitVec 32) ValueCell!383))

(assert (=> mapNonEmpty!1276 (= (arr!726 _values!1501) (store mapRest!1276 mapKey!1276 mapValue!1276))))

(declare-fun b!27492 () Bool)

(declare-fun res!16284 () Bool)

(declare-fun e!17886 () Bool)

(assert (=> b!27492 (=> (not res!16284) (not e!17886))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1547 0))(
  ( (array!1548 (arr!727 (Array (_ BitVec 32) (_ BitVec 64))) (size!828 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1547)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!27492 (= res!16284 (and (= (size!827 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!828 _keys!1833) (size!827 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27493 () Bool)

(assert (=> b!27493 (= e!17886 false)))

(declare-fun lt!10687 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1547 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27493 (= lt!10687 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27494 () Bool)

(declare-fun e!17888 () Bool)

(declare-fun e!17889 () Bool)

(assert (=> b!27494 (= e!17888 (and e!17889 mapRes!1276))))

(declare-fun condMapEmpty!1276 () Bool)

(declare-fun mapDefault!1276 () ValueCell!383)

(assert (=> b!27494 (= condMapEmpty!1276 (= (arr!726 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!383)) mapDefault!1276)))))

(declare-fun b!27495 () Bool)

(declare-fun tp_is_empty!1165 () Bool)

(assert (=> b!27495 (= e!17889 tp_is_empty!1165)))

(declare-fun b!27496 () Bool)

(declare-fun res!16288 () Bool)

(assert (=> b!27496 (=> (not res!16288) (not e!17886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1547 (_ BitVec 32)) Bool)

(assert (=> b!27496 (= res!16288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27497 () Bool)

(declare-fun res!16282 () Bool)

(assert (=> b!27497 (=> (not res!16282) (not e!17886))))

(declare-datatypes ((List!617 0))(
  ( (Nil!614) (Cons!613 (h!1180 (_ BitVec 64)) (t!3303 List!617)) )
))
(declare-fun arrayNoDuplicates!0 (array!1547 (_ BitVec 32) List!617) Bool)

(assert (=> b!27497 (= res!16282 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!614))))

(declare-fun mapIsEmpty!1276 () Bool)

(assert (=> mapIsEmpty!1276 mapRes!1276))

(declare-fun b!27498 () Bool)

(declare-fun res!16285 () Bool)

(assert (=> b!27498 (=> (not res!16285) (not e!17886))))

(declare-fun arrayContainsKey!0 (array!1547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27498 (= res!16285 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27499 () Bool)

(declare-fun res!16286 () Bool)

(assert (=> b!27499 (=> (not res!16286) (not e!17886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27499 (= res!16286 (validKeyInArray!0 k0!1304))))

(declare-fun res!16283 () Bool)

(assert (=> start!3896 (=> (not res!16283) (not e!17886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3896 (= res!16283 (validMask!0 mask!2294))))

(assert (=> start!3896 e!17886))

(assert (=> start!3896 true))

(assert (=> start!3896 tp!3852))

(declare-fun array_inv!517 (array!1545) Bool)

(assert (=> start!3896 (and (array_inv!517 _values!1501) e!17888)))

(declare-fun array_inv!518 (array!1547) Bool)

(assert (=> start!3896 (array_inv!518 _keys!1833)))

(assert (=> start!3896 tp_is_empty!1165))

(declare-fun b!27500 () Bool)

(assert (=> b!27500 (= e!17890 tp_is_empty!1165)))

(declare-fun b!27501 () Bool)

(declare-fun res!16287 () Bool)

(assert (=> b!27501 (=> (not res!16287) (not e!17886))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1379)

(declare-fun minValue!1443 () V!1379)

(declare-datatypes ((tuple2!1032 0))(
  ( (tuple2!1033 (_1!527 (_ BitVec 64)) (_2!527 V!1379)) )
))
(declare-datatypes ((List!618 0))(
  ( (Nil!615) (Cons!614 (h!1181 tuple2!1032) (t!3304 List!618)) )
))
(declare-datatypes ((ListLongMap!597 0))(
  ( (ListLongMap!598 (toList!314 List!618)) )
))
(declare-fun contains!255 (ListLongMap!597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!144 (array!1547 array!1545 (_ BitVec 32) (_ BitVec 32) V!1379 V!1379 (_ BitVec 32) Int) ListLongMap!597)

(assert (=> b!27501 (= res!16287 (not (contains!255 (getCurrentListMap!144 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(assert (= (and start!3896 res!16283) b!27492))

(assert (= (and b!27492 res!16284) b!27496))

(assert (= (and b!27496 res!16288) b!27497))

(assert (= (and b!27497 res!16282) b!27499))

(assert (= (and b!27499 res!16286) b!27501))

(assert (= (and b!27501 res!16287) b!27498))

(assert (= (and b!27498 res!16285) b!27493))

(assert (= (and b!27494 condMapEmpty!1276) mapIsEmpty!1276))

(assert (= (and b!27494 (not condMapEmpty!1276)) mapNonEmpty!1276))

(get-info :version)

(assert (= (and mapNonEmpty!1276 ((_ is ValueCellFull!383) mapValue!1276)) b!27500))

(assert (= (and b!27494 ((_ is ValueCellFull!383) mapDefault!1276)) b!27495))

(assert (= start!3896 b!27494))

(declare-fun m!21903 () Bool)

(assert (=> b!27501 m!21903))

(assert (=> b!27501 m!21903))

(declare-fun m!21905 () Bool)

(assert (=> b!27501 m!21905))

(declare-fun m!21907 () Bool)

(assert (=> b!27496 m!21907))

(declare-fun m!21909 () Bool)

(assert (=> b!27497 m!21909))

(declare-fun m!21911 () Bool)

(assert (=> b!27499 m!21911))

(declare-fun m!21913 () Bool)

(assert (=> b!27493 m!21913))

(declare-fun m!21915 () Bool)

(assert (=> b!27498 m!21915))

(declare-fun m!21917 () Bool)

(assert (=> mapNonEmpty!1276 m!21917))

(declare-fun m!21919 () Bool)

(assert (=> start!3896 m!21919))

(declare-fun m!21921 () Bool)

(assert (=> start!3896 m!21921))

(declare-fun m!21923 () Bool)

(assert (=> start!3896 m!21923))

(check-sat (not b_next!811) (not b!27499) (not b!27497) (not b!27501) tp_is_empty!1165 (not b!27493) (not b!27498) (not mapNonEmpty!1276) b_and!1615 (not b!27496) (not start!3896))
(check-sat b_and!1615 (not b_next!811))
