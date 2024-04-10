; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111568 () Bool)

(assert start!111568)

(declare-fun b_free!30225 () Bool)

(declare-fun b_next!30225 () Bool)

(assert (=> start!111568 (= b_free!30225 (not b_next!30225))))

(declare-fun tp!106151 () Bool)

(declare-fun b_and!48609 () Bool)

(assert (=> start!111568 (= tp!106151 b_and!48609)))

(declare-fun b!1321155 () Bool)

(declare-fun e!753527 () Bool)

(declare-fun tp_is_empty!36045 () Bool)

(assert (=> b!1321155 (= e!753527 tp_is_empty!36045)))

(declare-fun b!1321156 () Bool)

(declare-fun res!876884 () Bool)

(declare-fun e!753528 () Bool)

(assert (=> b!1321156 (=> (not res!876884) (not e!753528))))

(declare-datatypes ((array!89018 0))(
  ( (array!89019 (arr!42983 (Array (_ BitVec 32) (_ BitVec 64))) (size!43533 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89018)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321156 (= res!876884 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43533 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55715 () Bool)

(declare-fun mapRes!55715 () Bool)

(assert (=> mapIsEmpty!55715 mapRes!55715))

(declare-fun b!1321157 () Bool)

(declare-fun res!876878 () Bool)

(assert (=> b!1321157 (=> (not res!876878) (not e!753528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321157 (= res!876878 (validKeyInArray!0 (select (arr!42983 _keys!1609) from!2000)))))

(declare-fun b!1321159 () Bool)

(declare-fun res!876883 () Bool)

(assert (=> b!1321159 (=> (not res!876883) (not e!753528))))

(declare-datatypes ((V!53163 0))(
  ( (V!53164 (val!18097 Int)) )
))
(declare-fun zeroValue!1279 () V!53163)

(declare-datatypes ((ValueCell!17124 0))(
  ( (ValueCellFull!17124 (v!20727 V!53163)) (EmptyCell!17124) )
))
(declare-datatypes ((array!89020 0))(
  ( (array!89021 (arr!42984 (Array (_ BitVec 32) ValueCell!17124)) (size!43534 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89020)

(declare-fun minValue!1279 () V!53163)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23308 0))(
  ( (tuple2!23309 (_1!11665 (_ BitVec 64)) (_2!11665 V!53163)) )
))
(declare-datatypes ((List!30456 0))(
  ( (Nil!30453) (Cons!30452 (h!31661 tuple2!23308) (t!44230 List!30456)) )
))
(declare-datatypes ((ListLongMap!20965 0))(
  ( (ListLongMap!20966 (toList!10498 List!30456)) )
))
(declare-fun contains!8653 (ListLongMap!20965 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5501 (array!89018 array!89020 (_ BitVec 32) (_ BitVec 32) V!53163 V!53163 (_ BitVec 32) Int) ListLongMap!20965)

(assert (=> b!1321159 (= res!876883 (contains!8653 (getCurrentListMap!5501 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55715 () Bool)

(declare-fun tp!106150 () Bool)

(declare-fun e!753526 () Bool)

(assert (=> mapNonEmpty!55715 (= mapRes!55715 (and tp!106150 e!753526))))

(declare-fun mapValue!55715 () ValueCell!17124)

(declare-fun mapRest!55715 () (Array (_ BitVec 32) ValueCell!17124))

(declare-fun mapKey!55715 () (_ BitVec 32))

(assert (=> mapNonEmpty!55715 (= (arr!42984 _values!1337) (store mapRest!55715 mapKey!55715 mapValue!55715))))

(declare-fun b!1321160 () Bool)

(declare-fun res!876881 () Bool)

(assert (=> b!1321160 (=> (not res!876881) (not e!753528))))

(assert (=> b!1321160 (= res!876881 (and (= (size!43534 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43533 _keys!1609) (size!43534 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321161 () Bool)

(declare-fun res!876880 () Bool)

(assert (=> b!1321161 (=> (not res!876880) (not e!753528))))

(declare-datatypes ((List!30457 0))(
  ( (Nil!30454) (Cons!30453 (h!31662 (_ BitVec 64)) (t!44231 List!30457)) )
))
(declare-fun arrayNoDuplicates!0 (array!89018 (_ BitVec 32) List!30457) Bool)

(assert (=> b!1321161 (= res!876880 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30454))))

(declare-fun b!1321162 () Bool)

(assert (=> b!1321162 (= e!753528 (not true))))

(declare-fun lt!587295 () ListLongMap!20965)

(assert (=> b!1321162 (contains!8653 lt!587295 k0!1164)))

(declare-datatypes ((Unit!43530 0))(
  ( (Unit!43531) )
))
(declare-fun lt!587294 () Unit!43530)

(declare-fun lt!587296 () V!53163)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!151 ((_ BitVec 64) (_ BitVec 64) V!53163 ListLongMap!20965) Unit!43530)

(assert (=> b!1321162 (= lt!587294 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 (select (arr!42983 _keys!1609) from!2000) lt!587296 lt!587295))))

(declare-fun lt!587298 () ListLongMap!20965)

(assert (=> b!1321162 (contains!8653 lt!587298 k0!1164)))

(declare-fun lt!587297 () Unit!43530)

(assert (=> b!1321162 (= lt!587297 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587298))))

(declare-fun lt!587292 () ListLongMap!20965)

(assert (=> b!1321162 (contains!8653 lt!587292 k0!1164)))

(declare-fun lt!587293 () Unit!43530)

(assert (=> b!1321162 (= lt!587293 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587292))))

(declare-fun +!4555 (ListLongMap!20965 tuple2!23308) ListLongMap!20965)

(assert (=> b!1321162 (= lt!587292 (+!4555 lt!587298 (tuple2!23309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321162 (= lt!587298 (+!4555 lt!587295 (tuple2!23309 (select (arr!42983 _keys!1609) from!2000) lt!587296)))))

(declare-fun get!21621 (ValueCell!17124 V!53163) V!53163)

(declare-fun dynLambda!3494 (Int (_ BitVec 64)) V!53163)

(assert (=> b!1321162 (= lt!587296 (get!21621 (select (arr!42984 _values!1337) from!2000) (dynLambda!3494 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6190 (array!89018 array!89020 (_ BitVec 32) (_ BitVec 32) V!53163 V!53163 (_ BitVec 32) Int) ListLongMap!20965)

(assert (=> b!1321162 (= lt!587295 (getCurrentListMapNoExtraKeys!6190 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321163 () Bool)

(declare-fun res!876879 () Bool)

(assert (=> b!1321163 (=> (not res!876879) (not e!753528))))

(assert (=> b!1321163 (= res!876879 (not (= (select (arr!42983 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321158 () Bool)

(declare-fun e!753529 () Bool)

(assert (=> b!1321158 (= e!753529 (and e!753527 mapRes!55715))))

(declare-fun condMapEmpty!55715 () Bool)

(declare-fun mapDefault!55715 () ValueCell!17124)

(assert (=> b!1321158 (= condMapEmpty!55715 (= (arr!42984 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17124)) mapDefault!55715)))))

(declare-fun res!876877 () Bool)

(assert (=> start!111568 (=> (not res!876877) (not e!753528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111568 (= res!876877 (validMask!0 mask!2019))))

(assert (=> start!111568 e!753528))

(declare-fun array_inv!32449 (array!89018) Bool)

(assert (=> start!111568 (array_inv!32449 _keys!1609)))

(assert (=> start!111568 true))

(assert (=> start!111568 tp_is_empty!36045))

(declare-fun array_inv!32450 (array!89020) Bool)

(assert (=> start!111568 (and (array_inv!32450 _values!1337) e!753529)))

(assert (=> start!111568 tp!106151))

(declare-fun b!1321164 () Bool)

(declare-fun res!876882 () Bool)

(assert (=> b!1321164 (=> (not res!876882) (not e!753528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89018 (_ BitVec 32)) Bool)

(assert (=> b!1321164 (= res!876882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321165 () Bool)

(assert (=> b!1321165 (= e!753526 tp_is_empty!36045)))

(assert (= (and start!111568 res!876877) b!1321160))

(assert (= (and b!1321160 res!876881) b!1321164))

(assert (= (and b!1321164 res!876882) b!1321161))

(assert (= (and b!1321161 res!876880) b!1321156))

(assert (= (and b!1321156 res!876884) b!1321159))

(assert (= (and b!1321159 res!876883) b!1321163))

(assert (= (and b!1321163 res!876879) b!1321157))

(assert (= (and b!1321157 res!876878) b!1321162))

(assert (= (and b!1321158 condMapEmpty!55715) mapIsEmpty!55715))

(assert (= (and b!1321158 (not condMapEmpty!55715)) mapNonEmpty!55715))

(get-info :version)

(assert (= (and mapNonEmpty!55715 ((_ is ValueCellFull!17124) mapValue!55715)) b!1321165))

(assert (= (and b!1321158 ((_ is ValueCellFull!17124) mapDefault!55715)) b!1321155))

(assert (= start!111568 b!1321158))

(declare-fun b_lambda!23551 () Bool)

(assert (=> (not b_lambda!23551) (not b!1321162)))

(declare-fun t!44229 () Bool)

(declare-fun tb!11577 () Bool)

(assert (=> (and start!111568 (= defaultEntry!1340 defaultEntry!1340) t!44229) tb!11577))

(declare-fun result!24209 () Bool)

(assert (=> tb!11577 (= result!24209 tp_is_empty!36045)))

(assert (=> b!1321162 t!44229))

(declare-fun b_and!48611 () Bool)

(assert (= b_and!48609 (and (=> t!44229 result!24209) b_and!48611)))

(declare-fun m!1209011 () Bool)

(assert (=> start!111568 m!1209011))

(declare-fun m!1209013 () Bool)

(assert (=> start!111568 m!1209013))

(declare-fun m!1209015 () Bool)

(assert (=> start!111568 m!1209015))

(declare-fun m!1209017 () Bool)

(assert (=> b!1321162 m!1209017))

(declare-fun m!1209019 () Bool)

(assert (=> b!1321162 m!1209019))

(declare-fun m!1209021 () Bool)

(assert (=> b!1321162 m!1209021))

(declare-fun m!1209023 () Bool)

(assert (=> b!1321162 m!1209023))

(declare-fun m!1209025 () Bool)

(assert (=> b!1321162 m!1209025))

(declare-fun m!1209027 () Bool)

(assert (=> b!1321162 m!1209027))

(declare-fun m!1209029 () Bool)

(assert (=> b!1321162 m!1209029))

(declare-fun m!1209031 () Bool)

(assert (=> b!1321162 m!1209031))

(assert (=> b!1321162 m!1209025))

(declare-fun m!1209033 () Bool)

(assert (=> b!1321162 m!1209033))

(assert (=> b!1321162 m!1209021))

(declare-fun m!1209035 () Bool)

(assert (=> b!1321162 m!1209035))

(assert (=> b!1321162 m!1209031))

(declare-fun m!1209037 () Bool)

(assert (=> b!1321162 m!1209037))

(declare-fun m!1209039 () Bool)

(assert (=> b!1321162 m!1209039))

(declare-fun m!1209041 () Bool)

(assert (=> b!1321162 m!1209041))

(assert (=> b!1321157 m!1209021))

(assert (=> b!1321157 m!1209021))

(declare-fun m!1209043 () Bool)

(assert (=> b!1321157 m!1209043))

(declare-fun m!1209045 () Bool)

(assert (=> b!1321164 m!1209045))

(assert (=> b!1321163 m!1209021))

(declare-fun m!1209047 () Bool)

(assert (=> mapNonEmpty!55715 m!1209047))

(declare-fun m!1209049 () Bool)

(assert (=> b!1321161 m!1209049))

(declare-fun m!1209051 () Bool)

(assert (=> b!1321159 m!1209051))

(assert (=> b!1321159 m!1209051))

(declare-fun m!1209053 () Bool)

(assert (=> b!1321159 m!1209053))

(check-sat (not b_next!30225) tp_is_empty!36045 (not start!111568) (not b!1321162) (not b!1321161) (not b!1321164) (not b!1321159) (not b_lambda!23551) (not mapNonEmpty!55715) b_and!48611 (not b!1321157))
(check-sat b_and!48611 (not b_next!30225))
