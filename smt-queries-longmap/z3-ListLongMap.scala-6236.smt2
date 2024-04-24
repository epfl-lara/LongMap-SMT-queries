; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79856 () Bool)

(assert start!79856)

(declare-fun b_free!17737 () Bool)

(declare-fun b_next!17737 () Bool)

(assert (=> start!79856 (= b_free!17737 (not b_next!17737))))

(declare-fun tp!61667 () Bool)

(declare-fun b_and!29075 () Bool)

(assert (=> start!79856 (= tp!61667 b_and!29075)))

(declare-fun b!938291 () Bool)

(declare-fun res!631278 () Bool)

(declare-fun e!526964 () Bool)

(assert (=> b!938291 (=> (not res!631278) (not e!526964))))

(declare-datatypes ((array!56479 0))(
  ( (array!56480 (arr!27175 (Array (_ BitVec 32) (_ BitVec 64))) (size!27635 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56479)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56479 (_ BitVec 32)) Bool)

(assert (=> b!938291 (= res!631278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!938293 () Bool)

(declare-fun e!526966 () Bool)

(declare-fun tp_is_empty!20245 () Bool)

(assert (=> b!938293 (= e!526966 tp_is_empty!20245)))

(declare-fun b!938294 () Bool)

(declare-fun res!631281 () Bool)

(assert (=> b!938294 (=> (not res!631281) (not e!526964))))

(declare-datatypes ((List!19128 0))(
  ( (Nil!19125) (Cons!19124 (h!20276 (_ BitVec 64)) (t!27401 List!19128)) )
))
(declare-fun arrayNoDuplicates!0 (array!56479 (_ BitVec 32) List!19128) Bool)

(assert (=> b!938294 (= res!631281 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19125))))

(declare-fun b!938295 () Bool)

(declare-datatypes ((V!31959 0))(
  ( (V!31960 (val!10173 Int)) )
))
(declare-datatypes ((tuple2!13348 0))(
  ( (tuple2!13349 (_1!6685 (_ BitVec 64)) (_2!6685 V!31959)) )
))
(declare-datatypes ((List!19129 0))(
  ( (Nil!19126) (Cons!19125 (h!20277 tuple2!13348) (t!27402 List!19129)) )
))
(declare-datatypes ((ListLongMap!12047 0))(
  ( (ListLongMap!12048 (toList!6039 List!19129)) )
))
(declare-fun lt!423330 () ListLongMap!12047)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!423331 () V!31959)

(declare-fun apply!856 (ListLongMap!12047 (_ BitVec 64)) V!31959)

(assert (=> b!938295 (= (apply!856 lt!423330 k0!1099) lt!423331)))

(declare-fun lt!423335 () (_ BitVec 64))

(declare-fun lt!423324 () ListLongMap!12047)

(declare-datatypes ((Unit!31626 0))(
  ( (Unit!31627) )
))
(declare-fun lt!423325 () Unit!31626)

(declare-fun lt!423329 () V!31959)

(declare-fun addApplyDifferent!432 (ListLongMap!12047 (_ BitVec 64) V!31959 (_ BitVec 64)) Unit!31626)

(assert (=> b!938295 (= lt!423325 (addApplyDifferent!432 lt!423324 lt!423335 lt!423329 k0!1099))))

(assert (=> b!938295 (not (= lt!423335 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!423326 () Unit!31626)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56479 (_ BitVec 64) (_ BitVec 32) List!19128) Unit!31626)

(assert (=> b!938295 (= lt!423326 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19125))))

(declare-fun e!526961 () Bool)

(assert (=> b!938295 e!526961))

(declare-fun c!97849 () Bool)

(assert (=> b!938295 (= c!97849 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9641 0))(
  ( (ValueCellFull!9641 (v!12695 V!31959)) (EmptyCell!9641) )
))
(declare-datatypes ((array!56481 0))(
  ( (array!56482 (arr!27176 (Array (_ BitVec 32) ValueCell!9641)) (size!27636 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56481)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!423333 () Unit!31626)

(declare-fun zeroValue!1173 () V!31959)

(declare-fun minValue!1173 () V!31959)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!302 (array!56479 array!56481 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 64) (_ BitVec 32) Int) Unit!31626)

(assert (=> b!938295 (= lt!423333 (lemmaListMapContainsThenArrayContainsFrom!302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!938295 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19125)))

(declare-fun lt!423328 () Unit!31626)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56479 (_ BitVec 32) (_ BitVec 32)) Unit!31626)

(assert (=> b!938295 (= lt!423328 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5110 (ListLongMap!12047 (_ BitVec 64)) Bool)

(assert (=> b!938295 (contains!5110 lt!423330 k0!1099)))

(declare-fun lt!423332 () tuple2!13348)

(declare-fun +!2848 (ListLongMap!12047 tuple2!13348) ListLongMap!12047)

(assert (=> b!938295 (= lt!423330 (+!2848 lt!423324 lt!423332))))

(declare-fun lt!423336 () Unit!31626)

(declare-fun addStillContains!551 (ListLongMap!12047 (_ BitVec 64) V!31959 (_ BitVec 64)) Unit!31626)

(assert (=> b!938295 (= lt!423336 (addStillContains!551 lt!423324 lt!423335 lt!423329 k0!1099))))

(declare-fun getCurrentListMap!3275 (array!56479 array!56481 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 32) Int) ListLongMap!12047)

(assert (=> b!938295 (= (getCurrentListMap!3275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2848 (getCurrentListMap!3275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423332))))

(assert (=> b!938295 (= lt!423332 (tuple2!13349 lt!423335 lt!423329))))

(declare-fun get!14344 (ValueCell!9641 V!31959) V!31959)

(declare-fun dynLambda!1645 (Int (_ BitVec 64)) V!31959)

(assert (=> b!938295 (= lt!423329 (get!14344 (select (arr!27176 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1645 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423327 () Unit!31626)

(declare-fun lemmaListMapRecursiveValidKeyArray!228 (array!56479 array!56481 (_ BitVec 32) (_ BitVec 32) V!31959 V!31959 (_ BitVec 32) Int) Unit!31626)

(assert (=> b!938295 (= lt!423327 (lemmaListMapRecursiveValidKeyArray!228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526959 () Unit!31626)

(assert (=> b!938295 (= e!526959 lt!423325)))

(declare-fun b!938296 () Bool)

(declare-fun e!526967 () Bool)

(declare-fun e!526962 () Bool)

(assert (=> b!938296 (= e!526967 e!526962)))

(declare-fun res!631276 () Bool)

(assert (=> b!938296 (=> (not res!631276) (not e!526962))))

(declare-fun v!791 () V!31959)

(assert (=> b!938296 (= res!631276 (and (= lt!423331 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!938296 (= lt!423331 (apply!856 lt!423324 k0!1099))))

(declare-fun b!938297 () Bool)

(declare-fun e!526968 () Bool)

(assert (=> b!938297 (= e!526968 tp_is_empty!20245)))

(declare-fun mapIsEmpty!32139 () Bool)

(declare-fun mapRes!32139 () Bool)

(assert (=> mapIsEmpty!32139 mapRes!32139))

(declare-fun b!938298 () Bool)

(assert (=> b!938298 (= e!526961 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!938299 () Bool)

(declare-fun e!526963 () Unit!31626)

(declare-fun Unit!31628 () Unit!31626)

(assert (=> b!938299 (= e!526963 Unit!31628)))

(declare-fun b!938300 () Bool)

(assert (=> b!938300 (= e!526962 false)))

(declare-fun lt!423334 () Unit!31626)

(assert (=> b!938300 (= lt!423334 e!526963)))

(declare-fun c!97851 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!938300 (= c!97851 (validKeyInArray!0 k0!1099))))

(declare-fun b!938301 () Bool)

(declare-fun Unit!31629 () Unit!31626)

(assert (=> b!938301 (= e!526959 Unit!31629)))

(declare-fun res!631280 () Bool)

(assert (=> start!79856 (=> (not res!631280) (not e!526964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79856 (= res!631280 (validMask!0 mask!1881))))

(assert (=> start!79856 e!526964))

(assert (=> start!79856 true))

(assert (=> start!79856 tp_is_empty!20245))

(declare-fun e!526965 () Bool)

(declare-fun array_inv!21222 (array!56481) Bool)

(assert (=> start!79856 (and (array_inv!21222 _values!1231) e!526965)))

(assert (=> start!79856 tp!61667))

(declare-fun array_inv!21223 (array!56479) Bool)

(assert (=> start!79856 (array_inv!21223 _keys!1487)))

(declare-fun b!938292 () Bool)

(declare-fun res!631279 () Bool)

(assert (=> b!938292 (=> (not res!631279) (not e!526964))))

(assert (=> b!938292 (= res!631279 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27635 _keys!1487))))))

(declare-fun b!938302 () Bool)

(declare-fun arrayContainsKey!0 (array!56479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938302 (= e!526961 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!938303 () Bool)

(assert (=> b!938303 (= e!526964 e!526967)))

(declare-fun res!631277 () Bool)

(assert (=> b!938303 (=> (not res!631277) (not e!526967))))

(assert (=> b!938303 (= res!631277 (contains!5110 lt!423324 k0!1099))))

(assert (=> b!938303 (= lt!423324 (getCurrentListMap!3275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!938304 () Bool)

(declare-fun res!631275 () Bool)

(assert (=> b!938304 (=> (not res!631275) (not e!526964))))

(assert (=> b!938304 (= res!631275 (and (= (size!27636 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27635 _keys!1487) (size!27636 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!938305 () Bool)

(assert (=> b!938305 (= e!526965 (and e!526968 mapRes!32139))))

(declare-fun condMapEmpty!32139 () Bool)

(declare-fun mapDefault!32139 () ValueCell!9641)

(assert (=> b!938305 (= condMapEmpty!32139 (= (arr!27176 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9641)) mapDefault!32139)))))

(declare-fun mapNonEmpty!32139 () Bool)

(declare-fun tp!61668 () Bool)

(assert (=> mapNonEmpty!32139 (= mapRes!32139 (and tp!61668 e!526966))))

(declare-fun mapValue!32139 () ValueCell!9641)

(declare-fun mapKey!32139 () (_ BitVec 32))

(declare-fun mapRest!32139 () (Array (_ BitVec 32) ValueCell!9641))

(assert (=> mapNonEmpty!32139 (= (arr!27176 _values!1231) (store mapRest!32139 mapKey!32139 mapValue!32139))))

(declare-fun b!938306 () Bool)

(assert (=> b!938306 (= e!526963 e!526959)))

(assert (=> b!938306 (= lt!423335 (select (arr!27175 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97850 () Bool)

(assert (=> b!938306 (= c!97850 (validKeyInArray!0 lt!423335))))

(assert (= (and start!79856 res!631280) b!938304))

(assert (= (and b!938304 res!631275) b!938291))

(assert (= (and b!938291 res!631278) b!938294))

(assert (= (and b!938294 res!631281) b!938292))

(assert (= (and b!938292 res!631279) b!938303))

(assert (= (and b!938303 res!631277) b!938296))

(assert (= (and b!938296 res!631276) b!938300))

(assert (= (and b!938300 c!97851) b!938306))

(assert (= (and b!938300 (not c!97851)) b!938299))

(assert (= (and b!938306 c!97850) b!938295))

(assert (= (and b!938306 (not c!97850)) b!938301))

(assert (= (and b!938295 c!97849) b!938302))

(assert (= (and b!938295 (not c!97849)) b!938298))

(assert (= (and b!938305 condMapEmpty!32139) mapIsEmpty!32139))

(assert (= (and b!938305 (not condMapEmpty!32139)) mapNonEmpty!32139))

(get-info :version)

(assert (= (and mapNonEmpty!32139 ((_ is ValueCellFull!9641) mapValue!32139)) b!938293))

(assert (= (and b!938305 ((_ is ValueCellFull!9641) mapDefault!32139)) b!938297))

(assert (= start!79856 b!938305))

(declare-fun b_lambda!14157 () Bool)

(assert (=> (not b_lambda!14157) (not b!938295)))

(declare-fun t!27400 () Bool)

(declare-fun tb!6123 () Bool)

(assert (=> (and start!79856 (= defaultEntry!1235 defaultEntry!1235) t!27400) tb!6123))

(declare-fun result!12087 () Bool)

(assert (=> tb!6123 (= result!12087 tp_is_empty!20245)))

(assert (=> b!938295 t!27400))

(declare-fun b_and!29077 () Bool)

(assert (= b_and!29075 (and (=> t!27400 result!12087) b_and!29077)))

(declare-fun m!873437 () Bool)

(assert (=> b!938306 m!873437))

(declare-fun m!873439 () Bool)

(assert (=> b!938306 m!873439))

(declare-fun m!873441 () Bool)

(assert (=> b!938296 m!873441))

(declare-fun m!873443 () Bool)

(assert (=> b!938295 m!873443))

(declare-fun m!873445 () Bool)

(assert (=> b!938295 m!873445))

(declare-fun m!873447 () Bool)

(assert (=> b!938295 m!873447))

(declare-fun m!873449 () Bool)

(assert (=> b!938295 m!873449))

(declare-fun m!873451 () Bool)

(assert (=> b!938295 m!873451))

(declare-fun m!873453 () Bool)

(assert (=> b!938295 m!873453))

(assert (=> b!938295 m!873447))

(declare-fun m!873455 () Bool)

(assert (=> b!938295 m!873455))

(declare-fun m!873457 () Bool)

(assert (=> b!938295 m!873457))

(declare-fun m!873459 () Bool)

(assert (=> b!938295 m!873459))

(declare-fun m!873461 () Bool)

(assert (=> b!938295 m!873461))

(declare-fun m!873463 () Bool)

(assert (=> b!938295 m!873463))

(declare-fun m!873465 () Bool)

(assert (=> b!938295 m!873465))

(assert (=> b!938295 m!873455))

(declare-fun m!873467 () Bool)

(assert (=> b!938295 m!873467))

(assert (=> b!938295 m!873449))

(declare-fun m!873469 () Bool)

(assert (=> b!938295 m!873469))

(declare-fun m!873471 () Bool)

(assert (=> b!938295 m!873471))

(declare-fun m!873473 () Bool)

(assert (=> b!938295 m!873473))

(declare-fun m!873475 () Bool)

(assert (=> b!938302 m!873475))

(declare-fun m!873477 () Bool)

(assert (=> start!79856 m!873477))

(declare-fun m!873479 () Bool)

(assert (=> start!79856 m!873479))

(declare-fun m!873481 () Bool)

(assert (=> start!79856 m!873481))

(declare-fun m!873483 () Bool)

(assert (=> b!938303 m!873483))

(declare-fun m!873485 () Bool)

(assert (=> b!938303 m!873485))

(declare-fun m!873487 () Bool)

(assert (=> b!938300 m!873487))

(declare-fun m!873489 () Bool)

(assert (=> b!938291 m!873489))

(declare-fun m!873491 () Bool)

(assert (=> b!938294 m!873491))

(declare-fun m!873493 () Bool)

(assert (=> mapNonEmpty!32139 m!873493))

(check-sat (not b!938295) (not b!938303) (not b!938302) (not b!938300) (not mapNonEmpty!32139) tp_is_empty!20245 (not b!938296) b_and!29077 (not b!938306) (not b_lambda!14157) (not b!938294) (not start!79856) (not b!938291) (not b_next!17737))
(check-sat b_and!29077 (not b_next!17737))
