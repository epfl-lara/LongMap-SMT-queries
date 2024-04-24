; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73804 () Bool)

(assert start!73804)

(declare-fun b_free!14551 () Bool)

(declare-fun b_next!14551 () Bool)

(assert (=> start!73804 (= b_free!14551 (not b_next!14551))))

(declare-fun tp!51157 () Bool)

(declare-fun b_and!24091 () Bool)

(assert (=> start!73804 (= tp!51157 b_and!24091)))

(declare-fun b!862935 () Bool)

(declare-datatypes ((Unit!29425 0))(
  ( (Unit!29426) )
))
(declare-fun e!480855 () Unit!29425)

(declare-fun Unit!29427 () Unit!29425)

(assert (=> b!862935 (= e!480855 Unit!29427)))

(declare-fun lt!389278 () Unit!29425)

(declare-datatypes ((array!49595 0))(
  ( (array!49596 (arr!23824 (Array (_ BitVec 32) (_ BitVec 64))) (size!24265 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49595)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49595 (_ BitVec 32) (_ BitVec 32)) Unit!29425)

(assert (=> b!862935 (= lt!389278 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16860 0))(
  ( (Nil!16857) (Cons!16856 (h!17993 (_ BitVec 64)) (t!23669 List!16860)) )
))
(declare-fun arrayNoDuplicates!0 (array!49595 (_ BitVec 32) List!16860) Bool)

(assert (=> b!862935 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16857)))

(declare-fun lt!389274 () Unit!29425)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49595 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29425)

(assert (=> b!862935 (= lt!389274 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862935 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389277 () Unit!29425)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49595 (_ BitVec 64) (_ BitVec 32) List!16860) Unit!29425)

(assert (=> b!862935 (= lt!389277 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16857))))

(assert (=> b!862935 false))

(declare-fun b!862936 () Bool)

(declare-fun res!586149 () Bool)

(declare-fun e!480859 () Bool)

