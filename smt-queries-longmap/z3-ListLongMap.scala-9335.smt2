; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111446 () Bool)

(assert start!111446)

(declare-fun b_free!30103 () Bool)

(declare-fun b_next!30103 () Bool)

(assert (=> start!111446 (= b_free!30103 (not b_next!30103))))

(declare-fun tp!105786 () Bool)

(declare-fun b_and!48347 () Bool)

(assert (=> start!111446 (= tp!105786 b_and!48347)))

(declare-fun b!1318951 () Bool)

(declare-fun res!875385 () Bool)

(declare-fun e!752580 () Bool)

(assert (=> b!1318951 (=> (not res!875385) (not e!752580))))

(declare-datatypes ((array!88713 0))(
  ( (array!88714 (arr!42831 (Array (_ BitVec 32) (_ BitVec 64))) (size!43383 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88713)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88713 (_ BitVec 32)) Bool)

(assert (=> b!1318951 (= res!875385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318952 () Bool)

(declare-fun res!875389 () Bool)

(assert (=> b!1318952 (=> (not res!875389) (not e!752580))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53001 0))(
  ( (V!53002 (val!18036 Int)) )
))
(declare-fun zeroValue!1279 () V!53001)

(declare-datatypes ((ValueCell!17063 0))(
  ( (ValueCellFull!17063 (v!20665 V!53001)) (EmptyCell!17063) )
))
(declare-datatypes ((array!88715 0))(
  ( (array!88716 (arr!42832 (Array (_ BitVec 32) ValueCell!17063)) (size!43384 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88715)

(declare-fun minValue!1279 () V!53001)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23300 0))(
  ( (tuple2!23301 (_1!11661 (_ BitVec 64)) (_2!11661 V!53001)) )
))
(declare-datatypes ((List!30437 0))(
  ( (Nil!30434) (Cons!30433 (h!31642 tuple2!23300) (t!44081 List!30437)) )
))
(declare-datatypes ((ListLongMap!20957 0))(
  ( (ListLongMap!20958 (toList!10494 List!30437)) )
))
(declare-fun contains!8577 (ListLongMap!20957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5387 (array!88713 array!88715 (_ BitVec 32) (_ BitVec 32) V!53001 V!53001 (_ BitVec 32) Int) ListLongMap!20957)

(assert (=> b!1318952 (= res!875389 (contains!8577 (getCurrentListMap!5387 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318953 () Bool)

(declare-fun e!752577 () Bool)

(declare-fun tp_is_empty!35923 () Bool)

(assert (=> b!1318953 (= e!752577 tp_is_empty!35923)))

(declare-fun b!1318954 () Bool)

(declare-fun res!875390 () Bool)

(assert (=> b!1318954 (=> (not res!875390) (not e!752580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318954 (= res!875390 (validKeyInArray!0 (select (arr!42831 _keys!1609) from!2000)))))

(declare-fun b!1318955 () Bool)

(declare-fun res!875384 () Bool)

(assert (=> b!1318955 (=> (not res!875384) (not e!752580))))

(assert (=> b!1318955 (= res!875384 (not (= (select (arr!42831 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318956 () Bool)

(declare-fun res!875387 () Bool)

(assert (=> b!1318956 (=> (not res!875387) (not e!752580))))

(assert (=> b!1318956 (= res!875387 (and (= (size!43384 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43383 _keys!1609) (size!43384 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318957 () Bool)

(declare-fun e!752581 () Bool)

(assert (=> b!1318957 (= e!752581 tp_is_empty!35923)))

(declare-fun mapIsEmpty!55532 () Bool)

(declare-fun mapRes!55532 () Bool)

(assert (=> mapIsEmpty!55532 mapRes!55532))

(declare-fun res!875391 () Bool)

(assert (=> start!111446 (=> (not res!875391) (not e!752580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111446 (= res!875391 (validMask!0 mask!2019))))

(assert (=> start!111446 e!752580))

(declare-fun array_inv!32525 (array!88713) Bool)

(assert (=> start!111446 (array_inv!32525 _keys!1609)))

(assert (=> start!111446 true))

(assert (=> start!111446 tp_is_empty!35923))

(declare-fun e!752579 () Bool)

(declare-fun array_inv!32526 (array!88715) Bool)

(assert (=> start!111446 (and (array_inv!32526 _values!1337) e!752579)))

(assert (=> start!111446 tp!105786))

(declare-fun b!1318950 () Bool)

(declare-fun res!875386 () Bool)

(assert (=> b!1318950 (=> (not res!875386) (not e!752580))))

(declare-datatypes ((List!30438 0))(
  ( (Nil!30435) (Cons!30434 (h!31643 (_ BitVec 64)) (t!44082 List!30438)) )
))
(declare-fun arrayNoDuplicates!0 (array!88713 (_ BitVec 32) List!30438) Bool)

(assert (=> b!1318950 (= res!875386 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30435))))

(declare-fun b!1318958 () Bool)

(assert (=> b!1318958 (= e!752580 (not true))))

(declare-fun lt!586382 () ListLongMap!20957)

(assert (=> b!1318958 (contains!8577 lt!586382 k0!1164)))

(declare-datatypes ((Unit!43267 0))(
  ( (Unit!43268) )
))
(declare-fun lt!586383 () Unit!43267)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!107 ((_ BitVec 64) (_ BitVec 64) V!53001 ListLongMap!20957) Unit!43267)

(assert (=> b!1318958 (= lt!586383 (lemmaInListMapAfterAddingDiffThenInBefore!107 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586382))))

(declare-fun +!4542 (ListLongMap!20957 tuple2!23300) ListLongMap!20957)

(declare-fun getCurrentListMapNoExtraKeys!6175 (array!88713 array!88715 (_ BitVec 32) (_ BitVec 32) V!53001 V!53001 (_ BitVec 32) Int) ListLongMap!20957)

(declare-fun get!21535 (ValueCell!17063 V!53001) V!53001)

(declare-fun dynLambda!3472 (Int (_ BitVec 64)) V!53001)

(assert (=> b!1318958 (= lt!586382 (+!4542 (+!4542 (getCurrentListMapNoExtraKeys!6175 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23301 (select (arr!42831 _keys!1609) from!2000) (get!21535 (select (arr!42832 _values!1337) from!2000) (dynLambda!3472 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!55532 () Bool)

(declare-fun tp!105785 () Bool)

(assert (=> mapNonEmpty!55532 (= mapRes!55532 (and tp!105785 e!752577))))

(declare-fun mapRest!55532 () (Array (_ BitVec 32) ValueCell!17063))

(declare-fun mapValue!55532 () ValueCell!17063)

(declare-fun mapKey!55532 () (_ BitVec 32))

(assert (=> mapNonEmpty!55532 (= (arr!42832 _values!1337) (store mapRest!55532 mapKey!55532 mapValue!55532))))

(declare-fun b!1318959 () Bool)

(declare-fun res!875388 () Bool)

(assert (=> b!1318959 (=> (not res!875388) (not e!752580))))

(assert (=> b!1318959 (= res!875388 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43383 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318960 () Bool)

(assert (=> b!1318960 (= e!752579 (and e!752581 mapRes!55532))))

(declare-fun condMapEmpty!55532 () Bool)

(declare-fun mapDefault!55532 () ValueCell!17063)

(assert (=> b!1318960 (= condMapEmpty!55532 (= (arr!42832 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17063)) mapDefault!55532)))))

(assert (= (and start!111446 res!875391) b!1318956))

(assert (= (and b!1318956 res!875387) b!1318951))

(assert (= (and b!1318951 res!875385) b!1318950))

(assert (= (and b!1318950 res!875386) b!1318959))

(assert (= (and b!1318959 res!875388) b!1318952))

(assert (= (and b!1318952 res!875389) b!1318955))

(assert (= (and b!1318955 res!875384) b!1318954))

(assert (= (and b!1318954 res!875390) b!1318958))

(assert (= (and b!1318960 condMapEmpty!55532) mapIsEmpty!55532))

(assert (= (and b!1318960 (not condMapEmpty!55532)) mapNonEmpty!55532))

(get-info :version)

(assert (= (and mapNonEmpty!55532 ((_ is ValueCellFull!17063) mapValue!55532)) b!1318953))

(assert (= (and b!1318960 ((_ is ValueCellFull!17063) mapDefault!55532)) b!1318957))

(assert (= start!111446 b!1318960))

(declare-fun b_lambda!23419 () Bool)

(assert (=> (not b_lambda!23419) (not b!1318958)))

(declare-fun t!44080 () Bool)

(declare-fun tb!11447 () Bool)

(assert (=> (and start!111446 (= defaultEntry!1340 defaultEntry!1340) t!44080) tb!11447))

(declare-fun result!23957 () Bool)

(assert (=> tb!11447 (= result!23957 tp_is_empty!35923)))

(assert (=> b!1318958 t!44080))

(declare-fun b_and!48349 () Bool)

(assert (= b_and!48347 (and (=> t!44080 result!23957) b_and!48349)))

(declare-fun m!1206087 () Bool)

(assert (=> mapNonEmpty!55532 m!1206087))

(declare-fun m!1206089 () Bool)

(assert (=> b!1318952 m!1206089))

(assert (=> b!1318952 m!1206089))

(declare-fun m!1206091 () Bool)

(assert (=> b!1318952 m!1206091))

(declare-fun m!1206093 () Bool)

(assert (=> b!1318954 m!1206093))

(assert (=> b!1318954 m!1206093))

(declare-fun m!1206095 () Bool)

(assert (=> b!1318954 m!1206095))

(declare-fun m!1206097 () Bool)

(assert (=> start!111446 m!1206097))

(declare-fun m!1206099 () Bool)

(assert (=> start!111446 m!1206099))

(declare-fun m!1206101 () Bool)

(assert (=> start!111446 m!1206101))

(declare-fun m!1206103 () Bool)

(assert (=> b!1318951 m!1206103))

(assert (=> b!1318955 m!1206093))

(declare-fun m!1206105 () Bool)

(assert (=> b!1318950 m!1206105))

(declare-fun m!1206107 () Bool)

(assert (=> b!1318958 m!1206107))

(declare-fun m!1206109 () Bool)

(assert (=> b!1318958 m!1206109))

(assert (=> b!1318958 m!1206107))

(declare-fun m!1206111 () Bool)

(assert (=> b!1318958 m!1206111))

(declare-fun m!1206113 () Bool)

(assert (=> b!1318958 m!1206113))

(declare-fun m!1206115 () Bool)

(assert (=> b!1318958 m!1206115))

(assert (=> b!1318958 m!1206111))

(declare-fun m!1206117 () Bool)

(assert (=> b!1318958 m!1206117))

(assert (=> b!1318958 m!1206115))

(assert (=> b!1318958 m!1206109))

(declare-fun m!1206119 () Bool)

(assert (=> b!1318958 m!1206119))

(assert (=> b!1318958 m!1206093))

(declare-fun m!1206121 () Bool)

(assert (=> b!1318958 m!1206121))

(check-sat tp_is_empty!35923 (not start!111446) (not b_lambda!23419) (not b!1318952) (not b!1318950) (not b!1318958) (not b!1318954) (not mapNonEmpty!55532) b_and!48349 (not b!1318951) (not b_next!30103))
(check-sat b_and!48349 (not b_next!30103))
