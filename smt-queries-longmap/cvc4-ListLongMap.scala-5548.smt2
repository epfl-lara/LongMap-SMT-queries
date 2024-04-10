; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73076 () Bool)

(assert start!73076)

(declare-fun b_free!13991 () Bool)

(declare-fun b_next!13991 () Bool)

(assert (=> start!73076 (= b_free!13991 (not b_next!13991))))

(declare-fun tp!49476 () Bool)

(declare-fun b_and!23141 () Bool)

(assert (=> start!73076 (= tp!49476 b_and!23141)))

(declare-fun b!849943 () Bool)

(declare-fun e!474153 () Bool)

(declare-datatypes ((V!26549 0))(
  ( (V!26550 (val!8111 Int)) )
))
(declare-datatypes ((tuple2!10626 0))(
  ( (tuple2!10627 (_1!5324 (_ BitVec 64)) (_2!5324 V!26549)) )
))
(declare-datatypes ((List!16472 0))(
  ( (Nil!16469) (Cons!16468 (h!17599 tuple2!10626) (t!22909 List!16472)) )
))
(declare-datatypes ((ListLongMap!9395 0))(
  ( (ListLongMap!9396 (toList!4713 List!16472)) )
))
(declare-fun call!37829 () ListLongMap!9395)

(declare-fun call!37828 () ListLongMap!9395)

(assert (=> b!849943 (= e!474153 (= call!37829 call!37828))))

(declare-fun b!849944 () Bool)

(declare-fun res!577397 () Bool)

(declare-fun e!474154 () Bool)

(assert (=> b!849944 (=> (not res!577397) (not e!474154))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48460 0))(
  ( (array!48461 (arr!23261 (Array (_ BitVec 32) (_ BitVec 64))) (size!23701 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48460)

(assert (=> b!849944 (= res!577397 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23701 _keys!868))))))

(declare-fun b!849945 () Bool)

(declare-fun e!474160 () Bool)

(declare-fun tp_is_empty!16127 () Bool)

(assert (=> b!849945 (= e!474160 tp_is_empty!16127)))

(declare-fun b!849946 () Bool)

(declare-fun e!474159 () Bool)

(declare-fun e!474156 () Bool)

(assert (=> b!849946 (= e!474159 (not e!474156))))

(declare-fun res!577396 () Bool)

(assert (=> b!849946 (=> res!577396 e!474156)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849946 (= res!577396 (not (validKeyInArray!0 (select (arr!23261 _keys!868) from!1053))))))

(assert (=> b!849946 e!474153))

(declare-fun c!91657 () Bool)

(assert (=> b!849946 (= c!91657 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26549)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29021 0))(
  ( (Unit!29022) )
))
(declare-fun lt!382504 () Unit!29021)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7624 0))(
  ( (ValueCellFull!7624 (v!10536 V!26549)) (EmptyCell!7624) )
))
(declare-datatypes ((array!48462 0))(
  ( (array!48463 (arr!23262 (Array (_ BitVec 32) ValueCell!7624)) (size!23702 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48462)

(declare-fun minValue!654 () V!26549)

(declare-fun zeroValue!654 () V!26549)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!354 (array!48460 array!48462 (_ BitVec 32) (_ BitVec 32) V!26549 V!26549 (_ BitVec 32) (_ BitVec 64) V!26549 (_ BitVec 32) Int) Unit!29021)

(assert (=> b!849946 (= lt!382504 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!354 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849947 () Bool)

(declare-fun res!577395 () Bool)

(assert (=> b!849947 (=> (not res!577395) (not e!474154))))

(assert (=> b!849947 (= res!577395 (and (= (size!23702 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23701 _keys!868) (size!23702 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849948 () Bool)

(assert (=> b!849948 (= e!474156 true)))

(declare-fun lt!382512 () V!26549)

(declare-fun lt!382505 () tuple2!10626)

(declare-fun lt!382513 () ListLongMap!9395)

(declare-fun +!2116 (ListLongMap!9395 tuple2!10626) ListLongMap!9395)

(assert (=> b!849948 (= (+!2116 lt!382513 lt!382505) (+!2116 (+!2116 lt!382513 (tuple2!10627 k!854 lt!382512)) lt!382505))))

(declare-fun lt!382506 () V!26549)

(assert (=> b!849948 (= lt!382505 (tuple2!10627 k!854 lt!382506))))

(declare-fun lt!382509 () Unit!29021)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!253 (ListLongMap!9395 (_ BitVec 64) V!26549 V!26549) Unit!29021)

(assert (=> b!849948 (= lt!382509 (addSameAsAddTwiceSameKeyDiffValues!253 lt!382513 k!854 lt!382512 lt!382506))))

(declare-fun lt!382507 () V!26549)

(declare-fun get!12247 (ValueCell!7624 V!26549) V!26549)

(assert (=> b!849948 (= lt!382512 (get!12247 (select (arr!23262 _values!688) from!1053) lt!382507))))

(declare-fun lt!382511 () ListLongMap!9395)

(assert (=> b!849948 (= lt!382511 (+!2116 lt!382513 (tuple2!10627 (select (arr!23261 _keys!868) from!1053) lt!382506)))))

(assert (=> b!849948 (= lt!382506 (get!12247 (select (store (arr!23262 _values!688) i!612 (ValueCellFull!7624 v!557)) from!1053) lt!382507))))

(declare-fun dynLambda!1007 (Int (_ BitVec 64)) V!26549)

(assert (=> b!849948 (= lt!382507 (dynLambda!1007 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382510 () array!48462)

(declare-fun getCurrentListMapNoExtraKeys!2695 (array!48460 array!48462 (_ BitVec 32) (_ BitVec 32) V!26549 V!26549 (_ BitVec 32) Int) ListLongMap!9395)

(assert (=> b!849948 (= lt!382513 (getCurrentListMapNoExtraKeys!2695 _keys!868 lt!382510 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37825 () Bool)

(assert (=> bm!37825 (= call!37829 (getCurrentListMapNoExtraKeys!2695 _keys!868 lt!382510 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849949 () Bool)

(declare-fun e!474155 () Bool)

(assert (=> b!849949 (= e!474155 tp_is_empty!16127)))

(declare-fun b!849950 () Bool)

(declare-fun res!577393 () Bool)

(assert (=> b!849950 (=> (not res!577393) (not e!474154))))

(assert (=> b!849950 (= res!577393 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!25790 () Bool)

(declare-fun mapRes!25790 () Bool)

(assert (=> mapIsEmpty!25790 mapRes!25790))

(declare-fun mapNonEmpty!25790 () Bool)

(declare-fun tp!49477 () Bool)

(assert (=> mapNonEmpty!25790 (= mapRes!25790 (and tp!49477 e!474155))))

(declare-fun mapValue!25790 () ValueCell!7624)

(declare-fun mapRest!25790 () (Array (_ BitVec 32) ValueCell!7624))

(declare-fun mapKey!25790 () (_ BitVec 32))

(assert (=> mapNonEmpty!25790 (= (arr!23262 _values!688) (store mapRest!25790 mapKey!25790 mapValue!25790))))

(declare-fun b!849952 () Bool)

(declare-fun res!577388 () Bool)

(assert (=> b!849952 (=> (not res!577388) (not e!474154))))

(assert (=> b!849952 (= res!577388 (and (= (select (arr!23261 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!849953 () Bool)

(declare-fun e!474158 () Bool)

(assert (=> b!849953 (= e!474158 (and e!474160 mapRes!25790))))

(declare-fun condMapEmpty!25790 () Bool)

(declare-fun mapDefault!25790 () ValueCell!7624)

