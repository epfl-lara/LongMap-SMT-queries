; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72506 () Bool)

(assert start!72506)

(declare-fun b_free!13691 () Bool)

(declare-fun b_next!13691 () Bool)

(assert (=> start!72506 (= b_free!13691 (not b_next!13691))))

(declare-fun tp!48172 () Bool)

(declare-fun b_and!22777 () Bool)

(assert (=> start!72506 (= tp!48172 b_and!22777)))

(declare-datatypes ((V!25789 0))(
  ( (V!25790 (val!7826 Int)) )
))
(declare-fun v!557 () V!25789)

(declare-fun b!841286 () Bool)

(declare-datatypes ((tuple2!10384 0))(
  ( (tuple2!10385 (_1!5203 (_ BitVec 64)) (_2!5203 V!25789)) )
))
(declare-datatypes ((List!16167 0))(
  ( (Nil!16164) (Cons!16163 (h!17294 tuple2!10384) (t!22538 List!16167)) )
))
(declare-datatypes ((ListLongMap!9153 0))(
  ( (ListLongMap!9154 (toList!4592 List!16167)) )
))
(declare-fun call!37307 () ListLongMap!9153)

(declare-fun e!469335 () Bool)

(declare-fun call!37306 () ListLongMap!9153)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2059 (ListLongMap!9153 tuple2!10384) ListLongMap!9153)

(assert (=> b!841286 (= e!469335 (= call!37306 (+!2059 call!37307 (tuple2!10385 k!854 v!557))))))

(declare-fun b!841287 () Bool)

(declare-fun res!571888 () Bool)

(declare-fun e!469336 () Bool)

(assert (=> b!841287 (=> (not res!571888) (not e!469336))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47392 0))(
  ( (array!47393 (arr!22727 (Array (_ BitVec 32) (_ BitVec 64))) (size!23167 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47392)

(assert (=> b!841287 (= res!571888 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23167 _keys!868))))))

(declare-fun bm!37303 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7339 0))(
  ( (ValueCellFull!7339 (v!10251 V!25789)) (EmptyCell!7339) )
))
(declare-datatypes ((array!47394 0))(
  ( (array!47395 (arr!22728 (Array (_ BitVec 32) ValueCell!7339)) (size!23168 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47394)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25789)

(declare-fun zeroValue!654 () V!25789)

(declare-fun getCurrentListMapNoExtraKeys!2578 (array!47392 array!47394 (_ BitVec 32) (_ BitVec 32) V!25789 V!25789 (_ BitVec 32) Int) ListLongMap!9153)

(assert (=> bm!37303 (= call!37306 (getCurrentListMapNoExtraKeys!2578 _keys!868 (array!47395 (store (arr!22728 _values!688) i!612 (ValueCellFull!7339 v!557)) (size!23168 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841288 () Bool)

(declare-fun e!469332 () Bool)

(declare-fun e!469331 () Bool)

(declare-fun mapRes!24935 () Bool)

(assert (=> b!841288 (= e!469332 (and e!469331 mapRes!24935))))

(declare-fun condMapEmpty!24935 () Bool)

(declare-fun mapDefault!24935 () ValueCell!7339)

