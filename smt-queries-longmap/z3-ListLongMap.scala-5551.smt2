; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73258 () Bool)

(assert start!73258)

(declare-fun b_free!14005 () Bool)

(declare-fun b_next!14005 () Bool)

(assert (=> start!73258 (= b_free!14005 (not b_next!14005))))

(declare-fun tp!49520 () Bool)

(declare-fun b_and!23179 () Bool)

(assert (=> start!73258 (= tp!49520 b_and!23179)))

(declare-fun b!851175 () Bool)

(declare-fun res!577947 () Bool)

(declare-fun e!474908 () Bool)

(assert (=> b!851175 (=> (not res!577947) (not e!474908))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48537 0))(
  ( (array!48538 (arr!23295 (Array (_ BitVec 32) (_ BitVec 64))) (size!23736 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48537)

(assert (=> b!851175 (= res!577947 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23736 _keys!868))))))

(declare-fun mapNonEmpty!25811 () Bool)

(declare-fun mapRes!25811 () Bool)

(declare-fun tp!49519 () Bool)

(declare-fun e!474906 () Bool)

(assert (=> mapNonEmpty!25811 (= mapRes!25811 (and tp!49519 e!474906))))

(declare-datatypes ((V!26569 0))(
  ( (V!26570 (val!8118 Int)) )
))
(declare-datatypes ((ValueCell!7631 0))(
  ( (ValueCellFull!7631 (v!10543 V!26569)) (EmptyCell!7631) )
))
(declare-fun mapValue!25811 () ValueCell!7631)

(declare-datatypes ((array!48539 0))(
  ( (array!48540 (arr!23296 (Array (_ BitVec 32) ValueCell!7631)) (size!23737 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48539)

(declare-fun mapRest!25811 () (Array (_ BitVec 32) ValueCell!7631))

(declare-fun mapKey!25811 () (_ BitVec 32))

(assert (=> mapNonEmpty!25811 (= (arr!23296 _values!688) (store mapRest!25811 mapKey!25811 mapValue!25811))))

(declare-fun b!851176 () Bool)

(declare-fun res!577950 () Bool)

(assert (=> b!851176 (=> (not res!577950) (not e!474908))))

(declare-datatypes ((List!16426 0))(
  ( (Nil!16423) (Cons!16422 (h!17559 (_ BitVec 64)) (t!22869 List!16426)) )
))
(declare-fun arrayNoDuplicates!0 (array!48537 (_ BitVec 32) List!16426) Bool)

(assert (=> b!851176 (= res!577950 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16423))))

(declare-fun v!557 () V!26569)

(declare-datatypes ((tuple2!10564 0))(
  ( (tuple2!10565 (_1!5293 (_ BitVec 64)) (_2!5293 V!26569)) )
))
(declare-datatypes ((List!16427 0))(
  ( (Nil!16424) (Cons!16423 (h!17560 tuple2!10564) (t!22870 List!16427)) )
))
(declare-datatypes ((ListLongMap!9335 0))(
  ( (ListLongMap!9336 (toList!4683 List!16427)) )
))
(declare-fun call!37915 () ListLongMap!9335)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!37916 () ListLongMap!9335)

(declare-fun b!851177 () Bool)

(declare-fun e!474904 () Bool)

(declare-fun +!2133 (ListLongMap!9335 tuple2!10564) ListLongMap!9335)

(assert (=> b!851177 (= e!474904 (= call!37915 (+!2133 call!37916 (tuple2!10565 k0!854 v!557))))))

(declare-fun b!851178 () Bool)

(declare-fun e!474910 () Bool)

(declare-fun e!474903 () Bool)

(assert (=> b!851178 (= e!474910 (and e!474903 mapRes!25811))))

(declare-fun condMapEmpty!25811 () Bool)

(declare-fun mapDefault!25811 () ValueCell!7631)

(assert (=> b!851178 (= condMapEmpty!25811 (= (arr!23296 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7631)) mapDefault!25811)))))

