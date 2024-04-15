; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109402 () Bool)

(assert start!109402)

(declare-fun b_free!28891 () Bool)

(declare-fun b_next!28891 () Bool)

(assert (=> start!109402 (= b_free!28891 (not b_next!28891))))

(declare-fun tp!101792 () Bool)

(declare-fun b_and!46963 () Bool)

(assert (=> start!109402 (= tp!101792 b_and!46963)))

(declare-fun res!860747 () Bool)

(declare-fun e!738967 () Bool)

(assert (=> start!109402 (=> (not res!860747) (not e!738967))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109402 (= res!860747 (validMask!0 mask!2175))))

(assert (=> start!109402 e!738967))

(declare-fun tp_is_empty!34531 () Bool)

(assert (=> start!109402 tp_is_empty!34531))

(assert (=> start!109402 true))

(declare-datatypes ((V!51145 0))(
  ( (V!51146 (val!17340 Int)) )
))
(declare-datatypes ((ValueCell!16367 0))(
  ( (ValueCellFull!16367 (v!19942 V!51145)) (EmptyCell!16367) )
))
(declare-datatypes ((array!85975 0))(
  ( (array!85976 (arr!41489 (Array (_ BitVec 32) ValueCell!16367)) (size!42041 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85975)

(declare-fun e!738966 () Bool)

(declare-fun array_inv!31581 (array!85975) Bool)

(assert (=> start!109402 (and (array_inv!31581 _values!1445) e!738966)))

(declare-datatypes ((array!85977 0))(
  ( (array!85978 (arr!41490 (Array (_ BitVec 32) (_ BitVec 64))) (size!42042 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85977)

(declare-fun array_inv!31582 (array!85977) Bool)

(assert (=> start!109402 (array_inv!31582 _keys!1741)))

(assert (=> start!109402 tp!101792))

(declare-fun b!1295095 () Bool)

(declare-fun e!738968 () Bool)

(assert (=> b!1295095 (= e!738968 tp_is_empty!34531)))

(declare-fun b!1295096 () Bool)

(declare-fun res!860741 () Bool)

(assert (=> b!1295096 (=> (not res!860741) (not e!738967))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1295096 (= res!860741 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42042 _keys!1741))))))

(declare-fun b!1295097 () Bool)

(declare-fun e!738969 () Bool)

(assert (=> b!1295097 (= e!738967 (not e!738969))))

(declare-fun res!860740 () Bool)

(assert (=> b!1295097 (=> res!860740 e!738969)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295097 (= res!860740 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22378 0))(
  ( (tuple2!22379 (_1!11200 (_ BitVec 64)) (_2!11200 V!51145)) )
))
(declare-datatypes ((List!29513 0))(
  ( (Nil!29510) (Cons!29509 (h!30718 tuple2!22378) (t!43069 List!29513)) )
))
(declare-datatypes ((ListLongMap!20035 0))(
  ( (ListLongMap!20036 (toList!10033 List!29513)) )
))
(declare-fun contains!8081 (ListLongMap!20035 (_ BitVec 64)) Bool)

(assert (=> b!1295097 (not (contains!8081 (ListLongMap!20036 Nil!29510) k0!1205))))

(declare-datatypes ((Unit!42736 0))(
  ( (Unit!42737) )
))
(declare-fun lt!579652 () Unit!42736)

(declare-fun emptyContainsNothing!161 ((_ BitVec 64)) Unit!42736)

(assert (=> b!1295097 (= lt!579652 (emptyContainsNothing!161 k0!1205))))

(declare-fun b!1295098 () Bool)

(declare-fun res!860745 () Bool)

(assert (=> b!1295098 (=> (not res!860745) (not e!738967))))

(assert (=> b!1295098 (= res!860745 (and (= (size!42041 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42042 _keys!1741) (size!42041 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295099 () Bool)

(declare-fun res!860746 () Bool)

(assert (=> b!1295099 (=> (not res!860746) (not e!738967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85977 (_ BitVec 32)) Bool)

(assert (=> b!1295099 (= res!860746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295100 () Bool)

(declare-fun e!738965 () Bool)

(assert (=> b!1295100 (= e!738965 tp_is_empty!34531)))

(declare-fun b!1295101 () Bool)

(declare-fun mapRes!53357 () Bool)

(assert (=> b!1295101 (= e!738966 (and e!738968 mapRes!53357))))

(declare-fun condMapEmpty!53357 () Bool)

(declare-fun mapDefault!53357 () ValueCell!16367)

(assert (=> b!1295101 (= condMapEmpty!53357 (= (arr!41489 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16367)) mapDefault!53357)))))

(declare-fun b!1295102 () Bool)

(declare-fun res!860743 () Bool)

(assert (=> b!1295102 (=> (not res!860743) (not e!738967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295102 (= res!860743 (not (validKeyInArray!0 (select (arr!41490 _keys!1741) from!2144))))))

(declare-fun b!1295103 () Bool)

(declare-fun res!860748 () Bool)

(assert (=> b!1295103 (=> (not res!860748) (not e!738967))))

(declare-datatypes ((List!29514 0))(
  ( (Nil!29511) (Cons!29510 (h!30719 (_ BitVec 64)) (t!43070 List!29514)) )
))
(declare-fun arrayNoDuplicates!0 (array!85977 (_ BitVec 32) List!29514) Bool)

(assert (=> b!1295103 (= res!860748 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29511))))

(declare-fun b!1295104 () Bool)

(assert (=> b!1295104 (= e!738969 true)))

(declare-fun lt!579650 () ListLongMap!20035)

(declare-fun minValue!1387 () V!51145)

(declare-fun +!4449 (ListLongMap!20035 tuple2!22378) ListLongMap!20035)

(assert (=> b!1295104 (not (contains!8081 (+!4449 lt!579650 (tuple2!22379 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579651 () Unit!42736)

(declare-fun addStillNotContains!426 (ListLongMap!20035 (_ BitVec 64) V!51145 (_ BitVec 64)) Unit!42736)

(assert (=> b!1295104 (= lt!579651 (addStillNotContains!426 lt!579650 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51145)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6083 (array!85977 array!85975 (_ BitVec 32) (_ BitVec 32) V!51145 V!51145 (_ BitVec 32) Int) ListLongMap!20035)

(assert (=> b!1295104 (= lt!579650 (getCurrentListMapNoExtraKeys!6083 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53357 () Bool)

(declare-fun tp!101793 () Bool)

(assert (=> mapNonEmpty!53357 (= mapRes!53357 (and tp!101793 e!738965))))

(declare-fun mapValue!53357 () ValueCell!16367)

(declare-fun mapRest!53357 () (Array (_ BitVec 32) ValueCell!16367))

(declare-fun mapKey!53357 () (_ BitVec 32))

(assert (=> mapNonEmpty!53357 (= (arr!41489 _values!1445) (store mapRest!53357 mapKey!53357 mapValue!53357))))

(declare-fun b!1295105 () Bool)

(declare-fun res!860742 () Bool)

(assert (=> b!1295105 (=> (not res!860742) (not e!738967))))

(assert (=> b!1295105 (= res!860742 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42042 _keys!1741))))))

(declare-fun b!1295106 () Bool)

(declare-fun res!860744 () Bool)

(assert (=> b!1295106 (=> (not res!860744) (not e!738967))))

(declare-fun getCurrentListMap!4959 (array!85977 array!85975 (_ BitVec 32) (_ BitVec 32) V!51145 V!51145 (_ BitVec 32) Int) ListLongMap!20035)

(assert (=> b!1295106 (= res!860744 (contains!8081 (getCurrentListMap!4959 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53357 () Bool)

(assert (=> mapIsEmpty!53357 mapRes!53357))

(assert (= (and start!109402 res!860747) b!1295098))

(assert (= (and b!1295098 res!860745) b!1295099))

(assert (= (and b!1295099 res!860746) b!1295103))

(assert (= (and b!1295103 res!860748) b!1295105))

(assert (= (and b!1295105 res!860742) b!1295106))

(assert (= (and b!1295106 res!860744) b!1295096))

(assert (= (and b!1295096 res!860741) b!1295102))

(assert (= (and b!1295102 res!860743) b!1295097))

(assert (= (and b!1295097 (not res!860740)) b!1295104))

(assert (= (and b!1295101 condMapEmpty!53357) mapIsEmpty!53357))

(assert (= (and b!1295101 (not condMapEmpty!53357)) mapNonEmpty!53357))

(get-info :version)

(assert (= (and mapNonEmpty!53357 ((_ is ValueCellFull!16367) mapValue!53357)) b!1295100))

(assert (= (and b!1295101 ((_ is ValueCellFull!16367) mapDefault!53357)) b!1295095))

(assert (= start!109402 b!1295101))

(declare-fun m!1186707 () Bool)

(assert (=> start!109402 m!1186707))

(declare-fun m!1186709 () Bool)

(assert (=> start!109402 m!1186709))

(declare-fun m!1186711 () Bool)

(assert (=> start!109402 m!1186711))

(declare-fun m!1186713 () Bool)

(assert (=> b!1295104 m!1186713))

(assert (=> b!1295104 m!1186713))

(declare-fun m!1186715 () Bool)

(assert (=> b!1295104 m!1186715))

(declare-fun m!1186717 () Bool)

(assert (=> b!1295104 m!1186717))

(declare-fun m!1186719 () Bool)

(assert (=> b!1295104 m!1186719))

(declare-fun m!1186721 () Bool)

(assert (=> b!1295106 m!1186721))

(assert (=> b!1295106 m!1186721))

(declare-fun m!1186723 () Bool)

(assert (=> b!1295106 m!1186723))

(declare-fun m!1186725 () Bool)

(assert (=> b!1295102 m!1186725))

(assert (=> b!1295102 m!1186725))

(declare-fun m!1186727 () Bool)

(assert (=> b!1295102 m!1186727))

(declare-fun m!1186729 () Bool)

(assert (=> mapNonEmpty!53357 m!1186729))

(declare-fun m!1186731 () Bool)

(assert (=> b!1295099 m!1186731))

(declare-fun m!1186733 () Bool)

(assert (=> b!1295103 m!1186733))

(declare-fun m!1186735 () Bool)

(assert (=> b!1295097 m!1186735))

(declare-fun m!1186737 () Bool)

(assert (=> b!1295097 m!1186737))

(check-sat (not start!109402) (not b!1295097) tp_is_empty!34531 b_and!46963 (not mapNonEmpty!53357) (not b!1295102) (not b!1295103) (not b!1295106) (not b_next!28891) (not b!1295104) (not b!1295099))
(check-sat b_and!46963 (not b_next!28891))
