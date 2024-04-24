; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73270 () Bool)

(assert start!73270)

(declare-fun b_free!14017 () Bool)

(declare-fun b_next!14017 () Bool)

(assert (=> start!73270 (= b_free!14017 (not b_next!14017))))

(declare-fun tp!49555 () Bool)

(declare-fun b_and!23203 () Bool)

(assert (=> start!73270 (= tp!49555 b_and!23203)))

(declare-fun b!851457 () Bool)

(declare-fun res!578128 () Bool)

(declare-fun e!475052 () Bool)

(assert (=> b!851457 (=> (not res!578128) (not e!475052))))

(declare-datatypes ((array!48559 0))(
  ( (array!48560 (arr!23306 (Array (_ BitVec 32) (_ BitVec 64))) (size!23747 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48559)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48559 (_ BitVec 32)) Bool)

(assert (=> b!851457 (= res!578128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851458 () Bool)

(declare-fun e!475053 () Bool)

(declare-fun tp_is_empty!16153 () Bool)

(assert (=> b!851458 (= e!475053 tp_is_empty!16153)))

(declare-fun b!851459 () Bool)

(declare-fun e!475047 () Bool)

(declare-fun mapRes!25829 () Bool)

(assert (=> b!851459 (= e!475047 (and e!475053 mapRes!25829))))

(declare-fun condMapEmpty!25829 () Bool)

(declare-datatypes ((V!26585 0))(
  ( (V!26586 (val!8124 Int)) )
))
(declare-datatypes ((ValueCell!7637 0))(
  ( (ValueCellFull!7637 (v!10549 V!26585)) (EmptyCell!7637) )
))
(declare-datatypes ((array!48561 0))(
  ( (array!48562 (arr!23307 (Array (_ BitVec 32) ValueCell!7637)) (size!23748 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48561)

(declare-fun mapDefault!25829 () ValueCell!7637)

(assert (=> b!851459 (= condMapEmpty!25829 (= (arr!23307 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7637)) mapDefault!25829)))))

(declare-datatypes ((tuple2!10574 0))(
  ( (tuple2!10575 (_1!5298 (_ BitVec 64)) (_2!5298 V!26585)) )
))
(declare-datatypes ((List!16435 0))(
  ( (Nil!16432) (Cons!16431 (h!17568 tuple2!10574) (t!22890 List!16435)) )
))
(declare-datatypes ((ListLongMap!9345 0))(
  ( (ListLongMap!9346 (toList!4688 List!16435)) )
))
(declare-fun call!37952 () ListLongMap!9345)

(declare-fun bm!37948 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26585)

(declare-fun zeroValue!654 () V!26585)

(declare-fun lt!383255 () array!48561)

(declare-fun getCurrentListMapNoExtraKeys!2746 (array!48559 array!48561 (_ BitVec 32) (_ BitVec 32) V!26585 V!26585 (_ BitVec 32) Int) ListLongMap!9345)

(assert (=> bm!37948 (= call!37952 (getCurrentListMapNoExtraKeys!2746 _keys!868 lt!383255 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851460 () Bool)

(declare-fun res!578127 () Bool)

(assert (=> b!851460 (=> (not res!578127) (not e!475052))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851460 (= res!578127 (validKeyInArray!0 k0!854))))

(declare-fun b!851461 () Bool)

(declare-fun res!578131 () Bool)

(assert (=> b!851461 (=> (not res!578131) (not e!475052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851461 (= res!578131 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25829 () Bool)

(assert (=> mapIsEmpty!25829 mapRes!25829))

(declare-fun b!851462 () Bool)

(declare-fun e!475048 () Bool)

(assert (=> b!851462 (= e!475052 e!475048)))

(declare-fun res!578123 () Bool)

(assert (=> b!851462 (=> (not res!578123) (not e!475048))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851462 (= res!578123 (= from!1053 i!612))))

(declare-fun lt!383261 () ListLongMap!9345)

(assert (=> b!851462 (= lt!383261 (getCurrentListMapNoExtraKeys!2746 _keys!868 lt!383255 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26585)

(assert (=> b!851462 (= lt!383255 (array!48562 (store (arr!23307 _values!688) i!612 (ValueCellFull!7637 v!557)) (size!23748 _values!688)))))

(declare-fun lt!383257 () ListLongMap!9345)

(assert (=> b!851462 (= lt!383257 (getCurrentListMapNoExtraKeys!2746 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851463 () Bool)

(declare-fun res!578126 () Bool)

(assert (=> b!851463 (=> (not res!578126) (not e!475052))))

(assert (=> b!851463 (= res!578126 (and (= (select (arr!23306 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun call!37951 () ListLongMap!9345)

(declare-fun bm!37949 () Bool)

(assert (=> bm!37949 (= call!37951 (getCurrentListMapNoExtraKeys!2746 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25829 () Bool)

(declare-fun tp!49556 () Bool)

(declare-fun e!475050 () Bool)

(assert (=> mapNonEmpty!25829 (= mapRes!25829 (and tp!49556 e!475050))))

(declare-fun mapValue!25829 () ValueCell!7637)

(declare-fun mapKey!25829 () (_ BitVec 32))

(declare-fun mapRest!25829 () (Array (_ BitVec 32) ValueCell!7637))

(assert (=> mapNonEmpty!25829 (= (arr!23307 _values!688) (store mapRest!25829 mapKey!25829 mapValue!25829))))

(declare-fun b!851464 () Bool)

(declare-fun e!475049 () Bool)

(assert (=> b!851464 (= e!475049 true)))

(declare-fun lt!383262 () ListLongMap!9345)

(declare-fun lt!383258 () V!26585)

(declare-fun lt!383256 () tuple2!10574)

(declare-fun +!2137 (ListLongMap!9345 tuple2!10574) ListLongMap!9345)

(assert (=> b!851464 (= (+!2137 lt!383262 lt!383256) (+!2137 (+!2137 lt!383262 (tuple2!10575 k0!854 lt!383258)) lt!383256))))

(declare-fun lt!383259 () V!26585)

(assert (=> b!851464 (= lt!383256 (tuple2!10575 k0!854 lt!383259))))

(declare-datatypes ((Unit!29038 0))(
  ( (Unit!29039) )
))
(declare-fun lt!383263 () Unit!29038)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!267 (ListLongMap!9345 (_ BitVec 64) V!26585 V!26585) Unit!29038)

(assert (=> b!851464 (= lt!383263 (addSameAsAddTwiceSameKeyDiffValues!267 lt!383262 k0!854 lt!383258 lt!383259))))

(declare-fun lt!383264 () V!26585)

(declare-fun get!12270 (ValueCell!7637 V!26585) V!26585)

(assert (=> b!851464 (= lt!383258 (get!12270 (select (arr!23307 _values!688) from!1053) lt!383264))))

(assert (=> b!851464 (= lt!383261 (+!2137 lt!383262 (tuple2!10575 (select (arr!23306 _keys!868) from!1053) lt!383259)))))

(assert (=> b!851464 (= lt!383259 (get!12270 (select (store (arr!23307 _values!688) i!612 (ValueCellFull!7637 v!557)) from!1053) lt!383264))))

(declare-fun dynLambda!1014 (Int (_ BitVec 64)) V!26585)

(assert (=> b!851464 (= lt!383264 (dynLambda!1014 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851464 (= lt!383262 (getCurrentListMapNoExtraKeys!2746 _keys!868 lt!383255 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851465 () Bool)

(declare-fun e!475051 () Bool)

(assert (=> b!851465 (= e!475051 (= call!37952 call!37951))))

(declare-fun b!851466 () Bool)

(assert (=> b!851466 (= e!475048 (not e!475049))))

(declare-fun res!578130 () Bool)

(assert (=> b!851466 (=> res!578130 e!475049)))

(assert (=> b!851466 (= res!578130 (not (validKeyInArray!0 (select (arr!23306 _keys!868) from!1053))))))

(assert (=> b!851466 e!475051))

(declare-fun c!91978 () Bool)

(assert (=> b!851466 (= c!91978 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383260 () Unit!29038)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!353 (array!48559 array!48561 (_ BitVec 32) (_ BitVec 32) V!26585 V!26585 (_ BitVec 32) (_ BitVec 64) V!26585 (_ BitVec 32) Int) Unit!29038)

(assert (=> b!851466 (= lt!383260 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!353 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851467 () Bool)

(declare-fun res!578125 () Bool)

(assert (=> b!851467 (=> (not res!578125) (not e!475052))))

(declare-datatypes ((List!16436 0))(
  ( (Nil!16433) (Cons!16432 (h!17569 (_ BitVec 64)) (t!22891 List!16436)) )
))
(declare-fun arrayNoDuplicates!0 (array!48559 (_ BitVec 32) List!16436) Bool)

(assert (=> b!851467 (= res!578125 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16433))))

(declare-fun b!851468 () Bool)

(assert (=> b!851468 (= e!475050 tp_is_empty!16153)))

(declare-fun b!851469 () Bool)

(assert (=> b!851469 (= e!475051 (= call!37952 (+!2137 call!37951 (tuple2!10575 k0!854 v!557))))))

(declare-fun b!851470 () Bool)

(declare-fun res!578122 () Bool)

(assert (=> b!851470 (=> (not res!578122) (not e!475052))))

(assert (=> b!851470 (= res!578122 (and (= (size!23748 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23747 _keys!868) (size!23748 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851471 () Bool)

(declare-fun res!578124 () Bool)

(assert (=> b!851471 (=> (not res!578124) (not e!475052))))

(assert (=> b!851471 (= res!578124 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23747 _keys!868))))))

(declare-fun res!578129 () Bool)

(assert (=> start!73270 (=> (not res!578129) (not e!475052))))

(assert (=> start!73270 (= res!578129 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23747 _keys!868))))))

(assert (=> start!73270 e!475052))

(assert (=> start!73270 tp_is_empty!16153))

(assert (=> start!73270 true))

(assert (=> start!73270 tp!49555))

(declare-fun array_inv!18540 (array!48559) Bool)

(assert (=> start!73270 (array_inv!18540 _keys!868)))

(declare-fun array_inv!18541 (array!48561) Bool)

(assert (=> start!73270 (and (array_inv!18541 _values!688) e!475047)))

(assert (= (and start!73270 res!578129) b!851461))

(assert (= (and b!851461 res!578131) b!851470))

(assert (= (and b!851470 res!578122) b!851457))

(assert (= (and b!851457 res!578128) b!851467))

(assert (= (and b!851467 res!578125) b!851471))

(assert (= (and b!851471 res!578124) b!851460))

(assert (= (and b!851460 res!578127) b!851463))

(assert (= (and b!851463 res!578126) b!851462))

(assert (= (and b!851462 res!578123) b!851466))

(assert (= (and b!851466 c!91978) b!851469))

(assert (= (and b!851466 (not c!91978)) b!851465))

(assert (= (or b!851469 b!851465) bm!37948))

(assert (= (or b!851469 b!851465) bm!37949))

(assert (= (and b!851466 (not res!578130)) b!851464))

(assert (= (and b!851459 condMapEmpty!25829) mapIsEmpty!25829))

(assert (= (and b!851459 (not condMapEmpty!25829)) mapNonEmpty!25829))

(get-info :version)

(assert (= (and mapNonEmpty!25829 ((_ is ValueCellFull!7637) mapValue!25829)) b!851468))

(assert (= (and b!851459 ((_ is ValueCellFull!7637) mapDefault!25829)) b!851458))

(assert (= start!73270 b!851459))

(declare-fun b_lambda!11563 () Bool)

(assert (=> (not b_lambda!11563) (not b!851464)))

(declare-fun t!22889 () Bool)

(declare-fun tb!4311 () Bool)

(assert (=> (and start!73270 (= defaultEntry!696 defaultEntry!696) t!22889) tb!4311))

(declare-fun result!8241 () Bool)

(assert (=> tb!4311 (= result!8241 tp_is_empty!16153)))

(assert (=> b!851464 t!22889))

(declare-fun b_and!23205 () Bool)

(assert (= b_and!23203 (and (=> t!22889 result!8241) b_and!23205)))

(declare-fun m!792625 () Bool)

(assert (=> mapNonEmpty!25829 m!792625))

(declare-fun m!792627 () Bool)

(assert (=> b!851463 m!792627))

(declare-fun m!792629 () Bool)

(assert (=> b!851462 m!792629))

(declare-fun m!792631 () Bool)

(assert (=> b!851462 m!792631))

(declare-fun m!792633 () Bool)

(assert (=> b!851462 m!792633))

(declare-fun m!792635 () Bool)

(assert (=> b!851457 m!792635))

(declare-fun m!792637 () Bool)

(assert (=> b!851461 m!792637))

(declare-fun m!792639 () Bool)

(assert (=> b!851464 m!792639))

(assert (=> b!851464 m!792639))

(declare-fun m!792641 () Bool)

(assert (=> b!851464 m!792641))

(declare-fun m!792643 () Bool)

(assert (=> b!851464 m!792643))

(declare-fun m!792645 () Bool)

(assert (=> b!851464 m!792645))

(declare-fun m!792647 () Bool)

(assert (=> b!851464 m!792647))

(declare-fun m!792649 () Bool)

(assert (=> b!851464 m!792649))

(declare-fun m!792651 () Bool)

(assert (=> b!851464 m!792651))

(assert (=> b!851464 m!792643))

(assert (=> b!851464 m!792631))

(declare-fun m!792653 () Bool)

(assert (=> b!851464 m!792653))

(assert (=> b!851464 m!792647))

(declare-fun m!792655 () Bool)

(assert (=> b!851464 m!792655))

(declare-fun m!792657 () Bool)

(assert (=> b!851464 m!792657))

(declare-fun m!792659 () Bool)

(assert (=> b!851464 m!792659))

(declare-fun m!792661 () Bool)

(assert (=> b!851464 m!792661))

(assert (=> b!851466 m!792655))

(assert (=> b!851466 m!792655))

(declare-fun m!792663 () Bool)

(assert (=> b!851466 m!792663))

(declare-fun m!792665 () Bool)

(assert (=> b!851466 m!792665))

(declare-fun m!792667 () Bool)

(assert (=> b!851460 m!792667))

(declare-fun m!792669 () Bool)

(assert (=> b!851467 m!792669))

(declare-fun m!792671 () Bool)

(assert (=> bm!37949 m!792671))

(declare-fun m!792673 () Bool)

(assert (=> start!73270 m!792673))

(declare-fun m!792675 () Bool)

(assert (=> start!73270 m!792675))

(assert (=> bm!37948 m!792661))

(declare-fun m!792677 () Bool)

(assert (=> b!851469 m!792677))

(check-sat (not b_next!14017) (not b!851460) (not b!851469) (not b!851462) (not bm!37949) (not bm!37948) (not b_lambda!11563) b_and!23205 (not b!851467) (not b!851457) tp_is_empty!16153 (not b!851461) (not start!73270) (not b!851466) (not mapNonEmpty!25829) (not b!851464))
(check-sat b_and!23205 (not b_next!14017))
