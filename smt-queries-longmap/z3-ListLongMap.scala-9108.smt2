; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109432 () Bool)

(assert start!109432)

(declare-fun b_free!28921 () Bool)

(declare-fun b_next!28921 () Bool)

(assert (=> start!109432 (= b_free!28921 (not b_next!28921))))

(declare-fun tp!101883 () Bool)

(declare-fun b_and!46993 () Bool)

(assert (=> start!109432 (= tp!101883 b_and!46993)))

(declare-fun mapNonEmpty!53402 () Bool)

(declare-fun mapRes!53402 () Bool)

(declare-fun tp!101882 () Bool)

(declare-fun e!739237 () Bool)

(assert (=> mapNonEmpty!53402 (= mapRes!53402 (and tp!101882 e!739237))))

(declare-datatypes ((V!51185 0))(
  ( (V!51186 (val!17355 Int)) )
))
(declare-datatypes ((ValueCell!16382 0))(
  ( (ValueCellFull!16382 (v!19957 V!51185)) (EmptyCell!16382) )
))
(declare-fun mapRest!53402 () (Array (_ BitVec 32) ValueCell!16382))

(declare-fun mapValue!53402 () ValueCell!16382)

(declare-datatypes ((array!86033 0))(
  ( (array!86034 (arr!41518 (Array (_ BitVec 32) ValueCell!16382)) (size!42070 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86033)

(declare-fun mapKey!53402 () (_ BitVec 32))

(assert (=> mapNonEmpty!53402 (= (arr!41518 _values!1445) (store mapRest!53402 mapKey!53402 mapValue!53402))))

(declare-fun b!1295635 () Bool)

(declare-fun res!861146 () Bool)

(declare-fun e!739236 () Bool)

(assert (=> b!1295635 (=> (not res!861146) (not e!739236))))

(declare-datatypes ((array!86035 0))(
  ( (array!86036 (arr!41519 (Array (_ BitVec 32) (_ BitVec 64))) (size!42071 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86035)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86035 (_ BitVec 32)) Bool)

(assert (=> b!1295635 (= res!861146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295636 () Bool)

(declare-fun e!739239 () Bool)

(declare-fun tp_is_empty!34561 () Bool)

(assert (=> b!1295636 (= e!739239 tp_is_empty!34561)))

(declare-fun b!1295637 () Bool)

(declare-fun res!861145 () Bool)

(assert (=> b!1295637 (=> (not res!861145) (not e!739236))))

(declare-fun minValue!1387 () V!51185)

(declare-fun zeroValue!1387 () V!51185)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22400 0))(
  ( (tuple2!22401 (_1!11211 (_ BitVec 64)) (_2!11211 V!51185)) )
))
(declare-datatypes ((List!29533 0))(
  ( (Nil!29530) (Cons!29529 (h!30738 tuple2!22400) (t!43089 List!29533)) )
))
(declare-datatypes ((ListLongMap!20057 0))(
  ( (ListLongMap!20058 (toList!10044 List!29533)) )
))
(declare-fun contains!8092 (ListLongMap!20057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4968 (array!86035 array!86033 (_ BitVec 32) (_ BitVec 32) V!51185 V!51185 (_ BitVec 32) Int) ListLongMap!20057)

(assert (=> b!1295637 (= res!861145 (contains!8092 (getCurrentListMap!4968 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53402 () Bool)

(assert (=> mapIsEmpty!53402 mapRes!53402))

(declare-fun b!1295638 () Bool)

(assert (=> b!1295638 (= e!739237 tp_is_empty!34561)))

(declare-fun b!1295639 () Bool)

(declare-fun res!861151 () Bool)

(assert (=> b!1295639 (=> (not res!861151) (not e!739236))))

(assert (=> b!1295639 (= res!861151 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42071 _keys!1741))))))

(declare-fun res!861147 () Bool)

(assert (=> start!109432 (=> (not res!861147) (not e!739236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109432 (= res!861147 (validMask!0 mask!2175))))

(assert (=> start!109432 e!739236))

(assert (=> start!109432 tp_is_empty!34561))

(assert (=> start!109432 true))

(declare-fun e!739238 () Bool)

(declare-fun array_inv!31597 (array!86033) Bool)

(assert (=> start!109432 (and (array_inv!31597 _values!1445) e!739238)))

(declare-fun array_inv!31598 (array!86035) Bool)

(assert (=> start!109432 (array_inv!31598 _keys!1741)))

(assert (=> start!109432 tp!101883))

(declare-fun b!1295640 () Bool)

(declare-fun e!739235 () Bool)

(assert (=> b!1295640 (= e!739236 (not e!739235))))

(declare-fun res!861149 () Bool)

(assert (=> b!1295640 (=> res!861149 e!739235)))

(assert (=> b!1295640 (= res!861149 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295640 (not (contains!8092 (ListLongMap!20058 Nil!29530) k0!1205))))

(declare-datatypes ((Unit!42758 0))(
  ( (Unit!42759) )
))
(declare-fun lt!579785 () Unit!42758)

(declare-fun emptyContainsNothing!171 ((_ BitVec 64)) Unit!42758)

(assert (=> b!1295640 (= lt!579785 (emptyContainsNothing!171 k0!1205))))

(declare-fun b!1295641 () Bool)

(declare-fun res!861150 () Bool)

(assert (=> b!1295641 (=> (not res!861150) (not e!739236))))

(assert (=> b!1295641 (= res!861150 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42071 _keys!1741))))))

(declare-fun b!1295642 () Bool)

(declare-fun res!861153 () Bool)

(assert (=> b!1295642 (=> (not res!861153) (not e!739236))))

(assert (=> b!1295642 (= res!861153 (and (= (size!42070 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42071 _keys!1741) (size!42070 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295643 () Bool)

(declare-fun res!861148 () Bool)

(assert (=> b!1295643 (=> (not res!861148) (not e!739236))))

(declare-datatypes ((List!29534 0))(
  ( (Nil!29531) (Cons!29530 (h!30739 (_ BitVec 64)) (t!43090 List!29534)) )
))
(declare-fun arrayNoDuplicates!0 (array!86035 (_ BitVec 32) List!29534) Bool)

(assert (=> b!1295643 (= res!861148 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29531))))

(declare-fun b!1295644 () Bool)

(assert (=> b!1295644 (= e!739238 (and e!739239 mapRes!53402))))

(declare-fun condMapEmpty!53402 () Bool)

(declare-fun mapDefault!53402 () ValueCell!16382)

(assert (=> b!1295644 (= condMapEmpty!53402 (= (arr!41518 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16382)) mapDefault!53402)))))

(declare-fun b!1295645 () Bool)

(assert (=> b!1295645 (= e!739235 true)))

(declare-fun lt!579786 () ListLongMap!20057)

(declare-fun +!4458 (ListLongMap!20057 tuple2!22400) ListLongMap!20057)

(assert (=> b!1295645 (not (contains!8092 (+!4458 lt!579786 (tuple2!22401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579787 () Unit!42758)

(declare-fun addStillNotContains!435 (ListLongMap!20057 (_ BitVec 64) V!51185 (_ BitVec 64)) Unit!42758)

(assert (=> b!1295645 (= lt!579787 (addStillNotContains!435 lt!579786 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6092 (array!86035 array!86033 (_ BitVec 32) (_ BitVec 32) V!51185 V!51185 (_ BitVec 32) Int) ListLongMap!20057)

(assert (=> b!1295645 (= lt!579786 (getCurrentListMapNoExtraKeys!6092 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295646 () Bool)

(declare-fun res!861152 () Bool)

(assert (=> b!1295646 (=> (not res!861152) (not e!739236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295646 (= res!861152 (not (validKeyInArray!0 (select (arr!41519 _keys!1741) from!2144))))))

(assert (= (and start!109432 res!861147) b!1295642))

(assert (= (and b!1295642 res!861153) b!1295635))

(assert (= (and b!1295635 res!861146) b!1295643))

(assert (= (and b!1295643 res!861148) b!1295639))

(assert (= (and b!1295639 res!861151) b!1295637))

(assert (= (and b!1295637 res!861145) b!1295641))

(assert (= (and b!1295641 res!861150) b!1295646))

(assert (= (and b!1295646 res!861152) b!1295640))

(assert (= (and b!1295640 (not res!861149)) b!1295645))

(assert (= (and b!1295644 condMapEmpty!53402) mapIsEmpty!53402))

(assert (= (and b!1295644 (not condMapEmpty!53402)) mapNonEmpty!53402))

(get-info :version)

(assert (= (and mapNonEmpty!53402 ((_ is ValueCellFull!16382) mapValue!53402)) b!1295638))

(assert (= (and b!1295644 ((_ is ValueCellFull!16382) mapDefault!53402)) b!1295636))

(assert (= start!109432 b!1295644))

(declare-fun m!1187187 () Bool)

(assert (=> b!1295640 m!1187187))

(declare-fun m!1187189 () Bool)

(assert (=> b!1295640 m!1187189))

(declare-fun m!1187191 () Bool)

(assert (=> b!1295646 m!1187191))

(assert (=> b!1295646 m!1187191))

(declare-fun m!1187193 () Bool)

(assert (=> b!1295646 m!1187193))

(declare-fun m!1187195 () Bool)

(assert (=> b!1295637 m!1187195))

(assert (=> b!1295637 m!1187195))

(declare-fun m!1187197 () Bool)

(assert (=> b!1295637 m!1187197))

(declare-fun m!1187199 () Bool)

(assert (=> start!109432 m!1187199))

(declare-fun m!1187201 () Bool)

(assert (=> start!109432 m!1187201))

(declare-fun m!1187203 () Bool)

(assert (=> start!109432 m!1187203))

(declare-fun m!1187205 () Bool)

(assert (=> mapNonEmpty!53402 m!1187205))

(declare-fun m!1187207 () Bool)

(assert (=> b!1295635 m!1187207))

(declare-fun m!1187209 () Bool)

(assert (=> b!1295643 m!1187209))

(declare-fun m!1187211 () Bool)

(assert (=> b!1295645 m!1187211))

(assert (=> b!1295645 m!1187211))

(declare-fun m!1187213 () Bool)

(assert (=> b!1295645 m!1187213))

(declare-fun m!1187215 () Bool)

(assert (=> b!1295645 m!1187215))

(declare-fun m!1187217 () Bool)

(assert (=> b!1295645 m!1187217))

(check-sat (not start!109432) (not mapNonEmpty!53402) b_and!46993 (not b_next!28921) (not b!1295645) (not b!1295635) tp_is_empty!34561 (not b!1295637) (not b!1295646) (not b!1295643) (not b!1295640))
(check-sat b_and!46993 (not b_next!28921))