(assert (=> b!862936 (=> (not res!586149) (not e!480859))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27297 0))(
  ( (V!27298 (val!8391 Int)) )
))
(declare-datatypes ((ValueCell!7904 0))(
  ( (ValueCellFull!7904 (v!10816 V!27297)) (EmptyCell!7904) )
))
(declare-datatypes ((array!49597 0))(
  ( (array!49598 (arr!23825 (Array (_ BitVec 32) ValueCell!7904)) (size!24266 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49597)

(assert (=> b!862936 (= res!586149 (and (= (size!24266 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24265 _keys!868) (size!24266 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862937 () Bool)

(declare-fun e!480856 () Bool)

(declare-fun tp_is_empty!16687 () Bool)

(assert (=> b!862937 (= e!480856 tp_is_empty!16687)))

(declare-fun mapIsEmpty!26630 () Bool)

(declare-fun mapRes!26630 () Bool)

(assert (=> mapIsEmpty!26630 mapRes!26630))

(declare-fun mapNonEmpty!26630 () Bool)

(declare-fun tp!51158 () Bool)

(declare-fun e!480853 () Bool)

(assert (=> mapNonEmpty!26630 (= mapRes!26630 (and tp!51158 e!480853))))

(declare-fun mapValue!26630 () ValueCell!7904)

(declare-fun mapKey!26630 () (_ BitVec 32))

(declare-fun mapRest!26630 () (Array (_ BitVec 32) ValueCell!7904))

(assert (=> mapNonEmpty!26630 (= (arr!23825 _values!688) (store mapRest!26630 mapKey!26630 mapValue!26630))))

(declare-fun b!862938 () Bool)

(declare-fun res!586142 () Bool)

(assert (=> b!862938 (=> (not res!586142) (not e!480859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862938 (= res!586142 (validKeyInArray!0 k0!854))))

(declare-fun b!862939 () Bool)

(declare-fun res!586145 () Bool)

(assert (=> b!862939 (=> (not res!586145) (not e!480859))))

(assert (=> b!862939 (= res!586145 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16857))))

(declare-fun b!862940 () Bool)

(declare-fun e!480858 () Bool)

(assert (=> b!862940 (= e!480859 e!480858)))

(declare-fun res!586143 () Bool)

(assert (=> b!862940 (=> (not res!586143) (not e!480858))))

(assert (=> b!862940 (= res!586143 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11024 0))(
  ( (tuple2!11025 (_1!5523 (_ BitVec 64)) (_2!5523 V!27297)) )
))
(declare-datatypes ((List!16861 0))(
  ( (Nil!16858) (Cons!16857 (h!17994 tuple2!11024) (t!23670 List!16861)) )
))
(declare-datatypes ((ListLongMap!9795 0))(
  ( (ListLongMap!9796 (toList!4913 List!16861)) )
))
(declare-fun lt!389270 () ListLongMap!9795)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!389272 () array!49597)

(declare-fun minValue!654 () V!27297)

(declare-fun zeroValue!654 () V!27297)

(declare-fun getCurrentListMapNoExtraKeys!2964 (array!49595 array!49597 (_ BitVec 32) (_ BitVec 32) V!27297 V!27297 (_ BitVec 32) Int) ListLongMap!9795)

(assert (=> b!862940 (= lt!389270 (getCurrentListMapNoExtraKeys!2964 _keys!868 lt!389272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27297)

(assert (=> b!862940 (= lt!389272 (array!49598 (store (arr!23825 _values!688) i!612 (ValueCellFull!7904 v!557)) (size!24266 _values!688)))))

(declare-fun lt!389279 () ListLongMap!9795)

(assert (=> b!862940 (= lt!389279 (getCurrentListMapNoExtraKeys!2964 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862941 () Bool)

(declare-fun res!586150 () Bool)

(assert (=> b!862941 (=> (not res!586150) (not e!480859))))

(assert (=> b!862941 (= res!586150 (and (= (select (arr!23824 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862942 () Bool)

(assert (=> b!862942 (= e!480853 tp_is_empty!16687)))

(declare-fun b!862944 () Bool)

(declare-fun res!586147 () Bool)

(assert (=> b!862944 (=> (not res!586147) (not e!480859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862944 (= res!586147 (validMask!0 mask!1196))))

(declare-fun b!862945 () Bool)

(declare-fun Unit!29428 () Unit!29425)

(assert (=> b!862945 (= e!480855 Unit!29428)))

(declare-fun b!862946 () Bool)

(declare-fun e!480852 () Bool)

(assert (=> b!862946 (= e!480852 true)))

(assert (=> b!862946 (not (= (select (arr!23824 _keys!868) from!1053) k0!854))))

(declare-fun lt!389269 () Unit!29425)

(assert (=> b!862946 (= lt!389269 e!480855)))

(declare-fun c!92329 () Bool)

(assert (=> b!862946 (= c!92329 (= (select (arr!23824 _keys!868) from!1053) k0!854))))

(declare-fun lt!389275 () ListLongMap!9795)

(declare-fun +!2317 (ListLongMap!9795 tuple2!11024) ListLongMap!9795)

(declare-fun get!12579 (ValueCell!7904 V!27297) V!27297)

(declare-fun dynLambda!1145 (Int (_ BitVec 64)) V!27297)

(assert (=> b!862946 (= lt!389270 (+!2317 lt!389275 (tuple2!11025 (select (arr!23824 _keys!868) from!1053) (get!12579 (select (arr!23825 _values!688) from!1053) (dynLambda!1145 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862947 () Bool)

(declare-fun res!586148 () Bool)

(assert (=> b!862947 (=> (not res!586148) (not e!480859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49595 (_ BitVec 32)) Bool)

(assert (=> b!862947 (= res!586148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862948 () Bool)

(declare-fun res!586144 () Bool)

(assert (=> b!862948 (=> (not res!586144) (not e!480859))))

(assert (=> b!862948 (= res!586144 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24265 _keys!868))))))

(declare-fun b!862949 () Bool)

(declare-fun e!480854 () Bool)

(assert (=> b!862949 (= e!480854 (and e!480856 mapRes!26630))))

(declare-fun condMapEmpty!26630 () Bool)

(declare-fun mapDefault!26630 () ValueCell!7904)

(assert (=> b!862949 (= condMapEmpty!26630 (= (arr!23825 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7904)) mapDefault!26630)))))

(declare-fun b!862943 () Bool)

(assert (=> b!862943 (= e!480858 (not e!480852))))

(declare-fun res!586146 () Bool)

(assert (=> b!862943 (=> res!586146 e!480852)))

(assert (=> b!862943 (= res!586146 (not (validKeyInArray!0 (select (arr!23824 _keys!868) from!1053))))))

(declare-fun lt!389276 () ListLongMap!9795)

(assert (=> b!862943 (= lt!389276 lt!389275)))

(declare-fun lt!389271 () ListLongMap!9795)

(assert (=> b!862943 (= lt!389275 (+!2317 lt!389271 (tuple2!11025 k0!854 v!557)))))

(assert (=> b!862943 (= lt!389276 (getCurrentListMapNoExtraKeys!2964 _keys!868 lt!389272 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862943 (= lt!389271 (getCurrentListMapNoExtraKeys!2964 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389273 () Unit!29425)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!504 (array!49595 array!49597 (_ BitVec 32) (_ BitVec 32) V!27297 V!27297 (_ BitVec 32) (_ BitVec 64) V!27297 (_ BitVec 32) Int) Unit!29425)

(assert (=> b!862943 (= lt!389273 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!504 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!586141 () Bool)

(assert (=> start!73804 (=> (not res!586141) (not e!480859))))

(assert (=> start!73804 (= res!586141 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24265 _keys!868))))))

(assert (=> start!73804 e!480859))

(assert (=> start!73804 tp_is_empty!16687))

(assert (=> start!73804 true))

(assert (=> start!73804 tp!51157))

(declare-fun array_inv!18902 (array!49595) Bool)

(assert (=> start!73804 (array_inv!18902 _keys!868)))

(declare-fun array_inv!18903 (array!49597) Bool)

(assert (=> start!73804 (and (array_inv!18903 _values!688) e!480854)))

(assert (= (and start!73804 res!586141) b!862944))

(assert (= (and b!862944 res!586147) b!862936))

(assert (= (and b!862936 res!586149) b!862947))

(assert (= (and b!862947 res!586148) b!862939))

(assert (= (and b!862939 res!586145) b!862948))

(assert (= (and b!862948 res!586144) b!862938))

(assert (= (and b!862938 res!586142) b!862941))

(assert (= (and b!862941 res!586150) b!862940))

(assert (= (and b!862940 res!586143) b!862943))

(assert (= (and b!862943 (not res!586146)) b!862946))

(assert (= (and b!862946 c!92329) b!862935))

(assert (= (and b!862946 (not c!92329)) b!862945))

(assert (= (and b!862949 condMapEmpty!26630) mapIsEmpty!26630))

(assert (= (and b!862949 (not condMapEmpty!26630)) mapNonEmpty!26630))

(get-info :version)

(assert (= (and mapNonEmpty!26630 ((_ is ValueCellFull!7904) mapValue!26630)) b!862942))

(assert (= (and b!862949 ((_ is ValueCellFull!7904) mapDefault!26630)) b!862937))

(assert (= start!73804 b!862949))

(declare-fun b_lambda!11917 () Bool)

(assert (=> (not b_lambda!11917) (not b!862946)))

(declare-fun t!23668 () Bool)

(declare-fun tb!4665 () Bool)

(assert (=> (and start!73804 (= defaultEntry!696 defaultEntry!696) t!23668) tb!4665))

(declare-fun result!8949 () Bool)

(assert (=> tb!4665 (= result!8949 tp_is_empty!16687)))

(assert (=> b!862946 t!23668))

(declare-fun b_and!24093 () Bool)

(assert (= b_and!24091 (and (=> t!23668 result!8949) b_and!24093)))

(declare-fun m!804287 () Bool)

(assert (=> mapNonEmpty!26630 m!804287))

(declare-fun m!804289 () Bool)

(assert (=> start!73804 m!804289))

(declare-fun m!804291 () Bool)

(assert (=> start!73804 m!804291))

(declare-fun m!804293 () Bool)

(assert (=> b!862944 m!804293))

(declare-fun m!804295 () Bool)

(assert (=> b!862941 m!804295))

(declare-fun m!804297 () Bool)

(assert (=> b!862943 m!804297))

(declare-fun m!804299 () Bool)

(assert (=> b!862943 m!804299))

(declare-fun m!804301 () Bool)

(assert (=> b!862943 m!804301))

(declare-fun m!804303 () Bool)

(assert (=> b!862943 m!804303))

(declare-fun m!804305 () Bool)

(assert (=> b!862943 m!804305))

(assert (=> b!862943 m!804303))

(declare-fun m!804307 () Bool)

(assert (=> b!862943 m!804307))

(declare-fun m!804309 () Bool)

(assert (=> b!862940 m!804309))

(declare-fun m!804311 () Bool)

(assert (=> b!862940 m!804311))

(declare-fun m!804313 () Bool)

(assert (=> b!862940 m!804313))

(declare-fun m!804315 () Bool)

(assert (=> b!862939 m!804315))

(declare-fun m!804317 () Bool)

(assert (=> b!862938 m!804317))

(declare-fun m!804319 () Bool)

(assert (=> b!862947 m!804319))

(declare-fun m!804321 () Bool)

(assert (=> b!862935 m!804321))

(declare-fun m!804323 () Bool)

(assert (=> b!862935 m!804323))

(declare-fun m!804325 () Bool)

(assert (=> b!862935 m!804325))

(declare-fun m!804327 () Bool)

(assert (=> b!862935 m!804327))

(declare-fun m!804329 () Bool)

(assert (=> b!862935 m!804329))

(declare-fun m!804331 () Bool)

(assert (=> b!862946 m!804331))

(declare-fun m!804333 () Bool)

(assert (=> b!862946 m!804333))

(declare-fun m!804335 () Bool)

(assert (=> b!862946 m!804335))

(declare-fun m!804337 () Bool)

(assert (=> b!862946 m!804337))

(assert (=> b!862946 m!804333))

(assert (=> b!862946 m!804303))

(assert (=> b!862946 m!804335))

(check-sat (not b!862947) (not b!862935) (not b_lambda!11917) (not b!862944) (not b!862943) (not mapNonEmpty!26630) (not b_next!14551) tp_is_empty!16687 (not start!73804) (not b!862940) (not b!862946) b_and!24093 (not b!862939) (not b!862938))
(check-sat b_and!24093 (not b_next!14551))
