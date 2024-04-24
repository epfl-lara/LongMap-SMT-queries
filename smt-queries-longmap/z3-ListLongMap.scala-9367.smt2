; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111862 () Bool)

(assert start!111862)

(declare-fun b_free!30295 () Bool)

(declare-fun b_next!30295 () Bool)

(assert (=> start!111862 (= b_free!30295 (not b_next!30295))))

(declare-fun tp!106361 () Bool)

(declare-fun b_and!48751 () Bool)

(assert (=> start!111862 (= tp!106361 b_and!48751)))

(declare-fun mapNonEmpty!55820 () Bool)

(declare-fun mapRes!55820 () Bool)

(declare-fun tp!106360 () Bool)

(declare-fun e!754896 () Bool)

(assert (=> mapNonEmpty!55820 (= mapRes!55820 (and tp!106360 e!754896))))

(declare-datatypes ((V!53257 0))(
  ( (V!53258 (val!18132 Int)) )
))
(declare-datatypes ((ValueCell!17159 0))(
  ( (ValueCellFull!17159 (v!20757 V!53257)) (EmptyCell!17159) )
))
(declare-fun mapValue!55820 () ValueCell!17159)

(declare-datatypes ((array!89235 0))(
  ( (array!89236 (arr!43087 (Array (_ BitVec 32) ValueCell!17159)) (size!43638 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89235)

(declare-fun mapRest!55820 () (Array (_ BitVec 32) ValueCell!17159))

(declare-fun mapKey!55820 () (_ BitVec 32))

(assert (=> mapNonEmpty!55820 (= (arr!43087 _values!1337) (store mapRest!55820 mapKey!55820 mapValue!55820))))

(declare-fun b!1323679 () Bool)

(declare-fun res!878239 () Bool)

(declare-fun e!754893 () Bool)

(assert (=> b!1323679 (=> (not res!878239) (not e!754893))))

(declare-datatypes ((array!89237 0))(
  ( (array!89238 (arr!43088 (Array (_ BitVec 32) (_ BitVec 64))) (size!43639 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89237)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1323679 (= res!878239 (and (= (size!43638 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43639 _keys!1609) (size!43638 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323680 () Bool)

(assert (=> b!1323680 (= e!754893 (not true))))

(declare-datatypes ((tuple2!23406 0))(
  ( (tuple2!23407 (_1!11714 (_ BitVec 64)) (_2!11714 V!53257)) )
))
(declare-datatypes ((List!30555 0))(
  ( (Nil!30552) (Cons!30551 (h!31769 tuple2!23406) (t!44391 List!30555)) )
))
(declare-datatypes ((ListLongMap!21071 0))(
  ( (ListLongMap!21072 (toList!10551 List!30555)) )
))
(declare-fun lt!588599 () ListLongMap!21071)

(declare-fun lt!588602 () tuple2!23406)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8718 (ListLongMap!21071 (_ BitVec 64)) Bool)

(declare-fun +!4626 (ListLongMap!21071 tuple2!23406) ListLongMap!21071)

(assert (=> b!1323680 (contains!8718 (+!4626 lt!588599 lt!588602) k0!1164)))

(declare-fun zeroValue!1279 () V!53257)

(declare-datatypes ((Unit!43539 0))(
  ( (Unit!43540) )
))
(declare-fun lt!588601 () Unit!43539)

(declare-fun addStillContains!1138 (ListLongMap!21071 (_ BitVec 64) V!53257 (_ BitVec 64)) Unit!43539)

(assert (=> b!1323680 (= lt!588601 (addStillContains!1138 lt!588599 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323680 (contains!8718 lt!588599 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588597 () Unit!43539)

(declare-fun lt!588600 () V!53257)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!181 ((_ BitVec 64) (_ BitVec 64) V!53257 ListLongMap!21071) Unit!43539)

(assert (=> b!1323680 (= lt!588597 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 (select (arr!43088 _keys!1609) from!2000) lt!588600 lt!588599))))

(declare-fun lt!588604 () ListLongMap!21071)

(assert (=> b!1323680 (contains!8718 lt!588604 k0!1164)))

(declare-fun lt!588598 () Unit!43539)

(assert (=> b!1323680 (= lt!588598 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588604))))

(declare-fun lt!588603 () ListLongMap!21071)

(assert (=> b!1323680 (contains!8718 lt!588603 k0!1164)))

(declare-fun lt!588605 () Unit!43539)

(declare-fun minValue!1279 () V!53257)

(assert (=> b!1323680 (= lt!588605 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588603))))

(assert (=> b!1323680 (= lt!588603 (+!4626 lt!588604 lt!588602))))

(assert (=> b!1323680 (= lt!588602 (tuple2!23407 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323680 (= lt!588604 (+!4626 lt!588599 (tuple2!23407 (select (arr!43088 _keys!1609) from!2000) lt!588600)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21719 (ValueCell!17159 V!53257) V!53257)

(declare-fun dynLambda!3580 (Int (_ BitVec 64)) V!53257)

(assert (=> b!1323680 (= lt!588600 (get!21719 (select (arr!43087 _values!1337) from!2000) (dynLambda!3580 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6265 (array!89237 array!89235 (_ BitVec 32) (_ BitVec 32) V!53257 V!53257 (_ BitVec 32) Int) ListLongMap!21071)

(assert (=> b!1323680 (= lt!588599 (getCurrentListMapNoExtraKeys!6265 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323681 () Bool)

(declare-fun res!878242 () Bool)

(assert (=> b!1323681 (=> (not res!878242) (not e!754893))))

(declare-datatypes ((List!30556 0))(
  ( (Nil!30553) (Cons!30552 (h!31770 (_ BitVec 64)) (t!44392 List!30556)) )
))
(declare-fun arrayNoDuplicates!0 (array!89237 (_ BitVec 32) List!30556) Bool)

(assert (=> b!1323681 (= res!878242 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30553))))

(declare-fun b!1323682 () Bool)

(declare-fun res!878236 () Bool)

(assert (=> b!1323682 (=> (not res!878236) (not e!754893))))

(assert (=> b!1323682 (= res!878236 (not (= (select (arr!43088 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323683 () Bool)

(declare-fun e!754894 () Bool)

(declare-fun tp_is_empty!36115 () Bool)

(assert (=> b!1323683 (= e!754894 tp_is_empty!36115)))

(declare-fun b!1323684 () Bool)

(declare-fun res!878241 () Bool)

(assert (=> b!1323684 (=> (not res!878241) (not e!754893))))

(assert (=> b!1323684 (= res!878241 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43639 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323685 () Bool)

(declare-fun res!878237 () Bool)

(assert (=> b!1323685 (=> (not res!878237) (not e!754893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89237 (_ BitVec 32)) Bool)

(assert (=> b!1323685 (= res!878237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323686 () Bool)

(assert (=> b!1323686 (= e!754896 tp_is_empty!36115)))

(declare-fun b!1323687 () Bool)

(declare-fun res!878240 () Bool)

(assert (=> b!1323687 (=> (not res!878240) (not e!754893))))

(declare-fun getCurrentListMap!5539 (array!89237 array!89235 (_ BitVec 32) (_ BitVec 32) V!53257 V!53257 (_ BitVec 32) Int) ListLongMap!21071)

(assert (=> b!1323687 (= res!878240 (contains!8718 (getCurrentListMap!5539 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323688 () Bool)

(declare-fun e!754897 () Bool)

(assert (=> b!1323688 (= e!754897 (and e!754894 mapRes!55820))))

(declare-fun condMapEmpty!55820 () Bool)

(declare-fun mapDefault!55820 () ValueCell!17159)

(assert (=> b!1323688 (= condMapEmpty!55820 (= (arr!43087 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17159)) mapDefault!55820)))))

(declare-fun res!878235 () Bool)

(assert (=> start!111862 (=> (not res!878235) (not e!754893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111862 (= res!878235 (validMask!0 mask!2019))))

(assert (=> start!111862 e!754893))

(declare-fun array_inv!32803 (array!89237) Bool)

(assert (=> start!111862 (array_inv!32803 _keys!1609)))

(assert (=> start!111862 true))

(assert (=> start!111862 tp_is_empty!36115))

(declare-fun array_inv!32804 (array!89235) Bool)

(assert (=> start!111862 (and (array_inv!32804 _values!1337) e!754897)))

(assert (=> start!111862 tp!106361))

(declare-fun b!1323689 () Bool)

(declare-fun res!878238 () Bool)

(assert (=> b!1323689 (=> (not res!878238) (not e!754893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323689 (= res!878238 (validKeyInArray!0 (select (arr!43088 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55820 () Bool)

(assert (=> mapIsEmpty!55820 mapRes!55820))

(assert (= (and start!111862 res!878235) b!1323679))

(assert (= (and b!1323679 res!878239) b!1323685))

(assert (= (and b!1323685 res!878237) b!1323681))

(assert (= (and b!1323681 res!878242) b!1323684))

(assert (= (and b!1323684 res!878241) b!1323687))

(assert (= (and b!1323687 res!878240) b!1323682))

(assert (= (and b!1323682 res!878236) b!1323689))

(assert (= (and b!1323689 res!878238) b!1323680))

(assert (= (and b!1323688 condMapEmpty!55820) mapIsEmpty!55820))

(assert (= (and b!1323688 (not condMapEmpty!55820)) mapNonEmpty!55820))

(get-info :version)

(assert (= (and mapNonEmpty!55820 ((_ is ValueCellFull!17159) mapValue!55820)) b!1323686))

(assert (= (and b!1323688 ((_ is ValueCellFull!17159) mapDefault!55820)) b!1323683))

(assert (= start!111862 b!1323688))

(declare-fun b_lambda!23615 () Bool)

(assert (=> (not b_lambda!23615) (not b!1323680)))

(declare-fun t!44390 () Bool)

(declare-fun tb!11639 () Bool)

(assert (=> (and start!111862 (= defaultEntry!1340 defaultEntry!1340) t!44390) tb!11639))

(declare-fun result!24341 () Bool)

(assert (=> tb!11639 (= result!24341 tp_is_empty!36115)))

(assert (=> b!1323680 t!44390))

(declare-fun b_and!48753 () Bool)

(assert (= b_and!48751 (and (=> t!44390 result!24341) b_and!48753)))

(declare-fun m!1212239 () Bool)

(assert (=> start!111862 m!1212239))

(declare-fun m!1212241 () Bool)

(assert (=> start!111862 m!1212241))

(declare-fun m!1212243 () Bool)

(assert (=> start!111862 m!1212243))

(declare-fun m!1212245 () Bool)

(assert (=> b!1323681 m!1212245))

(declare-fun m!1212247 () Bool)

(assert (=> b!1323687 m!1212247))

(assert (=> b!1323687 m!1212247))

(declare-fun m!1212249 () Bool)

(assert (=> b!1323687 m!1212249))

(declare-fun m!1212251 () Bool)

(assert (=> b!1323685 m!1212251))

(declare-fun m!1212253 () Bool)

(assert (=> b!1323680 m!1212253))

(declare-fun m!1212255 () Bool)

(assert (=> b!1323680 m!1212255))

(declare-fun m!1212257 () Bool)

(assert (=> b!1323680 m!1212257))

(declare-fun m!1212259 () Bool)

(assert (=> b!1323680 m!1212259))

(declare-fun m!1212261 () Bool)

(assert (=> b!1323680 m!1212261))

(declare-fun m!1212263 () Bool)

(assert (=> b!1323680 m!1212263))

(declare-fun m!1212265 () Bool)

(assert (=> b!1323680 m!1212265))

(assert (=> b!1323680 m!1212255))

(declare-fun m!1212267 () Bool)

(assert (=> b!1323680 m!1212267))

(declare-fun m!1212269 () Bool)

(assert (=> b!1323680 m!1212269))

(declare-fun m!1212271 () Bool)

(assert (=> b!1323680 m!1212271))

(assert (=> b!1323680 m!1212265))

(assert (=> b!1323680 m!1212257))

(declare-fun m!1212273 () Bool)

(assert (=> b!1323680 m!1212273))

(declare-fun m!1212275 () Bool)

(assert (=> b!1323680 m!1212275))

(declare-fun m!1212277 () Bool)

(assert (=> b!1323680 m!1212277))

(declare-fun m!1212279 () Bool)

(assert (=> b!1323680 m!1212279))

(declare-fun m!1212281 () Bool)

(assert (=> b!1323680 m!1212281))

(assert (=> b!1323680 m!1212261))

(declare-fun m!1212283 () Bool)

(assert (=> b!1323680 m!1212283))

(declare-fun m!1212285 () Bool)

(assert (=> mapNonEmpty!55820 m!1212285))

(assert (=> b!1323689 m!1212261))

(assert (=> b!1323689 m!1212261))

(declare-fun m!1212287 () Bool)

(assert (=> b!1323689 m!1212287))

(assert (=> b!1323682 m!1212261))

(check-sat (not b_next!30295) (not b!1323689) (not b!1323687) b_and!48753 (not b!1323681) (not start!111862) tp_is_empty!36115 (not mapNonEmpty!55820) (not b!1323685) (not b_lambda!23615) (not b!1323680))
(check-sat b_and!48753 (not b_next!30295))
