; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109306 () Bool)

(assert start!109306)

(declare-fun b_free!28795 () Bool)

(declare-fun b_next!28795 () Bool)

(assert (=> start!109306 (= b_free!28795 (not b_next!28795))))

(declare-fun tp!101505 () Bool)

(declare-fun b_and!46867 () Bool)

(assert (=> start!109306 (= tp!101505 b_and!46867)))

(declare-fun b!1293448 () Bool)

(declare-fun res!859531 () Bool)

(declare-fun e!738181 () Bool)

(assert (=> b!1293448 (=> (not res!859531) (not e!738181))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85785 0))(
  ( (array!85786 (arr!41394 (Array (_ BitVec 32) (_ BitVec 64))) (size!41946 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85785)

(assert (=> b!1293448 (= res!859531 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41946 _keys!1741))))))

(declare-fun b!1293449 () Bool)

(declare-fun e!738185 () Bool)

(assert (=> b!1293449 (= e!738181 (not e!738185))))

(declare-fun res!859527 () Bool)

(assert (=> b!1293449 (=> res!859527 e!738185)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293449 (= res!859527 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!51017 0))(
  ( (V!51018 (val!17292 Int)) )
))
(declare-datatypes ((tuple2!22292 0))(
  ( (tuple2!22293 (_1!11157 (_ BitVec 64)) (_2!11157 V!51017)) )
))
(declare-datatypes ((List!29441 0))(
  ( (Nil!29438) (Cons!29437 (h!30646 tuple2!22292) (t!42997 List!29441)) )
))
(declare-datatypes ((ListLongMap!19949 0))(
  ( (ListLongMap!19950 (toList!9990 List!29441)) )
))
(declare-fun contains!8038 (ListLongMap!19949 (_ BitVec 64)) Bool)

(assert (=> b!1293449 (not (contains!8038 (ListLongMap!19950 Nil!29438) k0!1205))))

(declare-datatypes ((Unit!42658 0))(
  ( (Unit!42659) )
))
(declare-fun lt!579389 () Unit!42658)

(declare-fun emptyContainsNothing!123 ((_ BitVec 64)) Unit!42658)

(assert (=> b!1293449 (= lt!579389 (emptyContainsNothing!123 k0!1205))))

(declare-fun res!859530 () Bool)

(assert (=> start!109306 (=> (not res!859530) (not e!738181))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109306 (= res!859530 (validMask!0 mask!2175))))

(assert (=> start!109306 e!738181))

(declare-fun tp_is_empty!34435 () Bool)

(assert (=> start!109306 tp_is_empty!34435))

(assert (=> start!109306 true))

