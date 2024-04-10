; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72472 () Bool)

(assert start!72472)

(declare-fun b_free!13657 () Bool)

(declare-fun b_next!13657 () Bool)

(assert (=> start!72472 (= b_free!13657 (not b_next!13657))))

(declare-fun tp!48069 () Bool)

(declare-fun b_and!22743 () Bool)

(assert (=> start!72472 (= tp!48069 b_and!22743)))

(declare-fun b!840623 () Bool)

(declare-fun e!469029 () Bool)

(declare-datatypes ((V!25745 0))(
  ( (V!25746 (val!7809 Int)) )
))
(declare-datatypes ((tuple2!10352 0))(
  ( (tuple2!10353 (_1!5187 (_ BitVec 64)) (_2!5187 V!25745)) )
))
(declare-datatypes ((List!16142 0))(
  ( (Nil!16139) (Cons!16138 (h!17269 tuple2!10352) (t!22513 List!16142)) )
))
(declare-datatypes ((ListLongMap!9121 0))(
  ( (ListLongMap!9122 (toList!4576 List!16142)) )
))
(declare-fun call!37204 () ListLongMap!9121)

(declare-fun call!37205 () ListLongMap!9121)

(assert (=> b!840623 (= e!469029 (= call!37204 call!37205))))

(declare-fun b!840624 () Bool)

(declare-fun e!469027 () Bool)

(declare-fun tp_is_empty!15523 () Bool)

(assert (=> b!840624 (= e!469027 tp_is_empty!15523)))

(declare-fun res!571476 () Bool)

(declare-fun e!469026 () Bool)

(assert (=> start!72472 (=> (not res!571476) (not e!469026))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47324 0))(
  ( (array!47325 (arr!22693 (Array (_ BitVec 32) (_ BitVec 64))) (size!23133 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47324)

(assert (=> start!72472 (= res!571476 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23133 _keys!868))))))

(assert (=> start!72472 e!469026))

(assert (=> start!72472 tp_is_empty!15523))

(assert (=> start!72472 true))

(assert (=> start!72472 tp!48069))

(declare-fun array_inv!18066 (array!47324) Bool)

(assert (=> start!72472 (array_inv!18066 _keys!868)))

(declare-datatypes ((ValueCell!7322 0))(
  ( (ValueCellFull!7322 (v!10234 V!25745)) (EmptyCell!7322) )
))
(declare-datatypes ((array!47326 0))(
  ( (array!47327 (arr!22694 (Array (_ BitVec 32) ValueCell!7322)) (size!23134 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47326)

(declare-fun e!469030 () Bool)

(declare-fun array_inv!18067 (array!47326) Bool)

(assert (=> start!72472 (and (array_inv!18067 _values!688) e!469030)))

(declare-fun v!557 () V!25745)

(declare-fun b!840625 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2045 (ListLongMap!9121 tuple2!10352) ListLongMap!9121)

(assert (=> b!840625 (= e!469029 (= call!37204 (+!2045 call!37205 (tuple2!10353 k!854 v!557))))))

(declare-fun bm!37201 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25745)

(declare-fun zeroValue!654 () V!25745)

(declare-fun getCurrentListMapNoExtraKeys!2563 (array!47324 array!47326 (_ BitVec 32) (_ BitVec 32) V!25745 V!25745 (_ BitVec 32) Int) ListLongMap!9121)

(assert (=> bm!37201 (= call!37205 (getCurrentListMapNoExtraKeys!2563 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun bm!37202 () Bool)

(assert (=> bm!37202 (= call!37204 (getCurrentListMapNoExtraKeys!2563 _keys!868 (array!47327 (store (arr!22694 _values!688) i!612 (ValueCellFull!7322 v!557)) (size!23134 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840626 () Bool)

(declare-fun res!571479 () Bool)

(assert (=> b!840626 (=> (not res!571479) (not e!469026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840626 (= res!571479 (validKeyInArray!0 k!854))))

(declare-fun b!840627 () Bool)

(declare-fun res!571478 () Bool)

(assert (=> b!840627 (=> (not res!571478) (not e!469026))))

(assert (=> b!840627 (= res!571478 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23133 _keys!868))))))

(declare-fun b!840628 () Bool)

(assert (=> b!840628 (= e!469026 (not true))))

(assert (=> b!840628 e!469029))

(declare-fun c!91345 () Bool)

(assert (=> b!840628 (= c!91345 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28873 0))(
  ( (Unit!28874) )
))
(declare-fun lt!380851 () Unit!28873)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!282 (array!47324 array!47326 (_ BitVec 32) (_ BitVec 32) V!25745 V!25745 (_ BitVec 32) (_ BitVec 64) V!25745 (_ BitVec 32) Int) Unit!28873)

(assert (=> b!840628 (= lt!380851 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!282 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840629 () Bool)

(declare-fun res!571474 () Bool)

(assert (=> b!840629 (=> (not res!571474) (not e!469026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840629 (= res!571474 (validMask!0 mask!1196))))

(declare-fun b!840630 () Bool)

(declare-fun mapRes!24884 () Bool)

(assert (=> b!840630 (= e!469030 (and e!469027 mapRes!24884))))

(declare-fun condMapEmpty!24884 () Bool)

(declare-fun mapDefault!24884 () ValueCell!7322)

