; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73184 () Bool)

(assert start!73184)

(declare-fun b_free!14099 () Bool)

(declare-fun b_next!14099 () Bool)

(assert (=> start!73184 (= b_free!14099 (not b_next!14099))))

(declare-fun tp!49801 () Bool)

(declare-fun b_and!23357 () Bool)

(assert (=> start!73184 (= tp!49801 b_and!23357)))

(declare-fun bm!38149 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48668 0))(
  ( (array!48669 (arr!23365 (Array (_ BitVec 32) (_ BitVec 64))) (size!23805 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48668)

(declare-datatypes ((V!26693 0))(
  ( (V!26694 (val!8165 Int)) )
))
(declare-fun minValue!654 () V!26693)

(declare-fun zeroValue!654 () V!26693)

(declare-datatypes ((tuple2!10724 0))(
  ( (tuple2!10725 (_1!5373 (_ BitVec 64)) (_2!5373 V!26693)) )
))
(declare-datatypes ((List!16557 0))(
  ( (Nil!16554) (Cons!16553 (h!17684 tuple2!10724) (t!23102 List!16557)) )
))
(declare-datatypes ((ListLongMap!9493 0))(
  ( (ListLongMap!9494 (toList!4762 List!16557)) )
))
(declare-fun call!38153 () ListLongMap!9493)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7678 0))(
  ( (ValueCellFull!7678 (v!10590 V!26693)) (EmptyCell!7678) )
))
(declare-datatypes ((array!48670 0))(
  ( (array!48671 (arr!23366 (Array (_ BitVec 32) ValueCell!7678)) (size!23806 (_ BitVec 32))) )
))
(declare-fun lt!384124 () array!48670)

(declare-fun getCurrentListMapNoExtraKeys!2744 (array!48668 array!48670 (_ BitVec 32) (_ BitVec 32) V!26693 V!26693 (_ BitVec 32) Int) ListLongMap!9493)

(assert (=> bm!38149 (= call!38153 (getCurrentListMapNoExtraKeys!2744 _keys!868 lt!384124 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852481 () Bool)

(declare-fun res!579015 () Bool)

(declare-fun e!475449 () Bool)

(assert (=> b!852481 (=> (not res!579015) (not e!475449))))

(declare-fun _values!688 () array!48670)

(assert (=> b!852481 (= res!579015 (and (= (size!23806 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23805 _keys!868) (size!23806 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun e!475454 () Bool)

(declare-fun v!557 () V!26693)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun call!38152 () ListLongMap!9493)

(declare-fun b!852482 () Bool)

(declare-fun +!2159 (ListLongMap!9493 tuple2!10724) ListLongMap!9493)

(assert (=> b!852482 (= e!475454 (= call!38153 (+!2159 call!38152 (tuple2!10725 k!854 v!557))))))

(declare-fun mapIsEmpty!25952 () Bool)

(declare-fun mapRes!25952 () Bool)

(assert (=> mapIsEmpty!25952 mapRes!25952))

(declare-fun b!852484 () Bool)

(declare-fun e!475453 () Bool)

(assert (=> b!852484 (= e!475453 true)))

(declare-fun lt!384126 () V!26693)

(declare-fun lt!384132 () ListLongMap!9493)

(declare-fun lt!384130 () tuple2!10724)

(assert (=> b!852484 (= (+!2159 lt!384132 lt!384130) (+!2159 (+!2159 lt!384132 (tuple2!10725 k!854 lt!384126)) lt!384130))))

(declare-fun lt!384133 () V!26693)

(assert (=> b!852484 (= lt!384130 (tuple2!10725 k!854 lt!384133))))

(declare-datatypes ((Unit!29101 0))(
  ( (Unit!29102) )
))
(declare-fun lt!384128 () Unit!29101)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!287 (ListLongMap!9493 (_ BitVec 64) V!26693 V!26693) Unit!29101)

(assert (=> b!852484 (= lt!384128 (addSameAsAddTwiceSameKeyDiffValues!287 lt!384132 k!854 lt!384126 lt!384133))))

(declare-fun lt!384131 () V!26693)

(declare-fun get!12317 (ValueCell!7678 V!26693) V!26693)

(assert (=> b!852484 (= lt!384126 (get!12317 (select (arr!23366 _values!688) from!1053) lt!384131))))

(declare-fun lt!384129 () ListLongMap!9493)

(assert (=> b!852484 (= lt!384129 (+!2159 lt!384132 (tuple2!10725 (select (arr!23365 _keys!868) from!1053) lt!384133)))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852484 (= lt!384133 (get!12317 (select (store (arr!23366 _values!688) i!612 (ValueCellFull!7678 v!557)) from!1053) lt!384131))))

(declare-fun dynLambda!1041 (Int (_ BitVec 64)) V!26693)

(assert (=> b!852484 (= lt!384131 (dynLambda!1041 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852484 (= lt!384132 (getCurrentListMapNoExtraKeys!2744 _keys!868 lt!384124 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852485 () Bool)

(declare-fun e!475450 () Bool)

(declare-fun e!475451 () Bool)

(assert (=> b!852485 (= e!475450 (and e!475451 mapRes!25952))))

(declare-fun condMapEmpty!25952 () Bool)

(declare-fun mapDefault!25952 () ValueCell!7678)

