; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111494 () Bool)

(assert start!111494)

(declare-fun b_free!30151 () Bool)

(declare-fun b_next!30151 () Bool)

(assert (=> start!111494 (= b_free!30151 (not b_next!30151))))

(declare-fun tp!105930 () Bool)

(declare-fun b_and!48443 () Bool)

(assert (=> start!111494 (= tp!105930 b_and!48443)))

(declare-fun b!1319790 () Bool)

(declare-fun e!752937 () Bool)

(assert (=> b!1319790 (= e!752937 (not true))))

(declare-datatypes ((V!53065 0))(
  ( (V!53066 (val!18060 Int)) )
))
(declare-datatypes ((tuple2!23334 0))(
  ( (tuple2!23335 (_1!11678 (_ BitVec 64)) (_2!11678 V!53065)) )
))
(declare-datatypes ((List!30471 0))(
  ( (Nil!30468) (Cons!30467 (h!31676 tuple2!23334) (t!44163 List!30471)) )
))
(declare-datatypes ((ListLongMap!20991 0))(
  ( (ListLongMap!20992 (toList!10511 List!30471)) )
))
(declare-fun lt!586569 () ListLongMap!20991)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8594 (ListLongMap!20991 (_ BitVec 64)) Bool)

(assert (=> b!1319790 (contains!8594 lt!586569 k0!1164)))

(declare-fun zeroValue!1279 () V!53065)

(declare-datatypes ((Unit!43299 0))(
  ( (Unit!43300) )
))
(declare-fun lt!586566 () Unit!43299)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!123 ((_ BitVec 64) (_ BitVec 64) V!53065 ListLongMap!20991) Unit!43299)

(assert (=> b!1319790 (= lt!586566 (lemmaInListMapAfterAddingDiffThenInBefore!123 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586569))))

(declare-fun lt!586568 () ListLongMap!20991)

(assert (=> b!1319790 (contains!8594 lt!586568 k0!1164)))

(declare-fun lt!586567 () Unit!43299)

(declare-fun minValue!1279 () V!53065)

(assert (=> b!1319790 (= lt!586567 (lemmaInListMapAfterAddingDiffThenInBefore!123 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586568))))

(declare-fun +!4558 (ListLongMap!20991 tuple2!23334) ListLongMap!20991)

