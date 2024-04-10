; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73074 () Bool)

(assert start!73074)

(declare-fun b_free!13989 () Bool)

(declare-fun b_next!13989 () Bool)

(assert (=> start!73074 (= b_free!13989 (not b_next!13989))))

(declare-fun tp!49471 () Bool)

(declare-fun b_and!23137 () Bool)

(assert (=> start!73074 (= tp!49471 b_and!23137)))

(declare-fun mapIsEmpty!25787 () Bool)

(declare-fun mapRes!25787 () Bool)

(assert (=> mapIsEmpty!25787 mapRes!25787))

(declare-fun b!849896 () Bool)

(declare-fun res!577367 () Bool)

(declare-fun e!474134 () Bool)

(assert (=> b!849896 (=> (not res!577367) (not e!474134))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48456 0))(
  ( (array!48457 (arr!23259 (Array (_ BitVec 32) (_ BitVec 64))) (size!23699 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48456)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!849896 (= res!577367 (and (= (select (arr!23259 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849897 () Bool)

(declare-fun e!474133 () Bool)

(declare-fun e!474130 () Bool)

(assert (=> b!849897 (= e!474133 (and e!474130 mapRes!25787))))

(declare-fun condMapEmpty!25787 () Bool)

(declare-datatypes ((V!26547 0))(
  ( (V!26548 (val!8110 Int)) )
))
(declare-datatypes ((ValueCell!7623 0))(
  ( (ValueCellFull!7623 (v!10535 V!26547)) (EmptyCell!7623) )
))
(declare-datatypes ((array!48458 0))(
  ( (array!48459 (arr!23260 (Array (_ BitVec 32) ValueCell!7623)) (size!23700 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48458)

(declare-fun mapDefault!25787 () ValueCell!7623)

(assert (=> b!849897 (= condMapEmpty!25787 (= (arr!23260 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7623)) mapDefault!25787)))))

(declare-fun b!849898 () Bool)

(declare-fun res!577365 () Bool)

(assert (=> b!849898 (=> (not res!577365) (not e!474134))))

(declare-datatypes ((List!16470 0))(
  ( (Nil!16467) (Cons!16466 (h!17597 (_ BitVec 64)) (t!22905 List!16470)) )
))
(declare-fun arrayNoDuplicates!0 (array!48456 (_ BitVec 32) List!16470) Bool)

(assert (=> b!849898 (= res!577365 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16467))))

(declare-fun b!849899 () Bool)

(declare-fun res!577364 () Bool)

(assert (=> b!849899 (=> (not res!577364) (not e!474134))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849899 (= res!577364 (validMask!0 mask!1196))))

(declare-fun b!849900 () Bool)

(declare-fun e!474131 () Bool)

(declare-fun e!474129 () Bool)

(assert (=> b!849900 (= e!474131 (not e!474129))))

(declare-fun res!577359 () Bool)

(assert (=> b!849900 (=> res!577359 e!474129)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849900 (= res!577359 (not (validKeyInArray!0 (select (arr!23259 _keys!868) from!1053))))))

(declare-fun e!474136 () Bool)

(assert (=> b!849900 e!474136))

(declare-fun c!91654 () Bool)

(assert (=> b!849900 (= c!91654 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26547)

(declare-datatypes ((Unit!29019 0))(
  ( (Unit!29020) )
))
(declare-fun lt!382477 () Unit!29019)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26547)

(declare-fun zeroValue!654 () V!26547)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!353 (array!48456 array!48458 (_ BitVec 32) (_ BitVec 32) V!26547 V!26547 (_ BitVec 32) (_ BitVec 64) V!26547 (_ BitVec 32) Int) Unit!29019)

(assert (=> b!849900 (= lt!382477 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!353 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849901 () Bool)

(declare-datatypes ((tuple2!10624 0))(
  ( (tuple2!10625 (_1!5323 (_ BitVec 64)) (_2!5323 V!26547)) )
))
(declare-datatypes ((List!16471 0))(
  ( (Nil!16468) (Cons!16467 (h!17598 tuple2!10624) (t!22906 List!16471)) )
))
(declare-datatypes ((ListLongMap!9393 0))(
  ( (ListLongMap!9394 (toList!4712 List!16471)) )
))
(declare-fun call!37822 () ListLongMap!9393)

(declare-fun call!37823 () ListLongMap!9393)

(assert (=> b!849901 (= e!474136 (= call!37822 call!37823))))

(declare-fun b!849902 () Bool)

(declare-fun res!577362 () Bool)

(assert (=> b!849902 (=> (not res!577362) (not e!474134))))

(assert (=> b!849902 (= res!577362 (and (= (size!23700 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23699 _keys!868) (size!23700 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849903 () Bool)

(declare-fun +!2115 (ListLongMap!9393 tuple2!10624) ListLongMap!9393)

(assert (=> b!849903 (= e!474136 (= call!37822 (+!2115 call!37823 (tuple2!10625 k0!854 v!557))))))

(declare-fun b!849904 () Bool)

(declare-fun e!474135 () Bool)

(declare-fun tp_is_empty!16125 () Bool)

(assert (=> b!849904 (= e!474135 tp_is_empty!16125)))

(declare-fun b!849906 () Bool)

(assert (=> b!849906 (= e!474130 tp_is_empty!16125)))

(declare-fun lt!382479 () array!48458)

(declare-fun bm!37819 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2694 (array!48456 array!48458 (_ BitVec 32) (_ BitVec 32) V!26547 V!26547 (_ BitVec 32) Int) ListLongMap!9393)

(assert (=> bm!37819 (= call!37822 (getCurrentListMapNoExtraKeys!2694 _keys!868 lt!382479 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25787 () Bool)

(declare-fun tp!49470 () Bool)

(assert (=> mapNonEmpty!25787 (= mapRes!25787 (and tp!49470 e!474135))))

(declare-fun mapRest!25787 () (Array (_ BitVec 32) ValueCell!7623))

(declare-fun mapValue!25787 () ValueCell!7623)

(declare-fun mapKey!25787 () (_ BitVec 32))

(assert (=> mapNonEmpty!25787 (= (arr!23260 _values!688) (store mapRest!25787 mapKey!25787 mapValue!25787))))

(declare-fun bm!37820 () Bool)

(assert (=> bm!37820 (= call!37823 (getCurrentListMapNoExtraKeys!2694 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849907 () Bool)

(declare-fun res!577360 () Bool)

(assert (=> b!849907 (=> (not res!577360) (not e!474134))))

(assert (=> b!849907 (= res!577360 (validKeyInArray!0 k0!854))))

(declare-fun b!849908 () Bool)

(declare-fun res!577366 () Bool)

(assert (=> b!849908 (=> (not res!577366) (not e!474134))))

(assert (=> b!849908 (= res!577366 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23699 _keys!868))))))

(declare-fun b!849909 () Bool)

(declare-fun res!577361 () Bool)

(assert (=> b!849909 (=> (not res!577361) (not e!474134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48456 (_ BitVec 32)) Bool)

(assert (=> b!849909 (= res!577361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849910 () Bool)

(assert (=> b!849910 (= e!474129 true)))

(declare-fun lt!382482 () V!26547)

(declare-fun lt!382481 () tuple2!10624)

(declare-fun lt!382480 () ListLongMap!9393)

(assert (=> b!849910 (= (+!2115 lt!382480 lt!382481) (+!2115 (+!2115 lt!382480 (tuple2!10625 k0!854 lt!382482)) lt!382481))))

(declare-fun lt!382483 () V!26547)

(assert (=> b!849910 (= lt!382481 (tuple2!10625 k0!854 lt!382483))))

(declare-fun lt!382475 () Unit!29019)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!252 (ListLongMap!9393 (_ BitVec 64) V!26547 V!26547) Unit!29019)

(assert (=> b!849910 (= lt!382475 (addSameAsAddTwiceSameKeyDiffValues!252 lt!382480 k0!854 lt!382482 lt!382483))))

(declare-fun lt!382476 () V!26547)

(declare-fun get!12246 (ValueCell!7623 V!26547) V!26547)

(assert (=> b!849910 (= lt!382482 (get!12246 (select (arr!23260 _values!688) from!1053) lt!382476))))

(declare-fun lt!382478 () ListLongMap!9393)

(assert (=> b!849910 (= lt!382478 (+!2115 lt!382480 (tuple2!10625 (select (arr!23259 _keys!868) from!1053) lt!382483)))))

(assert (=> b!849910 (= lt!382483 (get!12246 (select (store (arr!23260 _values!688) i!612 (ValueCellFull!7623 v!557)) from!1053) lt!382476))))

(declare-fun dynLambda!1006 (Int (_ BitVec 64)) V!26547)

(assert (=> b!849910 (= lt!382476 (dynLambda!1006 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!849910 (= lt!382480 (getCurrentListMapNoExtraKeys!2694 _keys!868 lt!382479 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577358 () Bool)

(assert (=> start!73074 (=> (not res!577358) (not e!474134))))

(assert (=> start!73074 (= res!577358 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23699 _keys!868))))))

(assert (=> start!73074 e!474134))

(assert (=> start!73074 tp_is_empty!16125))

(assert (=> start!73074 true))

(assert (=> start!73074 tp!49471))

(declare-fun array_inv!18458 (array!48456) Bool)

(assert (=> start!73074 (array_inv!18458 _keys!868)))

(declare-fun array_inv!18459 (array!48458) Bool)

(assert (=> start!73074 (and (array_inv!18459 _values!688) e!474133)))

(declare-fun b!849905 () Bool)

(assert (=> b!849905 (= e!474134 e!474131)))

(declare-fun res!577363 () Bool)

(assert (=> b!849905 (=> (not res!577363) (not e!474131))))

(assert (=> b!849905 (= res!577363 (= from!1053 i!612))))

(assert (=> b!849905 (= lt!382478 (getCurrentListMapNoExtraKeys!2694 _keys!868 lt!382479 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849905 (= lt!382479 (array!48459 (store (arr!23260 _values!688) i!612 (ValueCellFull!7623 v!557)) (size!23700 _values!688)))))

(declare-fun lt!382474 () ListLongMap!9393)

(assert (=> b!849905 (= lt!382474 (getCurrentListMapNoExtraKeys!2694 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73074 res!577358) b!849899))

(assert (= (and b!849899 res!577364) b!849902))

(assert (= (and b!849902 res!577362) b!849909))

(assert (= (and b!849909 res!577361) b!849898))

(assert (= (and b!849898 res!577365) b!849908))

(assert (= (and b!849908 res!577366) b!849907))

(assert (= (and b!849907 res!577360) b!849896))

(assert (= (and b!849896 res!577367) b!849905))

(assert (= (and b!849905 res!577363) b!849900))

(assert (= (and b!849900 c!91654) b!849903))

(assert (= (and b!849900 (not c!91654)) b!849901))

(assert (= (or b!849903 b!849901) bm!37819))

(assert (= (or b!849903 b!849901) bm!37820))

(assert (= (and b!849900 (not res!577359)) b!849910))

(assert (= (and b!849897 condMapEmpty!25787) mapIsEmpty!25787))

(assert (= (and b!849897 (not condMapEmpty!25787)) mapNonEmpty!25787))

(get-info :version)

(assert (= (and mapNonEmpty!25787 ((_ is ValueCellFull!7623) mapValue!25787)) b!849904))

(assert (= (and b!849897 ((_ is ValueCellFull!7623) mapDefault!25787)) b!849906))

(assert (= start!73074 b!849897))

(declare-fun b_lambda!11521 () Bool)

(assert (=> (not b_lambda!11521) (not b!849910)))

(declare-fun t!22904 () Bool)

(declare-fun tb!4291 () Bool)

(assert (=> (and start!73074 (= defaultEntry!696 defaultEntry!696) t!22904) tb!4291))

(declare-fun result!8193 () Bool)

(assert (=> tb!4291 (= result!8193 tp_is_empty!16125)))

(assert (=> b!849910 t!22904))

(declare-fun b_and!23139 () Bool)

(assert (= b_and!23137 (and (=> t!22904 result!8193) b_and!23139)))

(declare-fun m!790575 () Bool)

(assert (=> b!849898 m!790575))

(declare-fun m!790577 () Bool)

(assert (=> b!849903 m!790577))

(declare-fun m!790579 () Bool)

(assert (=> b!849910 m!790579))

(declare-fun m!790581 () Bool)

(assert (=> b!849910 m!790581))

(declare-fun m!790583 () Bool)

(assert (=> b!849910 m!790583))

(declare-fun m!790585 () Bool)

(assert (=> b!849910 m!790585))

(assert (=> b!849910 m!790583))

(declare-fun m!790587 () Bool)

(assert (=> b!849910 m!790587))

(declare-fun m!790589 () Bool)

(assert (=> b!849910 m!790589))

(declare-fun m!790591 () Bool)

(assert (=> b!849910 m!790591))

(declare-fun m!790593 () Bool)

(assert (=> b!849910 m!790593))

(declare-fun m!790595 () Bool)

(assert (=> b!849910 m!790595))

(declare-fun m!790597 () Bool)

(assert (=> b!849910 m!790597))

(assert (=> b!849910 m!790581))

(declare-fun m!790599 () Bool)

(assert (=> b!849910 m!790599))

(assert (=> b!849910 m!790589))

(declare-fun m!790601 () Bool)

(assert (=> b!849910 m!790601))

(declare-fun m!790603 () Bool)

(assert (=> b!849910 m!790603))

(declare-fun m!790605 () Bool)

(assert (=> b!849907 m!790605))

(declare-fun m!790607 () Bool)

(assert (=> b!849896 m!790607))

(declare-fun m!790609 () Bool)

(assert (=> b!849905 m!790609))

(assert (=> b!849905 m!790591))

(declare-fun m!790611 () Bool)

(assert (=> b!849905 m!790611))

(declare-fun m!790613 () Bool)

(assert (=> bm!37820 m!790613))

(declare-fun m!790615 () Bool)

(assert (=> b!849909 m!790615))

(assert (=> b!849900 m!790595))

(assert (=> b!849900 m!790595))

(declare-fun m!790617 () Bool)

(assert (=> b!849900 m!790617))

(declare-fun m!790619 () Bool)

(assert (=> b!849900 m!790619))

(declare-fun m!790621 () Bool)

(assert (=> start!73074 m!790621))

(declare-fun m!790623 () Bool)

(assert (=> start!73074 m!790623))

(declare-fun m!790625 () Bool)

(assert (=> mapNonEmpty!25787 m!790625))

(declare-fun m!790627 () Bool)

(assert (=> b!849899 m!790627))

(assert (=> bm!37819 m!790579))

(check-sat (not b!849903) (not b!849899) (not b!849910) (not start!73074) (not b!849898) (not bm!37819) (not b!849905) (not b_next!13989) (not b!849909) tp_is_empty!16125 b_and!23139 (not b_lambda!11521) (not b!849907) (not b!849900) (not mapNonEmpty!25787) (not bm!37820))
(check-sat b_and!23139 (not b_next!13989))
