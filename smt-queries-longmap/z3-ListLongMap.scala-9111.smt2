; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109674 () Bool)

(assert start!109674)

(declare-fun b_free!28939 () Bool)

(declare-fun b_next!28939 () Bool)

(assert (=> start!109674 (= b_free!28939 (not b_next!28939))))

(declare-fun tp!101936 () Bool)

(declare-fun b_and!47031 () Bool)

(assert (=> start!109674 (= tp!101936 b_and!47031)))

(declare-fun b!1297328 () Bool)

(declare-fun e!740277 () Bool)

(declare-fun tp_is_empty!34579 () Bool)

(assert (=> b!1297328 (= e!740277 tp_is_empty!34579)))

(declare-fun b!1297329 () Bool)

(declare-fun res!861936 () Bool)

(declare-fun e!740276 () Bool)

(assert (=> b!1297329 (=> (not res!861936) (not e!740276))))

(declare-datatypes ((V!51209 0))(
  ( (V!51210 (val!17364 Int)) )
))
(declare-fun minValue!1387 () V!51209)

(declare-fun zeroValue!1387 () V!51209)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16391 0))(
  ( (ValueCellFull!16391 (v!19962 V!51209)) (EmptyCell!16391) )
))
(declare-datatypes ((array!86211 0))(
  ( (array!86212 (arr!41602 (Array (_ BitVec 32) ValueCell!16391)) (size!42153 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86211)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86213 0))(
  ( (array!86214 (arr!41603 (Array (_ BitVec 32) (_ BitVec 64))) (size!42154 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86213)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22368 0))(
  ( (tuple2!22369 (_1!11195 (_ BitVec 64)) (_2!11195 V!51209)) )
))
(declare-datatypes ((List!29535 0))(
  ( (Nil!29532) (Cons!29531 (h!30749 tuple2!22368) (t!43091 List!29535)) )
))
(declare-datatypes ((ListLongMap!20033 0))(
  ( (ListLongMap!20034 (toList!10032 List!29535)) )
))
(declare-fun contains!8163 (ListLongMap!20033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5053 (array!86213 array!86211 (_ BitVec 32) (_ BitVec 32) V!51209 V!51209 (_ BitVec 32) Int) ListLongMap!20033)

(assert (=> b!1297329 (= res!861936 (contains!8163 (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297330 () Bool)

(declare-fun res!861935 () Bool)

(assert (=> b!1297330 (=> (not res!861935) (not e!740276))))

(assert (=> b!1297330 (= res!861935 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42154 _keys!1741))))))

(declare-fun b!1297331 () Bool)

(declare-fun e!740273 () Bool)

(assert (=> b!1297331 (= e!740276 (not e!740273))))

(declare-fun res!861940 () Bool)

(assert (=> b!1297331 (=> res!861940 e!740273)))

(assert (=> b!1297331 (= res!861940 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1297331 (not (contains!8163 (ListLongMap!20034 Nil!29532) k0!1205))))

(declare-datatypes ((Unit!42895 0))(
  ( (Unit!42896) )
))
(declare-fun lt!580529 () Unit!42895)

(declare-fun emptyContainsNothing!188 ((_ BitVec 64)) Unit!42895)

(assert (=> b!1297331 (= lt!580529 (emptyContainsNothing!188 k0!1205))))

(declare-fun mapIsEmpty!53429 () Bool)

(declare-fun mapRes!53429 () Bool)

(assert (=> mapIsEmpty!53429 mapRes!53429))

(declare-fun b!1297332 () Bool)

(declare-fun e!740272 () Bool)

(assert (=> b!1297332 (= e!740272 (and e!740277 mapRes!53429))))

(declare-fun condMapEmpty!53429 () Bool)

(declare-fun mapDefault!53429 () ValueCell!16391)

(assert (=> b!1297332 (= condMapEmpty!53429 (= (arr!41602 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16391)) mapDefault!53429)))))

(declare-fun res!861938 () Bool)

(assert (=> start!109674 (=> (not res!861938) (not e!740276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109674 (= res!861938 (validMask!0 mask!2175))))

(assert (=> start!109674 e!740276))

(assert (=> start!109674 tp_is_empty!34579))

(assert (=> start!109674 true))

(declare-fun array_inv!31729 (array!86211) Bool)

(assert (=> start!109674 (and (array_inv!31729 _values!1445) e!740272)))

(declare-fun array_inv!31730 (array!86213) Bool)

(assert (=> start!109674 (array_inv!31730 _keys!1741)))

(assert (=> start!109674 tp!101936))

(declare-fun b!1297333 () Bool)

(declare-fun res!861942 () Bool)

(assert (=> b!1297333 (=> (not res!861942) (not e!740276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86213 (_ BitVec 32)) Bool)

(assert (=> b!1297333 (= res!861942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297334 () Bool)

(declare-fun res!861939 () Bool)

(assert (=> b!1297334 (=> (not res!861939) (not e!740276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1297334 (= res!861939 (not (validKeyInArray!0 (select (arr!41603 _keys!1741) from!2144))))))

(declare-fun b!1297335 () Bool)

(declare-fun res!861943 () Bool)

(assert (=> b!1297335 (=> (not res!861943) (not e!740276))))

(assert (=> b!1297335 (= res!861943 (and (= (size!42153 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42154 _keys!1741) (size!42153 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297336 () Bool)

(declare-fun res!861941 () Bool)

(assert (=> b!1297336 (=> (not res!861941) (not e!740276))))

(declare-datatypes ((List!29536 0))(
  ( (Nil!29533) (Cons!29532 (h!30750 (_ BitVec 64)) (t!43092 List!29536)) )
))
(declare-fun arrayNoDuplicates!0 (array!86213 (_ BitVec 32) List!29536) Bool)

(assert (=> b!1297336 (= res!861941 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29533))))

(declare-fun b!1297337 () Bool)

(declare-fun res!861937 () Bool)

(assert (=> b!1297337 (=> (not res!861937) (not e!740276))))

(assert (=> b!1297337 (= res!861937 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42154 _keys!1741))))))

(declare-fun b!1297338 () Bool)

(assert (=> b!1297338 (= e!740273 true)))

(declare-fun lt!580530 () ListLongMap!20033)

(declare-fun +!4476 (ListLongMap!20033 tuple2!22368) ListLongMap!20033)

(assert (=> b!1297338 (not (contains!8163 (+!4476 lt!580530 (tuple2!22369 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580528 () Unit!42895)

(declare-fun addStillNotContains!452 (ListLongMap!20033 (_ BitVec 64) V!51209 (_ BitVec 64)) Unit!42895)

(assert (=> b!1297338 (= lt!580528 (addStillNotContains!452 lt!580530 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6118 (array!86213 array!86211 (_ BitVec 32) (_ BitVec 32) V!51209 V!51209 (_ BitVec 32) Int) ListLongMap!20033)

(assert (=> b!1297338 (= lt!580530 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1297339 () Bool)

(declare-fun e!740275 () Bool)

(assert (=> b!1297339 (= e!740275 tp_is_empty!34579)))

(declare-fun mapNonEmpty!53429 () Bool)

(declare-fun tp!101935 () Bool)

(assert (=> mapNonEmpty!53429 (= mapRes!53429 (and tp!101935 e!740275))))

(declare-fun mapRest!53429 () (Array (_ BitVec 32) ValueCell!16391))

(declare-fun mapKey!53429 () (_ BitVec 32))

(declare-fun mapValue!53429 () ValueCell!16391)

(assert (=> mapNonEmpty!53429 (= (arr!41602 _values!1445) (store mapRest!53429 mapKey!53429 mapValue!53429))))

(assert (= (and start!109674 res!861938) b!1297335))

(assert (= (and b!1297335 res!861943) b!1297333))

(assert (= (and b!1297333 res!861942) b!1297336))

(assert (= (and b!1297336 res!861941) b!1297330))

(assert (= (and b!1297330 res!861935) b!1297329))

(assert (= (and b!1297329 res!861936) b!1297337))

(assert (= (and b!1297337 res!861937) b!1297334))

(assert (= (and b!1297334 res!861939) b!1297331))

(assert (= (and b!1297331 (not res!861940)) b!1297338))

(assert (= (and b!1297332 condMapEmpty!53429) mapIsEmpty!53429))

(assert (= (and b!1297332 (not condMapEmpty!53429)) mapNonEmpty!53429))

(get-info :version)

(assert (= (and mapNonEmpty!53429 ((_ is ValueCellFull!16391) mapValue!53429)) b!1297339))

(assert (= (and b!1297332 ((_ is ValueCellFull!16391) mapDefault!53429)) b!1297328))

(assert (= start!109674 b!1297332))

(declare-fun m!1189593 () Bool)

(assert (=> start!109674 m!1189593))

(declare-fun m!1189595 () Bool)

(assert (=> start!109674 m!1189595))

(declare-fun m!1189597 () Bool)

(assert (=> start!109674 m!1189597))

(declare-fun m!1189599 () Bool)

(assert (=> b!1297336 m!1189599))

(declare-fun m!1189601 () Bool)

(assert (=> b!1297329 m!1189601))

(assert (=> b!1297329 m!1189601))

(declare-fun m!1189603 () Bool)

(assert (=> b!1297329 m!1189603))

(declare-fun m!1189605 () Bool)

(assert (=> b!1297338 m!1189605))

(assert (=> b!1297338 m!1189605))

(declare-fun m!1189607 () Bool)

(assert (=> b!1297338 m!1189607))

(declare-fun m!1189609 () Bool)

(assert (=> b!1297338 m!1189609))

(declare-fun m!1189611 () Bool)

(assert (=> b!1297338 m!1189611))

(declare-fun m!1189613 () Bool)

(assert (=> b!1297333 m!1189613))

(declare-fun m!1189615 () Bool)

(assert (=> b!1297331 m!1189615))

(declare-fun m!1189617 () Bool)

(assert (=> b!1297331 m!1189617))

(declare-fun m!1189619 () Bool)

(assert (=> b!1297334 m!1189619))

(assert (=> b!1297334 m!1189619))

(declare-fun m!1189621 () Bool)

(assert (=> b!1297334 m!1189621))

(declare-fun m!1189623 () Bool)

(assert (=> mapNonEmpty!53429 m!1189623))

(check-sat (not mapNonEmpty!53429) (not b!1297333) (not b!1297334) (not b_next!28939) (not start!109674) (not b!1297331) (not b!1297336) (not b!1297338) (not b!1297329) tp_is_empty!34579 b_and!47031)
(check-sat b_and!47031 (not b_next!28939))
