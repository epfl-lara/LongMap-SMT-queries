; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73732 () Bool)

(assert start!73732)

(declare-fun b_free!14665 () Bool)

(declare-fun b_next!14665 () Bool)

(assert (=> start!73732 (= b_free!14665 (not b_next!14665))))

(declare-fun tp!51500 () Bool)

(declare-fun b_and!24283 () Bool)

(assert (=> start!73732 (= tp!51500 b_and!24283)))

(declare-fun b!864636 () Bool)

(declare-fun res!587567 () Bool)

(declare-fun e!481658 () Bool)

(assert (=> b!864636 (=> (not res!587567) (not e!481658))))

(declare-datatypes ((array!49755 0))(
  ( (array!49756 (arr!23909 (Array (_ BitVec 32) (_ BitVec 64))) (size!24351 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49755)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49755 (_ BitVec 32)) Bool)

(assert (=> b!864636 (= res!587567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864637 () Bool)

(declare-fun res!587562 () Bool)

(assert (=> b!864637 (=> (not res!587562) (not e!481658))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864637 (= res!587562 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24351 _keys!868))))))

(declare-fun res!587571 () Bool)

(assert (=> start!73732 (=> (not res!587571) (not e!481658))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73732 (= res!587571 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24351 _keys!868))))))

(assert (=> start!73732 e!481658))

(declare-fun tp_is_empty!16801 () Bool)

(assert (=> start!73732 tp_is_empty!16801))

(assert (=> start!73732 true))

(assert (=> start!73732 tp!51500))

(declare-fun array_inv!18982 (array!49755) Bool)

(assert (=> start!73732 (array_inv!18982 _keys!868)))

