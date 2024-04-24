; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112124 () Bool)

(assert start!112124)

(declare-fun b_free!30499 () Bool)

(declare-fun b_next!30499 () Bool)

(assert (=> start!112124 (= b_free!30499 (not b_next!30499))))

(declare-fun tp!106976 () Bool)

(declare-fun b_and!49095 () Bool)

(assert (=> start!112124 (= tp!106976 b_and!49095)))

(declare-fun b!1327312 () Bool)

(declare-fun e!756685 () Bool)

(declare-fun tp_is_empty!36319 () Bool)

(assert (=> b!1327312 (= e!756685 tp_is_empty!36319)))

(declare-fun res!880589 () Bool)

(declare-fun e!756682 () Bool)

(assert (=> start!112124 (=> (not res!880589) (not e!756682))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112124 (= res!880589 (validMask!0 mask!2019))))

(assert (=> start!112124 e!756682))

(declare-datatypes ((array!89639 0))(
  ( (array!89640 (arr!43288 (Array (_ BitVec 32) (_ BitVec 64))) (size!43839 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89639)

(declare-fun array_inv!32939 (array!89639) Bool)

(assert (=> start!112124 (array_inv!32939 _keys!1609)))

(assert (=> start!112124 true))

(assert (=> start!112124 tp_is_empty!36319))

(declare-datatypes ((V!53529 0))(
  ( (V!53530 (val!18234 Int)) )
))
(declare-datatypes ((ValueCell!17261 0))(
  ( (ValueCellFull!17261 (v!20862 V!53529)) (EmptyCell!17261) )
))
(declare-datatypes ((array!89641 0))(
  ( (array!89642 (arr!43289 (Array (_ BitVec 32) ValueCell!17261)) (size!43840 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89641)

(declare-fun e!756684 () Bool)

(declare-fun array_inv!32940 (array!89641) Bool)

(assert (=> start!112124 (and (array_inv!32940 _values!1337) e!756684)))

(assert (=> start!112124 tp!106976))

(declare-fun b!1327313 () Bool)

(declare-fun res!880590 () Bool)

(assert (=> b!1327313 (=> (not res!880590) (not e!756682))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53529)

(declare-fun minValue!1279 () V!53529)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23554 0))(
  ( (tuple2!23555 (_1!11788 (_ BitVec 64)) (_2!11788 V!53529)) )
))
(declare-datatypes ((List!30705 0))(
  ( (Nil!30702) (Cons!30701 (h!31919 tuple2!23554) (t!44667 List!30705)) )
))
(declare-datatypes ((ListLongMap!21219 0))(
  ( (ListLongMap!21220 (toList!10625 List!30705)) )
))
(declare-fun contains!8793 (ListLongMap!21219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5604 (array!89639 array!89641 (_ BitVec 32) (_ BitVec 32) V!53529 V!53529 (_ BitVec 32) Int) ListLongMap!21219)

(assert (=> b!1327313 (= res!880590 (contains!8793 (getCurrentListMap!5604 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1327314 () Bool)

(declare-fun e!756681 () Bool)

(assert (=> b!1327314 (= e!756681 tp_is_empty!36319)))

(declare-fun b!1327315 () Bool)

(assert (=> b!1327315 (= e!756682 (not (bvslt from!2000 (size!43840 _values!1337))))))

(declare-fun lt!590381 () ListLongMap!21219)

(assert (=> b!1327315 (contains!8793 lt!590381 k0!1164)))

(declare-datatypes ((Unit!43631 0))(
  ( (Unit!43632) )
))
(declare-fun lt!590380 () Unit!43631)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!219 ((_ BitVec 64) (_ BitVec 64) V!53529 ListLongMap!21219) Unit!43631)

(assert (=> b!1327315 (= lt!590380 (lemmaInListMapAfterAddingDiffThenInBefore!219 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590381))))

(declare-fun lt!590379 () ListLongMap!21219)

(assert (=> b!1327315 (contains!8793 lt!590379 k0!1164)))

(declare-fun lt!590378 () Unit!43631)

(assert (=> b!1327315 (= lt!590378 (lemmaInListMapAfterAddingDiffThenInBefore!219 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590379))))

(declare-fun +!4669 (ListLongMap!21219 tuple2!23554) ListLongMap!21219)

(assert (=> b!1327315 (= lt!590379 (+!4669 lt!590381 (tuple2!23555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6313 (array!89639 array!89641 (_ BitVec 32) (_ BitVec 32) V!53529 V!53529 (_ BitVec 32) Int) ListLongMap!21219)

(declare-fun get!21833 (ValueCell!17261 V!53529) V!53529)

(declare-fun dynLambda!3623 (Int (_ BitVec 64)) V!53529)

(assert (=> b!1327315 (= lt!590381 (+!4669 (getCurrentListMapNoExtraKeys!6313 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23555 (select (arr!43288 _keys!1609) from!2000) (get!21833 (select (arr!43289 _values!1337) from!2000) (dynLambda!3623 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!56130 () Bool)

(declare-fun mapRes!56130 () Bool)

(assert (=> mapIsEmpty!56130 mapRes!56130))

(declare-fun mapNonEmpty!56130 () Bool)

(declare-fun tp!106977 () Bool)

(assert (=> mapNonEmpty!56130 (= mapRes!56130 (and tp!106977 e!756685))))

(declare-fun mapKey!56130 () (_ BitVec 32))

(declare-fun mapRest!56130 () (Array (_ BitVec 32) ValueCell!17261))

(declare-fun mapValue!56130 () ValueCell!17261)

(assert (=> mapNonEmpty!56130 (= (arr!43289 _values!1337) (store mapRest!56130 mapKey!56130 mapValue!56130))))

(declare-fun b!1327316 () Bool)

(declare-fun res!880583 () Bool)

(assert (=> b!1327316 (=> (not res!880583) (not e!756682))))

(assert (=> b!1327316 (= res!880583 (not (= (select (arr!43288 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1327317 () Bool)

(declare-fun res!880588 () Bool)

(assert (=> b!1327317 (=> (not res!880588) (not e!756682))))

(declare-datatypes ((List!30706 0))(
  ( (Nil!30703) (Cons!30702 (h!31920 (_ BitVec 64)) (t!44668 List!30706)) )
))
(declare-fun arrayNoDuplicates!0 (array!89639 (_ BitVec 32) List!30706) Bool)

(assert (=> b!1327317 (= res!880588 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30703))))

(declare-fun b!1327318 () Bool)

(declare-fun res!880585 () Bool)

(assert (=> b!1327318 (=> (not res!880585) (not e!756682))))

(assert (=> b!1327318 (= res!880585 (and (= (size!43840 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43839 _keys!1609) (size!43840 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1327319 () Bool)

(declare-fun res!880584 () Bool)

(assert (=> b!1327319 (=> (not res!880584) (not e!756682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89639 (_ BitVec 32)) Bool)

(assert (=> b!1327319 (= res!880584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1327320 () Bool)

(declare-fun res!880586 () Bool)

(assert (=> b!1327320 (=> (not res!880586) (not e!756682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327320 (= res!880586 (validKeyInArray!0 (select (arr!43288 _keys!1609) from!2000)))))

(declare-fun b!1327321 () Bool)

(declare-fun res!880587 () Bool)

(assert (=> b!1327321 (=> (not res!880587) (not e!756682))))

(assert (=> b!1327321 (= res!880587 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43839 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327322 () Bool)

(assert (=> b!1327322 (= e!756684 (and e!756681 mapRes!56130))))

(declare-fun condMapEmpty!56130 () Bool)

(declare-fun mapDefault!56130 () ValueCell!17261)

(assert (=> b!1327322 (= condMapEmpty!56130 (= (arr!43289 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17261)) mapDefault!56130)))))

(assert (= (and start!112124 res!880589) b!1327318))

(assert (= (and b!1327318 res!880585) b!1327319))

(assert (= (and b!1327319 res!880584) b!1327317))

(assert (= (and b!1327317 res!880588) b!1327321))

(assert (= (and b!1327321 res!880587) b!1327313))

(assert (= (and b!1327313 res!880590) b!1327316))

(assert (= (and b!1327316 res!880583) b!1327320))

(assert (= (and b!1327320 res!880586) b!1327315))

(assert (= (and b!1327322 condMapEmpty!56130) mapIsEmpty!56130))

(assert (= (and b!1327322 (not condMapEmpty!56130)) mapNonEmpty!56130))

(get-info :version)

(assert (= (and mapNonEmpty!56130 ((_ is ValueCellFull!17261) mapValue!56130)) b!1327312))

(assert (= (and b!1327322 ((_ is ValueCellFull!17261) mapDefault!56130)) b!1327314))

(assert (= start!112124 b!1327322))

(declare-fun b_lambda!23771 () Bool)

(assert (=> (not b_lambda!23771) (not b!1327315)))

(declare-fun t!44666 () Bool)

(declare-fun tb!11765 () Bool)

(assert (=> (and start!112124 (= defaultEntry!1340 defaultEntry!1340) t!44666) tb!11765))

(declare-fun result!24595 () Bool)

(assert (=> tb!11765 (= result!24595 tp_is_empty!36319)))

(assert (=> b!1327315 t!44666))

(declare-fun b_and!49097 () Bool)

(assert (= b_and!49095 (and (=> t!44666 result!24595) b_and!49097)))

(declare-fun m!1216527 () Bool)

(assert (=> b!1327316 m!1216527))

(declare-fun m!1216529 () Bool)

(assert (=> mapNonEmpty!56130 m!1216529))

(declare-fun m!1216531 () Bool)

(assert (=> b!1327319 m!1216531))

(declare-fun m!1216533 () Bool)

(assert (=> start!112124 m!1216533))

(declare-fun m!1216535 () Bool)

(assert (=> start!112124 m!1216535))

(declare-fun m!1216537 () Bool)

(assert (=> start!112124 m!1216537))

(assert (=> b!1327320 m!1216527))

(assert (=> b!1327320 m!1216527))

(declare-fun m!1216539 () Bool)

(assert (=> b!1327320 m!1216539))

(declare-fun m!1216541 () Bool)

(assert (=> b!1327315 m!1216541))

(declare-fun m!1216543 () Bool)

(assert (=> b!1327315 m!1216543))

(assert (=> b!1327315 m!1216541))

(declare-fun m!1216545 () Bool)

(assert (=> b!1327315 m!1216545))

(declare-fun m!1216547 () Bool)

(assert (=> b!1327315 m!1216547))

(declare-fun m!1216549 () Bool)

(assert (=> b!1327315 m!1216549))

(declare-fun m!1216551 () Bool)

(assert (=> b!1327315 m!1216551))

(declare-fun m!1216553 () Bool)

(assert (=> b!1327315 m!1216553))

(declare-fun m!1216555 () Bool)

(assert (=> b!1327315 m!1216555))

(assert (=> b!1327315 m!1216549))

(assert (=> b!1327315 m!1216543))

(declare-fun m!1216557 () Bool)

(assert (=> b!1327315 m!1216557))

(declare-fun m!1216559 () Bool)

(assert (=> b!1327315 m!1216559))

(assert (=> b!1327315 m!1216527))

(declare-fun m!1216561 () Bool)

(assert (=> b!1327317 m!1216561))

(declare-fun m!1216563 () Bool)

(assert (=> b!1327313 m!1216563))

(assert (=> b!1327313 m!1216563))

(declare-fun m!1216565 () Bool)

(assert (=> b!1327313 m!1216565))

(check-sat (not b!1327317) (not b!1327313) b_and!49097 (not b_next!30499) (not b!1327315) (not b_lambda!23771) (not mapNonEmpty!56130) tp_is_empty!36319 (not b!1327320) (not b!1327319) (not start!112124))
(check-sat b_and!49097 (not b_next!30499))
