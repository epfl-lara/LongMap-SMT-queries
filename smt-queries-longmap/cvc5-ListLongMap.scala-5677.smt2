; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73846 () Bool)

(assert start!73846)

(declare-fun b_free!14761 () Bool)

(declare-fun b_next!14761 () Bool)

(assert (=> start!73846 (= b_free!14761 (not b_next!14761))))

(declare-fun tp!51787 () Bool)

(declare-fun b_and!24501 () Bool)

(assert (=> start!73846 (= tp!51787 b_and!24501)))

(declare-fun b!867275 () Bool)

(declare-fun res!589263 () Bool)

(declare-fun e!483105 () Bool)

(assert (=> b!867275 (=> (not res!589263) (not e!483105))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49954 0))(
  ( (array!49955 (arr!24008 (Array (_ BitVec 32) (_ BitVec 64))) (size!24448 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49954)

(assert (=> b!867275 (= res!589263 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24448 _keys!868))))))

(declare-fun b!867276 () Bool)

(declare-datatypes ((Unit!29746 0))(
  ( (Unit!29747) )
))
(declare-fun e!483100 () Unit!29746)

(declare-fun Unit!29748 () Unit!29746)

(assert (=> b!867276 (= e!483100 Unit!29748)))

(declare-fun mapNonEmpty!26945 () Bool)

(declare-fun mapRes!26945 () Bool)

(declare-fun tp!51786 () Bool)

(declare-fun e!483103 () Bool)

(assert (=> mapNonEmpty!26945 (= mapRes!26945 (and tp!51786 e!483103))))

(declare-fun mapKey!26945 () (_ BitVec 32))

(declare-datatypes ((V!27577 0))(
  ( (V!27578 (val!8496 Int)) )
))
(declare-datatypes ((ValueCell!8009 0))(
  ( (ValueCellFull!8009 (v!10921 V!27577)) (EmptyCell!8009) )
))
(declare-fun mapValue!26945 () ValueCell!8009)

(declare-datatypes ((array!49956 0))(
  ( (array!49957 (arr!24009 (Array (_ BitVec 32) ValueCell!8009)) (size!24449 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49956)

(declare-fun mapRest!26945 () (Array (_ BitVec 32) ValueCell!8009))

(assert (=> mapNonEmpty!26945 (= (arr!24009 _values!688) (store mapRest!26945 mapKey!26945 mapValue!26945))))

(declare-fun b!867277 () Bool)

(declare-fun Unit!29749 () Unit!29746)

(assert (=> b!867277 (= e!483100 Unit!29749)))

(declare-fun lt!393921 () Unit!29746)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49954 (_ BitVec 32) (_ BitVec 32)) Unit!29746)

(assert (=> b!867277 (= lt!393921 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17069 0))(
  ( (Nil!17066) (Cons!17065 (h!18196 (_ BitVec 64)) (t!24096 List!17069)) )
))
(declare-fun arrayNoDuplicates!0 (array!49954 (_ BitVec 32) List!17069) Bool)

(assert (=> b!867277 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17066)))

(declare-fun lt!393917 () Unit!29746)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49954 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29746)

(assert (=> b!867277 (= lt!393917 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867277 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393925 () Unit!29746)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49954 (_ BitVec 64) (_ BitVec 32) List!17069) Unit!29746)

(assert (=> b!867277 (= lt!393925 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17066))))

(assert (=> b!867277 false))

(declare-fun b!867278 () Bool)

(declare-fun res!589260 () Bool)

(assert (=> b!867278 (=> (not res!589260) (not e!483105))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49954 (_ BitVec 32)) Bool)

(assert (=> b!867278 (= res!589260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867279 () Bool)

(declare-fun res!589256 () Bool)

(assert (=> b!867279 (=> (not res!589256) (not e!483105))))

(assert (=> b!867279 (= res!589256 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17066))))

(declare-fun b!867280 () Bool)

(declare-fun e!483106 () Bool)

(declare-fun e!483099 () Bool)

(assert (=> b!867280 (= e!483106 e!483099)))

(declare-fun res!589264 () Bool)

(assert (=> b!867280 (=> res!589264 e!483099)))

(assert (=> b!867280 (= res!589264 (= k!854 (select (arr!24008 _keys!868) from!1053)))))

(assert (=> b!867280 (not (= (select (arr!24008 _keys!868) from!1053) k!854))))

(declare-fun lt!393913 () Unit!29746)

(assert (=> b!867280 (= lt!393913 e!483100)))

(declare-fun c!92362 () Bool)

(assert (=> b!867280 (= c!92362 (= (select (arr!24008 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11270 0))(
  ( (tuple2!11271 (_1!5646 (_ BitVec 64)) (_2!5646 V!27577)) )
))
(declare-datatypes ((List!17070 0))(
  ( (Nil!17067) (Cons!17066 (h!18197 tuple2!11270) (t!24097 List!17070)) )
))
(declare-datatypes ((ListLongMap!10039 0))(
  ( (ListLongMap!10040 (toList!5035 List!17070)) )
))
(declare-fun lt!393918 () ListLongMap!10039)

(declare-fun lt!393920 () ListLongMap!10039)

(assert (=> b!867280 (= lt!393918 lt!393920)))

(declare-fun lt!393914 () ListLongMap!10039)

(declare-fun lt!393926 () tuple2!11270)

(declare-fun +!2381 (ListLongMap!10039 tuple2!11270) ListLongMap!10039)

(assert (=> b!867280 (= lt!393920 (+!2381 lt!393914 lt!393926))))

(declare-fun lt!393928 () V!27577)

(assert (=> b!867280 (= lt!393926 (tuple2!11271 (select (arr!24008 _keys!868) from!1053) lt!393928))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12697 (ValueCell!8009 V!27577) V!27577)

(declare-fun dynLambda!1199 (Int (_ BitVec 64)) V!27577)

(assert (=> b!867280 (= lt!393928 (get!12697 (select (arr!24009 _values!688) from!1053) (dynLambda!1199 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867281 () Bool)

(declare-fun res!589259 () Bool)

(assert (=> b!867281 (=> (not res!589259) (not e!483105))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!867281 (= res!589259 (and (= (size!24449 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24448 _keys!868) (size!24449 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867282 () Bool)

(declare-fun res!589257 () Bool)

(assert (=> b!867282 (=> (not res!589257) (not e!483105))))

(assert (=> b!867282 (= res!589257 (and (= (select (arr!24008 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!867283 () Bool)

(declare-fun res!589261 () Bool)

(assert (=> b!867283 (=> (not res!589261) (not e!483105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867283 (= res!589261 (validMask!0 mask!1196))))

(declare-fun b!867284 () Bool)

(declare-fun e!483104 () Bool)

(declare-fun tp_is_empty!16897 () Bool)

(assert (=> b!867284 (= e!483104 tp_is_empty!16897)))

(declare-fun b!867285 () Bool)

(declare-fun e!483102 () Bool)

(assert (=> b!867285 (= e!483102 (and e!483104 mapRes!26945))))

(declare-fun condMapEmpty!26945 () Bool)

(declare-fun mapDefault!26945 () ValueCell!8009)

