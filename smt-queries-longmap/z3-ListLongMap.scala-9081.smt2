; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109272 () Bool)

(assert start!109272)

(declare-fun b_free!28761 () Bool)

(declare-fun b_next!28761 () Bool)

(assert (=> start!109272 (= b_free!28761 (not b_next!28761))))

(declare-fun tp!101402 () Bool)

(declare-fun b_and!46851 () Bool)

(assert (=> start!109272 (= tp!101402 b_and!46851)))

(declare-fun b!1292900 () Bool)

(declare-fun e!737904 () Bool)

(declare-fun e!737908 () Bool)

(assert (=> b!1292900 (= e!737904 (not e!737908))))

(declare-fun res!859095 () Bool)

(assert (=> b!1292900 (=> res!859095 e!737908)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292900 (= res!859095 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50971 0))(
  ( (V!50972 (val!17275 Int)) )
))
(declare-datatypes ((tuple2!22232 0))(
  ( (tuple2!22233 (_1!11127 (_ BitVec 64)) (_2!11127 V!50971)) )
))
(declare-datatypes ((List!29381 0))(
  ( (Nil!29378) (Cons!29377 (h!30586 tuple2!22232) (t!42945 List!29381)) )
))
(declare-datatypes ((ListLongMap!19889 0))(
  ( (ListLongMap!19890 (toList!9960 List!29381)) )
))
(declare-fun contains!8078 (ListLongMap!19889 (_ BitVec 64)) Bool)

(assert (=> b!1292900 (not (contains!8078 (ListLongMap!19890 Nil!29378) k0!1205))))

(declare-datatypes ((Unit!42818 0))(
  ( (Unit!42819) )
))
(declare-fun lt!579415 () Unit!42818)

(declare-fun emptyContainsNothing!131 ((_ BitVec 64)) Unit!42818)

(assert (=> b!1292900 (= lt!579415 (emptyContainsNothing!131 k0!1205))))

(declare-fun b!1292901 () Bool)

(declare-fun res!859093 () Bool)

(assert (=> b!1292901 (=> (not res!859093) (not e!737904))))

(declare-datatypes ((array!85834 0))(
  ( (array!85835 (arr!41418 (Array (_ BitVec 32) (_ BitVec 64))) (size!41968 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85834)

(declare-datatypes ((List!29382 0))(
  ( (Nil!29379) (Cons!29378 (h!30587 (_ BitVec 64)) (t!42946 List!29382)) )
))
(declare-fun arrayNoDuplicates!0 (array!85834 (_ BitVec 32) List!29382) Bool)

(assert (=> b!1292901 (= res!859093 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29379))))

(declare-fun b!1292902 () Bool)

(declare-fun res!859094 () Bool)

(assert (=> b!1292902 (=> (not res!859094) (not e!737904))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292902 (= res!859094 (not (validKeyInArray!0 (select (arr!41418 _keys!1741) from!2144))))))

(declare-fun b!1292903 () Bool)

(declare-fun res!859097 () Bool)

(assert (=> b!1292903 (=> (not res!859097) (not e!737904))))

(assert (=> b!1292903 (= res!859097 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41968 _keys!1741))))))

(declare-fun b!1292905 () Bool)

(declare-fun e!737906 () Bool)

(declare-fun tp_is_empty!34401 () Bool)

(assert (=> b!1292905 (= e!737906 tp_is_empty!34401)))

(declare-fun b!1292906 () Bool)

(assert (=> b!1292906 (= e!737908 true)))

(declare-fun lt!579416 () ListLongMap!19889)

(declare-fun zeroValue!1387 () V!50971)

(declare-fun +!4395 (ListLongMap!19889 tuple2!22232) ListLongMap!19889)

