; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73660 () Bool)

(assert start!73660)

(declare-fun b_free!14593 () Bool)

(declare-fun b_next!14593 () Bool)

(assert (=> start!73660 (= b_free!14593 (not b_next!14593))))

(declare-fun tp!51284 () Bool)

(declare-fun b_and!24139 () Bool)

(assert (=> start!73660 (= tp!51284 b_and!24139)))

(declare-fun b!862836 () Bool)

(declare-fun e!480683 () Bool)

(declare-fun tp_is_empty!16729 () Bool)

(assert (=> b!862836 (= e!480683 tp_is_empty!16729)))

(declare-fun mapIsEmpty!26693 () Bool)

(declare-fun mapRes!26693 () Bool)

(assert (=> mapIsEmpty!26693 mapRes!26693))

(declare-fun b!862837 () Bool)

(declare-fun res!586378 () Bool)

(declare-fun e!480689 () Bool)

(assert (=> b!862837 (=> (not res!586378) (not e!480689))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49611 0))(
  ( (array!49612 (arr!23837 (Array (_ BitVec 32) (_ BitVec 64))) (size!24279 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49611)

(declare-datatypes ((V!27353 0))(
  ( (V!27354 (val!8412 Int)) )
))
(declare-datatypes ((ValueCell!7925 0))(
  ( (ValueCellFull!7925 (v!10831 V!27353)) (EmptyCell!7925) )
))
(declare-datatypes ((array!49613 0))(
  ( (array!49614 (arr!23838 (Array (_ BitVec 32) ValueCell!7925)) (size!24280 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49613)

(assert (=> b!862837 (= res!586378 (and (= (size!24280 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24279 _keys!868) (size!24280 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862838 () Bool)

(declare-fun res!586377 () Bool)

(assert (=> b!862838 (=> (not res!586377) (not e!480689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49611 (_ BitVec 32)) Bool)

(assert (=> b!862838 (= res!586377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862839 () Bool)

(declare-datatypes ((Unit!29409 0))(
  ( (Unit!29410) )
))
(declare-fun e!480690 () Unit!29409)

(declare-fun Unit!29411 () Unit!29409)

(assert (=> b!862839 (= e!480690 Unit!29411)))

(declare-fun lt!389657 () Unit!29409)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49611 (_ BitVec 32) (_ BitVec 32)) Unit!29409)

(assert (=> b!862839 (= lt!389657 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16937 0))(
  ( (Nil!16934) (Cons!16933 (h!18064 (_ BitVec 64)) (t!23787 List!16937)) )
))
(declare-fun arrayNoDuplicates!0 (array!49611 (_ BitVec 32) List!16937) Bool)

(assert (=> b!862839 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16934)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!389655 () Unit!29409)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29409)

(assert (=> b!862839 (= lt!389655 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862839 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389649 () Unit!29409)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49611 (_ BitVec 64) (_ BitVec 32) List!16937) Unit!29409)

(assert (=> b!862839 (= lt!389649 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16934))))

(assert (=> b!862839 false))

(declare-fun b!862840 () Bool)

(declare-fun e!480682 () Bool)

(assert (=> b!862840 (= e!480682 (and e!480683 mapRes!26693))))

(declare-fun condMapEmpty!26693 () Bool)

(declare-fun mapDefault!26693 () ValueCell!7925)

(assert (=> b!862840 (= condMapEmpty!26693 (= (arr!23838 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7925)) mapDefault!26693)))))

(declare-fun b!862841 () Bool)

(declare-fun res!586383 () Bool)

(assert (=> b!862841 (=> (not res!586383) (not e!480689))))

(assert (=> b!862841 (= res!586383 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16934))))

(declare-fun mapNonEmpty!26693 () Bool)

(declare-fun tp!51283 () Bool)

(declare-fun e!480685 () Bool)

(assert (=> mapNonEmpty!26693 (= mapRes!26693 (and tp!51283 e!480685))))

(declare-fun mapRest!26693 () (Array (_ BitVec 32) ValueCell!7925))

(declare-fun mapKey!26693 () (_ BitVec 32))

(declare-fun mapValue!26693 () ValueCell!7925)

(assert (=> mapNonEmpty!26693 (= (arr!23838 _values!688) (store mapRest!26693 mapKey!26693 mapValue!26693))))

(declare-fun b!862842 () Bool)

(declare-fun e!480687 () Bool)

(assert (=> b!862842 (= e!480689 e!480687)))

(declare-fun res!586382 () Bool)

(assert (=> b!862842 (=> (not res!586382) (not e!480687))))

(assert (=> b!862842 (= res!586382 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11142 0))(
  ( (tuple2!11143 (_1!5582 (_ BitVec 64)) (_2!5582 V!27353)) )
))
(declare-datatypes ((List!16938 0))(
  ( (Nil!16935) (Cons!16934 (h!18065 tuple2!11142) (t!23788 List!16938)) )
))
(declare-datatypes ((ListLongMap!9901 0))(
  ( (ListLongMap!9902 (toList!4966 List!16938)) )
))
(declare-fun lt!389645 () ListLongMap!9901)

(declare-fun lt!389650 () array!49613)

(declare-fun minValue!654 () V!27353)

(declare-fun zeroValue!654 () V!27353)

(declare-fun getCurrentListMapNoExtraKeys!2967 (array!49611 array!49613 (_ BitVec 32) (_ BitVec 32) V!27353 V!27353 (_ BitVec 32) Int) ListLongMap!9901)

(assert (=> b!862842 (= lt!389645 (getCurrentListMapNoExtraKeys!2967 _keys!868 lt!389650 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27353)

(assert (=> b!862842 (= lt!389650 (array!49614 (store (arr!23838 _values!688) i!612 (ValueCellFull!7925 v!557)) (size!24280 _values!688)))))

(declare-fun lt!389660 () ListLongMap!9901)

(assert (=> b!862842 (= lt!389660 (getCurrentListMapNoExtraKeys!2967 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862843 () Bool)

(declare-fun e!480684 () Bool)

(assert (=> b!862843 (= e!480684 true)))

(declare-fun lt!389646 () tuple2!11142)

(declare-fun lt!389653 () tuple2!11142)

(declare-fun lt!389658 () ListLongMap!9901)

(declare-fun lt!389647 () ListLongMap!9901)

(declare-fun +!2335 (ListLongMap!9901 tuple2!11142) ListLongMap!9901)

(assert (=> b!862843 (= lt!389647 (+!2335 (+!2335 lt!389658 lt!389653) lt!389646))))

(declare-fun lt!389651 () Unit!29409)

(declare-fun lt!389648 () V!27353)

(declare-fun addCommutativeForDiffKeys!484 (ListLongMap!9901 (_ BitVec 64) V!27353 (_ BitVec 64) V!27353) Unit!29409)

(assert (=> b!862843 (= lt!389651 (addCommutativeForDiffKeys!484 lt!389658 k0!854 v!557 (select (arr!23837 _keys!868) from!1053) lt!389648))))

(declare-fun b!862844 () Bool)

(declare-fun e!480688 () Bool)

(assert (=> b!862844 (= e!480687 (not e!480688))))

(declare-fun res!586381 () Bool)

(assert (=> b!862844 (=> res!586381 e!480688)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862844 (= res!586381 (not (validKeyInArray!0 (select (arr!23837 _keys!868) from!1053))))))

(declare-fun lt!389652 () ListLongMap!9901)

(declare-fun lt!389656 () ListLongMap!9901)

(assert (=> b!862844 (= lt!389652 lt!389656)))

(assert (=> b!862844 (= lt!389656 (+!2335 lt!389658 lt!389646))))

(assert (=> b!862844 (= lt!389652 (getCurrentListMapNoExtraKeys!2967 _keys!868 lt!389650 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862844 (= lt!389646 (tuple2!11143 k0!854 v!557))))

(assert (=> b!862844 (= lt!389658 (getCurrentListMapNoExtraKeys!2967 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389654 () Unit!29409)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!520 (array!49611 array!49613 (_ BitVec 32) (_ BitVec 32) V!27353 V!27353 (_ BitVec 32) (_ BitVec 64) V!27353 (_ BitVec 32) Int) Unit!29409)

(assert (=> b!862844 (= lt!389654 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!520 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862845 () Bool)

(assert (=> b!862845 (= e!480685 tp_is_empty!16729)))

(declare-fun b!862846 () Bool)

(declare-fun res!586374 () Bool)

(assert (=> b!862846 (=> (not res!586374) (not e!480689))))

(assert (=> b!862846 (= res!586374 (validKeyInArray!0 k0!854))))

(declare-fun b!862847 () Bool)

(declare-fun res!586375 () Bool)

(assert (=> b!862847 (=> (not res!586375) (not e!480689))))

(assert (=> b!862847 (= res!586375 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24279 _keys!868))))))

(declare-fun b!862848 () Bool)

(declare-fun res!586380 () Bool)

(assert (=> b!862848 (=> (not res!586380) (not e!480689))))

(assert (=> b!862848 (= res!586380 (and (= (select (arr!23837 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862849 () Bool)

(assert (=> b!862849 (= e!480688 e!480684)))

(declare-fun res!586376 () Bool)

(assert (=> b!862849 (=> res!586376 e!480684)))

(assert (=> b!862849 (= res!586376 (= k0!854 (select (arr!23837 _keys!868) from!1053)))))

(assert (=> b!862849 (not (= (select (arr!23837 _keys!868) from!1053) k0!854))))

(declare-fun lt!389659 () Unit!29409)

(assert (=> b!862849 (= lt!389659 e!480690)))

(declare-fun c!92045 () Bool)

(assert (=> b!862849 (= c!92045 (= (select (arr!23837 _keys!868) from!1053) k0!854))))

(assert (=> b!862849 (= lt!389645 lt!389647)))

(assert (=> b!862849 (= lt!389647 (+!2335 lt!389656 lt!389653))))

(assert (=> b!862849 (= lt!389653 (tuple2!11143 (select (arr!23837 _keys!868) from!1053) lt!389648))))

(declare-fun get!12583 (ValueCell!7925 V!27353) V!27353)

(declare-fun dynLambda!1138 (Int (_ BitVec 64)) V!27353)

(assert (=> b!862849 (= lt!389648 (get!12583 (select (arr!23838 _values!688) from!1053) (dynLambda!1138 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!586379 () Bool)

(assert (=> start!73660 (=> (not res!586379) (not e!480689))))

(assert (=> start!73660 (= res!586379 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24279 _keys!868))))))

(assert (=> start!73660 e!480689))

(assert (=> start!73660 tp_is_empty!16729))

(assert (=> start!73660 true))

(assert (=> start!73660 tp!51284))

(declare-fun array_inv!18928 (array!49611) Bool)

(assert (=> start!73660 (array_inv!18928 _keys!868)))

(declare-fun array_inv!18929 (array!49613) Bool)

(assert (=> start!73660 (and (array_inv!18929 _values!688) e!480682)))

(declare-fun b!862850 () Bool)

(declare-fun res!586373 () Bool)

(assert (=> b!862850 (=> (not res!586373) (not e!480689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862850 (= res!586373 (validMask!0 mask!1196))))

(declare-fun b!862851 () Bool)

(declare-fun Unit!29412 () Unit!29409)

(assert (=> b!862851 (= e!480690 Unit!29412)))

(assert (= (and start!73660 res!586379) b!862850))

(assert (= (and b!862850 res!586373) b!862837))

(assert (= (and b!862837 res!586378) b!862838))

(assert (= (and b!862838 res!586377) b!862841))

(assert (= (and b!862841 res!586383) b!862847))

(assert (= (and b!862847 res!586375) b!862846))

(assert (= (and b!862846 res!586374) b!862848))

(assert (= (and b!862848 res!586380) b!862842))

(assert (= (and b!862842 res!586382) b!862844))

(assert (= (and b!862844 (not res!586381)) b!862849))

(assert (= (and b!862849 c!92045) b!862839))

(assert (= (and b!862849 (not c!92045)) b!862851))

(assert (= (and b!862849 (not res!586376)) b!862843))

(assert (= (and b!862840 condMapEmpty!26693) mapIsEmpty!26693))

(assert (= (and b!862840 (not condMapEmpty!26693)) mapNonEmpty!26693))

(get-info :version)

(assert (= (and mapNonEmpty!26693 ((_ is ValueCellFull!7925) mapValue!26693)) b!862845))

(assert (= (and b!862840 ((_ is ValueCellFull!7925) mapDefault!26693)) b!862836))

(assert (= start!73660 b!862840))

(declare-fun b_lambda!11927 () Bool)

(assert (=> (not b_lambda!11927) (not b!862849)))

(declare-fun t!23786 () Bool)

(declare-fun tb!4707 () Bool)

(assert (=> (and start!73660 (= defaultEntry!696 defaultEntry!696) t!23786) tb!4707))

(declare-fun result!9033 () Bool)

(assert (=> tb!4707 (= result!9033 tp_is_empty!16729)))

(assert (=> b!862849 t!23786))

(declare-fun b_and!24141 () Bool)

(assert (= b_and!24139 (and (=> t!23786 result!9033) b_and!24141)))

(declare-fun m!803439 () Bool)

(assert (=> b!862849 m!803439))

(declare-fun m!803441 () Bool)

(assert (=> b!862849 m!803441))

(declare-fun m!803443 () Bool)

(assert (=> b!862849 m!803443))

(declare-fun m!803445 () Bool)

(assert (=> b!862849 m!803445))

(assert (=> b!862849 m!803441))

(declare-fun m!803447 () Bool)

(assert (=> b!862849 m!803447))

(assert (=> b!862849 m!803443))

(declare-fun m!803449 () Bool)

(assert (=> b!862843 m!803449))

(assert (=> b!862843 m!803449))

(declare-fun m!803451 () Bool)

(assert (=> b!862843 m!803451))

(assert (=> b!862843 m!803447))

(assert (=> b!862843 m!803447))

(declare-fun m!803453 () Bool)

(assert (=> b!862843 m!803453))

(declare-fun m!803455 () Bool)

(assert (=> mapNonEmpty!26693 m!803455))

(declare-fun m!803457 () Bool)

(assert (=> b!862839 m!803457))

(declare-fun m!803459 () Bool)

(assert (=> b!862839 m!803459))

(declare-fun m!803461 () Bool)

(assert (=> b!862839 m!803461))

(declare-fun m!803463 () Bool)

(assert (=> b!862839 m!803463))

(declare-fun m!803465 () Bool)

(assert (=> b!862839 m!803465))

(declare-fun m!803467 () Bool)

(assert (=> b!862838 m!803467))

(declare-fun m!803469 () Bool)

(assert (=> start!73660 m!803469))

(declare-fun m!803471 () Bool)

(assert (=> start!73660 m!803471))

(declare-fun m!803473 () Bool)

(assert (=> b!862841 m!803473))

(declare-fun m!803475 () Bool)

(assert (=> b!862846 m!803475))

(declare-fun m!803477 () Bool)

(assert (=> b!862844 m!803477))

(declare-fun m!803479 () Bool)

(assert (=> b!862844 m!803479))

(assert (=> b!862844 m!803447))

(declare-fun m!803481 () Bool)

(assert (=> b!862844 m!803481))

(assert (=> b!862844 m!803447))

(declare-fun m!803483 () Bool)

(assert (=> b!862844 m!803483))

(declare-fun m!803485 () Bool)

(assert (=> b!862844 m!803485))

(declare-fun m!803487 () Bool)

(assert (=> b!862848 m!803487))

(declare-fun m!803489 () Bool)

(assert (=> b!862842 m!803489))

(declare-fun m!803491 () Bool)

(assert (=> b!862842 m!803491))

(declare-fun m!803493 () Bool)

(assert (=> b!862842 m!803493))

(declare-fun m!803495 () Bool)

(assert (=> b!862850 m!803495))

(check-sat (not b!862844) (not b!862838) (not mapNonEmpty!26693) b_and!24141 (not start!73660) (not b_lambda!11927) (not b!862850) (not b!862842) (not b!862849) (not b!862843) tp_is_empty!16729 (not b_next!14593) (not b!862846) (not b!862839) (not b!862841))
(check-sat b_and!24141 (not b_next!14593))
