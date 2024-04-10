; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109332 () Bool)

(assert start!109332)

(declare-fun b_free!28821 () Bool)

(declare-fun b_next!28821 () Bool)

(assert (=> start!109332 (= b_free!28821 (not b_next!28821))))

(declare-fun tp!101581 () Bool)

(declare-fun b_and!46911 () Bool)

(assert (=> start!109332 (= tp!101581 b_and!46911)))

(declare-fun b!1293975 () Bool)

(declare-fun res!859901 () Bool)

(declare-fun e!738441 () Bool)

(assert (=> b!1293975 (=> (not res!859901) (not e!738441))))

(declare-datatypes ((array!85946 0))(
  ( (array!85947 (arr!41474 (Array (_ BitVec 32) (_ BitVec 64))) (size!42024 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85946)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293975 (= res!859901 (not (validKeyInArray!0 (select (arr!41474 _keys!1741) from!2144))))))

(declare-fun b!1293976 () Bool)

(declare-fun res!859905 () Bool)

(assert (=> b!1293976 (=> (not res!859905) (not e!738441))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51051 0))(
  ( (V!51052 (val!17305 Int)) )
))
(declare-datatypes ((ValueCell!16332 0))(
  ( (ValueCellFull!16332 (v!19908 V!51051)) (EmptyCell!16332) )
))
(declare-datatypes ((array!85948 0))(
  ( (array!85949 (arr!41475 (Array (_ BitVec 32) ValueCell!16332)) (size!42025 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85948)

(assert (=> b!1293976 (= res!859905 (and (= (size!42025 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42024 _keys!1741) (size!42025 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53252 () Bool)

(declare-fun mapRes!53252 () Bool)

(assert (=> mapIsEmpty!53252 mapRes!53252))

(declare-fun b!1293977 () Bool)

(declare-fun res!859898 () Bool)

(assert (=> b!1293977 (=> (not res!859898) (not e!738441))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293977 (= res!859898 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42024 _keys!1741))))))

(declare-fun b!1293978 () Bool)

(declare-fun res!859902 () Bool)

(assert (=> b!1293978 (=> (not res!859902) (not e!738441))))

(assert (=> b!1293978 (= res!859902 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42024 _keys!1741))))))

(declare-fun b!1293979 () Bool)

(declare-fun e!738440 () Bool)

(declare-fun tp_is_empty!34461 () Bool)

(assert (=> b!1293979 (= e!738440 tp_is_empty!34461)))

(declare-fun mapNonEmpty!53252 () Bool)

(declare-fun tp!101582 () Bool)

(declare-fun e!738442 () Bool)

(assert (=> mapNonEmpty!53252 (= mapRes!53252 (and tp!101582 e!738442))))

(declare-fun mapKey!53252 () (_ BitVec 32))

(declare-fun mapRest!53252 () (Array (_ BitVec 32) ValueCell!16332))

(declare-fun mapValue!53252 () ValueCell!16332)

(assert (=> mapNonEmpty!53252 (= (arr!41475 _values!1445) (store mapRest!53252 mapKey!53252 mapValue!53252))))

(declare-fun b!1293981 () Bool)

(assert (=> b!1293981 (= e!738441 (not true))))

(declare-datatypes ((tuple2!22274 0))(
  ( (tuple2!22275 (_1!11148 (_ BitVec 64)) (_2!11148 V!51051)) )
))
(declare-datatypes ((List!29419 0))(
  ( (Nil!29416) (Cons!29415 (h!30624 tuple2!22274) (t!42983 List!29419)) )
))
(declare-datatypes ((ListLongMap!19931 0))(
  ( (ListLongMap!19932 (toList!9981 List!29419)) )
))
(declare-fun contains!8099 (ListLongMap!19931 (_ BitVec 64)) Bool)

(assert (=> b!1293981 (not (contains!8099 (ListLongMap!19932 Nil!29416) k0!1205))))

(declare-datatypes ((Unit!42854 0))(
  ( (Unit!42855) )
))
(declare-fun lt!579674 () Unit!42854)

(declare-fun emptyContainsNothing!148 ((_ BitVec 64)) Unit!42854)

(assert (=> b!1293981 (= lt!579674 (emptyContainsNothing!148 k0!1205))))

(declare-fun b!1293982 () Bool)

(declare-fun res!859903 () Bool)

(assert (=> b!1293982 (=> (not res!859903) (not e!738441))))

(declare-datatypes ((List!29420 0))(
  ( (Nil!29417) (Cons!29416 (h!30625 (_ BitVec 64)) (t!42984 List!29420)) )
))
(declare-fun arrayNoDuplicates!0 (array!85946 (_ BitVec 32) List!29420) Bool)

(assert (=> b!1293982 (= res!859903 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29417))))

(declare-fun b!1293983 () Bool)

(declare-fun res!859900 () Bool)

(assert (=> b!1293983 (=> (not res!859900) (not e!738441))))

(declare-fun minValue!1387 () V!51051)

(declare-fun zeroValue!1387 () V!51051)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5021 (array!85946 array!85948 (_ BitVec 32) (_ BitVec 32) V!51051 V!51051 (_ BitVec 32) Int) ListLongMap!19931)

(assert (=> b!1293983 (= res!859900 (contains!8099 (getCurrentListMap!5021 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293984 () Bool)

(assert (=> b!1293984 (= e!738442 tp_is_empty!34461)))

(declare-fun b!1293985 () Bool)

(declare-fun res!859899 () Bool)

(assert (=> b!1293985 (=> (not res!859899) (not e!738441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85946 (_ BitVec 32)) Bool)

(assert (=> b!1293985 (= res!859899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!859904 () Bool)

(assert (=> start!109332 (=> (not res!859904) (not e!738441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109332 (= res!859904 (validMask!0 mask!2175))))

(assert (=> start!109332 e!738441))

(assert (=> start!109332 tp_is_empty!34461))

(assert (=> start!109332 true))

(declare-fun e!738439 () Bool)

(declare-fun array_inv!31413 (array!85948) Bool)

(assert (=> start!109332 (and (array_inv!31413 _values!1445) e!738439)))

(declare-fun array_inv!31414 (array!85946) Bool)

(assert (=> start!109332 (array_inv!31414 _keys!1741)))

(assert (=> start!109332 tp!101581))

(declare-fun b!1293980 () Bool)

(assert (=> b!1293980 (= e!738439 (and e!738440 mapRes!53252))))

(declare-fun condMapEmpty!53252 () Bool)

(declare-fun mapDefault!53252 () ValueCell!16332)

(assert (=> b!1293980 (= condMapEmpty!53252 (= (arr!41475 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16332)) mapDefault!53252)))))

(assert (= (and start!109332 res!859904) b!1293976))

(assert (= (and b!1293976 res!859905) b!1293985))

(assert (= (and b!1293985 res!859899) b!1293982))

(assert (= (and b!1293982 res!859903) b!1293978))

(assert (= (and b!1293978 res!859902) b!1293983))

(assert (= (and b!1293983 res!859900) b!1293977))

(assert (= (and b!1293977 res!859898) b!1293975))

(assert (= (and b!1293975 res!859901) b!1293981))

(assert (= (and b!1293980 condMapEmpty!53252) mapIsEmpty!53252))

(assert (= (and b!1293980 (not condMapEmpty!53252)) mapNonEmpty!53252))

(get-info :version)

(assert (= (and mapNonEmpty!53252 ((_ is ValueCellFull!16332) mapValue!53252)) b!1293984))

(assert (= (and b!1293980 ((_ is ValueCellFull!16332) mapDefault!53252)) b!1293979))

(assert (= start!109332 b!1293980))

(declare-fun m!1186307 () Bool)

(assert (=> b!1293975 m!1186307))

(assert (=> b!1293975 m!1186307))

(declare-fun m!1186309 () Bool)

(assert (=> b!1293975 m!1186309))

(declare-fun m!1186311 () Bool)

(assert (=> mapNonEmpty!53252 m!1186311))

(declare-fun m!1186313 () Bool)

(assert (=> start!109332 m!1186313))

(declare-fun m!1186315 () Bool)

(assert (=> start!109332 m!1186315))

(declare-fun m!1186317 () Bool)

(assert (=> start!109332 m!1186317))

(declare-fun m!1186319 () Bool)

(assert (=> b!1293981 m!1186319))

(declare-fun m!1186321 () Bool)

(assert (=> b!1293981 m!1186321))

(declare-fun m!1186323 () Bool)

(assert (=> b!1293982 m!1186323))

(declare-fun m!1186325 () Bool)

(assert (=> b!1293983 m!1186325))

(assert (=> b!1293983 m!1186325))

(declare-fun m!1186327 () Bool)

(assert (=> b!1293983 m!1186327))

(declare-fun m!1186329 () Bool)

(assert (=> b!1293985 m!1186329))

(check-sat (not b!1293975) (not b!1293981) (not mapNonEmpty!53252) (not start!109332) tp_is_empty!34461 b_and!46911 (not b_next!28821) (not b!1293982) (not b!1293983) (not b!1293985))
(check-sat b_and!46911 (not b_next!28821))
