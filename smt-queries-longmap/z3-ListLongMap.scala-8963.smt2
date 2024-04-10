; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108506 () Bool)

(assert start!108506)

(declare-fun b_free!28053 () Bool)

(declare-fun b_next!28053 () Bool)

(assert (=> start!108506 (= b_free!28053 (not b_next!28053))))

(declare-fun tp!99268 () Bool)

(declare-fun b_and!46113 () Bool)

(assert (=> start!108506 (= tp!99268 b_and!46113)))

(declare-fun b!1280695 () Bool)

(declare-fun e!731763 () Bool)

(assert (=> b!1280695 (= e!731763 (not true))))

(declare-datatypes ((V!50027 0))(
  ( (V!50028 (val!16921 Int)) )
))
(declare-fun minValue!1387 () V!50027)

(declare-fun zeroValue!1387 () V!50027)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15948 0))(
  ( (ValueCellFull!15948 (v!19521 V!50027)) (EmptyCell!15948) )
))
(declare-datatypes ((array!84462 0))(
  ( (array!84463 (arr!40735 (Array (_ BitVec 32) ValueCell!15948)) (size!41285 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84462)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84464 0))(
  ( (array!84465 (arr!40736 (Array (_ BitVec 32) (_ BitVec 64))) (size!41286 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84464)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21660 0))(
  ( (tuple2!21661 (_1!10841 (_ BitVec 64)) (_2!10841 V!50027)) )
))
(declare-datatypes ((List!28857 0))(
  ( (Nil!28854) (Cons!28853 (h!30062 tuple2!21660) (t!42397 List!28857)) )
))
(declare-datatypes ((ListLongMap!19317 0))(
  ( (ListLongMap!19318 (toList!9674 List!28857)) )
))
(declare-fun contains!7789 (ListLongMap!19317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4758 (array!84464 array!84462 (_ BitVec 32) (_ BitVec 32) V!50027 V!50027 (_ BitVec 32) Int) ListLongMap!19317)

(assert (=> b!1280695 (contains!7789 (getCurrentListMap!4758 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42405 0))(
  ( (Unit!42406) )
))
(declare-fun lt!576152 () Unit!42405)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!7 (array!84464 array!84462 (_ BitVec 32) (_ BitVec 32) V!50027 V!50027 (_ BitVec 64) (_ BitVec 32) Int) Unit!42405)

(assert (=> b!1280695 (= lt!576152 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!7 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280696 () Bool)

(declare-fun res!850715 () Bool)

(assert (=> b!1280696 (=> (not res!850715) (not e!731763))))

(assert (=> b!1280696 (= res!850715 (contains!7789 (getCurrentListMap!4758 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280697 () Bool)

(declare-fun res!850716 () Bool)

(assert (=> b!1280697 (=> (not res!850716) (not e!731763))))

(declare-datatypes ((List!28858 0))(
  ( (Nil!28855) (Cons!28854 (h!30063 (_ BitVec 64)) (t!42398 List!28858)) )
))
(declare-fun arrayNoDuplicates!0 (array!84464 (_ BitVec 32) List!28858) Bool)

(assert (=> b!1280697 (= res!850716 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28855))))

(declare-fun b!1280698 () Bool)

(declare-fun res!850717 () Bool)

(assert (=> b!1280698 (=> (not res!850717) (not e!731763))))

(assert (=> b!1280698 (= res!850717 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41286 _keys!1741)) (not (= (select (arr!40736 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!850713 () Bool)

(assert (=> start!108506 (=> (not res!850713) (not e!731763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108506 (= res!850713 (validMask!0 mask!2175))))

(assert (=> start!108506 e!731763))

(declare-fun tp_is_empty!33693 () Bool)

(assert (=> start!108506 tp_is_empty!33693))

(assert (=> start!108506 true))

(declare-fun e!731765 () Bool)

(declare-fun array_inv!30915 (array!84462) Bool)

(assert (=> start!108506 (and (array_inv!30915 _values!1445) e!731765)))

(declare-fun array_inv!30916 (array!84464) Bool)

(assert (=> start!108506 (array_inv!30916 _keys!1741)))

(assert (=> start!108506 tp!99268))

(declare-fun mapNonEmpty!52091 () Bool)

(declare-fun mapRes!52091 () Bool)

(declare-fun tp!99269 () Bool)

(declare-fun e!731761 () Bool)

(assert (=> mapNonEmpty!52091 (= mapRes!52091 (and tp!99269 e!731761))))

(declare-fun mapValue!52091 () ValueCell!15948)

(declare-fun mapKey!52091 () (_ BitVec 32))

(declare-fun mapRest!52091 () (Array (_ BitVec 32) ValueCell!15948))

(assert (=> mapNonEmpty!52091 (= (arr!40735 _values!1445) (store mapRest!52091 mapKey!52091 mapValue!52091))))

(declare-fun b!1280699 () Bool)

(declare-fun res!850714 () Bool)

(assert (=> b!1280699 (=> (not res!850714) (not e!731763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84464 (_ BitVec 32)) Bool)

(assert (=> b!1280699 (= res!850714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280700 () Bool)

(declare-fun res!850718 () Bool)

(assert (=> b!1280700 (=> (not res!850718) (not e!731763))))

(assert (=> b!1280700 (= res!850718 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41286 _keys!1741))))))

(declare-fun b!1280701 () Bool)

(assert (=> b!1280701 (= e!731761 tp_is_empty!33693)))

(declare-fun b!1280702 () Bool)

(declare-fun res!850712 () Bool)

(assert (=> b!1280702 (=> (not res!850712) (not e!731763))))

(assert (=> b!1280702 (= res!850712 (and (= (size!41285 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41286 _keys!1741) (size!41285 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280703 () Bool)

(declare-fun e!731762 () Bool)

(assert (=> b!1280703 (= e!731762 tp_is_empty!33693)))

(declare-fun b!1280704 () Bool)

(assert (=> b!1280704 (= e!731765 (and e!731762 mapRes!52091))))

(declare-fun condMapEmpty!52091 () Bool)

(declare-fun mapDefault!52091 () ValueCell!15948)

(assert (=> b!1280704 (= condMapEmpty!52091 (= (arr!40735 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15948)) mapDefault!52091)))))

(declare-fun mapIsEmpty!52091 () Bool)

(assert (=> mapIsEmpty!52091 mapRes!52091))

(assert (= (and start!108506 res!850713) b!1280702))

(assert (= (and b!1280702 res!850712) b!1280699))

(assert (= (and b!1280699 res!850714) b!1280697))

(assert (= (and b!1280697 res!850716) b!1280700))

(assert (= (and b!1280700 res!850718) b!1280696))

(assert (= (and b!1280696 res!850715) b!1280698))

(assert (= (and b!1280698 res!850717) b!1280695))

(assert (= (and b!1280704 condMapEmpty!52091) mapIsEmpty!52091))

(assert (= (and b!1280704 (not condMapEmpty!52091)) mapNonEmpty!52091))

(get-info :version)

(assert (= (and mapNonEmpty!52091 ((_ is ValueCellFull!15948) mapValue!52091)) b!1280701))

(assert (= (and b!1280704 ((_ is ValueCellFull!15948) mapDefault!52091)) b!1280703))

(assert (= start!108506 b!1280704))

(declare-fun m!1175261 () Bool)

(assert (=> b!1280695 m!1175261))

(assert (=> b!1280695 m!1175261))

(declare-fun m!1175263 () Bool)

(assert (=> b!1280695 m!1175263))

(declare-fun m!1175265 () Bool)

(assert (=> b!1280695 m!1175265))

(declare-fun m!1175267 () Bool)

(assert (=> b!1280697 m!1175267))

(declare-fun m!1175269 () Bool)

(assert (=> mapNonEmpty!52091 m!1175269))

(declare-fun m!1175271 () Bool)

(assert (=> start!108506 m!1175271))

(declare-fun m!1175273 () Bool)

(assert (=> start!108506 m!1175273))

(declare-fun m!1175275 () Bool)

(assert (=> start!108506 m!1175275))

(declare-fun m!1175277 () Bool)

(assert (=> b!1280696 m!1175277))

(assert (=> b!1280696 m!1175277))

(declare-fun m!1175279 () Bool)

(assert (=> b!1280696 m!1175279))

(declare-fun m!1175281 () Bool)

(assert (=> b!1280699 m!1175281))

(declare-fun m!1175283 () Bool)

(assert (=> b!1280698 m!1175283))

(check-sat (not b!1280699) (not b!1280695) (not mapNonEmpty!52091) b_and!46113 (not b!1280697) (not start!108506) tp_is_empty!33693 (not b!1280696) (not b_next!28053))
(check-sat b_and!46113 (not b_next!28053))
