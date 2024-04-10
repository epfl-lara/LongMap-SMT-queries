; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109452 () Bool)

(assert start!109452)

(declare-fun b_free!28941 () Bool)

(declare-fun b_next!28941 () Bool)

(assert (=> start!109452 (= b_free!28941 (not b_next!28941))))

(declare-fun tp!101941 () Bool)

(declare-fun b_and!47031 () Bool)

(assert (=> start!109452 (= tp!101941 b_and!47031)))

(declare-fun mapIsEmpty!53432 () Bool)

(declare-fun mapRes!53432 () Bool)

(assert (=> mapIsEmpty!53432 mapRes!53432))

(declare-fun b!1296059 () Bool)

(declare-fun res!861444 () Bool)

(declare-fun e!739447 () Bool)

(assert (=> b!1296059 (=> (not res!861444) (not e!739447))))

(declare-datatypes ((array!86180 0))(
  ( (array!86181 (arr!41591 (Array (_ BitVec 32) (_ BitVec 64))) (size!42141 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86180)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86180 (_ BitVec 32)) Bool)

(assert (=> b!1296059 (= res!861444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296060 () Bool)

(declare-fun res!861450 () Bool)

(assert (=> b!1296060 (=> (not res!861450) (not e!739447))))

(declare-datatypes ((V!51211 0))(
  ( (V!51212 (val!17365 Int)) )
))
(declare-datatypes ((ValueCell!16392 0))(
  ( (ValueCellFull!16392 (v!19968 V!51211)) (EmptyCell!16392) )
))
(declare-datatypes ((array!86182 0))(
  ( (array!86183 (arr!41592 (Array (_ BitVec 32) ValueCell!16392)) (size!42142 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86182)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296060 (= res!861450 (and (= (size!42142 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42141 _keys!1741) (size!42142 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296061 () Bool)

(declare-fun e!739444 () Bool)

(declare-fun tp_is_empty!34581 () Bool)

(assert (=> b!1296061 (= e!739444 tp_is_empty!34581)))

(declare-fun b!1296062 () Bool)

(declare-fun res!861446 () Bool)

(assert (=> b!1296062 (=> (not res!861446) (not e!739447))))

(declare-datatypes ((List!29505 0))(
  ( (Nil!29502) (Cons!29501 (h!30710 (_ BitVec 64)) (t!43069 List!29505)) )
))
(declare-fun arrayNoDuplicates!0 (array!86180 (_ BitVec 32) List!29505) Bool)

(assert (=> b!1296062 (= res!861446 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29502))))

(declare-fun b!1296064 () Bool)

(declare-fun e!739443 () Bool)

(assert (=> b!1296064 (= e!739443 tp_is_empty!34581)))

(declare-fun b!1296065 () Bool)

(declare-fun res!861443 () Bool)

(assert (=> b!1296065 (=> (not res!861443) (not e!739447))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296065 (= res!861443 (not (validKeyInArray!0 (select (arr!41591 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53432 () Bool)

(declare-fun tp!101942 () Bool)

(assert (=> mapNonEmpty!53432 (= mapRes!53432 (and tp!101942 e!739444))))

(declare-fun mapKey!53432 () (_ BitVec 32))

(declare-fun mapRest!53432 () (Array (_ BitVec 32) ValueCell!16392))

(declare-fun mapValue!53432 () ValueCell!16392)

(assert (=> mapNonEmpty!53432 (= (arr!41592 _values!1445) (store mapRest!53432 mapKey!53432 mapValue!53432))))

(declare-fun b!1296066 () Bool)

(declare-fun res!861442 () Bool)

(assert (=> b!1296066 (=> (not res!861442) (not e!739447))))

(declare-fun minValue!1387 () V!51211)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!51211)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22364 0))(
  ( (tuple2!22365 (_1!11193 (_ BitVec 64)) (_2!11193 V!51211)) )
))
(declare-datatypes ((List!29506 0))(
  ( (Nil!29503) (Cons!29502 (h!30711 tuple2!22364) (t!43070 List!29506)) )
))
(declare-datatypes ((ListLongMap!20021 0))(
  ( (ListLongMap!20022 (toList!10026 List!29506)) )
))
(declare-fun contains!8144 (ListLongMap!20021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5059 (array!86180 array!86182 (_ BitVec 32) (_ BitVec 32) V!51211 V!51211 (_ BitVec 32) Int) ListLongMap!20021)

(assert (=> b!1296066 (= res!861442 (contains!8144 (getCurrentListMap!5059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296067 () Bool)

(declare-fun e!739448 () Bool)

(assert (=> b!1296067 (= e!739448 (and e!739443 mapRes!53432))))

(declare-fun condMapEmpty!53432 () Bool)

(declare-fun mapDefault!53432 () ValueCell!16392)

(assert (=> b!1296067 (= condMapEmpty!53432 (= (arr!41592 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16392)) mapDefault!53432)))))

(declare-fun b!1296068 () Bool)

(declare-fun res!861449 () Bool)

(assert (=> b!1296068 (=> (not res!861449) (not e!739447))))

(assert (=> b!1296068 (= res!861449 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42141 _keys!1741))))))

(declare-fun b!1296069 () Bool)

(declare-fun res!861448 () Bool)

(assert (=> b!1296069 (=> (not res!861448) (not e!739447))))

(assert (=> b!1296069 (= res!861448 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42141 _keys!1741))))))

(declare-fun b!1296070 () Bool)

(declare-fun e!739445 () Bool)

(assert (=> b!1296070 (= e!739447 (not e!739445))))

(declare-fun res!861445 () Bool)

(assert (=> b!1296070 (=> res!861445 e!739445)))

(assert (=> b!1296070 (= res!861445 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296070 (not (contains!8144 (ListLongMap!20022 Nil!29503) k0!1205))))

(declare-datatypes ((Unit!42930 0))(
  ( (Unit!42931) )
))
(declare-fun lt!580053 () Unit!42930)

(declare-fun emptyContainsNothing!184 ((_ BitVec 64)) Unit!42930)

(assert (=> b!1296070 (= lt!580053 (emptyContainsNothing!184 k0!1205))))

(declare-fun b!1296063 () Bool)

(assert (=> b!1296063 (= e!739445 true)))

(declare-fun lt!580054 () ListLongMap!20021)

(declare-fun +!4429 (ListLongMap!20021 tuple2!22364) ListLongMap!20021)

(assert (=> b!1296063 (not (contains!8144 (+!4429 lt!580054 (tuple2!22365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580055 () Unit!42930)

(declare-fun addStillNotContains!447 (ListLongMap!20021 (_ BitVec 64) V!51211 (_ BitVec 64)) Unit!42930)

(assert (=> b!1296063 (= lt!580055 (addStillNotContains!447 lt!580054 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6062 (array!86180 array!86182 (_ BitVec 32) (_ BitVec 32) V!51211 V!51211 (_ BitVec 32) Int) ListLongMap!20021)

(assert (=> b!1296063 (= lt!580054 (getCurrentListMapNoExtraKeys!6062 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!861447 () Bool)

(assert (=> start!109452 (=> (not res!861447) (not e!739447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109452 (= res!861447 (validMask!0 mask!2175))))

(assert (=> start!109452 e!739447))

(assert (=> start!109452 tp_is_empty!34581))

(assert (=> start!109452 true))

(declare-fun array_inv!31485 (array!86182) Bool)

(assert (=> start!109452 (and (array_inv!31485 _values!1445) e!739448)))

(declare-fun array_inv!31486 (array!86180) Bool)

(assert (=> start!109452 (array_inv!31486 _keys!1741)))

(assert (=> start!109452 tp!101941))

(assert (= (and start!109452 res!861447) b!1296060))

(assert (= (and b!1296060 res!861450) b!1296059))

(assert (= (and b!1296059 res!861444) b!1296062))

(assert (= (and b!1296062 res!861446) b!1296068))

(assert (= (and b!1296068 res!861449) b!1296066))

(assert (= (and b!1296066 res!861442) b!1296069))

(assert (= (and b!1296069 res!861448) b!1296065))

(assert (= (and b!1296065 res!861443) b!1296070))

(assert (= (and b!1296070 (not res!861445)) b!1296063))

(assert (= (and b!1296067 condMapEmpty!53432) mapIsEmpty!53432))

(assert (= (and b!1296067 (not condMapEmpty!53432)) mapNonEmpty!53432))

(get-info :version)

(assert (= (and mapNonEmpty!53432 ((_ is ValueCellFull!16392) mapValue!53432)) b!1296061))

(assert (= (and b!1296067 ((_ is ValueCellFull!16392) mapDefault!53432)) b!1296064))

(assert (= start!109452 b!1296067))

(declare-fun m!1188007 () Bool)

(assert (=> start!109452 m!1188007))

(declare-fun m!1188009 () Bool)

(assert (=> start!109452 m!1188009))

(declare-fun m!1188011 () Bool)

(assert (=> start!109452 m!1188011))

(declare-fun m!1188013 () Bool)

(assert (=> b!1296066 m!1188013))

(assert (=> b!1296066 m!1188013))

(declare-fun m!1188015 () Bool)

(assert (=> b!1296066 m!1188015))

(declare-fun m!1188017 () Bool)

(assert (=> mapNonEmpty!53432 m!1188017))

(declare-fun m!1188019 () Bool)

(assert (=> b!1296070 m!1188019))

(declare-fun m!1188021 () Bool)

(assert (=> b!1296070 m!1188021))

(declare-fun m!1188023 () Bool)

(assert (=> b!1296062 m!1188023))

(declare-fun m!1188025 () Bool)

(assert (=> b!1296059 m!1188025))

(declare-fun m!1188027 () Bool)

(assert (=> b!1296065 m!1188027))

(assert (=> b!1296065 m!1188027))

(declare-fun m!1188029 () Bool)

(assert (=> b!1296065 m!1188029))

(declare-fun m!1188031 () Bool)

(assert (=> b!1296063 m!1188031))

(assert (=> b!1296063 m!1188031))

(declare-fun m!1188033 () Bool)

(assert (=> b!1296063 m!1188033))

(declare-fun m!1188035 () Bool)

(assert (=> b!1296063 m!1188035))

(declare-fun m!1188037 () Bool)

(assert (=> b!1296063 m!1188037))

(check-sat (not b!1296065) (not b!1296070) (not b_next!28941) (not start!109452) (not b!1296059) (not b!1296066) b_and!47031 (not b!1296063) (not b!1296062) tp_is_empty!34581 (not mapNonEmpty!53432))
(check-sat b_and!47031 (not b_next!28941))
