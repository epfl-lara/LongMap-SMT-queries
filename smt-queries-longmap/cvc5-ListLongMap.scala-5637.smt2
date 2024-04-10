; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73606 () Bool)

(assert start!73606)

(declare-fun b_free!14521 () Bool)

(declare-fun b_next!14521 () Bool)

(assert (=> start!73606 (= b_free!14521 (not b_next!14521))))

(declare-fun tp!51066 () Bool)

(declare-fun b_and!24021 () Bool)

(assert (=> start!73606 (= tp!51066 b_and!24021)))

(declare-fun b!861327 () Bool)

(declare-fun e!479914 () Bool)

(assert (=> b!861327 (= e!479914 true)))

(declare-datatypes ((array!49480 0))(
  ( (array!49481 (arr!23771 (Array (_ BitVec 32) (_ BitVec 64))) (size!24211 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49480)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!861327 (not (= (select (arr!23771 _keys!868) from!1053) k!854))))

(declare-datatypes ((Unit!29374 0))(
  ( (Unit!29375) )
))
(declare-fun lt!388418 () Unit!29374)

(declare-fun e!479911 () Unit!29374)

(assert (=> b!861327 (= lt!388418 e!479911)))

(declare-fun c!92002 () Bool)

(assert (=> b!861327 (= c!92002 (= (select (arr!23771 _keys!868) from!1053) k!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27257 0))(
  ( (V!27258 (val!8376 Int)) )
))
(declare-datatypes ((ValueCell!7889 0))(
  ( (ValueCellFull!7889 (v!10801 V!27257)) (EmptyCell!7889) )
))
(declare-datatypes ((array!49482 0))(
  ( (array!49483 (arr!23772 (Array (_ BitVec 32) ValueCell!7889)) (size!24212 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49482)

(declare-datatypes ((tuple2!11068 0))(
  ( (tuple2!11069 (_1!5545 (_ BitVec 64)) (_2!5545 V!27257)) )
))
(declare-datatypes ((List!16878 0))(
  ( (Nil!16875) (Cons!16874 (h!18005 tuple2!11068) (t!23665 List!16878)) )
))
(declare-datatypes ((ListLongMap!9837 0))(
  ( (ListLongMap!9838 (toList!4934 List!16878)) )
))
(declare-fun lt!388417 () ListLongMap!9837)

(declare-fun lt!388416 () ListLongMap!9837)

(declare-fun +!2285 (ListLongMap!9837 tuple2!11068) ListLongMap!9837)

(declare-fun get!12539 (ValueCell!7889 V!27257) V!27257)

(declare-fun dynLambda!1121 (Int (_ BitVec 64)) V!27257)

(assert (=> b!861327 (= lt!388417 (+!2285 lt!388416 (tuple2!11069 (select (arr!23771 _keys!868) from!1053) (get!12539 (select (arr!23772 _values!688) from!1053) (dynLambda!1121 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861328 () Bool)

(declare-fun res!585351 () Bool)

(declare-fun e!479912 () Bool)

(assert (=> b!861328 (=> (not res!585351) (not e!479912))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861328 (= res!585351 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24211 _keys!868))))))

(declare-fun b!861329 () Bool)

(declare-fun Unit!29376 () Unit!29374)

(assert (=> b!861329 (= e!479911 Unit!29376)))

(declare-fun b!861330 () Bool)

(declare-fun res!585355 () Bool)

(assert (=> b!861330 (=> (not res!585355) (not e!479912))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49480 (_ BitVec 32)) Bool)

(assert (=> b!861330 (= res!585355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861331 () Bool)

(declare-fun Unit!29377 () Unit!29374)

(assert (=> b!861331 (= e!479911 Unit!29377)))

(declare-fun lt!388419 () Unit!29374)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49480 (_ BitVec 32) (_ BitVec 32)) Unit!29374)

(assert (=> b!861331 (= lt!388419 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16879 0))(
  ( (Nil!16876) (Cons!16875 (h!18006 (_ BitVec 64)) (t!23666 List!16879)) )
))
(declare-fun arrayNoDuplicates!0 (array!49480 (_ BitVec 32) List!16879) Bool)

(assert (=> b!861331 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16876)))

(declare-fun lt!388423 () Unit!29374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49480 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29374)

(assert (=> b!861331 (= lt!388423 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861331 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388422 () Unit!29374)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49480 (_ BitVec 64) (_ BitVec 32) List!16879) Unit!29374)

(assert (=> b!861331 (= lt!388422 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16876))))

(assert (=> b!861331 false))

(declare-fun mapIsEmpty!26585 () Bool)

(declare-fun mapRes!26585 () Bool)

(assert (=> mapIsEmpty!26585 mapRes!26585))

(declare-fun mapNonEmpty!26585 () Bool)

(declare-fun tp!51067 () Bool)

(declare-fun e!479910 () Bool)

(assert (=> mapNonEmpty!26585 (= mapRes!26585 (and tp!51067 e!479910))))

(declare-fun mapRest!26585 () (Array (_ BitVec 32) ValueCell!7889))

(declare-fun mapValue!26585 () ValueCell!7889)

(declare-fun mapKey!26585 () (_ BitVec 32))

(assert (=> mapNonEmpty!26585 (= (arr!23772 _values!688) (store mapRest!26585 mapKey!26585 mapValue!26585))))

(declare-fun b!861332 () Bool)

(declare-fun res!585348 () Bool)

(assert (=> b!861332 (=> (not res!585348) (not e!479912))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!861332 (= res!585348 (and (= (size!24212 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24211 _keys!868) (size!24212 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861333 () Bool)

(declare-fun e!479915 () Bool)

(assert (=> b!861333 (= e!479912 e!479915)))

(declare-fun res!585353 () Bool)

(assert (=> b!861333 (=> (not res!585353) (not e!479915))))

(assert (=> b!861333 (= res!585353 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388415 () array!49482)

(declare-fun minValue!654 () V!27257)

(declare-fun zeroValue!654 () V!27257)

(declare-fun getCurrentListMapNoExtraKeys!2911 (array!49480 array!49482 (_ BitVec 32) (_ BitVec 32) V!27257 V!27257 (_ BitVec 32) Int) ListLongMap!9837)

(assert (=> b!861333 (= lt!388417 (getCurrentListMapNoExtraKeys!2911 _keys!868 lt!388415 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27257)

(assert (=> b!861333 (= lt!388415 (array!49483 (store (arr!23772 _values!688) i!612 (ValueCellFull!7889 v!557)) (size!24212 _values!688)))))

(declare-fun lt!388414 () ListLongMap!9837)

(assert (=> b!861333 (= lt!388414 (getCurrentListMapNoExtraKeys!2911 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861334 () Bool)

(declare-fun e!479916 () Bool)

(declare-fun e!479917 () Bool)

(assert (=> b!861334 (= e!479916 (and e!479917 mapRes!26585))))

(declare-fun condMapEmpty!26585 () Bool)

(declare-fun mapDefault!26585 () ValueCell!7889)

