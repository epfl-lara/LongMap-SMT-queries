; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73768 () Bool)

(assert start!73768)

(declare-fun b_free!14515 () Bool)

(declare-fun b_next!14515 () Bool)

(assert (=> start!73768 (= b_free!14515 (not b_next!14515))))

(declare-fun tp!51049 () Bool)

(declare-fun b_and!24019 () Bool)

(assert (=> start!73768 (= tp!51049 b_and!24019)))

(declare-fun mapIsEmpty!26576 () Bool)

(declare-fun mapRes!26576 () Bool)

(assert (=> mapIsEmpty!26576 mapRes!26576))

(declare-fun b!862089 () Bool)

(declare-datatypes ((Unit!29371 0))(
  ( (Unit!29372) )
))
(declare-fun e!480425 () Unit!29371)

(declare-fun Unit!29373 () Unit!29371)

(assert (=> b!862089 (= e!480425 Unit!29373)))

(declare-fun lt!388677 () Unit!29371)

(declare-datatypes ((array!49527 0))(
  ( (array!49528 (arr!23790 (Array (_ BitVec 32) (_ BitVec 64))) (size!24231 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49527)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49527 (_ BitVec 32) (_ BitVec 32)) Unit!29371)

(assert (=> b!862089 (= lt!388677 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16834 0))(
  ( (Nil!16831) (Cons!16830 (h!17967 (_ BitVec 64)) (t!23607 List!16834)) )
))
(declare-fun arrayNoDuplicates!0 (array!49527 (_ BitVec 32) List!16834) Bool)

(assert (=> b!862089 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16831)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!388675 () Unit!29371)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29371)

(assert (=> b!862089 (= lt!388675 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862089 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388684 () Unit!29371)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49527 (_ BitVec 64) (_ BitVec 32) List!16834) Unit!29371)

(assert (=> b!862089 (= lt!388684 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16831))))

(assert (=> b!862089 false))

(declare-fun b!862090 () Bool)

(declare-fun res!585601 () Bool)

(declare-fun e!480427 () Bool)

(assert (=> b!862090 (=> (not res!585601) (not e!480427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862090 (= res!585601 (validKeyInArray!0 k0!854))))

(declare-fun b!862092 () Bool)

(declare-fun res!585607 () Bool)

(assert (=> b!862092 (=> (not res!585607) (not e!480427))))

(assert (=> b!862092 (= res!585607 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16831))))

(declare-fun b!862093 () Bool)

(declare-fun e!480426 () Bool)

(declare-fun tp_is_empty!16651 () Bool)

(assert (=> b!862093 (= e!480426 tp_is_empty!16651)))

(declare-fun b!862094 () Bool)

(declare-fun res!585605 () Bool)

(assert (=> b!862094 (=> (not res!585605) (not e!480427))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49527 (_ BitVec 32)) Bool)

(assert (=> b!862094 (= res!585605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862095 () Bool)

(declare-fun res!585606 () Bool)

(assert (=> b!862095 (=> (not res!585606) (not e!480427))))

(assert (=> b!862095 (= res!585606 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24231 _keys!868))))))

(declare-fun b!862096 () Bool)

(declare-fun res!585603 () Bool)

