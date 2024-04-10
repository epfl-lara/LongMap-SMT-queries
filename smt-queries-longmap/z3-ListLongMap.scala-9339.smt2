; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111472 () Bool)

(assert start!111472)

(declare-fun b_free!30129 () Bool)

(declare-fun b_next!30129 () Bool)

(assert (=> start!111472 (= b_free!30129 (not b_next!30129))))

(declare-fun tp!105863 () Bool)

(declare-fun b_and!48417 () Bool)

(assert (=> start!111472 (= tp!105863 b_and!48417)))

(declare-fun b!1319475 () Bool)

(declare-fun res!875725 () Bool)

(declare-fun e!752808 () Bool)

(assert (=> b!1319475 (=> (not res!875725) (not e!752808))))

(declare-datatypes ((array!88836 0))(
  ( (array!88837 (arr!42892 (Array (_ BitVec 32) (_ BitVec 64))) (size!43442 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88836)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319475 (= res!875725 (not (= (select (arr!42892 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319476 () Bool)

(declare-fun res!875727 () Bool)

(assert (=> b!1319476 (=> (not res!875727) (not e!752808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319476 (= res!875727 (validKeyInArray!0 (select (arr!42892 _keys!1609) from!2000)))))

(declare-fun b!1319477 () Bool)

(declare-fun e!752807 () Bool)

(declare-fun tp_is_empty!35949 () Bool)

(assert (=> b!1319477 (= e!752807 tp_is_empty!35949)))

(declare-fun b!1319478 () Bool)

(declare-fun e!752805 () Bool)

(declare-fun mapRes!55571 () Bool)

(assert (=> b!1319478 (= e!752805 (and e!752807 mapRes!55571))))

(declare-fun condMapEmpty!55571 () Bool)

(declare-datatypes ((V!53035 0))(
  ( (V!53036 (val!18049 Int)) )
))
(declare-datatypes ((ValueCell!17076 0))(
  ( (ValueCellFull!17076 (v!20679 V!53035)) (EmptyCell!17076) )
))
(declare-datatypes ((array!88838 0))(
  ( (array!88839 (arr!42893 (Array (_ BitVec 32) ValueCell!17076)) (size!43443 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88838)

(declare-fun mapDefault!55571 () ValueCell!17076)

(assert (=> b!1319478 (= condMapEmpty!55571 (= (arr!42893 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17076)) mapDefault!55571)))))

(declare-fun mapNonEmpty!55571 () Bool)

(declare-fun tp!105862 () Bool)

(declare-fun e!752806 () Bool)

(assert (=> mapNonEmpty!55571 (= mapRes!55571 (and tp!105862 e!752806))))

(declare-fun mapRest!55571 () (Array (_ BitVec 32) ValueCell!17076))

(declare-fun mapValue!55571 () ValueCell!17076)

(declare-fun mapKey!55571 () (_ BitVec 32))

(assert (=> mapNonEmpty!55571 (= (arr!42893 _values!1337) (store mapRest!55571 mapKey!55571 mapValue!55571))))

(declare-fun res!875729 () Bool)

(assert (=> start!111472 (=> (not res!875729) (not e!752808))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111472 (= res!875729 (validMask!0 mask!2019))))

(assert (=> start!111472 e!752808))

(declare-fun array_inv!32383 (array!88836) Bool)

(assert (=> start!111472 (array_inv!32383 _keys!1609)))

(assert (=> start!111472 true))

(assert (=> start!111472 tp_is_empty!35949))

(declare-fun array_inv!32384 (array!88838) Bool)

(assert (=> start!111472 (and (array_inv!32384 _values!1337) e!752805)))

(assert (=> start!111472 tp!105863))

(declare-fun b!1319479 () Bool)

(declare-fun res!875726 () Bool)

(assert (=> b!1319479 (=> (not res!875726) (not e!752808))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53035)

(declare-fun minValue!1279 () V!53035)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23230 0))(
  ( (tuple2!23231 (_1!11626 (_ BitVec 64)) (_2!11626 V!53035)) )
))
(declare-datatypes ((List!30383 0))(
  ( (Nil!30380) (Cons!30379 (h!31588 tuple2!23230) (t!44061 List!30383)) )
))
(declare-datatypes ((ListLongMap!20887 0))(
  ( (ListLongMap!20888 (toList!10459 List!30383)) )
))
(declare-fun contains!8614 (ListLongMap!20887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5469 (array!88836 array!88838 (_ BitVec 32) (_ BitVec 32) V!53035 V!53035 (_ BitVec 32) Int) ListLongMap!20887)

(assert (=> b!1319479 (= res!875726 (contains!8614 (getCurrentListMap!5469 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319480 () Bool)

(declare-fun res!875731 () Bool)

(assert (=> b!1319480 (=> (not res!875731) (not e!752808))))

(assert (=> b!1319480 (= res!875731 (and (= (size!43443 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43442 _keys!1609) (size!43443 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319481 () Bool)

(declare-fun res!875728 () Bool)

(assert (=> b!1319481 (=> (not res!875728) (not e!752808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88836 (_ BitVec 32)) Bool)

(assert (=> b!1319481 (= res!875728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319482 () Bool)

(declare-fun res!875730 () Bool)

(assert (=> b!1319482 (=> (not res!875730) (not e!752808))))

(assert (=> b!1319482 (= res!875730 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43442 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319483 () Bool)

(declare-fun res!875732 () Bool)

(assert (=> b!1319483 (=> (not res!875732) (not e!752808))))

(declare-datatypes ((List!30384 0))(
  ( (Nil!30381) (Cons!30380 (h!31589 (_ BitVec 64)) (t!44062 List!30384)) )
))
(declare-fun arrayNoDuplicates!0 (array!88836 (_ BitVec 32) List!30384) Bool)

(assert (=> b!1319483 (= res!875732 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30381))))

(declare-fun mapIsEmpty!55571 () Bool)

(assert (=> mapIsEmpty!55571 mapRes!55571))

(declare-fun b!1319484 () Bool)

(assert (=> b!1319484 (= e!752806 tp_is_empty!35949)))

(declare-fun b!1319485 () Bool)

(assert (=> b!1319485 (= e!752808 (not true))))

(declare-fun lt!586647 () ListLongMap!20887)

(assert (=> b!1319485 (contains!8614 lt!586647 k0!1164)))

(declare-datatypes ((Unit!43456 0))(
  ( (Unit!43457) )
))
(declare-fun lt!586646 () Unit!43456)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!114 ((_ BitVec 64) (_ BitVec 64) V!53035 ListLongMap!20887) Unit!43456)

(assert (=> b!1319485 (= lt!586646 (lemmaInListMapAfterAddingDiffThenInBefore!114 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586647))))

(declare-fun +!4518 (ListLongMap!20887 tuple2!23230) ListLongMap!20887)

(declare-fun getCurrentListMapNoExtraKeys!6153 (array!88836 array!88838 (_ BitVec 32) (_ BitVec 32) V!53035 V!53035 (_ BitVec 32) Int) ListLongMap!20887)

(declare-fun get!21552 (ValueCell!17076 V!53035) V!53035)

(declare-fun dynLambda!3457 (Int (_ BitVec 64)) V!53035)

(assert (=> b!1319485 (= lt!586647 (+!4518 (+!4518 (getCurrentListMapNoExtraKeys!6153 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23231 (select (arr!42892 _keys!1609) from!2000) (get!21552 (select (arr!42893 _values!1337) from!2000) (dynLambda!3457 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (= (and start!111472 res!875729) b!1319480))

(assert (= (and b!1319480 res!875731) b!1319481))

(assert (= (and b!1319481 res!875728) b!1319483))

(assert (= (and b!1319483 res!875732) b!1319482))

(assert (= (and b!1319482 res!875730) b!1319479))

(assert (= (and b!1319479 res!875726) b!1319475))

(assert (= (and b!1319475 res!875725) b!1319476))

(assert (= (and b!1319476 res!875727) b!1319485))

(assert (= (and b!1319478 condMapEmpty!55571) mapIsEmpty!55571))

(assert (= (and b!1319478 (not condMapEmpty!55571)) mapNonEmpty!55571))

(get-info :version)

(assert (= (and mapNonEmpty!55571 ((_ is ValueCellFull!17076) mapValue!55571)) b!1319484))

(assert (= (and b!1319478 ((_ is ValueCellFull!17076) mapDefault!55571)) b!1319477))

(assert (= start!111472 b!1319478))

(declare-fun b_lambda!23455 () Bool)

(assert (=> (not b_lambda!23455) (not b!1319485)))

(declare-fun t!44060 () Bool)

(declare-fun tb!11481 () Bool)

(assert (=> (and start!111472 (= defaultEntry!1340 defaultEntry!1340) t!44060) tb!11481))

(declare-fun result!24017 () Bool)

(assert (=> tb!11481 (= result!24017 tp_is_empty!35949)))

(assert (=> b!1319485 t!44060))

(declare-fun b_and!48419 () Bool)

(assert (= b_and!48417 (and (=> t!44060 result!24017) b_and!48419)))

(declare-fun m!1207071 () Bool)

(assert (=> start!111472 m!1207071))

(declare-fun m!1207073 () Bool)

(assert (=> start!111472 m!1207073))

(declare-fun m!1207075 () Bool)

(assert (=> start!111472 m!1207075))

(declare-fun m!1207077 () Bool)

(assert (=> b!1319479 m!1207077))

(assert (=> b!1319479 m!1207077))

(declare-fun m!1207079 () Bool)

(assert (=> b!1319479 m!1207079))

(declare-fun m!1207081 () Bool)

(assert (=> b!1319481 m!1207081))

(declare-fun m!1207083 () Bool)

(assert (=> b!1319485 m!1207083))

(declare-fun m!1207085 () Bool)

(assert (=> b!1319485 m!1207085))

(declare-fun m!1207087 () Bool)

(assert (=> b!1319485 m!1207087))

(assert (=> b!1319485 m!1207085))

(declare-fun m!1207089 () Bool)

(assert (=> b!1319485 m!1207089))

(declare-fun m!1207091 () Bool)

(assert (=> b!1319485 m!1207091))

(assert (=> b!1319485 m!1207089))

(declare-fun m!1207093 () Bool)

(assert (=> b!1319485 m!1207093))

(declare-fun m!1207095 () Bool)

(assert (=> b!1319485 m!1207095))

(assert (=> b!1319485 m!1207091))

(assert (=> b!1319485 m!1207087))

(declare-fun m!1207097 () Bool)

(assert (=> b!1319485 m!1207097))

(declare-fun m!1207099 () Bool)

(assert (=> b!1319485 m!1207099))

(assert (=> b!1319475 m!1207099))

(declare-fun m!1207101 () Bool)

(assert (=> b!1319483 m!1207101))

(assert (=> b!1319476 m!1207099))

(assert (=> b!1319476 m!1207099))

(declare-fun m!1207103 () Bool)

(assert (=> b!1319476 m!1207103))

(declare-fun m!1207105 () Bool)

(assert (=> mapNonEmpty!55571 m!1207105))

(check-sat (not b_next!30129) tp_is_empty!35949 (not b!1319476) (not mapNonEmpty!55571) (not b_lambda!23455) (not start!111472) (not b!1319481) (not b!1319485) (not b!1319483) (not b!1319479) b_and!48419)
(check-sat b_and!48419 (not b_next!30129))
