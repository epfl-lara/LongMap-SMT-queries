; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73280 () Bool)

(assert start!73280)

(declare-fun b_free!14195 () Bool)

(declare-fun b_next!14195 () Bool)

(assert (=> start!73280 (= b_free!14195 (not b_next!14195))))

(declare-fun tp!50088 () Bool)

(declare-fun b_and!23549 () Bool)

(assert (=> start!73280 (= tp!50088 b_and!23549)))

(declare-fun b!854737 () Bool)

(declare-fun e!476607 () Bool)

(declare-fun e!476606 () Bool)

(assert (=> b!854737 (= e!476607 e!476606)))

(declare-fun res!580452 () Bool)

(assert (=> b!854737 (=> (not res!580452) (not e!476606))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854737 (= res!580452 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48860 0))(
  ( (array!48861 (arr!23461 (Array (_ BitVec 32) (_ BitVec 64))) (size!23901 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48860)

(declare-datatypes ((V!26821 0))(
  ( (V!26822 (val!8213 Int)) )
))
(declare-datatypes ((ValueCell!7726 0))(
  ( (ValueCellFull!7726 (v!10638 V!26821)) (EmptyCell!7726) )
))
(declare-datatypes ((array!48862 0))(
  ( (array!48863 (arr!23462 (Array (_ BitVec 32) ValueCell!7726)) (size!23902 (_ BitVec 32))) )
))
(declare-fun lt!385564 () array!48862)

(declare-datatypes ((tuple2!10816 0))(
  ( (tuple2!10817 (_1!5419 (_ BitVec 64)) (_2!5419 V!26821)) )
))
(declare-datatypes ((List!16631 0))(
  ( (Nil!16628) (Cons!16627 (h!17758 tuple2!10816) (t!23272 List!16631)) )
))
(declare-datatypes ((ListLongMap!9585 0))(
  ( (ListLongMap!9586 (toList!4808 List!16631)) )
))
(declare-fun lt!385572 () ListLongMap!9585)

(declare-fun minValue!654 () V!26821)

(declare-fun zeroValue!654 () V!26821)

(declare-fun getCurrentListMapNoExtraKeys!2789 (array!48860 array!48862 (_ BitVec 32) (_ BitVec 32) V!26821 V!26821 (_ BitVec 32) Int) ListLongMap!9585)

(assert (=> b!854737 (= lt!385572 (getCurrentListMapNoExtraKeys!2789 _keys!868 lt!385564 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26821)

(declare-fun _values!688 () array!48862)

(assert (=> b!854737 (= lt!385564 (array!48863 (store (arr!23462 _values!688) i!612 (ValueCellFull!7726 v!557)) (size!23902 _values!688)))))

(declare-fun lt!385567 () ListLongMap!9585)

(assert (=> b!854737 (= lt!385567 (getCurrentListMapNoExtraKeys!2789 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854738 () Bool)

(declare-fun e!476603 () Bool)

(assert (=> b!854738 (= e!476603 true)))

(declare-fun lt!385568 () ListLongMap!9585)

(declare-fun lt!385571 () tuple2!10816)

(declare-fun lt!385566 () V!26821)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2195 (ListLongMap!9585 tuple2!10816) ListLongMap!9585)

(assert (=> b!854738 (= (+!2195 lt!385568 lt!385571) (+!2195 (+!2195 lt!385568 (tuple2!10817 k!854 lt!385566)) lt!385571))))

(declare-fun lt!385573 () V!26821)

(assert (=> b!854738 (= lt!385571 (tuple2!10817 k!854 lt!385573))))

(declare-datatypes ((Unit!29177 0))(
  ( (Unit!29178) )
))
(declare-fun lt!385569 () Unit!29177)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!319 (ListLongMap!9585 (_ BitVec 64) V!26821 V!26821) Unit!29177)

(assert (=> b!854738 (= lt!385569 (addSameAsAddTwiceSameKeyDiffValues!319 lt!385568 k!854 lt!385566 lt!385573))))

(declare-fun lt!385570 () V!26821)

(declare-fun get!12381 (ValueCell!7726 V!26821) V!26821)

(assert (=> b!854738 (= lt!385566 (get!12381 (select (arr!23462 _values!688) from!1053) lt!385570))))

(assert (=> b!854738 (= lt!385572 (+!2195 lt!385568 (tuple2!10817 (select (arr!23461 _keys!868) from!1053) lt!385573)))))

(assert (=> b!854738 (= lt!385573 (get!12381 (select (store (arr!23462 _values!688) i!612 (ValueCellFull!7726 v!557)) from!1053) lt!385570))))

(declare-fun dynLambda!1073 (Int (_ BitVec 64)) V!26821)

(assert (=> b!854738 (= lt!385570 (dynLambda!1073 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854738 (= lt!385568 (getCurrentListMapNoExtraKeys!2789 _keys!868 lt!385564 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38440 () ListLongMap!9585)

(declare-fun bm!38437 () Bool)

(assert (=> bm!38437 (= call!38440 (getCurrentListMapNoExtraKeys!2789 _keys!868 lt!385564 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854740 () Bool)

(declare-fun e!476605 () Bool)

(declare-fun tp_is_empty!16331 () Bool)

(assert (=> b!854740 (= e!476605 tp_is_empty!16331)))

(declare-fun b!854741 () Bool)

(declare-fun e!476601 () Bool)

(assert (=> b!854741 (= e!476601 tp_is_empty!16331)))

(declare-fun b!854742 () Bool)

(declare-fun res!580449 () Bool)

(assert (=> b!854742 (=> (not res!580449) (not e!476607))))

(assert (=> b!854742 (= res!580449 (and (= (size!23902 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23901 _keys!868) (size!23902 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854743 () Bool)

(declare-fun e!476604 () Bool)

(declare-fun mapRes!26096 () Bool)

(assert (=> b!854743 (= e!476604 (and e!476601 mapRes!26096))))

(declare-fun condMapEmpty!26096 () Bool)

(declare-fun mapDefault!26096 () ValueCell!7726)

