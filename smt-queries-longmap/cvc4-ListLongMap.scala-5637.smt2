; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73610 () Bool)

(assert start!73610)

(declare-fun b_free!14525 () Bool)

(declare-fun b_next!14525 () Bool)

(assert (=> start!73610 (= b_free!14525 (not b_next!14525))))

(declare-fun tp!51079 () Bool)

(declare-fun b_and!24029 () Bool)

(assert (=> start!73610 (= tp!51079 b_and!24029)))

(declare-fun b!861421 () Bool)

(declare-datatypes ((Unit!29382 0))(
  ( (Unit!29383) )
))
(declare-fun e!479959 () Unit!29382)

(declare-fun Unit!29384 () Unit!29382)

(assert (=> b!861421 (= e!479959 Unit!29384)))

(declare-fun b!861422 () Bool)

(declare-fun res!585410 () Bool)

(declare-fun e!479963 () Bool)

(assert (=> b!861422 (=> (not res!585410) (not e!479963))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49488 0))(
  ( (array!49489 (arr!23775 (Array (_ BitVec 32) (_ BitVec 64))) (size!24215 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49488)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861422 (= res!585410 (and (= (select (arr!23775 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!861423 () Bool)

(declare-fun res!585411 () Bool)

(assert (=> b!861423 (=> (not res!585411) (not e!479963))))

(assert (=> b!861423 (= res!585411 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24215 _keys!868))))))

(declare-fun b!861424 () Bool)

(declare-fun e!479964 () Bool)

(declare-fun tp_is_empty!16661 () Bool)

(assert (=> b!861424 (= e!479964 tp_is_empty!16661)))

(declare-fun b!861425 () Bool)

(declare-fun e!479960 () Bool)

(assert (=> b!861425 (= e!479960 true)))

(assert (=> b!861425 (not (= (select (arr!23775 _keys!868) from!1053) k!854))))

(declare-fun lt!388487 () Unit!29382)

(assert (=> b!861425 (= lt!388487 e!479959)))

(declare-fun c!92008 () Bool)

(assert (=> b!861425 (= c!92008 (= (select (arr!23775 _keys!868) from!1053) k!854))))

(declare-datatypes ((V!27261 0))(
  ( (V!27262 (val!8378 Int)) )
))
(declare-datatypes ((tuple2!11072 0))(
  ( (tuple2!11073 (_1!5547 (_ BitVec 64)) (_2!5547 V!27261)) )
))
(declare-datatypes ((List!16882 0))(
  ( (Nil!16879) (Cons!16878 (h!18009 tuple2!11072) (t!23673 List!16882)) )
))
(declare-datatypes ((ListLongMap!9841 0))(
  ( (ListLongMap!9842 (toList!4936 List!16882)) )
))
(declare-fun lt!388482 () ListLongMap!9841)

(declare-datatypes ((ValueCell!7891 0))(
  ( (ValueCellFull!7891 (v!10803 V!27261)) (EmptyCell!7891) )
))
(declare-datatypes ((array!49490 0))(
  ( (array!49491 (arr!23776 (Array (_ BitVec 32) ValueCell!7891)) (size!24216 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49490)

(declare-fun lt!388485 () ListLongMap!9841)

(declare-fun defaultEntry!696 () Int)

(declare-fun +!2287 (ListLongMap!9841 tuple2!11072) ListLongMap!9841)

(declare-fun get!12541 (ValueCell!7891 V!27261) V!27261)

(declare-fun dynLambda!1123 (Int (_ BitVec 64)) V!27261)

(assert (=> b!861425 (= lt!388482 (+!2287 lt!388485 (tuple2!11073 (select (arr!23775 _keys!868) from!1053) (get!12541 (select (arr!23776 _values!688) from!1053) (dynLambda!1123 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861426 () Bool)

(declare-fun res!585416 () Bool)

(assert (=> b!861426 (=> (not res!585416) (not e!479963))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861426 (= res!585416 (validMask!0 mask!1196))))

(declare-fun b!861427 () Bool)

(declare-fun res!585407 () Bool)

(assert (=> b!861427 (=> (not res!585407) (not e!479963))))

(declare-datatypes ((List!16883 0))(
  ( (Nil!16880) (Cons!16879 (h!18010 (_ BitVec 64)) (t!23674 List!16883)) )
))
(declare-fun arrayNoDuplicates!0 (array!49488 (_ BitVec 32) List!16883) Bool)

(assert (=> b!861427 (= res!585407 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16880))))

(declare-fun mapIsEmpty!26591 () Bool)

(declare-fun mapRes!26591 () Bool)

(assert (=> mapIsEmpty!26591 mapRes!26591))

(declare-fun b!861428 () Bool)

(declare-fun e!479965 () Bool)

(assert (=> b!861428 (= e!479963 e!479965)))

(declare-fun res!585414 () Bool)

(assert (=> b!861428 (=> (not res!585414) (not e!479965))))

(assert (=> b!861428 (= res!585414 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388481 () array!49490)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27261)

(declare-fun zeroValue!654 () V!27261)

(declare-fun getCurrentListMapNoExtraKeys!2913 (array!49488 array!49490 (_ BitVec 32) (_ BitVec 32) V!27261 V!27261 (_ BitVec 32) Int) ListLongMap!9841)

(assert (=> b!861428 (= lt!388482 (getCurrentListMapNoExtraKeys!2913 _keys!868 lt!388481 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27261)

(assert (=> b!861428 (= lt!388481 (array!49491 (store (arr!23776 _values!688) i!612 (ValueCellFull!7891 v!557)) (size!24216 _values!688)))))

(declare-fun lt!388489 () ListLongMap!9841)

(assert (=> b!861428 (= lt!388489 (getCurrentListMapNoExtraKeys!2913 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861429 () Bool)

(assert (=> b!861429 (= e!479965 (not e!479960))))

(declare-fun res!585415 () Bool)

(assert (=> b!861429 (=> res!585415 e!479960)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861429 (= res!585415 (not (validKeyInArray!0 (select (arr!23775 _keys!868) from!1053))))))

(declare-fun lt!388479 () ListLongMap!9841)

(assert (=> b!861429 (= lt!388479 lt!388485)))

(declare-fun lt!388480 () ListLongMap!9841)

(assert (=> b!861429 (= lt!388485 (+!2287 lt!388480 (tuple2!11073 k!854 v!557)))))

(assert (=> b!861429 (= lt!388479 (getCurrentListMapNoExtraKeys!2913 _keys!868 lt!388481 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861429 (= lt!388480 (getCurrentListMapNoExtraKeys!2913 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388486 () Unit!29382)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!498 (array!49488 array!49490 (_ BitVec 32) (_ BitVec 32) V!27261 V!27261 (_ BitVec 32) (_ BitVec 64) V!27261 (_ BitVec 32) Int) Unit!29382)

(assert (=> b!861429 (= lt!388486 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!498 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861430 () Bool)

(declare-fun res!585408 () Bool)

(assert (=> b!861430 (=> (not res!585408) (not e!479963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49488 (_ BitVec 32)) Bool)

(assert (=> b!861430 (= res!585408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!585409 () Bool)

(assert (=> start!73610 (=> (not res!585409) (not e!479963))))

(assert (=> start!73610 (= res!585409 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24215 _keys!868))))))

(assert (=> start!73610 e!479963))

(assert (=> start!73610 tp_is_empty!16661))

(assert (=> start!73610 true))

(assert (=> start!73610 tp!51079))

(declare-fun array_inv!18816 (array!49488) Bool)

(assert (=> start!73610 (array_inv!18816 _keys!868)))

(declare-fun e!479958 () Bool)

(declare-fun array_inv!18817 (array!49490) Bool)

(assert (=> start!73610 (and (array_inv!18817 _values!688) e!479958)))

(declare-fun b!861431 () Bool)

(declare-fun e!479961 () Bool)

(assert (=> b!861431 (= e!479961 tp_is_empty!16661)))

(declare-fun mapNonEmpty!26591 () Bool)

(declare-fun tp!51078 () Bool)

(assert (=> mapNonEmpty!26591 (= mapRes!26591 (and tp!51078 e!479964))))

(declare-fun mapKey!26591 () (_ BitVec 32))

(declare-fun mapValue!26591 () ValueCell!7891)

(declare-fun mapRest!26591 () (Array (_ BitVec 32) ValueCell!7891))

(assert (=> mapNonEmpty!26591 (= (arr!23776 _values!688) (store mapRest!26591 mapKey!26591 mapValue!26591))))

(declare-fun b!861432 () Bool)

(declare-fun Unit!29385 () Unit!29382)

(assert (=> b!861432 (= e!479959 Unit!29385)))

(declare-fun lt!388488 () Unit!29382)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49488 (_ BitVec 32) (_ BitVec 32)) Unit!29382)

(assert (=> b!861432 (= lt!388488 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861432 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16880)))

(declare-fun lt!388483 () Unit!29382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29382)

(assert (=> b!861432 (= lt!388483 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861432 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388484 () Unit!29382)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49488 (_ BitVec 64) (_ BitVec 32) List!16883) Unit!29382)

(assert (=> b!861432 (= lt!388484 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16880))))

(assert (=> b!861432 false))

(declare-fun b!861433 () Bool)

(declare-fun res!585412 () Bool)

(assert (=> b!861433 (=> (not res!585412) (not e!479963))))

(assert (=> b!861433 (= res!585412 (and (= (size!24216 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24215 _keys!868) (size!24216 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861434 () Bool)

(declare-fun res!585413 () Bool)

(assert (=> b!861434 (=> (not res!585413) (not e!479963))))

(assert (=> b!861434 (= res!585413 (validKeyInArray!0 k!854))))

(declare-fun b!861435 () Bool)

(assert (=> b!861435 (= e!479958 (and e!479961 mapRes!26591))))

(declare-fun condMapEmpty!26591 () Bool)

(declare-fun mapDefault!26591 () ValueCell!7891)

