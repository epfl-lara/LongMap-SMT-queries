; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109176 () Bool)

(assert start!109176)

(declare-fun b_free!28665 () Bool)

(declare-fun b_next!28665 () Bool)

(assert (=> start!109176 (= b_free!28665 (not b_next!28665))))

(declare-fun tp!101114 () Bool)

(declare-fun b_and!46755 () Bool)

(assert (=> start!109176 (= tp!101114 b_and!46755)))

(declare-fun res!857882 () Bool)

(declare-fun e!737125 () Bool)

(assert (=> start!109176 (=> (not res!857882) (not e!737125))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109176 (= res!857882 (validMask!0 mask!2175))))

(assert (=> start!109176 e!737125))

(declare-fun tp_is_empty!34305 () Bool)

(assert (=> start!109176 tp_is_empty!34305))

(assert (=> start!109176 true))

(declare-datatypes ((V!50843 0))(
  ( (V!50844 (val!17227 Int)) )
))
(declare-datatypes ((ValueCell!16254 0))(
  ( (ValueCellFull!16254 (v!19830 V!50843)) (EmptyCell!16254) )
))
(declare-datatypes ((array!85646 0))(
  ( (array!85647 (arr!41324 (Array (_ BitVec 32) ValueCell!16254)) (size!41874 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85646)

(declare-fun e!737124 () Bool)

(declare-fun array_inv!31315 (array!85646) Bool)

(assert (=> start!109176 (and (array_inv!31315 _values!1445) e!737124)))

(declare-datatypes ((array!85648 0))(
  ( (array!85649 (arr!41325 (Array (_ BitVec 32) (_ BitVec 64))) (size!41875 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85648)

(declare-fun array_inv!31316 (array!85648) Bool)

(assert (=> start!109176 (array_inv!31316 _keys!1741)))

(assert (=> start!109176 tp!101114))

(declare-fun b!1291253 () Bool)

(declare-fun e!737122 () Bool)

(assert (=> b!1291253 (= e!737122 true)))

(assert (=> b!1291253 false))

(declare-fun minValue!1387 () V!50843)

(declare-datatypes ((tuple2!22146 0))(
  ( (tuple2!22147 (_1!11084 (_ BitVec 64)) (_2!11084 V!50843)) )
))
(declare-datatypes ((List!29305 0))(
  ( (Nil!29302) (Cons!29301 (h!30510 tuple2!22146) (t!42869 List!29305)) )
))
(declare-datatypes ((ListLongMap!19803 0))(
  ( (ListLongMap!19804 (toList!9917 List!29305)) )
))
(declare-fun lt!579036 () ListLongMap!19803)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!42746 0))(
  ( (Unit!42747) )
))
(declare-fun lt!579033 () Unit!42746)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!55 ((_ BitVec 64) (_ BitVec 64) V!50843 ListLongMap!19803) Unit!42746)

(assert (=> b!1291253 (= lt!579033 (lemmaInListMapAfterAddingDiffThenInBefore!55 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579036))))

(declare-fun lt!579035 () ListLongMap!19803)

(declare-fun contains!8035 (ListLongMap!19803 (_ BitVec 64)) Bool)

(declare-fun +!4381 (ListLongMap!19803 tuple2!22146) ListLongMap!19803)

(assert (=> b!1291253 (not (contains!8035 (+!4381 lt!579035 (tuple2!22147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579038 () Unit!42746)

(declare-fun addStillNotContains!399 (ListLongMap!19803 (_ BitVec 64) V!50843 (_ BitVec 64)) Unit!42746)

(assert (=> b!1291253 (= lt!579038 (addStillNotContains!399 lt!579035 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291253 (not (contains!8035 lt!579036 k0!1205))))

(declare-fun zeroValue!1387 () V!50843)

(assert (=> b!1291253 (= lt!579036 (+!4381 lt!579035 (tuple2!22147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579037 () Unit!42746)

(assert (=> b!1291253 (= lt!579037 (addStillNotContains!399 lt!579035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6012 (array!85648 array!85646 (_ BitVec 32) (_ BitVec 32) V!50843 V!50843 (_ BitVec 32) Int) ListLongMap!19803)

(assert (=> b!1291253 (= lt!579035 (getCurrentListMapNoExtraKeys!6012 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291254 () Bool)

(declare-fun e!737126 () Bool)

(assert (=> b!1291254 (= e!737126 tp_is_empty!34305)))

(declare-fun b!1291255 () Bool)

(declare-fun res!857884 () Bool)

(assert (=> b!1291255 (=> (not res!857884) (not e!737125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291255 (= res!857884 (not (validKeyInArray!0 (select (arr!41325 _keys!1741) from!2144))))))

(declare-fun b!1291256 () Bool)

(declare-fun res!857886 () Bool)

(assert (=> b!1291256 (=> (not res!857886) (not e!737125))))

(assert (=> b!1291256 (= res!857886 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41875 _keys!1741))))))

(declare-fun mapIsEmpty!53018 () Bool)

(declare-fun mapRes!53018 () Bool)

(assert (=> mapIsEmpty!53018 mapRes!53018))

(declare-fun b!1291257 () Bool)

(declare-fun res!857885 () Bool)

(assert (=> b!1291257 (=> (not res!857885) (not e!737125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85648 (_ BitVec 32)) Bool)

(assert (=> b!1291257 (= res!857885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291258 () Bool)

(declare-fun res!857879 () Bool)

(assert (=> b!1291258 (=> (not res!857879) (not e!737125))))

(declare-fun getCurrentListMap!4969 (array!85648 array!85646 (_ BitVec 32) (_ BitVec 32) V!50843 V!50843 (_ BitVec 32) Int) ListLongMap!19803)

(assert (=> b!1291258 (= res!857879 (contains!8035 (getCurrentListMap!4969 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291259 () Bool)

(declare-fun e!737123 () Bool)

(assert (=> b!1291259 (= e!737123 tp_is_empty!34305)))

(declare-fun b!1291260 () Bool)

(declare-fun res!857878 () Bool)

(assert (=> b!1291260 (=> (not res!857878) (not e!737125))))

(assert (=> b!1291260 (= res!857878 (and (= (size!41874 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41875 _keys!1741) (size!41874 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53018 () Bool)

(declare-fun tp!101113 () Bool)

(assert (=> mapNonEmpty!53018 (= mapRes!53018 (and tp!101113 e!737123))))

(declare-fun mapKey!53018 () (_ BitVec 32))

(declare-fun mapRest!53018 () (Array (_ BitVec 32) ValueCell!16254))

(declare-fun mapValue!53018 () ValueCell!16254)

(assert (=> mapNonEmpty!53018 (= (arr!41324 _values!1445) (store mapRest!53018 mapKey!53018 mapValue!53018))))

(declare-fun b!1291261 () Bool)

(declare-fun res!857883 () Bool)

(assert (=> b!1291261 (=> (not res!857883) (not e!737125))))

(assert (=> b!1291261 (= res!857883 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41875 _keys!1741))))))

(declare-fun b!1291262 () Bool)

(assert (=> b!1291262 (= e!737124 (and e!737126 mapRes!53018))))

(declare-fun condMapEmpty!53018 () Bool)

(declare-fun mapDefault!53018 () ValueCell!16254)

(assert (=> b!1291262 (= condMapEmpty!53018 (= (arr!41324 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16254)) mapDefault!53018)))))

(declare-fun b!1291263 () Bool)

(assert (=> b!1291263 (= e!737125 (not e!737122))))

(declare-fun res!857881 () Bool)

(assert (=> b!1291263 (=> res!857881 e!737122)))

(assert (=> b!1291263 (= res!857881 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291263 (not (contains!8035 (ListLongMap!19804 Nil!29302) k0!1205))))

(declare-fun lt!579034 () Unit!42746)

(declare-fun emptyContainsNothing!97 ((_ BitVec 64)) Unit!42746)

(assert (=> b!1291263 (= lt!579034 (emptyContainsNothing!97 k0!1205))))

(declare-fun b!1291264 () Bool)

(declare-fun res!857880 () Bool)

(assert (=> b!1291264 (=> (not res!857880) (not e!737125))))

(declare-datatypes ((List!29306 0))(
  ( (Nil!29303) (Cons!29302 (h!30511 (_ BitVec 64)) (t!42870 List!29306)) )
))
(declare-fun arrayNoDuplicates!0 (array!85648 (_ BitVec 32) List!29306) Bool)

(assert (=> b!1291264 (= res!857880 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29303))))

(assert (= (and start!109176 res!857882) b!1291260))

(assert (= (and b!1291260 res!857878) b!1291257))

(assert (= (and b!1291257 res!857885) b!1291264))

(assert (= (and b!1291264 res!857880) b!1291256))

(assert (= (and b!1291256 res!857886) b!1291258))

(assert (= (and b!1291258 res!857879) b!1291261))

(assert (= (and b!1291261 res!857883) b!1291255))

(assert (= (and b!1291255 res!857884) b!1291263))

(assert (= (and b!1291263 (not res!857881)) b!1291253))

(assert (= (and b!1291262 condMapEmpty!53018) mapIsEmpty!53018))

(assert (= (and b!1291262 (not condMapEmpty!53018)) mapNonEmpty!53018))

(get-info :version)

(assert (= (and mapNonEmpty!53018 ((_ is ValueCellFull!16254) mapValue!53018)) b!1291259))

(assert (= (and b!1291262 ((_ is ValueCellFull!16254) mapDefault!53018)) b!1291254))

(assert (= start!109176 b!1291262))

(declare-fun m!1183935 () Bool)

(assert (=> b!1291257 m!1183935))

(declare-fun m!1183937 () Bool)

(assert (=> b!1291253 m!1183937))

(declare-fun m!1183939 () Bool)

(assert (=> b!1291253 m!1183939))

(declare-fun m!1183941 () Bool)

(assert (=> b!1291253 m!1183941))

(declare-fun m!1183943 () Bool)

(assert (=> b!1291253 m!1183943))

(assert (=> b!1291253 m!1183943))

(declare-fun m!1183945 () Bool)

(assert (=> b!1291253 m!1183945))

(declare-fun m!1183947 () Bool)

(assert (=> b!1291253 m!1183947))

(declare-fun m!1183949 () Bool)

(assert (=> b!1291253 m!1183949))

(declare-fun m!1183951 () Bool)

(assert (=> b!1291253 m!1183951))

(declare-fun m!1183953 () Bool)

(assert (=> b!1291255 m!1183953))

(assert (=> b!1291255 m!1183953))

(declare-fun m!1183955 () Bool)

(assert (=> b!1291255 m!1183955))

(declare-fun m!1183957 () Bool)

(assert (=> b!1291258 m!1183957))

(assert (=> b!1291258 m!1183957))

(declare-fun m!1183959 () Bool)

(assert (=> b!1291258 m!1183959))

(declare-fun m!1183961 () Bool)

(assert (=> b!1291263 m!1183961))

(declare-fun m!1183963 () Bool)

(assert (=> b!1291263 m!1183963))

(declare-fun m!1183965 () Bool)

(assert (=> mapNonEmpty!53018 m!1183965))

(declare-fun m!1183967 () Bool)

(assert (=> start!109176 m!1183967))

(declare-fun m!1183969 () Bool)

(assert (=> start!109176 m!1183969))

(declare-fun m!1183971 () Bool)

(assert (=> start!109176 m!1183971))

(declare-fun m!1183973 () Bool)

(assert (=> b!1291264 m!1183973))

(check-sat (not b!1291257) (not start!109176) b_and!46755 (not b!1291264) (not b!1291263) (not b!1291255) (not b!1291253) (not b!1291258) (not b_next!28665) tp_is_empty!34305 (not mapNonEmpty!53018))
(check-sat b_and!46755 (not b_next!28665))
