; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72394 () Bool)

(assert start!72394)

(declare-fun b_free!13597 () Bool)

(declare-fun b_next!13597 () Bool)

(assert (=> start!72394 (= b_free!13597 (not b_next!13597))))

(declare-fun tp!47891 () Bool)

(declare-fun b_and!22657 () Bool)

(assert (=> start!72394 (= tp!47891 b_and!22657)))

(declare-fun b!839214 () Bool)

(declare-fun e!468338 () Bool)

(assert (=> b!839214 (= e!468338 (not true))))

(declare-fun e!468339 () Bool)

(assert (=> b!839214 e!468339))

(declare-fun c!91190 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839214 (= c!91190 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25665 0))(
  ( (V!25666 (val!7779 Int)) )
))
(declare-fun v!557 () V!25665)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47187 0))(
  ( (array!47188 (arr!22625 (Array (_ BitVec 32) (_ BitVec 64))) (size!23067 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47187)

(declare-datatypes ((ValueCell!7292 0))(
  ( (ValueCellFull!7292 (v!10198 V!25665)) (EmptyCell!7292) )
))
(declare-datatypes ((array!47189 0))(
  ( (array!47190 (arr!22626 (Array (_ BitVec 32) ValueCell!7292)) (size!23068 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47189)

(declare-fun minValue!654 () V!25665)

(declare-fun zeroValue!654 () V!25665)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28775 0))(
  ( (Unit!28776) )
))
(declare-fun lt!380525 () Unit!28775)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!262 (array!47187 array!47189 (_ BitVec 32) (_ BitVec 32) V!25665 V!25665 (_ BitVec 32) (_ BitVec 64) V!25665 (_ BitVec 32) Int) Unit!28775)

(assert (=> b!839214 (= lt!380525 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570651 () Bool)

(assert (=> start!72394 (=> (not res!570651) (not e!468338))))

(assert (=> start!72394 (= res!570651 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23067 _keys!868))))))

(assert (=> start!72394 e!468338))

(declare-fun tp_is_empty!15463 () Bool)

(assert (=> start!72394 tp_is_empty!15463))

(assert (=> start!72394 true))

(assert (=> start!72394 tp!47891))

(declare-fun array_inv!18092 (array!47187) Bool)

(assert (=> start!72394 (array_inv!18092 _keys!868)))

(declare-fun e!468342 () Bool)

(declare-fun array_inv!18093 (array!47189) Bool)

(assert (=> start!72394 (and (array_inv!18093 _values!688) e!468342)))

(declare-fun b!839215 () Bool)

(declare-fun e!468337 () Bool)

(assert (=> b!839215 (= e!468337 tp_is_empty!15463)))

(declare-fun b!839216 () Bool)

(declare-fun mapRes!24794 () Bool)

(assert (=> b!839216 (= e!468342 (and e!468337 mapRes!24794))))

(declare-fun condMapEmpty!24794 () Bool)

(declare-fun mapDefault!24794 () ValueCell!7292)

(assert (=> b!839216 (= condMapEmpty!24794 (= (arr!22626 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7292)) mapDefault!24794)))))

(declare-fun b!839217 () Bool)

(declare-fun res!570647 () Bool)

