; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111622 () Bool)

(assert start!111622)

(declare-fun b_free!30279 () Bool)

(declare-fun b_next!30279 () Bool)

(assert (=> start!111622 (= b_free!30279 (not b_next!30279))))

(declare-fun tp!106312 () Bool)

(declare-fun b_and!48717 () Bool)

(assert (=> start!111622 (= tp!106312 b_and!48717)))

(declare-fun b!1322100 () Bool)

(declare-fun res!877525 () Bool)

(declare-fun e!753932 () Bool)

(assert (=> b!1322100 (=> (not res!877525) (not e!753932))))

(declare-datatypes ((array!89120 0))(
  ( (array!89121 (arr!43034 (Array (_ BitVec 32) (_ BitVec 64))) (size!43584 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89120)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53235 0))(
  ( (V!53236 (val!18124 Int)) )
))
(declare-datatypes ((ValueCell!17151 0))(
  ( (ValueCellFull!17151 (v!20754 V!53235)) (EmptyCell!17151) )
))
(declare-datatypes ((array!89122 0))(
  ( (array!89123 (arr!43035 (Array (_ BitVec 32) ValueCell!17151)) (size!43585 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89122)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1322100 (= res!877525 (and (= (size!43585 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43584 _keys!1609) (size!43585 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322101 () Bool)

(declare-fun res!877532 () Bool)

(assert (=> b!1322101 (=> (not res!877532) (not e!753932))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322101 (= res!877532 (validKeyInArray!0 (select (arr!43034 _keys!1609) from!2000)))))

(declare-fun b!1322102 () Bool)

(declare-fun res!877529 () Bool)

(assert (=> b!1322102 (=> (not res!877529) (not e!753932))))

(declare-datatypes ((List!30493 0))(
  ( (Nil!30490) (Cons!30489 (h!31698 (_ BitVec 64)) (t!44321 List!30493)) )
))
(declare-fun arrayNoDuplicates!0 (array!89120 (_ BitVec 32) List!30493) Bool)

(assert (=> b!1322102 (= res!877529 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30490))))

(declare-fun mapNonEmpty!55796 () Bool)

(declare-fun mapRes!55796 () Bool)

(declare-fun tp!106313 () Bool)

(declare-fun e!753931 () Bool)

(assert (=> mapNonEmpty!55796 (= mapRes!55796 (and tp!106313 e!753931))))

(declare-fun mapRest!55796 () (Array (_ BitVec 32) ValueCell!17151))

(declare-fun mapValue!55796 () ValueCell!17151)

(declare-fun mapKey!55796 () (_ BitVec 32))

(assert (=> mapNonEmpty!55796 (= (arr!43035 _values!1337) (store mapRest!55796 mapKey!55796 mapValue!55796))))

(declare-fun b!1322103 () Bool)

(declare-fun res!877526 () Bool)

(assert (=> b!1322103 (=> (not res!877526) (not e!753932))))

(declare-fun zeroValue!1279 () V!53235)

(declare-fun minValue!1279 () V!53235)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23346 0))(
  ( (tuple2!23347 (_1!11684 (_ BitVec 64)) (_2!11684 V!53235)) )
))
(declare-datatypes ((List!30494 0))(
  ( (Nil!30491) (Cons!30490 (h!31699 tuple2!23346) (t!44322 List!30494)) )
))
(declare-datatypes ((ListLongMap!21003 0))(
  ( (ListLongMap!21004 (toList!10517 List!30494)) )
))
(declare-fun contains!8672 (ListLongMap!21003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5518 (array!89120 array!89122 (_ BitVec 32) (_ BitVec 32) V!53235 V!53235 (_ BitVec 32) Int) ListLongMap!21003)

(assert (=> b!1322103 (= res!877526 (contains!8672 (getCurrentListMap!5518 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322104 () Bool)

(declare-fun tp_is_empty!36099 () Bool)

(assert (=> b!1322104 (= e!753931 tp_is_empty!36099)))

(declare-fun b!1322105 () Bool)

(declare-fun res!877527 () Bool)

(assert (=> b!1322105 (=> (not res!877527) (not e!753932))))

(assert (=> b!1322105 (= res!877527 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43584 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322106 () Bool)

(declare-fun e!753933 () Bool)

(assert (=> b!1322106 (= e!753933 tp_is_empty!36099)))

(declare-fun b!1322107 () Bool)

(declare-fun res!877528 () Bool)

(assert (=> b!1322107 (=> (not res!877528) (not e!753932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89120 (_ BitVec 32)) Bool)

(assert (=> b!1322107 (= res!877528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!877531 () Bool)

(assert (=> start!111622 (=> (not res!877531) (not e!753932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111622 (= res!877531 (validMask!0 mask!2019))))

(assert (=> start!111622 e!753932))

(declare-fun array_inv!32489 (array!89120) Bool)

(assert (=> start!111622 (array_inv!32489 _keys!1609)))

(assert (=> start!111622 true))

(assert (=> start!111622 tp_is_empty!36099))

(declare-fun e!753930 () Bool)

(declare-fun array_inv!32490 (array!89122) Bool)

(assert (=> start!111622 (and (array_inv!32490 _values!1337) e!753930)))

(assert (=> start!111622 tp!106312))

(declare-fun b!1322108 () Bool)

(assert (=> b!1322108 (= e!753932 (not true))))

(declare-fun lt!587905 () ListLongMap!21003)

(declare-fun lt!587910 () tuple2!23346)

(declare-fun +!4572 (ListLongMap!21003 tuple2!23346) ListLongMap!21003)

(assert (=> b!1322108 (contains!8672 (+!4572 lt!587905 lt!587910) k0!1164)))

(declare-datatypes ((Unit!43564 0))(
  ( (Unit!43565) )
))
(declare-fun lt!587907 () Unit!43564)

(declare-fun addStillContains!1121 (ListLongMap!21003 (_ BitVec 64) V!53235 (_ BitVec 64)) Unit!43564)

(assert (=> b!1322108 (= lt!587907 (addStillContains!1121 lt!587905 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322108 (contains!8672 lt!587905 k0!1164)))

(declare-fun lt!587908 () Unit!43564)

(declare-fun lt!587911 () V!53235)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!168 ((_ BitVec 64) (_ BitVec 64) V!53235 ListLongMap!21003) Unit!43564)

(assert (=> b!1322108 (= lt!587908 (lemmaInListMapAfterAddingDiffThenInBefore!168 k0!1164 (select (arr!43034 _keys!1609) from!2000) lt!587911 lt!587905))))

(declare-fun lt!587912 () ListLongMap!21003)

(assert (=> b!1322108 (contains!8672 lt!587912 k0!1164)))

(declare-fun lt!587913 () Unit!43564)

(assert (=> b!1322108 (= lt!587913 (lemmaInListMapAfterAddingDiffThenInBefore!168 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587912))))

(declare-fun lt!587906 () ListLongMap!21003)

(assert (=> b!1322108 (contains!8672 lt!587906 k0!1164)))

(declare-fun lt!587909 () Unit!43564)

(assert (=> b!1322108 (= lt!587909 (lemmaInListMapAfterAddingDiffThenInBefore!168 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587906))))

(assert (=> b!1322108 (= lt!587906 (+!4572 lt!587912 lt!587910))))

(assert (=> b!1322108 (= lt!587910 (tuple2!23347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322108 (= lt!587912 (+!4572 lt!587905 (tuple2!23347 (select (arr!43034 _keys!1609) from!2000) lt!587911)))))

(declare-fun get!21656 (ValueCell!17151 V!53235) V!53235)

(declare-fun dynLambda!3511 (Int (_ BitVec 64)) V!53235)

(assert (=> b!1322108 (= lt!587911 (get!21656 (select (arr!43035 _values!1337) from!2000) (dynLambda!3511 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6207 (array!89120 array!89122 (_ BitVec 32) (_ BitVec 32) V!53235 V!53235 (_ BitVec 32) Int) ListLongMap!21003)

(assert (=> b!1322108 (= lt!587905 (getCurrentListMapNoExtraKeys!6207 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapIsEmpty!55796 () Bool)

(assert (=> mapIsEmpty!55796 mapRes!55796))

(declare-fun b!1322109 () Bool)

(declare-fun res!877530 () Bool)

(assert (=> b!1322109 (=> (not res!877530) (not e!753932))))

(assert (=> b!1322109 (= res!877530 (not (= (select (arr!43034 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322110 () Bool)

(assert (=> b!1322110 (= e!753930 (and e!753933 mapRes!55796))))

(declare-fun condMapEmpty!55796 () Bool)

(declare-fun mapDefault!55796 () ValueCell!17151)

(assert (=> b!1322110 (= condMapEmpty!55796 (= (arr!43035 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17151)) mapDefault!55796)))))

(assert (= (and start!111622 res!877531) b!1322100))

(assert (= (and b!1322100 res!877525) b!1322107))

(assert (= (and b!1322107 res!877528) b!1322102))

(assert (= (and b!1322102 res!877529) b!1322105))

(assert (= (and b!1322105 res!877527) b!1322103))

(assert (= (and b!1322103 res!877526) b!1322109))

(assert (= (and b!1322109 res!877530) b!1322101))

(assert (= (and b!1322101 res!877532) b!1322108))

(assert (= (and b!1322110 condMapEmpty!55796) mapIsEmpty!55796))

(assert (= (and b!1322110 (not condMapEmpty!55796)) mapNonEmpty!55796))

(get-info :version)

(assert (= (and mapNonEmpty!55796 ((_ is ValueCellFull!17151) mapValue!55796)) b!1322104))

(assert (= (and b!1322110 ((_ is ValueCellFull!17151) mapDefault!55796)) b!1322106))

(assert (= start!111622 b!1322110))

(declare-fun b_lambda!23605 () Bool)

(assert (=> (not b_lambda!23605) (not b!1322108)))

(declare-fun t!44320 () Bool)

(declare-fun tb!11631 () Bool)

(assert (=> (and start!111622 (= defaultEntry!1340 defaultEntry!1340) t!44320) tb!11631))

(declare-fun result!24317 () Bool)

(assert (=> tb!11631 (= result!24317 tp_is_empty!36099)))

(assert (=> b!1322108 t!44320))

(declare-fun b_and!48719 () Bool)

(assert (= b_and!48717 (and (=> t!44320 result!24317) b_and!48719)))

(declare-fun m!1210241 () Bool)

(assert (=> b!1322109 m!1210241))

(declare-fun m!1210243 () Bool)

(assert (=> mapNonEmpty!55796 m!1210243))

(declare-fun m!1210245 () Bool)

(assert (=> b!1322108 m!1210245))

(declare-fun m!1210247 () Bool)

(assert (=> b!1322108 m!1210247))

(declare-fun m!1210249 () Bool)

(assert (=> b!1322108 m!1210249))

(declare-fun m!1210251 () Bool)

(assert (=> b!1322108 m!1210251))

(assert (=> b!1322108 m!1210241))

(declare-fun m!1210253 () Bool)

(assert (=> b!1322108 m!1210253))

(declare-fun m!1210255 () Bool)

(assert (=> b!1322108 m!1210255))

(assert (=> b!1322108 m!1210245))

(declare-fun m!1210257 () Bool)

(assert (=> b!1322108 m!1210257))

(assert (=> b!1322108 m!1210249))

(assert (=> b!1322108 m!1210247))

(declare-fun m!1210259 () Bool)

(assert (=> b!1322108 m!1210259))

(declare-fun m!1210261 () Bool)

(assert (=> b!1322108 m!1210261))

(declare-fun m!1210263 () Bool)

(assert (=> b!1322108 m!1210263))

(declare-fun m!1210265 () Bool)

(assert (=> b!1322108 m!1210265))

(declare-fun m!1210267 () Bool)

(assert (=> b!1322108 m!1210267))

(declare-fun m!1210269 () Bool)

(assert (=> b!1322108 m!1210269))

(declare-fun m!1210271 () Bool)

(assert (=> b!1322108 m!1210271))

(declare-fun m!1210273 () Bool)

(assert (=> b!1322108 m!1210273))

(assert (=> b!1322108 m!1210241))

(declare-fun m!1210275 () Bool)

(assert (=> b!1322107 m!1210275))

(declare-fun m!1210277 () Bool)

(assert (=> b!1322103 m!1210277))

(assert (=> b!1322103 m!1210277))

(declare-fun m!1210279 () Bool)

(assert (=> b!1322103 m!1210279))

(declare-fun m!1210281 () Bool)

(assert (=> b!1322102 m!1210281))

(declare-fun m!1210283 () Bool)

(assert (=> start!111622 m!1210283))

(declare-fun m!1210285 () Bool)

(assert (=> start!111622 m!1210285))

(declare-fun m!1210287 () Bool)

(assert (=> start!111622 m!1210287))

(assert (=> b!1322101 m!1210241))

(assert (=> b!1322101 m!1210241))

(declare-fun m!1210289 () Bool)

(assert (=> b!1322101 m!1210289))

(check-sat (not b_next!30279) (not b_lambda!23605) b_and!48719 (not start!111622) (not b!1322107) (not b!1322101) tp_is_empty!36099 (not b!1322102) (not mapNonEmpty!55796) (not b!1322103) (not b!1322108))
(check-sat b_and!48719 (not b_next!30279))
