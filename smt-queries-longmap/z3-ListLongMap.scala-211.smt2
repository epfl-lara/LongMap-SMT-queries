; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3950 () Bool)

(assert start!3950)

(declare-fun b_free!855 () Bool)

(declare-fun b_next!855 () Bool)

(assert (=> start!3950 (= b_free!855 (not b_next!855))))

(declare-fun tp!3985 () Bool)

(declare-fun b_and!1665 () Bool)

(assert (=> start!3950 (= tp!3985 b_and!1665)))

(declare-fun b!28206 () Bool)

(declare-fun e!18261 () Bool)

(declare-fun tp_is_empty!1209 () Bool)

(assert (=> b!28206 (= e!18261 tp_is_empty!1209)))

(declare-fun b!28207 () Bool)

(declare-fun res!16779 () Bool)

(declare-fun e!18263 () Bool)

(assert (=> b!28207 (=> (not res!16779) (not e!18263))))

(declare-datatypes ((array!1657 0))(
  ( (array!1658 (arr!782 (Array (_ BitVec 32) (_ BitVec 64))) (size!883 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1657)

(declare-datatypes ((List!653 0))(
  ( (Nil!650) (Cons!649 (h!1216 (_ BitVec 64)) (t!3346 List!653)) )
))
(declare-fun arrayNoDuplicates!0 (array!1657 (_ BitVec 32) List!653) Bool)

(assert (=> b!28207 (= res!16779 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!650))))

(declare-fun b!28208 () Bool)

(declare-fun res!16781 () Bool)

(assert (=> b!28208 (=> (not res!16781) (not e!18263))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1657 (_ BitVec 32)) Bool)

(assert (=> b!28208 (= res!16781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28209 () Bool)

(declare-fun res!16782 () Bool)

(assert (=> b!28209 (=> (not res!16782) (not e!18263))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((V!1437 0))(
  ( (V!1438 (val!631 Int)) )
))
(declare-datatypes ((ValueCell!405 0))(
  ( (ValueCellFull!405 (v!1720 V!1437)) (EmptyCell!405) )
))
(declare-datatypes ((array!1659 0))(
  ( (array!1660 (arr!783 (Array (_ BitVec 32) ValueCell!405)) (size!884 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1659)

(declare-fun zeroValue!1443 () V!1437)

(declare-fun minValue!1443 () V!1437)

(declare-datatypes ((tuple2!1052 0))(
  ( (tuple2!1053 (_1!537 (_ BitVec 64)) (_2!537 V!1437)) )
))
(declare-datatypes ((List!654 0))(
  ( (Nil!651) (Cons!650 (h!1217 tuple2!1052) (t!3347 List!654)) )
))
(declare-datatypes ((ListLongMap!629 0))(
  ( (ListLongMap!630 (toList!330 List!654)) )
))
(declare-fun contains!270 (ListLongMap!629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!160 (array!1657 array!1659 (_ BitVec 32) (_ BitVec 32) V!1437 V!1437 (_ BitVec 32) Int) ListLongMap!629)

(assert (=> b!28209 (= res!16782 (not (contains!270 (getCurrentListMap!160 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!28210 () Bool)

(declare-fun e!18260 () Bool)

(declare-fun e!18262 () Bool)

(declare-fun mapRes!1342 () Bool)

(assert (=> b!28210 (= e!18260 (and e!18262 mapRes!1342))))

(declare-fun condMapEmpty!1342 () Bool)

(declare-fun mapDefault!1342 () ValueCell!405)

(assert (=> b!28210 (= condMapEmpty!1342 (= (arr!783 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!405)) mapDefault!1342)))))

(declare-fun b!28211 () Bool)

(assert (=> b!28211 (= e!18263 false)))

(declare-fun lt!10757 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1657 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28211 (= lt!10757 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28212 () Bool)

(assert (=> b!28212 (= e!18262 tp_is_empty!1209)))

(declare-fun mapIsEmpty!1342 () Bool)

(assert (=> mapIsEmpty!1342 mapRes!1342))

(declare-fun b!28213 () Bool)

(declare-fun res!16778 () Bool)

(assert (=> b!28213 (=> (not res!16778) (not e!18263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28213 (= res!16778 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1342 () Bool)

(declare-fun tp!3984 () Bool)

(assert (=> mapNonEmpty!1342 (= mapRes!1342 (and tp!3984 e!18261))))

(declare-fun mapValue!1342 () ValueCell!405)

(declare-fun mapKey!1342 () (_ BitVec 32))

(declare-fun mapRest!1342 () (Array (_ BitVec 32) ValueCell!405))

(assert (=> mapNonEmpty!1342 (= (arr!783 _values!1501) (store mapRest!1342 mapKey!1342 mapValue!1342))))

(declare-fun res!16777 () Bool)

(assert (=> start!3950 (=> (not res!16777) (not e!18263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3950 (= res!16777 (validMask!0 mask!2294))))

(assert (=> start!3950 e!18263))

(assert (=> start!3950 true))

(assert (=> start!3950 tp!3985))

(declare-fun array_inv!537 (array!1659) Bool)

(assert (=> start!3950 (and (array_inv!537 _values!1501) e!18260)))

(declare-fun array_inv!538 (array!1657) Bool)

(assert (=> start!3950 (array_inv!538 _keys!1833)))

(assert (=> start!3950 tp_is_empty!1209))

(declare-fun b!28214 () Bool)

(declare-fun res!16780 () Bool)

(assert (=> b!28214 (=> (not res!16780) (not e!18263))))

(assert (=> b!28214 (= res!16780 (and (= (size!884 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!883 _keys!1833) (size!884 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28215 () Bool)

(declare-fun res!16776 () Bool)

(assert (=> b!28215 (=> (not res!16776) (not e!18263))))

(declare-fun arrayContainsKey!0 (array!1657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28215 (= res!16776 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3950 res!16777) b!28214))

(assert (= (and b!28214 res!16780) b!28208))

(assert (= (and b!28208 res!16781) b!28207))

(assert (= (and b!28207 res!16779) b!28213))

(assert (= (and b!28213 res!16778) b!28209))

(assert (= (and b!28209 res!16782) b!28215))

(assert (= (and b!28215 res!16776) b!28211))

(assert (= (and b!28210 condMapEmpty!1342) mapIsEmpty!1342))

(assert (= (and b!28210 (not condMapEmpty!1342)) mapNonEmpty!1342))

(get-info :version)

(assert (= (and mapNonEmpty!1342 ((_ is ValueCellFull!405) mapValue!1342)) b!28206))

(assert (= (and b!28210 ((_ is ValueCellFull!405) mapDefault!1342)) b!28212))

(assert (= start!3950 b!28210))

(declare-fun m!22457 () Bool)

(assert (=> mapNonEmpty!1342 m!22457))

(declare-fun m!22459 () Bool)

(assert (=> b!28209 m!22459))

(assert (=> b!28209 m!22459))

(declare-fun m!22461 () Bool)

(assert (=> b!28209 m!22461))

(declare-fun m!22463 () Bool)

(assert (=> start!3950 m!22463))

(declare-fun m!22465 () Bool)

(assert (=> start!3950 m!22465))

(declare-fun m!22467 () Bool)

(assert (=> start!3950 m!22467))

(declare-fun m!22469 () Bool)

(assert (=> b!28207 m!22469))

(declare-fun m!22471 () Bool)

(assert (=> b!28213 m!22471))

(declare-fun m!22473 () Bool)

(assert (=> b!28208 m!22473))

(declare-fun m!22475 () Bool)

(assert (=> b!28215 m!22475))

(declare-fun m!22477 () Bool)

(assert (=> b!28211 m!22477))

(check-sat (not b!28211) (not b!28208) (not b!28207) (not b_next!855) b_and!1665 (not b!28213) (not mapNonEmpty!1342) tp_is_empty!1209 (not b!28215) (not b!28209) (not start!3950))
(check-sat b_and!1665 (not b_next!855))