(declare-datatypes ((V!27449 0))(
  ( (V!27450 (val!8448 Int)) )
))
(declare-datatypes ((ValueCell!7961 0))(
  ( (ValueCellFull!7961 (v!10867 V!27449)) (EmptyCell!7961) )
))
(declare-datatypes ((array!49757 0))(
  ( (array!49758 (arr!23910 (Array (_ BitVec 32) ValueCell!7961)) (size!24352 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49757)

(declare-fun e!481660 () Bool)

(declare-fun array_inv!18983 (array!49757) Bool)

(assert (=> start!73732 (and (array_inv!18983 _values!688) e!481660)))

(declare-fun b!864638 () Bool)

(declare-fun e!481655 () Bool)

(assert (=> b!864638 (= e!481655 true)))

(declare-datatypes ((tuple2!11206 0))(
  ( (tuple2!11207 (_1!5614 (_ BitVec 64)) (_2!5614 V!27449)) )
))
(declare-datatypes ((List!16999 0))(
  ( (Nil!16996) (Cons!16995 (h!18126 tuple2!11206) (t!23921 List!16999)) )
))
(declare-datatypes ((ListLongMap!9965 0))(
  ( (ListLongMap!9966 (toList!4998 List!16999)) )
))
(declare-fun lt!391381 () ListLongMap!9965)

(declare-fun lt!391377 () ListLongMap!9965)

(declare-fun lt!391385 () tuple2!11206)

(declare-fun lt!391383 () tuple2!11206)

(declare-fun +!2366 (ListLongMap!9965 tuple2!11206) ListLongMap!9965)

(assert (=> b!864638 (= lt!391381 (+!2366 (+!2366 lt!391377 lt!391385) lt!391383))))

(declare-datatypes ((Unit!29529 0))(
  ( (Unit!29530) )
))
(declare-fun lt!391387 () Unit!29529)

(declare-fun lt!391380 () V!27449)

(declare-fun v!557 () V!27449)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!508 (ListLongMap!9965 (_ BitVec 64) V!27449 (_ BitVec 64) V!27449) Unit!29529)

(assert (=> b!864638 (= lt!391387 (addCommutativeForDiffKeys!508 lt!391377 k0!854 v!557 (select (arr!23909 _keys!868) from!1053) lt!391380))))

(declare-fun mapIsEmpty!26801 () Bool)

(declare-fun mapRes!26801 () Bool)

(assert (=> mapIsEmpty!26801 mapRes!26801))

(declare-fun b!864639 () Bool)

(declare-fun res!587569 () Bool)

(assert (=> b!864639 (=> (not res!587569) (not e!481658))))

(assert (=> b!864639 (= res!587569 (and (= (select (arr!23909 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864640 () Bool)

(declare-fun res!587564 () Bool)

(assert (=> b!864640 (=> (not res!587564) (not e!481658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864640 (= res!587564 (validKeyInArray!0 k0!854))))

(declare-fun b!864641 () Bool)

(declare-fun e!481659 () Bool)

(assert (=> b!864641 (= e!481659 e!481655)))

(declare-fun res!587563 () Bool)

(assert (=> b!864641 (=> res!587563 e!481655)))

(assert (=> b!864641 (= res!587563 (= k0!854 (select (arr!23909 _keys!868) from!1053)))))

(assert (=> b!864641 (not (= (select (arr!23909 _keys!868) from!1053) k0!854))))

(declare-fun lt!391375 () Unit!29529)

(declare-fun e!481656 () Unit!29529)

(assert (=> b!864641 (= lt!391375 e!481656)))

(declare-fun c!92153 () Bool)

(assert (=> b!864641 (= c!92153 (= (select (arr!23909 _keys!868) from!1053) k0!854))))

(declare-fun lt!391379 () ListLongMap!9965)

(assert (=> b!864641 (= lt!391379 lt!391381)))

(declare-fun lt!391388 () ListLongMap!9965)

(assert (=> b!864641 (= lt!391381 (+!2366 lt!391388 lt!391385))))

(assert (=> b!864641 (= lt!391385 (tuple2!11207 (select (arr!23909 _keys!868) from!1053) lt!391380))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12636 (ValueCell!7961 V!27449) V!27449)

(declare-fun dynLambda!1167 (Int (_ BitVec 64)) V!27449)

(assert (=> b!864641 (= lt!391380 (get!12636 (select (arr!23910 _values!688) from!1053) (dynLambda!1167 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864642 () Bool)

(declare-fun Unit!29531 () Unit!29529)

(assert (=> b!864642 (= e!481656 Unit!29531)))

(declare-fun lt!391382 () Unit!29529)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49755 (_ BitVec 32) (_ BitVec 32)) Unit!29529)

(assert (=> b!864642 (= lt!391382 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17000 0))(
  ( (Nil!16997) (Cons!16996 (h!18127 (_ BitVec 64)) (t!23922 List!17000)) )
))
(declare-fun arrayNoDuplicates!0 (array!49755 (_ BitVec 32) List!17000) Bool)

(assert (=> b!864642 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16997)))

(declare-fun lt!391376 () Unit!29529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49755 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29529)

(assert (=> b!864642 (= lt!391376 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864642 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391384 () Unit!29529)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49755 (_ BitVec 64) (_ BitVec 32) List!17000) Unit!29529)

(assert (=> b!864642 (= lt!391384 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16997))))

(assert (=> b!864642 false))

(declare-fun b!864643 () Bool)

(declare-fun e!481657 () Bool)

(assert (=> b!864643 (= e!481657 tp_is_empty!16801)))

(declare-fun b!864644 () Bool)

(assert (=> b!864644 (= e!481660 (and e!481657 mapRes!26801))))

(declare-fun condMapEmpty!26801 () Bool)

(declare-fun mapDefault!26801 () ValueCell!7961)

(assert (=> b!864644 (= condMapEmpty!26801 (= (arr!23910 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7961)) mapDefault!26801)))))

(declare-fun b!864645 () Bool)

(declare-fun e!481662 () Bool)

(assert (=> b!864645 (= e!481658 e!481662)))

(declare-fun res!587561 () Bool)

(assert (=> b!864645 (=> (not res!587561) (not e!481662))))

(assert (=> b!864645 (= res!587561 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!391374 () array!49757)

(declare-fun minValue!654 () V!27449)

(declare-fun zeroValue!654 () V!27449)

(declare-fun getCurrentListMapNoExtraKeys!2997 (array!49755 array!49757 (_ BitVec 32) (_ BitVec 32) V!27449 V!27449 (_ BitVec 32) Int) ListLongMap!9965)

(assert (=> b!864645 (= lt!391379 (getCurrentListMapNoExtraKeys!2997 _keys!868 lt!391374 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864645 (= lt!391374 (array!49758 (store (arr!23910 _values!688) i!612 (ValueCellFull!7961 v!557)) (size!24352 _values!688)))))

(declare-fun lt!391378 () ListLongMap!9965)

(assert (=> b!864645 (= lt!391378 (getCurrentListMapNoExtraKeys!2997 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864646 () Bool)

(assert (=> b!864646 (= e!481662 (not e!481659))))

(declare-fun res!587570 () Bool)

(assert (=> b!864646 (=> res!587570 e!481659)))

(assert (=> b!864646 (= res!587570 (not (validKeyInArray!0 (select (arr!23909 _keys!868) from!1053))))))

(declare-fun lt!391373 () ListLongMap!9965)

(assert (=> b!864646 (= lt!391373 lt!391388)))

(assert (=> b!864646 (= lt!391388 (+!2366 lt!391377 lt!391383))))

(assert (=> b!864646 (= lt!391373 (getCurrentListMapNoExtraKeys!2997 _keys!868 lt!391374 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!864646 (= lt!391383 (tuple2!11207 k0!854 v!557))))

(assert (=> b!864646 (= lt!391377 (getCurrentListMapNoExtraKeys!2997 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391386 () Unit!29529)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!544 (array!49755 array!49757 (_ BitVec 32) (_ BitVec 32) V!27449 V!27449 (_ BitVec 32) (_ BitVec 64) V!27449 (_ BitVec 32) Int) Unit!29529)

(assert (=> b!864646 (= lt!391386 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!544 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864647 () Bool)

(declare-fun res!587568 () Bool)

(assert (=> b!864647 (=> (not res!587568) (not e!481658))))

(assert (=> b!864647 (= res!587568 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16997))))

(declare-fun b!864648 () Bool)

(declare-fun res!587565 () Bool)

(assert (=> b!864648 (=> (not res!587565) (not e!481658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864648 (= res!587565 (validMask!0 mask!1196))))

(declare-fun b!864649 () Bool)

(declare-fun res!587566 () Bool)

(assert (=> b!864649 (=> (not res!587566) (not e!481658))))

(assert (=> b!864649 (= res!587566 (and (= (size!24352 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24351 _keys!868) (size!24352 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864650 () Bool)

(declare-fun Unit!29532 () Unit!29529)

(assert (=> b!864650 (= e!481656 Unit!29532)))

(declare-fun mapNonEmpty!26801 () Bool)

(declare-fun tp!51499 () Bool)

(declare-fun e!481661 () Bool)

(assert (=> mapNonEmpty!26801 (= mapRes!26801 (and tp!51499 e!481661))))

(declare-fun mapRest!26801 () (Array (_ BitVec 32) ValueCell!7961))

(declare-fun mapValue!26801 () ValueCell!7961)

(declare-fun mapKey!26801 () (_ BitVec 32))

(assert (=> mapNonEmpty!26801 (= (arr!23910 _values!688) (store mapRest!26801 mapKey!26801 mapValue!26801))))

(declare-fun b!864651 () Bool)

(assert (=> b!864651 (= e!481661 tp_is_empty!16801)))

(assert (= (and start!73732 res!587571) b!864648))

(assert (= (and b!864648 res!587565) b!864649))

(assert (= (and b!864649 res!587566) b!864636))

(assert (= (and b!864636 res!587567) b!864647))

(assert (= (and b!864647 res!587568) b!864637))

(assert (= (and b!864637 res!587562) b!864640))

(assert (= (and b!864640 res!587564) b!864639))

(assert (= (and b!864639 res!587569) b!864645))

(assert (= (and b!864645 res!587561) b!864646))

(assert (= (and b!864646 (not res!587570)) b!864641))

(assert (= (and b!864641 c!92153) b!864642))

(assert (= (and b!864641 (not c!92153)) b!864650))

(assert (= (and b!864641 (not res!587563)) b!864638))

(assert (= (and b!864644 condMapEmpty!26801) mapIsEmpty!26801))

(assert (= (and b!864644 (not condMapEmpty!26801)) mapNonEmpty!26801))

(get-info :version)

(assert (= (and mapNonEmpty!26801 ((_ is ValueCellFull!7961) mapValue!26801)) b!864651))

(assert (= (and b!864644 ((_ is ValueCellFull!7961) mapDefault!26801)) b!864643))

(assert (= start!73732 b!864644))

(declare-fun b_lambda!11999 () Bool)

(assert (=> (not b_lambda!11999) (not b!864641)))

(declare-fun t!23920 () Bool)

(declare-fun tb!4779 () Bool)

(assert (=> (and start!73732 (= defaultEntry!696 defaultEntry!696) t!23920) tb!4779))

(declare-fun result!9177 () Bool)

(assert (=> tb!4779 (= result!9177 tp_is_empty!16801)))

(assert (=> b!864641 t!23920))

(declare-fun b_and!24285 () Bool)

(assert (= b_and!24283 (and (=> t!23920 result!9177) b_and!24285)))

(declare-fun m!805527 () Bool)

(assert (=> b!864641 m!805527))

(declare-fun m!805529 () Bool)

(assert (=> b!864641 m!805529))

(declare-fun m!805531 () Bool)

(assert (=> b!864641 m!805531))

(declare-fun m!805533 () Bool)

(assert (=> b!864641 m!805533))

(assert (=> b!864641 m!805529))

(declare-fun m!805535 () Bool)

(assert (=> b!864641 m!805535))

(assert (=> b!864641 m!805531))

(declare-fun m!805537 () Bool)

(assert (=> b!864638 m!805537))

(assert (=> b!864638 m!805537))

(declare-fun m!805539 () Bool)

(assert (=> b!864638 m!805539))

(assert (=> b!864638 m!805535))

(assert (=> b!864638 m!805535))

(declare-fun m!805541 () Bool)

(assert (=> b!864638 m!805541))

(declare-fun m!805543 () Bool)

(assert (=> b!864648 m!805543))

(declare-fun m!805545 () Bool)

(assert (=> b!864646 m!805545))

(declare-fun m!805547 () Bool)

(assert (=> b!864646 m!805547))

(declare-fun m!805549 () Bool)

(assert (=> b!864646 m!805549))

(assert (=> b!864646 m!805535))

(declare-fun m!805551 () Bool)

(assert (=> b!864646 m!805551))

(assert (=> b!864646 m!805535))

(declare-fun m!805553 () Bool)

(assert (=> b!864646 m!805553))

(declare-fun m!805555 () Bool)

(assert (=> b!864639 m!805555))

(declare-fun m!805557 () Bool)

(assert (=> b!864640 m!805557))

(declare-fun m!805559 () Bool)

(assert (=> start!73732 m!805559))

(declare-fun m!805561 () Bool)

(assert (=> start!73732 m!805561))

(declare-fun m!805563 () Bool)

(assert (=> b!864647 m!805563))

(declare-fun m!805565 () Bool)

(assert (=> b!864636 m!805565))

(declare-fun m!805567 () Bool)

(assert (=> b!864645 m!805567))

(declare-fun m!805569 () Bool)

(assert (=> b!864645 m!805569))

(declare-fun m!805571 () Bool)

(assert (=> b!864645 m!805571))

(declare-fun m!805573 () Bool)

(assert (=> b!864642 m!805573))

(declare-fun m!805575 () Bool)

(assert (=> b!864642 m!805575))

(declare-fun m!805577 () Bool)

(assert (=> b!864642 m!805577))

(declare-fun m!805579 () Bool)

(assert (=> b!864642 m!805579))

(declare-fun m!805581 () Bool)

(assert (=> b!864642 m!805581))

(declare-fun m!805583 () Bool)

(assert (=> mapNonEmpty!26801 m!805583))

(check-sat (not b_lambda!11999) (not b!864638) (not b!864645) (not b!864641) (not b!864648) (not b!864642) tp_is_empty!16801 (not b!864647) (not b!864646) (not b!864636) (not b_next!14665) b_and!24285 (not start!73732) (not mapNonEmpty!26801) (not b!864640))
(check-sat b_and!24285 (not b_next!14665))
