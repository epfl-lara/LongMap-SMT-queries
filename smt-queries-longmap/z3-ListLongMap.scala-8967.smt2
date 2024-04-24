; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108752 () Bool)

(assert start!108752)

(declare-fun b_free!28075 () Bool)

(declare-fun b_next!28075 () Bool)

(assert (=> start!108752 (= b_free!28075 (not b_next!28075))))

(declare-fun tp!99335 () Bool)

(declare-fun b_and!46137 () Bool)

(assert (=> start!108752 (= tp!99335 b_and!46137)))

(declare-fun b!1282330 () Bool)

(declare-fun res!851468 () Bool)

(declare-fun e!732776 () Bool)

(assert (=> b!1282330 (=> (not res!851468) (not e!732776))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84533 0))(
  ( (array!84534 (arr!40766 (Array (_ BitVec 32) (_ BitVec 64))) (size!41317 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84533)

(assert (=> b!1282330 (= res!851468 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41317 _keys!1741))))))

(declare-fun b!1282331 () Bool)

(declare-fun e!732774 () Bool)

(declare-fun e!732777 () Bool)

(declare-fun mapRes!52124 () Bool)

(assert (=> b!1282331 (= e!732774 (and e!732777 mapRes!52124))))

(declare-fun condMapEmpty!52124 () Bool)

