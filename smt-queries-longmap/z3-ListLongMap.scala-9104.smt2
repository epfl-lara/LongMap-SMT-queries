; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109410 () Bool)

(assert start!109410)

(declare-fun b_free!28899 () Bool)

(declare-fun b_next!28899 () Bool)

(assert (=> start!109410 (= b_free!28899 (not b_next!28899))))

(declare-fun tp!101816 () Bool)

(declare-fun b_and!46989 () Bool)

(assert (=> start!109410 (= tp!101816 b_and!46989)))

(declare-fun b!1295303 () Bool)

(declare-fun res!860878 () Bool)

(declare-fun e!739068 () Bool)

(assert (=> b!1295303 (=> (not res!860878) (not e!739068))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86098 0))(
  ( (array!86099 (arr!41550 (Array (_ BitVec 32) (_ BitVec 64))) (size!42100 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86098)

(assert (=> b!1295303 (= res!860878 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42100 _keys!1741))))))

(declare-fun b!1295304 () Bool)

(declare-fun e!739070 () Bool)

(declare-fun e!739069 () Bool)

(declare-fun mapRes!53369 () Bool)

(assert (=> b!1295304 (= e!739070 (and e!739069 mapRes!53369))))

(declare-fun condMapEmpty!53369 () Bool)

