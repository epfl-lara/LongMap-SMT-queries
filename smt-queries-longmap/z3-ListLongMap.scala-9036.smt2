; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109000 () Bool)

(assert start!109000)

(declare-fun b_free!28489 () Bool)

(declare-fun b_next!28489 () Bool)

(assert (=> start!109000 (= b_free!28489 (not b_next!28489))))

(declare-fun tp!100586 () Bool)

(declare-fun b_and!46561 () Bool)

(assert (=> start!109000 (= tp!100586 b_and!46561)))

(declare-fun b!1288029 () Bool)

(declare-fun res!855483 () Bool)

(declare-fun e!735516 () Bool)

(assert (=> b!1288029 (=> (not res!855483) (not e!735516))))

(declare-datatypes ((array!85195 0))(
  ( (array!85196 (arr!41099 (Array (_ BitVec 32) (_ BitVec 64))) (size!41651 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85195)

(declare-datatypes ((List!29225 0))(
  ( (Nil!29222) (Cons!29221 (h!30430 (_ BitVec 64)) (t!42781 List!29225)) )
))
(declare-fun arrayNoDuplicates!0 (array!85195 (_ BitVec 32) List!29225) Bool)

(assert (=> b!1288029 (= res!855483 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29222))))

(declare-fun b!1288030 () Bool)

(declare-fun res!855489 () Bool)

(assert (=> b!1288030 (=> (not res!855489) (not e!735516))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1288030 (= res!855489 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41651 _keys!1741))))))

(declare-fun b!1288031 () Bool)

(declare-fun res!855486 () Bool)

(assert (=> b!1288031 (=> (not res!855486) (not e!735516))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1288031 (= res!855486 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41651 _keys!1741))))))

(declare-fun b!1288032 () Bool)

(declare-fun res!855482 () Bool)

(assert (=> b!1288032 (=> (not res!855482) (not e!735516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288032 (= res!855482 (not (validKeyInArray!0 (select (arr!41099 _keys!1741) from!2144))))))

(declare-fun b!1288033 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1288033 (= e!735516 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle from!2144 (size!41651 _keys!1741)))))))

(declare-datatypes ((V!50609 0))(
  ( (V!50610 (val!17139 Int)) )
))
(declare-datatypes ((tuple2!22054 0))(
  ( (tuple2!22055 (_1!11038 (_ BitVec 64)) (_2!11038 V!50609)) )
))
(declare-datatypes ((List!29226 0))(
  ( (Nil!29223) (Cons!29222 (h!30431 tuple2!22054) (t!42782 List!29226)) )
))
(declare-datatypes ((ListLongMap!19711 0))(
  ( (ListLongMap!19712 (toList!9871 List!29226)) )
))
(declare-fun contains!7919 (ListLongMap!19711 (_ BitVec 64)) Bool)

(assert (=> b!1288033 (not (contains!7919 (ListLongMap!19712 Nil!29223) k0!1205))))

(declare-datatypes ((Unit!42446 0))(
  ( (Unit!42447) )
))
(declare-fun lt!577747 () Unit!42446)

(declare-fun emptyContainsNothing!30 ((_ BitVec 64)) Unit!42446)

(assert (=> b!1288033 (= lt!577747 (emptyContainsNothing!30 k0!1205))))

(declare-fun mapIsEmpty!52754 () Bool)

(declare-fun mapRes!52754 () Bool)

(assert (=> mapIsEmpty!52754 mapRes!52754))

(declare-fun b!1288034 () Bool)

(declare-fun e!735517 () Bool)

(declare-fun tp_is_empty!34129 () Bool)

(assert (=> b!1288034 (= e!735517 tp_is_empty!34129)))

(declare-fun b!1288035 () Bool)

(declare-fun res!855484 () Bool)

