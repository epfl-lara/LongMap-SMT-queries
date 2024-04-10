; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73650 () Bool)

(assert start!73650)

(declare-fun b_free!14565 () Bool)

(declare-fun b_next!14565 () Bool)

(assert (=> start!73650 (= b_free!14565 (not b_next!14565))))

(declare-fun tp!51198 () Bool)

(declare-fun b_and!24109 () Bool)

(assert (=> start!73650 (= tp!51198 b_and!24109)))

(declare-fun b!862375 () Bool)

(declare-fun res!586026 () Bool)

(declare-fun e!480456 () Bool)

(assert (=> b!862375 (=> (not res!586026) (not e!480456))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49566 0))(
  ( (array!49567 (arr!23814 (Array (_ BitVec 32) (_ BitVec 64))) (size!24254 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49566)

(assert (=> b!862375 (= res!586026 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24254 _keys!868))))))

(declare-fun b!862376 () Bool)

(declare-fun e!480457 () Bool)

(declare-fun tp_is_empty!16701 () Bool)

(assert (=> b!862376 (= e!480457 tp_is_empty!16701)))

(declare-fun b!862377 () Bool)

(declare-fun res!586025 () Bool)

(assert (=> b!862377 (=> (not res!586025) (not e!480456))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49566 (_ BitVec 32)) Bool)

(assert (=> b!862377 (= res!586025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862378 () Bool)

(declare-fun e!480460 () Bool)

(assert (=> b!862378 (= e!480460 true)))

(declare-datatypes ((V!27315 0))(
  ( (V!27316 (val!8398 Int)) )
))
(declare-datatypes ((tuple2!11106 0))(
  ( (tuple2!11107 (_1!5564 (_ BitVec 64)) (_2!5564 V!27315)) )
))
(declare-fun lt!389209 () tuple2!11106)

(declare-datatypes ((List!16915 0))(
  ( (Nil!16912) (Cons!16911 (h!18042 tuple2!11106) (t!23746 List!16915)) )
))
(declare-datatypes ((ListLongMap!9875 0))(
  ( (ListLongMap!9876 (toList!4953 List!16915)) )
))
(declare-fun lt!389211 () ListLongMap!9875)

(declare-fun lt!389218 () tuple2!11106)

(declare-fun lt!389212 () ListLongMap!9875)

(declare-fun +!2302 (ListLongMap!9875 tuple2!11106) ListLongMap!9875)

(assert (=> b!862378 (= lt!389211 (+!2302 (+!2302 lt!389212 lt!389218) lt!389209))))

(declare-fun v!557 () V!27315)

(declare-fun lt!389219 () V!27315)

(declare-datatypes ((Unit!29446 0))(
  ( (Unit!29447) )
))
(declare-fun lt!389221 () Unit!29446)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!479 (ListLongMap!9875 (_ BitVec 64) V!27315 (_ BitVec 64) V!27315) Unit!29446)

(assert (=> b!862378 (= lt!389221 (addCommutativeForDiffKeys!479 lt!389212 k0!854 v!557 (select (arr!23814 _keys!868) from!1053) lt!389219))))

(declare-fun b!862380 () Bool)

(declare-fun e!480459 () Bool)

(declare-fun e!480458 () Bool)

(assert (=> b!862380 (= e!480459 (not e!480458))))

(declare-fun res!586024 () Bool)

(assert (=> b!862380 (=> res!586024 e!480458)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862380 (= res!586024 (not (validKeyInArray!0 (select (arr!23814 _keys!868) from!1053))))))

(declare-fun lt!389223 () ListLongMap!9875)

(declare-fun lt!389216 () ListLongMap!9875)

(assert (=> b!862380 (= lt!389223 lt!389216)))

(assert (=> b!862380 (= lt!389216 (+!2302 lt!389212 lt!389209))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7911 0))(
  ( (ValueCellFull!7911 (v!10823 V!27315)) (EmptyCell!7911) )
))
(declare-datatypes ((array!49568 0))(
  ( (array!49569 (arr!23815 (Array (_ BitVec 32) ValueCell!7911)) (size!24255 (_ BitVec 32))) )
))
(declare-fun lt!389217 () array!49568)

