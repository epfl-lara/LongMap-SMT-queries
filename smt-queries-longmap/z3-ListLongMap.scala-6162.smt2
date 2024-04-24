; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79248 () Bool)

(assert start!79248)

(declare-fun b_free!17293 () Bool)

(declare-fun b_next!17293 () Bool)

(assert (=> start!79248 (= b_free!17293 (not b_next!17293))))

(declare-fun tp!60320 () Bool)

(declare-fun b_and!28333 () Bool)

(assert (=> start!79248 (= tp!60320 b_and!28333)))

(declare-fun b!928403 () Bool)

(declare-datatypes ((V!31367 0))(
  ( (V!31368 (val!9951 Int)) )
))
(declare-datatypes ((tuple2!12980 0))(
  ( (tuple2!12981 (_1!6501 (_ BitVec 64)) (_2!6501 V!31367)) )
))
(declare-datatypes ((List!18788 0))(
  ( (Nil!18785) (Cons!18784 (h!19936 tuple2!12980) (t!26803 List!18788)) )
))
(declare-datatypes ((ListLongMap!11679 0))(
  ( (ListLongMap!11680 (toList!5855 List!18788)) )
))
(declare-fun lt!418430 () ListLongMap!11679)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!418432 () V!31367)

(declare-fun apply!705 (ListLongMap!11679 (_ BitVec 64)) V!31367)

(assert (=> b!928403 (= (apply!705 lt!418430 k0!1099) lt!418432)))

(declare-fun lt!418419 () ListLongMap!11679)

(declare-datatypes ((Unit!31365 0))(
  ( (Unit!31366) )
))
(declare-fun lt!418426 () Unit!31365)

(declare-fun lt!418422 () (_ BitVec 64))

(declare-fun lt!418421 () V!31367)

(declare-fun addApplyDifferent!402 (ListLongMap!11679 (_ BitVec 64) V!31367 (_ BitVec 64)) Unit!31365)

(assert (=> b!928403 (= lt!418426 (addApplyDifferent!402 lt!418419 lt!418422 lt!418421 k0!1099))))

