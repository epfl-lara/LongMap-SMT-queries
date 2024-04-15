; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72538 () Bool)

(assert start!72538)

(declare-fun b_free!13741 () Bool)

(declare-fun b_next!13741 () Bool)

(assert (=> start!72538 (= b_free!13741 (not b_next!13741))))

(declare-fun tp!48323 () Bool)

(declare-fun b_and!22801 () Bool)

(assert (=> start!72538 (= tp!48323 b_and!22801)))

(declare-fun b!842022 () Bool)

(declare-fun e!469636 () Bool)

(declare-fun e!469637 () Bool)

(declare-fun mapRes!25010 () Bool)

(assert (=> b!842022 (= e!469636 (and e!469637 mapRes!25010))))

(declare-fun condMapEmpty!25010 () Bool)

(declare-datatypes ((V!25857 0))(
  ( (V!25858 (val!7851 Int)) )
))
(declare-datatypes ((ValueCell!7364 0))(
  ( (ValueCellFull!7364 (v!10270 V!25857)) (EmptyCell!7364) )
))
(declare-datatypes ((array!47467 0))(
  ( (array!47468 (arr!22765 (Array (_ BitVec 32) ValueCell!7364)) (size!23207 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47467)

(declare-fun mapDefault!25010 () ValueCell!7364)

(assert (=> b!842022 (= condMapEmpty!25010 (= (arr!22765 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7364)) mapDefault!25010)))))

(declare-fun b!842023 () Bool)

(declare-fun res!572372 () Bool)

(declare-fun e!469635 () Bool)

(assert (=> b!842023 (=> (not res!572372) (not e!469635))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47469 0))(
  ( (array!47470 (arr!22766 (Array (_ BitVec 32) (_ BitVec 64))) (size!23208 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47469)

(assert (=> b!842023 (= res!572372 (and (= (size!23207 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23208 _keys!868) (size!23207 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun v!557 () V!25857)

(declare-datatypes ((tuple2!10448 0))(
  ( (tuple2!10449 (_1!5235 (_ BitVec 64)) (_2!5235 V!25857)) )
))
(declare-datatypes ((List!16216 0))(
  ( (Nil!16213) (Cons!16212 (h!17343 tuple2!10448) (t!22578 List!16216)) )
))
(declare-datatypes ((ListLongMap!9207 0))(
  ( (ListLongMap!9208 (toList!4619 List!16216)) )
))
(declare-fun call!37430 () ListLongMap!9207)

(declare-fun e!469634 () Bool)

(declare-fun call!37431 () ListLongMap!9207)

(declare-fun b!842024 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2098 (ListLongMap!9207 tuple2!10448) ListLongMap!9207)

(assert (=> b!842024 (= e!469634 (= call!37431 (+!2098 call!37430 (tuple2!10449 k0!854 v!557))))))

(declare-fun b!842025 () Bool)

(declare-fun res!572375 () Bool)

(assert (=> b!842025 (=> (not res!572375) (not e!469635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47469 (_ BitVec 32)) Bool)

(assert (=> b!842025 (= res!572375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25010 () Bool)

(assert (=> mapIsEmpty!25010 mapRes!25010))

(declare-fun b!842026 () Bool)

(declare-fun res!572373 () Bool)

(assert (=> b!842026 (=> (not res!572373) (not e!469635))))

(declare-datatypes ((List!16217 0))(
  ( (Nil!16214) (Cons!16213 (h!17344 (_ BitVec 64)) (t!22579 List!16217)) )
))
(declare-fun arrayNoDuplicates!0 (array!47469 (_ BitVec 32) List!16217) Bool)

(assert (=> b!842026 (= res!572373 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16214))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37427 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25857)

(declare-fun zeroValue!654 () V!25857)

(declare-fun getCurrentListMapNoExtraKeys!2633 (array!47469 array!47467 (_ BitVec 32) (_ BitVec 32) V!25857 V!25857 (_ BitVec 32) Int) ListLongMap!9207)

(assert (=> bm!37427 (= call!37430 (getCurrentListMapNoExtraKeys!2633 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842027 () Bool)

(declare-fun res!572374 () Bool)

(assert (=> b!842027 (=> (not res!572374) (not e!469635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842027 (= res!572374 (validMask!0 mask!1196))))

(declare-fun b!842028 () Bool)

(declare-fun e!469633 () Bool)

(declare-fun tp_is_empty!15607 () Bool)

(assert (=> b!842028 (= e!469633 tp_is_empty!15607)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun bm!37428 () Bool)

(assert (=> bm!37428 (= call!37431 (getCurrentListMapNoExtraKeys!2633 _keys!868 (array!47468 (store (arr!22765 _values!688) i!612 (ValueCellFull!7364 v!557)) (size!23207 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842029 () Bool)

(assert (=> b!842029 (= e!469634 (= call!37431 call!37430))))

(declare-fun res!572376 () Bool)

(assert (=> start!72538 (=> (not res!572376) (not e!469635))))

(assert (=> start!72538 (= res!572376 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23208 _keys!868))))))

(assert (=> start!72538 e!469635))

(assert (=> start!72538 tp_is_empty!15607))

(assert (=> start!72538 true))

(assert (=> start!72538 tp!48323))

(declare-fun array_inv!18190 (array!47469) Bool)

(assert (=> start!72538 (array_inv!18190 _keys!868)))

(declare-fun array_inv!18191 (array!47467) Bool)

(assert (=> start!72538 (and (array_inv!18191 _values!688) e!469636)))

(declare-fun b!842030 () Bool)

(declare-fun res!572379 () Bool)

(assert (=> b!842030 (=> (not res!572379) (not e!469635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842030 (= res!572379 (validKeyInArray!0 k0!854))))

(declare-fun b!842031 () Bool)

(assert (=> b!842031 (= e!469635 (not true))))

(assert (=> b!842031 e!469634))

(declare-fun c!91406 () Bool)

(assert (=> b!842031 (= c!91406 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28879 0))(
  ( (Unit!28880) )
))
(declare-fun lt!380741 () Unit!28879)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!314 (array!47469 array!47467 (_ BitVec 32) (_ BitVec 32) V!25857 V!25857 (_ BitVec 32) (_ BitVec 64) V!25857 (_ BitVec 32) Int) Unit!28879)

(assert (=> b!842031 (= lt!380741 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!314 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25010 () Bool)

(declare-fun tp!48322 () Bool)

(assert (=> mapNonEmpty!25010 (= mapRes!25010 (and tp!48322 e!469633))))

(declare-fun mapKey!25010 () (_ BitVec 32))

(declare-fun mapValue!25010 () ValueCell!7364)

(declare-fun mapRest!25010 () (Array (_ BitVec 32) ValueCell!7364))

(assert (=> mapNonEmpty!25010 (= (arr!22765 _values!688) (store mapRest!25010 mapKey!25010 mapValue!25010))))

(declare-fun b!842032 () Bool)

(assert (=> b!842032 (= e!469637 tp_is_empty!15607)))

(declare-fun b!842033 () Bool)

(declare-fun res!572377 () Bool)

(assert (=> b!842033 (=> (not res!572377) (not e!469635))))

(assert (=> b!842033 (= res!572377 (and (= (select (arr!22766 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23208 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842034 () Bool)

(declare-fun res!572378 () Bool)

(assert (=> b!842034 (=> (not res!572378) (not e!469635))))

(assert (=> b!842034 (= res!572378 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23208 _keys!868))))))

(assert (= (and start!72538 res!572376) b!842027))

(assert (= (and b!842027 res!572374) b!842023))

(assert (= (and b!842023 res!572372) b!842025))

(assert (= (and b!842025 res!572375) b!842026))

(assert (= (and b!842026 res!572373) b!842034))

(assert (= (and b!842034 res!572378) b!842030))

(assert (= (and b!842030 res!572379) b!842033))

(assert (= (and b!842033 res!572377) b!842031))

(assert (= (and b!842031 c!91406) b!842024))

(assert (= (and b!842031 (not c!91406)) b!842029))

(assert (= (or b!842024 b!842029) bm!37428))

(assert (= (or b!842024 b!842029) bm!37427))

(assert (= (and b!842022 condMapEmpty!25010) mapIsEmpty!25010))

(assert (= (and b!842022 (not condMapEmpty!25010)) mapNonEmpty!25010))

(get-info :version)

(assert (= (and mapNonEmpty!25010 ((_ is ValueCellFull!7364) mapValue!25010)) b!842028))

(assert (= (and b!842022 ((_ is ValueCellFull!7364) mapDefault!25010)) b!842032))

(assert (= start!72538 b!842022))

(declare-fun m!784673 () Bool)

(assert (=> b!842026 m!784673))

(declare-fun m!784675 () Bool)

(assert (=> b!842030 m!784675))

(declare-fun m!784677 () Bool)

(assert (=> start!72538 m!784677))

(declare-fun m!784679 () Bool)

(assert (=> start!72538 m!784679))

(declare-fun m!784681 () Bool)

(assert (=> b!842027 m!784681))

(declare-fun m!784683 () Bool)

(assert (=> bm!37427 m!784683))

(declare-fun m!784685 () Bool)

(assert (=> bm!37428 m!784685))

(declare-fun m!784687 () Bool)

(assert (=> bm!37428 m!784687))

(declare-fun m!784689 () Bool)

(assert (=> b!842025 m!784689))

(declare-fun m!784691 () Bool)

(assert (=> b!842024 m!784691))

(declare-fun m!784693 () Bool)

(assert (=> mapNonEmpty!25010 m!784693))

(declare-fun m!784695 () Bool)

(assert (=> b!842033 m!784695))

(declare-fun m!784697 () Bool)

(assert (=> b!842031 m!784697))

(check-sat (not b_next!13741) (not bm!37428) (not start!72538) (not b!842027) (not b!842031) b_and!22801 (not bm!37427) (not mapNonEmpty!25010) (not b!842025) (not b!842024) tp_is_empty!15607 (not b!842030) (not b!842026))
(check-sat b_and!22801 (not b_next!13741))
