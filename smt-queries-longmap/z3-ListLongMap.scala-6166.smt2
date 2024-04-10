; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79106 () Bool)

(assert start!79106)

(declare-fun b_free!17319 () Bool)

(declare-fun b_next!17319 () Bool)

(assert (=> start!79106 (= b_free!17319 (not b_next!17319))))

(declare-fun tp!60398 () Bool)

(declare-fun b_and!28375 () Bool)

(assert (=> start!79106 (= tp!60398 b_and!28375)))

(declare-fun b!928305 () Bool)

(declare-fun res!625154 () Bool)

(declare-fun e!521212 () Bool)

(assert (=> b!928305 (=> (not res!625154) (not e!521212))))

(declare-datatypes ((array!55614 0))(
  ( (array!55615 (arr!26752 (Array (_ BitVec 32) (_ BitVec 64))) (size!27211 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55614)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55614 (_ BitVec 32)) Bool)

(assert (=> b!928305 (= res!625154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31497 () Bool)

(declare-fun mapRes!31497 () Bool)

(assert (=> mapIsEmpty!31497 mapRes!31497))

(declare-fun b!928306 () Bool)

(declare-fun e!521215 () Bool)

(declare-fun e!521207 () Bool)

(assert (=> b!928306 (= e!521215 e!521207)))

(declare-fun res!625153 () Bool)

(assert (=> b!928306 (=> (not res!625153) (not e!521207))))

(declare-datatypes ((V!31401 0))(
  ( (V!31402 (val!9964 Int)) )
))
(declare-datatypes ((tuple2!13016 0))(
  ( (tuple2!13017 (_1!6519 (_ BitVec 64)) (_2!6519 V!31401)) )
))
(declare-datatypes ((List!18814 0))(
  ( (Nil!18811) (Cons!18810 (h!19956 tuple2!13016) (t!26863 List!18814)) )
))
(declare-datatypes ((ListLongMap!11713 0))(
  ( (ListLongMap!11714 (toList!5872 List!18814)) )
))
(declare-fun lt!418686 () ListLongMap!11713)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4929 (ListLongMap!11713 (_ BitVec 64)) Bool)

(assert (=> b!928306 (= res!625153 (contains!4929 lt!418686 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9432 0))(
  ( (ValueCellFull!9432 (v!12482 V!31401)) (EmptyCell!9432) )
))
(declare-datatypes ((array!55616 0))(
  ( (array!55617 (arr!26753 (Array (_ BitVec 32) ValueCell!9432)) (size!27212 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55616)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31401)

(declare-fun minValue!1173 () V!31401)

(declare-fun getCurrentListMap!3120 (array!55614 array!55616 (_ BitVec 32) (_ BitVec 32) V!31401 V!31401 (_ BitVec 32) Int) ListLongMap!11713)

(assert (=> b!928306 (= lt!418686 (getCurrentListMap!3120 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!625158 () Bool)

(assert (=> start!79106 (=> (not res!625158) (not e!521212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79106 (= res!625158 (validMask!0 mask!1881))))

(assert (=> start!79106 e!521212))

(assert (=> start!79106 true))

(declare-fun tp_is_empty!19827 () Bool)

(assert (=> start!79106 tp_is_empty!19827))

(declare-fun e!521206 () Bool)

(declare-fun array_inv!20830 (array!55616) Bool)

(assert (=> start!79106 (and (array_inv!20830 _values!1231) e!521206)))

(assert (=> start!79106 tp!60398))

(declare-fun array_inv!20831 (array!55614) Bool)

(assert (=> start!79106 (array_inv!20831 _keys!1487)))

(declare-fun b!928307 () Bool)

(declare-fun e!521208 () Bool)

(assert (=> b!928307 (= e!521206 (and e!521208 mapRes!31497))))

(declare-fun condMapEmpty!31497 () Bool)

(declare-fun mapDefault!31497 () ValueCell!9432)

(assert (=> b!928307 (= condMapEmpty!31497 (= (arr!26753 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9432)) mapDefault!31497)))))

(declare-fun b!928308 () Bool)

(assert (=> b!928308 (= e!521207 (not (bvsle #b00000000000000000000000000000000 (size!27211 _keys!1487))))))

(declare-fun e!521203 () Bool)

(assert (=> b!928308 e!521203))

(declare-fun res!625157 () Bool)

(assert (=> b!928308 (=> (not res!625157) (not e!521203))))

(declare-fun lt!418693 () ListLongMap!11713)

(assert (=> b!928308 (= res!625157 (contains!4929 lt!418693 k0!1099))))

(assert (=> b!928308 (= lt!418693 (getCurrentListMap!3120 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-datatypes ((Unit!31415 0))(
  ( (Unit!31416) )
))
(declare-fun lt!418692 () Unit!31415)

(declare-fun v!791 () V!31401)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!99 (array!55614 array!55616 (_ BitVec 32) (_ BitVec 32) V!31401 V!31401 (_ BitVec 64) V!31401 (_ BitVec 32) Int) Unit!31415)

(assert (=> b!928308 (= lt!418692 (lemmaListMapApplyFromThenApplyFromZero!99 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928309 () Bool)

(declare-fun e!521205 () Bool)

(assert (=> b!928309 (= e!521205 tp_is_empty!19827)))

(declare-fun b!928310 () Bool)

(declare-fun e!521210 () Unit!31415)

(declare-fun Unit!31417 () Unit!31415)

(assert (=> b!928310 (= e!521210 Unit!31417)))

(declare-fun b!928311 () Bool)

(declare-fun e!521214 () Unit!31415)

(assert (=> b!928311 (= e!521214 e!521210)))

(declare-fun lt!418684 () (_ BitVec 64))

(assert (=> b!928311 (= lt!418684 (select (arr!26752 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96994 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928311 (= c!96994 (validKeyInArray!0 lt!418684))))

(declare-fun b!928312 () Bool)

(declare-fun res!625162 () Bool)

(assert (=> b!928312 (=> (not res!625162) (not e!521207))))

(declare-fun apply!702 (ListLongMap!11713 (_ BitVec 64)) V!31401)

(assert (=> b!928312 (= res!625162 (= (apply!702 lt!418686 k0!1099) v!791))))

(declare-fun b!928313 () Bool)

(declare-fun e!521204 () Bool)

(assert (=> b!928313 (= e!521204 e!521215)))

(declare-fun res!625152 () Bool)

(assert (=> b!928313 (=> (not res!625152) (not e!521215))))

(assert (=> b!928313 (= res!625152 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27211 _keys!1487)))))

(declare-fun lt!418682 () Unit!31415)

(assert (=> b!928313 (= lt!418682 e!521214)))

(declare-fun c!96996 () Bool)

(assert (=> b!928313 (= c!96996 (validKeyInArray!0 k0!1099))))

(declare-fun b!928314 () Bool)

(declare-fun lt!418689 () ListLongMap!11713)

(declare-fun lt!418690 () V!31401)

(assert (=> b!928314 (= (apply!702 lt!418689 k0!1099) lt!418690)))

(declare-fun lt!418695 () ListLongMap!11713)

(declare-fun lt!418687 () Unit!31415)

(declare-fun lt!418681 () V!31401)

(declare-fun addApplyDifferent!414 (ListLongMap!11713 (_ BitVec 64) V!31401 (_ BitVec 64)) Unit!31415)

(assert (=> b!928314 (= lt!418687 (addApplyDifferent!414 lt!418695 lt!418684 lt!418681 k0!1099))))

(assert (=> b!928314 (not (= lt!418684 k0!1099))))

(declare-fun lt!418685 () Unit!31415)

(declare-datatypes ((List!18815 0))(
  ( (Nil!18812) (Cons!18811 (h!19957 (_ BitVec 64)) (t!26864 List!18815)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55614 (_ BitVec 64) (_ BitVec 32) List!18815) Unit!31415)

(assert (=> b!928314 (= lt!418685 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18812))))

(declare-fun e!521209 () Bool)

(assert (=> b!928314 e!521209))

(declare-fun c!96995 () Bool)

(assert (=> b!928314 (= c!96995 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418694 () Unit!31415)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!265 (array!55614 array!55616 (_ BitVec 32) (_ BitVec 32) V!31401 V!31401 (_ BitVec 64) (_ BitVec 32) Int) Unit!31415)

(assert (=> b!928314 (= lt!418694 (lemmaListMapContainsThenArrayContainsFrom!265 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55614 (_ BitVec 32) List!18815) Bool)

(assert (=> b!928314 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18812)))

(declare-fun lt!418691 () Unit!31415)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55614 (_ BitVec 32) (_ BitVec 32)) Unit!31415)

(assert (=> b!928314 (= lt!418691 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928314 (contains!4929 lt!418689 k0!1099)))

(declare-fun lt!418683 () tuple2!13016)

(declare-fun +!2758 (ListLongMap!11713 tuple2!13016) ListLongMap!11713)

(assert (=> b!928314 (= lt!418689 (+!2758 lt!418695 lt!418683))))

(declare-fun lt!418688 () Unit!31415)

(declare-fun addStillContains!482 (ListLongMap!11713 (_ BitVec 64) V!31401 (_ BitVec 64)) Unit!31415)

(assert (=> b!928314 (= lt!418688 (addStillContains!482 lt!418695 lt!418684 lt!418681 k0!1099))))

(assert (=> b!928314 (= (getCurrentListMap!3120 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2758 (getCurrentListMap!3120 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418683))))

(assert (=> b!928314 (= lt!418683 (tuple2!13017 lt!418684 lt!418681))))

(declare-fun get!14087 (ValueCell!9432 V!31401) V!31401)

(declare-fun dynLambda!1547 (Int (_ BitVec 64)) V!31401)

(assert (=> b!928314 (= lt!418681 (get!14087 (select (arr!26753 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1547 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418696 () Unit!31415)

(declare-fun lemmaListMapRecursiveValidKeyArray!148 (array!55614 array!55616 (_ BitVec 32) (_ BitVec 32) V!31401 V!31401 (_ BitVec 32) Int) Unit!31415)

(assert (=> b!928314 (= lt!418696 (lemmaListMapRecursiveValidKeyArray!148 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928314 (= e!521210 lt!418687)))

(declare-fun b!928315 () Bool)

(declare-fun arrayContainsKey!0 (array!55614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928315 (= e!521209 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928316 () Bool)

(assert (=> b!928316 (= e!521209 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928317 () Bool)

(declare-fun res!625159 () Bool)

(assert (=> b!928317 (=> (not res!625159) (not e!521212))))

(assert (=> b!928317 (= res!625159 (and (= (size!27212 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27211 _keys!1487) (size!27212 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928318 () Bool)

(declare-fun e!521211 () Bool)

(assert (=> b!928318 (= e!521212 e!521211)))

(declare-fun res!625161 () Bool)

(assert (=> b!928318 (=> (not res!625161) (not e!521211))))

(assert (=> b!928318 (= res!625161 (contains!4929 lt!418695 k0!1099))))

(assert (=> b!928318 (= lt!418695 (getCurrentListMap!3120 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928319 () Bool)

(declare-fun Unit!31418 () Unit!31415)

(assert (=> b!928319 (= e!521214 Unit!31418)))

(declare-fun b!928320 () Bool)

(assert (=> b!928320 (= e!521208 tp_is_empty!19827)))

(declare-fun b!928321 () Bool)

(declare-fun res!625160 () Bool)

(assert (=> b!928321 (=> (not res!625160) (not e!521212))))

(assert (=> b!928321 (= res!625160 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18812))))

(declare-fun b!928322 () Bool)

(declare-fun res!625155 () Bool)

(assert (=> b!928322 (=> (not res!625155) (not e!521212))))

(assert (=> b!928322 (= res!625155 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27211 _keys!1487))))))

(declare-fun b!928323 () Bool)

(assert (=> b!928323 (= e!521211 e!521204)))

(declare-fun res!625156 () Bool)

(assert (=> b!928323 (=> (not res!625156) (not e!521204))))

(assert (=> b!928323 (= res!625156 (and (= lt!418690 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!928323 (= lt!418690 (apply!702 lt!418695 k0!1099))))

(declare-fun mapNonEmpty!31497 () Bool)

(declare-fun tp!60397 () Bool)

(assert (=> mapNonEmpty!31497 (= mapRes!31497 (and tp!60397 e!521205))))

(declare-fun mapKey!31497 () (_ BitVec 32))

(declare-fun mapValue!31497 () ValueCell!9432)

(declare-fun mapRest!31497 () (Array (_ BitVec 32) ValueCell!9432))

(assert (=> mapNonEmpty!31497 (= (arr!26753 _values!1231) (store mapRest!31497 mapKey!31497 mapValue!31497))))

(declare-fun b!928324 () Bool)

(assert (=> b!928324 (= e!521203 (= (apply!702 lt!418693 k0!1099) v!791))))

(assert (= (and start!79106 res!625158) b!928317))

(assert (= (and b!928317 res!625159) b!928305))

(assert (= (and b!928305 res!625154) b!928321))

(assert (= (and b!928321 res!625160) b!928322))

(assert (= (and b!928322 res!625155) b!928318))

(assert (= (and b!928318 res!625161) b!928323))

(assert (= (and b!928323 res!625156) b!928313))

(assert (= (and b!928313 c!96996) b!928311))

(assert (= (and b!928313 (not c!96996)) b!928319))

(assert (= (and b!928311 c!96994) b!928314))

(assert (= (and b!928311 (not c!96994)) b!928310))

(assert (= (and b!928314 c!96995) b!928315))

(assert (= (and b!928314 (not c!96995)) b!928316))

(assert (= (and b!928313 res!625152) b!928306))

(assert (= (and b!928306 res!625153) b!928312))

(assert (= (and b!928312 res!625162) b!928308))

(assert (= (and b!928308 res!625157) b!928324))

(assert (= (and b!928307 condMapEmpty!31497) mapIsEmpty!31497))

(assert (= (and b!928307 (not condMapEmpty!31497)) mapNonEmpty!31497))

(get-info :version)

(assert (= (and mapNonEmpty!31497 ((_ is ValueCellFull!9432) mapValue!31497)) b!928309))

(assert (= (and b!928307 ((_ is ValueCellFull!9432) mapDefault!31497)) b!928320))

(assert (= start!79106 b!928307))

(declare-fun b_lambda!13821 () Bool)

(assert (=> (not b_lambda!13821) (not b!928314)))

(declare-fun t!26862 () Bool)

(declare-fun tb!5899 () Bool)

(assert (=> (and start!79106 (= defaultEntry!1235 defaultEntry!1235) t!26862) tb!5899))

(declare-fun result!11621 () Bool)

(assert (=> tb!5899 (= result!11621 tp_is_empty!19827)))

(assert (=> b!928314 t!26862))

(declare-fun b_and!28377 () Bool)

(assert (= b_and!28375 (and (=> t!26862 result!11621) b_and!28377)))

(declare-fun m!863095 () Bool)

(assert (=> b!928308 m!863095))

(declare-fun m!863097 () Bool)

(assert (=> b!928308 m!863097))

(declare-fun m!863099 () Bool)

(assert (=> b!928308 m!863099))

(declare-fun m!863101 () Bool)

(assert (=> b!928312 m!863101))

(declare-fun m!863103 () Bool)

(assert (=> b!928306 m!863103))

(declare-fun m!863105 () Bool)

(assert (=> b!928306 m!863105))

(declare-fun m!863107 () Bool)

(assert (=> mapNonEmpty!31497 m!863107))

(declare-fun m!863109 () Bool)

(assert (=> b!928311 m!863109))

(declare-fun m!863111 () Bool)

(assert (=> b!928311 m!863111))

(declare-fun m!863113 () Bool)

(assert (=> start!79106 m!863113))

(declare-fun m!863115 () Bool)

(assert (=> start!79106 m!863115))

(declare-fun m!863117 () Bool)

(assert (=> start!79106 m!863117))

(declare-fun m!863119 () Bool)

(assert (=> b!928323 m!863119))

(declare-fun m!863121 () Bool)

(assert (=> b!928313 m!863121))

(declare-fun m!863123 () Bool)

(assert (=> b!928321 m!863123))

(declare-fun m!863125 () Bool)

(assert (=> b!928318 m!863125))

(declare-fun m!863127 () Bool)

(assert (=> b!928318 m!863127))

(declare-fun m!863129 () Bool)

(assert (=> b!928324 m!863129))

(declare-fun m!863131 () Bool)

(assert (=> b!928314 m!863131))

(declare-fun m!863133 () Bool)

(assert (=> b!928314 m!863133))

(declare-fun m!863135 () Bool)

(assert (=> b!928314 m!863135))

(declare-fun m!863137 () Bool)

(assert (=> b!928314 m!863137))

(declare-fun m!863139 () Bool)

(assert (=> b!928314 m!863139))

(declare-fun m!863141 () Bool)

(assert (=> b!928314 m!863141))

(declare-fun m!863143 () Bool)

(assert (=> b!928314 m!863143))

(assert (=> b!928314 m!863139))

(assert (=> b!928314 m!863141))

(declare-fun m!863145 () Bool)

(assert (=> b!928314 m!863145))

(assert (=> b!928314 m!863105))

(declare-fun m!863147 () Bool)

(assert (=> b!928314 m!863147))

(declare-fun m!863149 () Bool)

(assert (=> b!928314 m!863149))

(declare-fun m!863151 () Bool)

(assert (=> b!928314 m!863151))

(declare-fun m!863153 () Bool)

(assert (=> b!928314 m!863153))

(declare-fun m!863155 () Bool)

(assert (=> b!928314 m!863155))

(declare-fun m!863157 () Bool)

(assert (=> b!928314 m!863157))

(assert (=> b!928314 m!863131))

(declare-fun m!863159 () Bool)

(assert (=> b!928314 m!863159))

(declare-fun m!863161 () Bool)

(assert (=> b!928315 m!863161))

(declare-fun m!863163 () Bool)

(assert (=> b!928305 m!863163))

(check-sat tp_is_empty!19827 (not b_next!17319) (not b!928321) (not b!928313) (not b!928308) (not mapNonEmpty!31497) (not b!928306) (not b_lambda!13821) (not b!928315) (not b!928318) (not b!928323) (not b!928324) (not b!928311) b_and!28377 (not b!928312) (not start!79106) (not b!928305) (not b!928314))
(check-sat b_and!28377 (not b_next!17319))
