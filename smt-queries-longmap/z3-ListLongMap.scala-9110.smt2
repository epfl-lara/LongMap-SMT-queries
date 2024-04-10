; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109446 () Bool)

(assert start!109446)

(declare-fun b_free!28935 () Bool)

(declare-fun b_next!28935 () Bool)

(assert (=> start!109446 (= b_free!28935 (not b_next!28935))))

(declare-fun tp!101924 () Bool)

(declare-fun b_and!47025 () Bool)

(assert (=> start!109446 (= tp!101924 b_and!47025)))

(declare-fun b!1295951 () Bool)

(declare-fun res!861361 () Bool)

(declare-fun e!739392 () Bool)

(assert (=> b!1295951 (=> (not res!861361) (not e!739392))))

(declare-datatypes ((array!86168 0))(
  ( (array!86169 (arr!41585 (Array (_ BitVec 32) (_ BitVec 64))) (size!42135 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86168)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86168 (_ BitVec 32)) Bool)

(assert (=> b!1295951 (= res!861361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295952 () Bool)

(declare-fun res!861364 () Bool)

(assert (=> b!1295952 (=> (not res!861364) (not e!739392))))

(declare-datatypes ((List!29501 0))(
  ( (Nil!29498) (Cons!29497 (h!30706 (_ BitVec 64)) (t!43065 List!29501)) )
))
(declare-fun arrayNoDuplicates!0 (array!86168 (_ BitVec 32) List!29501) Bool)

(assert (=> b!1295952 (= res!861364 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29498))))

(declare-fun mapNonEmpty!53423 () Bool)

(declare-fun mapRes!53423 () Bool)

(declare-fun tp!101923 () Bool)

(declare-fun e!739389 () Bool)

(assert (=> mapNonEmpty!53423 (= mapRes!53423 (and tp!101923 e!739389))))

(declare-datatypes ((V!51203 0))(
  ( (V!51204 (val!17362 Int)) )
))
(declare-datatypes ((ValueCell!16389 0))(
  ( (ValueCellFull!16389 (v!19965 V!51203)) (EmptyCell!16389) )
))
(declare-fun mapValue!53423 () ValueCell!16389)

(declare-fun mapKey!53423 () (_ BitVec 32))

(declare-datatypes ((array!86170 0))(
  ( (array!86171 (arr!41586 (Array (_ BitVec 32) ValueCell!16389)) (size!42136 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86170)

(declare-fun mapRest!53423 () (Array (_ BitVec 32) ValueCell!16389))

(assert (=> mapNonEmpty!53423 (= (arr!41586 _values!1445) (store mapRest!53423 mapKey!53423 mapValue!53423))))

(declare-fun b!1295953 () Bool)

(declare-fun e!739391 () Bool)

(assert (=> b!1295953 (= e!739391 true)))

(declare-datatypes ((tuple2!22360 0))(
  ( (tuple2!22361 (_1!11191 (_ BitVec 64)) (_2!11191 V!51203)) )
))
(declare-datatypes ((List!29502 0))(
  ( (Nil!29499) (Cons!29498 (h!30707 tuple2!22360) (t!43066 List!29502)) )
))
(declare-datatypes ((ListLongMap!20017 0))(
  ( (ListLongMap!20018 (toList!10024 List!29502)) )
))
(declare-fun lt!580028 () ListLongMap!20017)

(declare-fun minValue!1387 () V!51203)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8142 (ListLongMap!20017 (_ BitVec 64)) Bool)

(declare-fun +!4428 (ListLongMap!20017 tuple2!22360) ListLongMap!20017)

(assert (=> b!1295953 (not (contains!8142 (+!4428 lt!580028 (tuple2!22361 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42926 0))(
  ( (Unit!42927) )
))
(declare-fun lt!580027 () Unit!42926)

(declare-fun addStillNotContains!446 (ListLongMap!20017 (_ BitVec 64) V!51203 (_ BitVec 64)) Unit!42926)

(assert (=> b!1295953 (= lt!580027 (addStillNotContains!446 lt!580028 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51203)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6061 (array!86168 array!86170 (_ BitVec 32) (_ BitVec 32) V!51203 V!51203 (_ BitVec 32) Int) ListLongMap!20017)

(assert (=> b!1295953 (= lt!580028 (getCurrentListMapNoExtraKeys!6061 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295954 () Bool)

(declare-fun e!739390 () Bool)

(declare-fun e!739394 () Bool)

(assert (=> b!1295954 (= e!739390 (and e!739394 mapRes!53423))))

(declare-fun condMapEmpty!53423 () Bool)

(declare-fun mapDefault!53423 () ValueCell!16389)

(assert (=> b!1295954 (= condMapEmpty!53423 (= (arr!41586 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16389)) mapDefault!53423)))))

(declare-fun b!1295955 () Bool)

(assert (=> b!1295955 (= e!739392 (not e!739391))))

(declare-fun res!861365 () Bool)

(assert (=> b!1295955 (=> res!861365 e!739391)))

(assert (=> b!1295955 (= res!861365 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295955 (not (contains!8142 (ListLongMap!20018 Nil!29499) k0!1205))))

(declare-fun lt!580026 () Unit!42926)

(declare-fun emptyContainsNothing!182 ((_ BitVec 64)) Unit!42926)

(assert (=> b!1295955 (= lt!580026 (emptyContainsNothing!182 k0!1205))))

(declare-fun b!1295957 () Bool)

(declare-fun res!861366 () Bool)

(assert (=> b!1295957 (=> (not res!861366) (not e!739392))))

(assert (=> b!1295957 (= res!861366 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42135 _keys!1741))))))

(declare-fun b!1295958 () Bool)

(declare-fun tp_is_empty!34575 () Bool)

(assert (=> b!1295958 (= e!739389 tp_is_empty!34575)))

(declare-fun b!1295959 () Bool)

(declare-fun res!861368 () Bool)

(assert (=> b!1295959 (=> (not res!861368) (not e!739392))))

(assert (=> b!1295959 (= res!861368 (and (= (size!42136 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42135 _keys!1741) (size!42136 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295960 () Bool)

(assert (=> b!1295960 (= e!739394 tp_is_empty!34575)))

(declare-fun b!1295961 () Bool)

(declare-fun res!861367 () Bool)

(assert (=> b!1295961 (=> (not res!861367) (not e!739392))))

(assert (=> b!1295961 (= res!861367 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42135 _keys!1741))))))

(declare-fun b!1295956 () Bool)

(declare-fun res!861369 () Bool)

(assert (=> b!1295956 (=> (not res!861369) (not e!739392))))

(declare-fun getCurrentListMap!5057 (array!86168 array!86170 (_ BitVec 32) (_ BitVec 32) V!51203 V!51203 (_ BitVec 32) Int) ListLongMap!20017)

(assert (=> b!1295956 (= res!861369 (contains!8142 (getCurrentListMap!5057 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!861363 () Bool)

(assert (=> start!109446 (=> (not res!861363) (not e!739392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109446 (= res!861363 (validMask!0 mask!2175))))

(assert (=> start!109446 e!739392))

(assert (=> start!109446 tp_is_empty!34575))

(assert (=> start!109446 true))

(declare-fun array_inv!31481 (array!86170) Bool)

(assert (=> start!109446 (and (array_inv!31481 _values!1445) e!739390)))

(declare-fun array_inv!31482 (array!86168) Bool)

(assert (=> start!109446 (array_inv!31482 _keys!1741)))

(assert (=> start!109446 tp!101924))

(declare-fun b!1295962 () Bool)

(declare-fun res!861362 () Bool)

(assert (=> b!1295962 (=> (not res!861362) (not e!739392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295962 (= res!861362 (not (validKeyInArray!0 (select (arr!41585 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53423 () Bool)

(assert (=> mapIsEmpty!53423 mapRes!53423))

(assert (= (and start!109446 res!861363) b!1295959))

(assert (= (and b!1295959 res!861368) b!1295951))

(assert (= (and b!1295951 res!861361) b!1295952))

(assert (= (and b!1295952 res!861364) b!1295961))

(assert (= (and b!1295961 res!861367) b!1295956))

(assert (= (and b!1295956 res!861369) b!1295957))

(assert (= (and b!1295957 res!861366) b!1295962))

(assert (= (and b!1295962 res!861362) b!1295955))

(assert (= (and b!1295955 (not res!861365)) b!1295953))

(assert (= (and b!1295954 condMapEmpty!53423) mapIsEmpty!53423))

(assert (= (and b!1295954 (not condMapEmpty!53423)) mapNonEmpty!53423))

(get-info :version)

(assert (= (and mapNonEmpty!53423 ((_ is ValueCellFull!16389) mapValue!53423)) b!1295958))

(assert (= (and b!1295954 ((_ is ValueCellFull!16389) mapDefault!53423)) b!1295960))

(assert (= start!109446 b!1295954))

(declare-fun m!1187911 () Bool)

(assert (=> b!1295951 m!1187911))

(declare-fun m!1187913 () Bool)

(assert (=> mapNonEmpty!53423 m!1187913))

(declare-fun m!1187915 () Bool)

(assert (=> b!1295952 m!1187915))

(declare-fun m!1187917 () Bool)

(assert (=> b!1295955 m!1187917))

(declare-fun m!1187919 () Bool)

(assert (=> b!1295955 m!1187919))

(declare-fun m!1187921 () Bool)

(assert (=> start!109446 m!1187921))

(declare-fun m!1187923 () Bool)

(assert (=> start!109446 m!1187923))

(declare-fun m!1187925 () Bool)

(assert (=> start!109446 m!1187925))

(declare-fun m!1187927 () Bool)

(assert (=> b!1295956 m!1187927))

(assert (=> b!1295956 m!1187927))

(declare-fun m!1187929 () Bool)

(assert (=> b!1295956 m!1187929))

(declare-fun m!1187931 () Bool)

(assert (=> b!1295953 m!1187931))

(assert (=> b!1295953 m!1187931))

(declare-fun m!1187933 () Bool)

(assert (=> b!1295953 m!1187933))

(declare-fun m!1187935 () Bool)

(assert (=> b!1295953 m!1187935))

(declare-fun m!1187937 () Bool)

(assert (=> b!1295953 m!1187937))

(declare-fun m!1187939 () Bool)

(assert (=> b!1295962 m!1187939))

(assert (=> b!1295962 m!1187939))

(declare-fun m!1187941 () Bool)

(assert (=> b!1295962 m!1187941))

(check-sat b_and!47025 (not mapNonEmpty!53423) (not b!1295956) (not b!1295962) tp_is_empty!34575 (not b!1295951) (not b_next!28935) (not b!1295953) (not start!109446) (not b!1295952) (not b!1295955))
(check-sat b_and!47025 (not b_next!28935))
