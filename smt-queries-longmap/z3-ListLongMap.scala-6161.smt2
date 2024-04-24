; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79242 () Bool)

(assert start!79242)

(declare-fun b_free!17287 () Bool)

(declare-fun b_next!17287 () Bool)

(assert (=> start!79242 (= b_free!17287 (not b_next!17287))))

(declare-fun tp!60302 () Bool)

(declare-fun b_and!28321 () Bool)

(assert (=> start!79242 (= tp!60302 b_and!28321)))

(declare-fun b!928216 () Bool)

(declare-fun e!521172 () Bool)

(declare-fun e!521164 () Bool)

(assert (=> b!928216 (= e!521172 e!521164)))

(declare-fun res!624968 () Bool)

(assert (=> b!928216 (=> (not res!624968) (not e!521164))))

(declare-datatypes ((V!31359 0))(
  ( (V!31360 (val!9948 Int)) )
))
(declare-datatypes ((tuple2!12974 0))(
  ( (tuple2!12975 (_1!6498 (_ BitVec 64)) (_2!6498 V!31359)) )
))
(declare-datatypes ((List!18782 0))(
  ( (Nil!18779) (Cons!18778 (h!19930 tuple2!12974) (t!26791 List!18782)) )
))
(declare-datatypes ((ListLongMap!11673 0))(
  ( (ListLongMap!11674 (toList!5852 List!18782)) )
))
(declare-fun lt!418277 () ListLongMap!11673)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4924 (ListLongMap!11673 (_ BitVec 64)) Bool)

(assert (=> b!928216 (= res!624968 (contains!4924 lt!418277 k0!1099))))

