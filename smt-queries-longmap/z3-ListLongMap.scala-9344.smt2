; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111500 () Bool)

(assert start!111500)

(declare-fun b_free!30157 () Bool)

(declare-fun b_next!30157 () Bool)

(assert (=> start!111500 (= b_free!30157 (not b_next!30157))))

(declare-fun tp!105947 () Bool)

(declare-fun b_and!48455 () Bool)

(assert (=> start!111500 (= tp!105947 b_and!48455)))

(declare-fun b!1319895 () Bool)

(declare-fun e!752983 () Bool)

(declare-fun tp_is_empty!35977 () Bool)

(assert (=> b!1319895 (= e!752983 tp_is_empty!35977)))

(declare-fun b!1319896 () Bool)

(declare-fun e!752986 () Bool)

(assert (=> b!1319896 (= e!752986 (not true))))

(declare-datatypes ((V!53073 0))(
  ( (V!53074 (val!18063 Int)) )
))
(declare-datatypes ((tuple2!23338 0))(
  ( (tuple2!23339 (_1!11680 (_ BitVec 64)) (_2!11680 V!53073)) )
))
(declare-datatypes ((List!30475 0))(
  ( (Nil!30472) (Cons!30471 (h!31680 tuple2!23338) (t!44173 List!30475)) )
))
(declare-datatypes ((ListLongMap!20995 0))(
  ( (ListLongMap!20996 (toList!10513 List!30475)) )
))
(declare-fun lt!586605 () ListLongMap!20995)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8596 (ListLongMap!20995 (_ BitVec 64)) Bool)

(assert (=> b!1319896 (contains!8596 lt!586605 k0!1164)))

(declare-fun zeroValue!1279 () V!53073)

(declare-datatypes ((Unit!43303 0))(
  ( (Unit!43304) )
))
(declare-fun lt!586602 () Unit!43303)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!125 ((_ BitVec 64) (_ BitVec 64) V!53073 ListLongMap!20995) Unit!43303)

(assert (=> b!1319896 (= lt!586602 (lemmaInListMapAfterAddingDiffThenInBefore!125 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586605))))

(declare-fun lt!586603 () ListLongMap!20995)

(assert (=> b!1319896 (contains!8596 lt!586603 k0!1164)))

(declare-fun lt!586604 () Unit!43303)

(declare-fun minValue!1279 () V!53073)

(assert (=> b!1319896 (= lt!586604 (lemmaInListMapAfterAddingDiffThenInBefore!125 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586603))))

(declare-fun +!4560 (ListLongMap!20995 tuple2!23338) ListLongMap!20995)

