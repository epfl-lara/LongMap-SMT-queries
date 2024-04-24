; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72598 () Bool)

(assert start!72598)

(declare-fun b_free!13615 () Bool)

(declare-fun b_next!13615 () Bool)

(assert (=> start!72598 (= b_free!13615 (not b_next!13615))))

(declare-fun tp!47945 () Bool)

(declare-fun b_and!22711 () Bool)

(assert (=> start!72598 (= tp!47945 b_and!22711)))

(declare-fun b!840707 () Bool)

(declare-fun res!571315 () Bool)

(declare-fun e!469233 () Bool)

(assert (=> b!840707 (=> (not res!571315) (not e!469233))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840707 (= res!571315 (validKeyInArray!0 k0!854))))

(declare-fun b!840708 () Bool)

(assert (=> b!840708 (= e!469233 (not true))))

(declare-fun e!469232 () Bool)

(assert (=> b!840708 e!469232))

(declare-fun c!91564 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840708 (= c!91564 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28856 0))(
  ( (Unit!28857) )
))
(declare-fun lt!381149 () Unit!28856)

(declare-datatypes ((V!25689 0))(
  ( (V!25690 (val!7788 Int)) )
))
(declare-fun v!557 () V!25689)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47257 0))(
  ( (array!47258 (arr!22655 (Array (_ BitVec 32) (_ BitVec 64))) (size!23096 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47257)

(declare-datatypes ((ValueCell!7301 0))(
  ( (ValueCellFull!7301 (v!10213 V!25689)) (EmptyCell!7301) )
))
(declare-datatypes ((array!47259 0))(
  ( (array!47260 (arr!22656 (Array (_ BitVec 32) ValueCell!7301)) (size!23097 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47259)

(declare-fun minValue!654 () V!25689)

(declare-fun zeroValue!654 () V!25689)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!264 (array!47257 array!47259 (_ BitVec 32) (_ BitVec 32) V!25689 V!25689 (_ BitVec 32) (_ BitVec 64) V!25689 (_ BitVec 32) Int) Unit!28856)

(assert (=> b!840708 (= lt!381149 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!264 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840709 () Bool)

(declare-fun e!469234 () Bool)

(declare-fun e!469230 () Bool)

(declare-fun mapRes!24821 () Bool)

(assert (=> b!840709 (= e!469234 (and e!469230 mapRes!24821))))

(declare-fun condMapEmpty!24821 () Bool)

(declare-fun mapDefault!24821 () ValueCell!7301)

(assert (=> b!840709 (= condMapEmpty!24821 (= (arr!22656 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7301)) mapDefault!24821)))))

(declare-fun b!840710 () Bool)

(declare-fun e!469231 () Bool)

(declare-fun tp_is_empty!15481 () Bool)

(assert (=> b!840710 (= e!469231 tp_is_empty!15481)))

(declare-fun res!571318 () Bool)

(assert (=> start!72598 (=> (not res!571318) (not e!469233))))

(assert (=> start!72598 (= res!571318 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23096 _keys!868))))))

(assert (=> start!72598 e!469233))

(assert (=> start!72598 tp_is_empty!15481))

(assert (=> start!72598 true))

(assert (=> start!72598 tp!47945))

(declare-fun array_inv!18080 (array!47257) Bool)

(assert (=> start!72598 (array_inv!18080 _keys!868)))

(declare-fun array_inv!18081 (array!47259) Bool)

(assert (=> start!72598 (and (array_inv!18081 _values!688) e!469234)))

(declare-fun b!840711 () Bool)

(declare-fun res!571319 () Bool)

(assert (=> b!840711 (=> (not res!571319) (not e!469233))))

(assert (=> b!840711 (= res!571319 (and (= (size!23097 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23096 _keys!868) (size!23097 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840712 () Bool)

(declare-fun res!571321 () Bool)

(assert (=> b!840712 (=> (not res!571321) (not e!469233))))

(declare-datatypes ((List!16021 0))(
  ( (Nil!16018) (Cons!16017 (h!17154 (_ BitVec 64)) (t!22384 List!16021)) )
))
(declare-fun arrayNoDuplicates!0 (array!47257 (_ BitVec 32) List!16021) Bool)

(assert (=> b!840712 (= res!571321 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16018))))

(declare-fun mapIsEmpty!24821 () Bool)

(assert (=> mapIsEmpty!24821 mapRes!24821))

(declare-fun b!840713 () Bool)

(declare-fun res!571316 () Bool)

(assert (=> b!840713 (=> (not res!571316) (not e!469233))))

(assert (=> b!840713 (= res!571316 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23096 _keys!868))))))

(declare-fun b!840714 () Bool)

(declare-fun res!571317 () Bool)

(assert (=> b!840714 (=> (not res!571317) (not e!469233))))

(assert (=> b!840714 (= res!571317 (and (= (select (arr!22655 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23096 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840715 () Bool)

(declare-fun res!571320 () Bool)

(assert (=> b!840715 (=> (not res!571320) (not e!469233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47257 (_ BitVec 32)) Bool)

(assert (=> b!840715 (= res!571320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37120 () Bool)

(declare-datatypes ((tuple2!10244 0))(
  ( (tuple2!10245 (_1!5133 (_ BitVec 64)) (_2!5133 V!25689)) )
))
(declare-datatypes ((List!16022 0))(
  ( (Nil!16019) (Cons!16018 (h!17155 tuple2!10244) (t!22385 List!16022)) )
))
(declare-datatypes ((ListLongMap!9015 0))(
  ( (ListLongMap!9016 (toList!4523 List!16022)) )
))
(declare-fun call!37123 () ListLongMap!9015)

(declare-fun getCurrentListMapNoExtraKeys!2585 (array!47257 array!47259 (_ BitVec 32) (_ BitVec 32) V!25689 V!25689 (_ BitVec 32) Int) ListLongMap!9015)

(assert (=> bm!37120 (= call!37123 (getCurrentListMapNoExtraKeys!2585 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24821 () Bool)

(declare-fun tp!47944 () Bool)

(assert (=> mapNonEmpty!24821 (= mapRes!24821 (and tp!47944 e!469231))))

(declare-fun mapValue!24821 () ValueCell!7301)

(declare-fun mapRest!24821 () (Array (_ BitVec 32) ValueCell!7301))

(declare-fun mapKey!24821 () (_ BitVec 32))

(assert (=> mapNonEmpty!24821 (= (arr!22656 _values!688) (store mapRest!24821 mapKey!24821 mapValue!24821))))

(declare-fun bm!37121 () Bool)

(declare-fun call!37124 () ListLongMap!9015)

(assert (=> bm!37121 (= call!37124 (getCurrentListMapNoExtraKeys!2585 _keys!868 (array!47260 (store (arr!22656 _values!688) i!612 (ValueCellFull!7301 v!557)) (size!23097 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840716 () Bool)

(declare-fun +!2035 (ListLongMap!9015 tuple2!10244) ListLongMap!9015)

(assert (=> b!840716 (= e!469232 (= call!37124 (+!2035 call!37123 (tuple2!10245 k0!854 v!557))))))

(declare-fun b!840717 () Bool)

(declare-fun res!571314 () Bool)

(assert (=> b!840717 (=> (not res!571314) (not e!469233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840717 (= res!571314 (validMask!0 mask!1196))))

(declare-fun b!840718 () Bool)

(assert (=> b!840718 (= e!469232 (= call!37124 call!37123))))

(declare-fun b!840719 () Bool)

(assert (=> b!840719 (= e!469230 tp_is_empty!15481)))

(assert (= (and start!72598 res!571318) b!840717))

(assert (= (and b!840717 res!571314) b!840711))

(assert (= (and b!840711 res!571319) b!840715))

(assert (= (and b!840715 res!571320) b!840712))

(assert (= (and b!840712 res!571321) b!840713))

(assert (= (and b!840713 res!571316) b!840707))

(assert (= (and b!840707 res!571315) b!840714))

(assert (= (and b!840714 res!571317) b!840708))

(assert (= (and b!840708 c!91564) b!840716))

(assert (= (and b!840708 (not c!91564)) b!840718))

(assert (= (or b!840716 b!840718) bm!37121))

(assert (= (or b!840716 b!840718) bm!37120))

(assert (= (and b!840709 condMapEmpty!24821) mapIsEmpty!24821))

(assert (= (and b!840709 (not condMapEmpty!24821)) mapNonEmpty!24821))

(get-info :version)

(assert (= (and mapNonEmpty!24821 ((_ is ValueCellFull!7301) mapValue!24821)) b!840710))

(assert (= (and b!840709 ((_ is ValueCellFull!7301) mapDefault!24821)) b!840719))

(assert (= start!72598 b!840709))

(declare-fun m!785081 () Bool)

(assert (=> start!72598 m!785081))

(declare-fun m!785083 () Bool)

(assert (=> start!72598 m!785083))

(declare-fun m!785085 () Bool)

(assert (=> b!840707 m!785085))

(declare-fun m!785087 () Bool)

(assert (=> b!840715 m!785087))

(declare-fun m!785089 () Bool)

(assert (=> b!840708 m!785089))

(declare-fun m!785091 () Bool)

(assert (=> b!840714 m!785091))

(declare-fun m!785093 () Bool)

(assert (=> bm!37120 m!785093))

(declare-fun m!785095 () Bool)

(assert (=> b!840717 m!785095))

(declare-fun m!785097 () Bool)

(assert (=> b!840716 m!785097))

(declare-fun m!785099 () Bool)

(assert (=> mapNonEmpty!24821 m!785099))

(declare-fun m!785101 () Bool)

(assert (=> bm!37121 m!785101))

(declare-fun m!785103 () Bool)

(assert (=> bm!37121 m!785103))

(declare-fun m!785105 () Bool)

(assert (=> b!840712 m!785105))

(check-sat (not start!72598) (not b!840707) (not b_next!13615) (not b!840717) (not mapNonEmpty!24821) (not b!840708) (not bm!37121) tp_is_empty!15481 (not b!840716) (not b!840712) (not bm!37120) b_and!22711 (not b!840715))
(check-sat b_and!22711 (not b_next!13615))
