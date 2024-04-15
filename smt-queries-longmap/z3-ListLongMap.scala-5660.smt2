; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73726 () Bool)

(assert start!73726)

(declare-fun b_free!14659 () Bool)

(declare-fun b_next!14659 () Bool)

(assert (=> start!73726 (= b_free!14659 (not b_next!14659))))

(declare-fun tp!51481 () Bool)

(declare-fun b_and!24271 () Bool)

(assert (=> start!73726 (= tp!51481 b_and!24271)))

(declare-fun mapIsEmpty!26792 () Bool)

(declare-fun mapRes!26792 () Bool)

(assert (=> mapIsEmpty!26792 mapRes!26792))

(declare-fun b!864486 () Bool)

(declare-fun e!481577 () Bool)

(declare-fun tp_is_empty!16795 () Bool)

(assert (=> b!864486 (= e!481577 tp_is_empty!16795)))

(declare-fun b!864487 () Bool)

(declare-fun res!587467 () Bool)

(declare-fun e!481578 () Bool)

(assert (=> b!864487 (=> (not res!587467) (not e!481578))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864487 (= res!587467 (validMask!0 mask!1196))))

(declare-fun b!864488 () Bool)

(declare-fun e!481574 () Bool)

(declare-fun e!481579 () Bool)

(assert (=> b!864488 (= e!481574 (not e!481579))))

(declare-fun res!587462 () Bool)

(assert (=> b!864488 (=> res!587462 e!481579)))