(declare-fun minValue!654 () V!27315)

(declare-fun zeroValue!654 () V!27315)

(declare-fun getCurrentListMapNoExtraKeys!2929 (array!49566 array!49568 (_ BitVec 32) (_ BitVec 32) V!27315 V!27315 (_ BitVec 32) Int) ListLongMap!9875)

(assert (=> b!862380 (= lt!389223 (getCurrentListMapNoExtraKeys!2929 _keys!868 lt!389217 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862380 (= lt!389209 (tuple2!11107 k0!854 v!557))))

(declare-fun _values!688 () array!49568)

(assert (=> b!862380 (= lt!389212 (getCurrentListMapNoExtraKeys!2929 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389222 () Unit!29446)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!512 (array!49566 array!49568 (_ BitVec 32) (_ BitVec 32) V!27315 V!27315 (_ BitVec 32) (_ BitVec 64) V!27315 (_ BitVec 32) Int) Unit!29446)

(assert (=> b!862380 (= lt!389222 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!512 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862381 () Bool)

(declare-fun res!586023 () Bool)

(assert (=> b!862381 (=> (not res!586023) (not e!480456))))

(assert (=> b!862381 (= res!586023 (validKeyInArray!0 k0!854))))

(declare-fun b!862382 () Bool)

(declare-fun res!586031 () Bool)

(assert (=> b!862382 (=> (not res!586031) (not e!480456))))

(declare-datatypes ((List!16916 0))(
  ( (Nil!16913) (Cons!16912 (h!18043 (_ BitVec 64)) (t!23747 List!16916)) )
))
(declare-fun arrayNoDuplicates!0 (array!49566 (_ BitVec 32) List!16916) Bool)

(assert (=> b!862382 (= res!586031 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16913))))

(declare-fun b!862383 () Bool)

(declare-fun e!480452 () Unit!29446)

(declare-fun Unit!29448 () Unit!29446)

(assert (=> b!862383 (= e!480452 Unit!29448)))

(declare-fun b!862384 () Bool)

(declare-fun Unit!29449 () Unit!29446)

(assert (=> b!862384 (= e!480452 Unit!29449)))

(declare-fun lt!389210 () Unit!29446)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49566 (_ BitVec 32) (_ BitVec 32)) Unit!29446)

(assert (=> b!862384 (= lt!389210 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862384 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16913)))

(declare-fun lt!389214 () Unit!29446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49566 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29446)

(assert (=> b!862384 (= lt!389214 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862384 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389220 () Unit!29446)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49566 (_ BitVec 64) (_ BitVec 32) List!16916) Unit!29446)

(assert (=> b!862384 (= lt!389220 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16913))))

(assert (=> b!862384 false))

(declare-fun b!862385 () Bool)

(declare-fun e!480454 () Bool)

(declare-fun e!480455 () Bool)

(declare-fun mapRes!26651 () Bool)

(assert (=> b!862385 (= e!480454 (and e!480455 mapRes!26651))))

(declare-fun condMapEmpty!26651 () Bool)

(declare-fun mapDefault!26651 () ValueCell!7911)

(assert (=> b!862385 (= condMapEmpty!26651 (= (arr!23815 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7911)) mapDefault!26651)))))

(declare-fun mapNonEmpty!26651 () Bool)

(declare-fun tp!51199 () Bool)

(assert (=> mapNonEmpty!26651 (= mapRes!26651 (and tp!51199 e!480457))))

(declare-fun mapKey!26651 () (_ BitVec 32))

(declare-fun mapValue!26651 () ValueCell!7911)

(declare-fun mapRest!26651 () (Array (_ BitVec 32) ValueCell!7911))

(assert (=> mapNonEmpty!26651 (= (arr!23815 _values!688) (store mapRest!26651 mapKey!26651 mapValue!26651))))

(declare-fun b!862386 () Bool)

(assert (=> b!862386 (= e!480455 tp_is_empty!16701)))

(declare-fun mapIsEmpty!26651 () Bool)

(assert (=> mapIsEmpty!26651 mapRes!26651))

(declare-fun b!862387 () Bool)

(declare-fun res!586030 () Bool)