(assert (=> b!928403 (not (= lt!418422 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!418423 () Unit!31365)

(declare-datatypes ((array!55617 0))(
  ( (array!55618 (arr!26749 (Array (_ BitVec 32) (_ BitVec 64))) (size!27209 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55617)

(declare-datatypes ((List!18789 0))(
  ( (Nil!18786) (Cons!18785 (h!19937 (_ BitVec 64)) (t!26804 List!18789)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55617 (_ BitVec 64) (_ BitVec 32) List!18789) Unit!31365)

(assert (=> b!928403 (= lt!418423 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18786))))

(declare-fun e!521283 () Bool)

(assert (=> b!928403 e!521283))

(declare-fun c!97161 () Bool)

(assert (=> b!928403 (= c!97161 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!418433 () Unit!31365)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9419 0))(
  ( (ValueCellFull!9419 (v!12466 V!31367)) (EmptyCell!9419) )
))
(declare-datatypes ((array!55619 0))(
  ( (array!55620 (arr!26750 (Array (_ BitVec 32) ValueCell!9419)) (size!27210 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55619)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31367)

(declare-fun minValue!1173 () V!31367)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!257 (array!55617 array!55619 (_ BitVec 32) (_ BitVec 32) V!31367 V!31367 (_ BitVec 64) (_ BitVec 32) Int) Unit!31365)

(assert (=> b!928403 (= lt!418433 (lemmaListMapContainsThenArrayContainsFrom!257 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55617 (_ BitVec 32) List!18789) Bool)

(assert (=> b!928403 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18786)))

(declare-fun lt!418425 () Unit!31365)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55617 (_ BitVec 32) (_ BitVec 32)) Unit!31365)

(assert (=> b!928403 (= lt!418425 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4927 (ListLongMap!11679 (_ BitVec 64)) Bool)

(assert (=> b!928403 (contains!4927 lt!418430 k0!1099)))

(declare-fun lt!418431 () tuple2!12980)

(declare-fun +!2766 (ListLongMap!11679 tuple2!12980) ListLongMap!11679)

(assert (=> b!928403 (= lt!418430 (+!2766 lt!418419 lt!418431))))

(declare-fun lt!418428 () Unit!31365)

(declare-fun addStillContains!475 (ListLongMap!11679 (_ BitVec 64) V!31367 (_ BitVec 64)) Unit!31365)

(assert (=> b!928403 (= lt!418428 (addStillContains!475 lt!418419 lt!418422 lt!418421 k0!1099))))

(declare-fun getCurrentListMap!3105 (array!55617 array!55619 (_ BitVec 32) (_ BitVec 32) V!31367 V!31367 (_ BitVec 32) Int) ListLongMap!11679)

(assert (=> b!928403 (= (getCurrentListMap!3105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2766 (getCurrentListMap!3105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418431))))

(assert (=> b!928403 (= lt!418431 (tuple2!12981 lt!418422 lt!418421))))

(declare-fun get!14099 (ValueCell!9419 V!31367) V!31367)

(declare-fun dynLambda!1563 (Int (_ BitVec 64)) V!31367)

(assert (=> b!928403 (= lt!418421 (get!14099 (select (arr!26750 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1563 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418418 () Unit!31365)

(declare-fun lemmaListMapRecursiveValidKeyArray!146 (array!55617 array!55619 (_ BitVec 32) (_ BitVec 32) V!31367 V!31367 (_ BitVec 32) Int) Unit!31365)

(assert (=> b!928403 (= lt!418418 (lemmaListMapRecursiveValidKeyArray!146 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!521278 () Unit!31365)

(assert (=> b!928403 (= e!521278 lt!418426)))

(declare-fun b!928404 () Bool)

(declare-fun e!521285 () Bool)

(declare-fun e!521282 () Bool)

(assert (=> b!928404 (= e!521285 e!521282)))

(declare-fun res!625075 () Bool)

(assert (=> b!928404 (=> (not res!625075) (not e!521282))))

(assert (=> b!928404 (= res!625075 (contains!4927 lt!418419 k0!1099))))

(assert (=> b!928404 (= lt!418419 (getCurrentListMap!3105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31458 () Bool)

(declare-fun mapRes!31458 () Bool)

(declare-fun tp!60321 () Bool)

(declare-fun e!521284 () Bool)

(assert (=> mapNonEmpty!31458 (= mapRes!31458 (and tp!60321 e!521284))))

(declare-fun mapValue!31458 () ValueCell!9419)

(declare-fun mapKey!31458 () (_ BitVec 32))

(declare-fun mapRest!31458 () (Array (_ BitVec 32) ValueCell!9419))

(assert (=> mapNonEmpty!31458 (= (arr!26750 _values!1231) (store mapRest!31458 mapKey!31458 mapValue!31458))))

(declare-fun b!928405 () Bool)

(declare-fun tp_is_empty!19801 () Bool)

(assert (=> b!928405 (= e!521284 tp_is_empty!19801)))

(declare-fun mapIsEmpty!31458 () Bool)

(assert (=> mapIsEmpty!31458 mapRes!31458))

(declare-fun b!928406 () Bool)

(declare-fun e!521286 () Bool)

(assert (=> b!928406 (= e!521286 (not true))))

(declare-fun e!521289 () Bool)

(assert (=> b!928406 e!521289))

(declare-fun res!625073 () Bool)

(assert (=> b!928406 (=> (not res!625073) (not e!521289))))

(declare-fun lt!418424 () ListLongMap!11679)

(assert (=> b!928406 (= res!625073 (contains!4927 lt!418424 k0!1099))))

(assert (=> b!928406 (= lt!418424 (getCurrentListMap!3105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418420 () Unit!31365)

(declare-fun v!791 () V!31367)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!95 (array!55617 array!55619 (_ BitVec 32) (_ BitVec 32) V!31367 V!31367 (_ BitVec 64) V!31367 (_ BitVec 32) Int) Unit!31365)

(assert (=> b!928406 (= lt!418420 (lemmaListMapApplyFromThenApplyFromZero!95 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928407 () Bool)

(declare-fun res!625067 () Bool)

(assert (=> b!928407 (=> (not res!625067) (not e!521285))))

(assert (=> b!928407 (= res!625067 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27209 _keys!1487))))))

(declare-fun b!928408 () Bool)

(declare-fun res!625077 () Bool)

(assert (=> b!928408 (=> (not res!625077) (not e!521286))))

(declare-fun lt!418429 () ListLongMap!11679)

(assert (=> b!928408 (= res!625077 (= (apply!705 lt!418429 k0!1099) v!791))))

(declare-fun b!928409 () Bool)

(declare-fun e!521288 () Bool)

(assert (=> b!928409 (= e!521288 tp_is_empty!19801)))

(declare-fun b!928410 () Bool)

(declare-fun res!625068 () Bool)

(assert (=> b!928410 (=> (not res!625068) (not e!521285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55617 (_ BitVec 32)) Bool)

(assert (=> b!928410 (= res!625068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928411 () Bool)

(declare-fun arrayContainsKey!0 (array!55617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928411 (= e!521283 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928412 () Bool)

(declare-fun res!625072 () Bool)

(assert (=> b!928412 (=> (not res!625072) (not e!521285))))

(assert (=> b!928412 (= res!625072 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18786))))

(declare-fun b!928413 () Bool)

(declare-fun e!521287 () Bool)

(assert (=> b!928413 (= e!521287 e!521286)))

(declare-fun res!625074 () Bool)

(assert (=> b!928413 (=> (not res!625074) (not e!521286))))

(assert (=> b!928413 (= res!625074 (contains!4927 lt!418429 k0!1099))))

(assert (=> b!928413 (= lt!418429 (getCurrentListMap!3105 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928414 () Bool)

(declare-fun e!521280 () Unit!31365)

(assert (=> b!928414 (= e!521280 e!521278)))

(assert (=> b!928414 (= lt!418422 (select (arr!26749 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97159 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928414 (= c!97159 (validKeyInArray!0 lt!418422))))

(declare-fun b!928415 () Bool)

(declare-fun e!521290 () Bool)

(assert (=> b!928415 (= e!521282 e!521290)))

(declare-fun res!625071 () Bool)

(assert (=> b!928415 (=> (not res!625071) (not e!521290))))

(assert (=> b!928415 (= res!625071 (and (= lt!418432 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!928415 (= lt!418432 (apply!705 lt!418419 k0!1099))))

(declare-fun b!928416 () Bool)

(declare-fun Unit!31367 () Unit!31365)

(assert (=> b!928416 (= e!521278 Unit!31367)))

(declare-fun b!928417 () Bool)

(declare-fun res!625069 () Bool)

(assert (=> b!928417 (=> (not res!625069) (not e!521285))))

(assert (=> b!928417 (= res!625069 (and (= (size!27210 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27209 _keys!1487) (size!27210 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928402 () Bool)

(assert (=> b!928402 (= e!521283 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!625076 () Bool)

(assert (=> start!79248 (=> (not res!625076) (not e!521285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79248 (= res!625076 (validMask!0 mask!1881))))

(assert (=> start!79248 e!521285))

(assert (=> start!79248 true))

(assert (=> start!79248 tp_is_empty!19801))

(declare-fun e!521281 () Bool)

(declare-fun array_inv!20930 (array!55619) Bool)

(assert (=> start!79248 (and (array_inv!20930 _values!1231) e!521281)))

(assert (=> start!79248 tp!60320))

(declare-fun array_inv!20931 (array!55617) Bool)

(assert (=> start!79248 (array_inv!20931 _keys!1487)))

(declare-fun b!928418 () Bool)

(declare-fun Unit!31368 () Unit!31365)

(assert (=> b!928418 (= e!521280 Unit!31368)))

(declare-fun b!928419 () Bool)

(assert (=> b!928419 (= e!521290 e!521287)))

(declare-fun res!625070 () Bool)

(assert (=> b!928419 (=> (not res!625070) (not e!521287))))

(assert (=> b!928419 (= res!625070 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27209 _keys!1487)))))

(declare-fun lt!418427 () Unit!31365)

(assert (=> b!928419 (= lt!418427 e!521280)))

(declare-fun c!97160 () Bool)

(assert (=> b!928419 (= c!97160 (validKeyInArray!0 k0!1099))))

(declare-fun b!928420 () Bool)

(assert (=> b!928420 (= e!521281 (and e!521288 mapRes!31458))))

(declare-fun condMapEmpty!31458 () Bool)

(declare-fun mapDefault!31458 () ValueCell!9419)

(assert (=> b!928420 (= condMapEmpty!31458 (= (arr!26750 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9419)) mapDefault!31458)))))

(declare-fun b!928421 () Bool)

(assert (=> b!928421 (= e!521289 (= (apply!705 lt!418424 k0!1099) v!791))))

(assert (= (and start!79248 res!625076) b!928417))

(assert (= (and b!928417 res!625069) b!928410))

(assert (= (and b!928410 res!625068) b!928412))

(assert (= (and b!928412 res!625072) b!928407))

(assert (= (and b!928407 res!625067) b!928404))

(assert (= (and b!928404 res!625075) b!928415))

(assert (= (and b!928415 res!625071) b!928419))

(assert (= (and b!928419 c!97160) b!928414))

(assert (= (and b!928419 (not c!97160)) b!928418))

(assert (= (and b!928414 c!97159) b!928403))

(assert (= (and b!928414 (not c!97159)) b!928416))

(assert (= (and b!928403 c!97161) b!928411))

(assert (= (and b!928403 (not c!97161)) b!928402))

(assert (= (and b!928419 res!625070) b!928413))

(assert (= (and b!928413 res!625074) b!928408))

(assert (= (and b!928408 res!625077) b!928406))

(assert (= (and b!928406 res!625073) b!928421))

(assert (= (and b!928420 condMapEmpty!31458) mapIsEmpty!31458))

(assert (= (and b!928420 (not condMapEmpty!31458)) mapNonEmpty!31458))

(get-info :version)

(assert (= (and mapNonEmpty!31458 ((_ is ValueCellFull!9419) mapValue!31458)) b!928405))

(assert (= (and b!928420 ((_ is ValueCellFull!9419) mapDefault!31458)) b!928409))

(assert (= start!79248 b!928420))

(declare-fun b_lambda!13809 () Bool)

(assert (=> (not b_lambda!13809) (not b!928403)))

(declare-fun t!26802 () Bool)

(declare-fun tb!5865 () Bool)

(assert (=> (and start!79248 (= defaultEntry!1235 defaultEntry!1235) t!26802) tb!5865))

(declare-fun result!11561 () Bool)

(assert (=> tb!5865 (= result!11561 tp_is_empty!19801)))

(assert (=> b!928403 t!26802))

(declare-fun b_and!28335 () Bool)

(assert (= b_and!28333 (and (=> t!26802 result!11561) b_and!28335)))

(declare-fun m!863479 () Bool)

(assert (=> b!928406 m!863479))

(declare-fun m!863481 () Bool)

(assert (=> b!928406 m!863481))

(declare-fun m!863483 () Bool)

(assert (=> b!928406 m!863483))

(declare-fun m!863485 () Bool)

(assert (=> b!928411 m!863485))

(declare-fun m!863487 () Bool)

(assert (=> start!79248 m!863487))

(declare-fun m!863489 () Bool)

(assert (=> start!79248 m!863489))

(declare-fun m!863491 () Bool)

(assert (=> start!79248 m!863491))

(declare-fun m!863493 () Bool)

(assert (=> b!928412 m!863493))

(declare-fun m!863495 () Bool)

(assert (=> b!928421 m!863495))

(declare-fun m!863497 () Bool)

(assert (=> b!928413 m!863497))

(declare-fun m!863499 () Bool)

(assert (=> b!928413 m!863499))

(declare-fun m!863501 () Bool)

(assert (=> b!928408 m!863501))

(declare-fun m!863503 () Bool)

(assert (=> b!928414 m!863503))

(declare-fun m!863505 () Bool)

(assert (=> b!928414 m!863505))

(declare-fun m!863507 () Bool)

(assert (=> b!928404 m!863507))

(declare-fun m!863509 () Bool)

(assert (=> b!928404 m!863509))

(declare-fun m!863511 () Bool)

(assert (=> b!928410 m!863511))

(declare-fun m!863513 () Bool)

(assert (=> b!928403 m!863513))

(declare-fun m!863515 () Bool)

(assert (=> b!928403 m!863515))

(declare-fun m!863517 () Bool)

(assert (=> b!928403 m!863517))

(declare-fun m!863519 () Bool)

(assert (=> b!928403 m!863519))

(declare-fun m!863521 () Bool)

(assert (=> b!928403 m!863521))

(declare-fun m!863523 () Bool)

(assert (=> b!928403 m!863523))

(declare-fun m!863525 () Bool)

(assert (=> b!928403 m!863525))

(declare-fun m!863527 () Bool)

(assert (=> b!928403 m!863527))

(assert (=> b!928403 m!863523))

(assert (=> b!928403 m!863527))

(declare-fun m!863529 () Bool)

(assert (=> b!928403 m!863529))

(assert (=> b!928403 m!863499))

(declare-fun m!863531 () Bool)

(assert (=> b!928403 m!863531))

(declare-fun m!863533 () Bool)

(assert (=> b!928403 m!863533))

(declare-fun m!863535 () Bool)

(assert (=> b!928403 m!863535))

(declare-fun m!863537 () Bool)

(assert (=> b!928403 m!863537))

(declare-fun m!863539 () Bool)

(assert (=> b!928403 m!863539))

(assert (=> b!928403 m!863535))

(declare-fun m!863541 () Bool)

(assert (=> b!928403 m!863541))

(declare-fun m!863543 () Bool)

(assert (=> b!928419 m!863543))

(declare-fun m!863545 () Bool)

(assert (=> b!928415 m!863545))

(declare-fun m!863547 () Bool)

(assert (=> mapNonEmpty!31458 m!863547))

(check-sat (not b!928414) (not b!928413) (not start!79248) (not mapNonEmpty!31458) (not b!928415) (not b!928403) tp_is_empty!19801 (not b!928408) (not b!928421) (not b!928411) (not b!928412) (not b!928410) b_and!28335 (not b!928419) (not b!928404) (not b_next!17293) (not b!928406) (not b_lambda!13809))
(check-sat b_and!28335 (not b_next!17293))