(declare-datatypes ((ValueCell!16319 0))(
  ( (ValueCellFull!16319 (v!19894 V!51017)) (EmptyCell!16319) )
))
(declare-datatypes ((array!85787 0))(
  ( (array!85788 (arr!41395 (Array (_ BitVec 32) ValueCell!16319)) (size!41947 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85787)

(declare-fun e!738184 () Bool)

(declare-fun array_inv!31517 (array!85787) Bool)

(assert (=> start!109306 (and (array_inv!31517 _values!1445) e!738184)))

(declare-fun array_inv!31518 (array!85785) Bool)

(assert (=> start!109306 (array_inv!31518 _keys!1741)))

(assert (=> start!109306 tp!101505))

(declare-fun b!1293450 () Bool)

(declare-fun res!859532 () Bool)

(assert (=> b!1293450 (=> (not res!859532) (not e!738181))))

(declare-fun minValue!1387 () V!51017)

(declare-fun zeroValue!1387 () V!51017)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4927 (array!85785 array!85787 (_ BitVec 32) (_ BitVec 32) V!51017 V!51017 (_ BitVec 32) Int) ListLongMap!19949)

(assert (=> b!1293450 (= res!859532 (contains!8038 (getCurrentListMap!4927 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293451 () Bool)

(declare-fun res!859528 () Bool)

(assert (=> b!1293451 (=> (not res!859528) (not e!738181))))

(declare-datatypes ((List!29442 0))(
  ( (Nil!29439) (Cons!29438 (h!30647 (_ BitVec 64)) (t!42998 List!29442)) )
))
(declare-fun arrayNoDuplicates!0 (array!85785 (_ BitVec 32) List!29442) Bool)

(assert (=> b!1293451 (= res!859528 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29439))))

(declare-fun b!1293452 () Bool)

(declare-fun res!859533 () Bool)

(assert (=> b!1293452 (=> (not res!859533) (not e!738181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293452 (= res!859533 (not (validKeyInArray!0 (select (arr!41394 _keys!1741) from!2144))))))

(declare-fun b!1293453 () Bool)

(declare-fun e!738186 () Bool)

(assert (=> b!1293453 (= e!738186 tp_is_empty!34435)))

(declare-fun mapIsEmpty!53213 () Bool)

(declare-fun mapRes!53213 () Bool)

(assert (=> mapIsEmpty!53213 mapRes!53213))

(declare-fun b!1293454 () Bool)

(declare-fun res!859529 () Bool)

(assert (=> b!1293454 (=> (not res!859529) (not e!738181))))

(assert (=> b!1293454 (= res!859529 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41946 _keys!1741))))))

(declare-fun b!1293455 () Bool)

(declare-fun res!859526 () Bool)

(assert (=> b!1293455 (=> (not res!859526) (not e!738181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85785 (_ BitVec 32)) Bool)

(assert (=> b!1293455 (= res!859526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293456 () Bool)

(declare-fun e!738182 () Bool)

(assert (=> b!1293456 (= e!738182 tp_is_empty!34435)))

(declare-fun mapNonEmpty!53213 () Bool)

(declare-fun tp!101504 () Bool)

(assert (=> mapNonEmpty!53213 (= mapRes!53213 (and tp!101504 e!738186))))

(declare-fun mapValue!53213 () ValueCell!16319)

(declare-fun mapRest!53213 () (Array (_ BitVec 32) ValueCell!16319))

(declare-fun mapKey!53213 () (_ BitVec 32))

(assert (=> mapNonEmpty!53213 (= (arr!41395 _values!1445) (store mapRest!53213 mapKey!53213 mapValue!53213))))

(declare-fun b!1293457 () Bool)

(assert (=> b!1293457 (= e!738185 true)))

(declare-fun lt!579390 () ListLongMap!19949)

(declare-fun +!4437 (ListLongMap!19949 tuple2!22292) ListLongMap!19949)

(assert (=> b!1293457 (not (contains!8038 (+!4437 lt!579390 (tuple2!22293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579391 () Unit!42658)

(declare-fun addStillNotContains!414 (ListLongMap!19949 (_ BitVec 64) V!51017 (_ BitVec 64)) Unit!42658)

(assert (=> b!1293457 (= lt!579391 (addStillNotContains!414 lt!579390 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6069 (array!85785 array!85787 (_ BitVec 32) (_ BitVec 32) V!51017 V!51017 (_ BitVec 32) Int) ListLongMap!19949)

(assert (=> b!1293457 (= lt!579390 (getCurrentListMapNoExtraKeys!6069 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293458 () Bool)

(declare-fun res!859525 () Bool)

(assert (=> b!1293458 (=> (not res!859525) (not e!738181))))

(assert (=> b!1293458 (= res!859525 (and (= (size!41947 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41946 _keys!1741) (size!41947 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293459 () Bool)

(assert (=> b!1293459 (= e!738184 (and e!738182 mapRes!53213))))

(declare-fun condMapEmpty!53213 () Bool)

(declare-fun mapDefault!53213 () ValueCell!16319)

(assert (=> b!1293459 (= condMapEmpty!53213 (= (arr!41395 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16319)) mapDefault!53213)))))

(assert (= (and start!109306 res!859530) b!1293458))

(assert (= (and b!1293458 res!859525) b!1293455))

(assert (= (and b!1293455 res!859526) b!1293451))

(assert (= (and b!1293451 res!859528) b!1293454))

(assert (= (and b!1293454 res!859529) b!1293450))

(assert (= (and b!1293450 res!859532) b!1293448))

(assert (= (and b!1293448 res!859531) b!1293452))

(assert (= (and b!1293452 res!859533) b!1293449))

(assert (= (and b!1293449 (not res!859527)) b!1293457))

(assert (= (and b!1293459 condMapEmpty!53213) mapIsEmpty!53213))

(assert (= (and b!1293459 (not condMapEmpty!53213)) mapNonEmpty!53213))

(get-info :version)

(assert (= (and mapNonEmpty!53213 ((_ is ValueCellFull!16319) mapValue!53213)) b!1293453))

(assert (= (and b!1293459 ((_ is ValueCellFull!16319) mapDefault!53213)) b!1293456))

(assert (= start!109306 b!1293459))

(declare-fun m!1185399 () Bool)

(assert (=> start!109306 m!1185399))

(declare-fun m!1185401 () Bool)

(assert (=> start!109306 m!1185401))

(declare-fun m!1185403 () Bool)

(assert (=> start!109306 m!1185403))

(declare-fun m!1185405 () Bool)

(assert (=> mapNonEmpty!53213 m!1185405))

(declare-fun m!1185407 () Bool)

(assert (=> b!1293451 m!1185407))

(declare-fun m!1185409 () Bool)

(assert (=> b!1293452 m!1185409))

(assert (=> b!1293452 m!1185409))

(declare-fun m!1185411 () Bool)

(assert (=> b!1293452 m!1185411))

(declare-fun m!1185413 () Bool)

(assert (=> b!1293455 m!1185413))

(declare-fun m!1185415 () Bool)

(assert (=> b!1293449 m!1185415))

(declare-fun m!1185417 () Bool)

(assert (=> b!1293449 m!1185417))

(declare-fun m!1185419 () Bool)

(assert (=> b!1293457 m!1185419))

(assert (=> b!1293457 m!1185419))

(declare-fun m!1185421 () Bool)

(assert (=> b!1293457 m!1185421))

(declare-fun m!1185423 () Bool)

(assert (=> b!1293457 m!1185423))

(declare-fun m!1185425 () Bool)

(assert (=> b!1293457 m!1185425))

(declare-fun m!1185427 () Bool)

(assert (=> b!1293450 m!1185427))

(assert (=> b!1293450 m!1185427))

(declare-fun m!1185429 () Bool)

(assert (=> b!1293450 m!1185429))

(check-sat (not b!1293451) tp_is_empty!34435 b_and!46867 (not b!1293449) (not b!1293455) (not b!1293457) (not b!1293452) (not mapNonEmpty!53213) (not b!1293450) (not start!109306) (not b_next!28795))
(check-sat b_and!46867 (not b_next!28795))
