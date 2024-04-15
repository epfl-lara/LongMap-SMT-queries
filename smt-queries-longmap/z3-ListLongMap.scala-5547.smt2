; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73048 () Bool)

(assert start!73048)

(declare-fun b_free!13981 () Bool)

(declare-fun b_next!13981 () Bool)

(assert (=> start!73048 (= b_free!13981 (not b_next!13981))))

(declare-fun tp!49448 () Bool)

(declare-fun b_and!23095 () Bool)

(assert (=> start!73048 (= tp!49448 b_and!23095)))

(declare-fun res!577137 () Bool)

(declare-fun e!473891 () Bool)

(assert (=> start!73048 (=> (not res!577137) (not e!473891))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48433 0))(
  ( (array!48434 (arr!23248 (Array (_ BitVec 32) (_ BitVec 64))) (size!23690 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48433)

(assert (=> start!73048 (= res!577137 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23690 _keys!868))))))

(assert (=> start!73048 e!473891))

(declare-fun tp_is_empty!16117 () Bool)

(assert (=> start!73048 tp_is_empty!16117))

(assert (=> start!73048 true))

(assert (=> start!73048 tp!49448))

(declare-fun array_inv!18534 (array!48433) Bool)

(assert (=> start!73048 (array_inv!18534 _keys!868)))

