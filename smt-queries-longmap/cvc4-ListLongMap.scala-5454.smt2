; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72512 () Bool)

(assert start!72512)

(declare-fun b_free!13697 () Bool)

(declare-fun b_next!13697 () Bool)

(assert (=> start!72512 (= b_free!13697 (not b_next!13697))))

(declare-fun tp!48189 () Bool)

(declare-fun b_and!22783 () Bool)

(assert (=> start!72512 (= tp!48189 b_and!22783)))

(declare-fun b!841403 () Bool)

(declare-fun res!571959 () Bool)

(declare-fun e!469389 () Bool)

(assert (=> b!841403 (=> (not res!571959) (not e!469389))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47404 0))(
  ( (array!47405 (arr!22733 (Array (_ BitVec 32) (_ BitVec 64))) (size!23173 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47404)

(assert (=> b!841403 (= res!571959 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23173 _keys!868))))))

(declare-datatypes ((V!25797 0))(
  ( (V!25798 (val!7829 Int)) )
))
(declare-fun v!557 () V!25797)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10390 0))(
  ( (tuple2!10391 (_1!5206 (_ BitVec 64)) (_2!5206 V!25797)) )
))
(declare-datatypes ((List!16172 0))(
  ( (Nil!16169) (Cons!16168 (h!17299 tuple2!10390) (t!22543 List!16172)) )
))
(declare-datatypes ((ListLongMap!9159 0))(
  ( (ListLongMap!9160 (toList!4595 List!16172)) )
))
(declare-fun call!37325 () ListLongMap!9159)

(declare-datatypes ((ValueCell!7342 0))(
  ( (ValueCellFull!7342 (v!10254 V!25797)) (EmptyCell!7342) )
))
(declare-datatypes ((array!47406 0))(
  ( (array!47407 (arr!22734 (Array (_ BitVec 32) ValueCell!7342)) (size!23174 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47406)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25797)

(declare-fun zeroValue!654 () V!25797)

(declare-fun bm!37321 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2581 (array!47404 array!47406 (_ BitVec 32) (_ BitVec 32) V!25797 V!25797 (_ BitVec 32) Int) ListLongMap!9159)

(assert (=> bm!37321 (= call!37325 (getCurrentListMapNoExtraKeys!2581 _keys!868 (array!47407 (store (arr!22734 _values!688) i!612 (ValueCellFull!7342 v!557)) (size!23174 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841404 () Bool)

(declare-fun e!469390 () Bool)

(declare-fun e!469387 () Bool)

(declare-fun mapRes!24944 () Bool)

(assert (=> b!841404 (= e!469390 (and e!469387 mapRes!24944))))

(declare-fun condMapEmpty!24944 () Bool)

(declare-fun mapDefault!24944 () ValueCell!7342)