(assert (=> b!1319790 (= lt!586568 (+!4558 lt!586569 (tuple2!23335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!88805 0))(
  ( (array!88806 (arr!42877 (Array (_ BitVec 32) (_ BitVec 64))) (size!43429 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88805)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17087 0))(
  ( (ValueCellFull!17087 (v!20689 V!53065)) (EmptyCell!17087) )
))
(declare-datatypes ((array!88807 0))(
  ( (array!88808 (arr!42878 (Array (_ BitVec 32) ValueCell!17087)) (size!43430 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88807)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6191 (array!88805 array!88807 (_ BitVec 32) (_ BitVec 32) V!53065 V!53065 (_ BitVec 32) Int) ListLongMap!20991)

(declare-fun get!21567 (ValueCell!17087 V!53065) V!53065)

(declare-fun dynLambda!3488 (Int (_ BitVec 64)) V!53065)

(assert (=> b!1319790 (= lt!586569 (+!4558 (getCurrentListMapNoExtraKeys!6191 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23335 (select (arr!42877 _keys!1609) from!2000) (get!21567 (select (arr!42878 _values!1337) from!2000) (dynLambda!3488 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1319791 () Bool)

(declare-fun res!875961 () Bool)

(assert (=> b!1319791 (=> (not res!875961) (not e!752937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88805 (_ BitVec 32)) Bool)

(assert (=> b!1319791 (= res!875961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55604 () Bool)

(declare-fun mapRes!55604 () Bool)

(declare-fun tp!105929 () Bool)

(declare-fun e!752940 () Bool)

(assert (=> mapNonEmpty!55604 (= mapRes!55604 (and tp!105929 e!752940))))

(declare-fun mapKey!55604 () (_ BitVec 32))

(declare-fun mapValue!55604 () ValueCell!17087)

(declare-fun mapRest!55604 () (Array (_ BitVec 32) ValueCell!17087))

(assert (=> mapNonEmpty!55604 (= (arr!42878 _values!1337) (store mapRest!55604 mapKey!55604 mapValue!55604))))

(declare-fun res!875964 () Bool)

(assert (=> start!111494 (=> (not res!875964) (not e!752937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111494 (= res!875964 (validMask!0 mask!2019))))

(assert (=> start!111494 e!752937))

(declare-fun array_inv!32561 (array!88805) Bool)

(assert (=> start!111494 (array_inv!32561 _keys!1609)))

(assert (=> start!111494 true))

(declare-fun tp_is_empty!35971 () Bool)

(assert (=> start!111494 tp_is_empty!35971))

(declare-fun e!752939 () Bool)

(declare-fun array_inv!32562 (array!88807) Bool)

(assert (=> start!111494 (and (array_inv!32562 _values!1337) e!752939)))

(assert (=> start!111494 tp!105930))

(declare-fun b!1319792 () Bool)

(declare-fun res!875963 () Bool)

(assert (=> b!1319792 (=> (not res!875963) (not e!752937))))

(assert (=> b!1319792 (= res!875963 (not (= (select (arr!42877 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319793 () Bool)

(assert (=> b!1319793 (= e!752940 tp_is_empty!35971)))

(declare-fun b!1319794 () Bool)

(declare-fun res!875965 () Bool)

(assert (=> b!1319794 (=> (not res!875965) (not e!752937))))

(assert (=> b!1319794 (= res!875965 (and (= (size!43430 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43429 _keys!1609) (size!43430 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319795 () Bool)

(declare-fun e!752941 () Bool)

(assert (=> b!1319795 (= e!752941 tp_is_empty!35971)))

(declare-fun mapIsEmpty!55604 () Bool)

(assert (=> mapIsEmpty!55604 mapRes!55604))

(declare-fun b!1319796 () Bool)

(assert (=> b!1319796 (= e!752939 (and e!752941 mapRes!55604))))

(declare-fun condMapEmpty!55604 () Bool)

(declare-fun mapDefault!55604 () ValueCell!17087)

(assert (=> b!1319796 (= condMapEmpty!55604 (= (arr!42878 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17087)) mapDefault!55604)))))

(declare-fun b!1319797 () Bool)

(declare-fun res!875966 () Bool)

(assert (=> b!1319797 (=> (not res!875966) (not e!752937))))

(assert (=> b!1319797 (= res!875966 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43429 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319798 () Bool)

(declare-fun res!875960 () Bool)

(assert (=> b!1319798 (=> (not res!875960) (not e!752937))))

(declare-fun getCurrentListMap!5401 (array!88805 array!88807 (_ BitVec 32) (_ BitVec 32) V!53065 V!53065 (_ BitVec 32) Int) ListLongMap!20991)

(assert (=> b!1319798 (= res!875960 (contains!8594 (getCurrentListMap!5401 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319799 () Bool)

(declare-fun res!875962 () Bool)

(assert (=> b!1319799 (=> (not res!875962) (not e!752937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319799 (= res!875962 (validKeyInArray!0 (select (arr!42877 _keys!1609) from!2000)))))

(declare-fun b!1319800 () Bool)

(declare-fun res!875967 () Bool)

(assert (=> b!1319800 (=> (not res!875967) (not e!752937))))

(declare-datatypes ((List!30472 0))(
  ( (Nil!30469) (Cons!30468 (h!31677 (_ BitVec 64)) (t!44164 List!30472)) )
))
(declare-fun arrayNoDuplicates!0 (array!88805 (_ BitVec 32) List!30472) Bool)

(assert (=> b!1319800 (= res!875967 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30469))))

(assert (= (and start!111494 res!875964) b!1319794))

(assert (= (and b!1319794 res!875965) b!1319791))

(assert (= (and b!1319791 res!875961) b!1319800))

(assert (= (and b!1319800 res!875967) b!1319797))

(assert (= (and b!1319797 res!875966) b!1319798))

(assert (= (and b!1319798 res!875960) b!1319792))

(assert (= (and b!1319792 res!875963) b!1319799))

(assert (= (and b!1319799 res!875962) b!1319790))

(assert (= (and b!1319796 condMapEmpty!55604) mapIsEmpty!55604))

(assert (= (and b!1319796 (not condMapEmpty!55604)) mapNonEmpty!55604))

(get-info :version)

(assert (= (and mapNonEmpty!55604 ((_ is ValueCellFull!17087) mapValue!55604)) b!1319793))

(assert (= (and b!1319796 ((_ is ValueCellFull!17087) mapDefault!55604)) b!1319795))

(assert (= start!111494 b!1319796))

(declare-fun b_lambda!23467 () Bool)

(assert (=> (not b_lambda!23467) (not b!1319790)))

(declare-fun t!44162 () Bool)

(declare-fun tb!11495 () Bool)

(assert (=> (and start!111494 (= defaultEntry!1340 defaultEntry!1340) t!44162) tb!11495))

(declare-fun result!24053 () Bool)

(assert (=> tb!11495 (= result!24053 tp_is_empty!35971)))

(assert (=> b!1319790 t!44162))

(declare-fun b_and!48445 () Bool)

(assert (= b_and!48443 (and (=> t!44162 result!24053) b_and!48445)))

(declare-fun m!1206975 () Bool)

(assert (=> b!1319791 m!1206975))

(declare-fun m!1206977 () Bool)

(assert (=> b!1319799 m!1206977))

(assert (=> b!1319799 m!1206977))

(declare-fun m!1206979 () Bool)

(assert (=> b!1319799 m!1206979))

(declare-fun m!1206981 () Bool)

(assert (=> b!1319800 m!1206981))

(assert (=> b!1319792 m!1206977))

(declare-fun m!1206983 () Bool)

(assert (=> b!1319790 m!1206983))

(declare-fun m!1206985 () Bool)

(assert (=> b!1319790 m!1206985))

(declare-fun m!1206987 () Bool)

(assert (=> b!1319790 m!1206987))

(declare-fun m!1206989 () Bool)

(assert (=> b!1319790 m!1206989))

(declare-fun m!1206991 () Bool)

(assert (=> b!1319790 m!1206991))

(assert (=> b!1319790 m!1206989))

(declare-fun m!1206993 () Bool)

(assert (=> b!1319790 m!1206993))

(declare-fun m!1206995 () Bool)

(assert (=> b!1319790 m!1206995))

(declare-fun m!1206997 () Bool)

(assert (=> b!1319790 m!1206997))

(assert (=> b!1319790 m!1206977))

(assert (=> b!1319790 m!1206985))

(declare-fun m!1206999 () Bool)

(assert (=> b!1319790 m!1206999))

(assert (=> b!1319790 m!1206993))

(declare-fun m!1207001 () Bool)

(assert (=> b!1319790 m!1207001))

(declare-fun m!1207003 () Bool)

(assert (=> b!1319798 m!1207003))

(assert (=> b!1319798 m!1207003))

(declare-fun m!1207005 () Bool)

(assert (=> b!1319798 m!1207005))

(declare-fun m!1207007 () Bool)

(assert (=> mapNonEmpty!55604 m!1207007))

(declare-fun m!1207009 () Bool)

(assert (=> start!111494 m!1207009))

(declare-fun m!1207011 () Bool)

(assert (=> start!111494 m!1207011))

(declare-fun m!1207013 () Bool)

(assert (=> start!111494 m!1207013))

(check-sat (not b_next!30151) (not b!1319798) (not b_lambda!23467) b_and!48445 (not mapNonEmpty!55604) (not b!1319800) (not start!111494) (not b!1319791) tp_is_empty!35971 (not b!1319799) (not b!1319790))
(check-sat b_and!48445 (not b_next!30151))
