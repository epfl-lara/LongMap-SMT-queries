; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108542 () Bool)

(assert start!108542)

(declare-fun b_free!28089 () Bool)

(declare-fun b_next!28089 () Bool)

(assert (=> start!108542 (= b_free!28089 (not b_next!28089))))

(declare-fun tp!99376 () Bool)

(declare-fun b_and!46149 () Bool)

(assert (=> start!108542 (= tp!99376 b_and!46149)))

(declare-fun mapIsEmpty!52145 () Bool)

(declare-fun mapRes!52145 () Bool)

(assert (=> mapIsEmpty!52145 mapRes!52145))

(declare-fun b!1281235 () Bool)

(declare-fun res!851092 () Bool)

(declare-fun e!732031 () Bool)

(assert (=> b!1281235 (=> (not res!851092) (not e!732031))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50075 0))(
  ( (V!50076 (val!16939 Int)) )
))
(declare-datatypes ((ValueCell!15966 0))(
  ( (ValueCellFull!15966 (v!19539 V!50075)) (EmptyCell!15966) )
))
(declare-datatypes ((array!84528 0))(
  ( (array!84529 (arr!40768 (Array (_ BitVec 32) ValueCell!15966)) (size!41318 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84528)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84530 0))(
  ( (array!84531 (arr!40769 (Array (_ BitVec 32) (_ BitVec 64))) (size!41319 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84530)

(assert (=> b!1281235 (= res!851092 (and (= (size!41318 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41319 _keys!1741) (size!41318 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281236 () Bool)

(declare-fun res!851093 () Bool)

(assert (=> b!1281236 (=> (not res!851093) (not e!732031))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281236 (= res!851093 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41319 _keys!1741))))))

(declare-fun b!1281237 () Bool)

(assert (=> b!1281237 (= e!732031 (not true))))

(declare-fun minValue!1387 () V!50075)

(declare-fun zeroValue!1387 () V!50075)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21686 0))(
  ( (tuple2!21687 (_1!10854 (_ BitVec 64)) (_2!10854 V!50075)) )
))
(declare-datatypes ((List!28880 0))(
  ( (Nil!28877) (Cons!28876 (h!30085 tuple2!21686) (t!42420 List!28880)) )
))
(declare-datatypes ((ListLongMap!19343 0))(
  ( (ListLongMap!19344 (toList!9687 List!28880)) )
))
(declare-fun contains!7802 (ListLongMap!19343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4771 (array!84530 array!84528 (_ BitVec 32) (_ BitVec 32) V!50075 V!50075 (_ BitVec 32) Int) ListLongMap!19343)

(assert (=> b!1281237 (contains!7802 (getCurrentListMap!4771 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42431 0))(
  ( (Unit!42432) )
))
(declare-fun lt!576206 () Unit!42431)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!20 (array!84530 array!84528 (_ BitVec 32) (_ BitVec 32) V!50075 V!50075 (_ BitVec 64) (_ BitVec 32) Int) Unit!42431)

(assert (=> b!1281237 (= lt!576206 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!20 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun res!851091 () Bool)

(assert (=> start!108542 (=> (not res!851091) (not e!732031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108542 (= res!851091 (validMask!0 mask!2175))))

(assert (=> start!108542 e!732031))

(declare-fun tp_is_empty!33729 () Bool)

(assert (=> start!108542 tp_is_empty!33729))

(assert (=> start!108542 true))

(declare-fun e!732035 () Bool)

(declare-fun array_inv!30935 (array!84528) Bool)

(assert (=> start!108542 (and (array_inv!30935 _values!1445) e!732035)))

(declare-fun array_inv!30936 (array!84530) Bool)

(assert (=> start!108542 (array_inv!30936 _keys!1741)))

(assert (=> start!108542 tp!99376))

(declare-fun b!1281238 () Bool)

(declare-fun e!732033 () Bool)

(assert (=> b!1281238 (= e!732033 tp_is_empty!33729)))

(declare-fun mapNonEmpty!52145 () Bool)

(declare-fun tp!99377 () Bool)

(assert (=> mapNonEmpty!52145 (= mapRes!52145 (and tp!99377 e!732033))))

(declare-fun mapRest!52145 () (Array (_ BitVec 32) ValueCell!15966))

(declare-fun mapValue!52145 () ValueCell!15966)

(declare-fun mapKey!52145 () (_ BitVec 32))

(assert (=> mapNonEmpty!52145 (= (arr!40768 _values!1445) (store mapRest!52145 mapKey!52145 mapValue!52145))))

(declare-fun b!1281239 () Bool)

(declare-fun res!851090 () Bool)

(assert (=> b!1281239 (=> (not res!851090) (not e!732031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84530 (_ BitVec 32)) Bool)

(assert (=> b!1281239 (= res!851090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281240 () Bool)

(declare-fun res!851094 () Bool)

(assert (=> b!1281240 (=> (not res!851094) (not e!732031))))

(declare-datatypes ((List!28881 0))(
  ( (Nil!28878) (Cons!28877 (h!30086 (_ BitVec 64)) (t!42421 List!28881)) )
))
(declare-fun arrayNoDuplicates!0 (array!84530 (_ BitVec 32) List!28881) Bool)

(assert (=> b!1281240 (= res!851094 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28878))))

(declare-fun b!1281241 () Bool)

(declare-fun res!851095 () Bool)

(assert (=> b!1281241 (=> (not res!851095) (not e!732031))))

(assert (=> b!1281241 (= res!851095 (contains!7802 (getCurrentListMap!4771 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281242 () Bool)

(declare-fun res!851096 () Bool)

(assert (=> b!1281242 (=> (not res!851096) (not e!732031))))

(assert (=> b!1281242 (= res!851096 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41319 _keys!1741)) (not (= (select (arr!40769 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281243 () Bool)

(declare-fun e!732034 () Bool)

(assert (=> b!1281243 (= e!732035 (and e!732034 mapRes!52145))))

(declare-fun condMapEmpty!52145 () Bool)

(declare-fun mapDefault!52145 () ValueCell!15966)

(assert (=> b!1281243 (= condMapEmpty!52145 (= (arr!40768 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15966)) mapDefault!52145)))))

(declare-fun b!1281244 () Bool)

(assert (=> b!1281244 (= e!732034 tp_is_empty!33729)))

(assert (= (and start!108542 res!851091) b!1281235))

(assert (= (and b!1281235 res!851092) b!1281239))

(assert (= (and b!1281239 res!851090) b!1281240))

(assert (= (and b!1281240 res!851094) b!1281236))

(assert (= (and b!1281236 res!851093) b!1281241))

(assert (= (and b!1281241 res!851095) b!1281242))

(assert (= (and b!1281242 res!851096) b!1281237))

(assert (= (and b!1281243 condMapEmpty!52145) mapIsEmpty!52145))

(assert (= (and b!1281243 (not condMapEmpty!52145)) mapNonEmpty!52145))

(get-info :version)

(assert (= (and mapNonEmpty!52145 ((_ is ValueCellFull!15966) mapValue!52145)) b!1281238))

(assert (= (and b!1281243 ((_ is ValueCellFull!15966) mapDefault!52145)) b!1281244))

(assert (= start!108542 b!1281243))

(declare-fun m!1175693 () Bool)

(assert (=> b!1281241 m!1175693))

(assert (=> b!1281241 m!1175693))

(declare-fun m!1175695 () Bool)

(assert (=> b!1281241 m!1175695))

(declare-fun m!1175697 () Bool)

(assert (=> mapNonEmpty!52145 m!1175697))

(declare-fun m!1175699 () Bool)

(assert (=> b!1281237 m!1175699))

(assert (=> b!1281237 m!1175699))

(declare-fun m!1175701 () Bool)

(assert (=> b!1281237 m!1175701))

(declare-fun m!1175703 () Bool)

(assert (=> b!1281237 m!1175703))

(declare-fun m!1175705 () Bool)

(assert (=> b!1281239 m!1175705))

(declare-fun m!1175707 () Bool)

(assert (=> b!1281242 m!1175707))

(declare-fun m!1175709 () Bool)

(assert (=> b!1281240 m!1175709))

(declare-fun m!1175711 () Bool)

(assert (=> start!108542 m!1175711))

(declare-fun m!1175713 () Bool)

(assert (=> start!108542 m!1175713))

(declare-fun m!1175715 () Bool)

(assert (=> start!108542 m!1175715))

(check-sat (not b_next!28089) tp_is_empty!33729 (not b!1281240) (not b!1281239) b_and!46149 (not mapNonEmpty!52145) (not b!1281237) (not start!108542) (not b!1281241))
(check-sat b_and!46149 (not b_next!28089))
