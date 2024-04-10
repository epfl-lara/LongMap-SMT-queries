; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73174 () Bool)

(assert start!73174)

(declare-fun b_free!14089 () Bool)

(declare-fun b_next!14089 () Bool)

(assert (=> start!73174 (= b_free!14089 (not b_next!14089))))

(declare-fun tp!49770 () Bool)

(declare-fun b_and!23337 () Bool)

(assert (=> start!73174 (= tp!49770 b_and!23337)))

(declare-fun bm!38119 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48648 0))(
  ( (array!48649 (arr!23355 (Array (_ BitVec 32) (_ BitVec 64))) (size!23795 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48648)

(declare-datatypes ((V!26681 0))(
  ( (V!26682 (val!8160 Int)) )
))
(declare-datatypes ((ValueCell!7673 0))(
  ( (ValueCellFull!7673 (v!10585 V!26681)) (EmptyCell!7673) )
))
(declare-datatypes ((array!48650 0))(
  ( (array!48651 (arr!23356 (Array (_ BitVec 32) ValueCell!7673)) (size!23796 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48650)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26681)

(declare-fun zeroValue!654 () V!26681)

(declare-datatypes ((tuple2!10714 0))(
  ( (tuple2!10715 (_1!5368 (_ BitVec 64)) (_2!5368 V!26681)) )
))
(declare-datatypes ((List!16549 0))(
  ( (Nil!16546) (Cons!16545 (h!17676 tuple2!10714) (t!23084 List!16549)) )
))
(declare-datatypes ((ListLongMap!9483 0))(
  ( (ListLongMap!9484 (toList!4757 List!16549)) )
))
(declare-fun call!38123 () ListLongMap!9483)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2739 (array!48648 array!48650 (_ BitVec 32) (_ BitVec 32) V!26681 V!26681 (_ BitVec 32) Int) ListLongMap!9483)

(assert (=> bm!38119 (= call!38123 (getCurrentListMapNoExtraKeys!2739 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578862 () Bool)

(declare-fun e!475334 () Bool)

(assert (=> start!73174 (=> (not res!578862) (not e!475334))))

(assert (=> start!73174 (= res!578862 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23795 _keys!868))))))

(assert (=> start!73174 e!475334))

(declare-fun tp_is_empty!16225 () Bool)

(assert (=> start!73174 tp_is_empty!16225))

(assert (=> start!73174 true))

(assert (=> start!73174 tp!49770))

(declare-fun array_inv!18524 (array!48648) Bool)

(assert (=> start!73174 (array_inv!18524 _keys!868)))

(declare-fun e!475336 () Bool)

(declare-fun array_inv!18525 (array!48650) Bool)

(assert (=> start!73174 (and (array_inv!18525 _values!688) e!475336)))

(declare-fun b!852246 () Bool)

(declare-fun e!475331 () Bool)

(assert (=> b!852246 (= e!475331 true)))

(declare-fun lt!383982 () ListLongMap!9483)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!383975 () V!26681)

(declare-fun lt!383978 () tuple2!10714)

(declare-fun +!2155 (ListLongMap!9483 tuple2!10714) ListLongMap!9483)

(assert (=> b!852246 (= (+!2155 lt!383982 lt!383978) (+!2155 (+!2155 lt!383982 (tuple2!10715 k!854 lt!383975)) lt!383978))))

(declare-fun lt!383977 () V!26681)

(assert (=> b!852246 (= lt!383978 (tuple2!10715 k!854 lt!383977))))

(declare-datatypes ((Unit!29091 0))(
  ( (Unit!29092) )
))
(declare-fun lt!383981 () Unit!29091)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!283 (ListLongMap!9483 (_ BitVec 64) V!26681 V!26681) Unit!29091)

(assert (=> b!852246 (= lt!383981 (addSameAsAddTwiceSameKeyDiffValues!283 lt!383982 k!854 lt!383975 lt!383977))))

(declare-fun lt!383974 () V!26681)

(declare-fun get!12311 (ValueCell!7673 V!26681) V!26681)

(assert (=> b!852246 (= lt!383975 (get!12311 (select (arr!23356 _values!688) from!1053) lt!383974))))

(declare-fun lt!383979 () ListLongMap!9483)

(assert (=> b!852246 (= lt!383979 (+!2155 lt!383982 (tuple2!10715 (select (arr!23355 _keys!868) from!1053) lt!383977)))))

(declare-fun v!557 () V!26681)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852246 (= lt!383977 (get!12311 (select (store (arr!23356 _values!688) i!612 (ValueCellFull!7673 v!557)) from!1053) lt!383974))))

(declare-fun dynLambda!1037 (Int (_ BitVec 64)) V!26681)

(assert (=> b!852246 (= lt!383974 (dynLambda!1037 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383983 () array!48650)

(assert (=> b!852246 (= lt!383982 (getCurrentListMapNoExtraKeys!2739 _keys!868 lt!383983 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852247 () Bool)

(declare-fun e!475330 () Bool)

(declare-fun mapRes!25937 () Bool)

(assert (=> b!852247 (= e!475336 (and e!475330 mapRes!25937))))

(declare-fun condMapEmpty!25937 () Bool)

(declare-fun mapDefault!25937 () ValueCell!7673)

