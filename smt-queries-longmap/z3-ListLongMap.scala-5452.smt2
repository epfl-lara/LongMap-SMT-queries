; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72498 () Bool)

(assert start!72498)

(declare-fun b_free!13683 () Bool)

(declare-fun b_next!13683 () Bool)

(assert (=> start!72498 (= b_free!13683 (not b_next!13683))))

(declare-fun tp!48148 () Bool)

(declare-fun b_and!22769 () Bool)

(assert (=> start!72498 (= tp!48148 b_and!22769)))

(declare-fun b!841130 () Bool)

(declare-fun res!571791 () Bool)

(declare-fun e!469259 () Bool)

(assert (=> b!841130 (=> (not res!571791) (not e!469259))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841130 (= res!571791 (validKeyInArray!0 k0!854))))

(declare-fun b!841131 () Bool)

(declare-fun e!469263 () Bool)

(declare-fun tp_is_empty!15549 () Bool)

(assert (=> b!841131 (= e!469263 tp_is_empty!15549)))

(declare-fun b!841132 () Bool)

(declare-fun e!469261 () Bool)

(declare-fun e!469260 () Bool)

(declare-fun mapRes!24923 () Bool)

(assert (=> b!841132 (= e!469261 (and e!469260 mapRes!24923))))

(declare-fun condMapEmpty!24923 () Bool)

