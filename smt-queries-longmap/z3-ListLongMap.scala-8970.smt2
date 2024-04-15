; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108546 () Bool)

(assert start!108546)

(declare-fun b_free!28093 () Bool)

(declare-fun b_next!28093 () Bool)

(assert (=> start!108546 (= b_free!28093 (not b_next!28093))))

(declare-fun tp!99390 () Bool)

(declare-fun b_and!46135 () Bool)

(assert (=> start!108546 (= tp!99390 b_and!46135)))

(declare-fun b!1281231 () Bool)

(declare-fun e!732034 () Bool)

(declare-fun tp_is_empty!33733 () Bool)

(assert (=> b!1281231 (= e!732034 tp_is_empty!33733)))

(declare-fun b!1281232 () Bool)

(declare-fun e!732033 () Bool)

(assert (=> b!1281232 (= e!732033 (not true))))

(declare-datatypes ((V!50081 0))(
  ( (V!50082 (val!16941 Int)) )
))
(declare-fun minValue!1387 () V!50081)

(declare-fun zeroValue!1387 () V!50081)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15968 0))(
  ( (ValueCellFull!15968 (v!19540 V!50081)) (EmptyCell!15968) )
))
(declare-datatypes ((array!84433 0))(
  ( (array!84434 (arr!40721 (Array (_ BitVec 32) ValueCell!15968)) (size!41273 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84433)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84435 0))(
  ( (array!84436 (arr!40722 (Array (_ BitVec 32) (_ BitVec 64))) (size!41274 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84435)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21760 0))(
  ( (tuple2!21761 (_1!10891 (_ BitVec 64)) (_2!10891 V!50081)) )
))
(declare-datatypes ((List!28950 0))(
  ( (Nil!28947) (Cons!28946 (h!30155 tuple2!21760) (t!42482 List!28950)) )
))
(declare-datatypes ((ListLongMap!19417 0))(
  ( (ListLongMap!19418 (toList!9724 List!28950)) )
))
(declare-fun contains!7769 (ListLongMap!19417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4698 (array!84435 array!84433 (_ BitVec 32) (_ BitVec 32) V!50081 V!50081 (_ BitVec 32) Int) ListLongMap!19417)

(assert (=> b!1281232 (contains!7769 (getCurrentListMap!4698 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42273 0))(
  ( (Unit!42274) )
))
(declare-fun lt!576034 () Unit!42273)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!18 (array!84435 array!84433 (_ BitVec 32) (_ BitVec 32) V!50081 V!50081 (_ BitVec 64) (_ BitVec 32) Int) Unit!42273)

(assert (=> b!1281232 (= lt!576034 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!18 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281233 () Bool)

(declare-fun res!851109 () Bool)

(assert (=> b!1281233 (=> (not res!851109) (not e!732033))))

(assert (=> b!1281233 (= res!851109 (contains!7769 (getCurrentListMap!4698 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281234 () Bool)

(declare-fun res!851107 () Bool)

(assert (=> b!1281234 (=> (not res!851107) (not e!732033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84435 (_ BitVec 32)) Bool)

(assert (=> b!1281234 (= res!851107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281235 () Bool)

(declare-fun res!851111 () Bool)

(assert (=> b!1281235 (=> (not res!851111) (not e!732033))))

(assert (=> b!1281235 (= res!851111 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41274 _keys!1741))))))

(declare-fun b!1281236 () Bool)

(declare-fun res!851110 () Bool)

(assert (=> b!1281236 (=> (not res!851110) (not e!732033))))

(assert (=> b!1281236 (= res!851110 (and (= (size!41273 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41274 _keys!1741) (size!41273 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281237 () Bool)

(declare-fun e!732032 () Bool)

(declare-fun mapRes!52151 () Bool)

(assert (=> b!1281237 (= e!732032 (and e!732034 mapRes!52151))))

(declare-fun condMapEmpty!52151 () Bool)

(declare-fun mapDefault!52151 () ValueCell!15968)

(assert (=> b!1281237 (= condMapEmpty!52151 (= (arr!40721 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15968)) mapDefault!52151)))))

(declare-fun b!1281238 () Bool)

(declare-fun res!851108 () Bool)

(assert (=> b!1281238 (=> (not res!851108) (not e!732033))))

(declare-datatypes ((List!28951 0))(
  ( (Nil!28948) (Cons!28947 (h!30156 (_ BitVec 64)) (t!42483 List!28951)) )
))
(declare-fun arrayNoDuplicates!0 (array!84435 (_ BitVec 32) List!28951) Bool)

(assert (=> b!1281238 (= res!851108 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28948))))

(declare-fun b!1281240 () Bool)

(declare-fun e!732036 () Bool)

(assert (=> b!1281240 (= e!732036 tp_is_empty!33733)))

(declare-fun mapIsEmpty!52151 () Bool)

(assert (=> mapIsEmpty!52151 mapRes!52151))

(declare-fun mapNonEmpty!52151 () Bool)

(declare-fun tp!99389 () Bool)

(assert (=> mapNonEmpty!52151 (= mapRes!52151 (and tp!99389 e!732036))))

(declare-fun mapValue!52151 () ValueCell!15968)

(declare-fun mapRest!52151 () (Array (_ BitVec 32) ValueCell!15968))

(declare-fun mapKey!52151 () (_ BitVec 32))

(assert (=> mapNonEmpty!52151 (= (arr!40721 _values!1445) (store mapRest!52151 mapKey!52151 mapValue!52151))))

(declare-fun b!1281239 () Bool)

(declare-fun res!851105 () Bool)

(assert (=> b!1281239 (=> (not res!851105) (not e!732033))))

(assert (=> b!1281239 (= res!851105 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41274 _keys!1741)) (not (= (select (arr!40722 _keys!1741) from!2144) k0!1205))))))

(declare-fun res!851106 () Bool)

(assert (=> start!108546 (=> (not res!851106) (not e!732033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108546 (= res!851106 (validMask!0 mask!2175))))

(assert (=> start!108546 e!732033))

(assert (=> start!108546 tp_is_empty!33733))

(assert (=> start!108546 true))

(declare-fun array_inv!31061 (array!84433) Bool)

(assert (=> start!108546 (and (array_inv!31061 _values!1445) e!732032)))

(declare-fun array_inv!31062 (array!84435) Bool)

(assert (=> start!108546 (array_inv!31062 _keys!1741)))

(assert (=> start!108546 tp!99390))

(assert (= (and start!108546 res!851106) b!1281236))

(assert (= (and b!1281236 res!851110) b!1281234))

(assert (= (and b!1281234 res!851107) b!1281238))

(assert (= (and b!1281238 res!851108) b!1281235))

(assert (= (and b!1281235 res!851111) b!1281233))

(assert (= (and b!1281233 res!851109) b!1281239))

(assert (= (and b!1281239 res!851105) b!1281232))

(assert (= (and b!1281237 condMapEmpty!52151) mapIsEmpty!52151))

(assert (= (and b!1281237 (not condMapEmpty!52151)) mapNonEmpty!52151))

(get-info :version)

(assert (= (and mapNonEmpty!52151 ((_ is ValueCellFull!15968) mapValue!52151)) b!1281240))

(assert (= (and b!1281237 ((_ is ValueCellFull!15968) mapDefault!52151)) b!1281231))

(assert (= start!108546 b!1281237))

(declare-fun m!1175241 () Bool)

(assert (=> b!1281239 m!1175241))

(declare-fun m!1175243 () Bool)

(assert (=> b!1281232 m!1175243))

(assert (=> b!1281232 m!1175243))

(declare-fun m!1175245 () Bool)

(assert (=> b!1281232 m!1175245))

(declare-fun m!1175247 () Bool)

(assert (=> b!1281232 m!1175247))

(declare-fun m!1175249 () Bool)

(assert (=> mapNonEmpty!52151 m!1175249))

(declare-fun m!1175251 () Bool)

(assert (=> start!108546 m!1175251))

(declare-fun m!1175253 () Bool)

(assert (=> start!108546 m!1175253))

(declare-fun m!1175255 () Bool)

(assert (=> start!108546 m!1175255))

(declare-fun m!1175257 () Bool)

(assert (=> b!1281238 m!1175257))

(declare-fun m!1175259 () Bool)

(assert (=> b!1281233 m!1175259))

(assert (=> b!1281233 m!1175259))

(declare-fun m!1175261 () Bool)

(assert (=> b!1281233 m!1175261))

(declare-fun m!1175263 () Bool)

(assert (=> b!1281234 m!1175263))

(check-sat (not b_next!28093) (not b!1281232) (not mapNonEmpty!52151) tp_is_empty!33733 b_and!46135 (not b!1281233) (not b!1281234) (not b!1281238) (not start!108546))
(check-sat b_and!46135 (not b_next!28093))
