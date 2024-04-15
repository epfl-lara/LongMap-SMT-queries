; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79062 () Bool)

(assert start!79062)

(declare-fun b_free!17293 () Bool)

(declare-fun b_next!17293 () Bool)

(assert (=> start!79062 (= b_free!17293 (not b_next!17293))))

(declare-fun tp!60321 () Bool)

(declare-fun b_and!28297 () Bool)

(assert (=> start!79062 (= tp!60321 b_and!28297)))

(declare-fun b!927260 () Bool)

(declare-fun e!520550 () Bool)

(declare-fun tp_is_empty!19801 () Bool)

(assert (=> b!927260 (= e!520550 tp_is_empty!19801)))

(declare-fun b!927261 () Bool)

(declare-fun e!520551 () Bool)

(declare-fun e!520554 () Bool)

(assert (=> b!927261 (= e!520551 e!520554)))

(declare-fun res!624622 () Bool)

(assert (=> b!927261 (=> (not res!624622) (not e!520554))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55537 0))(
  ( (array!55538 (arr!26714 (Array (_ BitVec 32) (_ BitVec 64))) (size!27175 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55537)

(assert (=> b!927261 (= res!624622 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27175 _keys!1487)))))

(declare-datatypes ((Unit!31278 0))(
  ( (Unit!31279) )
))
(declare-fun lt!417826 () Unit!31278)

(declare-fun e!520556 () Unit!31278)

(assert (=> b!927261 (= lt!417826 e!520556)))

(declare-fun c!96812 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927261 (= c!96812 (validKeyInArray!0 k0!1099))))

(declare-fun b!927262 () Bool)

(declare-fun Unit!31280 () Unit!31278)

(assert (=> b!927262 (= e!520556 Unit!31280)))

(declare-fun b!927263 () Bool)

(declare-fun e!520558 () Bool)

(assert (=> b!927263 (= e!520554 e!520558)))

(declare-fun res!624621 () Bool)

(assert (=> b!927263 (=> (not res!624621) (not e!520558))))

(declare-datatypes ((V!31367 0))(
  ( (V!31368 (val!9951 Int)) )
))
(declare-datatypes ((tuple2!13048 0))(
  ( (tuple2!13049 (_1!6535 (_ BitVec 64)) (_2!6535 V!31367)) )
))
(declare-datatypes ((List!18818 0))(
  ( (Nil!18815) (Cons!18814 (h!19960 tuple2!13048) (t!26832 List!18818)) )
))
(declare-datatypes ((ListLongMap!11735 0))(
  ( (ListLongMap!11736 (toList!5883 List!18818)) )
))
(declare-fun lt!417822 () ListLongMap!11735)

(declare-fun contains!4894 (ListLongMap!11735 (_ BitVec 64)) Bool)