(declare-datatypes ((V!25779 0))(
  ( (V!25780 (val!7822 Int)) )
))
(declare-datatypes ((ValueCell!7335 0))(
  ( (ValueCellFull!7335 (v!10247 V!25779)) (EmptyCell!7335) )
))
(declare-datatypes ((array!47376 0))(
  ( (array!47377 (arr!22719 (Array (_ BitVec 32) ValueCell!7335)) (size!23159 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47376)

(declare-fun mapDefault!24923 () ValueCell!7335)

(assert (=> b!841132 (= condMapEmpty!24923 (= (arr!22719 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7335)) mapDefault!24923)))))

(declare-fun b!841133 () Bool)

(declare-fun res!571787 () Bool)

(assert (=> b!841133 (=> (not res!571787) (not e!469259))))

(declare-datatypes ((array!47378 0))(
  ( (array!47379 (arr!22720 (Array (_ BitVec 32) (_ BitVec 64))) (size!23160 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47378)

(declare-datatypes ((List!16160 0))(
  ( (Nil!16157) (Cons!16156 (h!17287 (_ BitVec 64)) (t!22531 List!16160)) )
))
(declare-fun arrayNoDuplicates!0 (array!47378 (_ BitVec 32) List!16160) Bool)

(assert (=> b!841133 (= res!571787 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16157))))

(declare-fun b!841134 () Bool)

(assert (=> b!841134 (= e!469259 (not true))))

(declare-fun e!469264 () Bool)

(assert (=> b!841134 e!469264))

(declare-fun c!91384 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841134 (= c!91384 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28891 0))(
  ( (Unit!28892) )
))
(declare-fun lt!380890 () Unit!28891)

(declare-fun v!557 () V!25779)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25779)

(declare-fun zeroValue!654 () V!25779)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!291 (array!47378 array!47376 (_ BitVec 32) (_ BitVec 32) V!25779 V!25779 (_ BitVec 32) (_ BitVec 64) V!25779 (_ BitVec 32) Int) Unit!28891)

(assert (=> b!841134 (= lt!380890 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!291 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24923 () Bool)

(declare-fun tp!48147 () Bool)

(assert (=> mapNonEmpty!24923 (= mapRes!24923 (and tp!48147 e!469263))))

(declare-fun mapKey!24923 () (_ BitVec 32))

(declare-fun mapRest!24923 () (Array (_ BitVec 32) ValueCell!7335))

(declare-fun mapValue!24923 () ValueCell!7335)

(assert (=> mapNonEmpty!24923 (= (arr!22719 _values!688) (store mapRest!24923 mapKey!24923 mapValue!24923))))

(declare-fun b!841136 () Bool)

(declare-fun res!571790 () Bool)

(assert (=> b!841136 (=> (not res!571790) (not e!469259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841136 (= res!571790 (validMask!0 mask!1196))))

(declare-fun bm!37279 () Bool)

(declare-datatypes ((tuple2!10376 0))(
  ( (tuple2!10377 (_1!5199 (_ BitVec 64)) (_2!5199 V!25779)) )
))
(declare-datatypes ((List!16161 0))(
  ( (Nil!16158) (Cons!16157 (h!17288 tuple2!10376) (t!22532 List!16161)) )
))
(declare-datatypes ((ListLongMap!9145 0))(
  ( (ListLongMap!9146 (toList!4588 List!16161)) )
))
(declare-fun call!37282 () ListLongMap!9145)

(declare-fun getCurrentListMapNoExtraKeys!2575 (array!47378 array!47376 (_ BitVec 32) (_ BitVec 32) V!25779 V!25779 (_ BitVec 32) Int) ListLongMap!9145)

(assert (=> bm!37279 (= call!37282 (getCurrentListMapNoExtraKeys!2575 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24923 () Bool)

(assert (=> mapIsEmpty!24923 mapRes!24923))

(declare-fun b!841137 () Bool)

(declare-fun call!37283 () ListLongMap!9145)

(assert (=> b!841137 (= e!469264 (= call!37283 call!37282))))

(declare-fun b!841138 () Bool)

(assert (=> b!841138 (= e!469260 tp_is_empty!15549)))

(declare-fun b!841139 () Bool)

(declare-fun res!571786 () Bool)

(assert (=> b!841139 (=> (not res!571786) (not e!469259))))

(assert (=> b!841139 (= res!571786 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23160 _keys!868))))))

(declare-fun b!841140 () Bool)

(declare-fun res!571792 () Bool)

(assert (=> b!841140 (=> (not res!571792) (not e!469259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47378 (_ BitVec 32)) Bool)

(assert (=> b!841140 (= res!571792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37280 () Bool)

(assert (=> bm!37280 (= call!37283 (getCurrentListMapNoExtraKeys!2575 _keys!868 (array!47377 (store (arr!22719 _values!688) i!612 (ValueCellFull!7335 v!557)) (size!23159 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571789 () Bool)

(assert (=> start!72498 (=> (not res!571789) (not e!469259))))

(assert (=> start!72498 (= res!571789 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23160 _keys!868))))))

(assert (=> start!72498 e!469259))

(assert (=> start!72498 tp_is_empty!15549))

(assert (=> start!72498 true))

(assert (=> start!72498 tp!48148))

(declare-fun array_inv!18082 (array!47378) Bool)

(assert (=> start!72498 (array_inv!18082 _keys!868)))

(declare-fun array_inv!18083 (array!47376) Bool)

(assert (=> start!72498 (and (array_inv!18083 _values!688) e!469261)))

(declare-fun b!841135 () Bool)

(declare-fun res!571793 () Bool)

(assert (=> b!841135 (=> (not res!571793) (not e!469259))))

(assert (=> b!841135 (= res!571793 (and (= (select (arr!22720 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23160 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841141 () Bool)

(declare-fun res!571788 () Bool)

(assert (=> b!841141 (=> (not res!571788) (not e!469259))))

(assert (=> b!841141 (= res!571788 (and (= (size!23159 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23160 _keys!868) (size!23159 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841142 () Bool)

(declare-fun +!2055 (ListLongMap!9145 tuple2!10376) ListLongMap!9145)

(assert (=> b!841142 (= e!469264 (= call!37283 (+!2055 call!37282 (tuple2!10377 k0!854 v!557))))))

(assert (= (and start!72498 res!571789) b!841136))

(assert (= (and b!841136 res!571790) b!841141))

(assert (= (and b!841141 res!571788) b!841140))

(assert (= (and b!841140 res!571792) b!841133))

(assert (= (and b!841133 res!571787) b!841139))

(assert (= (and b!841139 res!571786) b!841130))

(assert (= (and b!841130 res!571791) b!841135))

(assert (= (and b!841135 res!571793) b!841134))

(assert (= (and b!841134 c!91384) b!841142))

(assert (= (and b!841134 (not c!91384)) b!841137))

(assert (= (or b!841142 b!841137) bm!37280))

(assert (= (or b!841142 b!841137) bm!37279))

(assert (= (and b!841132 condMapEmpty!24923) mapIsEmpty!24923))

(assert (= (and b!841132 (not condMapEmpty!24923)) mapNonEmpty!24923))

(get-info :version)

(assert (= (and mapNonEmpty!24923 ((_ is ValueCellFull!7335) mapValue!24923)) b!841131))

(assert (= (and b!841132 ((_ is ValueCellFull!7335) mapDefault!24923)) b!841138))

(assert (= start!72498 b!841132))

(declare-fun m!784673 () Bool)

(assert (=> b!841134 m!784673))

(declare-fun m!784675 () Bool)

(assert (=> mapNonEmpty!24923 m!784675))

(declare-fun m!784677 () Bool)

(assert (=> bm!37280 m!784677))

(declare-fun m!784679 () Bool)

(assert (=> bm!37280 m!784679))

(declare-fun m!784681 () Bool)

(assert (=> b!841136 m!784681))

(declare-fun m!784683 () Bool)

(assert (=> b!841130 m!784683))

(declare-fun m!784685 () Bool)

(assert (=> b!841140 m!784685))

(declare-fun m!784687 () Bool)

(assert (=> start!72498 m!784687))

(declare-fun m!784689 () Bool)

(assert (=> start!72498 m!784689))

(declare-fun m!784691 () Bool)

(assert (=> b!841142 m!784691))

(declare-fun m!784693 () Bool)

(assert (=> b!841135 m!784693))

(declare-fun m!784695 () Bool)

(assert (=> bm!37279 m!784695))

(declare-fun m!784697 () Bool)

(assert (=> b!841133 m!784697))

(check-sat (not b_next!13683) (not b!841133) tp_is_empty!15549 (not b!841142) (not bm!37279) (not bm!37280) (not mapNonEmpty!24923) (not b!841134) (not start!72498) (not b!841136) b_and!22769 (not b!841130) (not b!841140))
(check-sat b_and!22769 (not b_next!13683))
