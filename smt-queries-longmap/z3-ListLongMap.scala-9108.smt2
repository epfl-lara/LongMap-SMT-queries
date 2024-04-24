; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109656 () Bool)

(assert start!109656)

(declare-fun b_free!28921 () Bool)

(declare-fun b_next!28921 () Bool)

(assert (=> start!109656 (= b_free!28921 (not b_next!28921))))

(declare-fun tp!101882 () Bool)

(declare-fun b_and!47013 () Bool)

(assert (=> start!109656 (= tp!101882 b_and!47013)))

(declare-fun b!1297004 () Bool)

(declare-fun res!861697 () Bool)

(declare-fun e!740111 () Bool)

(assert (=> b!1297004 (=> (not res!861697) (not e!740111))))

(declare-datatypes ((array!86175 0))(
  ( (array!86176 (arr!41584 (Array (_ BitVec 32) (_ BitVec 64))) (size!42135 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86175)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1297004 (= res!861697 (not (validKeyInArray!0 (select (arr!41584 _keys!1741) from!2144))))))

(declare-fun b!1297005 () Bool)

(declare-fun e!740112 () Bool)

(declare-fun tp_is_empty!34561 () Bool)

(assert (=> b!1297005 (= e!740112 tp_is_empty!34561)))

(declare-fun b!1297006 () Bool)

(declare-fun res!861700 () Bool)

(assert (=> b!1297006 (=> (not res!861700) (not e!740111))))

(assert (=> b!1297006 (= res!861700 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42135 _keys!1741))))))

(declare-fun mapIsEmpty!53402 () Bool)

(declare-fun mapRes!53402 () Bool)

(assert (=> mapIsEmpty!53402 mapRes!53402))

(declare-fun b!1297007 () Bool)

(declare-fun res!861692 () Bool)

(assert (=> b!1297007 (=> (not res!861692) (not e!740111))))

