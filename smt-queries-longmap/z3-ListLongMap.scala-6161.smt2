; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79056 () Bool)

(assert start!79056)

(declare-fun b_free!17287 () Bool)

(declare-fun b_next!17287 () Bool)

(assert (=> start!79056 (= b_free!17287 (not b_next!17287))))

(declare-fun tp!60302 () Bool)

(declare-fun b_and!28285 () Bool)

(assert (=> start!79056 (= tp!60302 b_and!28285)))

(declare-fun b!927074 () Bool)

(declare-fun e!520439 () Bool)

(declare-fun tp_is_empty!19795 () Bool)

(assert (=> b!927074 (= e!520439 tp_is_empty!19795)))

(declare-fun b!927075 () Bool)

(declare-fun res!624521 () Bool)

(declare-fun e!520435 () Bool)

(assert (=> b!927075 (=> (not res!624521) (not e!520435))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31359 0))(
  ( (V!31360 (val!9948 Int)) )
))
(declare-datatypes ((tuple2!13042 0))(
  ( (tuple2!13043 (_1!6532 (_ BitVec 64)) (_2!6532 V!31359)) )
))
(declare-datatypes ((List!18812 0))(
  ( (Nil!18809) (Cons!18808 (h!19954 tuple2!13042) (t!26820 List!18812)) )
))
(declare-datatypes ((ListLongMap!11729 0))(
  ( (ListLongMap!11730 (toList!5880 List!18812)) )
))
(declare-fun lt!417688 () ListLongMap!11729)

(declare-fun v!791 () V!31359)

(declare-fun apply!690 (ListLongMap!11729 (_ BitVec 64)) V!31359)

(assert (=> b!927075 (= res!624521 (= (apply!690 lt!417688 k0!1099) v!791))))

(declare-fun b!927077 () Bool)

(declare-datatypes ((Unit!31268 0))(
  ( (Unit!31269) )
))
(declare-fun e!520432 () Unit!31268)

(declare-fun Unit!31270 () Unit!31268)

