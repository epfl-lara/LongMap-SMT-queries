; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111418 () Bool)

(assert start!111418)

(declare-fun b_free!30075 () Bool)

(declare-fun b_next!30075 () Bool)

(assert (=> start!111418 (= b_free!30075 (not b_next!30075))))

(declare-fun tp!105701 () Bool)

(declare-fun b_and!48309 () Bool)

(assert (=> start!111418 (= tp!105701 b_and!48309)))

(declare-fun b!1318530 () Bool)

(declare-fun e!752403 () Bool)

(declare-fun e!752401 () Bool)

(declare-fun mapRes!55490 () Bool)

(assert (=> b!1318530 (= e!752403 (and e!752401 mapRes!55490))))

(declare-fun condMapEmpty!55490 () Bool)

(declare-datatypes ((V!52963 0))(
  ( (V!52964 (val!18022 Int)) )
))
(declare-datatypes ((ValueCell!17049 0))(
  ( (ValueCellFull!17049 (v!20652 V!52963)) (EmptyCell!17049) )
))
(declare-datatypes ((array!88734 0))(
  ( (array!88735 (arr!42841 (Array (_ BitVec 32) ValueCell!17049)) (size!43391 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88734)

(declare-fun mapDefault!55490 () ValueCell!17049)

(assert (=> b!1318530 (= condMapEmpty!55490 (= (arr!42841 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17049)) mapDefault!55490)))))

(declare-fun b!1318531 () Bool)

(declare-fun res!875079 () Bool)

(declare-fun e!752400 () Bool)

(assert (=> b!1318531 (=> (not res!875079) (not e!752400))))

(declare-datatypes ((array!88736 0))(
  ( (array!88737 (arr!42842 (Array (_ BitVec 32) (_ BitVec 64))) (size!43392 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88736)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88736 (_ BitVec 32)) Bool)

(assert (=> b!1318531 (= res!875079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318532 () Bool)

(declare-fun res!875083 () Bool)

(assert (=> b!1318532 (=> (not res!875083) (not e!752400))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318532 (= res!875083 (validKeyInArray!0 (select (arr!42842 _keys!1609) from!2000)))))

(declare-fun b!1318533 () Bool)

(declare-fun res!875082 () Bool)

(assert (=> b!1318533 (=> (not res!875082) (not e!752400))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318533 (= res!875082 (and (= (size!43391 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43392 _keys!1609) (size!43391 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318534 () Bool)

(assert (=> b!1318534 (= e!752400 (not true))))

(declare-datatypes ((tuple2!23192 0))(
  ( (tuple2!23193 (_1!11607 (_ BitVec 64)) (_2!11607 V!52963)) )
))
(declare-datatypes ((List!30348 0))(
  ( (Nil!30345) (Cons!30344 (h!31553 tuple2!23192) (t!43972 List!30348)) )
))
(declare-datatypes ((ListLongMap!20849 0))(
  ( (ListLongMap!20850 (toList!10440 List!30348)) )
))
(declare-fun lt!586484 () ListLongMap!20849)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8595 (ListLongMap!20849 (_ BitVec 64)) Bool)

(assert (=> b!1318534 (contains!8595 lt!586484 k0!1164)))

(declare-datatypes ((Unit!43422 0))(
  ( (Unit!43423) )
))
(declare-fun lt!586485 () Unit!43422)

(declare-fun minValue!1279 () V!52963)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!97 ((_ BitVec 64) (_ BitVec 64) V!52963 ListLongMap!20849) Unit!43422)

(assert (=> b!1318534 (= lt!586485 (lemmaInListMapAfterAddingDiffThenInBefore!97 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586484))))

(declare-fun zeroValue!1279 () V!52963)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4501 (ListLongMap!20849 tuple2!23192) ListLongMap!20849)

(declare-fun getCurrentListMapNoExtraKeys!6136 (array!88736 array!88734 (_ BitVec 32) (_ BitVec 32) V!52963 V!52963 (_ BitVec 32) Int) ListLongMap!20849)

(declare-fun get!21517 (ValueCell!17049 V!52963) V!52963)

(declare-fun dynLambda!3440 (Int (_ BitVec 64)) V!52963)

(assert (=> b!1318534 (= lt!586484 (+!4501 (+!4501 (getCurrentListMapNoExtraKeys!6136 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23193 (select (arr!42842 _keys!1609) from!2000) (get!21517 (select (arr!42841 _values!1337) from!2000) (dynLambda!3440 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23193 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318535 () Bool)

(declare-fun res!875077 () Bool)

(assert (=> b!1318535 (=> (not res!875077) (not e!752400))))

(assert (=> b!1318535 (= res!875077 (not (= (select (arr!42842 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318536 () Bool)

(declare-fun e!752402 () Bool)

(declare-fun tp_is_empty!35895 () Bool)

(assert (=> b!1318536 (= e!752402 tp_is_empty!35895)))

(declare-fun mapIsEmpty!55490 () Bool)

(assert (=> mapIsEmpty!55490 mapRes!55490))

(declare-fun res!875084 () Bool)

(assert (=> start!111418 (=> (not res!875084) (not e!752400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111418 (= res!875084 (validMask!0 mask!2019))))

(assert (=> start!111418 e!752400))

(declare-fun array_inv!32351 (array!88736) Bool)

(assert (=> start!111418 (array_inv!32351 _keys!1609)))

(assert (=> start!111418 true))

(assert (=> start!111418 tp_is_empty!35895))

(declare-fun array_inv!32352 (array!88734) Bool)

(assert (=> start!111418 (and (array_inv!32352 _values!1337) e!752403)))

(assert (=> start!111418 tp!105701))

(declare-fun mapNonEmpty!55490 () Bool)

(declare-fun tp!105700 () Bool)

(assert (=> mapNonEmpty!55490 (= mapRes!55490 (and tp!105700 e!752402))))

(declare-fun mapValue!55490 () ValueCell!17049)

(declare-fun mapRest!55490 () (Array (_ BitVec 32) ValueCell!17049))

(declare-fun mapKey!55490 () (_ BitVec 32))

(assert (=> mapNonEmpty!55490 (= (arr!42841 _values!1337) (store mapRest!55490 mapKey!55490 mapValue!55490))))

(declare-fun b!1318537 () Bool)

(declare-fun res!875078 () Bool)

(assert (=> b!1318537 (=> (not res!875078) (not e!752400))))

(assert (=> b!1318537 (= res!875078 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43392 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318538 () Bool)

(declare-fun res!875081 () Bool)

(assert (=> b!1318538 (=> (not res!875081) (not e!752400))))

(declare-fun getCurrentListMap!5453 (array!88736 array!88734 (_ BitVec 32) (_ BitVec 32) V!52963 V!52963 (_ BitVec 32) Int) ListLongMap!20849)

(assert (=> b!1318538 (= res!875081 (contains!8595 (getCurrentListMap!5453 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318539 () Bool)

(declare-fun res!875080 () Bool)

(assert (=> b!1318539 (=> (not res!875080) (not e!752400))))

(declare-datatypes ((List!30349 0))(
  ( (Nil!30346) (Cons!30345 (h!31554 (_ BitVec 64)) (t!43973 List!30349)) )
))
(declare-fun arrayNoDuplicates!0 (array!88736 (_ BitVec 32) List!30349) Bool)

(assert (=> b!1318539 (= res!875080 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30346))))

(declare-fun b!1318540 () Bool)

(assert (=> b!1318540 (= e!752401 tp_is_empty!35895)))

(assert (= (and start!111418 res!875084) b!1318533))

(assert (= (and b!1318533 res!875082) b!1318531))

(assert (= (and b!1318531 res!875079) b!1318539))

(assert (= (and b!1318539 res!875080) b!1318537))

(assert (= (and b!1318537 res!875078) b!1318538))

(assert (= (and b!1318538 res!875081) b!1318535))

(assert (= (and b!1318535 res!875077) b!1318532))

(assert (= (and b!1318532 res!875083) b!1318534))

(assert (= (and b!1318530 condMapEmpty!55490) mapIsEmpty!55490))

(assert (= (and b!1318530 (not condMapEmpty!55490)) mapNonEmpty!55490))

(get-info :version)

(assert (= (and mapNonEmpty!55490 ((_ is ValueCellFull!17049) mapValue!55490)) b!1318536))

(assert (= (and b!1318530 ((_ is ValueCellFull!17049) mapDefault!55490)) b!1318540))

(assert (= start!111418 b!1318530))

(declare-fun b_lambda!23401 () Bool)

(assert (=> (not b_lambda!23401) (not b!1318534)))

(declare-fun t!43971 () Bool)

(declare-fun tb!11427 () Bool)

(assert (=> (and start!111418 (= defaultEntry!1340 defaultEntry!1340) t!43971) tb!11427))

(declare-fun result!23909 () Bool)

(assert (=> tb!11427 (= result!23909 tp_is_empty!35895)))

(assert (=> b!1318534 t!43971))

(declare-fun b_and!48311 () Bool)

(assert (= b_and!48309 (and (=> t!43971 result!23909) b_and!48311)))

(declare-fun m!1206099 () Bool)

(assert (=> b!1318532 m!1206099))

(assert (=> b!1318532 m!1206099))

(declare-fun m!1206101 () Bool)

(assert (=> b!1318532 m!1206101))

(declare-fun m!1206103 () Bool)

(assert (=> start!111418 m!1206103))

(declare-fun m!1206105 () Bool)

(assert (=> start!111418 m!1206105))

(declare-fun m!1206107 () Bool)

(assert (=> start!111418 m!1206107))

(declare-fun m!1206109 () Bool)

(assert (=> b!1318534 m!1206109))

(declare-fun m!1206111 () Bool)

(assert (=> b!1318534 m!1206111))

(assert (=> b!1318534 m!1206109))

(declare-fun m!1206113 () Bool)

(assert (=> b!1318534 m!1206113))

(declare-fun m!1206115 () Bool)

(assert (=> b!1318534 m!1206115))

(declare-fun m!1206117 () Bool)

(assert (=> b!1318534 m!1206117))

(declare-fun m!1206119 () Bool)

(assert (=> b!1318534 m!1206119))

(assert (=> b!1318534 m!1206113))

(declare-fun m!1206121 () Bool)

(assert (=> b!1318534 m!1206121))

(assert (=> b!1318534 m!1206117))

(assert (=> b!1318534 m!1206111))

(declare-fun m!1206123 () Bool)

(assert (=> b!1318534 m!1206123))

(assert (=> b!1318534 m!1206099))

(declare-fun m!1206125 () Bool)

(assert (=> b!1318538 m!1206125))

(assert (=> b!1318538 m!1206125))

(declare-fun m!1206127 () Bool)

(assert (=> b!1318538 m!1206127))

(declare-fun m!1206129 () Bool)

(assert (=> b!1318531 m!1206129))

(assert (=> b!1318535 m!1206099))

(declare-fun m!1206131 () Bool)

(assert (=> b!1318539 m!1206131))

(declare-fun m!1206133 () Bool)

(assert (=> mapNonEmpty!55490 m!1206133))

(check-sat tp_is_empty!35895 (not b_lambda!23401) (not mapNonEmpty!55490) (not b!1318534) (not b_next!30075) (not b!1318532) (not b!1318531) (not start!111418) b_and!48311 (not b!1318538) (not b!1318539))
(check-sat b_and!48311 (not b_next!30075))
