; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72472 () Bool)

(assert start!72472)

(declare-fun b_free!13675 () Bool)

(declare-fun b_next!13675 () Bool)

(assert (=> start!72472 (= b_free!13675 (not b_next!13675))))

(declare-fun tp!48125 () Bool)

(declare-fun b_and!22735 () Bool)

(assert (=> start!72472 (= tp!48125 b_and!22735)))

(declare-fun mapNonEmpty!24911 () Bool)

(declare-fun mapRes!24911 () Bool)

(declare-fun tp!48124 () Bool)

(declare-fun e!469043 () Bool)

(assert (=> mapNonEmpty!24911 (= mapRes!24911 (and tp!48124 e!469043))))

(declare-datatypes ((V!25769 0))(
  ( (V!25770 (val!7818 Int)) )
))
(declare-datatypes ((ValueCell!7331 0))(
  ( (ValueCellFull!7331 (v!10237 V!25769)) (EmptyCell!7331) )
))
(declare-fun mapRest!24911 () (Array (_ BitVec 32) ValueCell!7331))

(declare-fun mapKey!24911 () (_ BitVec 32))

(declare-datatypes ((array!47337 0))(
  ( (array!47338 (arr!22700 (Array (_ BitVec 32) ValueCell!7331)) (size!23142 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47337)

(declare-fun mapValue!24911 () ValueCell!7331)

(assert (=> mapNonEmpty!24911 (= (arr!22700 _values!688) (store mapRest!24911 mapKey!24911 mapValue!24911))))

(declare-fun b!840735 () Bool)

(declare-fun e!469044 () Bool)

(declare-fun tp_is_empty!15541 () Bool)

(assert (=> b!840735 (= e!469044 tp_is_empty!15541)))

(declare-fun bm!37229 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47339 0))(
  ( (array!47340 (arr!22701 (Array (_ BitVec 32) (_ BitVec 64))) (size!23143 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47339)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25769)

(declare-fun zeroValue!654 () V!25769)

(declare-datatypes ((tuple2!10384 0))(
  ( (tuple2!10385 (_1!5203 (_ BitVec 64)) (_2!5203 V!25769)) )
))
(declare-datatypes ((List!16160 0))(
  ( (Nil!16157) (Cons!16156 (h!17287 tuple2!10384) (t!22522 List!16160)) )
))
(declare-datatypes ((ListLongMap!9143 0))(
  ( (ListLongMap!9144 (toList!4587 List!16160)) )
))
(declare-fun call!37232 () ListLongMap!9143)

(declare-fun v!557 () V!25769)

(declare-fun getCurrentListMapNoExtraKeys!2604 (array!47339 array!47337 (_ BitVec 32) (_ BitVec 32) V!25769 V!25769 (_ BitVec 32) Int) ListLongMap!9143)

(assert (=> bm!37229 (= call!37232 (getCurrentListMapNoExtraKeys!2604 _keys!868 (array!47338 (store (arr!22700 _values!688) i!612 (ValueCellFull!7331 v!557)) (size!23142 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571582 () Bool)

(declare-fun e!469039 () Bool)

(assert (=> start!72472 (=> (not res!571582) (not e!469039))))

(assert (=> start!72472 (= res!571582 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23143 _keys!868))))))

(assert (=> start!72472 e!469039))

(assert (=> start!72472 tp_is_empty!15541))

(assert (=> start!72472 true))

(assert (=> start!72472 tp!48125))

(declare-fun array_inv!18144 (array!47339) Bool)

(assert (=> start!72472 (array_inv!18144 _keys!868)))

(declare-fun e!469042 () Bool)

(declare-fun array_inv!18145 (array!47337) Bool)

(assert (=> start!72472 (and (array_inv!18145 _values!688) e!469042)))

(declare-fun b!840736 () Bool)

(declare-fun res!571586 () Bool)

(assert (=> b!840736 (=> (not res!571586) (not e!469039))))

(assert (=> b!840736 (= res!571586 (and (= (size!23142 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23143 _keys!868) (size!23142 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840737 () Bool)

(declare-fun res!571585 () Bool)

(assert (=> b!840737 (=> (not res!571585) (not e!469039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840737 (= res!571585 (validMask!0 mask!1196))))

(declare-fun e!469040 () Bool)

(declare-fun b!840738 () Bool)

(declare-fun call!37233 () ListLongMap!9143)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2073 (ListLongMap!9143 tuple2!10384) ListLongMap!9143)

(assert (=> b!840738 (= e!469040 (= call!37232 (+!2073 call!37233 (tuple2!10385 k0!854 v!557))))))

(declare-fun b!840739 () Bool)

(assert (=> b!840739 (= e!469040 (= call!37232 call!37233))))

(declare-fun b!840740 () Bool)

(declare-fun res!571587 () Bool)

(assert (=> b!840740 (=> (not res!571587) (not e!469039))))

(assert (=> b!840740 (= res!571587 (and (= (select (arr!22701 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23143 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!37230 () Bool)

(assert (=> bm!37230 (= call!37233 (getCurrentListMapNoExtraKeys!2604 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840741 () Bool)

(assert (=> b!840741 (= e!469039 (not true))))

(assert (=> b!840741 e!469040))

(declare-fun c!91307 () Bool)

(assert (=> b!840741 (= c!91307 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28833 0))(
  ( (Unit!28834) )
))
(declare-fun lt!380642 () Unit!28833)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!291 (array!47339 array!47337 (_ BitVec 32) (_ BitVec 32) V!25769 V!25769 (_ BitVec 32) (_ BitVec 64) V!25769 (_ BitVec 32) Int) Unit!28833)

(assert (=> b!840741 (= lt!380642 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!291 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840742 () Bool)

(declare-fun res!571581 () Bool)

(assert (=> b!840742 (=> (not res!571581) (not e!469039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47339 (_ BitVec 32)) Bool)

(assert (=> b!840742 (= res!571581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840743 () Bool)

(assert (=> b!840743 (= e!469043 tp_is_empty!15541)))

(declare-fun b!840744 () Bool)

(assert (=> b!840744 (= e!469042 (and e!469044 mapRes!24911))))

(declare-fun condMapEmpty!24911 () Bool)

(declare-fun mapDefault!24911 () ValueCell!7331)

(assert (=> b!840744 (= condMapEmpty!24911 (= (arr!22700 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7331)) mapDefault!24911)))))

(declare-fun b!840745 () Bool)

(declare-fun res!571580 () Bool)

(assert (=> b!840745 (=> (not res!571580) (not e!469039))))

(assert (=> b!840745 (= res!571580 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23143 _keys!868))))))

(declare-fun b!840746 () Bool)

(declare-fun res!571584 () Bool)

(assert (=> b!840746 (=> (not res!571584) (not e!469039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840746 (= res!571584 (validKeyInArray!0 k0!854))))

(declare-fun b!840747 () Bool)

(declare-fun res!571583 () Bool)

(assert (=> b!840747 (=> (not res!571583) (not e!469039))))

(declare-datatypes ((List!16161 0))(
  ( (Nil!16158) (Cons!16157 (h!17288 (_ BitVec 64)) (t!22523 List!16161)) )
))
(declare-fun arrayNoDuplicates!0 (array!47339 (_ BitVec 32) List!16161) Bool)

(assert (=> b!840747 (= res!571583 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16158))))

(declare-fun mapIsEmpty!24911 () Bool)

(assert (=> mapIsEmpty!24911 mapRes!24911))

(assert (= (and start!72472 res!571582) b!840737))

(assert (= (and b!840737 res!571585) b!840736))

(assert (= (and b!840736 res!571586) b!840742))

(assert (= (and b!840742 res!571581) b!840747))

(assert (= (and b!840747 res!571583) b!840745))

(assert (= (and b!840745 res!571580) b!840746))

(assert (= (and b!840746 res!571584) b!840740))

(assert (= (and b!840740 res!571587) b!840741))

(assert (= (and b!840741 c!91307) b!840738))

(assert (= (and b!840741 (not c!91307)) b!840739))

(assert (= (or b!840738 b!840739) bm!37229))

(assert (= (or b!840738 b!840739) bm!37230))

(assert (= (and b!840744 condMapEmpty!24911) mapIsEmpty!24911))

(assert (= (and b!840744 (not condMapEmpty!24911)) mapNonEmpty!24911))

(get-info :version)

(assert (= (and mapNonEmpty!24911 ((_ is ValueCellFull!7331) mapValue!24911)) b!840743))

(assert (= (and b!840744 ((_ is ValueCellFull!7331) mapDefault!24911)) b!840735))

(assert (= start!72472 b!840744))

(declare-fun m!783815 () Bool)

(assert (=> bm!37229 m!783815))

(declare-fun m!783817 () Bool)

(assert (=> bm!37229 m!783817))

(declare-fun m!783819 () Bool)

(assert (=> bm!37230 m!783819))

(declare-fun m!783821 () Bool)

(assert (=> b!840747 m!783821))

(declare-fun m!783823 () Bool)

(assert (=> mapNonEmpty!24911 m!783823))

(declare-fun m!783825 () Bool)

(assert (=> b!840737 m!783825))

(declare-fun m!783827 () Bool)

(assert (=> start!72472 m!783827))

(declare-fun m!783829 () Bool)

(assert (=> start!72472 m!783829))

(declare-fun m!783831 () Bool)

(assert (=> b!840740 m!783831))

(declare-fun m!783833 () Bool)

(assert (=> b!840741 m!783833))

(declare-fun m!783835 () Bool)

(assert (=> b!840742 m!783835))

(declare-fun m!783837 () Bool)

(assert (=> b!840738 m!783837))

(declare-fun m!783839 () Bool)

(assert (=> b!840746 m!783839))

(check-sat tp_is_empty!15541 (not b!840746) (not b!840741) (not b!840742) (not b!840737) (not bm!37230) (not b_next!13675) (not start!72472) (not b!840738) (not mapNonEmpty!24911) (not b!840747) b_and!22735 (not bm!37229))
(check-sat b_and!22735 (not b_next!13675))
