; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73792 () Bool)

(assert start!73792)

(declare-fun b_free!14725 () Bool)

(declare-fun b_next!14725 () Bool)

(assert (=> start!73792 (= b_free!14725 (not b_next!14725))))

(declare-fun tp!51680 () Bool)

(declare-fun b_and!24403 () Bool)

(assert (=> start!73792 (= tp!51680 b_and!24403)))

(declare-fun b!866136 () Bool)

(declare-fun res!588556 () Bool)

(declare-fun e!482471 () Bool)

(assert (=> b!866136 (=> (not res!588556) (not e!482471))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49873 0))(
  ( (array!49874 (arr!23968 (Array (_ BitVec 32) (_ BitVec 64))) (size!24410 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49873)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866136 (= res!588556 (and (= (select (arr!23968 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866137 () Bool)

(declare-fun e!482470 () Bool)

(declare-fun tp_is_empty!16861 () Bool)

(assert (=> b!866137 (= e!482470 tp_is_empty!16861)))

(declare-fun b!866138 () Bool)

(declare-fun res!588554 () Bool)

(assert (=> b!866138 (=> (not res!588554) (not e!482471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866138 (= res!588554 (validKeyInArray!0 k0!854))))

(declare-fun b!866139 () Bool)

(declare-datatypes ((Unit!29631 0))(
  ( (Unit!29632) )
))
(declare-fun e!482467 () Unit!29631)

(declare-fun Unit!29633 () Unit!29631)

(assert (=> b!866139 (= e!482467 Unit!29633)))

(declare-fun lt!392817 () Unit!29631)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49873 (_ BitVec 32) (_ BitVec 32)) Unit!29631)

(assert (=> b!866139 (= lt!392817 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17052 0))(
  ( (Nil!17049) (Cons!17048 (h!18179 (_ BitVec 64)) (t!24034 List!17052)) )
))
(declare-fun arrayNoDuplicates!0 (array!49873 (_ BitVec 32) List!17052) Bool)

(assert (=> b!866139 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17049)))

(declare-fun lt!392827 () Unit!29631)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49873 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29631)

(assert (=> b!866139 (= lt!392827 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866139 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392821 () Unit!29631)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49873 (_ BitVec 64) (_ BitVec 32) List!17052) Unit!29631)

(assert (=> b!866139 (= lt!392821 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17049))))

(assert (=> b!866139 false))

(declare-fun b!866140 () Bool)

(declare-fun res!588559 () Bool)

(assert (=> b!866140 (=> (not res!588559) (not e!482471))))

(assert (=> b!866140 (= res!588559 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17049))))

(declare-fun b!866141 () Bool)

(declare-fun e!482464 () Bool)

(declare-fun e!482466 () Bool)

(assert (=> b!866141 (= e!482464 e!482466)))

(declare-fun res!588552 () Bool)

(assert (=> b!866141 (=> res!588552 e!482466)))

(assert (=> b!866141 (= res!588552 (= k0!854 (select (arr!23968 _keys!868) from!1053)))))

(assert (=> b!866141 (not (= (select (arr!23968 _keys!868) from!1053) k0!854))))

(declare-fun lt!392825 () Unit!29631)

(assert (=> b!866141 (= lt!392825 e!482467)))

(declare-fun c!92243 () Bool)

(assert (=> b!866141 (= c!92243 (= (select (arr!23968 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27529 0))(
  ( (V!27530 (val!8478 Int)) )
))
(declare-datatypes ((tuple2!11264 0))(
  ( (tuple2!11265 (_1!5643 (_ BitVec 64)) (_2!5643 V!27529)) )
))
(declare-datatypes ((List!17053 0))(
  ( (Nil!17050) (Cons!17049 (h!18180 tuple2!11264) (t!24035 List!17053)) )
))
(declare-datatypes ((ListLongMap!10023 0))(
  ( (ListLongMap!10024 (toList!5027 List!17053)) )
))
(declare-fun lt!392826 () ListLongMap!10023)

(declare-fun lt!392819 () ListLongMap!10023)

(assert (=> b!866141 (= lt!392826 lt!392819)))

(declare-fun lt!392816 () ListLongMap!10023)

(declare-fun lt!392822 () tuple2!11264)

(declare-fun +!2393 (ListLongMap!10023 tuple2!11264) ListLongMap!10023)

(assert (=> b!866141 (= lt!392819 (+!2393 lt!392816 lt!392822))))

(declare-fun lt!392814 () V!27529)

(assert (=> b!866141 (= lt!392822 (tuple2!11265 (select (arr!23968 _keys!868) from!1053) lt!392814))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7991 0))(
  ( (ValueCellFull!7991 (v!10897 V!27529)) (EmptyCell!7991) )
))
(declare-datatypes ((array!49875 0))(
  ( (array!49876 (arr!23969 (Array (_ BitVec 32) ValueCell!7991)) (size!24411 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49875)

(declare-fun get!12677 (ValueCell!7991 V!27529) V!27529)

(declare-fun dynLambda!1188 (Int (_ BitVec 64)) V!27529)

(assert (=> b!866141 (= lt!392814 (get!12677 (select (arr!23969 _values!688) from!1053) (dynLambda!1188 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866142 () Bool)

(declare-fun res!588557 () Bool)

(assert (=> b!866142 (=> (not res!588557) (not e!482471))))

(assert (=> b!866142 (= res!588557 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24410 _keys!868))))))

(declare-fun b!866143 () Bool)

(declare-fun Unit!29634 () Unit!29631)

(assert (=> b!866143 (= e!482467 Unit!29634)))

(declare-fun mapNonEmpty!26891 () Bool)

(declare-fun mapRes!26891 () Bool)

(declare-fun tp!51679 () Bool)

(declare-fun e!482468 () Bool)

(assert (=> mapNonEmpty!26891 (= mapRes!26891 (and tp!51679 e!482468))))

(declare-fun mapRest!26891 () (Array (_ BitVec 32) ValueCell!7991))

(declare-fun mapKey!26891 () (_ BitVec 32))

(declare-fun mapValue!26891 () ValueCell!7991)

(assert (=> mapNonEmpty!26891 (= (arr!23969 _values!688) (store mapRest!26891 mapKey!26891 mapValue!26891))))

(declare-fun b!866144 () Bool)

(assert (=> b!866144 (= e!482466 true)))

(declare-fun lt!392815 () tuple2!11264)

(declare-fun lt!392820 () ListLongMap!10023)

(assert (=> b!866144 (= lt!392819 (+!2393 (+!2393 lt!392820 lt!392822) lt!392815))))

(declare-fun v!557 () V!27529)

(declare-fun lt!392823 () Unit!29631)

(declare-fun addCommutativeForDiffKeys!531 (ListLongMap!10023 (_ BitVec 64) V!27529 (_ BitVec 64) V!27529) Unit!29631)

(assert (=> b!866144 (= lt!392823 (addCommutativeForDiffKeys!531 lt!392820 k0!854 v!557 (select (arr!23968 _keys!868) from!1053) lt!392814))))

(declare-fun b!866145 () Bool)

(declare-fun res!588558 () Bool)

(assert (=> b!866145 (=> (not res!588558) (not e!482471))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!866145 (= res!588558 (and (= (size!24411 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24410 _keys!868) (size!24411 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866146 () Bool)

(declare-fun res!588555 () Bool)

(assert (=> b!866146 (=> (not res!588555) (not e!482471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49873 (_ BitVec 32)) Bool)

(assert (=> b!866146 (= res!588555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866147 () Bool)

(declare-fun e!482465 () Bool)

(assert (=> b!866147 (= e!482471 e!482465)))

(declare-fun res!588553 () Bool)

(assert (=> b!866147 (=> (not res!588553) (not e!482465))))

(assert (=> b!866147 (= res!588553 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392824 () array!49875)

(declare-fun minValue!654 () V!27529)

(declare-fun zeroValue!654 () V!27529)

(declare-fun getCurrentListMapNoExtraKeys!3022 (array!49873 array!49875 (_ BitVec 32) (_ BitVec 32) V!27529 V!27529 (_ BitVec 32) Int) ListLongMap!10023)

(assert (=> b!866147 (= lt!392826 (getCurrentListMapNoExtraKeys!3022 _keys!868 lt!392824 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866147 (= lt!392824 (array!49876 (store (arr!23969 _values!688) i!612 (ValueCellFull!7991 v!557)) (size!24411 _values!688)))))

(declare-fun lt!392828 () ListLongMap!10023)

(assert (=> b!866147 (= lt!392828 (getCurrentListMapNoExtraKeys!3022 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866148 () Bool)

(assert (=> b!866148 (= e!482465 (not e!482464))))

(declare-fun res!588551 () Bool)

(assert (=> b!866148 (=> res!588551 e!482464)))

(assert (=> b!866148 (= res!588551 (not (validKeyInArray!0 (select (arr!23968 _keys!868) from!1053))))))

(declare-fun lt!392818 () ListLongMap!10023)

(assert (=> b!866148 (= lt!392818 lt!392816)))

(assert (=> b!866148 (= lt!392816 (+!2393 lt!392820 lt!392815))))

(assert (=> b!866148 (= lt!392818 (getCurrentListMapNoExtraKeys!3022 _keys!868 lt!392824 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866148 (= lt!392815 (tuple2!11265 k0!854 v!557))))

(assert (=> b!866148 (= lt!392820 (getCurrentListMapNoExtraKeys!3022 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392813 () Unit!29631)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!564 (array!49873 array!49875 (_ BitVec 32) (_ BitVec 32) V!27529 V!27529 (_ BitVec 32) (_ BitVec 64) V!27529 (_ BitVec 32) Int) Unit!29631)

(assert (=> b!866148 (= lt!392813 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!564 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866149 () Bool)

(declare-fun res!588561 () Bool)

(assert (=> b!866149 (=> (not res!588561) (not e!482471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866149 (= res!588561 (validMask!0 mask!1196))))

(declare-fun res!588560 () Bool)

(assert (=> start!73792 (=> (not res!588560) (not e!482471))))

(assert (=> start!73792 (= res!588560 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24410 _keys!868))))))

(assert (=> start!73792 e!482471))

(assert (=> start!73792 tp_is_empty!16861))

(assert (=> start!73792 true))

(assert (=> start!73792 tp!51680))

(declare-fun array_inv!19018 (array!49873) Bool)

(assert (=> start!73792 (array_inv!19018 _keys!868)))

(declare-fun e!482472 () Bool)

(declare-fun array_inv!19019 (array!49875) Bool)

(assert (=> start!73792 (and (array_inv!19019 _values!688) e!482472)))

(declare-fun mapIsEmpty!26891 () Bool)

(assert (=> mapIsEmpty!26891 mapRes!26891))

(declare-fun b!866150 () Bool)

(assert (=> b!866150 (= e!482468 tp_is_empty!16861)))

(declare-fun b!866151 () Bool)

(assert (=> b!866151 (= e!482472 (and e!482470 mapRes!26891))))

(declare-fun condMapEmpty!26891 () Bool)

(declare-fun mapDefault!26891 () ValueCell!7991)

(assert (=> b!866151 (= condMapEmpty!26891 (= (arr!23969 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7991)) mapDefault!26891)))))

(assert (= (and start!73792 res!588560) b!866149))

(assert (= (and b!866149 res!588561) b!866145))

(assert (= (and b!866145 res!588558) b!866146))

(assert (= (and b!866146 res!588555) b!866140))

(assert (= (and b!866140 res!588559) b!866142))

(assert (= (and b!866142 res!588557) b!866138))

(assert (= (and b!866138 res!588554) b!866136))

(assert (= (and b!866136 res!588556) b!866147))

(assert (= (and b!866147 res!588553) b!866148))

(assert (= (and b!866148 (not res!588551)) b!866141))

(assert (= (and b!866141 c!92243) b!866139))

(assert (= (and b!866141 (not c!92243)) b!866143))

(assert (= (and b!866141 (not res!588552)) b!866144))

(assert (= (and b!866151 condMapEmpty!26891) mapIsEmpty!26891))

(assert (= (and b!866151 (not condMapEmpty!26891)) mapNonEmpty!26891))

(get-info :version)

(assert (= (and mapNonEmpty!26891 ((_ is ValueCellFull!7991) mapValue!26891)) b!866150))

(assert (= (and b!866151 ((_ is ValueCellFull!7991) mapDefault!26891)) b!866137))

(assert (= start!73792 b!866151))

(declare-fun b_lambda!12059 () Bool)

(assert (=> (not b_lambda!12059) (not b!866141)))

(declare-fun t!24033 () Bool)

(declare-fun tb!4839 () Bool)

(assert (=> (and start!73792 (= defaultEntry!696 defaultEntry!696) t!24033) tb!4839))

(declare-fun result!9297 () Bool)

(assert (=> tb!4839 (= result!9297 tp_is_empty!16861)))

(assert (=> b!866141 t!24033))

(declare-fun b_and!24405 () Bool)

(assert (= b_and!24403 (and (=> t!24033 result!9297) b_and!24405)))

(declare-fun m!807267 () Bool)

(assert (=> b!866141 m!807267))

(declare-fun m!807269 () Bool)

(assert (=> b!866141 m!807269))

(declare-fun m!807271 () Bool)

(assert (=> b!866141 m!807271))

(assert (=> b!866141 m!807267))

(declare-fun m!807273 () Bool)

(assert (=> b!866141 m!807273))

(declare-fun m!807275 () Bool)

(assert (=> b!866141 m!807275))

(assert (=> b!866141 m!807269))

(declare-fun m!807277 () Bool)

(assert (=> b!866144 m!807277))

(assert (=> b!866144 m!807277))

(declare-fun m!807279 () Bool)

(assert (=> b!866144 m!807279))

(assert (=> b!866144 m!807275))

(assert (=> b!866144 m!807275))

(declare-fun m!807281 () Bool)

(assert (=> b!866144 m!807281))

(declare-fun m!807283 () Bool)

(assert (=> b!866147 m!807283))

(declare-fun m!807285 () Bool)

(assert (=> b!866147 m!807285))

(declare-fun m!807287 () Bool)

(assert (=> b!866147 m!807287))

(declare-fun m!807289 () Bool)

(assert (=> b!866146 m!807289))

(declare-fun m!807291 () Bool)

(assert (=> mapNonEmpty!26891 m!807291))

(declare-fun m!807293 () Bool)

(assert (=> b!866148 m!807293))

(assert (=> b!866148 m!807275))

(declare-fun m!807295 () Bool)

(assert (=> b!866148 m!807295))

(assert (=> b!866148 m!807275))

(declare-fun m!807297 () Bool)

(assert (=> b!866148 m!807297))

(declare-fun m!807299 () Bool)

(assert (=> b!866148 m!807299))

(declare-fun m!807301 () Bool)

(assert (=> b!866148 m!807301))

(declare-fun m!807303 () Bool)

(assert (=> b!866136 m!807303))

(declare-fun m!807305 () Bool)

(assert (=> b!866138 m!807305))

(declare-fun m!807307 () Bool)

(assert (=> b!866149 m!807307))

(declare-fun m!807309 () Bool)

(assert (=> b!866140 m!807309))

(declare-fun m!807311 () Bool)

(assert (=> start!73792 m!807311))

(declare-fun m!807313 () Bool)

(assert (=> start!73792 m!807313))

(declare-fun m!807315 () Bool)

(assert (=> b!866139 m!807315))

(declare-fun m!807317 () Bool)

(assert (=> b!866139 m!807317))

(declare-fun m!807319 () Bool)

(assert (=> b!866139 m!807319))

(declare-fun m!807321 () Bool)

(assert (=> b!866139 m!807321))

(declare-fun m!807323 () Bool)

(assert (=> b!866139 m!807323))

(check-sat (not start!73792) (not b!866144) (not mapNonEmpty!26891) b_and!24405 (not b!866147) (not b!866146) (not b_lambda!12059) (not b!866141) tp_is_empty!16861 (not b!866149) (not b!866140) (not b!866138) (not b!866148) (not b_next!14725) (not b!866139))
(check-sat b_and!24405 (not b_next!14725))
