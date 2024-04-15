; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3926 () Bool)

(assert start!3926)

(declare-fun b_free!841 () Bool)

(declare-fun b_next!841 () Bool)

(assert (=> start!3926 (= b_free!841 (not b_next!841))))

(declare-fun tp!3943 () Bool)

(declare-fun b_and!1645 () Bool)

(assert (=> start!3926 (= tp!3943 b_and!1645)))

(declare-fun b!27942 () Bool)

(declare-fun res!16601 () Bool)

(declare-fun e!18111 () Bool)

(assert (=> b!27942 (=> (not res!16601) (not e!18111))))

(declare-datatypes ((array!1603 0))(
  ( (array!1604 (arr!755 (Array (_ BitVec 32) (_ BitVec 64))) (size!856 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1603)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27942 (= res!16601 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27943 () Bool)

(declare-fun res!16599 () Bool)

(assert (=> b!27943 (=> (not res!16599) (not e!18111))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1419 0))(
  ( (V!1420 (val!624 Int)) )
))
(declare-datatypes ((ValueCell!398 0))(
  ( (ValueCellFull!398 (v!1712 V!1419)) (EmptyCell!398) )
))
(declare-datatypes ((array!1605 0))(
  ( (array!1606 (arr!756 (Array (_ BitVec 32) ValueCell!398)) (size!857 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1605)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1419)

(declare-fun minValue!1443 () V!1419)

(declare-datatypes ((tuple2!1052 0))(
  ( (tuple2!1053 (_1!537 (_ BitVec 64)) (_2!537 V!1419)) )
))
(declare-datatypes ((List!640 0))(
  ( (Nil!637) (Cons!636 (h!1203 tuple2!1052) (t!3326 List!640)) )
))
(declare-datatypes ((ListLongMap!617 0))(
  ( (ListLongMap!618 (toList!324 List!640)) )
))
(declare-fun contains!265 (ListLongMap!617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!154 (array!1603 array!1605 (_ BitVec 32) (_ BitVec 32) V!1419 V!1419 (_ BitVec 32) Int) ListLongMap!617)

(assert (=> b!27943 (= res!16599 (not (contains!265 (getCurrentListMap!154 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27944 () Bool)

(declare-fun res!16597 () Bool)

(assert (=> b!27944 (=> (not res!16597) (not e!18111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1603 (_ BitVec 32)) Bool)

(assert (=> b!27944 (= res!16597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27945 () Bool)

(declare-fun res!16600 () Bool)

(assert (=> b!27945 (=> (not res!16600) (not e!18111))))

(declare-datatypes ((List!641 0))(
  ( (Nil!638) (Cons!637 (h!1204 (_ BitVec 64)) (t!3327 List!641)) )
))
(declare-fun arrayNoDuplicates!0 (array!1603 (_ BitVec 32) List!641) Bool)

(assert (=> b!27945 (= res!16600 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!638))))

(declare-fun b!27946 () Bool)

(declare-fun res!16598 () Bool)

(assert (=> b!27946 (=> (not res!16598) (not e!18111))))

(assert (=> b!27946 (= res!16598 (and (= (size!857 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!856 _keys!1833) (size!857 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27947 () Bool)

(declare-fun e!18114 () Bool)

(declare-fun e!18112 () Bool)

(declare-fun mapRes!1321 () Bool)

(assert (=> b!27947 (= e!18114 (and e!18112 mapRes!1321))))

(declare-fun condMapEmpty!1321 () Bool)

(declare-fun mapDefault!1321 () ValueCell!398)

(assert (=> b!27947 (= condMapEmpty!1321 (= (arr!756 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!398)) mapDefault!1321)))))

(declare-fun b!27948 () Bool)

(declare-fun res!16602 () Bool)

(assert (=> b!27948 (=> (not res!16602) (not e!18111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27948 (= res!16602 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1321 () Bool)

(declare-fun tp!3942 () Bool)

(declare-fun e!18115 () Bool)

(assert (=> mapNonEmpty!1321 (= mapRes!1321 (and tp!3942 e!18115))))

(declare-fun mapValue!1321 () ValueCell!398)

(declare-fun mapKey!1321 () (_ BitVec 32))

(declare-fun mapRest!1321 () (Array (_ BitVec 32) ValueCell!398))

(assert (=> mapNonEmpty!1321 (= (arr!756 _values!1501) (store mapRest!1321 mapKey!1321 mapValue!1321))))

(declare-fun res!16603 () Bool)

(assert (=> start!3926 (=> (not res!16603) (not e!18111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3926 (= res!16603 (validMask!0 mask!2294))))

(assert (=> start!3926 e!18111))

(assert (=> start!3926 true))

(assert (=> start!3926 tp!3943))

(declare-fun array_inv!533 (array!1605) Bool)

(assert (=> start!3926 (and (array_inv!533 _values!1501) e!18114)))

(declare-fun array_inv!534 (array!1603) Bool)

(assert (=> start!3926 (array_inv!534 _keys!1833)))

(declare-fun tp_is_empty!1195 () Bool)

(assert (=> start!3926 tp_is_empty!1195))

(declare-fun b!27949 () Bool)

(assert (=> b!27949 (= e!18112 tp_is_empty!1195)))

(declare-fun mapIsEmpty!1321 () Bool)

(assert (=> mapIsEmpty!1321 mapRes!1321))

(declare-fun b!27950 () Bool)

(assert (=> b!27950 (= e!18111 false)))

(declare-fun lt!10732 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1603 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27950 (= lt!10732 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27951 () Bool)

(assert (=> b!27951 (= e!18115 tp_is_empty!1195)))

(assert (= (and start!3926 res!16603) b!27946))

(assert (= (and b!27946 res!16598) b!27944))

(assert (= (and b!27944 res!16597) b!27945))

(assert (= (and b!27945 res!16600) b!27948))

(assert (= (and b!27948 res!16602) b!27943))

(assert (= (and b!27943 res!16599) b!27942))

(assert (= (and b!27942 res!16601) b!27950))

(assert (= (and b!27947 condMapEmpty!1321) mapIsEmpty!1321))

(assert (= (and b!27947 (not condMapEmpty!1321)) mapNonEmpty!1321))

(get-info :version)

(assert (= (and mapNonEmpty!1321 ((_ is ValueCellFull!398) mapValue!1321)) b!27951))

(assert (= (and b!27947 ((_ is ValueCellFull!398) mapDefault!1321)) b!27949))

(assert (= start!3926 b!27947))

(declare-fun m!22233 () Bool)

(assert (=> b!27944 m!22233))

(declare-fun m!22235 () Bool)

(assert (=> b!27942 m!22235))

(declare-fun m!22237 () Bool)

(assert (=> b!27943 m!22237))

(assert (=> b!27943 m!22237))

(declare-fun m!22239 () Bool)

(assert (=> b!27943 m!22239))

(declare-fun m!22241 () Bool)

(assert (=> b!27950 m!22241))

(declare-fun m!22243 () Bool)

(assert (=> mapNonEmpty!1321 m!22243))

(declare-fun m!22245 () Bool)

(assert (=> b!27945 m!22245))

(declare-fun m!22247 () Bool)

(assert (=> start!3926 m!22247))

(declare-fun m!22249 () Bool)

(assert (=> start!3926 m!22249))

(declare-fun m!22251 () Bool)

(assert (=> start!3926 m!22251))

(declare-fun m!22253 () Bool)

(assert (=> b!27948 m!22253))

(check-sat b_and!1645 (not start!3926) (not b!27945) tp_is_empty!1195 (not b!27950) (not b!27943) (not b_next!841) (not b!27942) (not b!27948) (not mapNonEmpty!1321) (not b!27944))
(check-sat b_and!1645 (not b_next!841))