(assert (=> b!839217 (=> (not res!570647) (not e!468338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839217 (= res!570647 (validKeyInArray!0 k0!854))))

(declare-fun bm!36995 () Bool)

(declare-datatypes ((tuple2!10314 0))(
  ( (tuple2!10315 (_1!5168 (_ BitVec 64)) (_2!5168 V!25665)) )
))
(declare-datatypes ((List!16100 0))(
  ( (Nil!16097) (Cons!16096 (h!17227 tuple2!10314) (t!22462 List!16100)) )
))
(declare-datatypes ((ListLongMap!9073 0))(
  ( (ListLongMap!9074 (toList!4552 List!16100)) )
))
(declare-fun call!36998 () ListLongMap!9073)

(declare-fun getCurrentListMapNoExtraKeys!2572 (array!47187 array!47189 (_ BitVec 32) (_ BitVec 32) V!25665 V!25665 (_ BitVec 32) Int) ListLongMap!9073)

(assert (=> bm!36995 (= call!36998 (getCurrentListMapNoExtraKeys!2572 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24794 () Bool)

(declare-fun tp!47890 () Bool)

(declare-fun e!468340 () Bool)

(assert (=> mapNonEmpty!24794 (= mapRes!24794 (and tp!47890 e!468340))))

(declare-fun mapValue!24794 () ValueCell!7292)

(declare-fun mapRest!24794 () (Array (_ BitVec 32) ValueCell!7292))

(declare-fun mapKey!24794 () (_ BitVec 32))

(assert (=> mapNonEmpty!24794 (= (arr!22626 _values!688) (store mapRest!24794 mapKey!24794 mapValue!24794))))

(declare-fun b!839218 () Bool)

(declare-fun call!36999 () ListLongMap!9073)

(assert (=> b!839218 (= e!468339 (= call!36999 call!36998))))

(declare-fun mapIsEmpty!24794 () Bool)

(assert (=> mapIsEmpty!24794 mapRes!24794))

(declare-fun b!839219 () Bool)

(declare-fun res!570646 () Bool)

(assert (=> b!839219 (=> (not res!570646) (not e!468338))))

(declare-datatypes ((List!16101 0))(
  ( (Nil!16098) (Cons!16097 (h!17228 (_ BitVec 64)) (t!22463 List!16101)) )
))
(declare-fun arrayNoDuplicates!0 (array!47187 (_ BitVec 32) List!16101) Bool)

(assert (=> b!839219 (= res!570646 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16098))))

(declare-fun b!839220 () Bool)

(declare-fun res!570645 () Bool)

(assert (=> b!839220 (=> (not res!570645) (not e!468338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47187 (_ BitVec 32)) Bool)

(assert (=> b!839220 (= res!570645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839221 () Bool)

(declare-fun res!570649 () Bool)

(assert (=> b!839221 (=> (not res!570649) (not e!468338))))

(assert (=> b!839221 (= res!570649 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23067 _keys!868))))))

(declare-fun bm!36996 () Bool)

(assert (=> bm!36996 (= call!36999 (getCurrentListMapNoExtraKeys!2572 _keys!868 (array!47190 (store (arr!22626 _values!688) i!612 (ValueCellFull!7292 v!557)) (size!23068 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839222 () Bool)

(declare-fun res!570648 () Bool)

(assert (=> b!839222 (=> (not res!570648) (not e!468338))))

(assert (=> b!839222 (= res!570648 (and (= (select (arr!22625 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23067 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839223 () Bool)

(declare-fun res!570650 () Bool)

(assert (=> b!839223 (=> (not res!570650) (not e!468338))))

(assert (=> b!839223 (= res!570650 (and (= (size!23068 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23067 _keys!868) (size!23068 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839224 () Bool)

(declare-fun +!2046 (ListLongMap!9073 tuple2!10314) ListLongMap!9073)

(assert (=> b!839224 (= e!468339 (= call!36999 (+!2046 call!36998 (tuple2!10315 k0!854 v!557))))))

(declare-fun b!839225 () Bool)

(declare-fun res!570644 () Bool)

(assert (=> b!839225 (=> (not res!570644) (not e!468338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839225 (= res!570644 (validMask!0 mask!1196))))

(declare-fun b!839226 () Bool)

(assert (=> b!839226 (= e!468340 tp_is_empty!15463)))

(assert (= (and start!72394 res!570651) b!839225))

(assert (= (and b!839225 res!570644) b!839223))

(assert (= (and b!839223 res!570650) b!839220))

(assert (= (and b!839220 res!570645) b!839219))

(assert (= (and b!839219 res!570646) b!839221))

(assert (= (and b!839221 res!570649) b!839217))

(assert (= (and b!839217 res!570647) b!839222))

(assert (= (and b!839222 res!570648) b!839214))

(assert (= (and b!839214 c!91190) b!839224))

(assert (= (and b!839214 (not c!91190)) b!839218))

(assert (= (or b!839224 b!839218) bm!36996))

(assert (= (or b!839224 b!839218) bm!36995))

(assert (= (and b!839216 condMapEmpty!24794) mapIsEmpty!24794))

(assert (= (and b!839216 (not condMapEmpty!24794)) mapNonEmpty!24794))

(get-info :version)

(assert (= (and mapNonEmpty!24794 ((_ is ValueCellFull!7292) mapValue!24794)) b!839226))

(assert (= (and b!839216 ((_ is ValueCellFull!7292) mapDefault!24794)) b!839215))

(assert (= start!72394 b!839216))

(declare-fun m!782801 () Bool)

(assert (=> b!839220 m!782801))

(declare-fun m!782803 () Bool)

(assert (=> b!839224 m!782803))

(declare-fun m!782805 () Bool)

(assert (=> b!839217 m!782805))

(declare-fun m!782807 () Bool)

(assert (=> bm!36995 m!782807))

(declare-fun m!782809 () Bool)

(assert (=> b!839219 m!782809))

(declare-fun m!782811 () Bool)

(assert (=> b!839222 m!782811))

(declare-fun m!782813 () Bool)

(assert (=> start!72394 m!782813))

(declare-fun m!782815 () Bool)

(assert (=> start!72394 m!782815))

(declare-fun m!782817 () Bool)

(assert (=> b!839225 m!782817))

(declare-fun m!782819 () Bool)

(assert (=> mapNonEmpty!24794 m!782819))

(declare-fun m!782821 () Bool)

(assert (=> bm!36996 m!782821))

(declare-fun m!782823 () Bool)

(assert (=> bm!36996 m!782823))

(declare-fun m!782825 () Bool)

(assert (=> b!839214 m!782825))

(check-sat (not b!839224) tp_is_empty!15463 b_and!22657 (not b!839219) (not b!839220) (not bm!36995) (not start!72394) (not bm!36996) (not b!839217) (not b!839214) (not b_next!13597) (not b!839225) (not mapNonEmpty!24794))
(check-sat b_and!22657 (not b_next!13597))
