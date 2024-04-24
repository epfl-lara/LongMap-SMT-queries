; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109536 () Bool)

(assert start!109536)

(declare-fun b_free!28801 () Bool)

(declare-fun b_next!28801 () Bool)

(assert (=> start!109536 (= b_free!28801 (not b_next!28801))))

(declare-fun tp!101521 () Bool)

(declare-fun b_and!46893 () Bool)

(assert (=> start!109536 (= tp!101521 b_and!46893)))

(declare-fun b!1294925 () Bool)

(declare-fun res!860159 () Bool)

(declare-fun e!739116 () Bool)

(assert (=> b!1294925 (=> (not res!860159) (not e!739116))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85939 0))(
  ( (array!85940 (arr!41466 (Array (_ BitVec 32) (_ BitVec 64))) (size!42017 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85939)

(assert (=> b!1294925 (= res!860159 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42017 _keys!1741))))))

(declare-fun b!1294926 () Bool)

(declare-fun e!739115 () Bool)

(declare-fun tp_is_empty!34441 () Bool)

(assert (=> b!1294926 (= e!739115 tp_is_empty!34441)))

(declare-fun b!1294927 () Bool)

(declare-fun e!739111 () Bool)

(assert (=> b!1294927 (= e!739111 tp_is_empty!34441)))

(declare-fun b!1294928 () Bool)

(declare-fun res!860160 () Bool)