(declare-datatypes ((V!51185 0))(
  ( (V!51186 (val!17355 Int)) )
))
(declare-datatypes ((ValueCell!16382 0))(
  ( (ValueCellFull!16382 (v!19953 V!51185)) (EmptyCell!16382) )
))
(declare-datatypes ((array!86177 0))(
  ( (array!86178 (arr!41585 (Array (_ BitVec 32) ValueCell!16382)) (size!42136 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86177)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1297007 (= res!861692 (and (= (size!42136 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42135 _keys!1741) (size!42136 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297008 () Bool)

(declare-fun e!740115 () Bool)

(assert (=> b!1297008 (= e!740115 true)))

(declare-datatypes ((tuple2!22354 0))(
  ( (tuple2!22355 (_1!11188 (_ BitVec 64)) (_2!11188 V!51185)) )
))
(declare-datatypes ((List!29521 0))(
  ( (Nil!29518) (Cons!29517 (h!30735 tuple2!22354) (t!43077 List!29521)) )
))
(declare-datatypes ((ListLongMap!20019 0))(
  ( (ListLongMap!20020 (toList!10025 List!29521)) )
))
(declare-fun lt!580447 () ListLongMap!20019)

(declare-fun minValue!1387 () V!51185)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8156 (ListLongMap!20019 (_ BitVec 64)) Bool)

(declare-fun +!4469 (ListLongMap!20019 tuple2!22354) ListLongMap!20019)

(assert (=> b!1297008 (not (contains!8156 (+!4469 lt!580447 (tuple2!22355 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42881 0))(
  ( (Unit!42882) )
))
(declare-fun lt!580449 () Unit!42881)

(declare-fun addStillNotContains!445 (ListLongMap!20019 (_ BitVec 64) V!51185 (_ BitVec 64)) Unit!42881)

(assert (=> b!1297008 (= lt!580449 (addStillNotContains!445 lt!580447 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51185)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6111 (array!86175 array!86177 (_ BitVec 32) (_ BitVec 32) V!51185 V!51185 (_ BitVec 32) Int) ListLongMap!20019)

(assert (=> b!1297008 (= lt!580447 (getCurrentListMapNoExtraKeys!6111 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1297009 () Bool)

(declare-fun res!861696 () Bool)

(assert (=> b!1297009 (=> (not res!861696) (not e!740111))))

(declare-datatypes ((List!29522 0))(
  ( (Nil!29519) (Cons!29518 (h!30736 (_ BitVec 64)) (t!43078 List!29522)) )
))
(declare-fun arrayNoDuplicates!0 (array!86175 (_ BitVec 32) List!29522) Bool)

(assert (=> b!1297009 (= res!861696 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29519))))

(declare-fun b!1297010 () Bool)

(assert (=> b!1297010 (= e!740111 (not e!740115))))

(declare-fun res!861699 () Bool)

(assert (=> b!1297010 (=> res!861699 e!740115)))

(assert (=> b!1297010 (= res!861699 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1297010 (not (contains!8156 (ListLongMap!20020 Nil!29518) k0!1205))))

(declare-fun lt!580448 () Unit!42881)

(declare-fun emptyContainsNothing!183 ((_ BitVec 64)) Unit!42881)

(assert (=> b!1297010 (= lt!580448 (emptyContainsNothing!183 k0!1205))))

(declare-fun res!861695 () Bool)

(assert (=> start!109656 (=> (not res!861695) (not e!740111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109656 (= res!861695 (validMask!0 mask!2175))))

(assert (=> start!109656 e!740111))

(assert (=> start!109656 tp_is_empty!34561))

(assert (=> start!109656 true))

(declare-fun e!740113 () Bool)

(declare-fun array_inv!31715 (array!86177) Bool)

(assert (=> start!109656 (and (array_inv!31715 _values!1445) e!740113)))

(declare-fun array_inv!31716 (array!86175) Bool)

(assert (=> start!109656 (array_inv!31716 _keys!1741)))

(assert (=> start!109656 tp!101882))

(declare-fun b!1297011 () Bool)

(assert (=> b!1297011 (= e!740113 (and e!740112 mapRes!53402))))

(declare-fun condMapEmpty!53402 () Bool)

(declare-fun mapDefault!53402 () ValueCell!16382)

(assert (=> b!1297011 (= condMapEmpty!53402 (= (arr!41585 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16382)) mapDefault!53402)))))

(declare-fun b!1297012 () Bool)

(declare-fun res!861693 () Bool)

(assert (=> b!1297012 (=> (not res!861693) (not e!740111))))

(assert (=> b!1297012 (= res!861693 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42135 _keys!1741))))))

(declare-fun b!1297013 () Bool)

(declare-fun res!861698 () Bool)

(assert (=> b!1297013 (=> (not res!861698) (not e!740111))))

(declare-fun getCurrentListMap!5047 (array!86175 array!86177 (_ BitVec 32) (_ BitVec 32) V!51185 V!51185 (_ BitVec 32) Int) ListLongMap!20019)

(assert (=> b!1297013 (= res!861698 (contains!8156 (getCurrentListMap!5047 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297014 () Bool)

(declare-fun e!740110 () Bool)

(assert (=> b!1297014 (= e!740110 tp_is_empty!34561)))

(declare-fun mapNonEmpty!53402 () Bool)

(declare-fun tp!101881 () Bool)

(assert (=> mapNonEmpty!53402 (= mapRes!53402 (and tp!101881 e!740110))))

(declare-fun mapValue!53402 () ValueCell!16382)

(declare-fun mapKey!53402 () (_ BitVec 32))

(declare-fun mapRest!53402 () (Array (_ BitVec 32) ValueCell!16382))

(assert (=> mapNonEmpty!53402 (= (arr!41585 _values!1445) (store mapRest!53402 mapKey!53402 mapValue!53402))))

(declare-fun b!1297015 () Bool)

(declare-fun res!861694 () Bool)

(assert (=> b!1297015 (=> (not res!861694) (not e!740111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86175 (_ BitVec 32)) Bool)

(assert (=> b!1297015 (= res!861694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109656 res!861695) b!1297007))

(assert (= (and b!1297007 res!861692) b!1297015))

(assert (= (and b!1297015 res!861694) b!1297009))

(assert (= (and b!1297009 res!861696) b!1297006))

(assert (= (and b!1297006 res!861700) b!1297013))

(assert (= (and b!1297013 res!861698) b!1297012))

(assert (= (and b!1297012 res!861693) b!1297004))

(assert (= (and b!1297004 res!861697) b!1297010))

(assert (= (and b!1297010 (not res!861699)) b!1297008))

(assert (= (and b!1297011 condMapEmpty!53402) mapIsEmpty!53402))

(assert (= (and b!1297011 (not condMapEmpty!53402)) mapNonEmpty!53402))

(get-info :version)

(assert (= (and mapNonEmpty!53402 ((_ is ValueCellFull!16382) mapValue!53402)) b!1297014))

(assert (= (and b!1297011 ((_ is ValueCellFull!16382) mapDefault!53402)) b!1297005))

(assert (= start!109656 b!1297011))

(declare-fun m!1189305 () Bool)

(assert (=> b!1297015 m!1189305))

(declare-fun m!1189307 () Bool)

(assert (=> mapNonEmpty!53402 m!1189307))

(declare-fun m!1189309 () Bool)

(assert (=> b!1297010 m!1189309))

(declare-fun m!1189311 () Bool)

(assert (=> b!1297010 m!1189311))

(declare-fun m!1189313 () Bool)

(assert (=> start!109656 m!1189313))

(declare-fun m!1189315 () Bool)

(assert (=> start!109656 m!1189315))

(declare-fun m!1189317 () Bool)

(assert (=> start!109656 m!1189317))

(declare-fun m!1189319 () Bool)

(assert (=> b!1297008 m!1189319))

(assert (=> b!1297008 m!1189319))

(declare-fun m!1189321 () Bool)

(assert (=> b!1297008 m!1189321))

(declare-fun m!1189323 () Bool)

(assert (=> b!1297008 m!1189323))

(declare-fun m!1189325 () Bool)

(assert (=> b!1297008 m!1189325))

(declare-fun m!1189327 () Bool)

(assert (=> b!1297013 m!1189327))

(assert (=> b!1297013 m!1189327))

(declare-fun m!1189329 () Bool)

(assert (=> b!1297013 m!1189329))

(declare-fun m!1189331 () Bool)

(assert (=> b!1297009 m!1189331))

(declare-fun m!1189333 () Bool)

(assert (=> b!1297004 m!1189333))

(assert (=> b!1297004 m!1189333))

(declare-fun m!1189335 () Bool)

(assert (=> b!1297004 m!1189335))

(check-sat (not b!1297010) (not start!109656) b_and!47013 (not b!1297015) (not b!1297008) tp_is_empty!34561 (not b_next!28921) (not b!1297004) (not mapNonEmpty!53402) (not b!1297013) (not b!1297009))
(check-sat b_and!47013 (not b_next!28921))
