; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3908 () Bool)

(assert start!3908)

(declare-fun b_free!813 () Bool)

(declare-fun b_next!813 () Bool)

(assert (=> start!3908 (= b_free!813 (not b_next!813))))

(declare-fun tp!3858 () Bool)

(declare-fun b_and!1623 () Bool)

(assert (=> start!3908 (= tp!3858 b_and!1623)))

(declare-fun res!16335 () Bool)

(declare-fun e!17947 () Bool)

(assert (=> start!3908 (=> (not res!16335) (not e!17947))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3908 (= res!16335 (validMask!0 mask!2294))))

(assert (=> start!3908 e!17947))

(assert (=> start!3908 true))

(assert (=> start!3908 tp!3858))

(declare-datatypes ((V!1381 0))(
  ( (V!1382 (val!610 Int)) )
))
(declare-datatypes ((ValueCell!384 0))(
  ( (ValueCellFull!384 (v!1699 V!1381)) (EmptyCell!384) )
))
(declare-datatypes ((array!1575 0))(
  ( (array!1576 (arr!741 (Array (_ BitVec 32) ValueCell!384)) (size!842 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1575)

(declare-fun e!17944 () Bool)

(declare-fun array_inv!509 (array!1575) Bool)

(assert (=> start!3908 (and (array_inv!509 _values!1501) e!17944)))

(declare-datatypes ((array!1577 0))(
  ( (array!1578 (arr!742 (Array (_ BitVec 32) (_ BitVec 64))) (size!843 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1577)

(declare-fun array_inv!510 (array!1577) Bool)

(assert (=> start!3908 (array_inv!510 _keys!1833)))

(declare-fun tp_is_empty!1167 () Bool)

(assert (=> start!3908 tp_is_empty!1167))

(declare-fun b!27576 () Bool)

(declare-fun res!16337 () Bool)

(assert (=> b!27576 (=> (not res!16337) (not e!17947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1577 (_ BitVec 32)) Bool)

(assert (=> b!27576 (= res!16337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27577 () Bool)

(declare-fun e!17948 () Bool)

(assert (=> b!27577 (= e!17948 tp_is_empty!1167)))

(declare-fun b!27578 () Bool)

(declare-fun res!16336 () Bool)

(assert (=> b!27578 (=> (not res!16336) (not e!17947))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1381)

(declare-fun minValue!1443 () V!1381)

(declare-datatypes ((tuple2!1026 0))(
  ( (tuple2!1027 (_1!524 (_ BitVec 64)) (_2!524 V!1381)) )
))
(declare-datatypes ((List!625 0))(
  ( (Nil!622) (Cons!621 (h!1188 tuple2!1026) (t!3318 List!625)) )
))
(declare-datatypes ((ListLongMap!603 0))(
  ( (ListLongMap!604 (toList!317 List!625)) )
))
(declare-fun contains!257 (ListLongMap!603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!147 (array!1577 array!1575 (_ BitVec 32) (_ BitVec 32) V!1381 V!1381 (_ BitVec 32) Int) ListLongMap!603)

(assert (=> b!27578 (= res!16336 (not (contains!257 (getCurrentListMap!147 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27579 () Bool)

(declare-fun res!16338 () Bool)

(assert (=> b!27579 (=> (not res!16338) (not e!17947))))

(declare-datatypes ((List!626 0))(
  ( (Nil!623) (Cons!622 (h!1189 (_ BitVec 64)) (t!3319 List!626)) )
))
(declare-fun arrayNoDuplicates!0 (array!1577 (_ BitVec 32) List!626) Bool)

(assert (=> b!27579 (= res!16338 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!623))))

(declare-fun b!27580 () Bool)

(declare-fun mapRes!1279 () Bool)

(assert (=> b!27580 (= e!17944 (and e!17948 mapRes!1279))))

(declare-fun condMapEmpty!1279 () Bool)

(declare-fun mapDefault!1279 () ValueCell!384)

(assert (=> b!27580 (= condMapEmpty!1279 (= (arr!741 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!384)) mapDefault!1279)))))

(declare-fun b!27581 () Bool)

(assert (=> b!27581 (= e!17947 false)))

(declare-fun lt!10694 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1577 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27581 (= lt!10694 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1279 () Bool)

(assert (=> mapIsEmpty!1279 mapRes!1279))

(declare-fun b!27582 () Bool)

(declare-fun e!17946 () Bool)

(assert (=> b!27582 (= e!17946 tp_is_empty!1167)))

(declare-fun mapNonEmpty!1279 () Bool)

(declare-fun tp!3859 () Bool)

(assert (=> mapNonEmpty!1279 (= mapRes!1279 (and tp!3859 e!17946))))

(declare-fun mapValue!1279 () ValueCell!384)

(declare-fun mapKey!1279 () (_ BitVec 32))

(declare-fun mapRest!1279 () (Array (_ BitVec 32) ValueCell!384))

(assert (=> mapNonEmpty!1279 (= (arr!741 _values!1501) (store mapRest!1279 mapKey!1279 mapValue!1279))))

(declare-fun b!27583 () Bool)

(declare-fun res!16339 () Bool)

(assert (=> b!27583 (=> (not res!16339) (not e!17947))))

(declare-fun arrayContainsKey!0 (array!1577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27583 (= res!16339 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27584 () Bool)

(declare-fun res!16340 () Bool)

(assert (=> b!27584 (=> (not res!16340) (not e!17947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27584 (= res!16340 (validKeyInArray!0 k0!1304))))

(declare-fun b!27585 () Bool)

(declare-fun res!16341 () Bool)

(assert (=> b!27585 (=> (not res!16341) (not e!17947))))

(assert (=> b!27585 (= res!16341 (and (= (size!842 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!843 _keys!1833) (size!842 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3908 res!16335) b!27585))

(assert (= (and b!27585 res!16341) b!27576))

(assert (= (and b!27576 res!16337) b!27579))

(assert (= (and b!27579 res!16338) b!27584))

(assert (= (and b!27584 res!16340) b!27578))

(assert (= (and b!27578 res!16336) b!27583))

(assert (= (and b!27583 res!16339) b!27581))

(assert (= (and b!27580 condMapEmpty!1279) mapIsEmpty!1279))

(assert (= (and b!27580 (not condMapEmpty!1279)) mapNonEmpty!1279))

(get-info :version)

(assert (= (and mapNonEmpty!1279 ((_ is ValueCellFull!384) mapValue!1279)) b!27582))

(assert (= (and b!27580 ((_ is ValueCellFull!384) mapDefault!1279)) b!27577))

(assert (= start!3908 b!27580))

(declare-fun m!21995 () Bool)

(assert (=> b!27584 m!21995))

(declare-fun m!21997 () Bool)

(assert (=> start!3908 m!21997))

(declare-fun m!21999 () Bool)

(assert (=> start!3908 m!21999))

(declare-fun m!22001 () Bool)

(assert (=> start!3908 m!22001))

(declare-fun m!22003 () Bool)

(assert (=> mapNonEmpty!1279 m!22003))

(declare-fun m!22005 () Bool)

(assert (=> b!27583 m!22005))

(declare-fun m!22007 () Bool)

(assert (=> b!27578 m!22007))

(assert (=> b!27578 m!22007))

(declare-fun m!22009 () Bool)

(assert (=> b!27578 m!22009))

(declare-fun m!22011 () Bool)

(assert (=> b!27581 m!22011))

(declare-fun m!22013 () Bool)

(assert (=> b!27576 m!22013))

(declare-fun m!22015 () Bool)

(assert (=> b!27579 m!22015))

(check-sat (not mapNonEmpty!1279) (not b_next!813) (not start!3908) (not b!27584) b_and!1623 tp_is_empty!1167 (not b!27576) (not b!27583) (not b!27579) (not b!27581) (not b!27578))
(check-sat b_and!1623 (not b_next!813))
