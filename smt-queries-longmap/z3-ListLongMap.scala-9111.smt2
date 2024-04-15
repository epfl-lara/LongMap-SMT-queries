; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109450 () Bool)

(assert start!109450)

(declare-fun b_free!28939 () Bool)

(declare-fun b_next!28939 () Bool)

(assert (=> start!109450 (= b_free!28939 (not b_next!28939))))

(declare-fun tp!101936 () Bool)

(declare-fun b_and!47011 () Bool)

(assert (=> start!109450 (= tp!101936 b_and!47011)))

(declare-fun b!1295959 () Bool)

(declare-fun e!739396 () Bool)

(declare-fun tp_is_empty!34579 () Bool)

(assert (=> b!1295959 (= e!739396 tp_is_empty!34579)))

(declare-fun b!1295960 () Bool)

(declare-fun e!739397 () Bool)

(declare-fun mapRes!53429 () Bool)

(assert (=> b!1295960 (= e!739397 (and e!739396 mapRes!53429))))

(declare-fun condMapEmpty!53429 () Bool)

(declare-datatypes ((V!51209 0))(
  ( (V!51210 (val!17364 Int)) )
))
(declare-datatypes ((ValueCell!16391 0))(
  ( (ValueCellFull!16391 (v!19966 V!51209)) (EmptyCell!16391) )
))
(declare-datatypes ((array!86069 0))(
  ( (array!86070 (arr!41536 (Array (_ BitVec 32) ValueCell!16391)) (size!42088 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86069)

(declare-fun mapDefault!53429 () ValueCell!16391)

(assert (=> b!1295960 (= condMapEmpty!53429 (= (arr!41536 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16391)) mapDefault!53429)))))

(declare-fun b!1295961 () Bool)

(declare-fun res!861389 () Bool)

(declare-fun e!739398 () Bool)

(assert (=> b!1295961 (=> (not res!861389) (not e!739398))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86071 0))(
  ( (array!86072 (arr!41537 (Array (_ BitVec 32) (_ BitVec 64))) (size!42089 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86071)

(assert (=> b!1295961 (= res!861389 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42089 _keys!1741))))))

(declare-fun b!1295962 () Bool)

(declare-fun e!739401 () Bool)

(assert (=> b!1295962 (= e!739398 (not e!739401))))

(declare-fun res!861394 () Bool)

(assert (=> b!1295962 (=> res!861394 e!739401)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295962 (= res!861394 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22418 0))(
  ( (tuple2!22419 (_1!11220 (_ BitVec 64)) (_2!11220 V!51209)) )
))
(declare-datatypes ((List!29548 0))(
  ( (Nil!29545) (Cons!29544 (h!30753 tuple2!22418) (t!43104 List!29548)) )
))
(declare-datatypes ((ListLongMap!20075 0))(
  ( (ListLongMap!20076 (toList!10053 List!29548)) )
))
(declare-fun contains!8101 (ListLongMap!20075 (_ BitVec 64)) Bool)

(assert (=> b!1295962 (not (contains!8101 (ListLongMap!20076 Nil!29545) k0!1205))))

(declare-datatypes ((Unit!42774 0))(
  ( (Unit!42775) )
))
(declare-fun lt!579866 () Unit!42774)

(declare-fun emptyContainsNothing!179 ((_ BitVec 64)) Unit!42774)

(assert (=> b!1295962 (= lt!579866 (emptyContainsNothing!179 k0!1205))))

(declare-fun b!1295963 () Bool)

(declare-fun res!861390 () Bool)

(assert (=> b!1295963 (=> (not res!861390) (not e!739398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295963 (= res!861390 (not (validKeyInArray!0 (select (arr!41537 _keys!1741) from!2144))))))

(declare-fun b!1295964 () Bool)

(declare-fun e!739399 () Bool)

(assert (=> b!1295964 (= e!739399 tp_is_empty!34579)))

(declare-fun b!1295965 () Bool)

(declare-fun res!861396 () Bool)

(assert (=> b!1295965 (=> (not res!861396) (not e!739398))))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1295965 (= res!861396 (and (= (size!42088 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42089 _keys!1741) (size!42088 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295966 () Bool)

(declare-fun res!861395 () Bool)

(assert (=> b!1295966 (=> (not res!861395) (not e!739398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86071 (_ BitVec 32)) Bool)

(assert (=> b!1295966 (= res!861395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53429 () Bool)

(assert (=> mapIsEmpty!53429 mapRes!53429))

(declare-fun res!861393 () Bool)

(assert (=> start!109450 (=> (not res!861393) (not e!739398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109450 (= res!861393 (validMask!0 mask!2175))))

(assert (=> start!109450 e!739398))

(assert (=> start!109450 tp_is_empty!34579))

(assert (=> start!109450 true))

(declare-fun array_inv!31607 (array!86069) Bool)

(assert (=> start!109450 (and (array_inv!31607 _values!1445) e!739397)))

(declare-fun array_inv!31608 (array!86071) Bool)

(assert (=> start!109450 (array_inv!31608 _keys!1741)))

(assert (=> start!109450 tp!101936))

(declare-fun b!1295967 () Bool)

(declare-fun res!861388 () Bool)

(assert (=> b!1295967 (=> (not res!861388) (not e!739398))))

(declare-datatypes ((List!29549 0))(
  ( (Nil!29546) (Cons!29545 (h!30754 (_ BitVec 64)) (t!43105 List!29549)) )
))
(declare-fun arrayNoDuplicates!0 (array!86071 (_ BitVec 32) List!29549) Bool)

(assert (=> b!1295967 (= res!861388 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29546))))

(declare-fun b!1295968 () Bool)

(declare-fun res!861392 () Bool)

(assert (=> b!1295968 (=> (not res!861392) (not e!739398))))

(assert (=> b!1295968 (= res!861392 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42089 _keys!1741))))))

(declare-fun b!1295969 () Bool)

(declare-fun res!861391 () Bool)

(assert (=> b!1295969 (=> (not res!861391) (not e!739398))))

(declare-fun minValue!1387 () V!51209)

(declare-fun zeroValue!1387 () V!51209)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4974 (array!86071 array!86069 (_ BitVec 32) (_ BitVec 32) V!51209 V!51209 (_ BitVec 32) Int) ListLongMap!20075)

(assert (=> b!1295969 (= res!861391 (contains!8101 (getCurrentListMap!4974 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295970 () Bool)

(assert (=> b!1295970 (= e!739401 true)))

(declare-fun lt!579867 () ListLongMap!20075)

(declare-fun +!4463 (ListLongMap!20075 tuple2!22418) ListLongMap!20075)

(assert (=> b!1295970 (not (contains!8101 (+!4463 lt!579867 (tuple2!22419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579868 () Unit!42774)

(declare-fun addStillNotContains!440 (ListLongMap!20075 (_ BitVec 64) V!51209 (_ BitVec 64)) Unit!42774)

(assert (=> b!1295970 (= lt!579868 (addStillNotContains!440 lt!579867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6097 (array!86071 array!86069 (_ BitVec 32) (_ BitVec 32) V!51209 V!51209 (_ BitVec 32) Int) ListLongMap!20075)

(assert (=> b!1295970 (= lt!579867 (getCurrentListMapNoExtraKeys!6097 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53429 () Bool)

(declare-fun tp!101937 () Bool)

(assert (=> mapNonEmpty!53429 (= mapRes!53429 (and tp!101937 e!739399))))

(declare-fun mapValue!53429 () ValueCell!16391)

(declare-fun mapRest!53429 () (Array (_ BitVec 32) ValueCell!16391))

(declare-fun mapKey!53429 () (_ BitVec 32))

(assert (=> mapNonEmpty!53429 (= (arr!41536 _values!1445) (store mapRest!53429 mapKey!53429 mapValue!53429))))

(assert (= (and start!109450 res!861393) b!1295965))

(assert (= (and b!1295965 res!861396) b!1295966))

(assert (= (and b!1295966 res!861395) b!1295967))

(assert (= (and b!1295967 res!861388) b!1295961))

(assert (= (and b!1295961 res!861389) b!1295969))

(assert (= (and b!1295969 res!861391) b!1295968))

(assert (= (and b!1295968 res!861392) b!1295963))

(assert (= (and b!1295963 res!861390) b!1295962))

(assert (= (and b!1295962 (not res!861394)) b!1295970))

(assert (= (and b!1295960 condMapEmpty!53429) mapIsEmpty!53429))

(assert (= (and b!1295960 (not condMapEmpty!53429)) mapNonEmpty!53429))

(get-info :version)

(assert (= (and mapNonEmpty!53429 ((_ is ValueCellFull!16391) mapValue!53429)) b!1295964))

(assert (= (and b!1295960 ((_ is ValueCellFull!16391) mapDefault!53429)) b!1295959))

(assert (= start!109450 b!1295960))

(declare-fun m!1187475 () Bool)

(assert (=> b!1295962 m!1187475))

(declare-fun m!1187477 () Bool)

(assert (=> b!1295962 m!1187477))

(declare-fun m!1187479 () Bool)

(assert (=> start!109450 m!1187479))

(declare-fun m!1187481 () Bool)

(assert (=> start!109450 m!1187481))

(declare-fun m!1187483 () Bool)

(assert (=> start!109450 m!1187483))

(declare-fun m!1187485 () Bool)

(assert (=> mapNonEmpty!53429 m!1187485))

(declare-fun m!1187487 () Bool)

(assert (=> b!1295963 m!1187487))

(assert (=> b!1295963 m!1187487))

(declare-fun m!1187489 () Bool)

(assert (=> b!1295963 m!1187489))

(declare-fun m!1187491 () Bool)

(assert (=> b!1295969 m!1187491))

(assert (=> b!1295969 m!1187491))

(declare-fun m!1187493 () Bool)

(assert (=> b!1295969 m!1187493))

(declare-fun m!1187495 () Bool)

(assert (=> b!1295967 m!1187495))

(declare-fun m!1187497 () Bool)

(assert (=> b!1295970 m!1187497))

(assert (=> b!1295970 m!1187497))

(declare-fun m!1187499 () Bool)

(assert (=> b!1295970 m!1187499))

(declare-fun m!1187501 () Bool)

(assert (=> b!1295970 m!1187501))

(declare-fun m!1187503 () Bool)

(assert (=> b!1295970 m!1187503))

(declare-fun m!1187505 () Bool)

(assert (=> b!1295966 m!1187505))

(check-sat (not mapNonEmpty!53429) (not b_next!28939) (not b!1295970) (not b!1295963) b_and!47011 (not b!1295966) (not b!1295969) tp_is_empty!34579 (not start!109450) (not b!1295962) (not b!1295967))
(check-sat b_and!47011 (not b_next!28939))
