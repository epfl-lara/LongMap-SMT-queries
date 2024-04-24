; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109374 () Bool)

(assert start!109374)

(declare-fun b_free!28639 () Bool)

(declare-fun b_next!28639 () Bool)

(assert (=> start!109374 (= b_free!28639 (not b_next!28639))))

(declare-fun tp!101036 () Bool)

(declare-fun b_and!46731 () Bool)

(assert (=> start!109374 (= tp!101036 b_and!46731)))

(declare-fun b!1292090 () Bool)

(declare-fun e!737739 () Bool)

(declare-fun e!737734 () Bool)

(declare-fun mapRes!52979 () Bool)

(assert (=> b!1292090 (= e!737739 (and e!737734 mapRes!52979))))

(declare-fun condMapEmpty!52979 () Bool)

(declare-datatypes ((V!50809 0))(
  ( (V!50810 (val!17214 Int)) )
))
(declare-datatypes ((ValueCell!16241 0))(
  ( (ValueCellFull!16241 (v!19812 V!50809)) (EmptyCell!16241) )
))
(declare-datatypes ((array!85635 0))(
  ( (array!85636 (arr!41314 (Array (_ BitVec 32) ValueCell!16241)) (size!41865 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85635)

(declare-fun mapDefault!52979 () ValueCell!16241)

(assert (=> b!1292090 (= condMapEmpty!52979 (= (arr!41314 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16241)) mapDefault!52979)))))

(declare-fun b!1292091 () Bool)

(declare-fun res!858047 () Bool)

(declare-fun e!737738 () Bool)

(assert (=> b!1292091 (=> (not res!858047) (not e!737738))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85637 0))(
  ( (array!85638 (arr!41315 (Array (_ BitVec 32) (_ BitVec 64))) (size!41866 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85637)

(assert (=> b!1292091 (= res!858047 (and (= (size!41865 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41866 _keys!1741) (size!41865 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52979 () Bool)

(declare-fun tp!101035 () Bool)

(declare-fun e!737736 () Bool)

(assert (=> mapNonEmpty!52979 (= mapRes!52979 (and tp!101035 e!737736))))

(declare-fun mapKey!52979 () (_ BitVec 32))

(declare-fun mapValue!52979 () ValueCell!16241)

(declare-fun mapRest!52979 () (Array (_ BitVec 32) ValueCell!16241))

(assert (=> mapNonEmpty!52979 (= (arr!41314 _values!1445) (store mapRest!52979 mapKey!52979 mapValue!52979))))

(declare-fun mapIsEmpty!52979 () Bool)

(assert (=> mapIsEmpty!52979 mapRes!52979))

(declare-fun b!1292092 () Bool)

(declare-fun res!858048 () Bool)

(assert (=> b!1292092 (=> (not res!858048) (not e!737738))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292092 (= res!858048 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41866 _keys!1741))))))

(declare-fun b!1292093 () Bool)

(declare-fun res!858050 () Bool)

(assert (=> b!1292093 (=> (not res!858050) (not e!737738))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1292093 (= res!858050 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41866 _keys!1741))))))

(declare-fun res!858049 () Bool)

(assert (=> start!109374 (=> (not res!858049) (not e!737738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109374 (= res!858049 (validMask!0 mask!2175))))

(assert (=> start!109374 e!737738))

(declare-fun tp_is_empty!34279 () Bool)

(assert (=> start!109374 tp_is_empty!34279))

(assert (=> start!109374 true))

(declare-fun array_inv!31537 (array!85635) Bool)

(assert (=> start!109374 (and (array_inv!31537 _values!1445) e!737739)))

(declare-fun array_inv!31538 (array!85637) Bool)

(assert (=> start!109374 (array_inv!31538 _keys!1741)))

(assert (=> start!109374 tp!101036))

(declare-fun b!1292094 () Bool)

(declare-fun e!737737 () Bool)

(assert (=> b!1292094 (= e!737738 (not e!737737))))

(declare-fun res!858054 () Bool)

(assert (=> b!1292094 (=> res!858054 e!737737)))

(assert (=> b!1292094 (= res!858054 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22142 0))(
  ( (tuple2!22143 (_1!11082 (_ BitVec 64)) (_2!11082 V!50809)) )
))
(declare-datatypes ((List!29315 0))(
  ( (Nil!29312) (Cons!29311 (h!30529 tuple2!22142) (t!42871 List!29315)) )
))
(declare-datatypes ((ListLongMap!19807 0))(
  ( (ListLongMap!19808 (toList!9919 List!29315)) )
))
(declare-fun contains!8050 (ListLongMap!19807 (_ BitVec 64)) Bool)

(assert (=> b!1292094 (not (contains!8050 (ListLongMap!19808 Nil!29312) k0!1205))))

(declare-datatypes ((Unit!42685 0))(
  ( (Unit!42686) )
))
(declare-fun lt!579288 () Unit!42685)

(declare-fun emptyContainsNothing!91 ((_ BitVec 64)) Unit!42685)

(assert (=> b!1292094 (= lt!579288 (emptyContainsNothing!91 k0!1205))))

(declare-fun b!1292095 () Bool)

(assert (=> b!1292095 (= e!737734 tp_is_empty!34279)))

(declare-fun b!1292096 () Bool)

(declare-fun res!858055 () Bool)

(assert (=> b!1292096 (=> (not res!858055) (not e!737738))))

(declare-fun minValue!1387 () V!50809)

(declare-fun zeroValue!1387 () V!50809)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4957 (array!85637 array!85635 (_ BitVec 32) (_ BitVec 32) V!50809 V!50809 (_ BitVec 32) Int) ListLongMap!19807)

(assert (=> b!1292096 (= res!858055 (contains!8050 (getCurrentListMap!4957 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292097 () Bool)

(declare-fun res!858053 () Bool)

(assert (=> b!1292097 (=> (not res!858053) (not e!737738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85637 (_ BitVec 32)) Bool)

(assert (=> b!1292097 (= res!858053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292098 () Bool)

(assert (=> b!1292098 (= e!737736 tp_is_empty!34279)))

(declare-fun b!1292099 () Bool)

(declare-fun res!858052 () Bool)

(assert (=> b!1292099 (=> (not res!858052) (not e!737738))))

(declare-datatypes ((List!29316 0))(
  ( (Nil!29313) (Cons!29312 (h!30530 (_ BitVec 64)) (t!42872 List!29316)) )
))
(declare-fun arrayNoDuplicates!0 (array!85637 (_ BitVec 32) List!29316) Bool)

(assert (=> b!1292099 (= res!858052 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29313))))

(declare-fun b!1292100 () Bool)

(declare-fun res!858051 () Bool)

(assert (=> b!1292100 (=> (not res!858051) (not e!737738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292100 (= res!858051 (not (validKeyInArray!0 (select (arr!41315 _keys!1741) from!2144))))))

(declare-fun b!1292101 () Bool)

(assert (=> b!1292101 (= e!737737 true)))

(assert (=> b!1292101 false))

(declare-fun lt!579284 () Unit!42685)

(declare-fun lt!579285 () ListLongMap!19807)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!47 ((_ BitVec 64) (_ BitVec 64) V!50809 ListLongMap!19807) Unit!42685)

(assert (=> b!1292101 (= lt!579284 (lemmaInListMapAfterAddingDiffThenInBefore!47 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579285))))

(declare-fun lt!579283 () ListLongMap!19807)

(declare-fun +!4418 (ListLongMap!19807 tuple2!22142) ListLongMap!19807)

(assert (=> b!1292101 (not (contains!8050 (+!4418 lt!579283 (tuple2!22143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579287 () Unit!42685)

(declare-fun addStillNotContains!394 (ListLongMap!19807 (_ BitVec 64) V!50809 (_ BitVec 64)) Unit!42685)

(assert (=> b!1292101 (= lt!579287 (addStillNotContains!394 lt!579283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1292101 (not (contains!8050 lt!579285 k0!1205))))

(assert (=> b!1292101 (= lt!579285 (+!4418 lt!579283 (tuple2!22143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579286 () Unit!42685)

(assert (=> b!1292101 (= lt!579286 (addStillNotContains!394 lt!579283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6056 (array!85637 array!85635 (_ BitVec 32) (_ BitVec 32) V!50809 V!50809 (_ BitVec 32) Int) ListLongMap!19807)

(assert (=> b!1292101 (= lt!579283 (getCurrentListMapNoExtraKeys!6056 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109374 res!858049) b!1292091))

(assert (= (and b!1292091 res!858047) b!1292097))

(assert (= (and b!1292097 res!858053) b!1292099))

(assert (= (and b!1292099 res!858052) b!1292092))

(assert (= (and b!1292092 res!858048) b!1292096))

(assert (= (and b!1292096 res!858055) b!1292093))

(assert (= (and b!1292093 res!858050) b!1292100))

(assert (= (and b!1292100 res!858051) b!1292094))

(assert (= (and b!1292094 (not res!858054)) b!1292101))

(assert (= (and b!1292090 condMapEmpty!52979) mapIsEmpty!52979))

(assert (= (and b!1292090 (not condMapEmpty!52979)) mapNonEmpty!52979))

(get-info :version)

(assert (= (and mapNonEmpty!52979 ((_ is ValueCellFull!16241) mapValue!52979)) b!1292098))

(assert (= (and b!1292090 ((_ is ValueCellFull!16241) mapDefault!52979)) b!1292095))

(assert (= start!109374 b!1292090))

(declare-fun m!1185033 () Bool)

(assert (=> b!1292097 m!1185033))

(declare-fun m!1185035 () Bool)

(assert (=> mapNonEmpty!52979 m!1185035))

(declare-fun m!1185037 () Bool)

(assert (=> start!109374 m!1185037))

(declare-fun m!1185039 () Bool)

(assert (=> start!109374 m!1185039))

(declare-fun m!1185041 () Bool)

(assert (=> start!109374 m!1185041))

(declare-fun m!1185043 () Bool)

(assert (=> b!1292099 m!1185043))

(declare-fun m!1185045 () Bool)

(assert (=> b!1292100 m!1185045))

(assert (=> b!1292100 m!1185045))

(declare-fun m!1185047 () Bool)

(assert (=> b!1292100 m!1185047))

(declare-fun m!1185049 () Bool)

(assert (=> b!1292094 m!1185049))

(declare-fun m!1185051 () Bool)

(assert (=> b!1292094 m!1185051))

(declare-fun m!1185053 () Bool)

(assert (=> b!1292101 m!1185053))

(declare-fun m!1185055 () Bool)

(assert (=> b!1292101 m!1185055))

(declare-fun m!1185057 () Bool)

(assert (=> b!1292101 m!1185057))

(declare-fun m!1185059 () Bool)

(assert (=> b!1292101 m!1185059))

(declare-fun m!1185061 () Bool)

(assert (=> b!1292101 m!1185061))

(declare-fun m!1185063 () Bool)

(assert (=> b!1292101 m!1185063))

(declare-fun m!1185065 () Bool)

(assert (=> b!1292101 m!1185065))

(assert (=> b!1292101 m!1185061))

(declare-fun m!1185067 () Bool)

(assert (=> b!1292101 m!1185067))

(declare-fun m!1185069 () Bool)

(assert (=> b!1292096 m!1185069))

(assert (=> b!1292096 m!1185069))

(declare-fun m!1185071 () Bool)

(assert (=> b!1292096 m!1185071))

(check-sat (not mapNonEmpty!52979) tp_is_empty!34279 (not b!1292100) b_and!46731 (not b!1292094) (not b!1292096) (not b!1292097) (not b!1292099) (not b!1292101) (not start!109374) (not b_next!28639))
(check-sat b_and!46731 (not b_next!28639))
