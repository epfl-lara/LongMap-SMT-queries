; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111900 () Bool)

(assert start!111900)

(declare-fun b_free!30499 () Bool)

(declare-fun b_next!30499 () Bool)

(assert (=> start!111900 (= b_free!30499 (not b_next!30499))))

(declare-fun tp!106978 () Bool)

(declare-fun b_and!49075 () Bool)

(assert (=> start!111900 (= tp!106978 b_and!49075)))

(declare-fun b!1325943 () Bool)

(declare-fun res!880036 () Bool)

(declare-fun e!755807 () Bool)

(assert (=> b!1325943 (=> (not res!880036) (not e!755807))))

(declare-datatypes ((array!89477 0))(
  ( (array!89478 (arr!43212 (Array (_ BitVec 32) (_ BitVec 64))) (size!43764 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89477)

(declare-datatypes ((List!30711 0))(
  ( (Nil!30708) (Cons!30707 (h!31916 (_ BitVec 64)) (t!44673 List!30711)) )
))
(declare-fun arrayNoDuplicates!0 (array!89477 (_ BitVec 32) List!30711) Bool)

(assert (=> b!1325943 (= res!880036 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30708))))

(declare-fun b!1325944 () Bool)

(declare-fun res!880043 () Bool)

(assert (=> b!1325944 (=> (not res!880043) (not e!755807))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325944 (= res!880043 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43764 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56130 () Bool)

(declare-fun mapRes!56130 () Bool)

(assert (=> mapIsEmpty!56130 mapRes!56130))

(declare-fun b!1325945 () Bool)

(declare-fun e!755808 () Bool)

(declare-fun tp_is_empty!36319 () Bool)

(assert (=> b!1325945 (= e!755808 tp_is_empty!36319)))

(declare-fun b!1325946 () Bool)

(declare-fun res!880037 () Bool)

(assert (=> b!1325946 (=> (not res!880037) (not e!755807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325946 (= res!880037 (validKeyInArray!0 (select (arr!43212 _keys!1609) from!2000)))))

(declare-fun b!1325947 () Bool)

(declare-fun res!880041 () Bool)

(assert (=> b!1325947 (=> (not res!880041) (not e!755807))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89477 (_ BitVec 32)) Bool)

(assert (=> b!1325947 (= res!880041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325948 () Bool)

(declare-datatypes ((V!53529 0))(
  ( (V!53530 (val!18234 Int)) )
))
(declare-datatypes ((ValueCell!17261 0))(
  ( (ValueCellFull!17261 (v!20866 V!53529)) (EmptyCell!17261) )
))
(declare-datatypes ((array!89479 0))(
  ( (array!89480 (arr!43213 (Array (_ BitVec 32) ValueCell!17261)) (size!43765 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89479)

(assert (=> b!1325948 (= e!755807 (not (bvslt from!2000 (size!43765 _values!1337))))))

(declare-datatypes ((tuple2!23586 0))(
  ( (tuple2!23587 (_1!11804 (_ BitVec 64)) (_2!11804 V!53529)) )
))
(declare-datatypes ((List!30712 0))(
  ( (Nil!30709) (Cons!30708 (h!31917 tuple2!23586) (t!44674 List!30712)) )
))
(declare-datatypes ((ListLongMap!21243 0))(
  ( (ListLongMap!21244 (toList!10637 List!30712)) )
))
(declare-fun lt!589718 () ListLongMap!21243)

(declare-fun contains!8721 (ListLongMap!21243 (_ BitVec 64)) Bool)

(assert (=> b!1325948 (contains!8721 lt!589718 k0!1164)))

(declare-fun zeroValue!1279 () V!53529)

(declare-datatypes ((Unit!43481 0))(
  ( (Unit!43482) )
))
(declare-fun lt!589717 () Unit!43481)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!206 ((_ BitVec 64) (_ BitVec 64) V!53529 ListLongMap!21243) Unit!43481)

(assert (=> b!1325948 (= lt!589717 (lemmaInListMapAfterAddingDiffThenInBefore!206 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589718))))

(declare-fun lt!589719 () ListLongMap!21243)

(assert (=> b!1325948 (contains!8721 lt!589719 k0!1164)))

(declare-fun lt!589716 () Unit!43481)

(declare-fun minValue!1279 () V!53529)

(assert (=> b!1325948 (= lt!589716 (lemmaInListMapAfterAddingDiffThenInBefore!206 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589719))))

(declare-fun +!4644 (ListLongMap!21243 tuple2!23586) ListLongMap!21243)

(assert (=> b!1325948 (= lt!589719 (+!4644 lt!589718 (tuple2!23587 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6282 (array!89477 array!89479 (_ BitVec 32) (_ BitVec 32) V!53529 V!53529 (_ BitVec 32) Int) ListLongMap!21243)

(declare-fun get!21772 (ValueCell!17261 V!53529) V!53529)

(declare-fun dynLambda!3574 (Int (_ BitVec 64)) V!53529)

(assert (=> b!1325948 (= lt!589718 (+!4644 (getCurrentListMapNoExtraKeys!6282 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23587 (select (arr!43212 _keys!1609) from!2000) (get!21772 (select (arr!43213 _values!1337) from!2000) (dynLambda!3574 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!880042 () Bool)

(assert (=> start!111900 (=> (not res!880042) (not e!755807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111900 (= res!880042 (validMask!0 mask!2019))))

(assert (=> start!111900 e!755807))

(declare-fun array_inv!32799 (array!89477) Bool)

(assert (=> start!111900 (array_inv!32799 _keys!1609)))

(assert (=> start!111900 true))

(assert (=> start!111900 tp_is_empty!36319))

(declare-fun e!755809 () Bool)

(declare-fun array_inv!32800 (array!89479) Bool)

(assert (=> start!111900 (and (array_inv!32800 _values!1337) e!755809)))

(assert (=> start!111900 tp!106978))

(declare-fun mapNonEmpty!56130 () Bool)

(declare-fun tp!106977 () Bool)

(assert (=> mapNonEmpty!56130 (= mapRes!56130 (and tp!106977 e!755808))))

(declare-fun mapValue!56130 () ValueCell!17261)

(declare-fun mapKey!56130 () (_ BitVec 32))

(declare-fun mapRest!56130 () (Array (_ BitVec 32) ValueCell!17261))

(assert (=> mapNonEmpty!56130 (= (arr!43213 _values!1337) (store mapRest!56130 mapKey!56130 mapValue!56130))))

(declare-fun b!1325949 () Bool)

(declare-fun res!880039 () Bool)

(assert (=> b!1325949 (=> (not res!880039) (not e!755807))))

(assert (=> b!1325949 (= res!880039 (and (= (size!43765 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43764 _keys!1609) (size!43765 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325950 () Bool)

(declare-fun res!880038 () Bool)

(assert (=> b!1325950 (=> (not res!880038) (not e!755807))))

(assert (=> b!1325950 (= res!880038 (not (= (select (arr!43212 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325951 () Bool)

(declare-fun e!755806 () Bool)

(assert (=> b!1325951 (= e!755809 (and e!755806 mapRes!56130))))

(declare-fun condMapEmpty!56130 () Bool)

(declare-fun mapDefault!56130 () ValueCell!17261)

(assert (=> b!1325951 (= condMapEmpty!56130 (= (arr!43213 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17261)) mapDefault!56130)))))

(declare-fun b!1325952 () Bool)

(assert (=> b!1325952 (= e!755806 tp_is_empty!36319)))

(declare-fun b!1325953 () Bool)

(declare-fun res!880040 () Bool)

(assert (=> b!1325953 (=> (not res!880040) (not e!755807))))

(declare-fun getCurrentListMap!5511 (array!89477 array!89479 (_ BitVec 32) (_ BitVec 32) V!53529 V!53529 (_ BitVec 32) Int) ListLongMap!21243)

(assert (=> b!1325953 (= res!880040 (contains!8721 (getCurrentListMap!5511 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111900 res!880042) b!1325949))

(assert (= (and b!1325949 res!880039) b!1325947))

(assert (= (and b!1325947 res!880041) b!1325943))

(assert (= (and b!1325943 res!880036) b!1325944))

(assert (= (and b!1325944 res!880043) b!1325953))

(assert (= (and b!1325953 res!880040) b!1325950))

(assert (= (and b!1325950 res!880038) b!1325946))

(assert (= (and b!1325946 res!880037) b!1325948))

(assert (= (and b!1325951 condMapEmpty!56130) mapIsEmpty!56130))

(assert (= (and b!1325951 (not condMapEmpty!56130)) mapNonEmpty!56130))

(get-info :version)

(assert (= (and mapNonEmpty!56130 ((_ is ValueCellFull!17261) mapValue!56130)) b!1325945))

(assert (= (and b!1325951 ((_ is ValueCellFull!17261) mapDefault!56130)) b!1325952))

(assert (= start!111900 b!1325951))

(declare-fun b_lambda!23767 () Bool)

(assert (=> (not b_lambda!23767) (not b!1325948)))

(declare-fun t!44672 () Bool)

(declare-fun tb!11765 () Bool)

(assert (=> (and start!111900 (= defaultEntry!1340 defaultEntry!1340) t!44672) tb!11765))

(declare-fun result!24595 () Bool)

(assert (=> tb!11765 (= result!24595 tp_is_empty!36319)))

(assert (=> b!1325948 t!44672))

(declare-fun b_and!49077 () Bool)

(assert (= b_and!49075 (and (=> t!44672 result!24595) b_and!49077)))

(declare-fun m!1214413 () Bool)

(assert (=> b!1325948 m!1214413))

(declare-fun m!1214415 () Bool)

(assert (=> b!1325948 m!1214415))

(declare-fun m!1214417 () Bool)

(assert (=> b!1325948 m!1214417))

(assert (=> b!1325948 m!1214415))

(declare-fun m!1214419 () Bool)

(assert (=> b!1325948 m!1214419))

(declare-fun m!1214421 () Bool)

(assert (=> b!1325948 m!1214421))

(declare-fun m!1214423 () Bool)

(assert (=> b!1325948 m!1214423))

(declare-fun m!1214425 () Bool)

(assert (=> b!1325948 m!1214425))

(declare-fun m!1214427 () Bool)

(assert (=> b!1325948 m!1214427))

(assert (=> b!1325948 m!1214427))

(assert (=> b!1325948 m!1214417))

(declare-fun m!1214429 () Bool)

(assert (=> b!1325948 m!1214429))

(declare-fun m!1214431 () Bool)

(assert (=> b!1325948 m!1214431))

(declare-fun m!1214433 () Bool)

(assert (=> b!1325948 m!1214433))

(declare-fun m!1214435 () Bool)

(assert (=> start!111900 m!1214435))

(declare-fun m!1214437 () Bool)

(assert (=> start!111900 m!1214437))

(declare-fun m!1214439 () Bool)

(assert (=> start!111900 m!1214439))

(declare-fun m!1214441 () Bool)

(assert (=> b!1325947 m!1214441))

(assert (=> b!1325950 m!1214433))

(declare-fun m!1214443 () Bool)

(assert (=> b!1325953 m!1214443))

(assert (=> b!1325953 m!1214443))

(declare-fun m!1214445 () Bool)

(assert (=> b!1325953 m!1214445))

(declare-fun m!1214447 () Bool)

(assert (=> b!1325943 m!1214447))

(assert (=> b!1325946 m!1214433))

(assert (=> b!1325946 m!1214433))

(declare-fun m!1214449 () Bool)

(assert (=> b!1325946 m!1214449))

(declare-fun m!1214451 () Bool)

(assert (=> mapNonEmpty!56130 m!1214451))

(check-sat (not b!1325943) (not b!1325947) (not start!111900) b_and!49077 (not mapNonEmpty!56130) (not b_lambda!23767) tp_is_empty!36319 (not b_next!30499) (not b!1325948) (not b!1325946) (not b!1325953))
(check-sat b_and!49077 (not b_next!30499))
