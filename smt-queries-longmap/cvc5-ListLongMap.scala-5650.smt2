; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73684 () Bool)

(assert start!73684)

(declare-fun b_free!14599 () Bool)

(declare-fun b_next!14599 () Bool)

(assert (=> start!73684 (= b_free!14599 (not b_next!14599))))

(declare-fun tp!51301 () Bool)

(declare-fun b_and!24177 () Bool)

(assert (=> start!73684 (= tp!51301 b_and!24177)))

(declare-fun b!863225 () Bool)

(declare-datatypes ((Unit!29499 0))(
  ( (Unit!29500) )
))
(declare-fun e!480916 () Unit!29499)

(declare-fun Unit!29501 () Unit!29499)

(assert (=> b!863225 (= e!480916 Unit!29501)))

(declare-fun b!863226 () Bool)

(declare-fun e!480914 () Bool)

(declare-fun tp_is_empty!16735 () Bool)

(assert (=> b!863226 (= e!480914 tp_is_empty!16735)))

(declare-fun b!863227 () Bool)

(declare-fun res!586583 () Bool)

(declare-fun e!480913 () Bool)

(assert (=> b!863227 (=> (not res!586583) (not e!480913))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49632 0))(
  ( (array!49633 (arr!23847 (Array (_ BitVec 32) (_ BitVec 64))) (size!24287 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49632)

(declare-datatypes ((V!27361 0))(
  ( (V!27362 (val!8415 Int)) )
))
(declare-datatypes ((ValueCell!7928 0))(
  ( (ValueCellFull!7928 (v!10840 V!27361)) (EmptyCell!7928) )
))
(declare-datatypes ((array!49634 0))(
  ( (array!49635 (arr!23848 (Array (_ BitVec 32) ValueCell!7928)) (size!24288 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49634)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!863227 (= res!586583 (and (= (size!24288 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24287 _keys!868) (size!24288 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863228 () Bool)

(declare-fun e!480912 () Bool)

(declare-fun e!480917 () Bool)

(assert (=> b!863228 (= e!480912 (not e!480917))))

(declare-fun res!586592 () Bool)

(assert (=> b!863228 (=> res!586592 e!480917)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863228 (= res!586592 (not (validKeyInArray!0 (select (arr!23847 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11134 0))(
  ( (tuple2!11135 (_1!5578 (_ BitVec 64)) (_2!5578 V!27361)) )
))
(declare-datatypes ((List!16943 0))(
  ( (Nil!16940) (Cons!16939 (h!18070 tuple2!11134) (t!23808 List!16943)) )
))
(declare-datatypes ((ListLongMap!9903 0))(
  ( (ListLongMap!9904 (toList!4967 List!16943)) )
))
(declare-fun lt!390025 () ListLongMap!9903)

(declare-fun lt!390038 () ListLongMap!9903)

(assert (=> b!863228 (= lt!390025 lt!390038)))

(declare-fun lt!390029 () ListLongMap!9903)

(declare-fun lt!390032 () tuple2!11134)

(declare-fun +!2316 (ListLongMap!9903 tuple2!11134) ListLongMap!9903)

(assert (=> b!863228 (= lt!390038 (+!2316 lt!390029 lt!390032))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!390036 () array!49634)

(declare-fun minValue!654 () V!27361)

(declare-fun zeroValue!654 () V!27361)

(declare-fun getCurrentListMapNoExtraKeys!2942 (array!49632 array!49634 (_ BitVec 32) (_ BitVec 32) V!27361 V!27361 (_ BitVec 32) Int) ListLongMap!9903)

(assert (=> b!863228 (= lt!390025 (getCurrentListMapNoExtraKeys!2942 _keys!868 lt!390036 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27361)

(assert (=> b!863228 (= lt!390032 (tuple2!11135 k!854 v!557))))

(assert (=> b!863228 (= lt!390029 (getCurrentListMapNoExtraKeys!2942 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!390031 () Unit!29499)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!524 (array!49632 array!49634 (_ BitVec 32) (_ BitVec 32) V!27361 V!27361 (_ BitVec 32) (_ BitVec 64) V!27361 (_ BitVec 32) Int) Unit!29499)

(assert (=> b!863228 (= lt!390031 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!524 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863230 () Bool)

(declare-fun res!586591 () Bool)

(assert (=> b!863230 (=> (not res!586591) (not e!480913))))

(assert (=> b!863230 (= res!586591 (and (= (select (arr!23847 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863231 () Bool)

(declare-fun e!480911 () Bool)

(assert (=> b!863231 (= e!480917 e!480911)))

(declare-fun res!586584 () Bool)

(assert (=> b!863231 (=> res!586584 e!480911)))

(assert (=> b!863231 (= res!586584 (= k!854 (select (arr!23847 _keys!868) from!1053)))))

(assert (=> b!863231 (not (= (select (arr!23847 _keys!868) from!1053) k!854))))

(declare-fun lt!390035 () Unit!29499)

(assert (=> b!863231 (= lt!390035 e!480916)))

(declare-fun c!92119 () Bool)

(assert (=> b!863231 (= c!92119 (= (select (arr!23847 _keys!868) from!1053) k!854))))

(declare-fun lt!390028 () ListLongMap!9903)

(declare-fun lt!390034 () ListLongMap!9903)

(assert (=> b!863231 (= lt!390028 lt!390034)))

(declare-fun lt!390027 () tuple2!11134)

(assert (=> b!863231 (= lt!390034 (+!2316 lt!390038 lt!390027))))

(declare-fun lt!390039 () V!27361)

(assert (=> b!863231 (= lt!390027 (tuple2!11135 (select (arr!23847 _keys!868) from!1053) lt!390039))))

(declare-fun get!12591 (ValueCell!7928 V!27361) V!27361)

(declare-fun dynLambda!1147 (Int (_ BitVec 64)) V!27361)

(assert (=> b!863231 (= lt!390039 (get!12591 (select (arr!23848 _values!688) from!1053) (dynLambda!1147 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863232 () Bool)

(assert (=> b!863232 (= e!480913 e!480912)))

(declare-fun res!586586 () Bool)

(assert (=> b!863232 (=> (not res!586586) (not e!480912))))

(assert (=> b!863232 (= res!586586 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!863232 (= lt!390028 (getCurrentListMapNoExtraKeys!2942 _keys!868 lt!390036 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863232 (= lt!390036 (array!49635 (store (arr!23848 _values!688) i!612 (ValueCellFull!7928 v!557)) (size!24288 _values!688)))))

(declare-fun lt!390026 () ListLongMap!9903)

(assert (=> b!863232 (= lt!390026 (getCurrentListMapNoExtraKeys!2942 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863233 () Bool)

(declare-fun res!586585 () Bool)

(assert (=> b!863233 (=> (not res!586585) (not e!480913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863233 (= res!586585 (validMask!0 mask!1196))))

(declare-fun b!863234 () Bool)

(declare-fun e!480918 () Bool)

(assert (=> b!863234 (= e!480918 tp_is_empty!16735)))

(declare-fun b!863235 () Bool)

(declare-fun res!586587 () Bool)

(assert (=> b!863235 (=> (not res!586587) (not e!480913))))

(assert (=> b!863235 (= res!586587 (validKeyInArray!0 k!854))))

(declare-fun b!863236 () Bool)

(assert (=> b!863236 (= e!480911 true)))

(assert (=> b!863236 (= lt!390034 (+!2316 (+!2316 lt!390029 lt!390027) lt!390032))))

(declare-fun lt!390030 () Unit!29499)

(declare-fun addCommutativeForDiffKeys!490 (ListLongMap!9903 (_ BitVec 64) V!27361 (_ BitVec 64) V!27361) Unit!29499)

(assert (=> b!863236 (= lt!390030 (addCommutativeForDiffKeys!490 lt!390029 k!854 v!557 (select (arr!23847 _keys!868) from!1053) lt!390039))))

(declare-fun b!863237 () Bool)

(declare-fun e!480919 () Bool)

(declare-fun mapRes!26702 () Bool)

(assert (=> b!863237 (= e!480919 (and e!480914 mapRes!26702))))

(declare-fun condMapEmpty!26702 () Bool)

(declare-fun mapDefault!26702 () ValueCell!7928)

