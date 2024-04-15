; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73672 () Bool)

(assert start!73672)

(declare-fun b_free!14605 () Bool)

(declare-fun b_next!14605 () Bool)

(assert (=> start!73672 (= b_free!14605 (not b_next!14605))))

(declare-fun tp!51320 () Bool)

(declare-fun b_and!24163 () Bool)

(assert (=> start!73672 (= tp!51320 b_and!24163)))

(declare-fun b!863136 () Bool)

(declare-fun e!480846 () Bool)

(declare-fun e!480849 () Bool)

(assert (=> b!863136 (= e!480846 e!480849)))

(declare-fun res!586575 () Bool)

(assert (=> b!863136 (=> (not res!586575) (not e!480849))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863136 (= res!586575 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27369 0))(
  ( (V!27370 (val!8418 Int)) )
))
(declare-datatypes ((ValueCell!7931 0))(
  ( (ValueCellFull!7931 (v!10837 V!27369)) (EmptyCell!7931) )
))
(declare-datatypes ((array!49635 0))(
  ( (array!49636 (arr!23849 (Array (_ BitVec 32) ValueCell!7931)) (size!24291 (_ BitVec 32))) )
))
(declare-fun lt!389943 () array!49635)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11154 0))(
  ( (tuple2!11155 (_1!5588 (_ BitVec 64)) (_2!5588 V!27369)) )
))
(declare-datatypes ((List!16947 0))(
  ( (Nil!16944) (Cons!16943 (h!18074 tuple2!11154) (t!23809 List!16947)) )
))
(declare-datatypes ((ListLongMap!9913 0))(
  ( (ListLongMap!9914 (toList!4972 List!16947)) )
))
(declare-fun lt!389935 () ListLongMap!9913)

