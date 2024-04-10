; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73712 () Bool)

(assert start!73712)

(declare-fun b_free!14627 () Bool)

(declare-fun b_next!14627 () Bool)

(assert (=> start!73712 (= b_free!14627 (not b_next!14627))))

(declare-fun tp!51384 () Bool)

(declare-fun b_and!24233 () Bool)

(assert (=> start!73712 (= tp!51384 b_and!24233)))

(declare-fun b!863925 () Bool)

(declare-datatypes ((Unit!29543 0))(
  ( (Unit!29544) )
))
(declare-fun e!481295 () Unit!29543)

(declare-fun Unit!29545 () Unit!29543)

(assert (=> b!863925 (= e!481295 Unit!29545)))

(declare-fun lt!390697 () Unit!29543)

(declare-datatypes ((array!49688 0))(
  ( (array!49689 (arr!23875 (Array (_ BitVec 32) (_ BitVec 64))) (size!24315 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49688)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49688 (_ BitVec 32) (_ BitVec 32)) Unit!29543)

(assert (=> b!863925 (= lt!390697 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16966 0))(
  ( (Nil!16963) (Cons!16962 (h!18093 (_ BitVec 64)) (t!23859 List!16966)) )
))
(declare-fun arrayNoDuplicates!0 (array!49688 (_ BitVec 32) List!16966) Bool)

(assert (=> b!863925 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16963)))

(declare-fun lt!390701 () Unit!29543)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29543)

(assert (=> b!863925 (= lt!390701 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863925 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390703 () Unit!29543)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49688 (_ BitVec 64) (_ BitVec 32) List!16966) Unit!29543)

(assert (=> b!863925 (= lt!390703 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16963))))

(assert (=> b!863925 false))

(declare-fun b!863926 () Bool)

(declare-fun res!587053 () Bool)

(declare-fun e!481294 () Bool)

(assert (=> b!863926 (=> (not res!587053) (not e!481294))))

(assert (=> b!863926 (= res!587053 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16963))))

(declare-fun b!863927 () Bool)

(declare-fun e!481293 () Bool)

(assert (=> b!863927 (= e!481294 e!481293)))

(declare-fun res!587044 () Bool)

(assert (=> b!863927 (=> (not res!587044) (not e!481293))))

(assert (=> b!863927 (= res!587044 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27397 0))(
  ( (V!27398 (val!8429 Int)) )
))
(declare-datatypes ((ValueCell!7942 0))(
  ( (ValueCellFull!7942 (v!10854 V!27397)) (EmptyCell!7942) )
))
(declare-datatypes ((array!49690 0))(
  ( (array!49691 (arr!23876 (Array (_ BitVec 32) ValueCell!7942)) (size!24316 (_ BitVec 32))) )
))
(declare-fun lt!390711 () array!49690)

(declare-datatypes ((tuple2!11160 0))(
  ( (tuple2!11161 (_1!5591 (_ BitVec 64)) (_2!5591 V!27397)) )
))
(declare-datatypes ((List!16967 0))(
  ( (Nil!16964) (Cons!16963 (h!18094 tuple2!11160) (t!23860 List!16967)) )
))
(declare-datatypes ((ListLongMap!9929 0))(
  ( (ListLongMap!9930 (toList!4980 List!16967)) )
))
(declare-fun lt!390706 () ListLongMap!9929)

(declare-fun minValue!654 () V!27397)

(declare-fun zeroValue!654 () V!27397)

(declare-fun getCurrentListMapNoExtraKeys!2954 (array!49688 array!49690 (_ BitVec 32) (_ BitVec 32) V!27397 V!27397 (_ BitVec 32) Int) ListLongMap!9929)

