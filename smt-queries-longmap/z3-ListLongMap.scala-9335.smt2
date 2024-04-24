; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111670 () Bool)

(assert start!111670)

(declare-fun b_free!30103 () Bool)

(declare-fun b_next!30103 () Bool)

(assert (=> start!111670 (= b_free!30103 (not b_next!30103))))

(declare-fun tp!105785 () Bool)

(declare-fun b_and!48367 () Bool)

(assert (=> start!111670 (= tp!105785 b_and!48367)))

(declare-fun b!1320319 () Bool)

(declare-fun res!875935 () Bool)

(declare-fun e!753453 () Bool)

(assert (=> b!1320319 (=> (not res!875935) (not e!753453))))

(declare-datatypes ((array!88859 0))(
  ( (array!88860 (arr!42899 (Array (_ BitVec 32) (_ BitVec 64))) (size!43450 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88859)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53001 0))(
  ( (V!53002 (val!18036 Int)) )
))
(declare-fun zeroValue!1279 () V!53001)

(declare-datatypes ((ValueCell!17063 0))(
  ( (ValueCellFull!17063 (v!20661 V!53001)) (EmptyCell!17063) )
))
(declare-datatypes ((array!88861 0))(
  ( (array!88862 (arr!42900 (Array (_ BitVec 32) ValueCell!17063)) (size!43451 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88861)

(declare-fun minValue!1279 () V!53001)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23244 0))(
  ( (tuple2!23245 (_1!11633 (_ BitVec 64)) (_2!11633 V!53001)) )
))
(declare-datatypes ((List!30404 0))(
  ( (Nil!30401) (Cons!30400 (h!31618 tuple2!23244) (t!44048 List!30404)) )
))
(declare-datatypes ((ListLongMap!20909 0))(
  ( (ListLongMap!20910 (toList!10470 List!30404)) )
))
(declare-fun contains!8637 (ListLongMap!20909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5471 (array!88859 array!88861 (_ BitVec 32) (_ BitVec 32) V!53001 V!53001 (_ BitVec 32) Int) ListLongMap!20909)

(assert (=> b!1320319 (= res!875935 (contains!8637 (getCurrentListMap!5471 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320320 () Bool)

(declare-fun res!875937 () Bool)

(assert (=> b!1320320 (=> (not res!875937) (not e!753453))))

(assert (=> b!1320320 (= res!875937 (and (= (size!43451 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43450 _keys!1609) (size!43451 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320321 () Bool)

(declare-fun e!753454 () Bool)

(declare-fun e!753456 () Bool)

(declare-fun mapRes!55532 () Bool)

(assert (=> b!1320321 (= e!753454 (and e!753456 mapRes!55532))))

(declare-fun condMapEmpty!55532 () Bool)

(declare-fun mapDefault!55532 () ValueCell!17063)

(assert (=> b!1320321 (= condMapEmpty!55532 (= (arr!42900 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17063)) mapDefault!55532)))))

(declare-fun b!1320322 () Bool)

(declare-fun tp_is_empty!35923 () Bool)

(assert (=> b!1320322 (= e!753456 tp_is_empty!35923)))

(declare-fun b!1320323 () Bool)

(declare-fun res!875933 () Bool)

(assert (=> b!1320323 (=> (not res!875933) (not e!753453))))

(assert (=> b!1320323 (= res!875933 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43450 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320324 () Bool)

(declare-fun e!753457 () Bool)

(assert (=> b!1320324 (= e!753457 tp_is_empty!35923)))

(declare-fun b!1320325 () Bool)

(declare-fun res!875934 () Bool)

(assert (=> b!1320325 (=> (not res!875934) (not e!753453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88859 (_ BitVec 32)) Bool)

(assert (=> b!1320325 (= res!875934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55532 () Bool)

(declare-fun tp!105784 () Bool)

(assert (=> mapNonEmpty!55532 (= mapRes!55532 (and tp!105784 e!753457))))

(declare-fun mapRest!55532 () (Array (_ BitVec 32) ValueCell!17063))

(declare-fun mapKey!55532 () (_ BitVec 32))

(declare-fun mapValue!55532 () ValueCell!17063)

(assert (=> mapNonEmpty!55532 (= (arr!42900 _values!1337) (store mapRest!55532 mapKey!55532 mapValue!55532))))

(declare-fun b!1320326 () Bool)

(declare-fun res!875931 () Bool)

(assert (=> b!1320326 (=> (not res!875931) (not e!753453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320326 (= res!875931 (validKeyInArray!0 (select (arr!42899 _keys!1609) from!2000)))))

(declare-fun b!1320327 () Bool)

(declare-fun res!875932 () Bool)

(assert (=> b!1320327 (=> (not res!875932) (not e!753453))))

(declare-datatypes ((List!30405 0))(
  ( (Nil!30402) (Cons!30401 (h!31619 (_ BitVec 64)) (t!44049 List!30405)) )
))
(declare-fun arrayNoDuplicates!0 (array!88859 (_ BitVec 32) List!30405) Bool)

(assert (=> b!1320327 (= res!875932 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30402))))

(declare-fun mapIsEmpty!55532 () Bool)

(assert (=> mapIsEmpty!55532 mapRes!55532))

(declare-fun b!1320328 () Bool)

(assert (=> b!1320328 (= e!753453 (not true))))

(declare-fun lt!587045 () ListLongMap!20909)

(assert (=> b!1320328 (contains!8637 lt!587045 k0!1164)))

(declare-datatypes ((Unit!43403 0))(
  ( (Unit!43404) )
))
(declare-fun lt!587044 () Unit!43403)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!113 ((_ BitVec 64) (_ BitVec 64) V!53001 ListLongMap!20909) Unit!43403)

(assert (=> b!1320328 (= lt!587044 (lemmaInListMapAfterAddingDiffThenInBefore!113 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587045))))

(declare-fun +!4558 (ListLongMap!20909 tuple2!23244) ListLongMap!20909)

(declare-fun getCurrentListMapNoExtraKeys!6197 (array!88859 array!88861 (_ BitVec 32) (_ BitVec 32) V!53001 V!53001 (_ BitVec 32) Int) ListLongMap!20909)

(declare-fun get!21587 (ValueCell!17063 V!53001) V!53001)

(declare-fun dynLambda!3512 (Int (_ BitVec 64)) V!53001)

(assert (=> b!1320328 (= lt!587045 (+!4558 (+!4558 (getCurrentListMapNoExtraKeys!6197 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23245 (select (arr!42899 _keys!1609) from!2000) (get!21587 (select (arr!42900 _values!1337) from!2000) (dynLambda!3512 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1320329 () Bool)

(declare-fun res!875936 () Bool)

(assert (=> b!1320329 (=> (not res!875936) (not e!753453))))

(assert (=> b!1320329 (= res!875936 (not (= (select (arr!42899 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!875938 () Bool)

(assert (=> start!111670 (=> (not res!875938) (not e!753453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111670 (= res!875938 (validMask!0 mask!2019))))

(assert (=> start!111670 e!753453))

(declare-fun array_inv!32659 (array!88859) Bool)

(assert (=> start!111670 (array_inv!32659 _keys!1609)))

(assert (=> start!111670 true))

(assert (=> start!111670 tp_is_empty!35923))

(declare-fun array_inv!32660 (array!88861) Bool)

(assert (=> start!111670 (and (array_inv!32660 _values!1337) e!753454)))

(assert (=> start!111670 tp!105785))

(assert (= (and start!111670 res!875938) b!1320320))

(assert (= (and b!1320320 res!875937) b!1320325))

(assert (= (and b!1320325 res!875934) b!1320327))

(assert (= (and b!1320327 res!875932) b!1320323))

(assert (= (and b!1320323 res!875933) b!1320319))

(assert (= (and b!1320319 res!875935) b!1320329))

(assert (= (and b!1320329 res!875936) b!1320326))

(assert (= (and b!1320326 res!875931) b!1320328))

(assert (= (and b!1320321 condMapEmpty!55532) mapIsEmpty!55532))

(assert (= (and b!1320321 (not condMapEmpty!55532)) mapNonEmpty!55532))

(get-info :version)

(assert (= (and mapNonEmpty!55532 ((_ is ValueCellFull!17063) mapValue!55532)) b!1320324))

(assert (= (and b!1320321 ((_ is ValueCellFull!17063) mapDefault!55532)) b!1320322))

(assert (= start!111670 b!1320321))

(declare-fun b_lambda!23423 () Bool)

(assert (=> (not b_lambda!23423) (not b!1320328)))

(declare-fun t!44047 () Bool)

(declare-fun tb!11447 () Bool)

(assert (=> (and start!111670 (= defaultEntry!1340 defaultEntry!1340) t!44047) tb!11447))

(declare-fun result!23957 () Bool)

(assert (=> tb!11447 (= result!23957 tp_is_empty!35923)))

(assert (=> b!1320328 t!44047))

(declare-fun b_and!48369 () Bool)

(assert (= b_and!48367 (and (=> t!44047 result!23957) b_and!48369)))

(declare-fun m!1208201 () Bool)

(assert (=> b!1320326 m!1208201))

(assert (=> b!1320326 m!1208201))

(declare-fun m!1208203 () Bool)

(assert (=> b!1320326 m!1208203))

(declare-fun m!1208205 () Bool)

(assert (=> b!1320328 m!1208205))

(declare-fun m!1208207 () Bool)

(assert (=> b!1320328 m!1208207))

(assert (=> b!1320328 m!1208205))

(declare-fun m!1208209 () Bool)

(assert (=> b!1320328 m!1208209))

(declare-fun m!1208211 () Bool)

(assert (=> b!1320328 m!1208211))

(declare-fun m!1208213 () Bool)

(assert (=> b!1320328 m!1208213))

(assert (=> b!1320328 m!1208209))

(declare-fun m!1208215 () Bool)

(assert (=> b!1320328 m!1208215))

(assert (=> b!1320328 m!1208213))

(assert (=> b!1320328 m!1208207))

(declare-fun m!1208217 () Bool)

(assert (=> b!1320328 m!1208217))

(declare-fun m!1208219 () Bool)

(assert (=> b!1320328 m!1208219))

(assert (=> b!1320328 m!1208201))

(declare-fun m!1208221 () Bool)

(assert (=> start!111670 m!1208221))

(declare-fun m!1208223 () Bool)

(assert (=> start!111670 m!1208223))

(declare-fun m!1208225 () Bool)

(assert (=> start!111670 m!1208225))

(declare-fun m!1208227 () Bool)

(assert (=> b!1320325 m!1208227))

(declare-fun m!1208229 () Bool)

(assert (=> b!1320319 m!1208229))

(assert (=> b!1320319 m!1208229))

(declare-fun m!1208231 () Bool)

(assert (=> b!1320319 m!1208231))

(assert (=> b!1320329 m!1208201))

(declare-fun m!1208233 () Bool)

(assert (=> b!1320327 m!1208233))

(declare-fun m!1208235 () Bool)

(assert (=> mapNonEmpty!55532 m!1208235))

(check-sat (not b_lambda!23423) b_and!48369 (not b!1320327) (not b!1320326) tp_is_empty!35923 (not b_next!30103) (not b!1320328) (not mapNonEmpty!55532) (not b!1320319) (not b!1320325) (not start!111670))
(check-sat b_and!48369 (not b_next!30103))
