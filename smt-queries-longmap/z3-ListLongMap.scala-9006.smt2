; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109020 () Bool)

(assert start!109020)

(declare-fun b_free!28309 () Bool)

(declare-fun b_next!28309 () Bool)

(assert (=> start!109020 (= b_free!28309 (not b_next!28309))))

(declare-fun tp!100042 () Bool)

(declare-fun b_and!46377 () Bool)

(assert (=> start!109020 (= tp!100042 b_and!46377)))

(declare-fun b!1286045 () Bool)

(declare-fun res!853981 () Bool)

(declare-fun e!734724 () Bool)

(assert (=> b!1286045 (=> (not res!853981) (not e!734724))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84985 0))(
  ( (array!84986 (arr!40990 (Array (_ BitVec 32) (_ BitVec 64))) (size!41541 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84985)

(assert (=> b!1286045 (= res!853981 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41541 _keys!1741))))))

(declare-fun b!1286046 () Bool)

(declare-fun e!734726 () Bool)

(declare-fun tp_is_empty!33949 () Bool)

(assert (=> b!1286046 (= e!734726 tp_is_empty!33949)))

(declare-fun b!1286047 () Bool)

(declare-fun res!853980 () Bool)

(assert (=> b!1286047 (=> (not res!853980) (not e!734724))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50369 0))(
  ( (V!50370 (val!17049 Int)) )
))
(declare-datatypes ((ValueCell!16076 0))(
  ( (ValueCellFull!16076 (v!19646 V!50369)) (EmptyCell!16076) )
))
(declare-datatypes ((array!84987 0))(
  ( (array!84988 (arr!40991 (Array (_ BitVec 32) ValueCell!16076)) (size!41542 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84987)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286047 (= res!853980 (and (= (size!41542 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41541 _keys!1741) (size!41542 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286048 () Bool)

(declare-fun e!734727 () Bool)

(declare-fun mapRes!52481 () Bool)

(assert (=> b!1286048 (= e!734727 (and e!734726 mapRes!52481))))

(declare-fun condMapEmpty!52481 () Bool)

(declare-fun mapDefault!52481 () ValueCell!16076)

(assert (=> b!1286048 (= condMapEmpty!52481 (= (arr!40991 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16076)) mapDefault!52481)))))

(declare-fun b!1286049 () Bool)

(assert (=> b!1286049 (= e!734724 false)))

(declare-fun minValue!1387 () V!50369)

(declare-fun zeroValue!1387 () V!50369)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!577334 () Bool)

(declare-datatypes ((tuple2!21872 0))(
  ( (tuple2!21873 (_1!10947 (_ BitVec 64)) (_2!10947 V!50369)) )
))
(declare-datatypes ((List!29073 0))(
  ( (Nil!29070) (Cons!29069 (h!30287 tuple2!21872) (t!42609 List!29073)) )
))
(declare-datatypes ((ListLongMap!19537 0))(
  ( (ListLongMap!19538 (toList!9784 List!29073)) )
))
(declare-fun contains!7915 (ListLongMap!19537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4848 (array!84985 array!84987 (_ BitVec 32) (_ BitVec 32) V!50369 V!50369 (_ BitVec 32) Int) ListLongMap!19537)

(assert (=> b!1286049 (= lt!577334 (contains!7915 (getCurrentListMap!4848 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1286050 () Bool)

(declare-fun e!734723 () Bool)

(assert (=> b!1286050 (= e!734723 tp_is_empty!33949)))

(declare-fun b!1286051 () Bool)

(declare-fun res!853979 () Bool)

(assert (=> b!1286051 (=> (not res!853979) (not e!734724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84985 (_ BitVec 32)) Bool)

(assert (=> b!1286051 (= res!853979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!853977 () Bool)

(assert (=> start!109020 (=> (not res!853977) (not e!734724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109020 (= res!853977 (validMask!0 mask!2175))))

(assert (=> start!109020 e!734724))

(assert (=> start!109020 tp_is_empty!33949))

(assert (=> start!109020 true))

(declare-fun array_inv!31303 (array!84987) Bool)

(assert (=> start!109020 (and (array_inv!31303 _values!1445) e!734727)))

(declare-fun array_inv!31304 (array!84985) Bool)

(assert (=> start!109020 (array_inv!31304 _keys!1741)))

(assert (=> start!109020 tp!100042))

(declare-fun mapNonEmpty!52481 () Bool)

(declare-fun tp!100043 () Bool)

(assert (=> mapNonEmpty!52481 (= mapRes!52481 (and tp!100043 e!734723))))

(declare-fun mapKey!52481 () (_ BitVec 32))

(declare-fun mapRest!52481 () (Array (_ BitVec 32) ValueCell!16076))

(declare-fun mapValue!52481 () ValueCell!16076)

(assert (=> mapNonEmpty!52481 (= (arr!40991 _values!1445) (store mapRest!52481 mapKey!52481 mapValue!52481))))

(declare-fun mapIsEmpty!52481 () Bool)

(assert (=> mapIsEmpty!52481 mapRes!52481))

(declare-fun b!1286052 () Bool)

(declare-fun res!853978 () Bool)

(assert (=> b!1286052 (=> (not res!853978) (not e!734724))))

(declare-datatypes ((List!29074 0))(
  ( (Nil!29071) (Cons!29070 (h!30288 (_ BitVec 64)) (t!42610 List!29074)) )
))
(declare-fun arrayNoDuplicates!0 (array!84985 (_ BitVec 32) List!29074) Bool)

(assert (=> b!1286052 (= res!853978 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29071))))

(assert (= (and start!109020 res!853977) b!1286047))

(assert (= (and b!1286047 res!853980) b!1286051))

(assert (= (and b!1286051 res!853979) b!1286052))

(assert (= (and b!1286052 res!853978) b!1286045))

(assert (= (and b!1286045 res!853981) b!1286049))

(assert (= (and b!1286048 condMapEmpty!52481) mapIsEmpty!52481))

(assert (= (and b!1286048 (not condMapEmpty!52481)) mapNonEmpty!52481))

(get-info :version)

(assert (= (and mapNonEmpty!52481 ((_ is ValueCellFull!16076) mapValue!52481)) b!1286050))

(assert (= (and b!1286048 ((_ is ValueCellFull!16076) mapDefault!52481)) b!1286046))

(assert (= start!109020 b!1286048))

(declare-fun m!1179937 () Bool)

(assert (=> mapNonEmpty!52481 m!1179937))

(declare-fun m!1179939 () Bool)

(assert (=> b!1286051 m!1179939))

(declare-fun m!1179941 () Bool)

(assert (=> b!1286049 m!1179941))

(assert (=> b!1286049 m!1179941))

(declare-fun m!1179943 () Bool)

(assert (=> b!1286049 m!1179943))

(declare-fun m!1179945 () Bool)

(assert (=> start!109020 m!1179945))

(declare-fun m!1179947 () Bool)

(assert (=> start!109020 m!1179947))

(declare-fun m!1179949 () Bool)

(assert (=> start!109020 m!1179949))

(declare-fun m!1179951 () Bool)

(assert (=> b!1286052 m!1179951))

(check-sat (not mapNonEmpty!52481) (not b!1286052) tp_is_empty!33949 (not b!1286051) (not start!109020) b_and!46377 (not b!1286049) (not b_next!28309))
(check-sat b_and!46377 (not b_next!28309))
