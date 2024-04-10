; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111442 () Bool)

(assert start!111442)

(declare-fun b_free!30099 () Bool)

(declare-fun b_next!30099 () Bool)

(assert (=> start!111442 (= b_free!30099 (not b_next!30099))))

(declare-fun tp!105773 () Bool)

(declare-fun b_and!48357 () Bool)

(assert (=> start!111442 (= tp!105773 b_and!48357)))

(declare-fun mapNonEmpty!55526 () Bool)

(declare-fun mapRes!55526 () Bool)

(declare-fun tp!105772 () Bool)

(declare-fun e!752580 () Bool)

(assert (=> mapNonEmpty!55526 (= mapRes!55526 (and tp!105772 e!752580))))

(declare-datatypes ((V!52995 0))(
  ( (V!52996 (val!18034 Int)) )
))
(declare-datatypes ((ValueCell!17061 0))(
  ( (ValueCellFull!17061 (v!20664 V!52995)) (EmptyCell!17061) )
))
(declare-fun mapValue!55526 () ValueCell!17061)

(declare-fun mapRest!55526 () (Array (_ BitVec 32) ValueCell!17061))

(declare-datatypes ((array!88778 0))(
  ( (array!88779 (arr!42863 (Array (_ BitVec 32) ValueCell!17061)) (size!43413 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88778)

(declare-fun mapKey!55526 () (_ BitVec 32))

(assert (=> mapNonEmpty!55526 (= (arr!42863 _values!1337) (store mapRest!55526 mapKey!55526 mapValue!55526))))

(declare-fun mapIsEmpty!55526 () Bool)

(assert (=> mapIsEmpty!55526 mapRes!55526))

(declare-fun res!875372 () Bool)

(declare-fun e!752581 () Bool)

(assert (=> start!111442 (=> (not res!875372) (not e!752581))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111442 (= res!875372 (validMask!0 mask!2019))))

(assert (=> start!111442 e!752581))

(declare-datatypes ((array!88780 0))(
  ( (array!88781 (arr!42864 (Array (_ BitVec 32) (_ BitVec 64))) (size!43414 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88780)

(declare-fun array_inv!32363 (array!88780) Bool)

(assert (=> start!111442 (array_inv!32363 _keys!1609)))

(assert (=> start!111442 true))

(declare-fun tp_is_empty!35919 () Bool)

(assert (=> start!111442 tp_is_empty!35919))

(declare-fun e!752582 () Bool)

(declare-fun array_inv!32364 (array!88778) Bool)

(assert (=> start!111442 (and (array_inv!32364 _values!1337) e!752582)))

(assert (=> start!111442 tp!105773))

(declare-fun b!1318950 () Bool)

(declare-fun res!875365 () Bool)

(assert (=> b!1318950 (=> (not res!875365) (not e!752581))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52995)

(declare-fun minValue!1279 () V!52995)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23206 0))(
  ( (tuple2!23207 (_1!11614 (_ BitVec 64)) (_2!11614 V!52995)) )
))
(declare-datatypes ((List!30361 0))(
  ( (Nil!30358) (Cons!30357 (h!31566 tuple2!23206) (t!44009 List!30361)) )
))
(declare-datatypes ((ListLongMap!20863 0))(
  ( (ListLongMap!20864 (toList!10447 List!30361)) )
))
(declare-fun contains!8602 (ListLongMap!20863 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5459 (array!88780 array!88778 (_ BitVec 32) (_ BitVec 32) V!52995 V!52995 (_ BitVec 32) Int) ListLongMap!20863)

(assert (=> b!1318950 (= res!875365 (contains!8602 (getCurrentListMap!5459 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318951 () Bool)

(declare-fun res!875368 () Bool)

(assert (=> b!1318951 (=> (not res!875368) (not e!752581))))

(assert (=> b!1318951 (= res!875368 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43414 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318952 () Bool)

(declare-fun e!752583 () Bool)

(assert (=> b!1318952 (= e!752582 (and e!752583 mapRes!55526))))

(declare-fun condMapEmpty!55526 () Bool)

(declare-fun mapDefault!55526 () ValueCell!17061)

(assert (=> b!1318952 (= condMapEmpty!55526 (= (arr!42863 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17061)) mapDefault!55526)))))

(declare-fun b!1318953 () Bool)

(assert (=> b!1318953 (= e!752580 tp_is_empty!35919)))

(declare-fun b!1318954 () Bool)

(assert (=> b!1318954 (= e!752583 tp_is_empty!35919)))

(declare-fun b!1318955 () Bool)

(declare-fun res!875366 () Bool)

(assert (=> b!1318955 (=> (not res!875366) (not e!752581))))

(assert (=> b!1318955 (= res!875366 (and (= (size!43413 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43414 _keys!1609) (size!43413 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318956 () Bool)

(declare-fun res!875371 () Bool)

(assert (=> b!1318956 (=> (not res!875371) (not e!752581))))

(assert (=> b!1318956 (= res!875371 (not (= (select (arr!42864 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318957 () Bool)

(declare-fun res!875370 () Bool)

(assert (=> b!1318957 (=> (not res!875370) (not e!752581))))

(declare-datatypes ((List!30362 0))(
  ( (Nil!30359) (Cons!30358 (h!31567 (_ BitVec 64)) (t!44010 List!30362)) )
))
(declare-fun arrayNoDuplicates!0 (array!88780 (_ BitVec 32) List!30362) Bool)

(assert (=> b!1318957 (= res!875370 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30359))))

(declare-fun b!1318958 () Bool)

(assert (=> b!1318958 (= e!752581 (not true))))

(declare-fun lt!586557 () ListLongMap!20863)

(assert (=> b!1318958 (contains!8602 lt!586557 k0!1164)))

(declare-datatypes ((Unit!43436 0))(
  ( (Unit!43437) )
))
(declare-fun lt!586556 () Unit!43436)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!104 ((_ BitVec 64) (_ BitVec 64) V!52995 ListLongMap!20863) Unit!43436)

(assert (=> b!1318958 (= lt!586556 (lemmaInListMapAfterAddingDiffThenInBefore!104 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586557))))

(declare-fun +!4508 (ListLongMap!20863 tuple2!23206) ListLongMap!20863)

(declare-fun getCurrentListMapNoExtraKeys!6143 (array!88780 array!88778 (_ BitVec 32) (_ BitVec 32) V!52995 V!52995 (_ BitVec 32) Int) ListLongMap!20863)

(declare-fun get!21532 (ValueCell!17061 V!52995) V!52995)

(declare-fun dynLambda!3447 (Int (_ BitVec 64)) V!52995)

(assert (=> b!1318958 (= lt!586557 (+!4508 (+!4508 (getCurrentListMapNoExtraKeys!6143 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23207 (select (arr!42864 _keys!1609) from!2000) (get!21532 (select (arr!42863 _values!1337) from!2000) (dynLambda!3447 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23207 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318959 () Bool)

(declare-fun res!875369 () Bool)

(assert (=> b!1318959 (=> (not res!875369) (not e!752581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318959 (= res!875369 (validKeyInArray!0 (select (arr!42864 _keys!1609) from!2000)))))

(declare-fun b!1318960 () Bool)

(declare-fun res!875367 () Bool)

(assert (=> b!1318960 (=> (not res!875367) (not e!752581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88780 (_ BitVec 32)) Bool)

(assert (=> b!1318960 (= res!875367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111442 res!875372) b!1318955))

(assert (= (and b!1318955 res!875366) b!1318960))

(assert (= (and b!1318960 res!875367) b!1318957))

(assert (= (and b!1318957 res!875370) b!1318951))

(assert (= (and b!1318951 res!875368) b!1318950))

(assert (= (and b!1318950 res!875365) b!1318956))

(assert (= (and b!1318956 res!875371) b!1318959))

(assert (= (and b!1318959 res!875369) b!1318958))

(assert (= (and b!1318952 condMapEmpty!55526) mapIsEmpty!55526))

(assert (= (and b!1318952 (not condMapEmpty!55526)) mapNonEmpty!55526))

(get-info :version)

(assert (= (and mapNonEmpty!55526 ((_ is ValueCellFull!17061) mapValue!55526)) b!1318953))

(assert (= (and b!1318952 ((_ is ValueCellFull!17061) mapDefault!55526)) b!1318954))

(assert (= start!111442 b!1318952))

(declare-fun b_lambda!23425 () Bool)

(assert (=> (not b_lambda!23425) (not b!1318958)))

(declare-fun t!44008 () Bool)

(declare-fun tb!11451 () Bool)

(assert (=> (and start!111442 (= defaultEntry!1340 defaultEntry!1340) t!44008) tb!11451))

(declare-fun result!23957 () Bool)

(assert (=> tb!11451 (= result!23957 tp_is_empty!35919)))

(assert (=> b!1318958 t!44008))

(declare-fun b_and!48359 () Bool)

(assert (= b_and!48357 (and (=> t!44008 result!23957) b_and!48359)))

(declare-fun m!1206531 () Bool)

(assert (=> b!1318956 m!1206531))

(declare-fun m!1206533 () Bool)

(assert (=> mapNonEmpty!55526 m!1206533))

(declare-fun m!1206535 () Bool)

(assert (=> start!111442 m!1206535))

(declare-fun m!1206537 () Bool)

(assert (=> start!111442 m!1206537))

(declare-fun m!1206539 () Bool)

(assert (=> start!111442 m!1206539))

(assert (=> b!1318959 m!1206531))

(assert (=> b!1318959 m!1206531))

(declare-fun m!1206541 () Bool)

(assert (=> b!1318959 m!1206541))

(declare-fun m!1206543 () Bool)

(assert (=> b!1318958 m!1206543))

(declare-fun m!1206545 () Bool)

(assert (=> b!1318958 m!1206545))

(assert (=> b!1318958 m!1206543))

(declare-fun m!1206547 () Bool)

(assert (=> b!1318958 m!1206547))

(declare-fun m!1206549 () Bool)

(assert (=> b!1318958 m!1206549))

(declare-fun m!1206551 () Bool)

(assert (=> b!1318958 m!1206551))

(declare-fun m!1206553 () Bool)

(assert (=> b!1318958 m!1206553))

(assert (=> b!1318958 m!1206547))

(declare-fun m!1206555 () Bool)

(assert (=> b!1318958 m!1206555))

(assert (=> b!1318958 m!1206553))

(assert (=> b!1318958 m!1206545))

(declare-fun m!1206557 () Bool)

(assert (=> b!1318958 m!1206557))

(assert (=> b!1318958 m!1206531))

(declare-fun m!1206559 () Bool)

(assert (=> b!1318960 m!1206559))

(declare-fun m!1206561 () Bool)

(assert (=> b!1318957 m!1206561))

(declare-fun m!1206563 () Bool)

(assert (=> b!1318950 m!1206563))

(assert (=> b!1318950 m!1206563))

(declare-fun m!1206565 () Bool)

(assert (=> b!1318950 m!1206565))

(check-sat tp_is_empty!35919 (not b_next!30099) (not mapNonEmpty!55526) (not b!1318957) (not b_lambda!23425) (not b!1318958) b_and!48359 (not b!1318959) (not b!1318950) (not start!111442) (not b!1318960))
(check-sat b_and!48359 (not b_next!30099))
