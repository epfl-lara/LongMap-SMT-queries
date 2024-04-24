; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109338 () Bool)

(assert start!109338)

(declare-fun b_free!28603 () Bool)

(declare-fun b_next!28603 () Bool)

(assert (=> start!109338 (= b_free!28603 (not b_next!28603))))

(declare-fun tp!100928 () Bool)

(declare-fun b_and!46695 () Bool)

(assert (=> start!109338 (= tp!100928 b_and!46695)))

(declare-fun b!1291442 () Bool)

(declare-fun e!737410 () Bool)

(declare-fun e!737414 () Bool)

(declare-fun mapRes!52925 () Bool)

(assert (=> b!1291442 (= e!737410 (and e!737414 mapRes!52925))))

(declare-fun condMapEmpty!52925 () Bool)

(declare-datatypes ((V!50761 0))(
  ( (V!50762 (val!17196 Int)) )
))
(declare-datatypes ((ValueCell!16223 0))(
  ( (ValueCellFull!16223 (v!19794 V!50761)) (EmptyCell!16223) )
))
(declare-datatypes ((array!85565 0))(
  ( (array!85566 (arr!41279 (Array (_ BitVec 32) ValueCell!16223)) (size!41830 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85565)

(declare-fun mapDefault!52925 () ValueCell!16223)

(assert (=> b!1291442 (= condMapEmpty!52925 (= (arr!41279 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16223)) mapDefault!52925)))))

(declare-fun b!1291443 () Bool)

(declare-fun res!857561 () Bool)

(declare-fun e!737412 () Bool)

(assert (=> b!1291443 (=> (not res!857561) (not e!737412))))

(declare-fun minValue!1387 () V!50761)

(declare-fun zeroValue!1387 () V!50761)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85567 0))(
  ( (array!85568 (arr!41280 (Array (_ BitVec 32) (_ BitVec 64))) (size!41831 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85567)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22108 0))(
  ( (tuple2!22109 (_1!11065 (_ BitVec 64)) (_2!11065 V!50761)) )
))
(declare-datatypes ((List!29287 0))(
  ( (Nil!29284) (Cons!29283 (h!30501 tuple2!22108) (t!42843 List!29287)) )
))
(declare-datatypes ((ListLongMap!19773 0))(
  ( (ListLongMap!19774 (toList!9902 List!29287)) )
))
(declare-fun contains!8033 (ListLongMap!19773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4945 (array!85567 array!85565 (_ BitVec 32) (_ BitVec 32) V!50761 V!50761 (_ BitVec 32) Int) ListLongMap!19773)

(assert (=> b!1291443 (= res!857561 (contains!8033 (getCurrentListMap!4945 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291444 () Bool)

(declare-fun e!737411 () Bool)

(assert (=> b!1291444 (= e!737412 (not e!737411))))

(declare-fun res!857569 () Bool)

(assert (=> b!1291444 (=> res!857569 e!737411)))

(assert (=> b!1291444 (= res!857569 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291444 (not (contains!8033 (ListLongMap!19774 Nil!29284) k0!1205))))

(declare-datatypes ((Unit!42653 0))(
  ( (Unit!42654) )
))
(declare-fun lt!578974 () Unit!42653)

(declare-fun emptyContainsNothing!77 ((_ BitVec 64)) Unit!42653)

(assert (=> b!1291444 (= lt!578974 (emptyContainsNothing!77 k0!1205))))

(declare-fun res!857566 () Bool)

(assert (=> start!109338 (=> (not res!857566) (not e!737412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109338 (= res!857566 (validMask!0 mask!2175))))

(assert (=> start!109338 e!737412))

(declare-fun tp_is_empty!34243 () Bool)

(assert (=> start!109338 tp_is_empty!34243))

(assert (=> start!109338 true))

(declare-fun array_inv!31507 (array!85565) Bool)

(assert (=> start!109338 (and (array_inv!31507 _values!1445) e!737410)))

(declare-fun array_inv!31508 (array!85567) Bool)

(assert (=> start!109338 (array_inv!31508 _keys!1741)))

(assert (=> start!109338 tp!100928))

(declare-fun b!1291445 () Bool)

(declare-fun res!857564 () Bool)

(assert (=> b!1291445 (=> (not res!857564) (not e!737412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291445 (= res!857564 (not (validKeyInArray!0 (select (arr!41280 _keys!1741) from!2144))))))

(declare-fun b!1291446 () Bool)

(declare-fun res!857562 () Bool)

(assert (=> b!1291446 (=> (not res!857562) (not e!737412))))

(assert (=> b!1291446 (= res!857562 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41831 _keys!1741))))))

(declare-fun b!1291447 () Bool)

(declare-fun e!737413 () Bool)

(assert (=> b!1291447 (= e!737413 tp_is_empty!34243)))

(declare-fun b!1291448 () Bool)

(declare-fun res!857565 () Bool)

(assert (=> b!1291448 (=> (not res!857565) (not e!737412))))

(assert (=> b!1291448 (= res!857565 (and (= (size!41830 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41831 _keys!1741) (size!41830 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291449 () Bool)

(declare-fun res!857567 () Bool)

(assert (=> b!1291449 (=> (not res!857567) (not e!737412))))

(declare-datatypes ((List!29288 0))(
  ( (Nil!29285) (Cons!29284 (h!30502 (_ BitVec 64)) (t!42844 List!29288)) )
))
(declare-fun arrayNoDuplicates!0 (array!85567 (_ BitVec 32) List!29288) Bool)

(assert (=> b!1291449 (= res!857567 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29285))))

(declare-fun b!1291450 () Bool)

(declare-fun res!857563 () Bool)

(assert (=> b!1291450 (=> (not res!857563) (not e!737412))))

(assert (=> b!1291450 (= res!857563 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41831 _keys!1741))))))

(declare-fun mapNonEmpty!52925 () Bool)

(declare-fun tp!100927 () Bool)

(assert (=> mapNonEmpty!52925 (= mapRes!52925 (and tp!100927 e!737413))))

(declare-fun mapRest!52925 () (Array (_ BitVec 32) ValueCell!16223))

(declare-fun mapKey!52925 () (_ BitVec 32))

(declare-fun mapValue!52925 () ValueCell!16223)

(assert (=> mapNonEmpty!52925 (= (arr!41279 _values!1445) (store mapRest!52925 mapKey!52925 mapValue!52925))))

(declare-fun b!1291451 () Bool)

(declare-fun res!857568 () Bool)

(assert (=> b!1291451 (=> (not res!857568) (not e!737412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85567 (_ BitVec 32)) Bool)

(assert (=> b!1291451 (= res!857568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52925 () Bool)

(assert (=> mapIsEmpty!52925 mapRes!52925))

(declare-fun b!1291452 () Bool)

(assert (=> b!1291452 (= e!737411 true)))

(declare-fun lt!578975 () ListLongMap!19773)

(declare-fun +!4404 (ListLongMap!19773 tuple2!22108) ListLongMap!19773)

(assert (=> b!1291452 (not (contains!8033 (+!4404 lt!578975 (tuple2!22109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578973 () Unit!42653)

(declare-fun addStillNotContains!380 (ListLongMap!19773 (_ BitVec 64) V!50761 (_ BitVec 64)) Unit!42653)

(assert (=> b!1291452 (= lt!578973 (addStillNotContains!380 lt!578975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291452 (not (contains!8033 (+!4404 lt!578975 (tuple2!22109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578976 () Unit!42653)

(assert (=> b!1291452 (= lt!578976 (addStillNotContains!380 lt!578975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6042 (array!85567 array!85565 (_ BitVec 32) (_ BitVec 32) V!50761 V!50761 (_ BitVec 32) Int) ListLongMap!19773)

(assert (=> b!1291452 (= lt!578975 (getCurrentListMapNoExtraKeys!6042 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291453 () Bool)

(assert (=> b!1291453 (= e!737414 tp_is_empty!34243)))

(assert (= (and start!109338 res!857566) b!1291448))

(assert (= (and b!1291448 res!857565) b!1291451))

(assert (= (and b!1291451 res!857568) b!1291449))

(assert (= (and b!1291449 res!857567) b!1291450))

(assert (= (and b!1291450 res!857563) b!1291443))

(assert (= (and b!1291443 res!857561) b!1291446))

(assert (= (and b!1291446 res!857562) b!1291445))

(assert (= (and b!1291445 res!857564) b!1291444))

(assert (= (and b!1291444 (not res!857569)) b!1291452))

(assert (= (and b!1291442 condMapEmpty!52925) mapIsEmpty!52925))

(assert (= (and b!1291442 (not condMapEmpty!52925)) mapNonEmpty!52925))

(get-info :version)

(assert (= (and mapNonEmpty!52925 ((_ is ValueCellFull!16223) mapValue!52925)) b!1291447))

(assert (= (and b!1291442 ((_ is ValueCellFull!16223) mapDefault!52925)) b!1291453))

(assert (= start!109338 b!1291442))

(declare-fun m!1184313 () Bool)

(assert (=> start!109338 m!1184313))

(declare-fun m!1184315 () Bool)

(assert (=> start!109338 m!1184315))

(declare-fun m!1184317 () Bool)

(assert (=> start!109338 m!1184317))

(declare-fun m!1184319 () Bool)

(assert (=> b!1291443 m!1184319))

(assert (=> b!1291443 m!1184319))

(declare-fun m!1184321 () Bool)

(assert (=> b!1291443 m!1184321))

(declare-fun m!1184323 () Bool)

(assert (=> b!1291451 m!1184323))

(declare-fun m!1184325 () Bool)

(assert (=> mapNonEmpty!52925 m!1184325))

(declare-fun m!1184327 () Bool)

(assert (=> b!1291449 m!1184327))

(declare-fun m!1184329 () Bool)

(assert (=> b!1291452 m!1184329))

(declare-fun m!1184331 () Bool)

(assert (=> b!1291452 m!1184331))

(declare-fun m!1184333 () Bool)

(assert (=> b!1291452 m!1184333))

(declare-fun m!1184335 () Bool)

(assert (=> b!1291452 m!1184335))

(declare-fun m!1184337 () Bool)

(assert (=> b!1291452 m!1184337))

(declare-fun m!1184339 () Bool)

(assert (=> b!1291452 m!1184339))

(assert (=> b!1291452 m!1184331))

(declare-fun m!1184341 () Bool)

(assert (=> b!1291452 m!1184341))

(assert (=> b!1291452 m!1184337))

(declare-fun m!1184343 () Bool)

(assert (=> b!1291444 m!1184343))

(declare-fun m!1184345 () Bool)

(assert (=> b!1291444 m!1184345))

(declare-fun m!1184347 () Bool)

(assert (=> b!1291445 m!1184347))

(assert (=> b!1291445 m!1184347))

(declare-fun m!1184349 () Bool)

(assert (=> b!1291445 m!1184349))

(check-sat (not b!1291451) (not b!1291452) (not start!109338) (not b!1291443) (not mapNonEmpty!52925) (not b!1291449) (not b!1291445) (not b_next!28603) tp_is_empty!34243 b_and!46695 (not b!1291444))
(check-sat b_and!46695 (not b_next!28603))