(assert (=> b!1319896 (= lt!586603 (+!4560 lt!586605 (tuple2!23339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!88817 0))(
  ( (array!88818 (arr!42883 (Array (_ BitVec 32) (_ BitVec 64))) (size!43435 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88817)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17090 0))(
  ( (ValueCellFull!17090 (v!20692 V!53073)) (EmptyCell!17090) )
))
(declare-datatypes ((array!88819 0))(
  ( (array!88820 (arr!42884 (Array (_ BitVec 32) ValueCell!17090)) (size!43436 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88819)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6193 (array!88817 array!88819 (_ BitVec 32) (_ BitVec 32) V!53073 V!53073 (_ BitVec 32) Int) ListLongMap!20995)

(declare-fun get!21571 (ValueCell!17090 V!53073) V!53073)

(declare-fun dynLambda!3490 (Int (_ BitVec 64)) V!53073)

(assert (=> b!1319896 (= lt!586605 (+!4560 (getCurrentListMapNoExtraKeys!6193 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23339 (select (arr!42883 _keys!1609) from!2000) (get!21571 (select (arr!42884 _values!1337) from!2000) (dynLambda!3490 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1319897 () Bool)

(declare-fun e!752985 () Bool)

(assert (=> b!1319897 (= e!752985 tp_is_empty!35977)))

(declare-fun b!1319898 () Bool)

(declare-fun res!876033 () Bool)

(assert (=> b!1319898 (=> (not res!876033) (not e!752986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319898 (= res!876033 (validKeyInArray!0 (select (arr!42883 _keys!1609) from!2000)))))

(declare-fun res!876034 () Bool)

(assert (=> start!111500 (=> (not res!876034) (not e!752986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111500 (= res!876034 (validMask!0 mask!2019))))

(assert (=> start!111500 e!752986))

(declare-fun array_inv!32565 (array!88817) Bool)

(assert (=> start!111500 (array_inv!32565 _keys!1609)))

(assert (=> start!111500 true))

(assert (=> start!111500 tp_is_empty!35977))

(declare-fun e!752982 () Bool)

(declare-fun array_inv!32566 (array!88819) Bool)

(assert (=> start!111500 (and (array_inv!32566 _values!1337) e!752982)))

(assert (=> start!111500 tp!105947))

(declare-fun mapNonEmpty!55613 () Bool)

(declare-fun mapRes!55613 () Bool)

(declare-fun tp!105948 () Bool)

(assert (=> mapNonEmpty!55613 (= mapRes!55613 (and tp!105948 e!752983))))

(declare-fun mapRest!55613 () (Array (_ BitVec 32) ValueCell!17090))

(declare-fun mapValue!55613 () ValueCell!17090)

(declare-fun mapKey!55613 () (_ BitVec 32))

(assert (=> mapNonEmpty!55613 (= (arr!42884 _values!1337) (store mapRest!55613 mapKey!55613 mapValue!55613))))

(declare-fun b!1319899 () Bool)

(declare-fun res!876035 () Bool)

(assert (=> b!1319899 (=> (not res!876035) (not e!752986))))

(assert (=> b!1319899 (= res!876035 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43435 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319900 () Bool)

(declare-fun res!876036 () Bool)

(assert (=> b!1319900 (=> (not res!876036) (not e!752986))))

(assert (=> b!1319900 (= res!876036 (not (= (select (arr!42883 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319901 () Bool)

(declare-fun res!876038 () Bool)

(assert (=> b!1319901 (=> (not res!876038) (not e!752986))))

(assert (=> b!1319901 (= res!876038 (and (= (size!43436 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43435 _keys!1609) (size!43436 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319902 () Bool)

(declare-fun res!876039 () Bool)

(assert (=> b!1319902 (=> (not res!876039) (not e!752986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88817 (_ BitVec 32)) Bool)

(assert (=> b!1319902 (= res!876039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319903 () Bool)

(assert (=> b!1319903 (= e!752982 (and e!752985 mapRes!55613))))

(declare-fun condMapEmpty!55613 () Bool)

(declare-fun mapDefault!55613 () ValueCell!17090)

(assert (=> b!1319903 (= condMapEmpty!55613 (= (arr!42884 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17090)) mapDefault!55613)))))

(declare-fun b!1319904 () Bool)

(declare-fun res!876037 () Bool)

(assert (=> b!1319904 (=> (not res!876037) (not e!752986))))

(declare-fun getCurrentListMap!5403 (array!88817 array!88819 (_ BitVec 32) (_ BitVec 32) V!53073 V!53073 (_ BitVec 32) Int) ListLongMap!20995)

(assert (=> b!1319904 (= res!876037 (contains!8596 (getCurrentListMap!5403 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55613 () Bool)

(assert (=> mapIsEmpty!55613 mapRes!55613))

(declare-fun b!1319905 () Bool)

(declare-fun res!876032 () Bool)

(assert (=> b!1319905 (=> (not res!876032) (not e!752986))))

(declare-datatypes ((List!30476 0))(
  ( (Nil!30473) (Cons!30472 (h!31681 (_ BitVec 64)) (t!44174 List!30476)) )
))
(declare-fun arrayNoDuplicates!0 (array!88817 (_ BitVec 32) List!30476) Bool)

(assert (=> b!1319905 (= res!876032 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30473))))

(assert (= (and start!111500 res!876034) b!1319901))

(assert (= (and b!1319901 res!876038) b!1319902))

(assert (= (and b!1319902 res!876039) b!1319905))

(assert (= (and b!1319905 res!876032) b!1319899))

(assert (= (and b!1319899 res!876035) b!1319904))

(assert (= (and b!1319904 res!876037) b!1319900))

(assert (= (and b!1319900 res!876036) b!1319898))

(assert (= (and b!1319898 res!876033) b!1319896))

(assert (= (and b!1319903 condMapEmpty!55613) mapIsEmpty!55613))

(assert (= (and b!1319903 (not condMapEmpty!55613)) mapNonEmpty!55613))

(get-info :version)

(assert (= (and mapNonEmpty!55613 ((_ is ValueCellFull!17090) mapValue!55613)) b!1319895))

(assert (= (and b!1319903 ((_ is ValueCellFull!17090) mapDefault!55613)) b!1319897))

(assert (= start!111500 b!1319903))

(declare-fun b_lambda!23473 () Bool)

(assert (=> (not b_lambda!23473) (not b!1319896)))

(declare-fun t!44172 () Bool)

(declare-fun tb!11501 () Bool)

(assert (=> (and start!111500 (= defaultEntry!1340 defaultEntry!1340) t!44172) tb!11501))

(declare-fun result!24065 () Bool)

(assert (=> tb!11501 (= result!24065 tp_is_empty!35977)))

(assert (=> b!1319896 t!44172))

(declare-fun b_and!48457 () Bool)

(assert (= b_and!48455 (and (=> t!44172 result!24065) b_and!48457)))

(declare-fun m!1207095 () Bool)

(assert (=> b!1319904 m!1207095))

(assert (=> b!1319904 m!1207095))

(declare-fun m!1207097 () Bool)

(assert (=> b!1319904 m!1207097))

(declare-fun m!1207099 () Bool)

(assert (=> b!1319896 m!1207099))

(declare-fun m!1207101 () Bool)

(assert (=> b!1319896 m!1207101))

(declare-fun m!1207103 () Bool)

(assert (=> b!1319896 m!1207103))

(assert (=> b!1319896 m!1207099))

(declare-fun m!1207105 () Bool)

(assert (=> b!1319896 m!1207105))

(declare-fun m!1207107 () Bool)

(assert (=> b!1319896 m!1207107))

(declare-fun m!1207109 () Bool)

(assert (=> b!1319896 m!1207109))

(declare-fun m!1207111 () Bool)

(assert (=> b!1319896 m!1207111))

(assert (=> b!1319896 m!1207103))

(declare-fun m!1207113 () Bool)

(assert (=> b!1319896 m!1207113))

(declare-fun m!1207115 () Bool)

(assert (=> b!1319896 m!1207115))

(declare-fun m!1207117 () Bool)

(assert (=> b!1319896 m!1207117))

(declare-fun m!1207119 () Bool)

(assert (=> b!1319896 m!1207119))

(assert (=> b!1319896 m!1207111))

(declare-fun m!1207121 () Bool)

(assert (=> b!1319905 m!1207121))

(assert (=> b!1319900 m!1207115))

(assert (=> b!1319898 m!1207115))

(assert (=> b!1319898 m!1207115))

(declare-fun m!1207123 () Bool)

(assert (=> b!1319898 m!1207123))

(declare-fun m!1207125 () Bool)

(assert (=> start!111500 m!1207125))

(declare-fun m!1207127 () Bool)

(assert (=> start!111500 m!1207127))

(declare-fun m!1207129 () Bool)

(assert (=> start!111500 m!1207129))

(declare-fun m!1207131 () Bool)

(assert (=> b!1319902 m!1207131))

(declare-fun m!1207133 () Bool)

(assert (=> mapNonEmpty!55613 m!1207133))

(check-sat (not b!1319902) (not mapNonEmpty!55613) (not b!1319904) (not b_next!30157) tp_is_empty!35977 b_and!48457 (not b!1319896) (not start!111500) (not b_lambda!23473) (not b!1319898) (not b!1319905))
(check-sat b_and!48457 (not b_next!30157))
