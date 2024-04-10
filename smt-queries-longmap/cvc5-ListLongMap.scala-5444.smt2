; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72448 () Bool)

(assert start!72448)

(declare-fun b_free!13633 () Bool)

(declare-fun b_next!13633 () Bool)

(assert (=> start!72448 (= b_free!13633 (not b_next!13633))))

(declare-fun tp!47998 () Bool)

(declare-fun b_and!22719 () Bool)

(assert (=> start!72448 (= tp!47998 b_and!22719)))

(declare-fun b!840155 () Bool)

(declare-fun res!571190 () Bool)

(declare-fun e!468810 () Bool)

(assert (=> b!840155 (=> (not res!571190) (not e!468810))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47278 0))(
  ( (array!47279 (arr!22670 (Array (_ BitVec 32) (_ BitVec 64))) (size!23110 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47278)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!840155 (= res!571190 (and (= (select (arr!22670 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23110 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840156 () Bool)

(declare-fun e!468813 () Bool)

(declare-fun tp_is_empty!15499 () Bool)

(assert (=> b!840156 (= e!468813 tp_is_empty!15499)))

(declare-datatypes ((V!25713 0))(
  ( (V!25714 (val!7797 Int)) )
))
(declare-datatypes ((tuple2!10330 0))(
  ( (tuple2!10331 (_1!5176 (_ BitVec 64)) (_2!5176 V!25713)) )
))
(declare-datatypes ((List!16124 0))(
  ( (Nil!16121) (Cons!16120 (h!17251 tuple2!10330) (t!22495 List!16124)) )
))
(declare-datatypes ((ListLongMap!9099 0))(
  ( (ListLongMap!9100 (toList!4565 List!16124)) )
))
(declare-fun call!37133 () ListLongMap!9099)

(declare-fun call!37132 () ListLongMap!9099)

(declare-fun v!557 () V!25713)

(declare-fun b!840157 () Bool)

(declare-fun e!468812 () Bool)

(declare-fun +!2034 (ListLongMap!9099 tuple2!10330) ListLongMap!9099)

(assert (=> b!840157 (= e!468812 (= call!37133 (+!2034 call!37132 (tuple2!10331 k!854 v!557))))))

(declare-fun b!840158 () Bool)

(declare-fun res!571192 () Bool)

(assert (=> b!840158 (=> (not res!571192) (not e!468810))))

(assert (=> b!840158 (= res!571192 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23110 _keys!868))))))

(declare-fun b!840159 () Bool)

(assert (=> b!840159 (= e!468810 (not true))))

(assert (=> b!840159 e!468812))

(declare-fun c!91309 () Bool)

(assert (=> b!840159 (= c!91309 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25713)

(declare-fun zeroValue!654 () V!25713)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28855 0))(
  ( (Unit!28856) )
))
(declare-fun lt!380815 () Unit!28855)

(declare-datatypes ((ValueCell!7310 0))(
  ( (ValueCellFull!7310 (v!10222 V!25713)) (EmptyCell!7310) )
))
(declare-datatypes ((array!47280 0))(
  ( (array!47281 (arr!22671 (Array (_ BitVec 32) ValueCell!7310)) (size!23111 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47280)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!273 (array!47278 array!47280 (_ BitVec 32) (_ BitVec 32) V!25713 V!25713 (_ BitVec 32) (_ BitVec 64) V!25713 (_ BitVec 32) Int) Unit!28855)

(assert (=> b!840159 (= lt!380815 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!273 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840160 () Bool)

(declare-fun res!571193 () Bool)

(assert (=> b!840160 (=> (not res!571193) (not e!468810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47278 (_ BitVec 32)) Bool)

(assert (=> b!840160 (= res!571193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!571187 () Bool)

(assert (=> start!72448 (=> (not res!571187) (not e!468810))))

(assert (=> start!72448 (= res!571187 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23110 _keys!868))))))

(assert (=> start!72448 e!468810))

(assert (=> start!72448 tp_is_empty!15499))

(assert (=> start!72448 true))

(assert (=> start!72448 tp!47998))

(declare-fun array_inv!18052 (array!47278) Bool)

(assert (=> start!72448 (array_inv!18052 _keys!868)))

(declare-fun e!468809 () Bool)

(declare-fun array_inv!18053 (array!47280) Bool)

(assert (=> start!72448 (and (array_inv!18053 _values!688) e!468809)))

(declare-fun b!840161 () Bool)

(declare-fun res!571189 () Bool)

(assert (=> b!840161 (=> (not res!571189) (not e!468810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840161 (= res!571189 (validKeyInArray!0 k!854))))

(declare-fun bm!37129 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2553 (array!47278 array!47280 (_ BitVec 32) (_ BitVec 32) V!25713 V!25713 (_ BitVec 32) Int) ListLongMap!9099)

(assert (=> bm!37129 (= call!37133 (getCurrentListMapNoExtraKeys!2553 _keys!868 (array!47281 (store (arr!22671 _values!688) i!612 (ValueCellFull!7310 v!557)) (size!23111 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37130 () Bool)

(assert (=> bm!37130 (= call!37132 (getCurrentListMapNoExtraKeys!2553 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840162 () Bool)

(declare-fun res!571191 () Bool)

(assert (=> b!840162 (=> (not res!571191) (not e!468810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840162 (= res!571191 (validMask!0 mask!1196))))

(declare-fun b!840163 () Bool)

(declare-fun e!468811 () Bool)

(declare-fun mapRes!24848 () Bool)

(assert (=> b!840163 (= e!468809 (and e!468811 mapRes!24848))))

(declare-fun condMapEmpty!24848 () Bool)

(declare-fun mapDefault!24848 () ValueCell!7310)