(assert (=> b!927077 (= e!520432 Unit!31270)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!520434 () Bool)

(declare-fun b!927078 () Bool)

(declare-datatypes ((array!55525 0))(
  ( (array!55526 (arr!26708 (Array (_ BitVec 32) (_ BitVec 64))) (size!27169 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55525)

(declare-fun arrayContainsKey!0 (array!55525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927078 (= e!520434 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927079 () Bool)

(declare-fun e!520436 () Unit!31268)

(assert (=> b!927079 (= e!520436 e!520432)))

(declare-fun lt!417691 () (_ BitVec 64))

(assert (=> b!927079 (= lt!417691 (select (arr!26708 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96786 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927079 (= c!96786 (validKeyInArray!0 lt!417691))))

(declare-fun b!927080 () Bool)

(declare-fun e!520431 () Bool)

(assert (=> b!927080 (= e!520431 e!520435)))

(declare-fun res!624515 () Bool)

(assert (=> b!927080 (=> (not res!624515) (not e!520435))))

(declare-fun contains!4891 (ListLongMap!11729 (_ BitVec 64)) Bool)

(assert (=> b!927080 (= res!624515 (contains!4891 lt!417688 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9416 0))(
  ( (ValueCellFull!9416 (v!12465 V!31359)) (EmptyCell!9416) )
))
(declare-datatypes ((array!55527 0))(
  ( (array!55528 (arr!26709 (Array (_ BitVec 32) ValueCell!9416)) (size!27170 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55527)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31359)

(declare-fun minValue!1173 () V!31359)

(declare-fun getCurrentListMap!3065 (array!55525 array!55527 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 32) Int) ListLongMap!11729)

(assert (=> b!927080 (= lt!417688 (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927081 () Bool)

(declare-fun e!520433 () Bool)

(declare-fun e!520437 () Bool)

(assert (=> b!927081 (= e!520433 e!520437)))

(declare-fun res!624522 () Bool)

(assert (=> b!927081 (=> (not res!624522) (not e!520437))))

(declare-fun lt!417686 () V!31359)

(assert (=> b!927081 (= res!624522 (and (= lt!417686 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!417687 () ListLongMap!11729)

(assert (=> b!927081 (= lt!417686 (apply!690 lt!417687 k0!1099))))

(declare-fun b!927082 () Bool)

(declare-fun Unit!31271 () Unit!31268)

(assert (=> b!927082 (= e!520436 Unit!31271)))

(declare-fun mapIsEmpty!31449 () Bool)

(declare-fun mapRes!31449 () Bool)

(assert (=> mapIsEmpty!31449 mapRes!31449))

(declare-fun b!927076 () Bool)

(assert (=> b!927076 (= e!520437 e!520431)))

(declare-fun res!624519 () Bool)

(assert (=> b!927076 (=> (not res!624519) (not e!520431))))

(assert (=> b!927076 (= res!624519 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27169 _keys!1487)))))

(declare-fun lt!417681 () Unit!31268)

(assert (=> b!927076 (= lt!417681 e!520436)))

(declare-fun c!96787 () Bool)

(assert (=> b!927076 (= c!96787 (validKeyInArray!0 k0!1099))))

(declare-fun res!624518 () Bool)

(declare-fun e!520440 () Bool)

(assert (=> start!79056 (=> (not res!624518) (not e!520440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79056 (= res!624518 (validMask!0 mask!1881))))

(assert (=> start!79056 e!520440))

(assert (=> start!79056 true))

(assert (=> start!79056 tp_is_empty!19795))

(declare-fun e!520443 () Bool)

(declare-fun array_inv!20882 (array!55527) Bool)

(assert (=> start!79056 (and (array_inv!20882 _values!1231) e!520443)))

(assert (=> start!79056 tp!60302))

(declare-fun array_inv!20883 (array!55525) Bool)

(assert (=> start!79056 (array_inv!20883 _keys!1487)))

(declare-fun b!927083 () Bool)

(declare-fun e!520438 () Bool)

(assert (=> b!927083 (= e!520438 tp_is_empty!19795)))

(declare-fun b!927084 () Bool)

(assert (=> b!927084 (= e!520435 (not true))))

(declare-fun e!520442 () Bool)

(assert (=> b!927084 e!520442))

(declare-fun res!624524 () Bool)

(assert (=> b!927084 (=> (not res!624524) (not e!520442))))

(declare-fun lt!417679 () ListLongMap!11729)

(assert (=> b!927084 (= res!624524 (contains!4891 lt!417679 k0!1099))))

(assert (=> b!927084 (= lt!417679 (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417680 () Unit!31268)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!93 (array!55525 array!55527 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 64) V!31359 (_ BitVec 32) Int) Unit!31268)

(assert (=> b!927084 (= lt!417680 (lemmaListMapApplyFromThenApplyFromZero!93 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927085 () Bool)

(declare-fun res!624520 () Bool)

(assert (=> b!927085 (=> (not res!624520) (not e!520440))))

(assert (=> b!927085 (= res!624520 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27169 _keys!1487))))))

(declare-fun b!927086 () Bool)

(assert (=> b!927086 (= e!520440 e!520433)))

(declare-fun res!624523 () Bool)

(assert (=> b!927086 (=> (not res!624523) (not e!520433))))

(assert (=> b!927086 (= res!624523 (contains!4891 lt!417687 k0!1099))))

(assert (=> b!927086 (= lt!417687 (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927087 () Bool)

(assert (=> b!927087 (= e!520434 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927088 () Bool)

(declare-fun lt!417678 () ListLongMap!11729)

(assert (=> b!927088 (= (apply!690 lt!417678 k0!1099) lt!417686)))

(declare-fun lt!417677 () V!31359)

(declare-fun lt!417682 () Unit!31268)

(declare-fun addApplyDifferent!396 (ListLongMap!11729 (_ BitVec 64) V!31359 (_ BitVec 64)) Unit!31268)

(assert (=> b!927088 (= lt!417682 (addApplyDifferent!396 lt!417687 lt!417691 lt!417677 k0!1099))))

(assert (=> b!927088 (not (= lt!417691 k0!1099))))

(declare-fun lt!417684 () Unit!31268)

(declare-datatypes ((List!18813 0))(
  ( (Nil!18810) (Cons!18809 (h!19955 (_ BitVec 64)) (t!26821 List!18813)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55525 (_ BitVec 64) (_ BitVec 32) List!18813) Unit!31268)

(assert (=> b!927088 (= lt!417684 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18810))))

(assert (=> b!927088 e!520434))

(declare-fun c!96785 () Bool)

(assert (=> b!927088 (= c!96785 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417690 () Unit!31268)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!256 (array!55525 array!55527 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 64) (_ BitVec 32) Int) Unit!31268)

(assert (=> b!927088 (= lt!417690 (lemmaListMapContainsThenArrayContainsFrom!256 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55525 (_ BitVec 32) List!18813) Bool)

(assert (=> b!927088 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18810)))

(declare-fun lt!417683 () Unit!31268)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55525 (_ BitVec 32) (_ BitVec 32)) Unit!31268)

(assert (=> b!927088 (= lt!417683 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927088 (contains!4891 lt!417678 k0!1099)))

(declare-fun lt!417689 () tuple2!13042)

(declare-fun +!2768 (ListLongMap!11729 tuple2!13042) ListLongMap!11729)

(assert (=> b!927088 (= lt!417678 (+!2768 lt!417687 lt!417689))))

(declare-fun lt!417685 () Unit!31268)

(declare-fun addStillContains!465 (ListLongMap!11729 (_ BitVec 64) V!31359 (_ BitVec 64)) Unit!31268)

(assert (=> b!927088 (= lt!417685 (addStillContains!465 lt!417687 lt!417691 lt!417677 k0!1099))))

(assert (=> b!927088 (= (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2768 (getCurrentListMap!3065 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417689))))

(assert (=> b!927088 (= lt!417689 (tuple2!13043 lt!417691 lt!417677))))

(declare-fun get!14059 (ValueCell!9416 V!31359) V!31359)

(declare-fun dynLambda!1524 (Int (_ BitVec 64)) V!31359)

(assert (=> b!927088 (= lt!417677 (get!14059 (select (arr!26709 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1524 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417692 () Unit!31268)

(declare-fun lemmaListMapRecursiveValidKeyArray!132 (array!55525 array!55527 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 32) Int) Unit!31268)

(assert (=> b!927088 (= lt!417692 (lemmaListMapRecursiveValidKeyArray!132 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!927088 (= e!520432 lt!417682)))

(declare-fun mapNonEmpty!31449 () Bool)

(declare-fun tp!60303 () Bool)

(assert (=> mapNonEmpty!31449 (= mapRes!31449 (and tp!60303 e!520438))))

(declare-fun mapValue!31449 () ValueCell!9416)

(declare-fun mapRest!31449 () (Array (_ BitVec 32) ValueCell!9416))

(declare-fun mapKey!31449 () (_ BitVec 32))

(assert (=> mapNonEmpty!31449 (= (arr!26709 _values!1231) (store mapRest!31449 mapKey!31449 mapValue!31449))))

(declare-fun b!927089 () Bool)

(declare-fun res!624516 () Bool)

(assert (=> b!927089 (=> (not res!624516) (not e!520440))))

(assert (=> b!927089 (= res!624516 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18810))))

(declare-fun b!927090 () Bool)

(assert (=> b!927090 (= e!520442 (= (apply!690 lt!417679 k0!1099) v!791))))

(declare-fun b!927091 () Bool)

(declare-fun res!624517 () Bool)

(assert (=> b!927091 (=> (not res!624517) (not e!520440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55525 (_ BitVec 32)) Bool)

(assert (=> b!927091 (= res!624517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927092 () Bool)

(declare-fun res!624514 () Bool)

(assert (=> b!927092 (=> (not res!624514) (not e!520440))))

(assert (=> b!927092 (= res!624514 (and (= (size!27170 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27169 _keys!1487) (size!27170 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927093 () Bool)

(assert (=> b!927093 (= e!520443 (and e!520439 mapRes!31449))))

(declare-fun condMapEmpty!31449 () Bool)

(declare-fun mapDefault!31449 () ValueCell!9416)

(assert (=> b!927093 (= condMapEmpty!31449 (= (arr!26709 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9416)) mapDefault!31449)))))

(assert (= (and start!79056 res!624518) b!927092))

(assert (= (and b!927092 res!624514) b!927091))

(assert (= (and b!927091 res!624517) b!927089))

(assert (= (and b!927089 res!624516) b!927085))

(assert (= (and b!927085 res!624520) b!927086))

(assert (= (and b!927086 res!624523) b!927081))

(assert (= (and b!927081 res!624522) b!927076))

(assert (= (and b!927076 c!96787) b!927079))

(assert (= (and b!927076 (not c!96787)) b!927082))

(assert (= (and b!927079 c!96786) b!927088))

(assert (= (and b!927079 (not c!96786)) b!927077))

(assert (= (and b!927088 c!96785) b!927078))

(assert (= (and b!927088 (not c!96785)) b!927087))

(assert (= (and b!927076 res!624519) b!927080))

(assert (= (and b!927080 res!624515) b!927075))

(assert (= (and b!927075 res!624521) b!927084))

(assert (= (and b!927084 res!624524) b!927090))

(assert (= (and b!927093 condMapEmpty!31449) mapIsEmpty!31449))

(assert (= (and b!927093 (not condMapEmpty!31449)) mapNonEmpty!31449))

(get-info :version)

(assert (= (and mapNonEmpty!31449 ((_ is ValueCellFull!9416) mapValue!31449)) b!927083))

(assert (= (and b!927093 ((_ is ValueCellFull!9416) mapDefault!31449)) b!927074))

(assert (= start!79056 b!927093))

(declare-fun b_lambda!13771 () Bool)

(assert (=> (not b_lambda!13771) (not b!927088)))

(declare-fun t!26819 () Bool)

(declare-fun tb!5859 () Bool)

(assert (=> (and start!79056 (= defaultEntry!1235 defaultEntry!1235) t!26819) tb!5859))

(declare-fun result!11549 () Bool)

(assert (=> tb!5859 (= result!11549 tp_is_empty!19795)))

(assert (=> b!927088 t!26819))

(declare-fun b_and!28287 () Bool)

(assert (= b_and!28285 (and (=> t!26819 result!11549) b_and!28287)))

(declare-fun m!861217 () Bool)

(assert (=> start!79056 m!861217))

(declare-fun m!861219 () Bool)

(assert (=> start!79056 m!861219))

(declare-fun m!861221 () Bool)

(assert (=> start!79056 m!861221))

(declare-fun m!861223 () Bool)

(assert (=> b!927076 m!861223))

(declare-fun m!861225 () Bool)

(assert (=> b!927088 m!861225))

(declare-fun m!861227 () Bool)

(assert (=> b!927088 m!861227))

(declare-fun m!861229 () Bool)

(assert (=> b!927088 m!861229))

(declare-fun m!861231 () Bool)

(assert (=> b!927088 m!861231))

(declare-fun m!861233 () Bool)

(assert (=> b!927088 m!861233))

(declare-fun m!861235 () Bool)

(assert (=> b!927088 m!861235))

(declare-fun m!861237 () Bool)

(assert (=> b!927088 m!861237))

(assert (=> b!927088 m!861231))

(assert (=> b!927088 m!861233))

(declare-fun m!861239 () Bool)

(assert (=> b!927088 m!861239))

(declare-fun m!861241 () Bool)

(assert (=> b!927088 m!861241))

(declare-fun m!861243 () Bool)

(assert (=> b!927088 m!861243))

(declare-fun m!861245 () Bool)

(assert (=> b!927088 m!861245))

(declare-fun m!861247 () Bool)

(assert (=> b!927088 m!861247))

(declare-fun m!861249 () Bool)

(assert (=> b!927088 m!861249))

(assert (=> b!927088 m!861225))

(declare-fun m!861251 () Bool)

(assert (=> b!927088 m!861251))

(declare-fun m!861253 () Bool)

(assert (=> b!927088 m!861253))

(declare-fun m!861255 () Bool)

(assert (=> b!927088 m!861255))

(declare-fun m!861257 () Bool)

(assert (=> b!927078 m!861257))

(declare-fun m!861259 () Bool)

(assert (=> b!927089 m!861259))

(declare-fun m!861261 () Bool)

(assert (=> mapNonEmpty!31449 m!861261))

(declare-fun m!861263 () Bool)

(assert (=> b!927084 m!861263))

(declare-fun m!861265 () Bool)

(assert (=> b!927084 m!861265))

(declare-fun m!861267 () Bool)

(assert (=> b!927084 m!861267))

(declare-fun m!861269 () Bool)

(assert (=> b!927080 m!861269))

(assert (=> b!927080 m!861247))

(declare-fun m!861271 () Bool)

(assert (=> b!927090 m!861271))

(declare-fun m!861273 () Bool)

(assert (=> b!927079 m!861273))

(declare-fun m!861275 () Bool)

(assert (=> b!927079 m!861275))

(declare-fun m!861277 () Bool)

(assert (=> b!927075 m!861277))

(declare-fun m!861279 () Bool)

(assert (=> b!927091 m!861279))

(declare-fun m!861281 () Bool)

(assert (=> b!927086 m!861281))

(declare-fun m!861283 () Bool)

(assert (=> b!927086 m!861283))

(declare-fun m!861285 () Bool)

(assert (=> b!927081 m!861285))

(check-sat (not b!927081) (not b_lambda!13771) (not start!79056) b_and!28287 (not b!927090) (not b!927076) (not b_next!17287) (not b!927075) (not b!927084) (not b!927079) (not b!927080) (not b!927088) (not b!927091) (not b!927086) (not mapNonEmpty!31449) tp_is_empty!19795 (not b!927078) (not b!927089))
(check-sat b_and!28287 (not b_next!17287))