(declare-datatypes ((array!49743 0))(
  ( (array!49744 (arr!23903 (Array (_ BitVec 32) (_ BitVec 64))) (size!24345 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49743)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864488 (= res!587462 (not (validKeyInArray!0 (select (arr!23903 _keys!868) from!1053))))))

(declare-datatypes ((V!27441 0))(
  ( (V!27442 (val!8445 Int)) )
))
(declare-datatypes ((tuple2!11200 0))(
  ( (tuple2!11201 (_1!5611 (_ BitVec 64)) (_2!5611 V!27441)) )
))
(declare-datatypes ((List!16993 0))(
  ( (Nil!16990) (Cons!16989 (h!18120 tuple2!11200) (t!23909 List!16993)) )
))
(declare-datatypes ((ListLongMap!9959 0))(
  ( (ListLongMap!9960 (toList!4995 List!16993)) )
))
(declare-fun lt!391231 () ListLongMap!9959)

(declare-fun lt!391241 () ListLongMap!9959)

(assert (=> b!864488 (= lt!391231 lt!391241)))

(declare-fun lt!391237 () ListLongMap!9959)

(declare-fun lt!391229 () tuple2!11200)

(declare-fun +!2363 (ListLongMap!9959 tuple2!11200) ListLongMap!9959)

(assert (=> b!864488 (= lt!391241 (+!2363 lt!391237 lt!391229))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27441)

(declare-fun zeroValue!654 () V!27441)

(declare-datatypes ((ValueCell!7958 0))(
  ( (ValueCellFull!7958 (v!10864 V!27441)) (EmptyCell!7958) )
))
(declare-datatypes ((array!49745 0))(
  ( (array!49746 (arr!23904 (Array (_ BitVec 32) ValueCell!7958)) (size!24346 (_ BitVec 32))) )
))
(declare-fun lt!391236 () array!49745)

(declare-fun getCurrentListMapNoExtraKeys!2994 (array!49743 array!49745 (_ BitVec 32) (_ BitVec 32) V!27441 V!27441 (_ BitVec 32) Int) ListLongMap!9959)

(assert (=> b!864488 (= lt!391231 (getCurrentListMapNoExtraKeys!2994 _keys!868 lt!391236 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27441)

(assert (=> b!864488 (= lt!391229 (tuple2!11201 k0!854 v!557))))

(declare-fun _values!688 () array!49745)

(assert (=> b!864488 (= lt!391237 (getCurrentListMapNoExtraKeys!2994 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29518 0))(
  ( (Unit!29519) )
))
(declare-fun lt!391230 () Unit!29518)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!541 (array!49743 array!49745 (_ BitVec 32) (_ BitVec 32) V!27441 V!27441 (_ BitVec 32) (_ BitVec 64) V!27441 (_ BitVec 32) Int) Unit!29518)

(assert (=> b!864488 (= lt!391230 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!541 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864489 () Bool)

(declare-fun res!587469 () Bool)

(assert (=> b!864489 (=> (not res!587469) (not e!481578))))

(assert (=> b!864489 (= res!587469 (validKeyInArray!0 k0!854))))

(declare-fun b!864490 () Bool)

(declare-fun e!481580 () Unit!29518)

(declare-fun Unit!29520 () Unit!29518)

(assert (=> b!864490 (= e!481580 Unit!29520)))

(declare-fun lt!391244 () Unit!29518)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49743 (_ BitVec 32) (_ BitVec 32)) Unit!29518)

(assert (=> b!864490 (= lt!391244 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16994 0))(
  ( (Nil!16991) (Cons!16990 (h!18121 (_ BitVec 64)) (t!23910 List!16994)) )
))
(declare-fun arrayNoDuplicates!0 (array!49743 (_ BitVec 32) List!16994) Bool)

(assert (=> b!864490 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16991)))

(declare-fun lt!391242 () Unit!29518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49743 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29518)

(assert (=> b!864490 (= lt!391242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864490 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391235 () Unit!29518)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49743 (_ BitVec 64) (_ BitVec 32) List!16994) Unit!29518)

(assert (=> b!864490 (= lt!391235 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16991))))

(assert (=> b!864490 false))

(declare-fun b!864491 () Bool)

(declare-fun res!587471 () Bool)

(assert (=> b!864491 (=> (not res!587471) (not e!481578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49743 (_ BitVec 32)) Bool)

(assert (=> b!864491 (= res!587471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864492 () Bool)

(declare-fun e!481581 () Bool)

(assert (=> b!864492 (= e!481581 true)))

(declare-fun lt!391233 () tuple2!11200)

(declare-fun lt!391239 () ListLongMap!9959)

(assert (=> b!864492 (= lt!391239 (+!2363 (+!2363 lt!391237 lt!391233) lt!391229))))

(declare-fun lt!391240 () V!27441)

(declare-fun lt!391234 () Unit!29518)

(declare-fun addCommutativeForDiffKeys!506 (ListLongMap!9959 (_ BitVec 64) V!27441 (_ BitVec 64) V!27441) Unit!29518)

(assert (=> b!864492 (= lt!391234 (addCommutativeForDiffKeys!506 lt!391237 k0!854 v!557 (select (arr!23903 _keys!868) from!1053) lt!391240))))

(declare-fun b!864493 () Bool)

(declare-fun res!587470 () Bool)

(assert (=> b!864493 (=> (not res!587470) (not e!481578))))

(assert (=> b!864493 (= res!587470 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24345 _keys!868))))))

(declare-fun b!864494 () Bool)

(declare-fun res!587464 () Bool)

(assert (=> b!864494 (=> (not res!587464) (not e!481578))))

(assert (=> b!864494 (= res!587464 (and (= (select (arr!23903 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864495 () Bool)

(declare-fun e!481576 () Bool)

(declare-fun e!481575 () Bool)

(assert (=> b!864495 (= e!481576 (and e!481575 mapRes!26792))))

(declare-fun condMapEmpty!26792 () Bool)

(declare-fun mapDefault!26792 () ValueCell!7958)

(assert (=> b!864495 (= condMapEmpty!26792 (= (arr!23904 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7958)) mapDefault!26792)))))

(declare-fun b!864496 () Bool)

(assert (=> b!864496 (= e!481579 e!481581)))

(declare-fun res!587465 () Bool)

(assert (=> b!864496 (=> res!587465 e!481581)))

(assert (=> b!864496 (= res!587465 (= k0!854 (select (arr!23903 _keys!868) from!1053)))))

(assert (=> b!864496 (not (= (select (arr!23903 _keys!868) from!1053) k0!854))))

(declare-fun lt!391243 () Unit!29518)

(assert (=> b!864496 (= lt!391243 e!481580)))

(declare-fun c!92144 () Bool)

(assert (=> b!864496 (= c!92144 (= (select (arr!23903 _keys!868) from!1053) k0!854))))

(declare-fun lt!391232 () ListLongMap!9959)

(assert (=> b!864496 (= lt!391232 lt!391239)))

(assert (=> b!864496 (= lt!391239 (+!2363 lt!391241 lt!391233))))

(assert (=> b!864496 (= lt!391233 (tuple2!11201 (select (arr!23903 _keys!868) from!1053) lt!391240))))

(declare-fun get!12631 (ValueCell!7958 V!27441) V!27441)

(declare-fun dynLambda!1164 (Int (_ BitVec 64)) V!27441)

(assert (=> b!864496 (= lt!391240 (get!12631 (select (arr!23904 _values!688) from!1053) (dynLambda!1164 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864497 () Bool)

(declare-fun res!587463 () Bool)

(assert (=> b!864497 (=> (not res!587463) (not e!481578))))

(assert (=> b!864497 (= res!587463 (and (= (size!24346 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24345 _keys!868) (size!24346 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!587468 () Bool)

(assert (=> start!73726 (=> (not res!587468) (not e!481578))))

(assert (=> start!73726 (= res!587468 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24345 _keys!868))))))

(assert (=> start!73726 e!481578))

(assert (=> start!73726 tp_is_empty!16795))

(assert (=> start!73726 true))

(assert (=> start!73726 tp!51481))

(declare-fun array_inv!18978 (array!49743) Bool)

(assert (=> start!73726 (array_inv!18978 _keys!868)))

(declare-fun array_inv!18979 (array!49745) Bool)

(assert (=> start!73726 (and (array_inv!18979 _values!688) e!481576)))

(declare-fun mapNonEmpty!26792 () Bool)

(declare-fun tp!51482 () Bool)

(assert (=> mapNonEmpty!26792 (= mapRes!26792 (and tp!51482 e!481577))))

(declare-fun mapValue!26792 () ValueCell!7958)

(declare-fun mapKey!26792 () (_ BitVec 32))

(declare-fun mapRest!26792 () (Array (_ BitVec 32) ValueCell!7958))

(assert (=> mapNonEmpty!26792 (= (arr!23904 _values!688) (store mapRest!26792 mapKey!26792 mapValue!26792))))

(declare-fun b!864498 () Bool)

(declare-fun Unit!29521 () Unit!29518)

(assert (=> b!864498 (= e!481580 Unit!29521)))

(declare-fun b!864499 () Bool)

(declare-fun res!587466 () Bool)

(assert (=> b!864499 (=> (not res!587466) (not e!481578))))

(assert (=> b!864499 (= res!587466 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16991))))

(declare-fun b!864500 () Bool)

(assert (=> b!864500 (= e!481578 e!481574)))

(declare-fun res!587472 () Bool)

(assert (=> b!864500 (=> (not res!587472) (not e!481574))))

(assert (=> b!864500 (= res!587472 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!864500 (= lt!391232 (getCurrentListMapNoExtraKeys!2994 _keys!868 lt!391236 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864500 (= lt!391236 (array!49746 (store (arr!23904 _values!688) i!612 (ValueCellFull!7958 v!557)) (size!24346 _values!688)))))

(declare-fun lt!391238 () ListLongMap!9959)

(assert (=> b!864500 (= lt!391238 (getCurrentListMapNoExtraKeys!2994 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864501 () Bool)

(assert (=> b!864501 (= e!481575 tp_is_empty!16795)))

(assert (= (and start!73726 res!587468) b!864487))

(assert (= (and b!864487 res!587467) b!864497))

(assert (= (and b!864497 res!587463) b!864491))

(assert (= (and b!864491 res!587471) b!864499))

(assert (= (and b!864499 res!587466) b!864493))

(assert (= (and b!864493 res!587470) b!864489))

(assert (= (and b!864489 res!587469) b!864494))

(assert (= (and b!864494 res!587464) b!864500))

(assert (= (and b!864500 res!587472) b!864488))

(assert (= (and b!864488 (not res!587462)) b!864496))

(assert (= (and b!864496 c!92144) b!864490))

(assert (= (and b!864496 (not c!92144)) b!864498))

(assert (= (and b!864496 (not res!587465)) b!864492))

(assert (= (and b!864495 condMapEmpty!26792) mapIsEmpty!26792))

(assert (= (and b!864495 (not condMapEmpty!26792)) mapNonEmpty!26792))

(get-info :version)

(assert (= (and mapNonEmpty!26792 ((_ is ValueCellFull!7958) mapValue!26792)) b!864486))

(assert (= (and b!864495 ((_ is ValueCellFull!7958) mapDefault!26792)) b!864501))

(assert (= start!73726 b!864495))

(declare-fun b_lambda!11993 () Bool)

(assert (=> (not b_lambda!11993) (not b!864496)))

(declare-fun t!23908 () Bool)

(declare-fun tb!4773 () Bool)

(assert (=> (and start!73726 (= defaultEntry!696 defaultEntry!696) t!23908) tb!4773))

(declare-fun result!9165 () Bool)

(assert (=> tb!4773 (= result!9165 tp_is_empty!16795)))

(assert (=> b!864496 t!23908))

(declare-fun b_and!24273 () Bool)

(assert (= b_and!24271 (and (=> t!23908 result!9165) b_and!24273)))

(declare-fun m!805353 () Bool)

(assert (=> b!864500 m!805353))

(declare-fun m!805355 () Bool)

(assert (=> b!864500 m!805355))

(declare-fun m!805357 () Bool)

(assert (=> b!864500 m!805357))

(declare-fun m!805359 () Bool)

(assert (=> b!864496 m!805359))

(declare-fun m!805361 () Bool)

(assert (=> b!864496 m!805361))

(declare-fun m!805363 () Bool)

(assert (=> b!864496 m!805363))

(declare-fun m!805365 () Bool)

(assert (=> b!864496 m!805365))

(assert (=> b!864496 m!805361))

(declare-fun m!805367 () Bool)

(assert (=> b!864496 m!805367))

(assert (=> b!864496 m!805363))

(declare-fun m!805369 () Bool)

(assert (=> b!864492 m!805369))

(assert (=> b!864492 m!805369))

(declare-fun m!805371 () Bool)

(assert (=> b!864492 m!805371))

(assert (=> b!864492 m!805367))

(assert (=> b!864492 m!805367))

(declare-fun m!805373 () Bool)

(assert (=> b!864492 m!805373))

(declare-fun m!805375 () Bool)

(assert (=> b!864487 m!805375))

(declare-fun m!805377 () Bool)

(assert (=> mapNonEmpty!26792 m!805377))

(declare-fun m!805379 () Bool)

(assert (=> b!864489 m!805379))

(declare-fun m!805381 () Bool)

(assert (=> b!864494 m!805381))

(declare-fun m!805383 () Bool)

(assert (=> start!73726 m!805383))

(declare-fun m!805385 () Bool)

(assert (=> start!73726 m!805385))

(declare-fun m!805387 () Bool)

(assert (=> b!864491 m!805387))

(declare-fun m!805389 () Bool)

(assert (=> b!864499 m!805389))

(declare-fun m!805391 () Bool)

(assert (=> b!864490 m!805391))

(declare-fun m!805393 () Bool)

(assert (=> b!864490 m!805393))

(declare-fun m!805395 () Bool)

(assert (=> b!864490 m!805395))

(declare-fun m!805397 () Bool)

(assert (=> b!864490 m!805397))

(declare-fun m!805399 () Bool)

(assert (=> b!864490 m!805399))

(declare-fun m!805401 () Bool)

(assert (=> b!864488 m!805401))

(declare-fun m!805403 () Bool)

(assert (=> b!864488 m!805403))

(assert (=> b!864488 m!805367))

(declare-fun m!805405 () Bool)

(assert (=> b!864488 m!805405))

(assert (=> b!864488 m!805367))

(declare-fun m!805407 () Bool)

(assert (=> b!864488 m!805407))

(declare-fun m!805409 () Bool)

(assert (=> b!864488 m!805409))

(check-sat (not b!864496) (not b!864491) b_and!24273 (not b!864489) (not b!864499) (not start!73726) (not b_lambda!11993) (not mapNonEmpty!26792) (not b!864492) tp_is_empty!16795 (not b!864500) (not b!864490) (not b!864488) (not b!864487) (not b_next!14659))
(check-sat b_and!24273 (not b_next!14659))