(assert (=> b!1288035 (=> (not res!855484) (not e!735516))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16166 0))(
  ( (ValueCellFull!16166 (v!19741 V!50609)) (EmptyCell!16166) )
))
(declare-datatypes ((array!85197 0))(
  ( (array!85198 (arr!41100 (Array (_ BitVec 32) ValueCell!16166)) (size!41652 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85197)

(assert (=> b!1288035 (= res!855484 (and (= (size!41652 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41651 _keys!1741) (size!41652 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288036 () Bool)

(declare-fun res!855487 () Bool)

(assert (=> b!1288036 (=> (not res!855487) (not e!735516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85195 (_ BitVec 32)) Bool)

(assert (=> b!1288036 (= res!855487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288037 () Bool)

(declare-fun res!855485 () Bool)

(assert (=> b!1288037 (=> (not res!855485) (not e!735516))))

(declare-fun minValue!1387 () V!50609)

(declare-fun zeroValue!1387 () V!50609)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4830 (array!85195 array!85197 (_ BitVec 32) (_ BitVec 32) V!50609 V!50609 (_ BitVec 32) Int) ListLongMap!19711)

(assert (=> b!1288037 (= res!855485 (contains!7919 (getCurrentListMap!4830 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288028 () Bool)

(declare-fun e!735518 () Bool)

(assert (=> b!1288028 (= e!735518 tp_is_empty!34129)))

(declare-fun res!855488 () Bool)

(assert (=> start!109000 (=> (not res!855488) (not e!735516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109000 (= res!855488 (validMask!0 mask!2175))))

(assert (=> start!109000 e!735516))

(assert (=> start!109000 tp_is_empty!34129))

(assert (=> start!109000 true))

(declare-fun e!735519 () Bool)

(declare-fun array_inv!31321 (array!85197) Bool)

(assert (=> start!109000 (and (array_inv!31321 _values!1445) e!735519)))

(declare-fun array_inv!31322 (array!85195) Bool)

(assert (=> start!109000 (array_inv!31322 _keys!1741)))

(assert (=> start!109000 tp!100586))

(declare-fun mapNonEmpty!52754 () Bool)

(declare-fun tp!100587 () Bool)

(assert (=> mapNonEmpty!52754 (= mapRes!52754 (and tp!100587 e!735518))))

(declare-fun mapValue!52754 () ValueCell!16166)

(declare-fun mapRest!52754 () (Array (_ BitVec 32) ValueCell!16166))

(declare-fun mapKey!52754 () (_ BitVec 32))

(assert (=> mapNonEmpty!52754 (= (arr!41100 _values!1445) (store mapRest!52754 mapKey!52754 mapValue!52754))))

(declare-fun b!1288038 () Bool)

(assert (=> b!1288038 (= e!735519 (and e!735517 mapRes!52754))))

(declare-fun condMapEmpty!52754 () Bool)

(declare-fun mapDefault!52754 () ValueCell!16166)

(assert (=> b!1288038 (= condMapEmpty!52754 (= (arr!41100 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16166)) mapDefault!52754)))))

(assert (= (and start!109000 res!855488) b!1288035))

(assert (= (and b!1288035 res!855484) b!1288036))

(assert (= (and b!1288036 res!855487) b!1288029))

(assert (= (and b!1288029 res!855483) b!1288030))

(assert (= (and b!1288030 res!855489) b!1288037))

(assert (= (and b!1288037 res!855485) b!1288031))

(assert (= (and b!1288031 res!855486) b!1288032))

(assert (= (and b!1288032 res!855482) b!1288033))

(assert (= (and b!1288038 condMapEmpty!52754) mapIsEmpty!52754))

(assert (= (and b!1288038 (not condMapEmpty!52754)) mapNonEmpty!52754))

(get-info :version)

(assert (= (and mapNonEmpty!52754 ((_ is ValueCellFull!16166) mapValue!52754)) b!1288028))

(assert (= (and b!1288038 ((_ is ValueCellFull!16166) mapDefault!52754)) b!1288034))

(assert (= start!109000 b!1288038))

(declare-fun m!1180275 () Bool)

(assert (=> b!1288029 m!1180275))

(declare-fun m!1180277 () Bool)

(assert (=> b!1288032 m!1180277))

(assert (=> b!1288032 m!1180277))

(declare-fun m!1180279 () Bool)

(assert (=> b!1288032 m!1180279))

(declare-fun m!1180281 () Bool)

(assert (=> mapNonEmpty!52754 m!1180281))

(declare-fun m!1180283 () Bool)

(assert (=> b!1288033 m!1180283))

(declare-fun m!1180285 () Bool)

(assert (=> b!1288033 m!1180285))

(declare-fun m!1180287 () Bool)

(assert (=> b!1288036 m!1180287))

(declare-fun m!1180289 () Bool)

(assert (=> start!109000 m!1180289))

(declare-fun m!1180291 () Bool)

(assert (=> start!109000 m!1180291))

(declare-fun m!1180293 () Bool)

(assert (=> start!109000 m!1180293))

(declare-fun m!1180295 () Bool)

(assert (=> b!1288037 m!1180295))

(assert (=> b!1288037 m!1180295))

(declare-fun m!1180297 () Bool)

(assert (=> b!1288037 m!1180297))

(check-sat (not b!1288033) (not b!1288036) (not start!109000) (not b!1288037) (not b_next!28489) (not mapNonEmpty!52754) tp_is_empty!34129 (not b!1288029) b_and!46561 (not b!1288032))
(check-sat b_and!46561 (not b_next!28489))