(assert (=> b!862096 (=> (not res!585603) (not e!480427))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27249 0))(
  ( (V!27250 (val!8373 Int)) )
))
(declare-datatypes ((ValueCell!7886 0))(
  ( (ValueCellFull!7886 (v!10798 V!27249)) (EmptyCell!7886) )
))
(declare-datatypes ((array!49529 0))(
  ( (array!49530 (arr!23791 (Array (_ BitVec 32) ValueCell!7886)) (size!24232 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49529)

(assert (=> b!862096 (= res!585603 (and (= (size!24232 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24231 _keys!868) (size!24232 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862097 () Bool)

(declare-fun res!585609 () Bool)

(assert (=> b!862097 (=> (not res!585609) (not e!480427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862097 (= res!585609 (validMask!0 mask!1196))))

(declare-fun b!862098 () Bool)

(declare-fun e!480421 () Bool)

(assert (=> b!862098 (= e!480427 e!480421)))

(declare-fun res!585604 () Bool)

(assert (=> b!862098 (=> (not res!585604) (not e!480421))))

(assert (=> b!862098 (= res!585604 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388679 () array!49529)

(declare-datatypes ((tuple2!10994 0))(
  ( (tuple2!10995 (_1!5508 (_ BitVec 64)) (_2!5508 V!27249)) )
))
(declare-datatypes ((List!16835 0))(
  ( (Nil!16832) (Cons!16831 (h!17968 tuple2!10994) (t!23608 List!16835)) )
))
(declare-datatypes ((ListLongMap!9765 0))(
  ( (ListLongMap!9766 (toList!4898 List!16835)) )
))
(declare-fun lt!388676 () ListLongMap!9765)

(declare-fun minValue!654 () V!27249)

(declare-fun zeroValue!654 () V!27249)

(declare-fun getCurrentListMapNoExtraKeys!2950 (array!49527 array!49529 (_ BitVec 32) (_ BitVec 32) V!27249 V!27249 (_ BitVec 32) Int) ListLongMap!9765)

(assert (=> b!862098 (= lt!388676 (getCurrentListMapNoExtraKeys!2950 _keys!868 lt!388679 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27249)

(assert (=> b!862098 (= lt!388679 (array!49530 (store (arr!23791 _values!688) i!612 (ValueCellFull!7886 v!557)) (size!24232 _values!688)))))

(declare-fun lt!388682 () ListLongMap!9765)

(assert (=> b!862098 (= lt!388682 (getCurrentListMapNoExtraKeys!2950 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862099 () Bool)

(declare-fun e!480420 () Bool)

(assert (=> b!862099 (= e!480421 (not e!480420))))

(declare-fun res!585602 () Bool)

(assert (=> b!862099 (=> res!585602 e!480420)))

(assert (=> b!862099 (= res!585602 (not (validKeyInArray!0 (select (arr!23790 _keys!868) from!1053))))))

(declare-fun lt!388683 () ListLongMap!9765)

(declare-fun lt!388678 () ListLongMap!9765)

(assert (=> b!862099 (= lt!388683 lt!388678)))

(declare-fun lt!388680 () ListLongMap!9765)

(declare-fun +!2302 (ListLongMap!9765 tuple2!10994) ListLongMap!9765)

(assert (=> b!862099 (= lt!388678 (+!2302 lt!388680 (tuple2!10995 k0!854 v!557)))))

(assert (=> b!862099 (= lt!388683 (getCurrentListMapNoExtraKeys!2950 _keys!868 lt!388679 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862099 (= lt!388680 (getCurrentListMapNoExtraKeys!2950 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388681 () Unit!29371)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!491 (array!49527 array!49529 (_ BitVec 32) (_ BitVec 32) V!27249 V!27249 (_ BitVec 32) (_ BitVec 64) V!27249 (_ BitVec 32) Int) Unit!29371)

(assert (=> b!862099 (= lt!388681 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!491 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862100 () Bool)

(declare-fun Unit!29374 () Unit!29371)

(assert (=> b!862100 (= e!480425 Unit!29374)))

(declare-fun res!585608 () Bool)

(assert (=> start!73768 (=> (not res!585608) (not e!480427))))

(assert (=> start!73768 (= res!585608 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24231 _keys!868))))))

(assert (=> start!73768 e!480427))

(assert (=> start!73768 tp_is_empty!16651))

(assert (=> start!73768 true))

(assert (=> start!73768 tp!51049))

(declare-fun array_inv!18874 (array!49527) Bool)

(assert (=> start!73768 (array_inv!18874 _keys!868)))

(declare-fun e!480422 () Bool)

(declare-fun array_inv!18875 (array!49529) Bool)

(assert (=> start!73768 (and (array_inv!18875 _values!688) e!480422)))

(declare-fun b!862091 () Bool)

(declare-fun e!480423 () Bool)

(assert (=> b!862091 (= e!480422 (and e!480423 mapRes!26576))))

(declare-fun condMapEmpty!26576 () Bool)

(declare-fun mapDefault!26576 () ValueCell!7886)

(assert (=> b!862091 (= condMapEmpty!26576 (= (arr!23791 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7886)) mapDefault!26576)))))

(declare-fun mapNonEmpty!26576 () Bool)

(declare-fun tp!51050 () Bool)

(assert (=> mapNonEmpty!26576 (= mapRes!26576 (and tp!51050 e!480426))))

(declare-fun mapKey!26576 () (_ BitVec 32))

(declare-fun mapRest!26576 () (Array (_ BitVec 32) ValueCell!7886))

(declare-fun mapValue!26576 () ValueCell!7886)

(assert (=> mapNonEmpty!26576 (= (arr!23791 _values!688) (store mapRest!26576 mapKey!26576 mapValue!26576))))

(declare-fun b!862101 () Bool)

(assert (=> b!862101 (= e!480420 true)))

(assert (=> b!862101 (not (= (select (arr!23790 _keys!868) from!1053) k0!854))))

(declare-fun lt!388685 () Unit!29371)

(assert (=> b!862101 (= lt!388685 e!480425)))

(declare-fun c!92275 () Bool)

(assert (=> b!862101 (= c!92275 (= (select (arr!23790 _keys!868) from!1053) k0!854))))

(declare-fun get!12552 (ValueCell!7886 V!27249) V!27249)

(declare-fun dynLambda!1130 (Int (_ BitVec 64)) V!27249)

(assert (=> b!862101 (= lt!388676 (+!2302 lt!388678 (tuple2!10995 (select (arr!23790 _keys!868) from!1053) (get!12552 (select (arr!23791 _values!688) from!1053) (dynLambda!1130 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862102 () Bool)

(declare-fun res!585610 () Bool)

(assert (=> b!862102 (=> (not res!585610) (not e!480427))))

(assert (=> b!862102 (= res!585610 (and (= (select (arr!23790 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862103 () Bool)

(assert (=> b!862103 (= e!480423 tp_is_empty!16651)))

(assert (= (and start!73768 res!585608) b!862097))

(assert (= (and b!862097 res!585609) b!862096))

(assert (= (and b!862096 res!585603) b!862094))

(assert (= (and b!862094 res!585605) b!862092))

(assert (= (and b!862092 res!585607) b!862095))

(assert (= (and b!862095 res!585606) b!862090))

(assert (= (and b!862090 res!585601) b!862102))

(assert (= (and b!862102 res!585610) b!862098))

(assert (= (and b!862098 res!585604) b!862099))

(assert (= (and b!862099 (not res!585602)) b!862101))

(assert (= (and b!862101 c!92275) b!862089))

(assert (= (and b!862101 (not c!92275)) b!862100))

(assert (= (and b!862091 condMapEmpty!26576) mapIsEmpty!26576))

(assert (= (and b!862091 (not condMapEmpty!26576)) mapNonEmpty!26576))

(get-info :version)

(assert (= (and mapNonEmpty!26576 ((_ is ValueCellFull!7886) mapValue!26576)) b!862093))

(assert (= (and b!862091 ((_ is ValueCellFull!7886) mapDefault!26576)) b!862103))

(assert (= start!73768 b!862091))

(declare-fun b_lambda!11881 () Bool)

(assert (=> (not b_lambda!11881) (not b!862101)))

(declare-fun t!23606 () Bool)

(declare-fun tb!4629 () Bool)

(assert (=> (and start!73768 (= defaultEntry!696 defaultEntry!696) t!23606) tb!4629))

(declare-fun result!8877 () Bool)

(assert (=> tb!4629 (= result!8877 tp_is_empty!16651)))

(assert (=> b!862101 t!23606))

(declare-fun b_and!24021 () Bool)

(assert (= b_and!24019 (and (=> t!23606 result!8877) b_and!24021)))

(declare-fun m!803351 () Bool)

(assert (=> b!862090 m!803351))

(declare-fun m!803353 () Bool)

(assert (=> start!73768 m!803353))

(declare-fun m!803355 () Bool)

(assert (=> start!73768 m!803355))

(declare-fun m!803357 () Bool)

(assert (=> b!862101 m!803357))

(declare-fun m!803359 () Bool)

(assert (=> b!862101 m!803359))

(declare-fun m!803361 () Bool)

(assert (=> b!862101 m!803361))

(declare-fun m!803363 () Bool)

(assert (=> b!862101 m!803363))

(assert (=> b!862101 m!803359))

(declare-fun m!803365 () Bool)

(assert (=> b!862101 m!803365))

(assert (=> b!862101 m!803361))

(declare-fun m!803367 () Bool)

(assert (=> b!862098 m!803367))

(declare-fun m!803369 () Bool)

(assert (=> b!862098 m!803369))

(declare-fun m!803371 () Bool)

(assert (=> b!862098 m!803371))

(declare-fun m!803373 () Bool)

(assert (=> b!862094 m!803373))

(declare-fun m!803375 () Bool)

(assert (=> b!862099 m!803375))

(assert (=> b!862099 m!803365))

(declare-fun m!803377 () Bool)

(assert (=> b!862099 m!803377))

(assert (=> b!862099 m!803365))

(declare-fun m!803379 () Bool)

(assert (=> b!862099 m!803379))

(declare-fun m!803381 () Bool)

(assert (=> b!862099 m!803381))

(declare-fun m!803383 () Bool)

(assert (=> b!862099 m!803383))

(declare-fun m!803385 () Bool)

(assert (=> b!862092 m!803385))

(declare-fun m!803387 () Bool)

(assert (=> mapNonEmpty!26576 m!803387))

(declare-fun m!803389 () Bool)

(assert (=> b!862102 m!803389))

(declare-fun m!803391 () Bool)

(assert (=> b!862097 m!803391))

(declare-fun m!803393 () Bool)

(assert (=> b!862089 m!803393))

(declare-fun m!803395 () Bool)

(assert (=> b!862089 m!803395))

(declare-fun m!803397 () Bool)

(assert (=> b!862089 m!803397))

(declare-fun m!803399 () Bool)

(assert (=> b!862089 m!803399))

(declare-fun m!803401 () Bool)

(assert (=> b!862089 m!803401))

(check-sat b_and!24021 (not mapNonEmpty!26576) (not b!862092) (not b!862089) (not b!862101) (not b!862090) (not b!862098) (not b!862097) tp_is_empty!16651 (not b_lambda!11881) (not b_next!14515) (not start!73768) (not b!862099) (not b!862094))
(check-sat b_and!24021 (not b_next!14515))
