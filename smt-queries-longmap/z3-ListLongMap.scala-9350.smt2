; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111536 () Bool)

(assert start!111536)

(declare-fun b_free!30193 () Bool)

(declare-fun b_next!30193 () Bool)

(assert (=> start!111536 (= b_free!30193 (not b_next!30193))))

(declare-fun tp!106056 () Bool)

(declare-fun b_and!48527 () Bool)

(assert (=> start!111536 (= tp!106056 b_and!48527)))

(declare-fun b!1320525 () Bool)

(declare-fun res!876467 () Bool)

(declare-fun e!753255 () Bool)

(assert (=> b!1320525 (=> (not res!876467) (not e!753255))))

(declare-datatypes ((array!88881 0))(
  ( (array!88882 (arr!42915 (Array (_ BitVec 32) (_ BitVec 64))) (size!43467 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88881)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1320525 (= res!876467 (not (= (select (arr!42915 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!876468 () Bool)

(assert (=> start!111536 (=> (not res!876468) (not e!753255))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111536 (= res!876468 (validMask!0 mask!2019))))

(assert (=> start!111536 e!753255))

(declare-fun array_inv!32585 (array!88881) Bool)

(assert (=> start!111536 (array_inv!32585 _keys!1609)))

(assert (=> start!111536 true))

(declare-fun tp_is_empty!36013 () Bool)

(assert (=> start!111536 tp_is_empty!36013))

(declare-datatypes ((V!53121 0))(
  ( (V!53122 (val!18081 Int)) )
))
(declare-datatypes ((ValueCell!17108 0))(
  ( (ValueCellFull!17108 (v!20710 V!53121)) (EmptyCell!17108) )
))
(declare-datatypes ((array!88883 0))(
  ( (array!88884 (arr!42916 (Array (_ BitVec 32) ValueCell!17108)) (size!43468 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88883)

(declare-fun e!753254 () Bool)

(declare-fun array_inv!32586 (array!88883) Bool)

(assert (=> start!111536 (and (array_inv!32586 _values!1337) e!753254)))

(assert (=> start!111536 tp!106056))

(declare-fun b!1320526 () Bool)

(declare-fun res!876464 () Bool)

(assert (=> b!1320526 (=> (not res!876464) (not e!753255))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1320526 (= res!876464 (and (= (size!43468 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43467 _keys!1609) (size!43468 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320527 () Bool)

(declare-fun res!876471 () Bool)

(assert (=> b!1320527 (=> (not res!876471) (not e!753255))))

(declare-datatypes ((List!30497 0))(
  ( (Nil!30494) (Cons!30493 (h!31702 (_ BitVec 64)) (t!44231 List!30497)) )
))
(declare-fun arrayNoDuplicates!0 (array!88881 (_ BitVec 32) List!30497) Bool)

(assert (=> b!1320527 (= res!876471 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30494))))

(declare-fun b!1320528 () Bool)

(declare-fun res!876469 () Bool)

(assert (=> b!1320528 (=> (not res!876469) (not e!753255))))

(assert (=> b!1320528 (= res!876469 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43467 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55667 () Bool)

(declare-fun mapRes!55667 () Bool)

(assert (=> mapIsEmpty!55667 mapRes!55667))

(declare-fun b!1320529 () Bool)

(declare-fun e!753253 () Bool)

(assert (=> b!1320529 (= e!753254 (and e!753253 mapRes!55667))))

(declare-fun condMapEmpty!55667 () Bool)

(declare-fun mapDefault!55667 () ValueCell!17108)

(assert (=> b!1320529 (= condMapEmpty!55667 (= (arr!42916 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17108)) mapDefault!55667)))))

(declare-fun b!1320530 () Bool)

(declare-fun res!876470 () Bool)

(assert (=> b!1320530 (=> (not res!876470) (not e!753255))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320530 (= res!876470 (validKeyInArray!0 (select (arr!42915 _keys!1609) from!2000)))))

(declare-fun b!1320531 () Bool)

(assert (=> b!1320531 (= e!753255 (not true))))

(declare-datatypes ((tuple2!23362 0))(
  ( (tuple2!23363 (_1!11692 (_ BitVec 64)) (_2!11692 V!53121)) )
))
(declare-datatypes ((List!30498 0))(
  ( (Nil!30495) (Cons!30494 (h!31703 tuple2!23362) (t!44232 List!30498)) )
))
(declare-datatypes ((ListLongMap!21019 0))(
  ( (ListLongMap!21020 (toList!10525 List!30498)) )
))
(declare-fun lt!586820 () ListLongMap!21019)

(declare-fun contains!8608 (ListLongMap!21019 (_ BitVec 64)) Bool)

(assert (=> b!1320531 (contains!8608 lt!586820 k0!1164)))

(declare-fun zeroValue!1279 () V!53121)

(declare-datatypes ((Unit!43323 0))(
  ( (Unit!43324) )
))
(declare-fun lt!586818 () Unit!43323)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!135 ((_ BitVec 64) (_ BitVec 64) V!53121 ListLongMap!21019) Unit!43323)

(assert (=> b!1320531 (= lt!586818 (lemmaInListMapAfterAddingDiffThenInBefore!135 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586820))))

(declare-fun lt!586819 () ListLongMap!21019)

(assert (=> b!1320531 (contains!8608 lt!586819 k0!1164)))

(declare-fun minValue!1279 () V!53121)

(declare-fun lt!586821 () Unit!43323)

(assert (=> b!1320531 (= lt!586821 (lemmaInListMapAfterAddingDiffThenInBefore!135 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586819))))

(declare-fun +!4570 (ListLongMap!21019 tuple2!23362) ListLongMap!21019)

(assert (=> b!1320531 (= lt!586819 (+!4570 lt!586820 (tuple2!23363 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6203 (array!88881 array!88883 (_ BitVec 32) (_ BitVec 32) V!53121 V!53121 (_ BitVec 32) Int) ListLongMap!21019)

(declare-fun get!21593 (ValueCell!17108 V!53121) V!53121)

(declare-fun dynLambda!3500 (Int (_ BitVec 64)) V!53121)

(assert (=> b!1320531 (= lt!586820 (+!4570 (getCurrentListMapNoExtraKeys!6203 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23363 (select (arr!42915 _keys!1609) from!2000) (get!21593 (select (arr!42916 _values!1337) from!2000) (dynLambda!3500 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320532 () Bool)

(assert (=> b!1320532 (= e!753253 tp_is_empty!36013)))

(declare-fun b!1320533 () Bool)

(declare-fun res!876465 () Bool)

(assert (=> b!1320533 (=> (not res!876465) (not e!753255))))

(declare-fun getCurrentListMap!5412 (array!88881 array!88883 (_ BitVec 32) (_ BitVec 32) V!53121 V!53121 (_ BitVec 32) Int) ListLongMap!21019)

(assert (=> b!1320533 (= res!876465 (contains!8608 (getCurrentListMap!5412 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320534 () Bool)

(declare-fun res!876466 () Bool)

(assert (=> b!1320534 (=> (not res!876466) (not e!753255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88881 (_ BitVec 32)) Bool)

(assert (=> b!1320534 (= res!876466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55667 () Bool)

(declare-fun tp!106055 () Bool)

(declare-fun e!753252 () Bool)

(assert (=> mapNonEmpty!55667 (= mapRes!55667 (and tp!106055 e!753252))))

(declare-fun mapValue!55667 () ValueCell!17108)

(declare-fun mapKey!55667 () (_ BitVec 32))

(declare-fun mapRest!55667 () (Array (_ BitVec 32) ValueCell!17108))

(assert (=> mapNonEmpty!55667 (= (arr!42916 _values!1337) (store mapRest!55667 mapKey!55667 mapValue!55667))))

(declare-fun b!1320535 () Bool)

(assert (=> b!1320535 (= e!753252 tp_is_empty!36013)))

(assert (= (and start!111536 res!876468) b!1320526))

(assert (= (and b!1320526 res!876464) b!1320534))

(assert (= (and b!1320534 res!876466) b!1320527))

(assert (= (and b!1320527 res!876471) b!1320528))

(assert (= (and b!1320528 res!876469) b!1320533))

(assert (= (and b!1320533 res!876465) b!1320525))

(assert (= (and b!1320525 res!876467) b!1320530))

(assert (= (and b!1320530 res!876470) b!1320531))

(assert (= (and b!1320529 condMapEmpty!55667) mapIsEmpty!55667))

(assert (= (and b!1320529 (not condMapEmpty!55667)) mapNonEmpty!55667))

(get-info :version)

(assert (= (and mapNonEmpty!55667 ((_ is ValueCellFull!17108) mapValue!55667)) b!1320535))

(assert (= (and b!1320529 ((_ is ValueCellFull!17108) mapDefault!55667)) b!1320532))

(assert (= start!111536 b!1320529))

(declare-fun b_lambda!23509 () Bool)

(assert (=> (not b_lambda!23509) (not b!1320531)))

(declare-fun t!44230 () Bool)

(declare-fun tb!11537 () Bool)

(assert (=> (and start!111536 (= defaultEntry!1340 defaultEntry!1340) t!44230) tb!11537))

(declare-fun result!24137 () Bool)

(assert (=> tb!11537 (= result!24137 tp_is_empty!36013)))

(assert (=> b!1320531 t!44230))

(declare-fun b_and!48529 () Bool)

(assert (= b_and!48527 (and (=> t!44230 result!24137) b_and!48529)))

(declare-fun m!1207815 () Bool)

(assert (=> mapNonEmpty!55667 m!1207815))

(declare-fun m!1207817 () Bool)

(assert (=> b!1320531 m!1207817))

(declare-fun m!1207819 () Bool)

(assert (=> b!1320531 m!1207819))

(declare-fun m!1207821 () Bool)

(assert (=> b!1320531 m!1207821))

(declare-fun m!1207823 () Bool)

(assert (=> b!1320531 m!1207823))

(declare-fun m!1207825 () Bool)

(assert (=> b!1320531 m!1207825))

(declare-fun m!1207827 () Bool)

(assert (=> b!1320531 m!1207827))

(declare-fun m!1207829 () Bool)

(assert (=> b!1320531 m!1207829))

(assert (=> b!1320531 m!1207829))

(assert (=> b!1320531 m!1207817))

(declare-fun m!1207831 () Bool)

(assert (=> b!1320531 m!1207831))

(assert (=> b!1320531 m!1207819))

(declare-fun m!1207833 () Bool)

(assert (=> b!1320531 m!1207833))

(declare-fun m!1207835 () Bool)

(assert (=> b!1320531 m!1207835))

(declare-fun m!1207837 () Bool)

(assert (=> b!1320531 m!1207837))

(assert (=> b!1320530 m!1207837))

(assert (=> b!1320530 m!1207837))

(declare-fun m!1207839 () Bool)

(assert (=> b!1320530 m!1207839))

(assert (=> b!1320525 m!1207837))

(declare-fun m!1207841 () Bool)

(assert (=> b!1320527 m!1207841))

(declare-fun m!1207843 () Bool)

(assert (=> b!1320533 m!1207843))

(assert (=> b!1320533 m!1207843))

(declare-fun m!1207845 () Bool)

(assert (=> b!1320533 m!1207845))

(declare-fun m!1207847 () Bool)

(assert (=> b!1320534 m!1207847))

(declare-fun m!1207849 () Bool)

(assert (=> start!111536 m!1207849))

(declare-fun m!1207851 () Bool)

(assert (=> start!111536 m!1207851))

(declare-fun m!1207853 () Bool)

(assert (=> start!111536 m!1207853))

(check-sat (not b_next!30193) (not mapNonEmpty!55667) tp_is_empty!36013 b_and!48529 (not b!1320534) (not start!111536) (not b_lambda!23509) (not b!1320533) (not b!1320531) (not b!1320527) (not b!1320530))
(check-sat b_and!48529 (not b_next!30193))
