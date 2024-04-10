; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73132 () Bool)

(assert start!73132)

(declare-fun b_free!14047 () Bool)

(declare-fun b_next!14047 () Bool)

(assert (=> start!73132 (= b_free!14047 (not b_next!14047))))

(declare-fun tp!49644 () Bool)

(declare-fun b_and!23253 () Bool)

(assert (=> start!73132 (= tp!49644 b_and!23253)))

(declare-fun b!851259 () Bool)

(declare-fun e!474826 () Bool)

(declare-fun e!474830 () Bool)

(assert (=> b!851259 (= e!474826 (not e!474830))))

(declare-fun res!578236 () Bool)

(assert (=> b!851259 (=> res!578236 e!474830)))

(declare-datatypes ((array!48568 0))(
  ( (array!48569 (arr!23315 (Array (_ BitVec 32) (_ BitVec 64))) (size!23755 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48568)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851259 (= res!578236 (not (validKeyInArray!0 (select (arr!23315 _keys!868) from!1053))))))

(declare-fun e!474825 () Bool)

(assert (=> b!851259 e!474825))

(declare-fun c!91741 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851259 (= c!91741 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29069 0))(
  ( (Unit!29070) )
))
(declare-fun lt!383344 () Unit!29069)

(declare-datatypes ((V!26625 0))(
  ( (V!26626 (val!8139 Int)) )
))
(declare-fun v!557 () V!26625)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7652 0))(
  ( (ValueCellFull!7652 (v!10564 V!26625)) (EmptyCell!7652) )
))
(declare-datatypes ((array!48570 0))(
  ( (array!48571 (arr!23316 (Array (_ BitVec 32) ValueCell!7652)) (size!23756 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48570)

(declare-fun minValue!654 () V!26625)

(declare-fun zeroValue!654 () V!26625)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!376 (array!48568 array!48570 (_ BitVec 32) (_ BitVec 32) V!26625 V!26625 (_ BitVec 32) (_ BitVec 64) V!26625 (_ BitVec 32) Int) Unit!29069)

(assert (=> b!851259 (= lt!383344 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!376 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851260 () Bool)

(declare-fun res!578228 () Bool)

(declare-fun e!474827 () Bool)

(assert (=> b!851260 (=> (not res!578228) (not e!474827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851260 (= res!578228 (validMask!0 mask!1196))))

(declare-fun b!851261 () Bool)

(declare-fun res!578233 () Bool)

(assert (=> b!851261 (=> (not res!578233) (not e!474827))))

(assert (=> b!851261 (= res!578233 (and (= (select (arr!23315 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!851262 () Bool)

(declare-datatypes ((tuple2!10678 0))(
  ( (tuple2!10679 (_1!5350 (_ BitVec 64)) (_2!5350 V!26625)) )
))
(declare-datatypes ((List!16517 0))(
  ( (Nil!16514) (Cons!16513 (h!17644 tuple2!10678) (t!23010 List!16517)) )
))
(declare-datatypes ((ListLongMap!9447 0))(
  ( (ListLongMap!9448 (toList!4739 List!16517)) )
))
(declare-fun call!37997 () ListLongMap!9447)

(declare-fun call!37996 () ListLongMap!9447)

(declare-fun +!2139 (ListLongMap!9447 tuple2!10678) ListLongMap!9447)

(assert (=> b!851262 (= e!474825 (= call!37996 (+!2139 call!37997 (tuple2!10679 k!854 v!557))))))

(declare-fun bm!37993 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2721 (array!48568 array!48570 (_ BitVec 32) (_ BitVec 32) V!26625 V!26625 (_ BitVec 32) Int) ListLongMap!9447)

(assert (=> bm!37993 (= call!37997 (getCurrentListMapNoExtraKeys!2721 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851263 () Bool)

(assert (=> b!851263 (= e!474830 true)))

(declare-fun lt!383352 () ListLongMap!9447)

(declare-fun lt!383346 () V!26625)

(declare-fun lt!383347 () tuple2!10678)

(assert (=> b!851263 (= (+!2139 lt!383352 lt!383347) (+!2139 (+!2139 lt!383352 (tuple2!10679 k!854 lt!383346)) lt!383347))))

(declare-fun lt!383348 () V!26625)

(assert (=> b!851263 (= lt!383347 (tuple2!10679 k!854 lt!383348))))

(declare-fun lt!383345 () Unit!29069)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!272 (ListLongMap!9447 (_ BitVec 64) V!26625 V!26625) Unit!29069)

(assert (=> b!851263 (= lt!383345 (addSameAsAddTwiceSameKeyDiffValues!272 lt!383352 k!854 lt!383346 lt!383348))))

(declare-fun lt!383353 () V!26625)

(declare-fun get!12286 (ValueCell!7652 V!26625) V!26625)

(assert (=> b!851263 (= lt!383346 (get!12286 (select (arr!23316 _values!688) from!1053) lt!383353))))

(declare-fun lt!383349 () ListLongMap!9447)

(assert (=> b!851263 (= lt!383349 (+!2139 lt!383352 (tuple2!10679 (select (arr!23315 _keys!868) from!1053) lt!383348)))))

(assert (=> b!851263 (= lt!383348 (get!12286 (select (store (arr!23316 _values!688) i!612 (ValueCellFull!7652 v!557)) from!1053) lt!383353))))

(declare-fun dynLambda!1026 (Int (_ BitVec 64)) V!26625)

(assert (=> b!851263 (= lt!383353 (dynLambda!1026 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383351 () array!48570)

(assert (=> b!851263 (= lt!383352 (getCurrentListMapNoExtraKeys!2721 _keys!868 lt!383351 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851264 () Bool)

(declare-fun res!578232 () Bool)

(assert (=> b!851264 (=> (not res!578232) (not e!474827))))

(assert (=> b!851264 (= res!578232 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23755 _keys!868))))))

(declare-fun b!851265 () Bool)

(declare-fun res!578229 () Bool)

(assert (=> b!851265 (=> (not res!578229) (not e!474827))))

(assert (=> b!851265 (= res!578229 (and (= (size!23756 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23755 _keys!868) (size!23756 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25874 () Bool)

(declare-fun mapRes!25874 () Bool)

(declare-fun tp!49645 () Bool)

(declare-fun e!474832 () Bool)

(assert (=> mapNonEmpty!25874 (= mapRes!25874 (and tp!49645 e!474832))))

(declare-fun mapValue!25874 () ValueCell!7652)

(declare-fun mapRest!25874 () (Array (_ BitVec 32) ValueCell!7652))

(declare-fun mapKey!25874 () (_ BitVec 32))

(assert (=> mapNonEmpty!25874 (= (arr!23316 _values!688) (store mapRest!25874 mapKey!25874 mapValue!25874))))

(declare-fun res!578231 () Bool)

(assert (=> start!73132 (=> (not res!578231) (not e!474827))))

(assert (=> start!73132 (= res!578231 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23755 _keys!868))))))

(assert (=> start!73132 e!474827))

(declare-fun tp_is_empty!16183 () Bool)

(assert (=> start!73132 tp_is_empty!16183))

(assert (=> start!73132 true))

(assert (=> start!73132 tp!49644))

(declare-fun array_inv!18498 (array!48568) Bool)

(assert (=> start!73132 (array_inv!18498 _keys!868)))

(declare-fun e!474829 () Bool)

(declare-fun array_inv!18499 (array!48570) Bool)

(assert (=> start!73132 (and (array_inv!18499 _values!688) e!474829)))

(declare-fun mapIsEmpty!25874 () Bool)

(assert (=> mapIsEmpty!25874 mapRes!25874))

(declare-fun b!851266 () Bool)

(declare-fun res!578234 () Bool)

(assert (=> b!851266 (=> (not res!578234) (not e!474827))))

(assert (=> b!851266 (= res!578234 (validKeyInArray!0 k!854))))

(declare-fun b!851267 () Bool)

(declare-fun e!474831 () Bool)

(assert (=> b!851267 (= e!474829 (and e!474831 mapRes!25874))))

(declare-fun condMapEmpty!25874 () Bool)

(declare-fun mapDefault!25874 () ValueCell!7652)