(declare-datatypes ((array!55605 0))(
  ( (array!55606 (arr!26743 (Array (_ BitVec 32) (_ BitVec 64))) (size!27203 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55605)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9416 0))(
  ( (ValueCellFull!9416 (v!12463 V!31359)) (EmptyCell!9416) )
))
(declare-datatypes ((array!55607 0))(
  ( (array!55608 (arr!26744 (Array (_ BitVec 32) ValueCell!9416)) (size!27204 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55607)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31359)

(declare-fun minValue!1173 () V!31359)

(declare-fun getCurrentListMap!3102 (array!55605 array!55607 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 32) Int) ListLongMap!11673)

(assert (=> b!928216 (= lt!418277 (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!521163 () Bool)

(declare-fun b!928217 () Bool)

(declare-fun arrayContainsKey!0 (array!55605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928217 (= e!521163 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928218 () Bool)

(declare-fun e!521167 () Bool)

(declare-fun e!521169 () Bool)

(declare-fun mapRes!31449 () Bool)

(assert (=> b!928218 (= e!521167 (and e!521169 mapRes!31449))))

(declare-fun condMapEmpty!31449 () Bool)

(declare-fun mapDefault!31449 () ValueCell!9416)

(assert (=> b!928218 (= condMapEmpty!31449 (= (arr!26744 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9416)) mapDefault!31449)))))

(declare-fun b!928219 () Bool)

(assert (=> b!928219 (= e!521164 (not true))))

(declare-fun e!521170 () Bool)

(assert (=> b!928219 e!521170))

(declare-fun res!624973 () Bool)

(assert (=> b!928219 (=> (not res!624973) (not e!521170))))

(declare-fun lt!418281 () ListLongMap!11673)

(assert (=> b!928219 (= res!624973 (contains!4924 lt!418281 k0!1099))))

(assert (=> b!928219 (= lt!418281 (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31359)

(declare-datatypes ((Unit!31353 0))(
  ( (Unit!31354) )
))
(declare-fun lt!418274 () Unit!31353)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!92 (array!55605 array!55607 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 64) V!31359 (_ BitVec 32) Int) Unit!31353)

(assert (=> b!928219 (= lt!418274 (lemmaListMapApplyFromThenApplyFromZero!92 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!624975 () Bool)

(declare-fun e!521171 () Bool)

(assert (=> start!79242 (=> (not res!624975) (not e!521171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79242 (= res!624975 (validMask!0 mask!1881))))

(assert (=> start!79242 e!521171))

(assert (=> start!79242 true))

(declare-fun tp_is_empty!19795 () Bool)

(assert (=> start!79242 tp_is_empty!19795))

(declare-fun array_inv!20924 (array!55607) Bool)

(assert (=> start!79242 (and (array_inv!20924 _values!1231) e!521167)))

(assert (=> start!79242 tp!60302))

(declare-fun array_inv!20925 (array!55605) Bool)

(assert (=> start!79242 (array_inv!20925 _keys!1487)))

(declare-fun b!928220 () Bool)

(declare-fun e!521161 () Bool)

(assert (=> b!928220 (= e!521161 tp_is_empty!19795)))

(declare-fun mapIsEmpty!31449 () Bool)

(assert (=> mapIsEmpty!31449 mapRes!31449))

(declare-fun b!928221 () Bool)

(declare-fun res!624969 () Bool)

(assert (=> b!928221 (=> (not res!624969) (not e!521171))))

(assert (=> b!928221 (= res!624969 (and (= (size!27204 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27203 _keys!1487) (size!27204 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928222 () Bool)

(declare-fun apply!702 (ListLongMap!11673 (_ BitVec 64)) V!31359)

(assert (=> b!928222 (= e!521170 (= (apply!702 lt!418281 k0!1099) v!791))))

(declare-fun b!928223 () Bool)

(declare-fun res!624974 () Bool)

(assert (=> b!928223 (=> (not res!624974) (not e!521171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55605 (_ BitVec 32)) Bool)

(assert (=> b!928223 (= res!624974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928224 () Bool)

(declare-fun e!521162 () Unit!31353)

(declare-fun e!521168 () Unit!31353)

(assert (=> b!928224 (= e!521162 e!521168)))

(declare-fun lt!418288 () (_ BitVec 64))

(assert (=> b!928224 (= lt!418288 (select (arr!26743 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97132 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928224 (= c!97132 (validKeyInArray!0 lt!418288))))

(declare-fun b!928225 () Bool)

(assert (=> b!928225 (= e!521169 tp_is_empty!19795)))

(declare-fun b!928226 () Bool)

(declare-fun Unit!31355 () Unit!31353)

(assert (=> b!928226 (= e!521168 Unit!31355)))

(declare-fun b!928227 () Bool)

(declare-fun e!521166 () Bool)

(declare-fun e!521173 () Bool)

(assert (=> b!928227 (= e!521166 e!521173)))

(declare-fun res!624970 () Bool)

(assert (=> b!928227 (=> (not res!624970) (not e!521173))))

(declare-fun lt!418278 () V!31359)

(assert (=> b!928227 (= res!624970 (and (= lt!418278 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!418287 () ListLongMap!11673)

(assert (=> b!928227 (= lt!418278 (apply!702 lt!418287 k0!1099))))

(declare-fun b!928228 () Bool)

(assert (=> b!928228 (= e!521163 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928229 () Bool)

(declare-fun res!624972 () Bool)

(assert (=> b!928229 (=> (not res!624972) (not e!521164))))

(assert (=> b!928229 (= res!624972 (= (apply!702 lt!418277 k0!1099) v!791))))

(declare-fun b!928230 () Bool)

(declare-fun res!624971 () Bool)

(assert (=> b!928230 (=> (not res!624971) (not e!521171))))

(assert (=> b!928230 (= res!624971 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27203 _keys!1487))))))

(declare-fun b!928231 () Bool)

(declare-fun lt!418282 () ListLongMap!11673)

(assert (=> b!928231 (= (apply!702 lt!418282 k0!1099) lt!418278)))

(declare-fun lt!418279 () Unit!31353)

(declare-fun lt!418276 () V!31359)

(declare-fun addApplyDifferent!399 (ListLongMap!11673 (_ BitVec 64) V!31359 (_ BitVec 64)) Unit!31353)

(assert (=> b!928231 (= lt!418279 (addApplyDifferent!399 lt!418287 lt!418288 lt!418276 k0!1099))))

(assert (=> b!928231 (not (= lt!418288 k0!1099))))

(declare-fun lt!418280 () Unit!31353)

(declare-datatypes ((List!18783 0))(
  ( (Nil!18780) (Cons!18779 (h!19931 (_ BitVec 64)) (t!26792 List!18783)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55605 (_ BitVec 64) (_ BitVec 32) List!18783) Unit!31353)

(assert (=> b!928231 (= lt!418280 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18780))))

(assert (=> b!928231 e!521163))

(declare-fun c!97133 () Bool)

(assert (=> b!928231 (= c!97133 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418285 () Unit!31353)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!254 (array!55605 array!55607 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 64) (_ BitVec 32) Int) Unit!31353)

(assert (=> b!928231 (= lt!418285 (lemmaListMapContainsThenArrayContainsFrom!254 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55605 (_ BitVec 32) List!18783) Bool)

(assert (=> b!928231 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18780)))

(declare-fun lt!418283 () Unit!31353)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55605 (_ BitVec 32) (_ BitVec 32)) Unit!31353)

(assert (=> b!928231 (= lt!418283 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928231 (contains!4924 lt!418282 k0!1099)))

(declare-fun lt!418286 () tuple2!12974)

(declare-fun +!2763 (ListLongMap!11673 tuple2!12974) ListLongMap!11673)

(assert (=> b!928231 (= lt!418282 (+!2763 lt!418287 lt!418286))))

(declare-fun lt!418284 () Unit!31353)

(declare-fun addStillContains!472 (ListLongMap!11673 (_ BitVec 64) V!31359 (_ BitVec 64)) Unit!31353)

(assert (=> b!928231 (= lt!418284 (addStillContains!472 lt!418287 lt!418288 lt!418276 k0!1099))))

(assert (=> b!928231 (= (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2763 (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418286))))

(assert (=> b!928231 (= lt!418286 (tuple2!12975 lt!418288 lt!418276))))

(declare-fun get!14094 (ValueCell!9416 V!31359) V!31359)

(declare-fun dynLambda!1560 (Int (_ BitVec 64)) V!31359)

(assert (=> b!928231 (= lt!418276 (get!14094 (select (arr!26744 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1560 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418289 () Unit!31353)

(declare-fun lemmaListMapRecursiveValidKeyArray!143 (array!55605 array!55607 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 32) Int) Unit!31353)

(assert (=> b!928231 (= lt!418289 (lemmaListMapRecursiveValidKeyArray!143 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928231 (= e!521168 lt!418279)))

(declare-fun mapNonEmpty!31449 () Bool)

(declare-fun tp!60303 () Bool)

(assert (=> mapNonEmpty!31449 (= mapRes!31449 (and tp!60303 e!521161))))

(declare-fun mapRest!31449 () (Array (_ BitVec 32) ValueCell!9416))

(declare-fun mapValue!31449 () ValueCell!9416)

(declare-fun mapKey!31449 () (_ BitVec 32))

(assert (=> mapNonEmpty!31449 (= (arr!26744 _values!1231) (store mapRest!31449 mapKey!31449 mapValue!31449))))

(declare-fun b!928232 () Bool)

(declare-fun res!624977 () Bool)

(assert (=> b!928232 (=> (not res!624977) (not e!521171))))

(assert (=> b!928232 (= res!624977 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18780))))

(declare-fun b!928233 () Bool)

(declare-fun Unit!31356 () Unit!31353)

(assert (=> b!928233 (= e!521162 Unit!31356)))

(declare-fun b!928234 () Bool)

(assert (=> b!928234 (= e!521173 e!521172)))

(declare-fun res!624978 () Bool)

(assert (=> b!928234 (=> (not res!624978) (not e!521172))))

(assert (=> b!928234 (= res!624978 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27203 _keys!1487)))))

(declare-fun lt!418275 () Unit!31353)

(assert (=> b!928234 (= lt!418275 e!521162)))

(declare-fun c!97134 () Bool)

(assert (=> b!928234 (= c!97134 (validKeyInArray!0 k0!1099))))

(declare-fun b!928235 () Bool)

(assert (=> b!928235 (= e!521171 e!521166)))

(declare-fun res!624976 () Bool)

(assert (=> b!928235 (=> (not res!624976) (not e!521166))))

(assert (=> b!928235 (= res!624976 (contains!4924 lt!418287 k0!1099))))

(assert (=> b!928235 (= lt!418287 (getCurrentListMap!3102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79242 res!624975) b!928221))

(assert (= (and b!928221 res!624969) b!928223))

(assert (= (and b!928223 res!624974) b!928232))

(assert (= (and b!928232 res!624977) b!928230))

(assert (= (and b!928230 res!624971) b!928235))

(assert (= (and b!928235 res!624976) b!928227))

(assert (= (and b!928227 res!624970) b!928234))

(assert (= (and b!928234 c!97134) b!928224))

(assert (= (and b!928234 (not c!97134)) b!928233))

(assert (= (and b!928224 c!97132) b!928231))

(assert (= (and b!928224 (not c!97132)) b!928226))

(assert (= (and b!928231 c!97133) b!928217))

(assert (= (and b!928231 (not c!97133)) b!928228))

(assert (= (and b!928234 res!624978) b!928216))

(assert (= (and b!928216 res!624968) b!928229))

(assert (= (and b!928229 res!624972) b!928219))

(assert (= (and b!928219 res!624973) b!928222))

(assert (= (and b!928218 condMapEmpty!31449) mapIsEmpty!31449))

(assert (= (and b!928218 (not condMapEmpty!31449)) mapNonEmpty!31449))

(get-info :version)

(assert (= (and mapNonEmpty!31449 ((_ is ValueCellFull!9416) mapValue!31449)) b!928220))

(assert (= (and b!928218 ((_ is ValueCellFull!9416) mapDefault!31449)) b!928225))

(assert (= start!79242 b!928218))

(declare-fun b_lambda!13803 () Bool)

(assert (=> (not b_lambda!13803) (not b!928231)))

(declare-fun t!26790 () Bool)

(declare-fun tb!5859 () Bool)

(assert (=> (and start!79242 (= defaultEntry!1235 defaultEntry!1235) t!26790) tb!5859))

(declare-fun result!11549 () Bool)

(assert (=> tb!5859 (= result!11549 tp_is_empty!19795)))

(assert (=> b!928231 t!26790))

(declare-fun b_and!28323 () Bool)

(assert (= b_and!28321 (and (=> t!26790 result!11549) b_and!28323)))

(declare-fun m!863269 () Bool)

(assert (=> b!928234 m!863269))

(declare-fun m!863271 () Bool)

(assert (=> b!928232 m!863271))

(declare-fun m!863273 () Bool)

(assert (=> b!928224 m!863273))

(declare-fun m!863275 () Bool)

(assert (=> b!928224 m!863275))

(declare-fun m!863277 () Bool)

(assert (=> b!928229 m!863277))

(declare-fun m!863279 () Bool)

(assert (=> start!79242 m!863279))

(declare-fun m!863281 () Bool)

(assert (=> start!79242 m!863281))

(declare-fun m!863283 () Bool)

(assert (=> start!79242 m!863283))

(declare-fun m!863285 () Bool)

(assert (=> b!928219 m!863285))

(declare-fun m!863287 () Bool)

(assert (=> b!928219 m!863287))

(declare-fun m!863289 () Bool)

(assert (=> b!928219 m!863289))

(declare-fun m!863291 () Bool)

(assert (=> b!928216 m!863291))

(declare-fun m!863293 () Bool)

(assert (=> b!928216 m!863293))

(declare-fun m!863295 () Bool)

(assert (=> b!928235 m!863295))

(declare-fun m!863297 () Bool)

(assert (=> b!928235 m!863297))

(declare-fun m!863299 () Bool)

(assert (=> b!928227 m!863299))

(declare-fun m!863301 () Bool)

(assert (=> b!928222 m!863301))

(declare-fun m!863303 () Bool)

(assert (=> mapNonEmpty!31449 m!863303))

(declare-fun m!863305 () Bool)

(assert (=> b!928231 m!863305))

(declare-fun m!863307 () Bool)

(assert (=> b!928231 m!863307))

(declare-fun m!863309 () Bool)

(assert (=> b!928231 m!863309))

(declare-fun m!863311 () Bool)

(assert (=> b!928231 m!863311))

(declare-fun m!863313 () Bool)

(assert (=> b!928231 m!863313))

(assert (=> b!928231 m!863309))

(declare-fun m!863315 () Bool)

(assert (=> b!928231 m!863315))

(assert (=> b!928231 m!863293))

(declare-fun m!863317 () Bool)

(assert (=> b!928231 m!863317))

(declare-fun m!863319 () Bool)

(assert (=> b!928231 m!863319))

(declare-fun m!863321 () Bool)

(assert (=> b!928231 m!863321))

(declare-fun m!863323 () Bool)

(assert (=> b!928231 m!863323))

(declare-fun m!863325 () Bool)

(assert (=> b!928231 m!863325))

(declare-fun m!863327 () Bool)

(assert (=> b!928231 m!863327))

(declare-fun m!863329 () Bool)

(assert (=> b!928231 m!863329))

(declare-fun m!863331 () Bool)

(assert (=> b!928231 m!863331))

(assert (=> b!928231 m!863313))

(assert (=> b!928231 m!863329))

(declare-fun m!863333 () Bool)

(assert (=> b!928231 m!863333))

(declare-fun m!863335 () Bool)

(assert (=> b!928217 m!863335))

(declare-fun m!863337 () Bool)

(assert (=> b!928223 m!863337))

(check-sat (not b_next!17287) (not b_lambda!13803) (not b!928235) b_and!28323 (not b!928219) (not b!928223) (not b!928216) (not mapNonEmpty!31449) (not b!928227) tp_is_empty!19795 (not b!928222) (not b!928229) (not b!928234) (not b!928224) (not start!79242) (not b!928217) (not b!928232) (not b!928231))
(check-sat b_and!28323 (not b_next!17287))