(assert (=> b!863927 (= lt!390706 (getCurrentListMapNoExtraKeys!2954 _keys!868 lt!390711 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27397)

(declare-fun _values!688 () array!49690)

(assert (=> b!863927 (= lt!390711 (array!49691 (store (arr!23876 _values!688) i!612 (ValueCellFull!7942 v!557)) (size!24316 _values!688)))))

(declare-fun lt!390712 () ListLongMap!9929)

(assert (=> b!863927 (= lt!390712 (getCurrentListMapNoExtraKeys!2954 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863928 () Bool)

(declare-fun res!587045 () Bool)

(assert (=> b!863928 (=> (not res!587045) (not e!481294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49688 (_ BitVec 32)) Bool)

(assert (=> b!863928 (= res!587045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863929 () Bool)

(declare-fun res!587051 () Bool)

(assert (=> b!863929 (=> (not res!587051) (not e!481294))))

(assert (=> b!863929 (= res!587051 (and (= (select (arr!23875 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!863930 () Bool)

(declare-fun res!587046 () Bool)

(assert (=> b!863930 (=> (not res!587046) (not e!481294))))

(assert (=> b!863930 (= res!587046 (and (= (size!24316 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24315 _keys!868) (size!24316 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863931 () Bool)

(declare-fun e!481290 () Bool)

(declare-fun e!481297 () Bool)

(assert (=> b!863931 (= e!481290 e!481297)))

(declare-fun res!587050 () Bool)

(assert (=> b!863931 (=> res!587050 e!481297)))

(assert (=> b!863931 (= res!587050 (= k!854 (select (arr!23875 _keys!868) from!1053)))))

(assert (=> b!863931 (not (= (select (arr!23875 _keys!868) from!1053) k!854))))

(declare-fun lt!390702 () Unit!29543)

(assert (=> b!863931 (= lt!390702 e!481295)))

(declare-fun c!92161 () Bool)

(assert (=> b!863931 (= c!92161 (= (select (arr!23875 _keys!868) from!1053) k!854))))

(declare-fun lt!390707 () ListLongMap!9929)

(assert (=> b!863931 (= lt!390706 lt!390707)))

(declare-fun lt!390700 () ListLongMap!9929)

(declare-fun lt!390709 () tuple2!11160)

(declare-fun +!2329 (ListLongMap!9929 tuple2!11160) ListLongMap!9929)

(assert (=> b!863931 (= lt!390707 (+!2329 lt!390700 lt!390709))))

(declare-fun lt!390698 () V!27397)

(assert (=> b!863931 (= lt!390709 (tuple2!11161 (select (arr!23875 _keys!868) from!1053) lt!390698))))

(declare-fun get!12608 (ValueCell!7942 V!27397) V!27397)

(declare-fun dynLambda!1156 (Int (_ BitVec 64)) V!27397)

(assert (=> b!863931 (= lt!390698 (get!12608 (select (arr!23876 _values!688) from!1053) (dynLambda!1156 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863932 () Bool)

(assert (=> b!863932 (= e!481293 (not e!481290))))

(declare-fun res!587049 () Bool)

(assert (=> b!863932 (=> res!587049 e!481290)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863932 (= res!587049 (not (validKeyInArray!0 (select (arr!23875 _keys!868) from!1053))))))

(declare-fun lt!390699 () ListLongMap!9929)

(assert (=> b!863932 (= lt!390699 lt!390700)))

(declare-fun lt!390705 () ListLongMap!9929)

(declare-fun lt!390704 () tuple2!11160)

(assert (=> b!863932 (= lt!390700 (+!2329 lt!390705 lt!390704))))

(assert (=> b!863932 (= lt!390699 (getCurrentListMapNoExtraKeys!2954 _keys!868 lt!390711 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863932 (= lt!390704 (tuple2!11161 k!854 v!557))))

(assert (=> b!863932 (= lt!390705 (getCurrentListMapNoExtraKeys!2954 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390708 () Unit!29543)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!534 (array!49688 array!49690 (_ BitVec 32) (_ BitVec 32) V!27397 V!27397 (_ BitVec 32) (_ BitVec 64) V!27397 (_ BitVec 32) Int) Unit!29543)

(assert (=> b!863932 (= lt!390708 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!534 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!587048 () Bool)

(assert (=> start!73712 (=> (not res!587048) (not e!481294))))

(assert (=> start!73712 (= res!587048 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24315 _keys!868))))))

(assert (=> start!73712 e!481294))

(declare-fun tp_is_empty!16763 () Bool)

(assert (=> start!73712 tp_is_empty!16763))

(assert (=> start!73712 true))

(assert (=> start!73712 tp!51384))

(declare-fun array_inv!18884 (array!49688) Bool)

(assert (=> start!73712 (array_inv!18884 _keys!868)))

(declare-fun e!481291 () Bool)

(declare-fun array_inv!18885 (array!49690) Bool)

(assert (=> start!73712 (and (array_inv!18885 _values!688) e!481291)))

(declare-fun b!863933 () Bool)

(declare-fun e!481292 () Bool)

(assert (=> b!863933 (= e!481292 tp_is_empty!16763)))

(declare-fun b!863934 () Bool)

(declare-fun res!587052 () Bool)

(assert (=> b!863934 (=> (not res!587052) (not e!481294))))

(assert (=> b!863934 (= res!587052 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24315 _keys!868))))))

(declare-fun mapIsEmpty!26744 () Bool)

(declare-fun mapRes!26744 () Bool)

(assert (=> mapIsEmpty!26744 mapRes!26744))

(declare-fun b!863935 () Bool)

(declare-fun res!587054 () Bool)

(assert (=> b!863935 (=> (not res!587054) (not e!481294))))

(assert (=> b!863935 (= res!587054 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!26744 () Bool)

(declare-fun tp!51385 () Bool)

(assert (=> mapNonEmpty!26744 (= mapRes!26744 (and tp!51385 e!481292))))

(declare-fun mapKey!26744 () (_ BitVec 32))

(declare-fun mapValue!26744 () ValueCell!7942)

(declare-fun mapRest!26744 () (Array (_ BitVec 32) ValueCell!7942))

(assert (=> mapNonEmpty!26744 (= (arr!23876 _values!688) (store mapRest!26744 mapKey!26744 mapValue!26744))))

(declare-fun b!863936 () Bool)

(assert (=> b!863936 (= e!481297 true)))

(assert (=> b!863936 (= lt!390707 (+!2329 (+!2329 lt!390705 lt!390709) lt!390704))))

(declare-fun lt!390710 () Unit!29543)

(declare-fun addCommutativeForDiffKeys!502 (ListLongMap!9929 (_ BitVec 64) V!27397 (_ BitVec 64) V!27397) Unit!29543)

(assert (=> b!863936 (= lt!390710 (addCommutativeForDiffKeys!502 lt!390705 k!854 v!557 (select (arr!23875 _keys!868) from!1053) lt!390698))))

(declare-fun b!863937 () Bool)

(declare-fun e!481296 () Bool)

(assert (=> b!863937 (= e!481296 tp_is_empty!16763)))

(declare-fun b!863938 () Bool)

(declare-fun Unit!29546 () Unit!29543)

(assert (=> b!863938 (= e!481295 Unit!29546)))

(declare-fun b!863939 () Bool)

(declare-fun res!587047 () Bool)

(assert (=> b!863939 (=> (not res!587047) (not e!481294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863939 (= res!587047 (validMask!0 mask!1196))))

(declare-fun b!863940 () Bool)

(assert (=> b!863940 (= e!481291 (and e!481296 mapRes!26744))))

(declare-fun condMapEmpty!26744 () Bool)

(declare-fun mapDefault!26744 () ValueCell!7942)