(assert (=> b!1294928 (=> (not res!860160) (not e!739116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294928 (= res!860160 (not (validKeyInArray!0 (select (arr!41466 _keys!1741) from!2144))))))

(declare-fun b!1294929 () Bool)

(declare-fun res!860156 () Bool)

(assert (=> b!1294929 (=> (not res!860156) (not e!739116))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51025 0))(
  ( (V!51026 (val!17295 Int)) )
))
(declare-datatypes ((ValueCell!16322 0))(
  ( (ValueCellFull!16322 (v!19893 V!51025)) (EmptyCell!16322) )
))
(declare-datatypes ((array!85941 0))(
  ( (array!85942 (arr!41467 (Array (_ BitVec 32) ValueCell!16322)) (size!42018 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85941)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294929 (= res!860156 (and (= (size!42018 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42017 _keys!1741) (size!42018 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53222 () Bool)

(declare-fun mapRes!53222 () Bool)

(declare-fun tp!101522 () Bool)

(assert (=> mapNonEmpty!53222 (= mapRes!53222 (and tp!101522 e!739111))))

(declare-fun mapKey!53222 () (_ BitVec 32))

(declare-fun mapRest!53222 () (Array (_ BitVec 32) ValueCell!16322))

(declare-fun mapValue!53222 () ValueCell!16322)

(assert (=> mapNonEmpty!53222 (= (arr!41467 _values!1445) (store mapRest!53222 mapKey!53222 mapValue!53222))))

(declare-fun b!1294930 () Bool)

(declare-fun res!860153 () Bool)

(assert (=> b!1294930 (=> (not res!860153) (not e!739116))))

(declare-fun minValue!1387 () V!51025)

(declare-fun zeroValue!1387 () V!51025)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22266 0))(
  ( (tuple2!22267 (_1!11144 (_ BitVec 64)) (_2!11144 V!51025)) )
))
(declare-datatypes ((List!29433 0))(
  ( (Nil!29430) (Cons!29429 (h!30647 tuple2!22266) (t!42989 List!29433)) )
))
(declare-datatypes ((ListLongMap!19931 0))(
  ( (ListLongMap!19932 (toList!9981 List!29433)) )
))
(declare-fun contains!8112 (ListLongMap!19931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5010 (array!85939 array!85941 (_ BitVec 32) (_ BitVec 32) V!51025 V!51025 (_ BitVec 32) Int) ListLongMap!19931)

(assert (=> b!1294930 (= res!860153 (contains!8112 (getCurrentListMap!5010 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294931 () Bool)

(declare-fun res!860154 () Bool)

(assert (=> b!1294931 (=> (not res!860154) (not e!739116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85939 (_ BitVec 32)) Bool)

(assert (=> b!1294931 (= res!860154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294932 () Bool)

(declare-fun res!860158 () Bool)

(assert (=> b!1294932 (=> (not res!860158) (not e!739116))))

(declare-datatypes ((List!29434 0))(
  ( (Nil!29431) (Cons!29430 (h!30648 (_ BitVec 64)) (t!42990 List!29434)) )
))
(declare-fun arrayNoDuplicates!0 (array!85939 (_ BitVec 32) List!29434) Bool)

(assert (=> b!1294932 (= res!860158 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29431))))

(declare-fun mapIsEmpty!53222 () Bool)

(assert (=> mapIsEmpty!53222 mapRes!53222))

(declare-fun res!860155 () Bool)

(assert (=> start!109536 (=> (not res!860155) (not e!739116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109536 (= res!860155 (validMask!0 mask!2175))))

(assert (=> start!109536 e!739116))

(assert (=> start!109536 tp_is_empty!34441))

(assert (=> start!109536 true))

(declare-fun e!739112 () Bool)

(declare-fun array_inv!31641 (array!85941) Bool)

(assert (=> start!109536 (and (array_inv!31641 _values!1445) e!739112)))

(declare-fun array_inv!31642 (array!85939) Bool)

(assert (=> start!109536 (array_inv!31642 _keys!1741)))

(assert (=> start!109536 tp!101521))

(declare-fun b!1294933 () Bool)

(declare-fun e!739114 () Bool)

(assert (=> b!1294933 (= e!739114 (bvsle from!2144 (size!42017 _keys!1741)))))

(declare-fun lt!580078 () ListLongMap!19931)

(declare-fun +!4450 (ListLongMap!19931 tuple2!22266) ListLongMap!19931)

(assert (=> b!1294933 (not (contains!8112 (+!4450 lt!580078 (tuple2!22267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42799 0))(
  ( (Unit!42800) )
))
(declare-fun lt!580079 () Unit!42799)

(declare-fun addStillNotContains!426 (ListLongMap!19931 (_ BitVec 64) V!51025 (_ BitVec 64)) Unit!42799)

(assert (=> b!1294933 (= lt!580079 (addStillNotContains!426 lt!580078 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6090 (array!85939 array!85941 (_ BitVec 32) (_ BitVec 32) V!51025 V!51025 (_ BitVec 32) Int) ListLongMap!19931)

(assert (=> b!1294933 (= lt!580078 (getCurrentListMapNoExtraKeys!6090 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294934 () Bool)

(declare-fun res!860157 () Bool)

(assert (=> b!1294934 (=> (not res!860157) (not e!739116))))

(assert (=> b!1294934 (= res!860157 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42017 _keys!1741))))))

(declare-fun b!1294935 () Bool)

(assert (=> b!1294935 (= e!739112 (and e!739115 mapRes!53222))))

(declare-fun condMapEmpty!53222 () Bool)

(declare-fun mapDefault!53222 () ValueCell!16322)

(assert (=> b!1294935 (= condMapEmpty!53222 (= (arr!41467 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16322)) mapDefault!53222)))))

(declare-fun b!1294936 () Bool)

(assert (=> b!1294936 (= e!739116 (not e!739114))))

(declare-fun res!860161 () Bool)

(assert (=> b!1294936 (=> res!860161 e!739114)))

(assert (=> b!1294936 (= res!860161 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1294936 (not (contains!8112 (ListLongMap!19932 Nil!29430) k0!1205))))

(declare-fun lt!580080 () Unit!42799)

(declare-fun emptyContainsNothing!142 ((_ BitVec 64)) Unit!42799)

(assert (=> b!1294936 (= lt!580080 (emptyContainsNothing!142 k0!1205))))

(assert (= (and start!109536 res!860155) b!1294929))

(assert (= (and b!1294929 res!860156) b!1294931))

(assert (= (and b!1294931 res!860154) b!1294932))

(assert (= (and b!1294932 res!860158) b!1294934))

(assert (= (and b!1294934 res!860157) b!1294930))

(assert (= (and b!1294930 res!860153) b!1294925))

(assert (= (and b!1294925 res!860159) b!1294928))

(assert (= (and b!1294928 res!860160) b!1294936))

(assert (= (and b!1294936 (not res!860161)) b!1294933))

(assert (= (and b!1294935 condMapEmpty!53222) mapIsEmpty!53222))

(assert (= (and b!1294935 (not condMapEmpty!53222)) mapNonEmpty!53222))

(get-info :version)

(assert (= (and mapNonEmpty!53222 ((_ is ValueCellFull!16322) mapValue!53222)) b!1294927))

(assert (= (and b!1294935 ((_ is ValueCellFull!16322) mapDefault!53222)) b!1294926))

(assert (= start!109536 b!1294935))

(declare-fun m!1187613 () Bool)

(assert (=> start!109536 m!1187613))

(declare-fun m!1187615 () Bool)

(assert (=> start!109536 m!1187615))

(declare-fun m!1187617 () Bool)

(assert (=> start!109536 m!1187617))

(declare-fun m!1187619 () Bool)

(assert (=> b!1294933 m!1187619))

(assert (=> b!1294933 m!1187619))

(declare-fun m!1187621 () Bool)

(assert (=> b!1294933 m!1187621))

(declare-fun m!1187623 () Bool)

(assert (=> b!1294933 m!1187623))

(declare-fun m!1187625 () Bool)

(assert (=> b!1294933 m!1187625))

(declare-fun m!1187627 () Bool)

(assert (=> b!1294931 m!1187627))

(declare-fun m!1187629 () Bool)

(assert (=> mapNonEmpty!53222 m!1187629))

(declare-fun m!1187631 () Bool)

(assert (=> b!1294928 m!1187631))

(assert (=> b!1294928 m!1187631))

(declare-fun m!1187633 () Bool)

(assert (=> b!1294928 m!1187633))

(declare-fun m!1187635 () Bool)

(assert (=> b!1294930 m!1187635))

(assert (=> b!1294930 m!1187635))

(declare-fun m!1187637 () Bool)

(assert (=> b!1294930 m!1187637))

(declare-fun m!1187639 () Bool)

(assert (=> b!1294936 m!1187639))

(declare-fun m!1187641 () Bool)

(assert (=> b!1294936 m!1187641))

(declare-fun m!1187643 () Bool)

(assert (=> b!1294932 m!1187643))

(check-sat (not b!1294928) (not mapNonEmpty!53222) (not b!1294933) tp_is_empty!34441 (not b_next!28801) (not b!1294932) (not b!1294930) (not start!109536) (not b!1294936) b_and!46893 (not b!1294931))
(check-sat b_and!46893 (not b_next!28801))
