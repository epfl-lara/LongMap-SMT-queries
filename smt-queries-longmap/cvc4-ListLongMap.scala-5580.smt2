; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73268 () Bool)

(assert start!73268)

(declare-fun b_free!14183 () Bool)

(declare-fun b_next!14183 () Bool)

(assert (=> start!73268 (= b_free!14183 (not b_next!14183))))

(declare-fun tp!50053 () Bool)

(declare-fun b_and!23525 () Bool)

(assert (=> start!73268 (= tp!50053 b_and!23525)))

(declare-fun b!854455 () Bool)

(declare-fun res!580274 () Bool)

(declare-fun e!476461 () Bool)

(assert (=> b!854455 (=> (not res!580274) (not e!476461))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48836 0))(
  ( (array!48837 (arr!23449 (Array (_ BitVec 32) (_ BitVec 64))) (size!23889 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48836)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!854455 (= res!580274 (and (= (select (arr!23449 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!854456 () Bool)

(declare-fun res!580272 () Bool)

(assert (=> b!854456 (=> (not res!580272) (not e!476461))))

(assert (=> b!854456 (= res!580272 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23889 _keys!868))))))

(declare-fun mapIsEmpty!26078 () Bool)

(declare-fun mapRes!26078 () Bool)

(assert (=> mapIsEmpty!26078 mapRes!26078))

(declare-fun b!854457 () Bool)

(declare-fun e!476459 () Bool)

(declare-fun e!476464 () Bool)

(assert (=> b!854457 (= e!476459 (not e!476464))))

(declare-fun res!580276 () Bool)

(assert (=> b!854457 (=> res!580276 e!476464)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854457 (= res!580276 (not (validKeyInArray!0 (select (arr!23449 _keys!868) from!1053))))))

(declare-fun e!476462 () Bool)

(assert (=> b!854457 e!476462))

(declare-fun c!91945 () Bool)

(assert (=> b!854457 (= c!91945 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26805 0))(
  ( (V!26806 (val!8207 Int)) )
))
(declare-fun v!557 () V!26805)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((Unit!29167 0))(
  ( (Unit!29168) )
))
(declare-fun lt!385388 () Unit!29167)

(declare-datatypes ((ValueCell!7720 0))(
  ( (ValueCellFull!7720 (v!10632 V!26805)) (EmptyCell!7720) )
))
(declare-datatypes ((array!48838 0))(
  ( (array!48839 (arr!23450 (Array (_ BitVec 32) ValueCell!7720)) (size!23890 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48838)

(declare-fun minValue!654 () V!26805)

(declare-fun zeroValue!654 () V!26805)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!412 (array!48836 array!48838 (_ BitVec 32) (_ BitVec 32) V!26805 V!26805 (_ BitVec 32) (_ BitVec 64) V!26805 (_ BitVec 32) Int) Unit!29167)

(assert (=> b!854457 (= lt!385388 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!412 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38401 () Bool)

(declare-datatypes ((tuple2!10804 0))(
  ( (tuple2!10805 (_1!5413 (_ BitVec 64)) (_2!5413 V!26805)) )
))
(declare-datatypes ((List!16621 0))(
  ( (Nil!16618) (Cons!16617 (h!17748 tuple2!10804) (t!23250 List!16621)) )
))
(declare-datatypes ((ListLongMap!9573 0))(
  ( (ListLongMap!9574 (toList!4802 List!16621)) )
))
(declare-fun call!38405 () ListLongMap!9573)

(declare-fun getCurrentListMapNoExtraKeys!2783 (array!48836 array!48838 (_ BitVec 32) (_ BitVec 32) V!26805 V!26805 (_ BitVec 32) Int) ListLongMap!9573)

(assert (=> bm!38401 (= call!38405 (getCurrentListMapNoExtraKeys!2783 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854458 () Bool)

(declare-fun e!476460 () Bool)

(declare-fun e!476457 () Bool)

(assert (=> b!854458 (= e!476460 (and e!476457 mapRes!26078))))

(declare-fun condMapEmpty!26078 () Bool)

(declare-fun mapDefault!26078 () ValueCell!7720)

