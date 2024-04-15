; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72418 () Bool)

(assert start!72418)

(declare-fun b_free!13621 () Bool)

(declare-fun b_next!13621 () Bool)

(assert (=> start!72418 (= b_free!13621 (not b_next!13621))))

(declare-fun tp!47963 () Bool)

(declare-fun b_and!22681 () Bool)

(assert (=> start!72418 (= tp!47963 b_and!22681)))

(declare-fun b!839682 () Bool)

(declare-fun res!570938 () Bool)

(declare-fun e!468557 () Bool)

(assert (=> b!839682 (=> (not res!570938) (not e!468557))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47231 0))(
  ( (array!47232 (arr!22647 (Array (_ BitVec 32) (_ BitVec 64))) (size!23089 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47231)

(assert (=> b!839682 (= res!570938 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23089 _keys!868))))))

(declare-fun b!839683 () Bool)

(declare-fun res!570935 () Bool)

(assert (=> b!839683 (=> (not res!570935) (not e!468557))))

(declare-datatypes ((List!16118 0))(
  ( (Nil!16115) (Cons!16114 (h!17245 (_ BitVec 64)) (t!22480 List!16118)) )
))
(declare-fun arrayNoDuplicates!0 (array!47231 (_ BitVec 32) List!16118) Bool)

(assert (=> b!839683 (= res!570935 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16115))))