(declare-datatypes ((V!50057 0))(
  ( (V!50058 (val!16932 Int)) )
))
(declare-datatypes ((ValueCell!15959 0))(
  ( (ValueCellFull!15959 (v!19527 V!50057)) (EmptyCell!15959) )
))
(declare-datatypes ((array!84535 0))(
  ( (array!84536 (arr!40767 (Array (_ BitVec 32) ValueCell!15959)) (size!41318 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84535)

(declare-fun mapDefault!52124 () ValueCell!15959)

(assert (=> b!1282331 (= condMapEmpty!52124 (= (arr!40767 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15959)) mapDefault!52124)))))

(declare-fun b!1282332 () Bool)

(declare-fun res!851464 () Bool)

(assert (=> b!1282332 (=> (not res!851464) (not e!732776))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1282332 (= res!851464 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41317 _keys!1741)) (not (= (select (arr!40766 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1282333 () Bool)

(assert (=> b!1282333 (= e!732776 (not true))))

(declare-fun minValue!1387 () V!50057)

(declare-fun zeroValue!1387 () V!50057)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21696 0))(
  ( (tuple2!21697 (_1!10859 (_ BitVec 64)) (_2!10859 V!50057)) )
))
(declare-datatypes ((List!28912 0))(
  ( (Nil!28909) (Cons!28908 (h!30126 tuple2!21696) (t!42444 List!28912)) )
))
(declare-datatypes ((ListLongMap!19361 0))(
  ( (ListLongMap!19362 (toList!9696 List!28912)) )
))
(declare-fun contains!7825 (ListLongMap!19361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4765 (array!84533 array!84535 (_ BitVec 32) (_ BitVec 32) V!50057 V!50057 (_ BitVec 32) Int) ListLongMap!19361)

(assert (=> b!1282333 (contains!7825 (getCurrentListMap!4765 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42382 0))(
  ( (Unit!42383) )
))
(declare-fun lt!576669 () Unit!42382)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!12 (array!84533 array!84535 (_ BitVec 32) (_ BitVec 32) V!50057 V!50057 (_ BitVec 64) (_ BitVec 32) Int) Unit!42382)

(assert (=> b!1282333 (= lt!576669 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!12 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1282334 () Bool)

(declare-fun res!851469 () Bool)

(assert (=> b!1282334 (=> (not res!851469) (not e!732776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84533 (_ BitVec 32)) Bool)

(assert (=> b!1282334 (= res!851469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!851466 () Bool)

(assert (=> start!108752 (=> (not res!851466) (not e!732776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108752 (= res!851466 (validMask!0 mask!2175))))

(assert (=> start!108752 e!732776))

(declare-fun tp_is_empty!33715 () Bool)

(assert (=> start!108752 tp_is_empty!33715))

(assert (=> start!108752 true))

(declare-fun array_inv!31147 (array!84535) Bool)

(assert (=> start!108752 (and (array_inv!31147 _values!1445) e!732774)))

(declare-fun array_inv!31148 (array!84533) Bool)

(assert (=> start!108752 (array_inv!31148 _keys!1741)))

(assert (=> start!108752 tp!99335))

(declare-fun b!1282335 () Bool)

(declare-fun res!851463 () Bool)

(assert (=> b!1282335 (=> (not res!851463) (not e!732776))))

(assert (=> b!1282335 (= res!851463 (and (= (size!41318 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41317 _keys!1741) (size!41318 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52124 () Bool)

(assert (=> mapIsEmpty!52124 mapRes!52124))

(declare-fun b!1282336 () Bool)

(declare-fun res!851465 () Bool)

(assert (=> b!1282336 (=> (not res!851465) (not e!732776))))

(assert (=> b!1282336 (= res!851465 (contains!7825 (getCurrentListMap!4765 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282337 () Bool)

(declare-fun res!851467 () Bool)

(assert (=> b!1282337 (=> (not res!851467) (not e!732776))))

(declare-datatypes ((List!28913 0))(
  ( (Nil!28910) (Cons!28909 (h!30127 (_ BitVec 64)) (t!42445 List!28913)) )
))
(declare-fun arrayNoDuplicates!0 (array!84533 (_ BitVec 32) List!28913) Bool)

(assert (=> b!1282337 (= res!851467 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28910))))

(declare-fun b!1282338 () Bool)

(assert (=> b!1282338 (= e!732777 tp_is_empty!33715)))

(declare-fun mapNonEmpty!52124 () Bool)

(declare-fun tp!99334 () Bool)

(declare-fun e!732775 () Bool)

(assert (=> mapNonEmpty!52124 (= mapRes!52124 (and tp!99334 e!732775))))

(declare-fun mapValue!52124 () ValueCell!15959)

(declare-fun mapRest!52124 () (Array (_ BitVec 32) ValueCell!15959))

(declare-fun mapKey!52124 () (_ BitVec 32))

(assert (=> mapNonEmpty!52124 (= (arr!40767 _values!1445) (store mapRest!52124 mapKey!52124 mapValue!52124))))

(declare-fun b!1282339 () Bool)

(assert (=> b!1282339 (= e!732775 tp_is_empty!33715)))

(assert (= (and start!108752 res!851466) b!1282335))

(assert (= (and b!1282335 res!851463) b!1282334))

(assert (= (and b!1282334 res!851469) b!1282337))

(assert (= (and b!1282337 res!851467) b!1282330))

(assert (= (and b!1282330 res!851468) b!1282336))

(assert (= (and b!1282336 res!851465) b!1282332))

(assert (= (and b!1282332 res!851464) b!1282333))

(assert (= (and b!1282331 condMapEmpty!52124) mapIsEmpty!52124))

(assert (= (and b!1282331 (not condMapEmpty!52124)) mapNonEmpty!52124))

(get-info :version)

(assert (= (and mapNonEmpty!52124 ((_ is ValueCellFull!15959) mapValue!52124)) b!1282339))

(assert (= (and b!1282331 ((_ is ValueCellFull!15959) mapDefault!52124)) b!1282338))

(assert (= start!108752 b!1282331))

(declare-fun m!1177137 () Bool)

(assert (=> start!108752 m!1177137))

(declare-fun m!1177139 () Bool)

(assert (=> start!108752 m!1177139))

(declare-fun m!1177141 () Bool)

(assert (=> start!108752 m!1177141))

(declare-fun m!1177143 () Bool)

(assert (=> b!1282332 m!1177143))

(declare-fun m!1177145 () Bool)

(assert (=> b!1282336 m!1177145))

(assert (=> b!1282336 m!1177145))

(declare-fun m!1177147 () Bool)

(assert (=> b!1282336 m!1177147))

(declare-fun m!1177149 () Bool)

(assert (=> b!1282337 m!1177149))

(declare-fun m!1177151 () Bool)

(assert (=> mapNonEmpty!52124 m!1177151))

(declare-fun m!1177153 () Bool)

(assert (=> b!1282334 m!1177153))

(declare-fun m!1177155 () Bool)

(assert (=> b!1282333 m!1177155))

(assert (=> b!1282333 m!1177155))

(declare-fun m!1177157 () Bool)

(assert (=> b!1282333 m!1177157))

(declare-fun m!1177159 () Bool)

(assert (=> b!1282333 m!1177159))

(check-sat (not mapNonEmpty!52124) (not b!1282337) tp_is_empty!33715 b_and!46137 (not b!1282333) (not start!108752) (not b_next!28075) (not b!1282334) (not b!1282336))
(check-sat b_and!46137 (not b_next!28075))
