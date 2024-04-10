; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73782 () Bool)

(assert start!73782)

(declare-fun b_free!14697 () Bool)

(declare-fun b_next!14697 () Bool)

(assert (=> start!73782 (= b_free!14697 (not b_next!14697))))

(declare-fun tp!51594 () Bool)

(declare-fun b_and!24373 () Bool)

(assert (=> start!73782 (= tp!51594 b_and!24373)))

(declare-fun res!588202 () Bool)

(declare-fun e!482239 () Bool)

(assert (=> start!73782 (=> (not res!588202) (not e!482239))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49826 0))(
  ( (array!49827 (arr!23944 (Array (_ BitVec 32) (_ BitVec 64))) (size!24384 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49826)

(assert (=> start!73782 (= res!588202 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24384 _keys!868))))))

(assert (=> start!73782 e!482239))

(declare-fun tp_is_empty!16833 () Bool)

(assert (=> start!73782 tp_is_empty!16833))

(assert (=> start!73782 true))

(assert (=> start!73782 tp!51594))

(declare-fun array_inv!18930 (array!49826) Bool)

(assert (=> start!73782 (array_inv!18930 _keys!868)))

(declare-datatypes ((V!27491 0))(
  ( (V!27492 (val!8464 Int)) )
))
(declare-datatypes ((ValueCell!7977 0))(
  ( (ValueCellFull!7977 (v!10889 V!27491)) (EmptyCell!7977) )
))
(declare-datatypes ((array!49828 0))(
  ( (array!49829 (arr!23945 (Array (_ BitVec 32) ValueCell!7977)) (size!24385 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49828)

(declare-fun e!482234 () Bool)

(declare-fun array_inv!18931 (array!49828) Bool)

(assert (=> start!73782 (and (array_inv!18931 _values!688) e!482234)))

(declare-fun b!865675 () Bool)

(declare-datatypes ((Unit!29653 0))(
  ( (Unit!29654) )
))
(declare-fun e!482235 () Unit!29653)

(declare-fun Unit!29655 () Unit!29653)

(assert (=> b!865675 (= e!482235 Unit!29655)))

(declare-fun mapIsEmpty!26849 () Bool)

(declare-fun mapRes!26849 () Bool)

(assert (=> mapIsEmpty!26849 mapRes!26849))

(declare-fun b!865676 () Bool)

(declare-fun e!482240 () Bool)

(declare-fun e!482241 () Bool)

(assert (=> b!865676 (= e!482240 e!482241)))

(declare-fun res!588203 () Bool)

(assert (=> b!865676 (=> res!588203 e!482241)))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!865676 (= res!588203 (= k0!854 (select (arr!23944 _keys!868) from!1053)))))

(assert (=> b!865676 (not (= (select (arr!23944 _keys!868) from!1053) k0!854))))

(declare-fun lt!392379 () Unit!29653)

(assert (=> b!865676 (= lt!392379 e!482235)))

(declare-fun c!92266 () Bool)

(assert (=> b!865676 (= c!92266 (= (select (arr!23944 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11218 0))(
  ( (tuple2!11219 (_1!5620 (_ BitVec 64)) (_2!5620 V!27491)) )
))
(declare-datatypes ((List!17021 0))(
  ( (Nil!17018) (Cons!17017 (h!18148 tuple2!11218) (t!23984 List!17021)) )
))
(declare-datatypes ((ListLongMap!9987 0))(
  ( (ListLongMap!9988 (toList!5009 List!17021)) )
))
(declare-fun lt!392380 () ListLongMap!9987)

(declare-fun lt!392381 () ListLongMap!9987)

(assert (=> b!865676 (= lt!392380 lt!392381)))

(declare-fun lt!392377 () ListLongMap!9987)

(declare-fun lt!392392 () tuple2!11218)

(declare-fun +!2358 (ListLongMap!9987 tuple2!11218) ListLongMap!9987)

(assert (=> b!865676 (= lt!392381 (+!2358 lt!392377 lt!392392))))

(declare-fun lt!392378 () V!27491)

(assert (=> b!865676 (= lt!392392 (tuple2!11219 (select (arr!23944 _keys!868) from!1053) lt!392378))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12656 (ValueCell!7977 V!27491) V!27491)

(declare-fun dynLambda!1180 (Int (_ BitVec 64)) V!27491)

(assert (=> b!865676 (= lt!392378 (get!12656 (select (arr!23945 _values!688) from!1053) (dynLambda!1180 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865677 () Bool)

(declare-fun res!588201 () Bool)

(assert (=> b!865677 (=> (not res!588201) (not e!482239))))

(declare-datatypes ((List!17022 0))(
  ( (Nil!17019) (Cons!17018 (h!18149 (_ BitVec 64)) (t!23985 List!17022)) )
))
(declare-fun arrayNoDuplicates!0 (array!49826 (_ BitVec 32) List!17022) Bool)

(assert (=> b!865677 (= res!588201 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17019))))

(declare-fun b!865678 () Bool)

(declare-fun e!482236 () Bool)

(assert (=> b!865678 (= e!482236 tp_is_empty!16833)))

(declare-fun b!865679 () Bool)

(declare-fun res!588208 () Bool)

(assert (=> b!865679 (=> (not res!588208) (not e!482239))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865679 (= res!588208 (validMask!0 mask!1196))))

(declare-fun b!865680 () Bool)

(declare-fun res!588204 () Bool)

(assert (=> b!865680 (=> (not res!588204) (not e!482239))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865680 (= res!588204 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24384 _keys!868))))))

(declare-fun mapNonEmpty!26849 () Bool)

(declare-fun tp!51595 () Bool)

(declare-fun e!482242 () Bool)

(assert (=> mapNonEmpty!26849 (= mapRes!26849 (and tp!51595 e!482242))))

(declare-fun mapRest!26849 () (Array (_ BitVec 32) ValueCell!7977))

(declare-fun mapValue!26849 () ValueCell!7977)

(declare-fun mapKey!26849 () (_ BitVec 32))

(assert (=> mapNonEmpty!26849 (= (arr!23945 _values!688) (store mapRest!26849 mapKey!26849 mapValue!26849))))

(declare-fun b!865681 () Bool)

(declare-fun res!588209 () Bool)

(assert (=> b!865681 (=> (not res!588209) (not e!482239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49826 (_ BitVec 32)) Bool)

(assert (=> b!865681 (= res!588209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865682 () Bool)

(assert (=> b!865682 (= e!482242 tp_is_empty!16833)))

(declare-fun b!865683 () Bool)

(declare-fun e!482238 () Bool)

(assert (=> b!865683 (= e!482239 e!482238)))

(declare-fun res!588206 () Bool)

(assert (=> b!865683 (=> (not res!588206) (not e!482238))))

(assert (=> b!865683 (= res!588206 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392389 () array!49828)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27491)

(declare-fun zeroValue!654 () V!27491)

(declare-fun getCurrentListMapNoExtraKeys!2980 (array!49826 array!49828 (_ BitVec 32) (_ BitVec 32) V!27491 V!27491 (_ BitVec 32) Int) ListLongMap!9987)

(assert (=> b!865683 (= lt!392380 (getCurrentListMapNoExtraKeys!2980 _keys!868 lt!392389 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27491)

(assert (=> b!865683 (= lt!392389 (array!49829 (store (arr!23945 _values!688) i!612 (ValueCellFull!7977 v!557)) (size!24385 _values!688)))))

(declare-fun lt!392386 () ListLongMap!9987)

(assert (=> b!865683 (= lt!392386 (getCurrentListMapNoExtraKeys!2980 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865684 () Bool)

(declare-fun res!588205 () Bool)

(assert (=> b!865684 (=> (not res!588205) (not e!482239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865684 (= res!588205 (validKeyInArray!0 k0!854))))

(declare-fun b!865685 () Bool)

(assert (=> b!865685 (= e!482234 (and e!482236 mapRes!26849))))

(declare-fun condMapEmpty!26849 () Bool)

(declare-fun mapDefault!26849 () ValueCell!7977)

(assert (=> b!865685 (= condMapEmpty!26849 (= (arr!23945 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7977)) mapDefault!26849)))))

(declare-fun b!865686 () Bool)

(declare-fun res!588207 () Bool)

(assert (=> b!865686 (=> (not res!588207) (not e!482239))))

(assert (=> b!865686 (= res!588207 (and (= (size!24385 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24384 _keys!868) (size!24385 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865687 () Bool)

(assert (=> b!865687 (= e!482238 (not e!482240))))

(declare-fun res!588199 () Bool)

(assert (=> b!865687 (=> res!588199 e!482240)))

(assert (=> b!865687 (= res!588199 (not (validKeyInArray!0 (select (arr!23944 _keys!868) from!1053))))))

(declare-fun lt!392384 () ListLongMap!9987)

(assert (=> b!865687 (= lt!392384 lt!392377)))

(declare-fun lt!392387 () ListLongMap!9987)

(declare-fun lt!392382 () tuple2!11218)

(assert (=> b!865687 (= lt!392377 (+!2358 lt!392387 lt!392382))))

(assert (=> b!865687 (= lt!392384 (getCurrentListMapNoExtraKeys!2980 _keys!868 lt!392389 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865687 (= lt!392382 (tuple2!11219 k0!854 v!557))))

(assert (=> b!865687 (= lt!392387 (getCurrentListMapNoExtraKeys!2980 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392391 () Unit!29653)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!558 (array!49826 array!49828 (_ BitVec 32) (_ BitVec 32) V!27491 V!27491 (_ BitVec 32) (_ BitVec 64) V!27491 (_ BitVec 32) Int) Unit!29653)

(assert (=> b!865687 (= lt!392391 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!558 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865688 () Bool)

(declare-fun res!588200 () Bool)

(assert (=> b!865688 (=> (not res!588200) (not e!482239))))

(assert (=> b!865688 (= res!588200 (and (= (select (arr!23944 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865689 () Bool)

(assert (=> b!865689 (= e!482241 true)))

(assert (=> b!865689 (= lt!392381 (+!2358 (+!2358 lt!392387 lt!392392) lt!392382))))

(declare-fun lt!392385 () Unit!29653)

(declare-fun addCommutativeForDiffKeys!527 (ListLongMap!9987 (_ BitVec 64) V!27491 (_ BitVec 64) V!27491) Unit!29653)

(assert (=> b!865689 (= lt!392385 (addCommutativeForDiffKeys!527 lt!392387 k0!854 v!557 (select (arr!23944 _keys!868) from!1053) lt!392378))))

(declare-fun b!865690 () Bool)

(declare-fun Unit!29656 () Unit!29653)

(assert (=> b!865690 (= e!482235 Unit!29656)))

(declare-fun lt!392388 () Unit!29653)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49826 (_ BitVec 32) (_ BitVec 32)) Unit!29653)

(assert (=> b!865690 (= lt!392388 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865690 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17019)))

(declare-fun lt!392383 () Unit!29653)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49826 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29653)

(assert (=> b!865690 (= lt!392383 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865690 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392390 () Unit!29653)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49826 (_ BitVec 64) (_ BitVec 32) List!17022) Unit!29653)

(assert (=> b!865690 (= lt!392390 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17019))))

(assert (=> b!865690 false))

(assert (= (and start!73782 res!588202) b!865679))

(assert (= (and b!865679 res!588208) b!865686))

(assert (= (and b!865686 res!588207) b!865681))

(assert (= (and b!865681 res!588209) b!865677))

(assert (= (and b!865677 res!588201) b!865680))

(assert (= (and b!865680 res!588204) b!865684))

(assert (= (and b!865684 res!588205) b!865688))

(assert (= (and b!865688 res!588200) b!865683))

(assert (= (and b!865683 res!588206) b!865687))

(assert (= (and b!865687 (not res!588199)) b!865676))

(assert (= (and b!865676 c!92266) b!865690))

(assert (= (and b!865676 (not c!92266)) b!865675))

(assert (= (and b!865676 (not res!588203)) b!865689))

(assert (= (and b!865685 condMapEmpty!26849) mapIsEmpty!26849))

(assert (= (and b!865685 (not condMapEmpty!26849)) mapNonEmpty!26849))

(get-info :version)

(assert (= (and mapNonEmpty!26849 ((_ is ValueCellFull!7977) mapValue!26849)) b!865682))

(assert (= (and b!865685 ((_ is ValueCellFull!7977) mapDefault!26849)) b!865678))

(assert (= start!73782 b!865685))

(declare-fun b_lambda!12049 () Bool)

(assert (=> (not b_lambda!12049) (not b!865676)))

(declare-fun t!23983 () Bool)

(declare-fun tb!4819 () Bool)

(assert (=> (and start!73782 (= defaultEntry!696 defaultEntry!696) t!23983) tb!4819))

(declare-fun result!9249 () Bool)

(assert (=> tb!4819 (= result!9249 tp_is_empty!16833)))

(assert (=> b!865676 t!23983))

(declare-fun b_and!24375 () Bool)

(assert (= b_and!24373 (and (=> t!23983 result!9249) b_and!24375)))

(declare-fun m!807213 () Bool)

(assert (=> start!73782 m!807213))

(declare-fun m!807215 () Bool)

(assert (=> start!73782 m!807215))

(declare-fun m!807217 () Bool)

(assert (=> b!865679 m!807217))

(declare-fun m!807219 () Bool)

(assert (=> b!865689 m!807219))

(assert (=> b!865689 m!807219))

(declare-fun m!807221 () Bool)

(assert (=> b!865689 m!807221))

(declare-fun m!807223 () Bool)

(assert (=> b!865689 m!807223))

(assert (=> b!865689 m!807223))

(declare-fun m!807225 () Bool)

(assert (=> b!865689 m!807225))

(declare-fun m!807227 () Bool)

(assert (=> b!865690 m!807227))

(declare-fun m!807229 () Bool)

(assert (=> b!865690 m!807229))

(declare-fun m!807231 () Bool)

(assert (=> b!865690 m!807231))

(declare-fun m!807233 () Bool)

(assert (=> b!865690 m!807233))

(declare-fun m!807235 () Bool)

(assert (=> b!865690 m!807235))

(declare-fun m!807237 () Bool)

(assert (=> b!865676 m!807237))

(declare-fun m!807239 () Bool)

(assert (=> b!865676 m!807239))

(declare-fun m!807241 () Bool)

(assert (=> b!865676 m!807241))

(declare-fun m!807243 () Bool)

(assert (=> b!865676 m!807243))

(assert (=> b!865676 m!807239))

(assert (=> b!865676 m!807223))

(assert (=> b!865676 m!807241))

(declare-fun m!807245 () Bool)

(assert (=> b!865688 m!807245))

(declare-fun m!807247 () Bool)

(assert (=> mapNonEmpty!26849 m!807247))

(declare-fun m!807249 () Bool)

(assert (=> b!865684 m!807249))

(declare-fun m!807251 () Bool)

(assert (=> b!865681 m!807251))

(declare-fun m!807253 () Bool)

(assert (=> b!865687 m!807253))

(declare-fun m!807255 () Bool)

(assert (=> b!865687 m!807255))

(assert (=> b!865687 m!807223))

(declare-fun m!807257 () Bool)

(assert (=> b!865687 m!807257))

(assert (=> b!865687 m!807223))

(declare-fun m!807259 () Bool)

(assert (=> b!865687 m!807259))

(declare-fun m!807261 () Bool)

(assert (=> b!865687 m!807261))

(declare-fun m!807263 () Bool)

(assert (=> b!865683 m!807263))

(declare-fun m!807265 () Bool)

(assert (=> b!865683 m!807265))

(declare-fun m!807267 () Bool)

(assert (=> b!865683 m!807267))

(declare-fun m!807269 () Bool)

(assert (=> b!865677 m!807269))

(check-sat (not b_lambda!12049) (not mapNonEmpty!26849) (not b!865676) (not b!865684) b_and!24375 (not b!865681) (not b!865683) (not b!865677) (not b!865689) (not b!865687) (not start!73782) (not b!865690) (not b_next!14697) (not b!865679) tp_is_empty!16833)
(check-sat b_and!24375 (not b_next!14697))