(declare-datatypes ((array!49637 0))(
  ( (array!49638 (arr!23850 (Array (_ BitVec 32) (_ BitVec 64))) (size!24292 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49637)

(declare-fun minValue!654 () V!27369)

(declare-fun zeroValue!654 () V!27369)

(declare-fun getCurrentListMapNoExtraKeys!2972 (array!49637 array!49635 (_ BitVec 32) (_ BitVec 32) V!27369 V!27369 (_ BitVec 32) Int) ListLongMap!9913)

(assert (=> b!863136 (= lt!389935 (getCurrentListMapNoExtraKeys!2972 _keys!868 lt!389943 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27369)

(declare-fun _values!688 () array!49635)

(assert (=> b!863136 (= lt!389943 (array!49636 (store (arr!23849 _values!688) i!612 (ValueCellFull!7931 v!557)) (size!24291 _values!688)))))

(declare-fun lt!389934 () ListLongMap!9913)

(assert (=> b!863136 (= lt!389934 (getCurrentListMapNoExtraKeys!2972 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!586579 () Bool)

(assert (=> start!73672 (=> (not res!586579) (not e!480846))))

(assert (=> start!73672 (= res!586579 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24292 _keys!868))))))

(assert (=> start!73672 e!480846))

(declare-fun tp_is_empty!16741 () Bool)

(assert (=> start!73672 tp_is_empty!16741))

(assert (=> start!73672 true))

(assert (=> start!73672 tp!51320))

(declare-fun array_inv!18936 (array!49637) Bool)

(assert (=> start!73672 (array_inv!18936 _keys!868)))

(declare-fun e!480847 () Bool)

(declare-fun array_inv!18937 (array!49635) Bool)

(assert (=> start!73672 (and (array_inv!18937 _values!688) e!480847)))

(declare-fun b!863137 () Bool)

(declare-fun e!480851 () Bool)

(declare-fun mapRes!26711 () Bool)

(assert (=> b!863137 (= e!480847 (and e!480851 mapRes!26711))))

(declare-fun condMapEmpty!26711 () Bool)

(declare-fun mapDefault!26711 () ValueCell!7931)

(assert (=> b!863137 (= condMapEmpty!26711 (= (arr!23849 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7931)) mapDefault!26711)))))

(declare-fun b!863138 () Bool)

(declare-fun e!480844 () Bool)

(assert (=> b!863138 (= e!480844 true)))

(declare-fun lt!389945 () tuple2!11154)

(declare-fun lt!389944 () tuple2!11154)

(declare-fun lt!389936 () ListLongMap!9913)

(declare-fun lt!389942 () ListLongMap!9913)

(declare-fun +!2341 (ListLongMap!9913 tuple2!11154) ListLongMap!9913)

(assert (=> b!863138 (= lt!389936 (+!2341 (+!2341 lt!389942 lt!389944) lt!389945))))

(declare-datatypes ((Unit!29428 0))(
  ( (Unit!29429) )
))
(declare-fun lt!389948 () Unit!29428)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!389946 () V!27369)

(declare-fun addCommutativeForDiffKeys!488 (ListLongMap!9913 (_ BitVec 64) V!27369 (_ BitVec 64) V!27369) Unit!29428)

(assert (=> b!863138 (= lt!389948 (addCommutativeForDiffKeys!488 lt!389942 k0!854 v!557 (select (arr!23850 _keys!868) from!1053) lt!389946))))

(declare-fun b!863139 () Bool)

(declare-fun res!586572 () Bool)

(assert (=> b!863139 (=> (not res!586572) (not e!480846))))

(declare-datatypes ((List!16948 0))(
  ( (Nil!16945) (Cons!16944 (h!18075 (_ BitVec 64)) (t!23810 List!16948)) )
))
(declare-fun arrayNoDuplicates!0 (array!49637 (_ BitVec 32) List!16948) Bool)

(assert (=> b!863139 (= res!586572 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16945))))

(declare-fun b!863140 () Bool)

(declare-fun e!480845 () Unit!29428)

(declare-fun Unit!29430 () Unit!29428)

(assert (=> b!863140 (= e!480845 Unit!29430)))

(declare-fun mapIsEmpty!26711 () Bool)

(assert (=> mapIsEmpty!26711 mapRes!26711))

(declare-fun b!863141 () Bool)

(declare-fun res!586571 () Bool)

(assert (=> b!863141 (=> (not res!586571) (not e!480846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863141 (= res!586571 (validKeyInArray!0 k0!854))))

(declare-fun b!863142 () Bool)

(assert (=> b!863142 (= e!480851 tp_is_empty!16741)))

(declare-fun mapNonEmpty!26711 () Bool)

(declare-fun tp!51319 () Bool)

(declare-fun e!480852 () Bool)

(assert (=> mapNonEmpty!26711 (= mapRes!26711 (and tp!51319 e!480852))))

(declare-fun mapRest!26711 () (Array (_ BitVec 32) ValueCell!7931))

(declare-fun mapValue!26711 () ValueCell!7931)

(declare-fun mapKey!26711 () (_ BitVec 32))

(assert (=> mapNonEmpty!26711 (= (arr!23849 _values!688) (store mapRest!26711 mapKey!26711 mapValue!26711))))

(declare-fun b!863143 () Bool)

(declare-fun res!586573 () Bool)

(assert (=> b!863143 (=> (not res!586573) (not e!480846))))

(assert (=> b!863143 (= res!586573 (and (= (select (arr!23850 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863144 () Bool)

(declare-fun e!480850 () Bool)

(assert (=> b!863144 (= e!480850 e!480844)))

(declare-fun res!586578 () Bool)

(assert (=> b!863144 (=> res!586578 e!480844)))

(assert (=> b!863144 (= res!586578 (= k0!854 (select (arr!23850 _keys!868) from!1053)))))

(assert (=> b!863144 (not (= (select (arr!23850 _keys!868) from!1053) k0!854))))

(declare-fun lt!389937 () Unit!29428)

(assert (=> b!863144 (= lt!389937 e!480845)))

(declare-fun c!92063 () Bool)

(assert (=> b!863144 (= c!92063 (= (select (arr!23850 _keys!868) from!1053) k0!854))))

(assert (=> b!863144 (= lt!389935 lt!389936)))

(declare-fun lt!389938 () ListLongMap!9913)

(assert (=> b!863144 (= lt!389936 (+!2341 lt!389938 lt!389944))))

(assert (=> b!863144 (= lt!389944 (tuple2!11155 (select (arr!23850 _keys!868) from!1053) lt!389946))))

(declare-fun get!12592 (ValueCell!7931 V!27369) V!27369)

(declare-fun dynLambda!1143 (Int (_ BitVec 64)) V!27369)

(assert (=> b!863144 (= lt!389946 (get!12592 (select (arr!23849 _values!688) from!1053) (dynLambda!1143 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863145 () Bool)

(declare-fun res!586576 () Bool)

(assert (=> b!863145 (=> (not res!586576) (not e!480846))))

(assert (=> b!863145 (= res!586576 (and (= (size!24291 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24292 _keys!868) (size!24291 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863146 () Bool)

(assert (=> b!863146 (= e!480849 (not e!480850))))

(declare-fun res!586581 () Bool)

(assert (=> b!863146 (=> res!586581 e!480850)))

(assert (=> b!863146 (= res!586581 (not (validKeyInArray!0 (select (arr!23850 _keys!868) from!1053))))))

(declare-fun lt!389933 () ListLongMap!9913)

(assert (=> b!863146 (= lt!389933 lt!389938)))

(assert (=> b!863146 (= lt!389938 (+!2341 lt!389942 lt!389945))))

(assert (=> b!863146 (= lt!389933 (getCurrentListMapNoExtraKeys!2972 _keys!868 lt!389943 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863146 (= lt!389945 (tuple2!11155 k0!854 v!557))))

(assert (=> b!863146 (= lt!389942 (getCurrentListMapNoExtraKeys!2972 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389940 () Unit!29428)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!524 (array!49637 array!49635 (_ BitVec 32) (_ BitVec 32) V!27369 V!27369 (_ BitVec 32) (_ BitVec 64) V!27369 (_ BitVec 32) Int) Unit!29428)

(assert (=> b!863146 (= lt!389940 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!524 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863147 () Bool)

(declare-fun res!586580 () Bool)

(assert (=> b!863147 (=> (not res!586580) (not e!480846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863147 (= res!586580 (validMask!0 mask!1196))))

(declare-fun b!863148 () Bool)

(declare-fun res!586577 () Bool)

(assert (=> b!863148 (=> (not res!586577) (not e!480846))))

(assert (=> b!863148 (= res!586577 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24292 _keys!868))))))

(declare-fun b!863149 () Bool)

(declare-fun Unit!29431 () Unit!29428)

(assert (=> b!863149 (= e!480845 Unit!29431)))

(declare-fun lt!389939 () Unit!29428)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49637 (_ BitVec 32) (_ BitVec 32)) Unit!29428)

(assert (=> b!863149 (= lt!389939 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863149 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16945)))

(declare-fun lt!389947 () Unit!29428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29428)

(assert (=> b!863149 (= lt!389947 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863149 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389941 () Unit!29428)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49637 (_ BitVec 64) (_ BitVec 32) List!16948) Unit!29428)

(assert (=> b!863149 (= lt!389941 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16945))))

(assert (=> b!863149 false))

(declare-fun b!863150 () Bool)

(declare-fun res!586574 () Bool)

(assert (=> b!863150 (=> (not res!586574) (not e!480846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49637 (_ BitVec 32)) Bool)

(assert (=> b!863150 (= res!586574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863151 () Bool)

(assert (=> b!863151 (= e!480852 tp_is_empty!16741)))

(assert (= (and start!73672 res!586579) b!863147))

(assert (= (and b!863147 res!586580) b!863145))

(assert (= (and b!863145 res!586576) b!863150))

(assert (= (and b!863150 res!586574) b!863139))

(assert (= (and b!863139 res!586572) b!863148))

(assert (= (and b!863148 res!586577) b!863141))

(assert (= (and b!863141 res!586571) b!863143))

(assert (= (and b!863143 res!586573) b!863136))

(assert (= (and b!863136 res!586575) b!863146))

(assert (= (and b!863146 (not res!586581)) b!863144))

(assert (= (and b!863144 c!92063) b!863149))

(assert (= (and b!863144 (not c!92063)) b!863140))

(assert (= (and b!863144 (not res!586578)) b!863138))

(assert (= (and b!863137 condMapEmpty!26711) mapIsEmpty!26711))

(assert (= (and b!863137 (not condMapEmpty!26711)) mapNonEmpty!26711))

(get-info :version)

(assert (= (and mapNonEmpty!26711 ((_ is ValueCellFull!7931) mapValue!26711)) b!863151))

(assert (= (and b!863137 ((_ is ValueCellFull!7931) mapDefault!26711)) b!863142))

(assert (= start!73672 b!863137))

(declare-fun b_lambda!11939 () Bool)

(assert (=> (not b_lambda!11939) (not b!863144)))

(declare-fun t!23808 () Bool)

(declare-fun tb!4719 () Bool)

(assert (=> (and start!73672 (= defaultEntry!696 defaultEntry!696) t!23808) tb!4719))

(declare-fun result!9057 () Bool)

(assert (=> tb!4719 (= result!9057 tp_is_empty!16741)))

(assert (=> b!863144 t!23808))

(declare-fun b_and!24165 () Bool)

(assert (= b_and!24163 (and (=> t!23808 result!9057) b_and!24165)))

(declare-fun m!803787 () Bool)

(assert (=> start!73672 m!803787))

(declare-fun m!803789 () Bool)

(assert (=> start!73672 m!803789))

(declare-fun m!803791 () Bool)

(assert (=> mapNonEmpty!26711 m!803791))

(declare-fun m!803793 () Bool)

(assert (=> b!863141 m!803793))

(declare-fun m!803795 () Bool)

(assert (=> b!863143 m!803795))

(declare-fun m!803797 () Bool)

(assert (=> b!863139 m!803797))

(declare-fun m!803799 () Bool)

(assert (=> b!863150 m!803799))

(declare-fun m!803801 () Bool)

(assert (=> b!863136 m!803801))

(declare-fun m!803803 () Bool)

(assert (=> b!863136 m!803803))

(declare-fun m!803805 () Bool)

(assert (=> b!863136 m!803805))

(declare-fun m!803807 () Bool)

(assert (=> b!863149 m!803807))

(declare-fun m!803809 () Bool)

(assert (=> b!863149 m!803809))

(declare-fun m!803811 () Bool)

(assert (=> b!863149 m!803811))

(declare-fun m!803813 () Bool)

(assert (=> b!863149 m!803813))

(declare-fun m!803815 () Bool)

(assert (=> b!863149 m!803815))

(declare-fun m!803817 () Bool)

(assert (=> b!863144 m!803817))

(declare-fun m!803819 () Bool)

(assert (=> b!863144 m!803819))

(declare-fun m!803821 () Bool)

(assert (=> b!863144 m!803821))

(declare-fun m!803823 () Bool)

(assert (=> b!863144 m!803823))

(assert (=> b!863144 m!803817))

(assert (=> b!863144 m!803821))

(declare-fun m!803825 () Bool)

(assert (=> b!863144 m!803825))

(declare-fun m!803827 () Bool)

(assert (=> b!863146 m!803827))

(declare-fun m!803829 () Bool)

(assert (=> b!863146 m!803829))

(assert (=> b!863146 m!803819))

(declare-fun m!803831 () Bool)

(assert (=> b!863146 m!803831))

(assert (=> b!863146 m!803819))

(declare-fun m!803833 () Bool)

(assert (=> b!863146 m!803833))

(declare-fun m!803835 () Bool)

(assert (=> b!863146 m!803835))

(declare-fun m!803837 () Bool)

(assert (=> b!863147 m!803837))

(declare-fun m!803839 () Bool)

(assert (=> b!863138 m!803839))

(assert (=> b!863138 m!803839))

(declare-fun m!803841 () Bool)

(assert (=> b!863138 m!803841))

(assert (=> b!863138 m!803819))

(assert (=> b!863138 m!803819))

(declare-fun m!803843 () Bool)

(assert (=> b!863138 m!803843))

(check-sat (not b!863139) (not b!863149) tp_is_empty!16741 (not start!73672) (not b!863141) (not b_next!14605) (not mapNonEmpty!26711) (not b!863138) (not b!863147) (not b!863144) (not b!863136) (not b_lambda!11939) b_and!24165 (not b!863150) (not b!863146))
(check-sat b_and!24165 (not b_next!14605))