(declare-datatypes ((V!26537 0))(
  ( (V!26538 (val!8106 Int)) )
))
(declare-datatypes ((ValueCell!7619 0))(
  ( (ValueCellFull!7619 (v!10525 V!26537)) (EmptyCell!7619) )
))
(declare-datatypes ((array!48435 0))(
  ( (array!48436 (arr!23249 (Array (_ BitVec 32) ValueCell!7619)) (size!23691 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48435)

(declare-fun e!473890 () Bool)

(declare-fun array_inv!18535 (array!48435) Bool)

(assert (=> start!73048 (and (array_inv!18535 _values!688) e!473890)))

(declare-fun b!849469 () Bool)

(declare-fun res!577129 () Bool)

(assert (=> b!849469 (=> (not res!577129) (not e!473891))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849469 (= res!577129 (validMask!0 mask!1196))))

(declare-fun b!849470 () Bool)

(declare-fun e!473885 () Bool)

(assert (=> b!849470 (= e!473885 tp_is_empty!16117)))

(declare-fun b!849471 () Bool)

(declare-fun e!473889 () Bool)

(assert (=> b!849471 (= e!473889 tp_is_empty!16117)))

(declare-fun v!557 () V!26537)

(declare-datatypes ((tuple2!10640 0))(
  ( (tuple2!10641 (_1!5331 (_ BitVec 64)) (_2!5331 V!26537)) )
))
(declare-datatypes ((List!16484 0))(
  ( (Nil!16481) (Cons!16480 (h!17611 tuple2!10640) (t!22902 List!16484)) )
))
(declare-datatypes ((ListLongMap!9399 0))(
  ( (ListLongMap!9400 (toList!4715 List!16484)) )
))
(declare-fun call!37773 () ListLongMap!9399)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!37772 () ListLongMap!9399)

(declare-fun b!849472 () Bool)

(declare-fun e!473888 () Bool)

(declare-fun +!2142 (ListLongMap!9399 tuple2!10640) ListLongMap!9399)

(assert (=> b!849472 (= e!473888 (= call!37772 (+!2142 call!37773 (tuple2!10641 k0!854 v!557))))))

(declare-fun b!849473 () Bool)

(declare-fun res!577131 () Bool)

(assert (=> b!849473 (=> (not res!577131) (not e!473891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48433 (_ BitVec 32)) Bool)

(assert (=> b!849473 (= res!577131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849474 () Bool)

(declare-fun res!577133 () Bool)

(assert (=> b!849474 (=> (not res!577133) (not e!473891))))

(declare-datatypes ((List!16485 0))(
  ( (Nil!16482) (Cons!16481 (h!17612 (_ BitVec 64)) (t!22903 List!16485)) )
))
(declare-fun arrayNoDuplicates!0 (array!48433 (_ BitVec 32) List!16485) Bool)

(assert (=> b!849474 (= res!577133 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16482))))

(declare-fun b!849475 () Bool)

(declare-fun e!473886 () Bool)

(declare-fun e!473892 () Bool)

(assert (=> b!849475 (= e!473886 (not e!473892))))

(declare-fun res!577134 () Bool)

(assert (=> b!849475 (=> res!577134 e!473892)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849475 (= res!577134 (not (validKeyInArray!0 (select (arr!23248 _keys!868) from!1053))))))

(assert (=> b!849475 e!473888))

(declare-fun c!91577 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849475 (= c!91577 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28955 0))(
  ( (Unit!28956) )
))
(declare-fun lt!382121 () Unit!28955)

(declare-fun minValue!654 () V!26537)

(declare-fun zeroValue!654 () V!26537)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!352 (array!48433 array!48435 (_ BitVec 32) (_ BitVec 32) V!26537 V!26537 (_ BitVec 32) (_ BitVec 64) V!26537 (_ BitVec 32) Int) Unit!28955)

(assert (=> b!849475 (= lt!382121 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!352 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849476 () Bool)

(declare-fun res!577128 () Bool)

(assert (=> b!849476 (=> (not res!577128) (not e!473891))))

(assert (=> b!849476 (= res!577128 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23690 _keys!868))))))

(declare-fun b!849477 () Bool)

(declare-fun res!577136 () Bool)

(assert (=> b!849477 (=> (not res!577136) (not e!473891))))

(assert (=> b!849477 (= res!577136 (and (= (size!23691 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23690 _keys!868) (size!23691 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25775 () Bool)

(declare-fun mapRes!25775 () Bool)

(declare-fun tp!49447 () Bool)

(assert (=> mapNonEmpty!25775 (= mapRes!25775 (and tp!49447 e!473889))))

(declare-fun mapValue!25775 () ValueCell!7619)

(declare-fun mapRest!25775 () (Array (_ BitVec 32) ValueCell!7619))

(declare-fun mapKey!25775 () (_ BitVec 32))

(assert (=> mapNonEmpty!25775 (= (arr!23249 _values!688) (store mapRest!25775 mapKey!25775 mapValue!25775))))

(declare-fun b!849478 () Bool)

(assert (=> b!849478 (= e!473888 (= call!37772 call!37773))))

(declare-fun b!849479 () Bool)

(assert (=> b!849479 (= e!473891 e!473886)))

(declare-fun res!577132 () Bool)

(assert (=> b!849479 (=> (not res!577132) (not e!473886))))

(assert (=> b!849479 (= res!577132 (= from!1053 i!612))))

(declare-fun lt!382125 () array!48435)

(declare-fun lt!382124 () ListLongMap!9399)

(declare-fun getCurrentListMapNoExtraKeys!2724 (array!48433 array!48435 (_ BitVec 32) (_ BitVec 32) V!26537 V!26537 (_ BitVec 32) Int) ListLongMap!9399)

(assert (=> b!849479 (= lt!382124 (getCurrentListMapNoExtraKeys!2724 _keys!868 lt!382125 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849479 (= lt!382125 (array!48436 (store (arr!23249 _values!688) i!612 (ValueCellFull!7619 v!557)) (size!23691 _values!688)))))

(declare-fun lt!382123 () ListLongMap!9399)

(assert (=> b!849479 (= lt!382123 (getCurrentListMapNoExtraKeys!2724 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37769 () Bool)

(assert (=> bm!37769 (= call!37772 (getCurrentListMapNoExtraKeys!2724 _keys!868 lt!382125 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37770 () Bool)

(assert (=> bm!37770 (= call!37773 (getCurrentListMapNoExtraKeys!2724 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849480 () Bool)

(declare-fun res!577135 () Bool)

(assert (=> b!849480 (=> (not res!577135) (not e!473891))))

(assert (=> b!849480 (= res!577135 (validKeyInArray!0 k0!854))))

(declare-fun b!849481 () Bool)

(assert (=> b!849481 (= e!473890 (and e!473885 mapRes!25775))))

(declare-fun condMapEmpty!25775 () Bool)

(declare-fun mapDefault!25775 () ValueCell!7619)

(assert (=> b!849481 (= condMapEmpty!25775 (= (arr!23249 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7619)) mapDefault!25775)))))

(declare-fun mapIsEmpty!25775 () Bool)

(assert (=> mapIsEmpty!25775 mapRes!25775))

(declare-fun b!849482 () Bool)

(declare-fun res!577130 () Bool)

(assert (=> b!849482 (=> (not res!577130) (not e!473891))))

(assert (=> b!849482 (= res!577130 (and (= (select (arr!23248 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849483 () Bool)

(assert (=> b!849483 (= e!473892 true)))

(declare-fun lt!382127 () ListLongMap!9399)

(declare-fun lt!382122 () V!26537)

(declare-fun lt!382126 () tuple2!10640)

(assert (=> b!849483 (= (+!2142 lt!382127 lt!382126) (+!2142 (+!2142 lt!382127 (tuple2!10641 k0!854 lt!382122)) lt!382126))))

(declare-fun lt!382118 () V!26537)

(assert (=> b!849483 (= lt!382126 (tuple2!10641 k0!854 lt!382118))))

(declare-fun lt!382120 () Unit!28955)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!256 (ListLongMap!9399 (_ BitVec 64) V!26537 V!26537) Unit!28955)

(assert (=> b!849483 (= lt!382120 (addSameAsAddTwiceSameKeyDiffValues!256 lt!382127 k0!854 lt!382122 lt!382118))))

(declare-fun lt!382119 () V!26537)

(declare-fun get!12247 (ValueCell!7619 V!26537) V!26537)

(assert (=> b!849483 (= lt!382122 (get!12247 (select (arr!23249 _values!688) from!1053) lt!382119))))

(assert (=> b!849483 (= lt!382124 (+!2142 lt!382127 (tuple2!10641 (select (arr!23248 _keys!868) from!1053) lt!382118)))))

(assert (=> b!849483 (= lt!382118 (get!12247 (select (store (arr!23249 _values!688) i!612 (ValueCellFull!7619 v!557)) from!1053) lt!382119))))

(declare-fun dynLambda!1006 (Int (_ BitVec 64)) V!26537)

(assert (=> b!849483 (= lt!382119 (dynLambda!1006 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!849483 (= lt!382127 (getCurrentListMapNoExtraKeys!2724 _keys!868 lt!382125 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73048 res!577137) b!849469))

(assert (= (and b!849469 res!577129) b!849477))

(assert (= (and b!849477 res!577136) b!849473))

(assert (= (and b!849473 res!577131) b!849474))

(assert (= (and b!849474 res!577133) b!849476))

(assert (= (and b!849476 res!577128) b!849480))

(assert (= (and b!849480 res!577135) b!849482))

(assert (= (and b!849482 res!577130) b!849479))

(assert (= (and b!849479 res!577132) b!849475))

(assert (= (and b!849475 c!91577) b!849472))

(assert (= (and b!849475 (not c!91577)) b!849478))

(assert (= (or b!849472 b!849478) bm!37769))

(assert (= (or b!849472 b!849478) bm!37770))

(assert (= (and b!849475 (not res!577134)) b!849483))

(assert (= (and b!849481 condMapEmpty!25775) mapIsEmpty!25775))

(assert (= (and b!849481 (not condMapEmpty!25775)) mapNonEmpty!25775))

(get-info :version)

(assert (= (and mapNonEmpty!25775 ((_ is ValueCellFull!7619) mapValue!25775)) b!849471))

(assert (= (and b!849481 ((_ is ValueCellFull!7619) mapDefault!25775)) b!849470))

(assert (= start!73048 b!849481))

(declare-fun b_lambda!11495 () Bool)

(assert (=> (not b_lambda!11495) (not b!849483)))

(declare-fun t!22901 () Bool)

(declare-fun tb!4275 () Bool)

(assert (=> (and start!73048 (= defaultEntry!696 defaultEntry!696) t!22901) tb!4275))

(declare-fun result!8169 () Bool)

(assert (=> tb!4275 (= result!8169 tp_is_empty!16117)))

(assert (=> b!849483 t!22901))

(declare-fun b_and!23097 () Bool)

(assert (= b_and!23095 (and (=> t!22901 result!8169) b_and!23097)))

(declare-fun m!789605 () Bool)

(assert (=> b!849482 m!789605))

(declare-fun m!789607 () Bool)

(assert (=> bm!37769 m!789607))

(declare-fun m!789609 () Bool)

(assert (=> b!849483 m!789609))

(declare-fun m!789611 () Bool)

(assert (=> b!849483 m!789611))

(declare-fun m!789613 () Bool)

(assert (=> b!849483 m!789613))

(declare-fun m!789615 () Bool)

(assert (=> b!849483 m!789615))

(assert (=> b!849483 m!789607))

(declare-fun m!789617 () Bool)

(assert (=> b!849483 m!789617))

(declare-fun m!789619 () Bool)

(assert (=> b!849483 m!789619))

(declare-fun m!789621 () Bool)

(assert (=> b!849483 m!789621))

(assert (=> b!849483 m!789613))

(assert (=> b!849483 m!789617))

(declare-fun m!789623 () Bool)

(assert (=> b!849483 m!789623))

(declare-fun m!789625 () Bool)

(assert (=> b!849483 m!789625))

(declare-fun m!789627 () Bool)

(assert (=> b!849483 m!789627))

(assert (=> b!849483 m!789621))

(declare-fun m!789629 () Bool)

(assert (=> b!849483 m!789629))

(declare-fun m!789631 () Bool)

(assert (=> b!849483 m!789631))

(declare-fun m!789633 () Bool)

(assert (=> b!849472 m!789633))

(declare-fun m!789635 () Bool)

(assert (=> b!849473 m!789635))

(declare-fun m!789637 () Bool)

(assert (=> bm!37770 m!789637))

(declare-fun m!789639 () Bool)

(assert (=> mapNonEmpty!25775 m!789639))

(declare-fun m!789641 () Bool)

(assert (=> start!73048 m!789641))

(declare-fun m!789643 () Bool)

(assert (=> start!73048 m!789643))

(declare-fun m!789645 () Bool)

(assert (=> b!849474 m!789645))

(declare-fun m!789647 () Bool)

(assert (=> b!849469 m!789647))

(declare-fun m!789649 () Bool)

(assert (=> b!849480 m!789649))

(declare-fun m!789651 () Bool)

(assert (=> b!849479 m!789651))

(assert (=> b!849479 m!789619))

(declare-fun m!789653 () Bool)

(assert (=> b!849479 m!789653))

(assert (=> b!849475 m!789625))

(assert (=> b!849475 m!789625))

(declare-fun m!789655 () Bool)

(assert (=> b!849475 m!789655))

(declare-fun m!789657 () Bool)

(assert (=> b!849475 m!789657))

(check-sat (not b!849469) b_and!23097 (not bm!37769) (not bm!37770) (not b!849480) (not b!849474) (not start!73048) (not b!849473) tp_is_empty!16117 (not b_lambda!11495) (not b!849483) (not b!849479) (not b!849472) (not b!849475) (not b_next!13981) (not mapNonEmpty!25775))
(check-sat b_and!23097 (not b_next!13981))