(assert (=> b!1292906 (not (contains!8078 (+!4395 lt!579416 (tuple2!22233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579414 () Unit!42818)

(declare-fun addStillNotContains!413 (ListLongMap!19889 (_ BitVec 64) V!50971 (_ BitVec 64)) Unit!42818)

(assert (=> b!1292906 (= lt!579414 (addStillNotContains!413 lt!579416 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-datatypes ((ValueCell!16302 0))(
  ( (ValueCellFull!16302 (v!19878 V!50971)) (EmptyCell!16302) )
))
(declare-datatypes ((array!85836 0))(
  ( (array!85837 (arr!41419 (Array (_ BitVec 32) ValueCell!16302)) (size!41969 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85836)

(declare-fun minValue!1387 () V!50971)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6027 (array!85834 array!85836 (_ BitVec 32) (_ BitVec 32) V!50971 V!50971 (_ BitVec 32) Int) ListLongMap!19889)

(assert (=> b!1292906 (= lt!579416 (getCurrentListMapNoExtraKeys!6027 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53162 () Bool)

(declare-fun mapRes!53162 () Bool)

(assert (=> mapIsEmpty!53162 mapRes!53162))

(declare-fun b!1292907 () Bool)

(declare-fun res!859099 () Bool)

(assert (=> b!1292907 (=> (not res!859099) (not e!737904))))

(assert (=> b!1292907 (= res!859099 (and (= (size!41969 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41968 _keys!1741) (size!41969 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292908 () Bool)

(declare-fun res!859100 () Bool)

(assert (=> b!1292908 (=> (not res!859100) (not e!737904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85834 (_ BitVec 32)) Bool)

(assert (=> b!1292908 (= res!859100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292904 () Bool)

(declare-fun e!737905 () Bool)

(assert (=> b!1292904 (= e!737905 tp_is_empty!34401)))

(declare-fun res!859101 () Bool)

(assert (=> start!109272 (=> (not res!859101) (not e!737904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109272 (= res!859101 (validMask!0 mask!2175))))

(assert (=> start!109272 e!737904))

(assert (=> start!109272 tp_is_empty!34401))

(assert (=> start!109272 true))

(declare-fun e!737909 () Bool)

(declare-fun array_inv!31381 (array!85836) Bool)

(assert (=> start!109272 (and (array_inv!31381 _values!1445) e!737909)))

(declare-fun array_inv!31382 (array!85834) Bool)

(assert (=> start!109272 (array_inv!31382 _keys!1741)))

(assert (=> start!109272 tp!101402))

(declare-fun b!1292909 () Bool)

(declare-fun res!859098 () Bool)

(assert (=> b!1292909 (=> (not res!859098) (not e!737904))))

(assert (=> b!1292909 (= res!859098 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41968 _keys!1741))))))

(declare-fun b!1292910 () Bool)

(assert (=> b!1292910 (= e!737909 (and e!737906 mapRes!53162))))

(declare-fun condMapEmpty!53162 () Bool)

(declare-fun mapDefault!53162 () ValueCell!16302)

(assert (=> b!1292910 (= condMapEmpty!53162 (= (arr!41419 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16302)) mapDefault!53162)))))

(declare-fun mapNonEmpty!53162 () Bool)

(declare-fun tp!101401 () Bool)

(assert (=> mapNonEmpty!53162 (= mapRes!53162 (and tp!101401 e!737905))))

(declare-fun mapKey!53162 () (_ BitVec 32))

(declare-fun mapValue!53162 () ValueCell!16302)

(declare-fun mapRest!53162 () (Array (_ BitVec 32) ValueCell!16302))

(assert (=> mapNonEmpty!53162 (= (arr!41419 _values!1445) (store mapRest!53162 mapKey!53162 mapValue!53162))))

(declare-fun b!1292911 () Bool)

(declare-fun res!859096 () Bool)

(assert (=> b!1292911 (=> (not res!859096) (not e!737904))))

(declare-fun getCurrentListMap!5004 (array!85834 array!85836 (_ BitVec 32) (_ BitVec 32) V!50971 V!50971 (_ BitVec 32) Int) ListLongMap!19889)

(assert (=> b!1292911 (= res!859096 (contains!8078 (getCurrentListMap!5004 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109272 res!859101) b!1292907))

(assert (= (and b!1292907 res!859099) b!1292908))

(assert (= (and b!1292908 res!859100) b!1292901))

(assert (= (and b!1292901 res!859093) b!1292909))

(assert (= (and b!1292909 res!859098) b!1292911))

(assert (= (and b!1292911 res!859096) b!1292903))

(assert (= (and b!1292903 res!859097) b!1292902))

(assert (= (and b!1292902 res!859094) b!1292900))

(assert (= (and b!1292900 (not res!859095)) b!1292906))

(assert (= (and b!1292910 condMapEmpty!53162) mapIsEmpty!53162))

(assert (= (and b!1292910 (not condMapEmpty!53162)) mapNonEmpty!53162))

(get-info :version)

(assert (= (and mapNonEmpty!53162 ((_ is ValueCellFull!16302) mapValue!53162)) b!1292904))

(assert (= (and b!1292910 ((_ is ValueCellFull!16302) mapDefault!53162)) b!1292905))

(assert (= start!109272 b!1292910))

(declare-fun m!1185355 () Bool)

(assert (=> b!1292908 m!1185355))

(declare-fun m!1185357 () Bool)

(assert (=> b!1292901 m!1185357))

(declare-fun m!1185359 () Bool)

(assert (=> b!1292902 m!1185359))

(assert (=> b!1292902 m!1185359))

(declare-fun m!1185361 () Bool)

(assert (=> b!1292902 m!1185361))

(declare-fun m!1185363 () Bool)

(assert (=> b!1292900 m!1185363))

(declare-fun m!1185365 () Bool)

(assert (=> b!1292900 m!1185365))

(declare-fun m!1185367 () Bool)

(assert (=> mapNonEmpty!53162 m!1185367))

(declare-fun m!1185369 () Bool)

(assert (=> b!1292906 m!1185369))

(assert (=> b!1292906 m!1185369))

(declare-fun m!1185371 () Bool)

(assert (=> b!1292906 m!1185371))

(declare-fun m!1185373 () Bool)

(assert (=> b!1292906 m!1185373))

(declare-fun m!1185375 () Bool)

(assert (=> b!1292906 m!1185375))

(declare-fun m!1185377 () Bool)

(assert (=> b!1292911 m!1185377))

(assert (=> b!1292911 m!1185377))

(declare-fun m!1185379 () Bool)

(assert (=> b!1292911 m!1185379))

(declare-fun m!1185381 () Bool)

(assert (=> start!109272 m!1185381))

(declare-fun m!1185383 () Bool)

(assert (=> start!109272 m!1185383))

(declare-fun m!1185385 () Bool)

(assert (=> start!109272 m!1185385))

(check-sat (not b!1292901) (not b!1292900) (not b!1292908) (not b!1292911) (not start!109272) (not b!1292906) (not b_next!28761) tp_is_empty!34401 (not mapNonEmpty!53162) b_and!46851 (not b!1292902))
(check-sat b_and!46851 (not b_next!28761))