(assert (=> b!927263 (= res!624621 (contains!4894 lt!417822 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9419 0))(
  ( (ValueCellFull!9419 (v!12468 V!31367)) (EmptyCell!9419) )
))
(declare-datatypes ((array!55539 0))(
  ( (array!55540 (arr!26715 (Array (_ BitVec 32) ValueCell!9419)) (size!27176 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55539)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31367)

(declare-fun minValue!1173 () V!31367)

(declare-fun getCurrentListMap!3068 (array!55537 array!55539 (_ BitVec 32) (_ BitVec 32) V!31367 V!31367 (_ BitVec 32) Int) ListLongMap!11735)

(assert (=> b!927263 (= lt!417822 (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927264 () Bool)

(declare-fun lt!417829 () ListLongMap!11735)

(declare-fun lt!417821 () V!31367)

(declare-fun apply!693 (ListLongMap!11735 (_ BitVec 64)) V!31367)

(assert (=> b!927264 (= (apply!693 lt!417829 k0!1099) lt!417821)))

(declare-fun lt!417823 () (_ BitVec 64))

(declare-fun lt!417836 () Unit!31278)

(declare-fun lt!417824 () ListLongMap!11735)

(declare-fun lt!417833 () V!31367)

(declare-fun addApplyDifferent!399 (ListLongMap!11735 (_ BitVec 64) V!31367 (_ BitVec 64)) Unit!31278)

(assert (=> b!927264 (= lt!417836 (addApplyDifferent!399 lt!417824 lt!417823 lt!417833 k0!1099))))

(assert (=> b!927264 (not (= lt!417823 k0!1099))))

(declare-fun lt!417834 () Unit!31278)

(declare-datatypes ((List!18819 0))(
  ( (Nil!18816) (Cons!18815 (h!19961 (_ BitVec 64)) (t!26833 List!18819)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55537 (_ BitVec 64) (_ BitVec 32) List!18819) Unit!31278)

(assert (=> b!927264 (= lt!417834 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18816))))

(declare-fun e!520559 () Bool)

(assert (=> b!927264 e!520559))

(declare-fun c!96813 () Bool)

(assert (=> b!927264 (= c!96813 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417827 () Unit!31278)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!259 (array!55537 array!55539 (_ BitVec 32) (_ BitVec 32) V!31367 V!31367 (_ BitVec 64) (_ BitVec 32) Int) Unit!31278)

(assert (=> b!927264 (= lt!417827 (lemmaListMapContainsThenArrayContainsFrom!259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55537 (_ BitVec 32) List!18819) Bool)

(assert (=> b!927264 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18816)))

(declare-fun lt!417825 () Unit!31278)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55537 (_ BitVec 32) (_ BitVec 32)) Unit!31278)

(assert (=> b!927264 (= lt!417825 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!927264 (contains!4894 lt!417829 k0!1099)))

(declare-fun lt!417830 () tuple2!13048)

(declare-fun +!2771 (ListLongMap!11735 tuple2!13048) ListLongMap!11735)

(assert (=> b!927264 (= lt!417829 (+!2771 lt!417824 lt!417830))))

(declare-fun lt!417832 () Unit!31278)

(declare-fun addStillContains!468 (ListLongMap!11735 (_ BitVec 64) V!31367 (_ BitVec 64)) Unit!31278)

(assert (=> b!927264 (= lt!417832 (addStillContains!468 lt!417824 lt!417823 lt!417833 k0!1099))))

(assert (=> b!927264 (= (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2771 (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417830))))

(assert (=> b!927264 (= lt!417830 (tuple2!13049 lt!417823 lt!417833))))

(declare-fun get!14064 (ValueCell!9419 V!31367) V!31367)

(declare-fun dynLambda!1527 (Int (_ BitVec 64)) V!31367)

(assert (=> b!927264 (= lt!417833 (get!14064 (select (arr!26715 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1527 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417828 () Unit!31278)

(declare-fun lemmaListMapRecursiveValidKeyArray!135 (array!55537 array!55539 (_ BitVec 32) (_ BitVec 32) V!31367 V!31367 (_ BitVec 32) Int) Unit!31278)

(assert (=> b!927264 (= lt!417828 (lemmaListMapRecursiveValidKeyArray!135 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520557 () Unit!31278)

(assert (=> b!927264 (= e!520557 lt!417836)))

(declare-fun b!927265 () Bool)

(declare-fun arrayContainsKey!0 (array!55537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927265 (= e!520559 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!927266 () Bool)

(declare-fun res!624615 () Bool)

(assert (=> b!927266 (=> (not res!624615) (not e!520558))))

(declare-fun v!791 () V!31367)

(assert (=> b!927266 (= res!624615 (= (apply!693 lt!417822 k0!1099) v!791))))

(declare-fun b!927267 () Bool)

(declare-fun e!520549 () Bool)

(assert (=> b!927267 (= e!520549 e!520551)))

(declare-fun res!624620 () Bool)

(assert (=> b!927267 (=> (not res!624620) (not e!520551))))

(assert (=> b!927267 (= res!624620 (and (= lt!417821 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927267 (= lt!417821 (apply!693 lt!417824 k0!1099))))

(declare-fun b!927268 () Bool)

(declare-fun res!624617 () Bool)

(declare-fun e!520552 () Bool)

(assert (=> b!927268 (=> (not res!624617) (not e!520552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55537 (_ BitVec 32)) Bool)

(assert (=> b!927268 (= res!624617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927269 () Bool)

(assert (=> b!927269 (= e!520556 e!520557)))

(assert (=> b!927269 (= lt!417823 (select (arr!26714 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96814 () Bool)

(assert (=> b!927269 (= c!96814 (validKeyInArray!0 lt!417823))))

(declare-fun res!624623 () Bool)

(assert (=> start!79062 (=> (not res!624623) (not e!520552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79062 (= res!624623 (validMask!0 mask!1881))))

(assert (=> start!79062 e!520552))

(assert (=> start!79062 true))

(assert (=> start!79062 tp_is_empty!19801))

(declare-fun e!520553 () Bool)

(declare-fun array_inv!20888 (array!55539) Bool)

(assert (=> start!79062 (and (array_inv!20888 _values!1231) e!520553)))

(assert (=> start!79062 tp!60321))

(declare-fun array_inv!20889 (array!55537) Bool)

(assert (=> start!79062 (array_inv!20889 _keys!1487)))

(declare-fun mapIsEmpty!31458 () Bool)

(declare-fun mapRes!31458 () Bool)

(assert (=> mapIsEmpty!31458 mapRes!31458))

(declare-fun mapNonEmpty!31458 () Bool)

(declare-fun tp!60320 () Bool)

(assert (=> mapNonEmpty!31458 (= mapRes!31458 (and tp!60320 e!520550))))

(declare-fun mapRest!31458 () (Array (_ BitVec 32) ValueCell!9419))

(declare-fun mapValue!31458 () ValueCell!9419)

(declare-fun mapKey!31458 () (_ BitVec 32))

(assert (=> mapNonEmpty!31458 (= (arr!26715 _values!1231) (store mapRest!31458 mapKey!31458 mapValue!31458))))

(declare-fun b!927270 () Bool)

(declare-fun e!520555 () Bool)

(assert (=> b!927270 (= e!520555 tp_is_empty!19801)))

(declare-fun lt!417831 () ListLongMap!11735)

(declare-fun b!927271 () Bool)

(declare-fun e!520560 () Bool)

(assert (=> b!927271 (= e!520560 (= (apply!693 lt!417831 k0!1099) v!791))))

(declare-fun b!927272 () Bool)

(declare-fun Unit!31281 () Unit!31278)

(assert (=> b!927272 (= e!520557 Unit!31281)))

(declare-fun b!927273 () Bool)

(assert (=> b!927273 (= e!520553 (and e!520555 mapRes!31458))))

(declare-fun condMapEmpty!31458 () Bool)

(declare-fun mapDefault!31458 () ValueCell!9419)

(assert (=> b!927273 (= condMapEmpty!31458 (= (arr!26715 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9419)) mapDefault!31458)))))

(declare-fun b!927274 () Bool)

(assert (=> b!927274 (= e!520559 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927275 () Bool)

(declare-fun res!624614 () Bool)

(assert (=> b!927275 (=> (not res!624614) (not e!520552))))

(assert (=> b!927275 (= res!624614 (and (= (size!27176 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27175 _keys!1487) (size!27176 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927276 () Bool)

(declare-fun res!624613 () Bool)

(assert (=> b!927276 (=> (not res!624613) (not e!520552))))

(assert (=> b!927276 (= res!624613 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27175 _keys!1487))))))

(declare-fun b!927277 () Bool)

(declare-fun res!624616 () Bool)

(assert (=> b!927277 (=> (not res!624616) (not e!520552))))

(assert (=> b!927277 (= res!624616 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18816))))

(declare-fun b!927278 () Bool)

(assert (=> b!927278 (= e!520552 e!520549)))

(declare-fun res!624619 () Bool)

(assert (=> b!927278 (=> (not res!624619) (not e!520549))))

(assert (=> b!927278 (= res!624619 (contains!4894 lt!417824 k0!1099))))

(assert (=> b!927278 (= lt!417824 (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927279 () Bool)

(assert (=> b!927279 (= e!520558 (not true))))

(assert (=> b!927279 e!520560))

(declare-fun res!624618 () Bool)

(assert (=> b!927279 (=> (not res!624618) (not e!520560))))

(assert (=> b!927279 (= res!624618 (contains!4894 lt!417831 k0!1099))))

(assert (=> b!927279 (= lt!417831 (getCurrentListMap!3068 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417835 () Unit!31278)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!95 (array!55537 array!55539 (_ BitVec 32) (_ BitVec 32) V!31367 V!31367 (_ BitVec 64) V!31367 (_ BitVec 32) Int) Unit!31278)

(assert (=> b!927279 (= lt!417835 (lemmaListMapApplyFromThenApplyFromZero!95 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!79062 res!624623) b!927275))

(assert (= (and b!927275 res!624614) b!927268))

(assert (= (and b!927268 res!624617) b!927277))

(assert (= (and b!927277 res!624616) b!927276))

(assert (= (and b!927276 res!624613) b!927278))

(assert (= (and b!927278 res!624619) b!927267))

(assert (= (and b!927267 res!624620) b!927261))

(assert (= (and b!927261 c!96812) b!927269))

(assert (= (and b!927261 (not c!96812)) b!927262))

(assert (= (and b!927269 c!96814) b!927264))

(assert (= (and b!927269 (not c!96814)) b!927272))

(assert (= (and b!927264 c!96813) b!927265))

(assert (= (and b!927264 (not c!96813)) b!927274))

(assert (= (and b!927261 res!624622) b!927263))

(assert (= (and b!927263 res!624621) b!927266))

(assert (= (and b!927266 res!624615) b!927279))

(assert (= (and b!927279 res!624618) b!927271))

(assert (= (and b!927273 condMapEmpty!31458) mapIsEmpty!31458))

(assert (= (and b!927273 (not condMapEmpty!31458)) mapNonEmpty!31458))

(get-info :version)

(assert (= (and mapNonEmpty!31458 ((_ is ValueCellFull!9419) mapValue!31458)) b!927260))

(assert (= (and b!927273 ((_ is ValueCellFull!9419) mapDefault!31458)) b!927270))

(assert (= start!79062 b!927273))

(declare-fun b_lambda!13777 () Bool)

(assert (=> (not b_lambda!13777) (not b!927264)))

(declare-fun t!26831 () Bool)

(declare-fun tb!5865 () Bool)

(assert (=> (and start!79062 (= defaultEntry!1235 defaultEntry!1235) t!26831) tb!5865))

(declare-fun result!11561 () Bool)

(assert (=> tb!5865 (= result!11561 tp_is_empty!19801)))

(assert (=> b!927264 t!26831))

(declare-fun b_and!28299 () Bool)

(assert (= b_and!28297 (and (=> t!26831 result!11561) b_and!28299)))

(declare-fun m!861427 () Bool)

(assert (=> b!927266 m!861427))

(declare-fun m!861429 () Bool)

(assert (=> b!927279 m!861429))

(declare-fun m!861431 () Bool)

(assert (=> b!927279 m!861431))

(declare-fun m!861433 () Bool)

(assert (=> b!927279 m!861433))

(declare-fun m!861435 () Bool)

(assert (=> b!927269 m!861435))

(declare-fun m!861437 () Bool)

(assert (=> b!927269 m!861437))

(declare-fun m!861439 () Bool)

(assert (=> b!927264 m!861439))

(declare-fun m!861441 () Bool)

(assert (=> b!927264 m!861441))

(declare-fun m!861443 () Bool)

(assert (=> b!927264 m!861443))

(assert (=> b!927264 m!861441))

(declare-fun m!861445 () Bool)

(assert (=> b!927264 m!861445))

(declare-fun m!861447 () Bool)

(assert (=> b!927264 m!861447))

(declare-fun m!861449 () Bool)

(assert (=> b!927264 m!861449))

(declare-fun m!861451 () Bool)

(assert (=> b!927264 m!861451))

(assert (=> b!927264 m!861443))

(declare-fun m!861453 () Bool)

(assert (=> b!927264 m!861453))

(declare-fun m!861455 () Bool)

(assert (=> b!927264 m!861455))

(declare-fun m!861457 () Bool)

(assert (=> b!927264 m!861457))

(declare-fun m!861459 () Bool)

(assert (=> b!927264 m!861459))

(assert (=> b!927264 m!861457))

(declare-fun m!861461 () Bool)

(assert (=> b!927264 m!861461))

(declare-fun m!861463 () Bool)

(assert (=> b!927264 m!861463))

(declare-fun m!861465 () Bool)

(assert (=> b!927264 m!861465))

(declare-fun m!861467 () Bool)

(assert (=> b!927264 m!861467))

(declare-fun m!861469 () Bool)

(assert (=> b!927264 m!861469))

(declare-fun m!861471 () Bool)

(assert (=> b!927263 m!861471))

(assert (=> b!927263 m!861455))

(declare-fun m!861473 () Bool)

(assert (=> b!927278 m!861473))

(declare-fun m!861475 () Bool)

(assert (=> b!927278 m!861475))

(declare-fun m!861477 () Bool)

(assert (=> start!79062 m!861477))

(declare-fun m!861479 () Bool)

(assert (=> start!79062 m!861479))

(declare-fun m!861481 () Bool)

(assert (=> start!79062 m!861481))

(declare-fun m!861483 () Bool)

(assert (=> mapNonEmpty!31458 m!861483))

(declare-fun m!861485 () Bool)

(assert (=> b!927277 m!861485))

(declare-fun m!861487 () Bool)

(assert (=> b!927271 m!861487))

(declare-fun m!861489 () Bool)

(assert (=> b!927268 m!861489))

(declare-fun m!861491 () Bool)

(assert (=> b!927261 m!861491))

(declare-fun m!861493 () Bool)

(assert (=> b!927267 m!861493))

(declare-fun m!861495 () Bool)

(assert (=> b!927265 m!861495))

(check-sat (not b!927277) (not b_lambda!13777) (not b!927263) tp_is_empty!19801 (not b!927278) (not b!927269) (not mapNonEmpty!31458) (not b!927279) (not b!927261) (not b!927264) (not b!927265) (not b!927267) (not b!927268) (not start!79062) (not b!927271) (not b_next!17293) b_and!28299 (not b!927266))
(check-sat b_and!28299 (not b_next!17293))