(declare-datatypes ((V!25697 0))(
  ( (V!25698 (val!7791 Int)) )
))
(declare-fun v!557 () V!25697)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37067 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7304 0))(
  ( (ValueCellFull!7304 (v!10210 V!25697)) (EmptyCell!7304) )
))
(declare-datatypes ((array!47233 0))(
  ( (array!47234 (arr!22648 (Array (_ BitVec 32) ValueCell!7304)) (size!23090 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47233)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!10334 0))(
  ( (tuple2!10335 (_1!5178 (_ BitVec 64)) (_2!5178 V!25697)) )
))
(declare-datatypes ((List!16119 0))(
  ( (Nil!16116) (Cons!16115 (h!17246 tuple2!10334) (t!22481 List!16119)) )
))
(declare-datatypes ((ListLongMap!9093 0))(
  ( (ListLongMap!9094 (toList!4562 List!16119)) )
))
(declare-fun call!37071 () ListLongMap!9093)

(declare-fun minValue!654 () V!25697)

(declare-fun zeroValue!654 () V!25697)

(declare-fun getCurrentListMapNoExtraKeys!2582 (array!47231 array!47233 (_ BitVec 32) (_ BitVec 32) V!25697 V!25697 (_ BitVec 32) Int) ListLongMap!9093)

(assert (=> bm!37067 (= call!37071 (getCurrentListMapNoExtraKeys!2582 _keys!868 (array!47234 (store (arr!22648 _values!688) i!612 (ValueCellFull!7304 v!557)) (size!23090 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37070 () ListLongMap!9093)

(declare-fun bm!37068 () Bool)

(assert (=> bm!37068 (= call!37070 (getCurrentListMapNoExtraKeys!2582 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24830 () Bool)

(declare-fun mapRes!24830 () Bool)

(declare-fun tp!47962 () Bool)

(declare-fun e!468553 () Bool)

(assert (=> mapNonEmpty!24830 (= mapRes!24830 (and tp!47962 e!468553))))

(declare-fun mapValue!24830 () ValueCell!7304)

(declare-fun mapKey!24830 () (_ BitVec 32))

(declare-fun mapRest!24830 () (Array (_ BitVec 32) ValueCell!7304))

(assert (=> mapNonEmpty!24830 (= (arr!22648 _values!688) (store mapRest!24830 mapKey!24830 mapValue!24830))))

(declare-fun b!839685 () Bool)

(declare-fun tp_is_empty!15487 () Bool)

(assert (=> b!839685 (= e!468553 tp_is_empty!15487)))

(declare-fun mapIsEmpty!24830 () Bool)

(assert (=> mapIsEmpty!24830 mapRes!24830))

(declare-fun b!839686 () Bool)

(declare-fun res!570934 () Bool)

(assert (=> b!839686 (=> (not res!570934) (not e!468557))))

(assert (=> b!839686 (= res!570934 (and (= (size!23090 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23089 _keys!868) (size!23090 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839687 () Bool)

(declare-fun e!468554 () Bool)

(declare-fun e!468556 () Bool)

(assert (=> b!839687 (= e!468554 (and e!468556 mapRes!24830))))

(declare-fun condMapEmpty!24830 () Bool)

(declare-fun mapDefault!24830 () ValueCell!7304)

(assert (=> b!839687 (= condMapEmpty!24830 (= (arr!22648 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7304)) mapDefault!24830)))))

(declare-fun b!839688 () Bool)

(assert (=> b!839688 (= e!468556 tp_is_empty!15487)))

(declare-fun b!839689 () Bool)

(declare-fun res!570936 () Bool)

(assert (=> b!839689 (=> (not res!570936) (not e!468557))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!839689 (= res!570936 (and (= (select (arr!22647 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23089 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun e!468555 () Bool)

(declare-fun b!839690 () Bool)

(declare-fun +!2054 (ListLongMap!9093 tuple2!10334) ListLongMap!9093)

(assert (=> b!839690 (= e!468555 (= call!37071 (+!2054 call!37070 (tuple2!10335 k0!854 v!557))))))

(declare-fun b!839691 () Bool)

(declare-fun res!570932 () Bool)

(assert (=> b!839691 (=> (not res!570932) (not e!468557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839691 (= res!570932 (validMask!0 mask!1196))))

(declare-fun b!839692 () Bool)

(declare-fun res!570937 () Bool)

(assert (=> b!839692 (=> (not res!570937) (not e!468557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47231 (_ BitVec 32)) Bool)

(assert (=> b!839692 (= res!570937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839684 () Bool)

(assert (=> b!839684 (= e!468557 (not true))))

(assert (=> b!839684 e!468555))

(declare-fun c!91226 () Bool)

(assert (=> b!839684 (= c!91226 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28789 0))(
  ( (Unit!28790) )
))
(declare-fun lt!380561 () Unit!28789)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!269 (array!47231 array!47233 (_ BitVec 32) (_ BitVec 32) V!25697 V!25697 (_ BitVec 32) (_ BitVec 64) V!25697 (_ BitVec 32) Int) Unit!28789)

(assert (=> b!839684 (= lt!380561 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570933 () Bool)

(assert (=> start!72418 (=> (not res!570933) (not e!468557))))

(assert (=> start!72418 (= res!570933 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23089 _keys!868))))))

(assert (=> start!72418 e!468557))

(assert (=> start!72418 tp_is_empty!15487))

(assert (=> start!72418 true))

(assert (=> start!72418 tp!47963))

(declare-fun array_inv!18106 (array!47231) Bool)

(assert (=> start!72418 (array_inv!18106 _keys!868)))

(declare-fun array_inv!18107 (array!47233) Bool)

(assert (=> start!72418 (and (array_inv!18107 _values!688) e!468554)))

(declare-fun b!839693 () Bool)

(assert (=> b!839693 (= e!468555 (= call!37071 call!37070))))

(declare-fun b!839694 () Bool)

(declare-fun res!570939 () Bool)

(assert (=> b!839694 (=> (not res!570939) (not e!468557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839694 (= res!570939 (validKeyInArray!0 k0!854))))

(assert (= (and start!72418 res!570933) b!839691))

(assert (= (and b!839691 res!570932) b!839686))

(assert (= (and b!839686 res!570934) b!839692))

(assert (= (and b!839692 res!570937) b!839683))

(assert (= (and b!839683 res!570935) b!839682))

(assert (= (and b!839682 res!570938) b!839694))

(assert (= (and b!839694 res!570939) b!839689))

(assert (= (and b!839689 res!570936) b!839684))

(assert (= (and b!839684 c!91226) b!839690))

(assert (= (and b!839684 (not c!91226)) b!839693))

(assert (= (or b!839690 b!839693) bm!37067))

(assert (= (or b!839690 b!839693) bm!37068))

(assert (= (and b!839687 condMapEmpty!24830) mapIsEmpty!24830))

(assert (= (and b!839687 (not condMapEmpty!24830)) mapNonEmpty!24830))

(get-info :version)

(assert (= (and mapNonEmpty!24830 ((_ is ValueCellFull!7304) mapValue!24830)) b!839685))

(assert (= (and b!839687 ((_ is ValueCellFull!7304) mapDefault!24830)) b!839688))

(assert (= start!72418 b!839687))

(declare-fun m!783113 () Bool)

(assert (=> b!839694 m!783113))

(declare-fun m!783115 () Bool)

(assert (=> b!839690 m!783115))

(declare-fun m!783117 () Bool)

(assert (=> b!839689 m!783117))

(declare-fun m!783119 () Bool)

(assert (=> b!839691 m!783119))

(declare-fun m!783121 () Bool)

(assert (=> start!72418 m!783121))

(declare-fun m!783123 () Bool)

(assert (=> start!72418 m!783123))

(declare-fun m!783125 () Bool)

(assert (=> b!839692 m!783125))

(declare-fun m!783127 () Bool)

(assert (=> mapNonEmpty!24830 m!783127))

(declare-fun m!783129 () Bool)

(assert (=> b!839683 m!783129))

(declare-fun m!783131 () Bool)

(assert (=> bm!37067 m!783131))

(declare-fun m!783133 () Bool)

(assert (=> bm!37067 m!783133))

(declare-fun m!783135 () Bool)

(assert (=> bm!37068 m!783135))

(declare-fun m!783137 () Bool)

(assert (=> b!839684 m!783137))

(check-sat (not b!839690) (not mapNonEmpty!24830) (not b!839692) (not bm!37068) (not bm!37067) (not b!839694) (not start!72418) b_and!22681 (not b_next!13621) (not b!839684) (not b!839683) tp_is_empty!15487 (not b!839691))
(check-sat b_and!22681 (not b_next!13621))
