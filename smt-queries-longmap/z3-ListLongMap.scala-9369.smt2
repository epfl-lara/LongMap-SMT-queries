; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111874 () Bool)

(assert start!111874)

(declare-fun b_free!30307 () Bool)

(declare-fun b_next!30307 () Bool)

(assert (=> start!111874 (= b_free!30307 (not b_next!30307))))

(declare-fun tp!106396 () Bool)

(declare-fun b_and!48775 () Bool)

(assert (=> start!111874 (= tp!106396 b_and!48775)))

(declare-fun b!1323889 () Bool)

(declare-fun res!878380 () Bool)

(declare-fun e!754986 () Bool)

(assert (=> b!1323889 (=> (not res!878380) (not e!754986))))

(declare-datatypes ((array!89259 0))(
  ( (array!89260 (arr!43099 (Array (_ BitVec 32) (_ BitVec 64))) (size!43650 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89259)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53273 0))(
  ( (V!53274 (val!18138 Int)) )
))
(declare-datatypes ((ValueCell!17165 0))(
  ( (ValueCellFull!17165 (v!20763 V!53273)) (EmptyCell!17165) )
))
(declare-datatypes ((array!89261 0))(
  ( (array!89262 (arr!43100 (Array (_ BitVec 32) ValueCell!17165)) (size!43651 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89261)

(declare-fun minValue!1279 () V!53273)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53273)

(declare-datatypes ((tuple2!23414 0))(
  ( (tuple2!23415 (_1!11718 (_ BitVec 64)) (_2!11718 V!53273)) )
))
(declare-datatypes ((List!30564 0))(
  ( (Nil!30561) (Cons!30560 (h!31778 tuple2!23414) (t!44412 List!30564)) )
))
(declare-datatypes ((ListLongMap!21079 0))(
  ( (ListLongMap!21080 (toList!10555 List!30564)) )
))
(declare-fun contains!8722 (ListLongMap!21079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5543 (array!89259 array!89261 (_ BitVec 32) (_ BitVec 32) V!53273 V!53273 (_ BitVec 32) Int) ListLongMap!21079)

(assert (=> b!1323889 (= res!878380 (contains!8722 (getCurrentListMap!5543 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323890 () Bool)

(declare-fun res!878385 () Bool)

(assert (=> b!1323890 (=> (not res!878385) (not e!754986))))

(assert (=> b!1323890 (= res!878385 (and (= (size!43651 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43650 _keys!1609) (size!43651 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323891 () Bool)

(declare-fun res!878384 () Bool)

(assert (=> b!1323891 (=> (not res!878384) (not e!754986))))

(assert (=> b!1323891 (= res!878384 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43650 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!878382 () Bool)

(assert (=> start!111874 (=> (not res!878382) (not e!754986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111874 (= res!878382 (validMask!0 mask!2019))))

(assert (=> start!111874 e!754986))

(declare-fun array_inv!32813 (array!89259) Bool)

(assert (=> start!111874 (array_inv!32813 _keys!1609)))

(assert (=> start!111874 true))

(declare-fun tp_is_empty!36127 () Bool)

(assert (=> start!111874 tp_is_empty!36127))

(declare-fun e!754983 () Bool)

(declare-fun array_inv!32814 (array!89261) Bool)

(assert (=> start!111874 (and (array_inv!32814 _values!1337) e!754983)))

(assert (=> start!111874 tp!106396))

(declare-fun b!1323892 () Bool)

(assert (=> b!1323892 (= e!754986 (not true))))

(declare-fun lt!588763 () ListLongMap!21079)

(declare-fun lt!588767 () tuple2!23414)

(declare-fun +!4630 (ListLongMap!21079 tuple2!23414) ListLongMap!21079)

(assert (=> b!1323892 (contains!8722 (+!4630 lt!588763 lt!588767) k0!1164)))

(declare-datatypes ((Unit!43547 0))(
  ( (Unit!43548) )
))
(declare-fun lt!588765 () Unit!43547)

(declare-fun addStillContains!1142 (ListLongMap!21079 (_ BitVec 64) V!53273 (_ BitVec 64)) Unit!43547)

(assert (=> b!1323892 (= lt!588765 (addStillContains!1142 lt!588763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323892 (contains!8722 lt!588763 k0!1164)))

(declare-fun lt!588760 () Unit!43547)

(declare-fun lt!588762 () V!53273)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!185 ((_ BitVec 64) (_ BitVec 64) V!53273 ListLongMap!21079) Unit!43547)

(assert (=> b!1323892 (= lt!588760 (lemmaInListMapAfterAddingDiffThenInBefore!185 k0!1164 (select (arr!43099 _keys!1609) from!2000) lt!588762 lt!588763))))

(declare-fun lt!588759 () ListLongMap!21079)

(assert (=> b!1323892 (contains!8722 lt!588759 k0!1164)))

(declare-fun lt!588761 () Unit!43547)

(assert (=> b!1323892 (= lt!588761 (lemmaInListMapAfterAddingDiffThenInBefore!185 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588759))))

(declare-fun lt!588766 () ListLongMap!21079)

(assert (=> b!1323892 (contains!8722 lt!588766 k0!1164)))

(declare-fun lt!588764 () Unit!43547)

(assert (=> b!1323892 (= lt!588764 (lemmaInListMapAfterAddingDiffThenInBefore!185 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588766))))

(assert (=> b!1323892 (= lt!588766 (+!4630 lt!588759 lt!588767))))

(assert (=> b!1323892 (= lt!588767 (tuple2!23415 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323892 (= lt!588759 (+!4630 lt!588763 (tuple2!23415 (select (arr!43099 _keys!1609) from!2000) lt!588762)))))

(declare-fun get!21727 (ValueCell!17165 V!53273) V!53273)

(declare-fun dynLambda!3584 (Int (_ BitVec 64)) V!53273)

(assert (=> b!1323892 (= lt!588762 (get!21727 (select (arr!43100 _values!1337) from!2000) (dynLambda!3584 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6269 (array!89259 array!89261 (_ BitVec 32) (_ BitVec 32) V!53273 V!53273 (_ BitVec 32) Int) ListLongMap!21079)

(assert (=> b!1323892 (= lt!588763 (getCurrentListMapNoExtraKeys!6269 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323893 () Bool)

(declare-fun res!878383 () Bool)

(assert (=> b!1323893 (=> (not res!878383) (not e!754986))))

(declare-datatypes ((List!30565 0))(
  ( (Nil!30562) (Cons!30561 (h!31779 (_ BitVec 64)) (t!44413 List!30565)) )
))
(declare-fun arrayNoDuplicates!0 (array!89259 (_ BitVec 32) List!30565) Bool)

(assert (=> b!1323893 (= res!878383 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30562))))

(declare-fun b!1323894 () Bool)

(declare-fun e!754985 () Bool)

(assert (=> b!1323894 (= e!754985 tp_is_empty!36127)))

(declare-fun mapIsEmpty!55838 () Bool)

(declare-fun mapRes!55838 () Bool)

(assert (=> mapIsEmpty!55838 mapRes!55838))

(declare-fun b!1323895 () Bool)

(declare-fun res!878379 () Bool)

(assert (=> b!1323895 (=> (not res!878379) (not e!754986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89259 (_ BitVec 32)) Bool)

(assert (=> b!1323895 (= res!878379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55838 () Bool)

(declare-fun tp!106397 () Bool)

(declare-fun e!754987 () Bool)

(assert (=> mapNonEmpty!55838 (= mapRes!55838 (and tp!106397 e!754987))))

(declare-fun mapRest!55838 () (Array (_ BitVec 32) ValueCell!17165))

(declare-fun mapValue!55838 () ValueCell!17165)

(declare-fun mapKey!55838 () (_ BitVec 32))

(assert (=> mapNonEmpty!55838 (= (arr!43100 _values!1337) (store mapRest!55838 mapKey!55838 mapValue!55838))))

(declare-fun b!1323896 () Bool)

(assert (=> b!1323896 (= e!754983 (and e!754985 mapRes!55838))))

(declare-fun condMapEmpty!55838 () Bool)

(declare-fun mapDefault!55838 () ValueCell!17165)

(assert (=> b!1323896 (= condMapEmpty!55838 (= (arr!43100 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17165)) mapDefault!55838)))))

(declare-fun b!1323897 () Bool)

(declare-fun res!878386 () Bool)

(assert (=> b!1323897 (=> (not res!878386) (not e!754986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323897 (= res!878386 (validKeyInArray!0 (select (arr!43099 _keys!1609) from!2000)))))

(declare-fun b!1323898 () Bool)

(assert (=> b!1323898 (= e!754987 tp_is_empty!36127)))

(declare-fun b!1323899 () Bool)

(declare-fun res!878381 () Bool)

(assert (=> b!1323899 (=> (not res!878381) (not e!754986))))

(assert (=> b!1323899 (= res!878381 (not (= (select (arr!43099 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111874 res!878382) b!1323890))

(assert (= (and b!1323890 res!878385) b!1323895))

(assert (= (and b!1323895 res!878379) b!1323893))

(assert (= (and b!1323893 res!878383) b!1323891))

(assert (= (and b!1323891 res!878384) b!1323889))

(assert (= (and b!1323889 res!878380) b!1323899))

(assert (= (and b!1323899 res!878381) b!1323897))

(assert (= (and b!1323897 res!878386) b!1323892))

(assert (= (and b!1323896 condMapEmpty!55838) mapIsEmpty!55838))

(assert (= (and b!1323896 (not condMapEmpty!55838)) mapNonEmpty!55838))

(get-info :version)

(assert (= (and mapNonEmpty!55838 ((_ is ValueCellFull!17165) mapValue!55838)) b!1323898))

(assert (= (and b!1323896 ((_ is ValueCellFull!17165) mapDefault!55838)) b!1323894))

(assert (= start!111874 b!1323896))

(declare-fun b_lambda!23627 () Bool)

(assert (=> (not b_lambda!23627) (not b!1323892)))

(declare-fun t!44411 () Bool)

(declare-fun tb!11651 () Bool)

(assert (=> (and start!111874 (= defaultEntry!1340 defaultEntry!1340) t!44411) tb!11651))

(declare-fun result!24365 () Bool)

(assert (=> tb!11651 (= result!24365 tp_is_empty!36127)))

(assert (=> b!1323892 t!44411))

(declare-fun b_and!48777 () Bool)

(assert (= b_and!48775 (and (=> t!44411 result!24365) b_and!48777)))

(declare-fun m!1212539 () Bool)

(assert (=> mapNonEmpty!55838 m!1212539))

(declare-fun m!1212541 () Bool)

(assert (=> b!1323889 m!1212541))

(assert (=> b!1323889 m!1212541))

(declare-fun m!1212543 () Bool)

(assert (=> b!1323889 m!1212543))

(declare-fun m!1212545 () Bool)

(assert (=> b!1323899 m!1212545))

(declare-fun m!1212547 () Bool)

(assert (=> b!1323893 m!1212547))

(declare-fun m!1212549 () Bool)

(assert (=> b!1323895 m!1212549))

(declare-fun m!1212551 () Bool)

(assert (=> start!111874 m!1212551))

(declare-fun m!1212553 () Bool)

(assert (=> start!111874 m!1212553))

(declare-fun m!1212555 () Bool)

(assert (=> start!111874 m!1212555))

(assert (=> b!1323897 m!1212545))

(assert (=> b!1323897 m!1212545))

(declare-fun m!1212557 () Bool)

(assert (=> b!1323897 m!1212557))

(declare-fun m!1212559 () Bool)

(assert (=> b!1323892 m!1212559))

(declare-fun m!1212561 () Bool)

(assert (=> b!1323892 m!1212561))

(declare-fun m!1212563 () Bool)

(assert (=> b!1323892 m!1212563))

(declare-fun m!1212565 () Bool)

(assert (=> b!1323892 m!1212565))

(assert (=> b!1323892 m!1212559))

(declare-fun m!1212567 () Bool)

(assert (=> b!1323892 m!1212567))

(declare-fun m!1212569 () Bool)

(assert (=> b!1323892 m!1212569))

(declare-fun m!1212571 () Bool)

(assert (=> b!1323892 m!1212571))

(assert (=> b!1323892 m!1212569))

(declare-fun m!1212573 () Bool)

(assert (=> b!1323892 m!1212573))

(declare-fun m!1212575 () Bool)

(assert (=> b!1323892 m!1212575))

(assert (=> b!1323892 m!1212545))

(declare-fun m!1212577 () Bool)

(assert (=> b!1323892 m!1212577))

(assert (=> b!1323892 m!1212545))

(declare-fun m!1212579 () Bool)

(assert (=> b!1323892 m!1212579))

(declare-fun m!1212581 () Bool)

(assert (=> b!1323892 m!1212581))

(assert (=> b!1323892 m!1212573))

(declare-fun m!1212583 () Bool)

(assert (=> b!1323892 m!1212583))

(declare-fun m!1212585 () Bool)

(assert (=> b!1323892 m!1212585))

(declare-fun m!1212587 () Bool)

(assert (=> b!1323892 m!1212587))

(check-sat (not b_lambda!23627) (not start!111874) (not mapNonEmpty!55838) (not b_next!30307) (not b!1323895) tp_is_empty!36127 (not b!1323889) b_and!48777 (not b!1323897) (not b!1323893) (not b!1323892))
(check-sat b_and!48777 (not b_next!30307))
