; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73138 () Bool)

(assert start!73138)

(declare-fun b_free!14053 () Bool)

(declare-fun b_next!14053 () Bool)

(assert (=> start!73138 (= b_free!14053 (not b_next!14053))))

(declare-fun tp!49663 () Bool)

(declare-fun b_and!23265 () Bool)

(assert (=> start!73138 (= tp!49663 b_and!23265)))

(declare-fun b!851400 () Bool)

(declare-fun e!474900 () Bool)

(declare-fun tp_is_empty!16189 () Bool)

(assert (=> b!851400 (= e!474900 tp_is_empty!16189)))

(declare-datatypes ((V!26633 0))(
  ( (V!26634 (val!8142 Int)) )
))
(declare-datatypes ((tuple2!10682 0))(
  ( (tuple2!10683 (_1!5352 (_ BitVec 64)) (_2!5352 V!26633)) )
))
(declare-datatypes ((List!16520 0))(
  ( (Nil!16517) (Cons!16516 (h!17647 tuple2!10682) (t!23019 List!16520)) )
))
(declare-datatypes ((ListLongMap!9451 0))(
  ( (ListLongMap!9452 (toList!4741 List!16520)) )
))
(declare-fun call!38014 () ListLongMap!9451)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38011 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48578 0))(
  ( (array!48579 (arr!23320 (Array (_ BitVec 32) (_ BitVec 64))) (size!23760 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48578)

(declare-datatypes ((ValueCell!7655 0))(
  ( (ValueCellFull!7655 (v!10567 V!26633)) (EmptyCell!7655) )
))
(declare-datatypes ((array!48580 0))(
  ( (array!48581 (arr!23321 (Array (_ BitVec 32) ValueCell!7655)) (size!23761 (_ BitVec 32))) )
))
(declare-fun lt!383436 () array!48580)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26633)

(declare-fun zeroValue!654 () V!26633)

(declare-fun getCurrentListMapNoExtraKeys!2723 (array!48578 array!48580 (_ BitVec 32) (_ BitVec 32) V!26633 V!26633 (_ BitVec 32) Int) ListLongMap!9451)

(assert (=> bm!38011 (= call!38014 (getCurrentListMapNoExtraKeys!2723 _keys!868 lt!383436 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851401 () Bool)

(declare-fun e!474904 () Bool)

(declare-fun e!474898 () Bool)

(assert (=> b!851401 (= e!474904 e!474898)))

(declare-fun res!578325 () Bool)

(assert (=> b!851401 (=> (not res!578325) (not e!474898))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851401 (= res!578325 (= from!1053 i!612))))

(declare-fun lt!383434 () ListLongMap!9451)

(assert (=> b!851401 (= lt!383434 (getCurrentListMapNoExtraKeys!2723 _keys!868 lt!383436 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26633)

(declare-fun _values!688 () array!48580)

(assert (=> b!851401 (= lt!383436 (array!48581 (store (arr!23321 _values!688) i!612 (ValueCellFull!7655 v!557)) (size!23761 _values!688)))))

(declare-fun lt!383438 () ListLongMap!9451)

(assert (=> b!851401 (= lt!383438 (getCurrentListMapNoExtraKeys!2723 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!38015 () ListLongMap!9451)

(declare-fun e!474902 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun b!851402 () Bool)

(declare-fun +!2141 (ListLongMap!9451 tuple2!10682) ListLongMap!9451)

(assert (=> b!851402 (= e!474902 (= call!38014 (+!2141 call!38015 (tuple2!10683 k!854 v!557))))))

(declare-fun b!851403 () Bool)

(declare-fun e!474903 () Bool)

(declare-fun e!474899 () Bool)

(declare-fun mapRes!25883 () Bool)

(assert (=> b!851403 (= e!474903 (and e!474899 mapRes!25883))))

(declare-fun condMapEmpty!25883 () Bool)

(declare-fun mapDefault!25883 () ValueCell!7655)

