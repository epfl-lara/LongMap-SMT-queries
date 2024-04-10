; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109416 () Bool)

(assert start!109416)

(declare-fun b_free!28905 () Bool)

(declare-fun b_next!28905 () Bool)

(assert (=> start!109416 (= b_free!28905 (not b_next!28905))))

(declare-fun tp!101833 () Bool)

(declare-fun b_and!46995 () Bool)

(assert (=> start!109416 (= tp!101833 b_and!46995)))

(declare-fun b!1295411 () Bool)

(declare-fun e!739120 () Bool)

(assert (=> b!1295411 (= e!739120 true)))

(declare-datatypes ((V!51163 0))(
  ( (V!51164 (val!17347 Int)) )
))
(declare-datatypes ((tuple2!22338 0))(
  ( (tuple2!22339 (_1!11180 (_ BitVec 64)) (_2!11180 V!51163)) )
))
(declare-datatypes ((List!29480 0))(
  ( (Nil!29477) (Cons!29476 (h!30685 tuple2!22338) (t!43044 List!29480)) )
))
(declare-datatypes ((ListLongMap!19995 0))(
  ( (ListLongMap!19996 (toList!10013 List!29480)) )
))
(declare-fun lt!579892 () ListLongMap!19995)

(declare-fun minValue!1387 () V!51163)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8131 (ListLongMap!19995 (_ BitVec 64)) Bool)

(declare-fun +!4419 (ListLongMap!19995 tuple2!22338) ListLongMap!19995)

