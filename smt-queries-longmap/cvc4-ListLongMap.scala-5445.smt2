; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72458 () Bool)

(assert start!72458)

(declare-fun b_free!13643 () Bool)

(declare-fun b_next!13643 () Bool)

(assert (=> start!72458 (= b_free!13643 (not b_next!13643))))

(declare-fun tp!48028 () Bool)

(declare-fun b_and!22729 () Bool)

(assert (=> start!72458 (= tp!48028 b_and!22729)))

(declare-datatypes ((V!25725 0))(
  ( (V!25726 (val!7802 Int)) )
))
(declare-fun v!557 () V!25725)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10340 0))(
  ( (tuple2!10341 (_1!5181 (_ BitVec 64)) (_2!5181 V!25725)) )
))
(declare-datatypes ((List!16132 0))(
  ( (Nil!16129) (Cons!16128 (h!17259 tuple2!10340) (t!22503 List!16132)) )
))
(declare-datatypes ((ListLongMap!9109 0))(
  ( (ListLongMap!9110 (toList!4570 List!16132)) )
))
(declare-fun call!37163 () ListLongMap!9109)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47298 0))(
  ( (array!47299 (arr!22680 (Array (_ BitVec 32) (_ BitVec 64))) (size!23120 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47298)

(declare-datatypes ((ValueCell!7315 0))(
  ( (ValueCellFull!7315 (v!10227 V!25725)) (EmptyCell!7315) )
))
(declare-datatypes ((array!47300 0))(
  ( (array!47301 (arr!22681 (Array (_ BitVec 32) ValueCell!7315)) (size!23121 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47300)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25725)

(declare-fun zeroValue!654 () V!25725)

(declare-fun bm!37159 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2558 (array!47298 array!47300 (_ BitVec 32) (_ BitVec 32) V!25725 V!25725 (_ BitVec 32) Int) ListLongMap!9109)

(assert (=> bm!37159 (= call!37163 (getCurrentListMapNoExtraKeys!2558 _keys!868 (array!47301 (store (arr!22681 _values!688) i!612 (ValueCellFull!7315 v!557)) (size!23121 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840350 () Bool)

(declare-fun e!468902 () Bool)

(declare-fun tp_is_empty!15509 () Bool)

(assert (=> b!840350 (= e!468902 tp_is_empty!15509)))

(declare-fun b!840351 () Bool)

(declare-fun res!571312 () Bool)

(declare-fun e!468903 () Bool)

(assert (=> b!840351 (=> (not res!571312) (not e!468903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47298 (_ BitVec 32)) Bool)

(assert (=> b!840351 (= res!571312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24863 () Bool)

(declare-fun mapRes!24863 () Bool)

(assert (=> mapIsEmpty!24863 mapRes!24863))

(declare-fun b!840353 () Bool)

(assert (=> b!840353 (= e!468903 (not true))))

(declare-fun e!468899 () Bool)

(assert (=> b!840353 e!468899))

(declare-fun c!91324 () Bool)

(assert (=> b!840353 (= c!91324 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28863 0))(
  ( (Unit!28864) )
))
(declare-fun lt!380830 () Unit!28863)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!277 (array!47298 array!47300 (_ BitVec 32) (_ BitVec 32) V!25725 V!25725 (_ BitVec 32) (_ BitVec 64) V!25725 (_ BitVec 32) Int) Unit!28863)

(assert (=> b!840353 (= lt!380830 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!277 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24863 () Bool)

(declare-fun tp!48027 () Bool)

(assert (=> mapNonEmpty!24863 (= mapRes!24863 (and tp!48027 e!468902))))

(declare-fun mapRest!24863 () (Array (_ BitVec 32) ValueCell!7315))

(declare-fun mapKey!24863 () (_ BitVec 32))

(declare-fun mapValue!24863 () ValueCell!7315)

(assert (=> mapNonEmpty!24863 (= (arr!22681 _values!688) (store mapRest!24863 mapKey!24863 mapValue!24863))))

(declare-fun b!840354 () Bool)

(declare-fun res!571311 () Bool)

(assert (=> b!840354 (=> (not res!571311) (not e!468903))))

(assert (=> b!840354 (= res!571311 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23120 _keys!868))))))

(declare-fun b!840355 () Bool)

(declare-fun res!571307 () Bool)

(assert (=> b!840355 (=> (not res!571307) (not e!468903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840355 (= res!571307 (validKeyInArray!0 k!854))))

(declare-fun call!37162 () ListLongMap!9109)

(declare-fun b!840356 () Bool)

(declare-fun +!2039 (ListLongMap!9109 tuple2!10340) ListLongMap!9109)

(assert (=> b!840356 (= e!468899 (= call!37163 (+!2039 call!37162 (tuple2!10341 k!854 v!557))))))

(declare-fun bm!37160 () Bool)

(assert (=> bm!37160 (= call!37162 (getCurrentListMapNoExtraKeys!2558 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840357 () Bool)

(declare-fun e!468900 () Bool)

(declare-fun e!468904 () Bool)

(assert (=> b!840357 (= e!468900 (and e!468904 mapRes!24863))))

(declare-fun condMapEmpty!24863 () Bool)

(declare-fun mapDefault!24863 () ValueCell!7315)