(declare-fun b!851179 () Bool)

(assert (=> b!851179 (= e!474904 (= call!37915 call!37916))))

(declare-fun b!851181 () Bool)

(declare-fun res!577951 () Bool)

(assert (=> b!851181 (=> (not res!577951) (not e!474908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851181 (= res!577951 (validKeyInArray!0 k0!854))))

(declare-fun b!851182 () Bool)

(declare-fun tp_is_empty!16141 () Bool)

(assert (=> b!851182 (= e!474903 tp_is_empty!16141)))

(declare-fun b!851183 () Bool)

(declare-fun res!577943 () Bool)

(assert (=> b!851183 (=> (not res!577943) (not e!474908))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!851183 (= res!577943 (and (= (select (arr!23295 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25811 () Bool)

(assert (=> mapIsEmpty!25811 mapRes!25811))

(declare-fun b!851184 () Bool)

(declare-fun res!577949 () Bool)

(assert (=> b!851184 (=> (not res!577949) (not e!474908))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851184 (= res!577949 (validMask!0 mask!1196))))

(declare-fun b!851185 () Bool)

(declare-fun res!577948 () Bool)

(assert (=> b!851185 (=> (not res!577948) (not e!474908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48537 (_ BitVec 32)) Bool)

(assert (=> b!851185 (= res!577948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851186 () Bool)

(assert (=> b!851186 (= e!474906 tp_is_empty!16141)))

(declare-fun b!851187 () Bool)

(declare-fun res!577945 () Bool)

(assert (=> b!851187 (=> (not res!577945) (not e!474908))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!851187 (= res!577945 (and (= (size!23737 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23736 _keys!868) (size!23737 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!383077 () array!48539)

(declare-fun bm!37912 () Bool)

(declare-fun minValue!654 () V!26569)

(declare-fun zeroValue!654 () V!26569)

(declare-fun getCurrentListMapNoExtraKeys!2741 (array!48537 array!48539 (_ BitVec 32) (_ BitVec 32) V!26569 V!26569 (_ BitVec 32) Int) ListLongMap!9335)

(assert (=> bm!37912 (= call!37915 (getCurrentListMapNoExtraKeys!2741 _keys!868 lt!383077 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37913 () Bool)

(assert (=> bm!37913 (= call!37916 (getCurrentListMapNoExtraKeys!2741 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851180 () Bool)

(declare-fun e!474909 () Bool)

(assert (=> b!851180 (= e!474909 true)))

(declare-fun lt!383078 () ListLongMap!9335)

(declare-fun lt!383084 () V!26569)

(declare-fun lt!383081 () tuple2!10564)

(assert (=> b!851180 (= (+!2133 lt!383078 lt!383081) (+!2133 (+!2133 lt!383078 (tuple2!10565 k0!854 lt!383084)) lt!383081))))

(declare-fun lt!383082 () V!26569)

(assert (=> b!851180 (= lt!383081 (tuple2!10565 k0!854 lt!383082))))

(declare-datatypes ((Unit!29030 0))(
  ( (Unit!29031) )
))
(declare-fun lt!383083 () Unit!29030)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!263 (ListLongMap!9335 (_ BitVec 64) V!26569 V!26569) Unit!29030)

(assert (=> b!851180 (= lt!383083 (addSameAsAddTwiceSameKeyDiffValues!263 lt!383078 k0!854 lt!383084 lt!383082))))

(declare-fun lt!383076 () V!26569)

(declare-fun get!12262 (ValueCell!7631 V!26569) V!26569)

(assert (=> b!851180 (= lt!383084 (get!12262 (select (arr!23296 _values!688) from!1053) lt!383076))))

(declare-fun lt!383080 () ListLongMap!9335)

(assert (=> b!851180 (= lt!383080 (+!2133 lt!383078 (tuple2!10565 (select (arr!23295 _keys!868) from!1053) lt!383082)))))

(assert (=> b!851180 (= lt!383082 (get!12262 (select (store (arr!23296 _values!688) i!612 (ValueCellFull!7631 v!557)) from!1053) lt!383076))))

(declare-fun dynLambda!1010 (Int (_ BitVec 64)) V!26569)

(assert (=> b!851180 (= lt!383076 (dynLambda!1010 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851180 (= lt!383078 (getCurrentListMapNoExtraKeys!2741 _keys!868 lt!383077 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577944 () Bool)

(assert (=> start!73258 (=> (not res!577944) (not e!474908))))

(assert (=> start!73258 (= res!577944 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23736 _keys!868))))))

(assert (=> start!73258 e!474908))

(assert (=> start!73258 tp_is_empty!16141))

(assert (=> start!73258 true))

(assert (=> start!73258 tp!49520))

(declare-fun array_inv!18536 (array!48537) Bool)

(assert (=> start!73258 (array_inv!18536 _keys!868)))

(declare-fun array_inv!18537 (array!48539) Bool)

(assert (=> start!73258 (and (array_inv!18537 _values!688) e!474910)))

(declare-fun b!851188 () Bool)

(declare-fun e!474905 () Bool)

(assert (=> b!851188 (= e!474908 e!474905)))

(declare-fun res!577946 () Bool)

(assert (=> b!851188 (=> (not res!577946) (not e!474905))))

(assert (=> b!851188 (= res!577946 (= from!1053 i!612))))

(assert (=> b!851188 (= lt!383080 (getCurrentListMapNoExtraKeys!2741 _keys!868 lt!383077 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851188 (= lt!383077 (array!48540 (store (arr!23296 _values!688) i!612 (ValueCellFull!7631 v!557)) (size!23737 _values!688)))))

(declare-fun lt!383075 () ListLongMap!9335)

(assert (=> b!851188 (= lt!383075 (getCurrentListMapNoExtraKeys!2741 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851189 () Bool)

(assert (=> b!851189 (= e!474905 (not e!474909))))

(declare-fun res!577942 () Bool)

(assert (=> b!851189 (=> res!577942 e!474909)))

(assert (=> b!851189 (= res!577942 (not (validKeyInArray!0 (select (arr!23295 _keys!868) from!1053))))))

(assert (=> b!851189 e!474904))

(declare-fun c!91960 () Bool)

(assert (=> b!851189 (= c!91960 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383079 () Unit!29030)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!350 (array!48537 array!48539 (_ BitVec 32) (_ BitVec 32) V!26569 V!26569 (_ BitVec 32) (_ BitVec 64) V!26569 (_ BitVec 32) Int) Unit!29030)

(assert (=> b!851189 (= lt!383079 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!350 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73258 res!577944) b!851184))

(assert (= (and b!851184 res!577949) b!851187))

(assert (= (and b!851187 res!577945) b!851185))

(assert (= (and b!851185 res!577948) b!851176))

(assert (= (and b!851176 res!577950) b!851175))

(assert (= (and b!851175 res!577947) b!851181))

(assert (= (and b!851181 res!577951) b!851183))

(assert (= (and b!851183 res!577943) b!851188))

(assert (= (and b!851188 res!577946) b!851189))

(assert (= (and b!851189 c!91960) b!851177))

(assert (= (and b!851189 (not c!91960)) b!851179))

(assert (= (or b!851177 b!851179) bm!37912))

(assert (= (or b!851177 b!851179) bm!37913))

(assert (= (and b!851189 (not res!577942)) b!851180))

(assert (= (and b!851178 condMapEmpty!25811) mapIsEmpty!25811))

(assert (= (and b!851178 (not condMapEmpty!25811)) mapNonEmpty!25811))

(get-info :version)

(assert (= (and mapNonEmpty!25811 ((_ is ValueCellFull!7631) mapValue!25811)) b!851186))

(assert (= (and b!851178 ((_ is ValueCellFull!7631) mapDefault!25811)) b!851182))

(assert (= start!73258 b!851178))

(declare-fun b_lambda!11551 () Bool)

(assert (=> (not b_lambda!11551) (not b!851180)))

(declare-fun t!22868 () Bool)

(declare-fun tb!4299 () Bool)

(assert (=> (and start!73258 (= defaultEntry!696 defaultEntry!696) t!22868) tb!4299))

(declare-fun result!8217 () Bool)

(assert (=> tb!4299 (= result!8217 tp_is_empty!16141)))

(assert (=> b!851180 t!22868))

(declare-fun b_and!23181 () Bool)

(assert (= b_and!23179 (and (=> t!22868 result!8217) b_and!23181)))

(declare-fun m!792301 () Bool)

(assert (=> b!851185 m!792301))

(declare-fun m!792303 () Bool)

(assert (=> b!851184 m!792303))

(declare-fun m!792305 () Bool)

(assert (=> start!73258 m!792305))

(declare-fun m!792307 () Bool)

(assert (=> start!73258 m!792307))

(declare-fun m!792309 () Bool)

(assert (=> b!851180 m!792309))

(declare-fun m!792311 () Bool)

(assert (=> b!851180 m!792311))

(declare-fun m!792313 () Bool)

(assert (=> b!851180 m!792313))

(declare-fun m!792315 () Bool)

(assert (=> b!851180 m!792315))

(assert (=> b!851180 m!792311))

(declare-fun m!792317 () Bool)

(assert (=> b!851180 m!792317))

(declare-fun m!792319 () Bool)

(assert (=> b!851180 m!792319))

(declare-fun m!792321 () Bool)

(assert (=> b!851180 m!792321))

(declare-fun m!792323 () Bool)

(assert (=> b!851180 m!792323))

(assert (=> b!851180 m!792321))

(declare-fun m!792325 () Bool)

(assert (=> b!851180 m!792325))

(declare-fun m!792327 () Bool)

(assert (=> b!851180 m!792327))

(declare-fun m!792329 () Bool)

(assert (=> b!851180 m!792329))

(assert (=> b!851180 m!792315))

(declare-fun m!792331 () Bool)

(assert (=> b!851180 m!792331))

(declare-fun m!792333 () Bool)

(assert (=> b!851180 m!792333))

(declare-fun m!792335 () Bool)

(assert (=> b!851183 m!792335))

(declare-fun m!792337 () Bool)

(assert (=> b!851188 m!792337))

(assert (=> b!851188 m!792333))

(declare-fun m!792339 () Bool)

(assert (=> b!851188 m!792339))

(declare-fun m!792341 () Bool)

(assert (=> b!851176 m!792341))

(declare-fun m!792343 () Bool)

(assert (=> b!851177 m!792343))

(declare-fun m!792345 () Bool)

(assert (=> b!851181 m!792345))

(declare-fun m!792347 () Bool)

(assert (=> mapNonEmpty!25811 m!792347))

(declare-fun m!792349 () Bool)

(assert (=> bm!37913 m!792349))

(assert (=> bm!37912 m!792309))

(assert (=> b!851189 m!792325))

(assert (=> b!851189 m!792325))

(declare-fun m!792351 () Bool)

(assert (=> b!851189 m!792351))

(declare-fun m!792353 () Bool)

(assert (=> b!851189 m!792353))

(check-sat b_and!23181 (not b_lambda!11551) (not b!851177) (not bm!37913) (not bm!37912) (not b!851189) (not start!73258) (not b!851176) (not b_next!14005) (not b!851180) (not b!851181) (not b!851185) (not b!851184) (not b!851188) (not mapNonEmpty!25811) tp_is_empty!16141)
(check-sat b_and!23181 (not b_next!14005))
