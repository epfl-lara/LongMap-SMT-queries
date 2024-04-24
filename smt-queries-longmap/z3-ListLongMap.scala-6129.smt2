; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79050 () Bool)

(assert start!79050)

(declare-fun b_free!17095 () Bool)

(declare-fun b_next!17095 () Bool)

(assert (=> start!79050 (= b_free!17095 (not b_next!17095))))

(declare-fun tp!59727 () Bool)

(declare-fun b_and!27937 () Bool)

(assert (=> start!79050 (= tp!59727 b_and!27937)))

(declare-fun b!922857 () Bool)

(declare-fun res!622082 () Bool)

(declare-fun e!517916 () Bool)

(assert (=> b!922857 (=> (not res!622082) (not e!517916))))

(declare-datatypes ((array!55231 0))(
  ( (array!55232 (arr!26556 (Array (_ BitVec 32) (_ BitVec 64))) (size!27016 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55231)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55231 (_ BitVec 32)) Bool)

(assert (=> b!922857 (= res!622082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922858 () Bool)

(declare-fun res!622086 () Bool)

(assert (=> b!922858 (=> (not res!622086) (not e!517916))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31103 0))(
  ( (V!31104 (val!9852 Int)) )
))
(declare-datatypes ((ValueCell!9320 0))(
  ( (ValueCellFull!9320 (v!12367 V!31103)) (EmptyCell!9320) )
))
(declare-datatypes ((array!55233 0))(
  ( (array!55234 (arr!26557 (Array (_ BitVec 32) ValueCell!9320)) (size!27017 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55233)

(assert (=> b!922858 (= res!622086 (and (= (size!27017 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27016 _keys!1487) (size!27017 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922859 () Bool)

(declare-fun res!622083 () Bool)

(declare-fun e!517913 () Bool)

(assert (=> b!922859 (=> (not res!622083) (not e!517913))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922859 (= res!622083 (validKeyInArray!0 k0!1099))))

(declare-fun b!922860 () Bool)

(declare-fun res!622077 () Bool)

(assert (=> b!922860 (=> (not res!622077) (not e!517916))))

(declare-datatypes ((List!18620 0))(
  ( (Nil!18617) (Cons!18616 (h!19768 (_ BitVec 64)) (t!26437 List!18620)) )
))
(declare-fun arrayNoDuplicates!0 (array!55231 (_ BitVec 32) List!18620) Bool)

(assert (=> b!922860 (= res!622077 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18617))))

(declare-fun mapIsEmpty!31161 () Bool)

(declare-fun mapRes!31161 () Bool)

(assert (=> mapIsEmpty!31161 mapRes!31161))

(declare-fun b!922861 () Bool)

(declare-fun e!517912 () Bool)

(assert (=> b!922861 (= e!517912 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!922862 () Bool)

(declare-fun res!622081 () Bool)

(assert (=> b!922862 (=> (not res!622081) (not e!517916))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922862 (= res!622081 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27016 _keys!1487))))))

(declare-fun b!922863 () Bool)

(declare-fun e!517918 () Bool)

(declare-fun e!517911 () Bool)

(assert (=> b!922863 (= e!517918 (and e!517911 mapRes!31161))))

(declare-fun condMapEmpty!31161 () Bool)

(declare-fun mapDefault!31161 () ValueCell!9320)

(assert (=> b!922863 (= condMapEmpty!31161 (= (arr!26557 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9320)) mapDefault!31161)))))

(declare-fun b!922864 () Bool)

(declare-fun e!517917 () Bool)

(assert (=> b!922864 (= e!517913 e!517917)))

(declare-fun res!622080 () Bool)

(assert (=> b!922864 (=> (not res!622080) (not e!517917))))

(declare-fun lt!414321 () (_ BitVec 64))

(assert (=> b!922864 (= res!622080 (validKeyInArray!0 lt!414321))))

(assert (=> b!922864 (= lt!414321 (select (arr!26556 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!622085 () Bool)

(assert (=> start!79050 (=> (not res!622085) (not e!517916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79050 (= res!622085 (validMask!0 mask!1881))))

(assert (=> start!79050 e!517916))

(assert (=> start!79050 true))

(declare-fun tp_is_empty!19603 () Bool)

(assert (=> start!79050 tp_is_empty!19603))

(declare-fun array_inv!20786 (array!55233) Bool)

(assert (=> start!79050 (and (array_inv!20786 _values!1231) e!517918)))

(assert (=> start!79050 tp!59727))

(declare-fun array_inv!20787 (array!55231) Bool)

(assert (=> start!79050 (array_inv!20787 _keys!1487)))

(declare-fun mapNonEmpty!31161 () Bool)

(declare-fun tp!59726 () Bool)

(declare-fun e!517915 () Bool)

(assert (=> mapNonEmpty!31161 (= mapRes!31161 (and tp!59726 e!517915))))

(declare-fun mapKey!31161 () (_ BitVec 32))

(declare-fun mapRest!31161 () (Array (_ BitVec 32) ValueCell!9320))

(declare-fun mapValue!31161 () ValueCell!9320)

(assert (=> mapNonEmpty!31161 (= (arr!26557 _values!1231) (store mapRest!31161 mapKey!31161 mapValue!31161))))

(declare-fun b!922865 () Bool)

(assert (=> b!922865 (= e!517911 tp_is_empty!19603)))

(declare-fun b!922866 () Bool)

(assert (=> b!922866 (= e!517916 e!517913)))

(declare-fun res!622079 () Bool)

(assert (=> b!922866 (=> (not res!622079) (not e!517913))))

(declare-datatypes ((tuple2!12802 0))(
  ( (tuple2!12803 (_1!6412 (_ BitVec 64)) (_2!6412 V!31103)) )
))
(declare-datatypes ((List!18621 0))(
  ( (Nil!18618) (Cons!18617 (h!19769 tuple2!12802) (t!26438 List!18621)) )
))
(declare-datatypes ((ListLongMap!11501 0))(
  ( (ListLongMap!11502 (toList!5766 List!18621)) )
))
(declare-fun lt!414325 () ListLongMap!11501)

(declare-fun contains!4840 (ListLongMap!11501 (_ BitVec 64)) Bool)

(assert (=> b!922866 (= res!622079 (contains!4840 lt!414325 k0!1099))))

(declare-fun zeroValue!1173 () V!31103)

(declare-fun minValue!1173 () V!31103)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3018 (array!55231 array!55233 (_ BitVec 32) (_ BitVec 32) V!31103 V!31103 (_ BitVec 32) Int) ListLongMap!11501)

(assert (=> b!922866 (= lt!414325 (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922867 () Bool)

(assert (=> b!922867 (= e!517915 tp_is_empty!19603)))

(declare-fun b!922868 () Bool)

(assert (=> b!922868 (= e!517917 (not true))))

(assert (=> b!922868 (not (= lt!414321 k0!1099))))

(declare-datatypes ((Unit!31100 0))(
  ( (Unit!31101) )
))
(declare-fun lt!414319 () Unit!31100)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55231 (_ BitVec 64) (_ BitVec 32) List!18620) Unit!31100)

(assert (=> b!922868 (= lt!414319 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18617))))

(assert (=> b!922868 e!517912))

(declare-fun c!96426 () Bool)

(assert (=> b!922868 (= c!96426 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414322 () Unit!31100)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!185 (array!55231 array!55233 (_ BitVec 32) (_ BitVec 32) V!31103 V!31103 (_ BitVec 64) (_ BitVec 32) Int) Unit!31100)

(assert (=> b!922868 (= lt!414322 (lemmaListMapContainsThenArrayContainsFrom!185 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!922868 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18617)))

(declare-fun lt!414320 () Unit!31100)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55231 (_ BitVec 32) (_ BitVec 32)) Unit!31100)

(assert (=> b!922868 (= lt!414320 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414323 () tuple2!12802)

(declare-fun +!2694 (ListLongMap!11501 tuple2!12802) ListLongMap!11501)

(assert (=> b!922868 (contains!4840 (+!2694 lt!414325 lt!414323) k0!1099)))

(declare-fun lt!414326 () Unit!31100)

(declare-fun lt!414318 () V!31103)

(declare-fun addStillContains!403 (ListLongMap!11501 (_ BitVec 64) V!31103 (_ BitVec 64)) Unit!31100)

(assert (=> b!922868 (= lt!414326 (addStillContains!403 lt!414325 lt!414321 lt!414318 k0!1099))))

(assert (=> b!922868 (= (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2694 (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414323))))

(assert (=> b!922868 (= lt!414323 (tuple2!12803 lt!414321 lt!414318))))

(declare-fun get!13961 (ValueCell!9320 V!31103) V!31103)

(declare-fun dynLambda!1491 (Int (_ BitVec 64)) V!31103)

(assert (=> b!922868 (= lt!414318 (get!13961 (select (arr!26557 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1491 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414324 () Unit!31100)

(declare-fun lemmaListMapRecursiveValidKeyArray!74 (array!55231 array!55233 (_ BitVec 32) (_ BitVec 32) V!31103 V!31103 (_ BitVec 32) Int) Unit!31100)

(assert (=> b!922868 (= lt!414324 (lemmaListMapRecursiveValidKeyArray!74 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922869 () Bool)

(declare-fun res!622078 () Bool)

(assert (=> b!922869 (=> (not res!622078) (not e!517913))))

(declare-fun v!791 () V!31103)

(declare-fun apply!625 (ListLongMap!11501 (_ BitVec 64)) V!31103)

(assert (=> b!922869 (= res!622078 (= (apply!625 lt!414325 k0!1099) v!791))))

(declare-fun b!922870 () Bool)

(declare-fun res!622084 () Bool)

(assert (=> b!922870 (=> (not res!622084) (not e!517913))))

(assert (=> b!922870 (= res!622084 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922871 () Bool)

(declare-fun arrayContainsKey!0 (array!55231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922871 (= e!517912 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!79050 res!622085) b!922858))

(assert (= (and b!922858 res!622086) b!922857))

(assert (= (and b!922857 res!622082) b!922860))

(assert (= (and b!922860 res!622077) b!922862))

(assert (= (and b!922862 res!622081) b!922866))

(assert (= (and b!922866 res!622079) b!922869))

(assert (= (and b!922869 res!622078) b!922870))

(assert (= (and b!922870 res!622084) b!922859))

(assert (= (and b!922859 res!622083) b!922864))

(assert (= (and b!922864 res!622080) b!922868))

(assert (= (and b!922868 c!96426) b!922871))

(assert (= (and b!922868 (not c!96426)) b!922861))

(assert (= (and b!922863 condMapEmpty!31161) mapIsEmpty!31161))

(assert (= (and b!922863 (not condMapEmpty!31161)) mapNonEmpty!31161))

(get-info :version)

(assert (= (and mapNonEmpty!31161 ((_ is ValueCellFull!9320) mapValue!31161)) b!922867))

(assert (= (and b!922863 ((_ is ValueCellFull!9320) mapDefault!31161)) b!922865))

(assert (= start!79050 b!922863))

(declare-fun b_lambda!13611 () Bool)

(assert (=> (not b_lambda!13611) (not b!922868)))

(declare-fun t!26436 () Bool)

(declare-fun tb!5667 () Bool)

(assert (=> (and start!79050 (= defaultEntry!1235 defaultEntry!1235) t!26436) tb!5667))

(declare-fun result!11165 () Bool)

(assert (=> tb!5667 (= result!11165 tp_is_empty!19603)))

(assert (=> b!922868 t!26436))

(declare-fun b_and!27939 () Bool)

(assert (= b_and!27937 (and (=> t!26436 result!11165) b_and!27939)))

(declare-fun m!857245 () Bool)

(assert (=> mapNonEmpty!31161 m!857245))

(declare-fun m!857247 () Bool)

(assert (=> b!922871 m!857247))

(declare-fun m!857249 () Bool)

(assert (=> b!922859 m!857249))

(declare-fun m!857251 () Bool)

(assert (=> b!922864 m!857251))

(declare-fun m!857253 () Bool)

(assert (=> b!922864 m!857253))

(declare-fun m!857255 () Bool)

(assert (=> b!922857 m!857255))

(declare-fun m!857257 () Bool)

(assert (=> b!922860 m!857257))

(declare-fun m!857259 () Bool)

(assert (=> b!922868 m!857259))

(declare-fun m!857261 () Bool)

(assert (=> b!922868 m!857261))

(declare-fun m!857263 () Bool)

(assert (=> b!922868 m!857263))

(declare-fun m!857265 () Bool)

(assert (=> b!922868 m!857265))

(declare-fun m!857267 () Bool)

(assert (=> b!922868 m!857267))

(assert (=> b!922868 m!857265))

(assert (=> b!922868 m!857267))

(declare-fun m!857269 () Bool)

(assert (=> b!922868 m!857269))

(declare-fun m!857271 () Bool)

(assert (=> b!922868 m!857271))

(declare-fun m!857273 () Bool)

(assert (=> b!922868 m!857273))

(declare-fun m!857275 () Bool)

(assert (=> b!922868 m!857275))

(declare-fun m!857277 () Bool)

(assert (=> b!922868 m!857277))

(declare-fun m!857279 () Bool)

(assert (=> b!922868 m!857279))

(assert (=> b!922868 m!857259))

(declare-fun m!857281 () Bool)

(assert (=> b!922868 m!857281))

(declare-fun m!857283 () Bool)

(assert (=> b!922868 m!857283))

(assert (=> b!922868 m!857273))

(declare-fun m!857285 () Bool)

(assert (=> b!922868 m!857285))

(declare-fun m!857287 () Bool)

(assert (=> b!922869 m!857287))

(declare-fun m!857289 () Bool)

(assert (=> start!79050 m!857289))

(declare-fun m!857291 () Bool)

(assert (=> start!79050 m!857291))

(declare-fun m!857293 () Bool)

(assert (=> start!79050 m!857293))

(declare-fun m!857295 () Bool)

(assert (=> b!922866 m!857295))

(declare-fun m!857297 () Bool)

(assert (=> b!922866 m!857297))

(check-sat (not start!79050) (not b_lambda!13611) (not b!922868) b_and!27939 (not b!922871) (not b!922864) (not b!922860) tp_is_empty!19603 (not b!922866) (not b!922857) (not b!922869) (not mapNonEmpty!31161) (not b!922859) (not b_next!17095))
(check-sat b_and!27939 (not b_next!17095))