(declare-datatypes ((V!51155 0))(
  ( (V!51156 (val!17344 Int)) )
))
(declare-datatypes ((ValueCell!16371 0))(
  ( (ValueCellFull!16371 (v!19947 V!51155)) (EmptyCell!16371) )
))
(declare-datatypes ((array!86100 0))(
  ( (array!86101 (arr!41551 (Array (_ BitVec 32) ValueCell!16371)) (size!42101 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86100)

(declare-fun mapDefault!53369 () ValueCell!16371)

(assert (=> b!1295304 (= condMapEmpty!53369 (= (arr!41551 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16371)) mapDefault!53369)))))

(declare-fun b!1295305 () Bool)

(declare-fun res!860876 () Bool)

(assert (=> b!1295305 (=> (not res!860876) (not e!739068))))

(declare-datatypes ((List!29476 0))(
  ( (Nil!29473) (Cons!29472 (h!30681 (_ BitVec 64)) (t!43040 List!29476)) )
))
(declare-fun arrayNoDuplicates!0 (array!86098 (_ BitVec 32) List!29476) Bool)

(assert (=> b!1295305 (= res!860876 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29473))))

(declare-fun mapNonEmpty!53369 () Bool)

(declare-fun tp!101815 () Bool)

(declare-fun e!739067 () Bool)

(assert (=> mapNonEmpty!53369 (= mapRes!53369 (and tp!101815 e!739067))))

(declare-fun mapKey!53369 () (_ BitVec 32))

(declare-fun mapValue!53369 () ValueCell!16371)

(declare-fun mapRest!53369 () (Array (_ BitVec 32) ValueCell!16371))

(assert (=> mapNonEmpty!53369 (= (arr!41551 _values!1445) (store mapRest!53369 mapKey!53369 mapValue!53369))))

(declare-fun b!1295306 () Bool)

(declare-fun res!860880 () Bool)

(assert (=> b!1295306 (=> (not res!860880) (not e!739068))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86098 (_ BitVec 32)) Bool)

(assert (=> b!1295306 (= res!860880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295307 () Bool)

(declare-fun tp_is_empty!34539 () Bool)

(assert (=> b!1295307 (= e!739067 tp_is_empty!34539)))

(declare-fun b!1295308 () Bool)

(declare-fun res!860879 () Bool)

(assert (=> b!1295308 (=> (not res!860879) (not e!739068))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295308 (= res!860879 (and (= (size!42101 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42100 _keys!1741) (size!42101 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53369 () Bool)

(assert (=> mapIsEmpty!53369 mapRes!53369))

(declare-fun b!1295310 () Bool)

(declare-fun res!860883 () Bool)

(assert (=> b!1295310 (=> (not res!860883) (not e!739068))))

(declare-fun minValue!1387 () V!51155)

(declare-fun zeroValue!1387 () V!51155)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22334 0))(
  ( (tuple2!22335 (_1!11178 (_ BitVec 64)) (_2!11178 V!51155)) )
))
(declare-datatypes ((List!29477 0))(
  ( (Nil!29474) (Cons!29473 (h!30682 tuple2!22334) (t!43041 List!29477)) )
))
(declare-datatypes ((ListLongMap!19991 0))(
  ( (ListLongMap!19992 (toList!10011 List!29477)) )
))
(declare-fun contains!8129 (ListLongMap!19991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5046 (array!86098 array!86100 (_ BitVec 32) (_ BitVec 32) V!51155 V!51155 (_ BitVec 32) Int) ListLongMap!19991)

(assert (=> b!1295310 (= res!860883 (contains!8129 (getCurrentListMap!5046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295311 () Bool)

(assert (=> b!1295311 (= e!739069 tp_is_empty!34539)))

(declare-fun b!1295312 () Bool)

(declare-fun e!739065 () Bool)

(assert (=> b!1295312 (= e!739065 true)))

(declare-fun lt!579866 () ListLongMap!19991)

(declare-fun +!4417 (ListLongMap!19991 tuple2!22334) ListLongMap!19991)

(assert (=> b!1295312 (not (contains!8129 (+!4417 lt!579866 (tuple2!22335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42902 0))(
  ( (Unit!42903) )
))
(declare-fun lt!579865 () Unit!42902)

(declare-fun addStillNotContains!435 (ListLongMap!19991 (_ BitVec 64) V!51155 (_ BitVec 64)) Unit!42902)

(assert (=> b!1295312 (= lt!579865 (addStillNotContains!435 lt!579866 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6050 (array!86098 array!86100 (_ BitVec 32) (_ BitVec 32) V!51155 V!51155 (_ BitVec 32) Int) ListLongMap!19991)

(assert (=> b!1295312 (= lt!579866 (getCurrentListMapNoExtraKeys!6050 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295309 () Bool)

(assert (=> b!1295309 (= e!739068 (not e!739065))))

(declare-fun res!860881 () Bool)

(assert (=> b!1295309 (=> res!860881 e!739065)))

(assert (=> b!1295309 (= res!860881 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295309 (not (contains!8129 (ListLongMap!19992 Nil!29474) k0!1205))))

(declare-fun lt!579864 () Unit!42902)

(declare-fun emptyContainsNothing!171 ((_ BitVec 64)) Unit!42902)

(assert (=> b!1295309 (= lt!579864 (emptyContainsNothing!171 k0!1205))))

(declare-fun res!860877 () Bool)

(assert (=> start!109410 (=> (not res!860877) (not e!739068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109410 (= res!860877 (validMask!0 mask!2175))))

(assert (=> start!109410 e!739068))

(assert (=> start!109410 tp_is_empty!34539))

(assert (=> start!109410 true))

(declare-fun array_inv!31463 (array!86100) Bool)

(assert (=> start!109410 (and (array_inv!31463 _values!1445) e!739070)))

(declare-fun array_inv!31464 (array!86098) Bool)

(assert (=> start!109410 (array_inv!31464 _keys!1741)))

(assert (=> start!109410 tp!101816))

(declare-fun b!1295313 () Bool)

(declare-fun res!860882 () Bool)

(assert (=> b!1295313 (=> (not res!860882) (not e!739068))))

(assert (=> b!1295313 (= res!860882 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42100 _keys!1741))))))

(declare-fun b!1295314 () Bool)

(declare-fun res!860875 () Bool)

(assert (=> b!1295314 (=> (not res!860875) (not e!739068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295314 (= res!860875 (not (validKeyInArray!0 (select (arr!41550 _keys!1741) from!2144))))))

(assert (= (and start!109410 res!860877) b!1295308))

(assert (= (and b!1295308 res!860879) b!1295306))

(assert (= (and b!1295306 res!860880) b!1295305))

(assert (= (and b!1295305 res!860876) b!1295313))

(assert (= (and b!1295313 res!860882) b!1295310))

(assert (= (and b!1295310 res!860883) b!1295303))

(assert (= (and b!1295303 res!860878) b!1295314))

(assert (= (and b!1295314 res!860875) b!1295309))

(assert (= (and b!1295309 (not res!860881)) b!1295312))

(assert (= (and b!1295304 condMapEmpty!53369) mapIsEmpty!53369))

(assert (= (and b!1295304 (not condMapEmpty!53369)) mapNonEmpty!53369))

(get-info :version)

(assert (= (and mapNonEmpty!53369 ((_ is ValueCellFull!16371) mapValue!53369)) b!1295307))

(assert (= (and b!1295304 ((_ is ValueCellFull!16371) mapDefault!53369)) b!1295311))

(assert (= start!109410 b!1295304))

(declare-fun m!1187335 () Bool)

(assert (=> b!1295309 m!1187335))

(declare-fun m!1187337 () Bool)

(assert (=> b!1295309 m!1187337))

(declare-fun m!1187339 () Bool)

(assert (=> b!1295306 m!1187339))

(declare-fun m!1187341 () Bool)

(assert (=> mapNonEmpty!53369 m!1187341))

(declare-fun m!1187343 () Bool)

(assert (=> start!109410 m!1187343))

(declare-fun m!1187345 () Bool)

(assert (=> start!109410 m!1187345))

(declare-fun m!1187347 () Bool)

(assert (=> start!109410 m!1187347))

(declare-fun m!1187349 () Bool)

(assert (=> b!1295310 m!1187349))

(assert (=> b!1295310 m!1187349))

(declare-fun m!1187351 () Bool)

(assert (=> b!1295310 m!1187351))

(declare-fun m!1187353 () Bool)

(assert (=> b!1295305 m!1187353))

(declare-fun m!1187355 () Bool)

(assert (=> b!1295312 m!1187355))

(assert (=> b!1295312 m!1187355))

(declare-fun m!1187357 () Bool)

(assert (=> b!1295312 m!1187357))

(declare-fun m!1187359 () Bool)

(assert (=> b!1295312 m!1187359))

(declare-fun m!1187361 () Bool)

(assert (=> b!1295312 m!1187361))

(declare-fun m!1187363 () Bool)

(assert (=> b!1295314 m!1187363))

(assert (=> b!1295314 m!1187363))

(declare-fun m!1187365 () Bool)

(assert (=> b!1295314 m!1187365))

(check-sat (not b!1295312) (not b!1295314) (not b_next!28899) (not b!1295306) (not start!109410) (not b!1295305) b_and!46989 (not b!1295309) (not b!1295310) (not mapNonEmpty!53369) tp_is_empty!34539)
(check-sat b_and!46989 (not b_next!28899))
