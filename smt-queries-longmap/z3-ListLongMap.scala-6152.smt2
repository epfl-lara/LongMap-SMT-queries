; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79002 () Bool)

(assert start!79002)

(declare-fun b_free!17233 () Bool)

(declare-fun b_next!17233 () Bool)

(assert (=> start!79002 (= b_free!17233 (not b_next!17233))))

(declare-fun tp!60141 () Bool)

(declare-fun b_and!28177 () Bool)

(assert (=> start!79002 (= tp!60141 b_and!28177)))

(declare-fun b!925400 () Bool)

(declare-fun res!623629 () Bool)

(declare-fun e!519387 () Bool)

(assert (=> b!925400 (=> (not res!623629) (not e!519387))))

(declare-datatypes ((array!55425 0))(
  ( (array!55426 (arr!26658 (Array (_ BitVec 32) (_ BitVec 64))) (size!27119 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55425)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55425 (_ BitVec 32)) Bool)

(assert (=> b!925400 (= res!623629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925401 () Bool)

(declare-datatypes ((Unit!31185 0))(
  ( (Unit!31186) )
))
(declare-fun e!519388 () Unit!31185)

(declare-fun e!519383 () Unit!31185)

(assert (=> b!925401 (= e!519388 e!519383)))

(declare-fun lt!416382 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!925401 (= lt!416382 (select (arr!26658 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96544 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925401 (= c!96544 (validKeyInArray!0 lt!416382))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31287 0))(
  ( (V!31288 (val!9921 Int)) )
))
(declare-fun v!791 () V!31287)

(declare-datatypes ((tuple2!12998 0))(
  ( (tuple2!12999 (_1!6510 (_ BitVec 64)) (_2!6510 V!31287)) )
))
(declare-datatypes ((List!18772 0))(
  ( (Nil!18769) (Cons!18768 (h!19914 tuple2!12998) (t!26726 List!18772)) )
))
(declare-datatypes ((ListLongMap!11685 0))(
  ( (ListLongMap!11686 (toList!5858 List!18772)) )
))
(declare-fun lt!416385 () ListLongMap!11685)

(declare-fun e!519379 () Bool)

(declare-fun b!925402 () Bool)

(declare-fun apply!669 (ListLongMap!11685 (_ BitVec 64)) V!31287)

(assert (=> b!925402 (= e!519379 (= (apply!669 lt!416385 k0!1099) v!791))))

(declare-fun b!925403 () Bool)

(declare-fun e!519385 () Bool)

(declare-fun e!519382 () Bool)

(declare-fun mapRes!31368 () Bool)

(assert (=> b!925403 (= e!519385 (and e!519382 mapRes!31368))))

(declare-fun condMapEmpty!31368 () Bool)

(declare-datatypes ((ValueCell!9389 0))(
  ( (ValueCellFull!9389 (v!12438 V!31287)) (EmptyCell!9389) )
))
(declare-datatypes ((array!55427 0))(
  ( (array!55428 (arr!26659 (Array (_ BitVec 32) ValueCell!9389)) (size!27120 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55427)

(declare-fun mapDefault!31368 () ValueCell!9389)

(assert (=> b!925403 (= condMapEmpty!31368 (= (arr!26659 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9389)) mapDefault!31368)))))

(declare-fun b!925404 () Bool)

(declare-fun e!519389 () Bool)

(declare-fun e!519378 () Bool)

(assert (=> b!925404 (= e!519389 e!519378)))

(declare-fun res!623631 () Bool)

(assert (=> b!925404 (=> (not res!623631) (not e!519378))))

(declare-fun lt!416391 () V!31287)

(assert (=> b!925404 (= res!623631 (and (= lt!416391 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!416388 () ListLongMap!11685)

(assert (=> b!925404 (= lt!416391 (apply!669 lt!416388 k0!1099))))

(declare-fun b!925405 () Bool)

(declare-fun res!623624 () Bool)

(assert (=> b!925405 (=> (not res!623624) (not e!519387))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!925405 (= res!623624 (and (= (size!27120 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27119 _keys!1487) (size!27120 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925406 () Bool)

(declare-fun e!519386 () Bool)

(declare-fun e!519380 () Bool)

(assert (=> b!925406 (= e!519386 e!519380)))

(declare-fun res!623633 () Bool)

(assert (=> b!925406 (=> (not res!623633) (not e!519380))))

(declare-fun lt!416394 () ListLongMap!11685)

(declare-fun contains!4870 (ListLongMap!11685 (_ BitVec 64)) Bool)

(assert (=> b!925406 (= res!623633 (contains!4870 lt!416394 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31287)

(declare-fun minValue!1173 () V!31287)

(declare-fun getCurrentListMap!3044 (array!55425 array!55427 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 32) Int) ListLongMap!11685)

(assert (=> b!925406 (= lt!416394 (getCurrentListMap!3044 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925407 () Bool)

(declare-fun e!519384 () Bool)

(declare-fun arrayContainsKey!0 (array!55425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925407 (= e!519384 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925408 () Bool)

(declare-fun lt!416395 () ListLongMap!11685)

(assert (=> b!925408 (= (apply!669 lt!416395 k0!1099) lt!416391)))

(declare-fun lt!416390 () V!31287)

(declare-fun lt!416392 () Unit!31185)

(declare-fun addApplyDifferent!381 (ListLongMap!11685 (_ BitVec 64) V!31287 (_ BitVec 64)) Unit!31185)

(assert (=> b!925408 (= lt!416392 (addApplyDifferent!381 lt!416388 lt!416382 lt!416390 k0!1099))))

(assert (=> b!925408 (not (= lt!416382 k0!1099))))

(declare-fun lt!416393 () Unit!31185)

(declare-datatypes ((List!18773 0))(
  ( (Nil!18770) (Cons!18769 (h!19915 (_ BitVec 64)) (t!26727 List!18773)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55425 (_ BitVec 64) (_ BitVec 32) List!18773) Unit!31185)

(assert (=> b!925408 (= lt!416393 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18770))))

(assert (=> b!925408 e!519384))

(declare-fun c!96542 () Bool)

(assert (=> b!925408 (= c!96542 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416386 () Unit!31185)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!241 (array!55425 array!55427 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 64) (_ BitVec 32) Int) Unit!31185)

(assert (=> b!925408 (= lt!416386 (lemmaListMapContainsThenArrayContainsFrom!241 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55425 (_ BitVec 32) List!18773) Bool)

(assert (=> b!925408 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18770)))

(declare-fun lt!416381 () Unit!31185)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55425 (_ BitVec 32) (_ BitVec 32)) Unit!31185)

(assert (=> b!925408 (= lt!416381 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925408 (contains!4870 lt!416395 k0!1099)))

(declare-fun lt!416383 () tuple2!12998)

(declare-fun +!2753 (ListLongMap!11685 tuple2!12998) ListLongMap!11685)

(assert (=> b!925408 (= lt!416395 (+!2753 lt!416388 lt!416383))))

(declare-fun lt!416384 () Unit!31185)

(declare-fun addStillContains!450 (ListLongMap!11685 (_ BitVec 64) V!31287 (_ BitVec 64)) Unit!31185)

(assert (=> b!925408 (= lt!416384 (addStillContains!450 lt!416388 lt!416382 lt!416390 k0!1099))))

(assert (=> b!925408 (= (getCurrentListMap!3044 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2753 (getCurrentListMap!3044 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416383))))

(assert (=> b!925408 (= lt!416383 (tuple2!12999 lt!416382 lt!416390))))

(declare-fun get!14026 (ValueCell!9389 V!31287) V!31287)

(declare-fun dynLambda!1509 (Int (_ BitVec 64)) V!31287)

(assert (=> b!925408 (= lt!416390 (get!14026 (select (arr!26659 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1509 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416396 () Unit!31185)

(declare-fun lemmaListMapRecursiveValidKeyArray!117 (array!55425 array!55427 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 32) Int) Unit!31185)

(assert (=> b!925408 (= lt!416396 (lemmaListMapRecursiveValidKeyArray!117 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925408 (= e!519383 lt!416392)))

(declare-fun b!925409 () Bool)

(assert (=> b!925409 (= e!519384 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925410 () Bool)

(assert (=> b!925410 (= e!519380 (not true))))

(assert (=> b!925410 e!519379))

(declare-fun res!623632 () Bool)

(assert (=> b!925410 (=> (not res!623632) (not e!519379))))

(assert (=> b!925410 (= res!623632 (contains!4870 lt!416385 k0!1099))))

(assert (=> b!925410 (= lt!416385 (getCurrentListMap!3044 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416389 () Unit!31185)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!78 (array!55425 array!55427 (_ BitVec 32) (_ BitVec 32) V!31287 V!31287 (_ BitVec 64) V!31287 (_ BitVec 32) Int) Unit!31185)

(assert (=> b!925410 (= lt!416389 (lemmaListMapApplyFromThenApplyFromZero!78 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925411 () Bool)

(declare-fun Unit!31187 () Unit!31185)

(assert (=> b!925411 (= e!519383 Unit!31187)))

(declare-fun b!925412 () Bool)

(declare-fun e!519381 () Bool)

(declare-fun tp_is_empty!19741 () Bool)

(assert (=> b!925412 (= e!519381 tp_is_empty!19741)))

(declare-fun b!925413 () Bool)

(declare-fun res!623625 () Bool)

(assert (=> b!925413 (=> (not res!623625) (not e!519387))))

(assert (=> b!925413 (= res!623625 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27119 _keys!1487))))))

(declare-fun b!925414 () Bool)

(declare-fun res!623626 () Bool)

(assert (=> b!925414 (=> (not res!623626) (not e!519380))))

(assert (=> b!925414 (= res!623626 (= (apply!669 lt!416394 k0!1099) v!791))))

(declare-fun res!623628 () Bool)

(assert (=> start!79002 (=> (not res!623628) (not e!519387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79002 (= res!623628 (validMask!0 mask!1881))))

(assert (=> start!79002 e!519387))

(assert (=> start!79002 true))

(assert (=> start!79002 tp_is_empty!19741))

(declare-fun array_inv!20844 (array!55427) Bool)

(assert (=> start!79002 (and (array_inv!20844 _values!1231) e!519385)))

(assert (=> start!79002 tp!60141))

(declare-fun array_inv!20845 (array!55425) Bool)

(assert (=> start!79002 (array_inv!20845 _keys!1487)))

(declare-fun b!925415 () Bool)

(assert (=> b!925415 (= e!519378 e!519386)))

(declare-fun res!623630 () Bool)

(assert (=> b!925415 (=> (not res!623630) (not e!519386))))

(assert (=> b!925415 (= res!623630 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27119 _keys!1487)))))

(declare-fun lt!416387 () Unit!31185)

(assert (=> b!925415 (= lt!416387 e!519388)))

(declare-fun c!96543 () Bool)

(assert (=> b!925415 (= c!96543 (validKeyInArray!0 k0!1099))))

(declare-fun b!925416 () Bool)

(declare-fun res!623627 () Bool)

(assert (=> b!925416 (=> (not res!623627) (not e!519387))))

(assert (=> b!925416 (= res!623627 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18770))))

(declare-fun b!925417 () Bool)

(assert (=> b!925417 (= e!519382 tp_is_empty!19741)))

(declare-fun mapNonEmpty!31368 () Bool)

(declare-fun tp!60140 () Bool)

(assert (=> mapNonEmpty!31368 (= mapRes!31368 (and tp!60140 e!519381))))

(declare-fun mapRest!31368 () (Array (_ BitVec 32) ValueCell!9389))

(declare-fun mapKey!31368 () (_ BitVec 32))

(declare-fun mapValue!31368 () ValueCell!9389)

(assert (=> mapNonEmpty!31368 (= (arr!26659 _values!1231) (store mapRest!31368 mapKey!31368 mapValue!31368))))

(declare-fun b!925418 () Bool)

(assert (=> b!925418 (= e!519387 e!519389)))

(declare-fun res!623623 () Bool)

(assert (=> b!925418 (=> (not res!623623) (not e!519389))))

(assert (=> b!925418 (= res!623623 (contains!4870 lt!416388 k0!1099))))

(assert (=> b!925418 (= lt!416388 (getCurrentListMap!3044 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31368 () Bool)

(assert (=> mapIsEmpty!31368 mapRes!31368))

(declare-fun b!925419 () Bool)

(declare-fun Unit!31188 () Unit!31185)

(assert (=> b!925419 (= e!519388 Unit!31188)))

(assert (= (and start!79002 res!623628) b!925405))

(assert (= (and b!925405 res!623624) b!925400))

(assert (= (and b!925400 res!623629) b!925416))

(assert (= (and b!925416 res!623627) b!925413))

(assert (= (and b!925413 res!623625) b!925418))

(assert (= (and b!925418 res!623623) b!925404))

(assert (= (and b!925404 res!623631) b!925415))

(assert (= (and b!925415 c!96543) b!925401))

(assert (= (and b!925415 (not c!96543)) b!925419))

(assert (= (and b!925401 c!96544) b!925408))

(assert (= (and b!925401 (not c!96544)) b!925411))

(assert (= (and b!925408 c!96542) b!925407))

(assert (= (and b!925408 (not c!96542)) b!925409))

(assert (= (and b!925415 res!623630) b!925406))

(assert (= (and b!925406 res!623633) b!925414))

(assert (= (and b!925414 res!623626) b!925410))

(assert (= (and b!925410 res!623632) b!925402))

(assert (= (and b!925403 condMapEmpty!31368) mapIsEmpty!31368))

(assert (= (and b!925403 (not condMapEmpty!31368)) mapNonEmpty!31368))

(get-info :version)

(assert (= (and mapNonEmpty!31368 ((_ is ValueCellFull!9389) mapValue!31368)) b!925412))

(assert (= (and b!925403 ((_ is ValueCellFull!9389) mapDefault!31368)) b!925417))

(assert (= start!79002 b!925403))

(declare-fun b_lambda!13717 () Bool)

(assert (=> (not b_lambda!13717) (not b!925408)))

(declare-fun t!26725 () Bool)

(declare-fun tb!5805 () Bool)

(assert (=> (and start!79002 (= defaultEntry!1235 defaultEntry!1235) t!26725) tb!5805))

(declare-fun result!11441 () Bool)

(assert (=> tb!5805 (= result!11441 tp_is_empty!19741)))

(assert (=> b!925408 t!26725))

(declare-fun b_and!28179 () Bool)

(assert (= b_and!28177 (and (=> t!26725 result!11441) b_and!28179)))

(declare-fun m!859327 () Bool)

(assert (=> b!925408 m!859327))

(declare-fun m!859329 () Bool)

(assert (=> b!925408 m!859329))

(declare-fun m!859331 () Bool)

(assert (=> b!925408 m!859331))

(declare-fun m!859333 () Bool)

(assert (=> b!925408 m!859333))

(declare-fun m!859335 () Bool)

(assert (=> b!925408 m!859335))

(declare-fun m!859337 () Bool)

(assert (=> b!925408 m!859337))

(declare-fun m!859339 () Bool)

(assert (=> b!925408 m!859339))

(declare-fun m!859341 () Bool)

(assert (=> b!925408 m!859341))

(assert (=> b!925408 m!859335))

(declare-fun m!859343 () Bool)

(assert (=> b!925408 m!859343))

(declare-fun m!859345 () Bool)

(assert (=> b!925408 m!859345))

(declare-fun m!859347 () Bool)

(assert (=> b!925408 m!859347))

(declare-fun m!859349 () Bool)

(assert (=> b!925408 m!859349))

(declare-fun m!859351 () Bool)

(assert (=> b!925408 m!859351))

(declare-fun m!859353 () Bool)

(assert (=> b!925408 m!859353))

(declare-fun m!859355 () Bool)

(assert (=> b!925408 m!859355))

(assert (=> b!925408 m!859341))

(assert (=> b!925408 m!859327))

(declare-fun m!859357 () Bool)

(assert (=> b!925408 m!859357))

(declare-fun m!859359 () Bool)

(assert (=> b!925401 m!859359))

(declare-fun m!859361 () Bool)

(assert (=> b!925401 m!859361))

(declare-fun m!859363 () Bool)

(assert (=> b!925415 m!859363))

(declare-fun m!859365 () Bool)

(assert (=> b!925402 m!859365))

(declare-fun m!859367 () Bool)

(assert (=> mapNonEmpty!31368 m!859367))

(declare-fun m!859369 () Bool)

(assert (=> b!925404 m!859369))

(declare-fun m!859371 () Bool)

(assert (=> start!79002 m!859371))

(declare-fun m!859373 () Bool)

(assert (=> start!79002 m!859373))

(declare-fun m!859375 () Bool)

(assert (=> start!79002 m!859375))

(declare-fun m!859377 () Bool)

(assert (=> b!925410 m!859377))

(declare-fun m!859379 () Bool)

(assert (=> b!925410 m!859379))

(declare-fun m!859381 () Bool)

(assert (=> b!925410 m!859381))

(declare-fun m!859383 () Bool)

(assert (=> b!925406 m!859383))

(assert (=> b!925406 m!859345))

(declare-fun m!859385 () Bool)

(assert (=> b!925400 m!859385))

(declare-fun m!859387 () Bool)

(assert (=> b!925418 m!859387))

(declare-fun m!859389 () Bool)

(assert (=> b!925418 m!859389))

(declare-fun m!859391 () Bool)

(assert (=> b!925416 m!859391))

(declare-fun m!859393 () Bool)

(assert (=> b!925414 m!859393))

(declare-fun m!859395 () Bool)

(assert (=> b!925407 m!859395))

(check-sat (not b!925400) (not b!925408) (not mapNonEmpty!31368) (not b!925410) (not b!925418) (not b!925414) (not b!925402) (not b!925406) (not b!925404) (not start!79002) (not b!925401) b_and!28179 (not b_next!17233) (not b!925416) (not b!925415) (not b_lambda!13717) tp_is_empty!19741 (not b!925407))
(check-sat b_and!28179 (not b_next!17233))
