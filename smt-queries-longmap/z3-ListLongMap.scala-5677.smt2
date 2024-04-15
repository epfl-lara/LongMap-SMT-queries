; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73828 () Bool)

(assert start!73828)

(declare-fun b_free!14761 () Bool)

(declare-fun b_next!14761 () Bool)

(assert (=> start!73828 (= b_free!14761 (not b_next!14761))))

(declare-fun tp!51787 () Bool)

(declare-fun b_and!24475 () Bool)

(assert (=> start!73828 (= tp!51787 b_and!24475)))

(declare-fun b!867036 () Bool)

(declare-fun res!589151 () Bool)

(declare-fun e!482953 () Bool)

(assert (=> b!867036 (=> (not res!589151) (not e!482953))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49943 0))(
  ( (array!49944 (arr!24003 (Array (_ BitVec 32) (_ BitVec 64))) (size!24445 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49943)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867036 (= res!589151 (and (= (select (arr!24003 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867037 () Bool)

(declare-fun res!589154 () Bool)

(assert (=> b!867037 (=> (not res!589154) (not e!482953))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49943 (_ BitVec 32)) Bool)

(assert (=> b!867037 (= res!589154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867038 () Bool)

(declare-fun res!589153 () Bool)

(assert (=> b!867038 (=> (not res!589153) (not e!482953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867038 (= res!589153 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26945 () Bool)

(declare-fun mapRes!26945 () Bool)

(declare-fun tp!51788 () Bool)

(declare-fun e!482951 () Bool)

(assert (=> mapNonEmpty!26945 (= mapRes!26945 (and tp!51788 e!482951))))

(declare-fun mapKey!26945 () (_ BitVec 32))

(declare-datatypes ((V!27577 0))(
  ( (V!27578 (val!8496 Int)) )
))
(declare-datatypes ((ValueCell!8009 0))(
  ( (ValueCellFull!8009 (v!10915 V!27577)) (EmptyCell!8009) )
))
(declare-fun mapValue!26945 () ValueCell!8009)

(declare-fun mapRest!26945 () (Array (_ BitVec 32) ValueCell!8009))

(declare-datatypes ((array!49945 0))(
  ( (array!49946 (arr!24004 (Array (_ BitVec 32) ValueCell!8009)) (size!24446 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49945)

(assert (=> mapNonEmpty!26945 (= (arr!24004 _values!688) (store mapRest!26945 mapKey!26945 mapValue!26945))))

(declare-fun b!867039 () Bool)

(declare-fun e!482954 () Bool)

(assert (=> b!867039 (= e!482953 e!482954)))

(declare-fun res!589145 () Bool)

(assert (=> b!867039 (=> (not res!589145) (not e!482954))))

(assert (=> b!867039 (= res!589145 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11292 0))(
  ( (tuple2!11293 (_1!5657 (_ BitVec 64)) (_2!5657 V!27577)) )
))
(declare-datatypes ((List!17081 0))(
  ( (Nil!17078) (Cons!17077 (h!18208 tuple2!11292) (t!24099 List!17081)) )
))
(declare-datatypes ((ListLongMap!10051 0))(
  ( (ListLongMap!10052 (toList!5041 List!17081)) )
))
(declare-fun lt!393690 () ListLongMap!10051)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!393685 () array!49945)

(declare-fun minValue!654 () V!27577)

(declare-fun zeroValue!654 () V!27577)

(declare-fun getCurrentListMapNoExtraKeys!3035 (array!49943 array!49945 (_ BitVec 32) (_ BitVec 32) V!27577 V!27577 (_ BitVec 32) Int) ListLongMap!10051)

(assert (=> b!867039 (= lt!393690 (getCurrentListMapNoExtraKeys!3035 _keys!868 lt!393685 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27577)

(assert (=> b!867039 (= lt!393685 (array!49946 (store (arr!24004 _values!688) i!612 (ValueCellFull!8009 v!557)) (size!24446 _values!688)))))

(declare-fun lt!393682 () ListLongMap!10051)

(assert (=> b!867039 (= lt!393682 (getCurrentListMapNoExtraKeys!3035 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867040 () Bool)

(declare-fun e!482950 () Bool)

(assert (=> b!867040 (= e!482954 (not e!482950))))

(declare-fun res!589149 () Bool)

(assert (=> b!867040 (=> res!589149 e!482950)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867040 (= res!589149 (not (validKeyInArray!0 (select (arr!24003 _keys!868) from!1053))))))

(declare-fun lt!393691 () ListLongMap!10051)

(declare-fun lt!393684 () ListLongMap!10051)

(assert (=> b!867040 (= lt!393691 lt!393684)))

(declare-fun lt!393677 () ListLongMap!10051)

(declare-fun lt!393683 () tuple2!11292)

(declare-fun +!2407 (ListLongMap!10051 tuple2!11292) ListLongMap!10051)

(assert (=> b!867040 (= lt!393684 (+!2407 lt!393677 lt!393683))))

(assert (=> b!867040 (= lt!393691 (getCurrentListMapNoExtraKeys!3035 _keys!868 lt!393685 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867040 (= lt!393683 (tuple2!11293 k0!854 v!557))))

(assert (=> b!867040 (= lt!393677 (getCurrentListMapNoExtraKeys!3035 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29690 0))(
  ( (Unit!29691) )
))
(declare-fun lt!393689 () Unit!29690)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!576 (array!49943 array!49945 (_ BitVec 32) (_ BitVec 32) V!27577 V!27577 (_ BitVec 32) (_ BitVec 64) V!27577 (_ BitVec 32) Int) Unit!29690)

(assert (=> b!867040 (= lt!393689 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!576 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867041 () Bool)

(declare-fun e!482952 () Bool)

(declare-fun tp_is_empty!16897 () Bool)

(assert (=> b!867041 (= e!482952 tp_is_empty!16897)))

(declare-fun mapIsEmpty!26945 () Bool)

(assert (=> mapIsEmpty!26945 mapRes!26945))

(declare-fun b!867043 () Bool)

(declare-fun res!589147 () Bool)

(assert (=> b!867043 (=> (not res!589147) (not e!482953))))

(assert (=> b!867043 (= res!589147 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24445 _keys!868))))))

(declare-fun b!867044 () Bool)

(declare-fun e!482955 () Unit!29690)

(declare-fun Unit!29692 () Unit!29690)

(assert (=> b!867044 (= e!482955 Unit!29692)))

(declare-fun lt!393680 () Unit!29690)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49943 (_ BitVec 32) (_ BitVec 32)) Unit!29690)

(assert (=> b!867044 (= lt!393680 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17082 0))(
  ( (Nil!17079) (Cons!17078 (h!18209 (_ BitVec 64)) (t!24100 List!17082)) )
))
(declare-fun arrayNoDuplicates!0 (array!49943 (_ BitVec 32) List!17082) Bool)

(assert (=> b!867044 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17079)))

(declare-fun lt!393681 () Unit!29690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49943 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29690)

(assert (=> b!867044 (= lt!393681 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867044 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393678 () Unit!29690)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49943 (_ BitVec 64) (_ BitVec 32) List!17082) Unit!29690)

(assert (=> b!867044 (= lt!393678 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17079))))

(assert (=> b!867044 false))

(declare-fun b!867045 () Bool)

(declare-fun Unit!29693 () Unit!29690)

(assert (=> b!867045 (= e!482955 Unit!29693)))

(declare-fun b!867046 () Bool)

(declare-fun res!589150 () Bool)

(assert (=> b!867046 (=> (not res!589150) (not e!482953))))

(assert (=> b!867046 (= res!589150 (and (= (size!24446 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24445 _keys!868) (size!24446 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867047 () Bool)

(declare-fun res!589146 () Bool)

(assert (=> b!867047 (=> (not res!589146) (not e!482953))))

(assert (=> b!867047 (= res!589146 (validKeyInArray!0 k0!854))))

(declare-fun b!867042 () Bool)

(declare-fun res!589148 () Bool)

(assert (=> b!867042 (=> (not res!589148) (not e!482953))))

(assert (=> b!867042 (= res!589148 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17079))))

(declare-fun res!589152 () Bool)

(assert (=> start!73828 (=> (not res!589152) (not e!482953))))

(assert (=> start!73828 (= res!589152 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24445 _keys!868))))))

(assert (=> start!73828 e!482953))

(assert (=> start!73828 tp_is_empty!16897))

(assert (=> start!73828 true))

(assert (=> start!73828 tp!51787))

(declare-fun array_inv!19042 (array!49943) Bool)

(assert (=> start!73828 (array_inv!19042 _keys!868)))

(declare-fun e!482958 () Bool)

(declare-fun array_inv!19043 (array!49945) Bool)

(assert (=> start!73828 (and (array_inv!19043 _values!688) e!482958)))

(declare-fun b!867048 () Bool)

(assert (=> b!867048 (= e!482958 (and e!482952 mapRes!26945))))

(declare-fun condMapEmpty!26945 () Bool)

(declare-fun mapDefault!26945 () ValueCell!8009)

(assert (=> b!867048 (= condMapEmpty!26945 (= (arr!24004 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8009)) mapDefault!26945)))))

(declare-fun b!867049 () Bool)

(declare-fun e!482957 () Bool)

(assert (=> b!867049 (= e!482957 true)))

(declare-fun lt!393688 () tuple2!11292)

(declare-fun lt!393686 () ListLongMap!10051)

(assert (=> b!867049 (= lt!393686 (+!2407 (+!2407 lt!393677 lt!393688) lt!393683))))

(declare-fun lt!393687 () Unit!29690)

(declare-fun lt!393679 () V!27577)

(declare-fun addCommutativeForDiffKeys!543 (ListLongMap!10051 (_ BitVec 64) V!27577 (_ BitVec 64) V!27577) Unit!29690)

(assert (=> b!867049 (= lt!393687 (addCommutativeForDiffKeys!543 lt!393677 k0!854 v!557 (select (arr!24003 _keys!868) from!1053) lt!393679))))

(declare-fun b!867050 () Bool)

(assert (=> b!867050 (= e!482951 tp_is_empty!16897)))

(declare-fun b!867051 () Bool)

(assert (=> b!867051 (= e!482950 e!482957)))

(declare-fun res!589155 () Bool)

(assert (=> b!867051 (=> res!589155 e!482957)))

(assert (=> b!867051 (= res!589155 (= k0!854 (select (arr!24003 _keys!868) from!1053)))))

(assert (=> b!867051 (not (= (select (arr!24003 _keys!868) from!1053) k0!854))))

(declare-fun lt!393692 () Unit!29690)

(assert (=> b!867051 (= lt!393692 e!482955)))

(declare-fun c!92297 () Bool)

(assert (=> b!867051 (= c!92297 (= (select (arr!24003 _keys!868) from!1053) k0!854))))

(assert (=> b!867051 (= lt!393690 lt!393686)))

(assert (=> b!867051 (= lt!393686 (+!2407 lt!393684 lt!393688))))

(assert (=> b!867051 (= lt!393688 (tuple2!11293 (select (arr!24003 _keys!868) from!1053) lt!393679))))

(declare-fun get!12698 (ValueCell!8009 V!27577) V!27577)

(declare-fun dynLambda!1197 (Int (_ BitVec 64)) V!27577)

(assert (=> b!867051 (= lt!393679 (get!12698 (select (arr!24004 _values!688) from!1053) (dynLambda!1197 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!73828 res!589152) b!867038))

(assert (= (and b!867038 res!589153) b!867046))

(assert (= (and b!867046 res!589150) b!867037))

(assert (= (and b!867037 res!589154) b!867042))

(assert (= (and b!867042 res!589148) b!867043))

(assert (= (and b!867043 res!589147) b!867047))

(assert (= (and b!867047 res!589146) b!867036))

(assert (= (and b!867036 res!589151) b!867039))

(assert (= (and b!867039 res!589145) b!867040))

(assert (= (and b!867040 (not res!589149)) b!867051))

(assert (= (and b!867051 c!92297) b!867044))

(assert (= (and b!867051 (not c!92297)) b!867045))

(assert (= (and b!867051 (not res!589155)) b!867049))

(assert (= (and b!867048 condMapEmpty!26945) mapIsEmpty!26945))

(assert (= (and b!867048 (not condMapEmpty!26945)) mapNonEmpty!26945))

(get-info :version)

(assert (= (and mapNonEmpty!26945 ((_ is ValueCellFull!8009) mapValue!26945)) b!867050))

(assert (= (and b!867048 ((_ is ValueCellFull!8009) mapDefault!26945)) b!867041))

(assert (= start!73828 b!867048))

(declare-fun b_lambda!12095 () Bool)

(assert (=> (not b_lambda!12095) (not b!867051)))

(declare-fun t!24098 () Bool)

(declare-fun tb!4875 () Bool)

(assert (=> (and start!73828 (= defaultEntry!696 defaultEntry!696) t!24098) tb!4875))

(declare-fun result!9369 () Bool)

(assert (=> tb!4875 (= result!9369 tp_is_empty!16897)))

(assert (=> b!867051 t!24098))

(declare-fun b_and!24477 () Bool)

(assert (= b_and!24475 (and (=> t!24098 result!9369) b_and!24477)))

(declare-fun m!808311 () Bool)

(assert (=> mapNonEmpty!26945 m!808311))

(declare-fun m!808313 () Bool)

(assert (=> b!867039 m!808313))

(declare-fun m!808315 () Bool)

(assert (=> b!867039 m!808315))

(declare-fun m!808317 () Bool)

(assert (=> b!867039 m!808317))

(declare-fun m!808319 () Bool)

(assert (=> b!867036 m!808319))

(declare-fun m!808321 () Bool)

(assert (=> b!867044 m!808321))

(declare-fun m!808323 () Bool)

(assert (=> b!867044 m!808323))

(declare-fun m!808325 () Bool)

(assert (=> b!867044 m!808325))

(declare-fun m!808327 () Bool)

(assert (=> b!867044 m!808327))

(declare-fun m!808329 () Bool)

(assert (=> b!867044 m!808329))

(declare-fun m!808331 () Bool)

(assert (=> b!867040 m!808331))

(declare-fun m!808333 () Bool)

(assert (=> b!867040 m!808333))

(declare-fun m!808335 () Bool)

(assert (=> b!867040 m!808335))

(declare-fun m!808337 () Bool)

(assert (=> b!867040 m!808337))

(assert (=> b!867040 m!808335))

(declare-fun m!808339 () Bool)

(assert (=> b!867040 m!808339))

(declare-fun m!808341 () Bool)

(assert (=> b!867040 m!808341))

(declare-fun m!808343 () Bool)

(assert (=> b!867037 m!808343))

(declare-fun m!808345 () Bool)

(assert (=> b!867038 m!808345))

(declare-fun m!808347 () Bool)

(assert (=> b!867047 m!808347))

(declare-fun m!808349 () Bool)

(assert (=> start!73828 m!808349))

(declare-fun m!808351 () Bool)

(assert (=> start!73828 m!808351))

(declare-fun m!808353 () Bool)

(assert (=> b!867042 m!808353))

(declare-fun m!808355 () Bool)

(assert (=> b!867049 m!808355))

(assert (=> b!867049 m!808355))

(declare-fun m!808357 () Bool)

(assert (=> b!867049 m!808357))

(assert (=> b!867049 m!808335))

(assert (=> b!867049 m!808335))

(declare-fun m!808359 () Bool)

(assert (=> b!867049 m!808359))

(declare-fun m!808361 () Bool)

(assert (=> b!867051 m!808361))

(declare-fun m!808363 () Bool)

(assert (=> b!867051 m!808363))

(declare-fun m!808365 () Bool)

(assert (=> b!867051 m!808365))

(declare-fun m!808367 () Bool)

(assert (=> b!867051 m!808367))

(assert (=> b!867051 m!808363))

(assert (=> b!867051 m!808335))

(assert (=> b!867051 m!808365))

(check-sat (not b_lambda!12095) (not b_next!14761) (not b!867042) (not b!867051) b_and!24477 (not b!867040) (not start!73828) (not b!867047) (not b!867037) tp_is_empty!16897 (not b!867049) (not b!867038) (not mapNonEmpty!26945) (not b!867039) (not b!867044))
(check-sat b_and!24477 (not b_next!14761))
