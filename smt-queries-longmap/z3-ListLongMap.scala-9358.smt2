; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111584 () Bool)

(assert start!111584)

(declare-fun b_free!30241 () Bool)

(declare-fun b_next!30241 () Bool)

(assert (=> start!111584 (= b_free!30241 (not b_next!30241))))

(declare-fun tp!106200 () Bool)

(declare-fun b_and!48623 () Bool)

(assert (=> start!111584 (= tp!106200 b_and!48623)))

(declare-fun b!1321365 () Bool)

(declare-fun res!877046 () Bool)

(declare-fun e!753614 () Bool)

(assert (=> b!1321365 (=> (not res!877046) (not e!753614))))

(declare-datatypes ((array!88975 0))(
  ( (array!88976 (arr!42962 (Array (_ BitVec 32) (_ BitVec 64))) (size!43514 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88975)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53185 0))(
  ( (V!53186 (val!18105 Int)) )
))
(declare-datatypes ((ValueCell!17132 0))(
  ( (ValueCellFull!17132 (v!20734 V!53185)) (EmptyCell!17132) )
))
(declare-datatypes ((array!88977 0))(
  ( (array!88978 (arr!42963 (Array (_ BitVec 32) ValueCell!17132)) (size!43515 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88977)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1321365 (= res!877046 (and (= (size!43515 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43514 _keys!1609) (size!43515 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321366 () Bool)

(declare-fun res!877040 () Bool)

(assert (=> b!1321366 (=> (not res!877040) (not e!753614))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321366 (= res!877040 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43514 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321367 () Bool)

(declare-fun res!877043 () Bool)

(assert (=> b!1321367 (=> (not res!877043) (not e!753614))))

(declare-datatypes ((List!30531 0))(
  ( (Nil!30528) (Cons!30527 (h!31736 (_ BitVec 64)) (t!44313 List!30531)) )
))
(declare-fun arrayNoDuplicates!0 (array!88975 (_ BitVec 32) List!30531) Bool)

(assert (=> b!1321367 (= res!877043 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30528))))

(declare-fun res!877044 () Bool)

(assert (=> start!111584 (=> (not res!877044) (not e!753614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111584 (= res!877044 (validMask!0 mask!2019))))

(assert (=> start!111584 e!753614))

(declare-fun array_inv!32619 (array!88975) Bool)

(assert (=> start!111584 (array_inv!32619 _keys!1609)))

(assert (=> start!111584 true))

(declare-fun tp_is_empty!36061 () Bool)

(assert (=> start!111584 tp_is_empty!36061))

(declare-fun e!753616 () Bool)

(declare-fun array_inv!32620 (array!88977) Bool)

(assert (=> start!111584 (and (array_inv!32620 _values!1337) e!753616)))

(assert (=> start!111584 tp!106200))

(declare-fun b!1321368 () Bool)

(declare-fun res!877047 () Bool)

(assert (=> b!1321368 (=> (not res!877047) (not e!753614))))

(assert (=> b!1321368 (= res!877047 (not (= (select (arr!42962 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321369 () Bool)

(declare-fun e!753612 () Bool)

(assert (=> b!1321369 (= e!753612 tp_is_empty!36061)))

(declare-fun b!1321370 () Bool)

(declare-fun res!877041 () Bool)

(assert (=> b!1321370 (=> (not res!877041) (not e!753614))))

(declare-fun minValue!1279 () V!53185)

(declare-fun defaultEntry!1340 () Int)

(declare-fun zeroValue!1279 () V!53185)

(declare-datatypes ((tuple2!23398 0))(
  ( (tuple2!23399 (_1!11710 (_ BitVec 64)) (_2!11710 V!53185)) )
))
(declare-datatypes ((List!30532 0))(
  ( (Nil!30529) (Cons!30528 (h!31737 tuple2!23398) (t!44314 List!30532)) )
))
(declare-datatypes ((ListLongMap!21055 0))(
  ( (ListLongMap!21056 (toList!10543 List!30532)) )
))
(declare-fun contains!8626 (ListLongMap!21055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5428 (array!88975 array!88977 (_ BitVec 32) (_ BitVec 32) V!53185 V!53185 (_ BitVec 32) Int) ListLongMap!21055)

(assert (=> b!1321370 (= res!877041 (contains!8626 (getCurrentListMap!5428 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321371 () Bool)

(declare-fun res!877042 () Bool)

(assert (=> b!1321371 (=> (not res!877042) (not e!753614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321371 (= res!877042 (validKeyInArray!0 (select (arr!42962 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55739 () Bool)

(declare-fun mapRes!55739 () Bool)

(assert (=> mapIsEmpty!55739 mapRes!55739))

(declare-fun b!1321372 () Bool)

(declare-fun e!753615 () Bool)

(assert (=> b!1321372 (= e!753615 tp_is_empty!36061)))

(declare-fun b!1321373 () Bool)

(assert (=> b!1321373 (= e!753614 (not true))))

(declare-fun lt!587274 () ListLongMap!21055)

(assert (=> b!1321373 (contains!8626 lt!587274 k0!1164)))

(declare-fun lt!587280 () V!53185)

(declare-datatypes ((Unit!43355 0))(
  ( (Unit!43356) )
))
(declare-fun lt!587277 () Unit!43355)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!151 ((_ BitVec 64) (_ BitVec 64) V!53185 ListLongMap!21055) Unit!43355)

(assert (=> b!1321373 (= lt!587277 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 (select (arr!42962 _keys!1609) from!2000) lt!587280 lt!587274))))

(declare-fun lt!587278 () ListLongMap!21055)

(assert (=> b!1321373 (contains!8626 lt!587278 k0!1164)))

(declare-fun lt!587275 () Unit!43355)

(assert (=> b!1321373 (= lt!587275 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587278))))

(declare-fun lt!587279 () ListLongMap!21055)

(assert (=> b!1321373 (contains!8626 lt!587279 k0!1164)))

(declare-fun lt!587276 () Unit!43355)

(assert (=> b!1321373 (= lt!587276 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587279))))

(declare-fun +!4586 (ListLongMap!21055 tuple2!23398) ListLongMap!21055)

(assert (=> b!1321373 (= lt!587279 (+!4586 lt!587278 (tuple2!23399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321373 (= lt!587278 (+!4586 lt!587274 (tuple2!23399 (select (arr!42962 _keys!1609) from!2000) lt!587280)))))

(declare-fun get!21625 (ValueCell!17132 V!53185) V!53185)

(declare-fun dynLambda!3516 (Int (_ BitVec 64)) V!53185)

(assert (=> b!1321373 (= lt!587280 (get!21625 (select (arr!42963 _values!1337) from!2000) (dynLambda!3516 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6219 (array!88975 array!88977 (_ BitVec 32) (_ BitVec 32) V!53185 V!53185 (_ BitVec 32) Int) ListLongMap!21055)

(assert (=> b!1321373 (= lt!587274 (getCurrentListMapNoExtraKeys!6219 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321374 () Bool)

(assert (=> b!1321374 (= e!753616 (and e!753612 mapRes!55739))))

(declare-fun condMapEmpty!55739 () Bool)

(declare-fun mapDefault!55739 () ValueCell!17132)

(assert (=> b!1321374 (= condMapEmpty!55739 (= (arr!42963 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17132)) mapDefault!55739)))))

(declare-fun b!1321375 () Bool)

(declare-fun res!877045 () Bool)

(assert (=> b!1321375 (=> (not res!877045) (not e!753614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88975 (_ BitVec 32)) Bool)

(assert (=> b!1321375 (= res!877045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55739 () Bool)

(declare-fun tp!106199 () Bool)

(assert (=> mapNonEmpty!55739 (= mapRes!55739 (and tp!106199 e!753615))))

(declare-fun mapKey!55739 () (_ BitVec 32))

(declare-fun mapValue!55739 () ValueCell!17132)

(declare-fun mapRest!55739 () (Array (_ BitVec 32) ValueCell!17132))

(assert (=> mapNonEmpty!55739 (= (arr!42963 _values!1337) (store mapRest!55739 mapKey!55739 mapValue!55739))))

(assert (= (and start!111584 res!877044) b!1321365))

(assert (= (and b!1321365 res!877046) b!1321375))

(assert (= (and b!1321375 res!877045) b!1321367))

(assert (= (and b!1321367 res!877043) b!1321366))

(assert (= (and b!1321366 res!877040) b!1321370))

(assert (= (and b!1321370 res!877041) b!1321368))

(assert (= (and b!1321368 res!877047) b!1321371))

(assert (= (and b!1321371 res!877042) b!1321373))

(assert (= (and b!1321374 condMapEmpty!55739) mapIsEmpty!55739))

(assert (= (and b!1321374 (not condMapEmpty!55739)) mapNonEmpty!55739))

(get-info :version)

(assert (= (and mapNonEmpty!55739 ((_ is ValueCellFull!17132) mapValue!55739)) b!1321372))

(assert (= (and b!1321374 ((_ is ValueCellFull!17132) mapDefault!55739)) b!1321369))

(assert (= start!111584 b!1321374))

(declare-fun b_lambda!23557 () Bool)

(assert (=> (not b_lambda!23557) (not b!1321373)))

(declare-fun t!44312 () Bool)

(declare-fun tb!11585 () Bool)

(assert (=> (and start!111584 (= defaultEntry!1340 defaultEntry!1340) t!44312) tb!11585))

(declare-fun result!24233 () Bool)

(assert (=> tb!11585 (= result!24233 tp_is_empty!36061)))

(assert (=> b!1321373 t!44312))

(declare-fun b_and!48625 () Bool)

(assert (= b_and!48623 (and (=> t!44312 result!24233) b_and!48625)))

(declare-fun m!1208847 () Bool)

(assert (=> mapNonEmpty!55739 m!1208847))

(declare-fun m!1208849 () Bool)

(assert (=> b!1321370 m!1208849))

(assert (=> b!1321370 m!1208849))

(declare-fun m!1208851 () Bool)

(assert (=> b!1321370 m!1208851))

(declare-fun m!1208853 () Bool)

(assert (=> b!1321368 m!1208853))

(declare-fun m!1208855 () Bool)

(assert (=> start!111584 m!1208855))

(declare-fun m!1208857 () Bool)

(assert (=> start!111584 m!1208857))

(declare-fun m!1208859 () Bool)

(assert (=> start!111584 m!1208859))

(declare-fun m!1208861 () Bool)

(assert (=> b!1321367 m!1208861))

(declare-fun m!1208863 () Bool)

(assert (=> b!1321375 m!1208863))

(assert (=> b!1321371 m!1208853))

(assert (=> b!1321371 m!1208853))

(declare-fun m!1208865 () Bool)

(assert (=> b!1321371 m!1208865))

(declare-fun m!1208867 () Bool)

(assert (=> b!1321373 m!1208867))

(declare-fun m!1208869 () Bool)

(assert (=> b!1321373 m!1208869))

(declare-fun m!1208871 () Bool)

(assert (=> b!1321373 m!1208871))

(declare-fun m!1208873 () Bool)

(assert (=> b!1321373 m!1208873))

(declare-fun m!1208875 () Bool)

(assert (=> b!1321373 m!1208875))

(declare-fun m!1208877 () Bool)

(assert (=> b!1321373 m!1208877))

(assert (=> b!1321373 m!1208853))

(declare-fun m!1208879 () Bool)

(assert (=> b!1321373 m!1208879))

(declare-fun m!1208881 () Bool)

(assert (=> b!1321373 m!1208881))

(declare-fun m!1208883 () Bool)

(assert (=> b!1321373 m!1208883))

(declare-fun m!1208885 () Bool)

(assert (=> b!1321373 m!1208885))

(assert (=> b!1321373 m!1208853))

(declare-fun m!1208887 () Bool)

(assert (=> b!1321373 m!1208887))

(assert (=> b!1321373 m!1208883))

(assert (=> b!1321373 m!1208873))

(declare-fun m!1208889 () Bool)

(assert (=> b!1321373 m!1208889))

(check-sat (not b_lambda!23557) (not start!111584) (not b!1321375) b_and!48625 (not b!1321373) (not b!1321367) (not b_next!30241) (not b!1321370) (not mapNonEmpty!55739) tp_is_empty!36061 (not b!1321371))
(check-sat b_and!48625 (not b_next!30241))
