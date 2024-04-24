; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109026 () Bool)

(assert start!109026)

(declare-fun b_free!28315 () Bool)

(declare-fun b_next!28315 () Bool)

(assert (=> start!109026 (= b_free!28315 (not b_next!28315))))

(declare-fun tp!100061 () Bool)

(declare-fun b_and!46383 () Bool)

(assert (=> start!109026 (= tp!100061 b_and!46383)))

(declare-fun b!1286123 () Bool)

(declare-fun res!854034 () Bool)

(declare-fun e!734770 () Bool)

(assert (=> b!1286123 (=> (not res!854034) (not e!734770))))

(declare-datatypes ((V!50377 0))(
  ( (V!50378 (val!17052 Int)) )
))
(declare-fun minValue!1387 () V!50377)

(declare-fun zeroValue!1387 () V!50377)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16079 0))(
  ( (ValueCellFull!16079 (v!19649 V!50377)) (EmptyCell!16079) )
))
(declare-datatypes ((array!84997 0))(
  ( (array!84998 (arr!40996 (Array (_ BitVec 32) ValueCell!16079)) (size!41547 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84997)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84999 0))(
  ( (array!85000 (arr!40997 (Array (_ BitVec 32) (_ BitVec 64))) (size!41548 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84999)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21876 0))(
  ( (tuple2!21877 (_1!10949 (_ BitVec 64)) (_2!10949 V!50377)) )
))
(declare-datatypes ((List!29077 0))(
  ( (Nil!29074) (Cons!29073 (h!30291 tuple2!21876) (t!42613 List!29077)) )
))
(declare-datatypes ((ListLongMap!19541 0))(
  ( (ListLongMap!19542 (toList!9786 List!29077)) )
))
(declare-fun contains!7917 (ListLongMap!19541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4850 (array!84999 array!84997 (_ BitVec 32) (_ BitVec 32) V!50377 V!50377 (_ BitVec 32) Int) ListLongMap!19541)

(assert (=> b!1286123 (= res!854034 (contains!7917 (getCurrentListMap!4850 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286124 () Bool)

(declare-fun res!854028 () Bool)

(assert (=> b!1286124 (=> (not res!854028) (not e!734770))))

(assert (=> b!1286124 (= res!854028 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41548 _keys!1741))))))

(declare-fun b!1286125 () Bool)

(declare-fun res!854035 () Bool)

(assert (=> b!1286125 (=> (not res!854035) (not e!734770))))

(assert (=> b!1286125 (= res!854035 (and (= (size!41547 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41548 _keys!1741) (size!41547 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286126 () Bool)

(declare-fun res!854032 () Bool)

(assert (=> b!1286126 (=> (not res!854032) (not e!734770))))

(declare-datatypes ((List!29078 0))(
  ( (Nil!29075) (Cons!29074 (h!30292 (_ BitVec 64)) (t!42614 List!29078)) )
))
(declare-fun arrayNoDuplicates!0 (array!84999 (_ BitVec 32) List!29078) Bool)

(assert (=> b!1286126 (= res!854032 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29075))))

(declare-fun b!1286127 () Bool)

(declare-fun e!734768 () Bool)

(declare-fun tp_is_empty!33955 () Bool)

(assert (=> b!1286127 (= e!734768 tp_is_empty!33955)))

(declare-fun b!1286128 () Bool)

(declare-fun res!854030 () Bool)

(assert (=> b!1286128 (=> (not res!854030) (not e!734770))))

(assert (=> b!1286128 (= res!854030 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41548 _keys!1741))))))

(declare-fun b!1286129 () Bool)

(declare-fun res!854029 () Bool)

(assert (=> b!1286129 (=> (not res!854029) (not e!734770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84999 (_ BitVec 32)) Bool)

(assert (=> b!1286129 (= res!854029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286130 () Bool)

(assert (=> b!1286130 (= e!734770 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt from!2144 (size!41548 _keys!1741))))))

(declare-fun b!1286131 () Bool)

(declare-fun e!734769 () Bool)

(assert (=> b!1286131 (= e!734769 tp_is_empty!33955)))

(declare-fun b!1286132 () Bool)

(declare-fun res!854033 () Bool)

(assert (=> b!1286132 (=> (not res!854033) (not e!734770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286132 (= res!854033 (validKeyInArray!0 (select (arr!40997 _keys!1741) from!2144)))))

(declare-fun b!1286133 () Bool)

(declare-fun e!734772 () Bool)

(declare-fun mapRes!52490 () Bool)

(assert (=> b!1286133 (= e!734772 (and e!734768 mapRes!52490))))

(declare-fun condMapEmpty!52490 () Bool)

(declare-fun mapDefault!52490 () ValueCell!16079)

(assert (=> b!1286133 (= condMapEmpty!52490 (= (arr!40996 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16079)) mapDefault!52490)))))

(declare-fun mapNonEmpty!52490 () Bool)

(declare-fun tp!100060 () Bool)

(assert (=> mapNonEmpty!52490 (= mapRes!52490 (and tp!100060 e!734769))))

(declare-fun mapValue!52490 () ValueCell!16079)

(declare-fun mapRest!52490 () (Array (_ BitVec 32) ValueCell!16079))

(declare-fun mapKey!52490 () (_ BitVec 32))

(assert (=> mapNonEmpty!52490 (= (arr!40996 _values!1445) (store mapRest!52490 mapKey!52490 mapValue!52490))))

(declare-fun res!854031 () Bool)

(assert (=> start!109026 (=> (not res!854031) (not e!734770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109026 (= res!854031 (validMask!0 mask!2175))))

(assert (=> start!109026 e!734770))

(assert (=> start!109026 tp_is_empty!33955))

(assert (=> start!109026 true))

(declare-fun array_inv!31307 (array!84997) Bool)

(assert (=> start!109026 (and (array_inv!31307 _values!1445) e!734772)))

(declare-fun array_inv!31308 (array!84999) Bool)

(assert (=> start!109026 (array_inv!31308 _keys!1741)))

(assert (=> start!109026 tp!100061))

(declare-fun mapIsEmpty!52490 () Bool)

(assert (=> mapIsEmpty!52490 mapRes!52490))

(assert (= (and start!109026 res!854031) b!1286125))

(assert (= (and b!1286125 res!854035) b!1286129))

(assert (= (and b!1286129 res!854029) b!1286126))

(assert (= (and b!1286126 res!854032) b!1286128))

(assert (= (and b!1286128 res!854030) b!1286123))

(assert (= (and b!1286123 res!854034) b!1286124))

(assert (= (and b!1286124 res!854028) b!1286132))

(assert (= (and b!1286132 res!854033) b!1286130))

(assert (= (and b!1286133 condMapEmpty!52490) mapIsEmpty!52490))

(assert (= (and b!1286133 (not condMapEmpty!52490)) mapNonEmpty!52490))

(get-info :version)

(assert (= (and mapNonEmpty!52490 ((_ is ValueCellFull!16079) mapValue!52490)) b!1286131))

(assert (= (and b!1286133 ((_ is ValueCellFull!16079) mapDefault!52490)) b!1286127))

(assert (= start!109026 b!1286133))

(declare-fun m!1179985 () Bool)

(assert (=> b!1286129 m!1179985))

(declare-fun m!1179987 () Bool)

(assert (=> start!109026 m!1179987))

(declare-fun m!1179989 () Bool)

(assert (=> start!109026 m!1179989))

(declare-fun m!1179991 () Bool)

(assert (=> start!109026 m!1179991))

(declare-fun m!1179993 () Bool)

(assert (=> b!1286132 m!1179993))

(assert (=> b!1286132 m!1179993))

(declare-fun m!1179995 () Bool)

(assert (=> b!1286132 m!1179995))

(declare-fun m!1179997 () Bool)

(assert (=> b!1286126 m!1179997))

(declare-fun m!1179999 () Bool)

(assert (=> mapNonEmpty!52490 m!1179999))

(declare-fun m!1180001 () Bool)

(assert (=> b!1286123 m!1180001))

(assert (=> b!1286123 m!1180001))

(declare-fun m!1180003 () Bool)

(assert (=> b!1286123 m!1180003))

(check-sat (not mapNonEmpty!52490) (not b_next!28315) (not b!1286126) tp_is_empty!33955 (not b!1286129) b_and!46383 (not start!109026) (not b!1286123) (not b!1286132))
(check-sat b_and!46383 (not b_next!28315))
