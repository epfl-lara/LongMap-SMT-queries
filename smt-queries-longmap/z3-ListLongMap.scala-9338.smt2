; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111466 () Bool)

(assert start!111466)

(declare-fun b_free!30123 () Bool)

(declare-fun b_next!30123 () Bool)

(assert (=> start!111466 (= b_free!30123 (not b_next!30123))))

(declare-fun tp!105844 () Bool)

(declare-fun b_and!48405 () Bool)

(assert (=> start!111466 (= tp!105844 b_and!48405)))

(declare-fun b!1319370 () Bool)

(declare-fun res!875653 () Bool)

(declare-fun e!752760 () Bool)

(assert (=> b!1319370 (=> (not res!875653) (not e!752760))))

(declare-datatypes ((array!88824 0))(
  ( (array!88825 (arr!42886 (Array (_ BitVec 32) (_ BitVec 64))) (size!43436 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88824)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319370 (= res!875653 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43436 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319371 () Bool)

(declare-fun e!752763 () Bool)

(declare-fun tp_is_empty!35943 () Bool)

(assert (=> b!1319371 (= e!752763 tp_is_empty!35943)))

(declare-fun res!875656 () Bool)

(assert (=> start!111466 (=> (not res!875656) (not e!752760))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111466 (= res!875656 (validMask!0 mask!2019))))

(assert (=> start!111466 e!752760))

(declare-fun array_inv!32379 (array!88824) Bool)

(assert (=> start!111466 (array_inv!32379 _keys!1609)))

(assert (=> start!111466 true))

(assert (=> start!111466 tp_is_empty!35943))

(declare-datatypes ((V!53027 0))(
  ( (V!53028 (val!18046 Int)) )
))
(declare-datatypes ((ValueCell!17073 0))(
  ( (ValueCellFull!17073 (v!20676 V!53027)) (EmptyCell!17073) )
))
(declare-datatypes ((array!88826 0))(
  ( (array!88827 (arr!42887 (Array (_ BitVec 32) ValueCell!17073)) (size!43437 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88826)

(declare-fun e!752762 () Bool)

(declare-fun array_inv!32380 (array!88826) Bool)

(assert (=> start!111466 (and (array_inv!32380 _values!1337) e!752762)))

(assert (=> start!111466 tp!105844))

(declare-fun mapNonEmpty!55562 () Bool)

(declare-fun mapRes!55562 () Bool)

(declare-fun tp!105845 () Bool)

(declare-fun e!752761 () Bool)

(assert (=> mapNonEmpty!55562 (= mapRes!55562 (and tp!105845 e!752761))))

(declare-fun mapValue!55562 () ValueCell!17073)

(declare-fun mapRest!55562 () (Array (_ BitVec 32) ValueCell!17073))

(declare-fun mapKey!55562 () (_ BitVec 32))

(assert (=> mapNonEmpty!55562 (= (arr!42887 _values!1337) (store mapRest!55562 mapKey!55562 mapValue!55562))))

(declare-fun b!1319372 () Bool)

(assert (=> b!1319372 (= e!752761 tp_is_empty!35943)))

(declare-fun b!1319373 () Bool)

(assert (=> b!1319373 (= e!752760 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23224 0))(
  ( (tuple2!23225 (_1!11623 (_ BitVec 64)) (_2!11623 V!53027)) )
))
(declare-datatypes ((List!30378 0))(
  ( (Nil!30375) (Cons!30374 (h!31583 tuple2!23224) (t!44050 List!30378)) )
))
(declare-datatypes ((ListLongMap!20881 0))(
  ( (ListLongMap!20882 (toList!10456 List!30378)) )
))
(declare-fun lt!586628 () ListLongMap!20881)

(declare-fun contains!8611 (ListLongMap!20881 (_ BitVec 64)) Bool)

(assert (=> b!1319373 (contains!8611 lt!586628 k0!1164)))

(declare-datatypes ((Unit!43454 0))(
  ( (Unit!43455) )
))
(declare-fun lt!586629 () Unit!43454)

(declare-fun minValue!1279 () V!53027)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!113 ((_ BitVec 64) (_ BitVec 64) V!53027 ListLongMap!20881) Unit!43454)

(assert (=> b!1319373 (= lt!586629 (lemmaInListMapAfterAddingDiffThenInBefore!113 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586628))))

(declare-fun zeroValue!1279 () V!53027)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4517 (ListLongMap!20881 tuple2!23224) ListLongMap!20881)

(declare-fun getCurrentListMapNoExtraKeys!6152 (array!88824 array!88826 (_ BitVec 32) (_ BitVec 32) V!53027 V!53027 (_ BitVec 32) Int) ListLongMap!20881)

(declare-fun get!21549 (ValueCell!17073 V!53027) V!53027)

(declare-fun dynLambda!3456 (Int (_ BitVec 64)) V!53027)

(assert (=> b!1319373 (= lt!586628 (+!4517 (+!4517 (getCurrentListMapNoExtraKeys!6152 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23225 (select (arr!42886 _keys!1609) from!2000) (get!21549 (select (arr!42887 _values!1337) from!2000) (dynLambda!3456 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319374 () Bool)

(declare-fun res!875658 () Bool)

(assert (=> b!1319374 (=> (not res!875658) (not e!752760))))

(assert (=> b!1319374 (= res!875658 (not (= (select (arr!42886 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55562 () Bool)

(assert (=> mapIsEmpty!55562 mapRes!55562))

(declare-fun b!1319375 () Bool)

(declare-fun res!875660 () Bool)

(assert (=> b!1319375 (=> (not res!875660) (not e!752760))))

(declare-datatypes ((List!30379 0))(
  ( (Nil!30376) (Cons!30375 (h!31584 (_ BitVec 64)) (t!44051 List!30379)) )
))
(declare-fun arrayNoDuplicates!0 (array!88824 (_ BitVec 32) List!30379) Bool)

(assert (=> b!1319375 (= res!875660 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30376))))

(declare-fun b!1319376 () Bool)

(declare-fun res!875654 () Bool)

(assert (=> b!1319376 (=> (not res!875654) (not e!752760))))

(assert (=> b!1319376 (= res!875654 (and (= (size!43437 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43436 _keys!1609) (size!43437 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319377 () Bool)

(declare-fun res!875657 () Bool)

(assert (=> b!1319377 (=> (not res!875657) (not e!752760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319377 (= res!875657 (validKeyInArray!0 (select (arr!42886 _keys!1609) from!2000)))))

(declare-fun b!1319378 () Bool)

(assert (=> b!1319378 (= e!752762 (and e!752763 mapRes!55562))))

(declare-fun condMapEmpty!55562 () Bool)

(declare-fun mapDefault!55562 () ValueCell!17073)

(assert (=> b!1319378 (= condMapEmpty!55562 (= (arr!42887 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17073)) mapDefault!55562)))))

(declare-fun b!1319379 () Bool)

(declare-fun res!875655 () Bool)

(assert (=> b!1319379 (=> (not res!875655) (not e!752760))))

(declare-fun getCurrentListMap!5466 (array!88824 array!88826 (_ BitVec 32) (_ BitVec 32) V!53027 V!53027 (_ BitVec 32) Int) ListLongMap!20881)

(assert (=> b!1319379 (= res!875655 (contains!8611 (getCurrentListMap!5466 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319380 () Bool)

(declare-fun res!875659 () Bool)

(assert (=> b!1319380 (=> (not res!875659) (not e!752760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88824 (_ BitVec 32)) Bool)

(assert (=> b!1319380 (= res!875659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111466 res!875656) b!1319376))

(assert (= (and b!1319376 res!875654) b!1319380))

(assert (= (and b!1319380 res!875659) b!1319375))

(assert (= (and b!1319375 res!875660) b!1319370))

(assert (= (and b!1319370 res!875653) b!1319379))

(assert (= (and b!1319379 res!875655) b!1319374))

(assert (= (and b!1319374 res!875658) b!1319377))

(assert (= (and b!1319377 res!875657) b!1319373))

(assert (= (and b!1319378 condMapEmpty!55562) mapIsEmpty!55562))

(assert (= (and b!1319378 (not condMapEmpty!55562)) mapNonEmpty!55562))

(get-info :version)

(assert (= (and mapNonEmpty!55562 ((_ is ValueCellFull!17073) mapValue!55562)) b!1319372))

(assert (= (and b!1319378 ((_ is ValueCellFull!17073) mapDefault!55562)) b!1319371))

(assert (= start!111466 b!1319378))

(declare-fun b_lambda!23449 () Bool)

(assert (=> (not b_lambda!23449) (not b!1319373)))

(declare-fun t!44049 () Bool)

(declare-fun tb!11475 () Bool)

(assert (=> (and start!111466 (= defaultEntry!1340 defaultEntry!1340) t!44049) tb!11475))

(declare-fun result!24005 () Bool)

(assert (=> tb!11475 (= result!24005 tp_is_empty!35943)))

(assert (=> b!1319373 t!44049))

(declare-fun b_and!48407 () Bool)

(assert (= b_and!48405 (and (=> t!44049 result!24005) b_and!48407)))

(declare-fun m!1206963 () Bool)

(assert (=> b!1319380 m!1206963))

(declare-fun m!1206965 () Bool)

(assert (=> mapNonEmpty!55562 m!1206965))

(declare-fun m!1206967 () Bool)

(assert (=> b!1319375 m!1206967))

(declare-fun m!1206969 () Bool)

(assert (=> b!1319373 m!1206969))

(declare-fun m!1206971 () Bool)

(assert (=> b!1319373 m!1206971))

(assert (=> b!1319373 m!1206969))

(declare-fun m!1206973 () Bool)

(assert (=> b!1319373 m!1206973))

(declare-fun m!1206975 () Bool)

(assert (=> b!1319373 m!1206975))

(assert (=> b!1319373 m!1206973))

(declare-fun m!1206977 () Bool)

(assert (=> b!1319373 m!1206977))

(assert (=> b!1319373 m!1206975))

(assert (=> b!1319373 m!1206971))

(declare-fun m!1206979 () Bool)

(assert (=> b!1319373 m!1206979))

(declare-fun m!1206981 () Bool)

(assert (=> b!1319373 m!1206981))

(declare-fun m!1206983 () Bool)

(assert (=> b!1319373 m!1206983))

(declare-fun m!1206985 () Bool)

(assert (=> b!1319373 m!1206985))

(declare-fun m!1206987 () Bool)

(assert (=> b!1319379 m!1206987))

(assert (=> b!1319379 m!1206987))

(declare-fun m!1206989 () Bool)

(assert (=> b!1319379 m!1206989))

(assert (=> b!1319374 m!1206983))

(assert (=> b!1319377 m!1206983))

(assert (=> b!1319377 m!1206983))

(declare-fun m!1206991 () Bool)

(assert (=> b!1319377 m!1206991))

(declare-fun m!1206993 () Bool)

(assert (=> start!111466 m!1206993))

(declare-fun m!1206995 () Bool)

(assert (=> start!111466 m!1206995))

(declare-fun m!1206997 () Bool)

(assert (=> start!111466 m!1206997))

(check-sat (not b!1319380) (not b!1319379) (not mapNonEmpty!55562) tp_is_empty!35943 (not b!1319375) b_and!48407 (not b!1319373) (not b_next!30123) (not b!1319377) (not start!111466) (not b_lambda!23449))
(check-sat b_and!48407 (not b_next!30123))
