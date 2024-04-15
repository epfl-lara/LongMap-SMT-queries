; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109348 () Bool)

(assert start!109348)

(declare-fun b_free!28837 () Bool)

(declare-fun b_next!28837 () Bool)

(assert (=> start!109348 (= b_free!28837 (not b_next!28837))))

(declare-fun tp!101630 () Bool)

(declare-fun b_and!46909 () Bool)

(assert (=> start!109348 (= tp!101630 b_and!46909)))

(declare-fun b!1294175 () Bool)

(declare-fun res!860065 () Bool)

(declare-fun e!738533 () Bool)

(assert (=> b!1294175 (=> (not res!860065) (not e!738533))))

(declare-datatypes ((array!85867 0))(
  ( (array!85868 (arr!41435 (Array (_ BitVec 32) (_ BitVec 64))) (size!41987 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85867)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294175 (= res!860065 (not (validKeyInArray!0 (select (arr!41435 _keys!1741) from!2144))))))

(declare-fun b!1294176 () Bool)

(declare-fun res!860068 () Bool)

(assert (=> b!1294176 (=> (not res!860068) (not e!738533))))

(declare-datatypes ((List!29470 0))(
  ( (Nil!29467) (Cons!29466 (h!30675 (_ BitVec 64)) (t!43026 List!29470)) )
))
(declare-fun arrayNoDuplicates!0 (array!85867 (_ BitVec 32) List!29470) Bool)

(assert (=> b!1294176 (= res!860068 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29467))))

(declare-fun b!1294177 () Bool)

(declare-fun e!738534 () Bool)

(declare-fun tp_is_empty!34477 () Bool)

(assert (=> b!1294177 (= e!738534 tp_is_empty!34477)))

(declare-fun b!1294178 () Bool)

(declare-fun res!860067 () Bool)

(assert (=> b!1294178 (=> (not res!860067) (not e!738533))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85867 (_ BitVec 32)) Bool)

(assert (=> b!1294178 (= res!860067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294179 () Bool)

(assert (=> b!1294179 (= e!738533 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51073 0))(
  ( (V!51074 (val!17313 Int)) )
))
(declare-datatypes ((tuple2!22328 0))(
  ( (tuple2!22329 (_1!11175 (_ BitVec 64)) (_2!11175 V!51073)) )
))
(declare-datatypes ((List!29471 0))(
  ( (Nil!29468) (Cons!29467 (h!30676 tuple2!22328) (t!43027 List!29471)) )
))
(declare-datatypes ((ListLongMap!19985 0))(
  ( (ListLongMap!19986 (toList!10008 List!29471)) )
))
(declare-fun contains!8056 (ListLongMap!19985 (_ BitVec 64)) Bool)

(assert (=> b!1294179 (not (contains!8056 (ListLongMap!19986 Nil!29468) k0!1205))))

(declare-datatypes ((Unit!42692 0))(
  ( (Unit!42693) )
))
(declare-fun lt!579520 () Unit!42692)

(declare-fun emptyContainsNothing!139 ((_ BitVec 64)) Unit!42692)

(assert (=> b!1294179 (= lt!579520 (emptyContainsNothing!139 k0!1205))))

(declare-fun b!1294180 () Bool)

(declare-fun res!860069 () Bool)

(assert (=> b!1294180 (=> (not res!860069) (not e!738533))))

(declare-datatypes ((ValueCell!16340 0))(
  ( (ValueCellFull!16340 (v!19915 V!51073)) (EmptyCell!16340) )
))
(declare-datatypes ((array!85869 0))(
  ( (array!85870 (arr!41436 (Array (_ BitVec 32) ValueCell!16340)) (size!41988 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85869)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294180 (= res!860069 (and (= (size!41988 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41987 _keys!1741) (size!41988 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294181 () Bool)

(declare-fun e!738531 () Bool)

(assert (=> b!1294181 (= e!738531 tp_is_empty!34477)))

(declare-fun res!860066 () Bool)

(assert (=> start!109348 (=> (not res!860066) (not e!738533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109348 (= res!860066 (validMask!0 mask!2175))))

(assert (=> start!109348 e!738533))

(assert (=> start!109348 tp_is_empty!34477))

(assert (=> start!109348 true))

(declare-fun e!738530 () Bool)

(declare-fun array_inv!31543 (array!85869) Bool)

(assert (=> start!109348 (and (array_inv!31543 _values!1445) e!738530)))

(declare-fun array_inv!31544 (array!85867) Bool)

(assert (=> start!109348 (array_inv!31544 _keys!1741)))

(assert (=> start!109348 tp!101630))

(declare-fun b!1294182 () Bool)

(declare-fun res!860064 () Bool)

(assert (=> b!1294182 (=> (not res!860064) (not e!738533))))

(declare-fun minValue!1387 () V!51073)

(declare-fun zeroValue!1387 () V!51073)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4939 (array!85867 array!85869 (_ BitVec 32) (_ BitVec 32) V!51073 V!51073 (_ BitVec 32) Int) ListLongMap!19985)

(assert (=> b!1294182 (= res!860064 (contains!8056 (getCurrentListMap!4939 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294183 () Bool)

(declare-fun res!860063 () Bool)

(assert (=> b!1294183 (=> (not res!860063) (not e!738533))))

(assert (=> b!1294183 (= res!860063 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41987 _keys!1741))))))

(declare-fun b!1294184 () Bool)

(declare-fun res!860070 () Bool)

(assert (=> b!1294184 (=> (not res!860070) (not e!738533))))

(assert (=> b!1294184 (= res!860070 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41987 _keys!1741))))))

(declare-fun b!1294185 () Bool)

(declare-fun mapRes!53276 () Bool)

(assert (=> b!1294185 (= e!738530 (and e!738531 mapRes!53276))))

(declare-fun condMapEmpty!53276 () Bool)

(declare-fun mapDefault!53276 () ValueCell!16340)

(assert (=> b!1294185 (= condMapEmpty!53276 (= (arr!41436 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16340)) mapDefault!53276)))))

(declare-fun mapIsEmpty!53276 () Bool)

(assert (=> mapIsEmpty!53276 mapRes!53276))

(declare-fun mapNonEmpty!53276 () Bool)

(declare-fun tp!101631 () Bool)

(assert (=> mapNonEmpty!53276 (= mapRes!53276 (and tp!101631 e!738534))))

(declare-fun mapValue!53276 () ValueCell!16340)

(declare-fun mapRest!53276 () (Array (_ BitVec 32) ValueCell!16340))

(declare-fun mapKey!53276 () (_ BitVec 32))

(assert (=> mapNonEmpty!53276 (= (arr!41436 _values!1445) (store mapRest!53276 mapKey!53276 mapValue!53276))))

(assert (= (and start!109348 res!860066) b!1294180))

(assert (= (and b!1294180 res!860069) b!1294178))

(assert (= (and b!1294178 res!860067) b!1294176))

(assert (= (and b!1294176 res!860068) b!1294183))

(assert (= (and b!1294183 res!860063) b!1294182))

(assert (= (and b!1294182 res!860064) b!1294184))

(assert (= (and b!1294184 res!860070) b!1294175))

(assert (= (and b!1294175 res!860065) b!1294179))

(assert (= (and b!1294185 condMapEmpty!53276) mapIsEmpty!53276))

(assert (= (and b!1294185 (not condMapEmpty!53276)) mapNonEmpty!53276))

(get-info :version)

(assert (= (and mapNonEmpty!53276 ((_ is ValueCellFull!16340) mapValue!53276)) b!1294177))

(assert (= (and b!1294185 ((_ is ValueCellFull!16340) mapDefault!53276)) b!1294181))

(assert (= start!109348 b!1294185))

(declare-fun m!1185999 () Bool)

(assert (=> b!1294176 m!1185999))

(declare-fun m!1186001 () Bool)

(assert (=> mapNonEmpty!53276 m!1186001))

(declare-fun m!1186003 () Bool)

(assert (=> b!1294178 m!1186003))

(declare-fun m!1186005 () Bool)

(assert (=> b!1294179 m!1186005))

(declare-fun m!1186007 () Bool)

(assert (=> b!1294179 m!1186007))

(declare-fun m!1186009 () Bool)

(assert (=> b!1294182 m!1186009))

(assert (=> b!1294182 m!1186009))

(declare-fun m!1186011 () Bool)

(assert (=> b!1294182 m!1186011))

(declare-fun m!1186013 () Bool)

(assert (=> start!109348 m!1186013))

(declare-fun m!1186015 () Bool)

(assert (=> start!109348 m!1186015))

(declare-fun m!1186017 () Bool)

(assert (=> start!109348 m!1186017))

(declare-fun m!1186019 () Bool)

(assert (=> b!1294175 m!1186019))

(assert (=> b!1294175 m!1186019))

(declare-fun m!1186021 () Bool)

(assert (=> b!1294175 m!1186021))

(check-sat (not b_next!28837) (not b!1294176) (not b!1294179) (not start!109348) tp_is_empty!34477 (not b!1294175) (not b!1294182) (not b!1294178) b_and!46909 (not mapNonEmpty!53276))
(check-sat b_and!46909 (not b_next!28837))
