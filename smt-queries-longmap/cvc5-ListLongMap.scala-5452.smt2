; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72496 () Bool)

(assert start!72496)

(declare-fun b_free!13681 () Bool)

(declare-fun b_next!13681 () Bool)

(assert (=> start!72496 (= b_free!13681 (not b_next!13681))))

(declare-fun tp!48142 () Bool)

(declare-fun b_and!22767 () Bool)

(assert (=> start!72496 (= tp!48142 b_and!22767)))

(declare-fun b!841091 () Bool)

(declare-fun res!571766 () Bool)

(declare-fun e!469243 () Bool)

(assert (=> b!841091 (=> (not res!571766) (not e!469243))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841091 (= res!571766 (validMask!0 mask!1196))))

(declare-fun b!841092 () Bool)

(assert (=> b!841092 (= e!469243 (not true))))

(declare-fun e!469242 () Bool)

(assert (=> b!841092 e!469242))

(declare-fun c!91381 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841092 (= c!91381 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28889 0))(
  ( (Unit!28890) )
))
(declare-fun lt!380887 () Unit!28889)

(declare-datatypes ((V!25777 0))(
  ( (V!25778 (val!7821 Int)) )
))
(declare-fun v!557 () V!25777)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47372 0))(
  ( (array!47373 (arr!22717 (Array (_ BitVec 32) (_ BitVec 64))) (size!23157 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47372)

(declare-datatypes ((ValueCell!7334 0))(
  ( (ValueCellFull!7334 (v!10246 V!25777)) (EmptyCell!7334) )
))
(declare-datatypes ((array!47374 0))(
  ( (array!47375 (arr!22718 (Array (_ BitVec 32) ValueCell!7334)) (size!23158 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47374)

(declare-fun minValue!654 () V!25777)

(declare-fun zeroValue!654 () V!25777)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!290 (array!47372 array!47374 (_ BitVec 32) (_ BitVec 32) V!25777 V!25777 (_ BitVec 32) (_ BitVec 64) V!25777 (_ BitVec 32) Int) Unit!28889)

(assert (=> b!841092 (= lt!380887 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!290 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841093 () Bool)

(declare-fun e!469244 () Bool)

(declare-fun tp_is_empty!15547 () Bool)

(assert (=> b!841093 (= e!469244 tp_is_empty!15547)))

(declare-fun b!841094 () Bool)

(declare-fun res!571768 () Bool)

(assert (=> b!841094 (=> (not res!571768) (not e!469243))))

(assert (=> b!841094 (= res!571768 (and (= (size!23158 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23157 _keys!868) (size!23158 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!10374 0))(
  ( (tuple2!10375 (_1!5198 (_ BitVec 64)) (_2!5198 V!25777)) )
))
(declare-datatypes ((List!16159 0))(
  ( (Nil!16156) (Cons!16155 (h!17286 tuple2!10374) (t!22530 List!16159)) )
))
(declare-datatypes ((ListLongMap!9143 0))(
  ( (ListLongMap!9144 (toList!4587 List!16159)) )
))
(declare-fun call!37277 () ListLongMap!9143)

(declare-fun bm!37273 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2574 (array!47372 array!47374 (_ BitVec 32) (_ BitVec 32) V!25777 V!25777 (_ BitVec 32) Int) ListLongMap!9143)

(assert (=> bm!37273 (= call!37277 (getCurrentListMapNoExtraKeys!2574 _keys!868 (array!47375 (store (arr!22718 _values!688) i!612 (ValueCellFull!7334 v!557)) (size!23158 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841095 () Bool)

(declare-fun e!469245 () Bool)

(assert (=> b!841095 (= e!469245 tp_is_empty!15547)))

(declare-fun bm!37274 () Bool)

(declare-fun call!37276 () ListLongMap!9143)

(assert (=> bm!37274 (= call!37276 (getCurrentListMapNoExtraKeys!2574 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841096 () Bool)

(declare-fun e!469246 () Bool)

(declare-fun mapRes!24920 () Bool)

(assert (=> b!841096 (= e!469246 (and e!469245 mapRes!24920))))

(declare-fun condMapEmpty!24920 () Bool)

(declare-fun mapDefault!24920 () ValueCell!7334)

