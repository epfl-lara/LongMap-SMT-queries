; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111928 () Bool)

(assert start!111928)

(declare-fun b_free!30361 () Bool)

(declare-fun b_next!30361 () Bool)

(assert (=> start!111928 (= b_free!30361 (not b_next!30361))))

(declare-fun tp!106559 () Bool)

(declare-fun b_and!48883 () Bool)

(assert (=> start!111928 (= tp!106559 b_and!48883)))

(declare-fun b!1324834 () Bool)

(declare-fun res!879033 () Bool)

(declare-fun e!755389 () Bool)

(assert (=> b!1324834 (=> (not res!879033) (not e!755389))))

(declare-datatypes ((array!89367 0))(
  ( (array!89368 (arr!43153 (Array (_ BitVec 32) (_ BitVec 64))) (size!43704 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89367)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324834 (= res!879033 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43704 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324835 () Bool)

(declare-fun res!879027 () Bool)

(assert (=> b!1324835 (=> (not res!879027) (not e!755389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324835 (= res!879027 (validKeyInArray!0 (select (arr!43153 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55919 () Bool)

(declare-fun mapRes!55919 () Bool)

(declare-fun tp!106558 () Bool)

(declare-fun e!755392 () Bool)

(assert (=> mapNonEmpty!55919 (= mapRes!55919 (and tp!106558 e!755392))))

(declare-datatypes ((V!53345 0))(
  ( (V!53346 (val!18165 Int)) )
))
(declare-datatypes ((ValueCell!17192 0))(
  ( (ValueCellFull!17192 (v!20790 V!53345)) (EmptyCell!17192) )
))
(declare-fun mapValue!55919 () ValueCell!17192)

(declare-datatypes ((array!89369 0))(
  ( (array!89370 (arr!43154 (Array (_ BitVec 32) ValueCell!17192)) (size!43705 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89369)

(declare-fun mapRest!55919 () (Array (_ BitVec 32) ValueCell!17192))

(declare-fun mapKey!55919 () (_ BitVec 32))

(assert (=> mapNonEmpty!55919 (= (arr!43154 _values!1337) (store mapRest!55919 mapKey!55919 mapValue!55919))))

(declare-fun b!1324836 () Bool)

(declare-fun res!879028 () Bool)

(assert (=> b!1324836 (=> (not res!879028) (not e!755389))))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1324836 (= res!879028 (and (= (size!43705 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43704 _keys!1609) (size!43705 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324837 () Bool)

(declare-fun res!879032 () Bool)

(assert (=> b!1324837 (=> (not res!879032) (not e!755389))))

(declare-datatypes ((List!30610 0))(
  ( (Nil!30607) (Cons!30606 (h!31824 (_ BitVec 64)) (t!44512 List!30610)) )
))
(declare-fun arrayNoDuplicates!0 (array!89367 (_ BitVec 32) List!30610) Bool)

(assert (=> b!1324837 (= res!879032 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30607))))

(declare-fun b!1324838 () Bool)

(declare-fun res!879031 () Bool)

(assert (=> b!1324838 (=> (not res!879031) (not e!755389))))

(assert (=> b!1324838 (= res!879031 (not (= (select (arr!43153 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324839 () Bool)

(declare-fun res!879030 () Bool)

(assert (=> b!1324839 (=> (not res!879030) (not e!755389))))

(declare-fun zeroValue!1279 () V!53345)

(declare-fun minValue!1279 () V!53345)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23460 0))(
  ( (tuple2!23461 (_1!11741 (_ BitVec 64)) (_2!11741 V!53345)) )
))
(declare-datatypes ((List!30611 0))(
  ( (Nil!30608) (Cons!30607 (h!31825 tuple2!23460) (t!44513 List!30611)) )
))
(declare-datatypes ((ListLongMap!21125 0))(
  ( (ListLongMap!21126 (toList!10578 List!30611)) )
))
(declare-fun contains!8745 (ListLongMap!21125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5563 (array!89367 array!89369 (_ BitVec 32) (_ BitVec 32) V!53345 V!53345 (_ BitVec 32) Int) ListLongMap!21125)

(assert (=> b!1324839 (= res!879030 (contains!8745 (getCurrentListMap!5563 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55919 () Bool)

(assert (=> mapIsEmpty!55919 mapRes!55919))

(declare-fun b!1324840 () Bool)

(assert (=> b!1324840 (= e!755389 (not true))))

(declare-fun lt!589600 () ListLongMap!21125)

(declare-fun +!4649 (ListLongMap!21125 tuple2!23460) ListLongMap!21125)

(assert (=> b!1324840 (contains!8745 (+!4649 lt!589600 (tuple2!23461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43585 0))(
  ( (Unit!43586) )
))
(declare-fun lt!589602 () Unit!43585)

(declare-fun addStillContains!1161 (ListLongMap!21125 (_ BitVec 64) V!53345 (_ BitVec 64)) Unit!43585)

(assert (=> b!1324840 (= lt!589602 (addStillContains!1161 lt!589600 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1324840 (contains!8745 lt!589600 k0!1164)))

(declare-fun lt!589607 () ListLongMap!21125)

(declare-fun lt!589601 () tuple2!23460)

(assert (=> b!1324840 (= lt!589600 (+!4649 lt!589607 lt!589601))))

(declare-fun lt!589608 () Unit!43585)

(assert (=> b!1324840 (= lt!589608 (addStillContains!1161 lt!589607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324840 (contains!8745 lt!589607 k0!1164)))

(declare-fun lt!589604 () Unit!43585)

(declare-fun lt!589603 () V!53345)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!204 ((_ BitVec 64) (_ BitVec 64) V!53345 ListLongMap!21125) Unit!43585)

(assert (=> b!1324840 (= lt!589604 (lemmaInListMapAfterAddingDiffThenInBefore!204 k0!1164 (select (arr!43153 _keys!1609) from!2000) lt!589603 lt!589607))))

(declare-fun lt!589609 () ListLongMap!21125)

(assert (=> b!1324840 (contains!8745 lt!589609 k0!1164)))

(declare-fun lt!589605 () Unit!43585)

(assert (=> b!1324840 (= lt!589605 (lemmaInListMapAfterAddingDiffThenInBefore!204 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589609))))

(declare-fun lt!589606 () ListLongMap!21125)

(assert (=> b!1324840 (contains!8745 lt!589606 k0!1164)))

(declare-fun lt!589610 () Unit!43585)

(assert (=> b!1324840 (= lt!589610 (lemmaInListMapAfterAddingDiffThenInBefore!204 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589606))))

(assert (=> b!1324840 (= lt!589606 (+!4649 lt!589609 lt!589601))))

(assert (=> b!1324840 (= lt!589601 (tuple2!23461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324840 (= lt!589609 (+!4649 lt!589607 (tuple2!23461 (select (arr!43153 _keys!1609) from!2000) lt!589603)))))

(declare-fun get!21764 (ValueCell!17192 V!53345) V!53345)

(declare-fun dynLambda!3603 (Int (_ BitVec 64)) V!53345)

(assert (=> b!1324840 (= lt!589603 (get!21764 (select (arr!43154 _values!1337) from!2000) (dynLambda!3603 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6288 (array!89367 array!89369 (_ BitVec 32) (_ BitVec 32) V!53345 V!53345 (_ BitVec 32) Int) ListLongMap!21125)

(assert (=> b!1324840 (= lt!589607 (getCurrentListMapNoExtraKeys!6288 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!879034 () Bool)

(assert (=> start!111928 (=> (not res!879034) (not e!755389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111928 (= res!879034 (validMask!0 mask!2019))))

(assert (=> start!111928 e!755389))

(declare-fun array_inv!32851 (array!89367) Bool)

(assert (=> start!111928 (array_inv!32851 _keys!1609)))

(assert (=> start!111928 true))

(declare-fun tp_is_empty!36181 () Bool)

(assert (=> start!111928 tp_is_empty!36181))

(declare-fun e!755388 () Bool)

(declare-fun array_inv!32852 (array!89369) Bool)

(assert (=> start!111928 (and (array_inv!32852 _values!1337) e!755388)))

(assert (=> start!111928 tp!106559))

(declare-fun b!1324841 () Bool)

(declare-fun e!755391 () Bool)

(assert (=> b!1324841 (= e!755391 tp_is_empty!36181)))

(declare-fun b!1324842 () Bool)

(assert (=> b!1324842 (= e!755392 tp_is_empty!36181)))

(declare-fun b!1324843 () Bool)

(assert (=> b!1324843 (= e!755388 (and e!755391 mapRes!55919))))

(declare-fun condMapEmpty!55919 () Bool)

(declare-fun mapDefault!55919 () ValueCell!17192)

(assert (=> b!1324843 (= condMapEmpty!55919 (= (arr!43154 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17192)) mapDefault!55919)))))

(declare-fun b!1324844 () Bool)

(declare-fun res!879029 () Bool)

(assert (=> b!1324844 (=> (not res!879029) (not e!755389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89367 (_ BitVec 32)) Bool)

(assert (=> b!1324844 (= res!879029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111928 res!879034) b!1324836))

(assert (= (and b!1324836 res!879028) b!1324844))

(assert (= (and b!1324844 res!879029) b!1324837))

(assert (= (and b!1324837 res!879032) b!1324834))

(assert (= (and b!1324834 res!879033) b!1324839))

(assert (= (and b!1324839 res!879030) b!1324838))

(assert (= (and b!1324838 res!879031) b!1324835))

(assert (= (and b!1324835 res!879027) b!1324840))

(assert (= (and b!1324843 condMapEmpty!55919) mapIsEmpty!55919))

(assert (= (and b!1324843 (not condMapEmpty!55919)) mapNonEmpty!55919))

(get-info :version)

(assert (= (and mapNonEmpty!55919 ((_ is ValueCellFull!17192) mapValue!55919)) b!1324842))

(assert (= (and b!1324843 ((_ is ValueCellFull!17192) mapDefault!55919)) b!1324841))

(assert (= start!111928 b!1324843))

(declare-fun b_lambda!23681 () Bool)

(assert (=> (not b_lambda!23681) (not b!1324840)))

(declare-fun t!44511 () Bool)

(declare-fun tb!11705 () Bool)

(assert (=> (and start!111928 (= defaultEntry!1340 defaultEntry!1340) t!44511) tb!11705))

(declare-fun result!24473 () Bool)

(assert (=> tb!11705 (= result!24473 tp_is_empty!36181)))

(assert (=> b!1324840 t!44511))

(declare-fun b_and!48885 () Bool)

(assert (= b_and!48883 (and (=> t!44511 result!24473) b_and!48885)))

(declare-fun m!1213997 () Bool)

(assert (=> b!1324837 m!1213997))

(declare-fun m!1213999 () Bool)

(assert (=> b!1324840 m!1213999))

(declare-fun m!1214001 () Bool)

(assert (=> b!1324840 m!1214001))

(declare-fun m!1214003 () Bool)

(assert (=> b!1324840 m!1214003))

(declare-fun m!1214005 () Bool)

(assert (=> b!1324840 m!1214005))

(declare-fun m!1214007 () Bool)

(assert (=> b!1324840 m!1214007))

(declare-fun m!1214009 () Bool)

(assert (=> b!1324840 m!1214009))

(declare-fun m!1214011 () Bool)

(assert (=> b!1324840 m!1214011))

(declare-fun m!1214013 () Bool)

(assert (=> b!1324840 m!1214013))

(declare-fun m!1214015 () Bool)

(assert (=> b!1324840 m!1214015))

(assert (=> b!1324840 m!1214013))

(declare-fun m!1214017 () Bool)

(assert (=> b!1324840 m!1214017))

(assert (=> b!1324840 m!1214015))

(declare-fun m!1214019 () Bool)

(assert (=> b!1324840 m!1214019))

(declare-fun m!1214021 () Bool)

(assert (=> b!1324840 m!1214021))

(declare-fun m!1214023 () Bool)

(assert (=> b!1324840 m!1214023))

(declare-fun m!1214025 () Bool)

(assert (=> b!1324840 m!1214025))

(declare-fun m!1214027 () Bool)

(assert (=> b!1324840 m!1214027))

(assert (=> b!1324840 m!1214019))

(declare-fun m!1214029 () Bool)

(assert (=> b!1324840 m!1214029))

(declare-fun m!1214031 () Bool)

(assert (=> b!1324840 m!1214031))

(assert (=> b!1324840 m!1214025))

(declare-fun m!1214033 () Bool)

(assert (=> b!1324840 m!1214033))

(declare-fun m!1214035 () Bool)

(assert (=> b!1324840 m!1214035))

(assert (=> b!1324835 m!1214025))

(assert (=> b!1324835 m!1214025))

(declare-fun m!1214037 () Bool)

(assert (=> b!1324835 m!1214037))

(declare-fun m!1214039 () Bool)

(assert (=> start!111928 m!1214039))

(declare-fun m!1214041 () Bool)

(assert (=> start!111928 m!1214041))

(declare-fun m!1214043 () Bool)

(assert (=> start!111928 m!1214043))

(assert (=> b!1324838 m!1214025))

(declare-fun m!1214045 () Bool)

(assert (=> mapNonEmpty!55919 m!1214045))

(declare-fun m!1214047 () Bool)

(assert (=> b!1324844 m!1214047))

(declare-fun m!1214049 () Bool)

(assert (=> b!1324839 m!1214049))

(assert (=> b!1324839 m!1214049))

(declare-fun m!1214051 () Bool)

(assert (=> b!1324839 m!1214051))

(check-sat (not b!1324835) (not b!1324844) (not b!1324837) (not b!1324840) (not b_next!30361) (not b!1324839) (not start!111928) tp_is_empty!36181 (not b_lambda!23681) b_and!48885 (not mapNonEmpty!55919))
(check-sat b_and!48885 (not b_next!30361))
