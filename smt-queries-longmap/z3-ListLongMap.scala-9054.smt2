; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109110 () Bool)

(assert start!109110)

(declare-fun b_free!28599 () Bool)

(declare-fun b_next!28599 () Bool)

(assert (=> start!109110 (= b_free!28599 (not b_next!28599))))

(declare-fun tp!100916 () Bool)

(declare-fun b_and!46689 () Bool)

(assert (=> start!109110 (= tp!100916 b_and!46689)))

(declare-fun b!1290066 () Bool)

(declare-fun res!856991 () Bool)

(declare-fun e!736532 () Bool)

(assert (=> b!1290066 (=> (not res!856991) (not e!736532))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50755 0))(
  ( (V!50756 (val!17194 Int)) )
))
(declare-datatypes ((ValueCell!16221 0))(
  ( (ValueCellFull!16221 (v!19797 V!50755)) (EmptyCell!16221) )
))
(declare-datatypes ((array!85520 0))(
  ( (array!85521 (arr!41261 (Array (_ BitVec 32) ValueCell!16221)) (size!41811 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85520)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85522 0))(
  ( (array!85523 (arr!41262 (Array (_ BitVec 32) (_ BitVec 64))) (size!41812 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85522)

(assert (=> b!1290066 (= res!856991 (and (= (size!41811 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41812 _keys!1741) (size!41811 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52919 () Bool)

(declare-fun mapRes!52919 () Bool)

(assert (=> mapIsEmpty!52919 mapRes!52919))

(declare-fun b!1290067 () Bool)

(declare-fun res!856990 () Bool)

(assert (=> b!1290067 (=> (not res!856990) (not e!736532))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1290067 (= res!856990 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41812 _keys!1741))))))

(declare-fun b!1290065 () Bool)

(declare-fun e!736527 () Bool)

(declare-fun tp_is_empty!34239 () Bool)

(assert (=> b!1290065 (= e!736527 tp_is_empty!34239)))

(declare-fun res!856994 () Bool)

(assert (=> start!109110 (=> (not res!856994) (not e!736532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109110 (= res!856994 (validMask!0 mask!2175))))

(assert (=> start!109110 e!736532))

(assert (=> start!109110 tp_is_empty!34239))

(assert (=> start!109110 true))

(declare-fun e!736528 () Bool)

(declare-fun array_inv!31273 (array!85520) Bool)

(assert (=> start!109110 (and (array_inv!31273 _values!1445) e!736528)))

(declare-fun array_inv!31274 (array!85522) Bool)

(assert (=> start!109110 (array_inv!31274 _keys!1741)))

(assert (=> start!109110 tp!100916))

(declare-fun b!1290068 () Bool)

(declare-fun res!856988 () Bool)

(assert (=> b!1290068 (=> (not res!856988) (not e!736532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290068 (= res!856988 (not (validKeyInArray!0 (select (arr!41262 _keys!1741) from!2144))))))

(declare-fun b!1290069 () Bool)

(declare-fun e!736530 () Bool)

(assert (=> b!1290069 (= e!736532 (not e!736530))))

(declare-fun res!856992 () Bool)

(assert (=> b!1290069 (=> res!856992 e!736530)))

(assert (=> b!1290069 (= res!856992 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22090 0))(
  ( (tuple2!22091 (_1!11056 (_ BitVec 64)) (_2!11056 V!50755)) )
))
(declare-datatypes ((List!29257 0))(
  ( (Nil!29254) (Cons!29253 (h!30462 tuple2!22090) (t!42821 List!29257)) )
))
(declare-datatypes ((ListLongMap!19747 0))(
  ( (ListLongMap!19748 (toList!9889 List!29257)) )
))
(declare-fun contains!8007 (ListLongMap!19747 (_ BitVec 64)) Bool)

(assert (=> b!1290069 (not (contains!8007 (ListLongMap!19748 Nil!29254) k0!1205))))

(declare-datatypes ((Unit!42692 0))(
  ( (Unit!42693) )
))
(declare-fun lt!578465 () Unit!42692)

(declare-fun emptyContainsNothing!73 ((_ BitVec 64)) Unit!42692)

(assert (=> b!1290069 (= lt!578465 (emptyContainsNothing!73 k0!1205))))

(declare-fun b!1290070 () Bool)

(declare-fun e!736531 () Bool)

(assert (=> b!1290070 (= e!736528 (and e!736531 mapRes!52919))))

(declare-fun condMapEmpty!52919 () Bool)

(declare-fun mapDefault!52919 () ValueCell!16221)

(assert (=> b!1290070 (= condMapEmpty!52919 (= (arr!41261 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16221)) mapDefault!52919)))))

(declare-fun b!1290071 () Bool)

(declare-fun res!856987 () Bool)

(assert (=> b!1290071 (=> (not res!856987) (not e!736532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85522 (_ BitVec 32)) Bool)

(assert (=> b!1290071 (= res!856987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290072 () Bool)

(declare-fun res!856993 () Bool)

(assert (=> b!1290072 (=> (not res!856993) (not e!736532))))

(declare-fun minValue!1387 () V!50755)

(declare-fun zeroValue!1387 () V!50755)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4947 (array!85522 array!85520 (_ BitVec 32) (_ BitVec 32) V!50755 V!50755 (_ BitVec 32) Int) ListLongMap!19747)

(assert (=> b!1290072 (= res!856993 (contains!8007 (getCurrentListMap!4947 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290073 () Bool)

(declare-fun res!856995 () Bool)

(assert (=> b!1290073 (=> (not res!856995) (not e!736532))))

(assert (=> b!1290073 (= res!856995 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41812 _keys!1741))))))

(declare-fun b!1290074 () Bool)

(assert (=> b!1290074 (= e!736530 true)))

(declare-fun lt!578467 () ListLongMap!19747)

(declare-fun +!4358 (ListLongMap!19747 tuple2!22090) ListLongMap!19747)

(assert (=> b!1290074 (not (contains!8007 (+!4358 lt!578467 (tuple2!22091 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578466 () Unit!42692)

(declare-fun addStillNotContains!376 (ListLongMap!19747 (_ BitVec 64) V!50755 (_ BitVec 64)) Unit!42692)

(assert (=> b!1290074 (= lt!578466 (addStillNotContains!376 lt!578467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290074 (not (contains!8007 (+!4358 lt!578467 (tuple2!22091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578468 () Unit!42692)

(assert (=> b!1290074 (= lt!578468 (addStillNotContains!376 lt!578467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5989 (array!85522 array!85520 (_ BitVec 32) (_ BitVec 32) V!50755 V!50755 (_ BitVec 32) Int) ListLongMap!19747)

(assert (=> b!1290074 (= lt!578467 (getCurrentListMapNoExtraKeys!5989 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52919 () Bool)

(declare-fun tp!100915 () Bool)

(assert (=> mapNonEmpty!52919 (= mapRes!52919 (and tp!100915 e!736527))))

(declare-fun mapRest!52919 () (Array (_ BitVec 32) ValueCell!16221))

(declare-fun mapKey!52919 () (_ BitVec 32))

(declare-fun mapValue!52919 () ValueCell!16221)

(assert (=> mapNonEmpty!52919 (= (arr!41261 _values!1445) (store mapRest!52919 mapKey!52919 mapValue!52919))))

(declare-fun b!1290075 () Bool)

(assert (=> b!1290075 (= e!736531 tp_is_empty!34239)))

(declare-fun b!1290076 () Bool)

(declare-fun res!856989 () Bool)

(assert (=> b!1290076 (=> (not res!856989) (not e!736532))))

(declare-datatypes ((List!29258 0))(
  ( (Nil!29255) (Cons!29254 (h!30463 (_ BitVec 64)) (t!42822 List!29258)) )
))
(declare-fun arrayNoDuplicates!0 (array!85522 (_ BitVec 32) List!29258) Bool)

(assert (=> b!1290076 (= res!856989 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29255))))

(assert (= (and start!109110 res!856994) b!1290066))

(assert (= (and b!1290066 res!856991) b!1290071))

(assert (= (and b!1290071 res!856987) b!1290076))

(assert (= (and b!1290076 res!856989) b!1290073))

(assert (= (and b!1290073 res!856995) b!1290072))

(assert (= (and b!1290072 res!856993) b!1290067))

(assert (= (and b!1290067 res!856990) b!1290068))

(assert (= (and b!1290068 res!856988) b!1290069))

(assert (= (and b!1290069 (not res!856992)) b!1290074))

(assert (= (and b!1290070 condMapEmpty!52919) mapIsEmpty!52919))

(assert (= (and b!1290070 (not condMapEmpty!52919)) mapNonEmpty!52919))

(get-info :version)

(assert (= (and mapNonEmpty!52919 ((_ is ValueCellFull!16221) mapValue!52919)) b!1290065))

(assert (= (and b!1290070 ((_ is ValueCellFull!16221) mapDefault!52919)) b!1290075))

(assert (= start!109110 b!1290070))

(declare-fun m!1182619 () Bool)

(assert (=> b!1290068 m!1182619))

(assert (=> b!1290068 m!1182619))

(declare-fun m!1182621 () Bool)

(assert (=> b!1290068 m!1182621))

(declare-fun m!1182623 () Bool)

(assert (=> b!1290074 m!1182623))

(declare-fun m!1182625 () Bool)

(assert (=> b!1290074 m!1182625))

(declare-fun m!1182627 () Bool)

(assert (=> b!1290074 m!1182627))

(declare-fun m!1182629 () Bool)

(assert (=> b!1290074 m!1182629))

(assert (=> b!1290074 m!1182627))

(declare-fun m!1182631 () Bool)

(assert (=> b!1290074 m!1182631))

(assert (=> b!1290074 m!1182631))

(declare-fun m!1182633 () Bool)

(assert (=> b!1290074 m!1182633))

(declare-fun m!1182635 () Bool)

(assert (=> b!1290074 m!1182635))

(declare-fun m!1182637 () Bool)

(assert (=> b!1290076 m!1182637))

(declare-fun m!1182639 () Bool)

(assert (=> start!109110 m!1182639))

(declare-fun m!1182641 () Bool)

(assert (=> start!109110 m!1182641))

(declare-fun m!1182643 () Bool)

(assert (=> start!109110 m!1182643))

(declare-fun m!1182645 () Bool)

(assert (=> b!1290072 m!1182645))

(assert (=> b!1290072 m!1182645))

(declare-fun m!1182647 () Bool)

(assert (=> b!1290072 m!1182647))

(declare-fun m!1182649 () Bool)

(assert (=> b!1290071 m!1182649))

(declare-fun m!1182651 () Bool)

(assert (=> b!1290069 m!1182651))

(declare-fun m!1182653 () Bool)

(assert (=> b!1290069 m!1182653))

(declare-fun m!1182655 () Bool)

(assert (=> mapNonEmpty!52919 m!1182655))

(check-sat (not start!109110) b_and!46689 (not b!1290074) tp_is_empty!34239 (not b!1290068) (not b!1290072) (not mapNonEmpty!52919) (not b!1290071) (not b_next!28599) (not b!1290069) (not b!1290076))
(check-sat b_and!46689 (not b_next!28599))