(assert (=> b!862387 (=> (not res!586030) (not e!480456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862387 (= res!586030 (validMask!0 mask!1196))))

(declare-fun b!862388 () Bool)

(assert (=> b!862388 (= e!480456 e!480459)))

(declare-fun res!586027 () Bool)

(assert (=> b!862388 (=> (not res!586027) (not e!480459))))

(assert (=> b!862388 (= res!586027 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!389224 () ListLongMap!9875)

(assert (=> b!862388 (= lt!389224 (getCurrentListMapNoExtraKeys!2929 _keys!868 lt!389217 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862388 (= lt!389217 (array!49569 (store (arr!23815 _values!688) i!612 (ValueCellFull!7911 v!557)) (size!24255 _values!688)))))

(declare-fun lt!389215 () ListLongMap!9875)

(assert (=> b!862388 (= lt!389215 (getCurrentListMapNoExtraKeys!2929 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862389 () Bool)

(assert (=> b!862389 (= e!480458 e!480460)))

(declare-fun res!586029 () Bool)

(assert (=> b!862389 (=> res!586029 e!480460)))

(assert (=> b!862389 (= res!586029 (= k0!854 (select (arr!23814 _keys!868) from!1053)))))

(assert (=> b!862389 (not (= (select (arr!23814 _keys!868) from!1053) k0!854))))

(declare-fun lt!389213 () Unit!29446)

(assert (=> b!862389 (= lt!389213 e!480452)))

(declare-fun c!92068 () Bool)

(assert (=> b!862389 (= c!92068 (= (select (arr!23814 _keys!868) from!1053) k0!854))))

(assert (=> b!862389 (= lt!389224 lt!389211)))

(assert (=> b!862389 (= lt!389211 (+!2302 lt!389216 lt!389218))))

(assert (=> b!862389 (= lt!389218 (tuple2!11107 (select (arr!23814 _keys!868) from!1053) lt!389219))))

(declare-fun get!12568 (ValueCell!7911 V!27315) V!27315)

(declare-fun dynLambda!1136 (Int (_ BitVec 64)) V!27315)

(assert (=> b!862389 (= lt!389219 (get!12568 (select (arr!23815 _values!688) from!1053) (dynLambda!1136 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862390 () Bool)

(declare-fun res!586022 () Bool)

(assert (=> b!862390 (=> (not res!586022) (not e!480456))))

(assert (=> b!862390 (= res!586022 (and (= (size!24255 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24254 _keys!868) (size!24255 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!586028 () Bool)

(assert (=> start!73650 (=> (not res!586028) (not e!480456))))

(assert (=> start!73650 (= res!586028 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24254 _keys!868))))))

(assert (=> start!73650 e!480456))

(assert (=> start!73650 tp_is_empty!16701))

(assert (=> start!73650 true))

(assert (=> start!73650 tp!51198))

(declare-fun array_inv!18840 (array!49566) Bool)

(assert (=> start!73650 (array_inv!18840 _keys!868)))

(declare-fun array_inv!18841 (array!49568) Bool)

(assert (=> start!73650 (and (array_inv!18841 _values!688) e!480454)))

(declare-fun b!862379 () Bool)

(declare-fun res!586021 () Bool)

(assert (=> b!862379 (=> (not res!586021) (not e!480456))))

(assert (=> b!862379 (= res!586021 (and (= (select (arr!23814 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73650 res!586028) b!862387))

(assert (= (and b!862387 res!586030) b!862390))

(assert (= (and b!862390 res!586022) b!862377))

(assert (= (and b!862377 res!586025) b!862382))

(assert (= (and b!862382 res!586031) b!862375))

(assert (= (and b!862375 res!586026) b!862381))

(assert (= (and b!862381 res!586023) b!862379))

(assert (= (and b!862379 res!586021) b!862388))

(assert (= (and b!862388 res!586027) b!862380))

(assert (= (and b!862380 (not res!586024)) b!862389))

(assert (= (and b!862389 c!92068) b!862384))

(assert (= (and b!862389 (not c!92068)) b!862383))

(assert (= (and b!862389 (not res!586029)) b!862378))

(assert (= (and b!862385 condMapEmpty!26651) mapIsEmpty!26651))

(assert (= (and b!862385 (not condMapEmpty!26651)) mapNonEmpty!26651))

(get-info :version)

(assert (= (and mapNonEmpty!26651 ((_ is ValueCellFull!7911) mapValue!26651)) b!862376))

(assert (= (and b!862385 ((_ is ValueCellFull!7911) mapDefault!26651)) b!862386))

(assert (= start!73650 b!862385))

(declare-fun b_lambda!11917 () Bool)

(assert (=> (not b_lambda!11917) (not b!862389)))

(declare-fun t!23745 () Bool)

(declare-fun tb!4687 () Bool)

(assert (=> (and start!73650 (= defaultEntry!696 defaultEntry!696) t!23745) tb!4687))

(declare-fun result!8985 () Bool)

(assert (=> tb!4687 (= result!8985 tp_is_empty!16701)))

(assert (=> b!862389 t!23745))

(declare-fun b_and!24111 () Bool)

(assert (= b_and!24109 (and (=> t!23745 result!8985) b_and!24111)))

(declare-fun m!803385 () Bool)

(assert (=> b!862379 m!803385))

(declare-fun m!803387 () Bool)

(assert (=> b!862387 m!803387))

(declare-fun m!803389 () Bool)

(assert (=> b!862382 m!803389))

(declare-fun m!803391 () Bool)

(assert (=> b!862381 m!803391))

(declare-fun m!803393 () Bool)

(assert (=> start!73650 m!803393))

(declare-fun m!803395 () Bool)

(assert (=> start!73650 m!803395))

(declare-fun m!803397 () Bool)

(assert (=> b!862388 m!803397))

(declare-fun m!803399 () Bool)

(assert (=> b!862388 m!803399))

(declare-fun m!803401 () Bool)

(assert (=> b!862388 m!803401))

(declare-fun m!803403 () Bool)

(assert (=> b!862378 m!803403))

(assert (=> b!862378 m!803403))

(declare-fun m!803405 () Bool)

(assert (=> b!862378 m!803405))

(declare-fun m!803407 () Bool)

(assert (=> b!862378 m!803407))

(assert (=> b!862378 m!803407))

(declare-fun m!803409 () Bool)

(assert (=> b!862378 m!803409))

(declare-fun m!803411 () Bool)

(assert (=> b!862377 m!803411))

(declare-fun m!803413 () Bool)

(assert (=> b!862380 m!803413))

(declare-fun m!803415 () Bool)

(assert (=> b!862380 m!803415))

(assert (=> b!862380 m!803407))

(declare-fun m!803417 () Bool)

(assert (=> b!862380 m!803417))

(assert (=> b!862380 m!803407))

(declare-fun m!803419 () Bool)

(assert (=> b!862380 m!803419))

(declare-fun m!803421 () Bool)

(assert (=> b!862380 m!803421))

(declare-fun m!803423 () Bool)

(assert (=> b!862389 m!803423))

(declare-fun m!803425 () Bool)

(assert (=> b!862389 m!803425))

(declare-fun m!803427 () Bool)

(assert (=> b!862389 m!803427))

(assert (=> b!862389 m!803423))

(declare-fun m!803429 () Bool)

(assert (=> b!862389 m!803429))

(assert (=> b!862389 m!803407))

(assert (=> b!862389 m!803425))

(declare-fun m!803431 () Bool)

(assert (=> mapNonEmpty!26651 m!803431))

(declare-fun m!803433 () Bool)

(assert (=> b!862384 m!803433))

(declare-fun m!803435 () Bool)

(assert (=> b!862384 m!803435))

(declare-fun m!803437 () Bool)

(assert (=> b!862384 m!803437))

(declare-fun m!803439 () Bool)

(assert (=> b!862384 m!803439))

(declare-fun m!803441 () Bool)

(assert (=> b!862384 m!803441))

(check-sat (not b!862387) (not mapNonEmpty!26651) (not b!862378) (not b!862382) (not b!862389) (not b!862388) (not b_next!14565) (not b!862381) (not start!73650) (not b!862380) (not b!862384) tp_is_empty!16701 (not b!862377) (not b_lambda!11917) b_and!24111)
(check-sat b_and!24111 (not b_next!14565))