(assert (=> b!1295411 (not (contains!8131 (+!4419 lt!579892 (tuple2!22339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42906 0))(
  ( (Unit!42907) )
))
(declare-fun lt!579893 () Unit!42906)

(declare-fun addStillNotContains!437 (ListLongMap!19995 (_ BitVec 64) V!51163 (_ BitVec 64)) Unit!42906)

(assert (=> b!1295411 (= lt!579893 (addStillNotContains!437 lt!579892 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51163)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16374 0))(
  ( (ValueCellFull!16374 (v!19950 V!51163)) (EmptyCell!16374) )
))
(declare-datatypes ((array!86110 0))(
  ( (array!86111 (arr!41556 (Array (_ BitVec 32) ValueCell!16374)) (size!42106 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86110)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86112 0))(
  ( (array!86113 (arr!41557 (Array (_ BitVec 32) (_ BitVec 64))) (size!42107 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86112)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6052 (array!86112 array!86110 (_ BitVec 32) (_ BitVec 32) V!51163 V!51163 (_ BitVec 32) Int) ListLongMap!19995)

(assert (=> b!1295411 (= lt!579892 (getCurrentListMapNoExtraKeys!6052 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295412 () Bool)

(declare-fun e!739124 () Bool)

(declare-fun tp_is_empty!34545 () Bool)

(assert (=> b!1295412 (= e!739124 tp_is_empty!34545)))

(declare-fun b!1295413 () Bool)

(declare-fun res!860962 () Bool)

(declare-fun e!739122 () Bool)

(assert (=> b!1295413 (=> (not res!860962) (not e!739122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295413 (= res!860962 (not (validKeyInArray!0 (select (arr!41557 _keys!1741) from!2144))))))

(declare-fun b!1295414 () Bool)

(declare-fun res!860961 () Bool)

(assert (=> b!1295414 (=> (not res!860961) (not e!739122))))

(assert (=> b!1295414 (= res!860961 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42107 _keys!1741))))))

(declare-fun res!860963 () Bool)

(assert (=> start!109416 (=> (not res!860963) (not e!739122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109416 (= res!860963 (validMask!0 mask!2175))))

(assert (=> start!109416 e!739122))

(assert (=> start!109416 tp_is_empty!34545))

(assert (=> start!109416 true))

(declare-fun e!739121 () Bool)

(declare-fun array_inv!31465 (array!86110) Bool)

(assert (=> start!109416 (and (array_inv!31465 _values!1445) e!739121)))

(declare-fun array_inv!31466 (array!86112) Bool)

(assert (=> start!109416 (array_inv!31466 _keys!1741)))

(assert (=> start!109416 tp!101833))

(declare-fun b!1295415 () Bool)

(declare-fun res!860958 () Bool)

(assert (=> b!1295415 (=> (not res!860958) (not e!739122))))

(assert (=> b!1295415 (= res!860958 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42107 _keys!1741))))))

(declare-fun b!1295416 () Bool)

(declare-fun res!860960 () Bool)

(assert (=> b!1295416 (=> (not res!860960) (not e!739122))))

(assert (=> b!1295416 (= res!860960 (and (= (size!42106 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42107 _keys!1741) (size!42106 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295417 () Bool)

(declare-fun mapRes!53378 () Bool)

(assert (=> b!1295417 (= e!739121 (and e!739124 mapRes!53378))))

(declare-fun condMapEmpty!53378 () Bool)

(declare-fun mapDefault!53378 () ValueCell!16374)

(assert (=> b!1295417 (= condMapEmpty!53378 (= (arr!41556 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16374)) mapDefault!53378)))))

(declare-fun b!1295418 () Bool)

(declare-fun res!860959 () Bool)

(assert (=> b!1295418 (=> (not res!860959) (not e!739122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86112 (_ BitVec 32)) Bool)

(assert (=> b!1295418 (= res!860959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295419 () Bool)

(declare-fun res!860964 () Bool)

(assert (=> b!1295419 (=> (not res!860964) (not e!739122))))

(declare-datatypes ((List!29481 0))(
  ( (Nil!29478) (Cons!29477 (h!30686 (_ BitVec 64)) (t!43045 List!29481)) )
))
(declare-fun arrayNoDuplicates!0 (array!86112 (_ BitVec 32) List!29481) Bool)

(assert (=> b!1295419 (= res!860964 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29478))))

(declare-fun mapNonEmpty!53378 () Bool)

(declare-fun tp!101834 () Bool)

(declare-fun e!739123 () Bool)

(assert (=> mapNonEmpty!53378 (= mapRes!53378 (and tp!101834 e!739123))))

(declare-fun mapValue!53378 () ValueCell!16374)

(declare-fun mapKey!53378 () (_ BitVec 32))

(declare-fun mapRest!53378 () (Array (_ BitVec 32) ValueCell!16374))

(assert (=> mapNonEmpty!53378 (= (arr!41556 _values!1445) (store mapRest!53378 mapKey!53378 mapValue!53378))))

(declare-fun mapIsEmpty!53378 () Bool)

(assert (=> mapIsEmpty!53378 mapRes!53378))

(declare-fun b!1295420 () Bool)

(assert (=> b!1295420 (= e!739123 tp_is_empty!34545)))

(declare-fun b!1295421 () Bool)

(declare-fun res!860956 () Bool)

(assert (=> b!1295421 (=> (not res!860956) (not e!739122))))

(declare-fun getCurrentListMap!5047 (array!86112 array!86110 (_ BitVec 32) (_ BitVec 32) V!51163 V!51163 (_ BitVec 32) Int) ListLongMap!19995)

(assert (=> b!1295421 (= res!860956 (contains!8131 (getCurrentListMap!5047 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295422 () Bool)

(assert (=> b!1295422 (= e!739122 (not e!739120))))

(declare-fun res!860957 () Bool)

(assert (=> b!1295422 (=> res!860957 e!739120)))

(assert (=> b!1295422 (= res!860957 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295422 (not (contains!8131 (ListLongMap!19996 Nil!29477) k0!1205))))

(declare-fun lt!579891 () Unit!42906)

(declare-fun emptyContainsNothing!172 ((_ BitVec 64)) Unit!42906)

(assert (=> b!1295422 (= lt!579891 (emptyContainsNothing!172 k0!1205))))

(assert (= (and start!109416 res!860963) b!1295416))

(assert (= (and b!1295416 res!860960) b!1295418))

(assert (= (and b!1295418 res!860959) b!1295419))

(assert (= (and b!1295419 res!860964) b!1295414))

(assert (= (and b!1295414 res!860961) b!1295421))

(assert (= (and b!1295421 res!860956) b!1295415))

(assert (= (and b!1295415 res!860958) b!1295413))

(assert (= (and b!1295413 res!860962) b!1295422))

(assert (= (and b!1295422 (not res!860957)) b!1295411))

(assert (= (and b!1295417 condMapEmpty!53378) mapIsEmpty!53378))

(assert (= (and b!1295417 (not condMapEmpty!53378)) mapNonEmpty!53378))

(get-info :version)

(assert (= (and mapNonEmpty!53378 ((_ is ValueCellFull!16374) mapValue!53378)) b!1295420))

(assert (= (and b!1295417 ((_ is ValueCellFull!16374) mapDefault!53378)) b!1295412))

(assert (= start!109416 b!1295417))

(declare-fun m!1187431 () Bool)

(assert (=> b!1295419 m!1187431))

(declare-fun m!1187433 () Bool)

(assert (=> b!1295411 m!1187433))

(assert (=> b!1295411 m!1187433))

(declare-fun m!1187435 () Bool)

(assert (=> b!1295411 m!1187435))

(declare-fun m!1187437 () Bool)

(assert (=> b!1295411 m!1187437))

(declare-fun m!1187439 () Bool)

(assert (=> b!1295411 m!1187439))

(declare-fun m!1187441 () Bool)

(assert (=> b!1295418 m!1187441))

(declare-fun m!1187443 () Bool)

(assert (=> b!1295413 m!1187443))

(assert (=> b!1295413 m!1187443))

(declare-fun m!1187445 () Bool)

(assert (=> b!1295413 m!1187445))

(declare-fun m!1187447 () Bool)

(assert (=> b!1295422 m!1187447))

(declare-fun m!1187449 () Bool)

(assert (=> b!1295422 m!1187449))

(declare-fun m!1187451 () Bool)

(assert (=> b!1295421 m!1187451))

(assert (=> b!1295421 m!1187451))

(declare-fun m!1187453 () Bool)

(assert (=> b!1295421 m!1187453))

(declare-fun m!1187455 () Bool)

(assert (=> mapNonEmpty!53378 m!1187455))

(declare-fun m!1187457 () Bool)

(assert (=> start!109416 m!1187457))

(declare-fun m!1187459 () Bool)

(assert (=> start!109416 m!1187459))

(declare-fun m!1187461 () Bool)

(assert (=> start!109416 m!1187461))

(check-sat (not b!1295418) b_and!46995 (not start!109416) tp_is_empty!34545 (not b!1295421) (not b!1295419) (not b_next!28905) (not b!1295422) (not mapNonEmpty!53378) (not b!1295411) (not b!1295413))
(check-sat b_and!46995 (not b_next!28905))
