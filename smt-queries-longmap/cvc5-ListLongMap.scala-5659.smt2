; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73738 () Bool)

(assert start!73738)

(declare-fun b_free!14653 () Bool)

(declare-fun b_next!14653 () Bool)

(assert (=> start!73738 (= b_free!14653 (not b_next!14653))))

(declare-fun tp!51463 () Bool)

(declare-fun b_and!24285 () Bool)

(assert (=> start!73738 (= tp!51463 b_and!24285)))

(declare-fun b!864575 () Bool)

(declare-fun e!481646 () Bool)

(declare-fun e!481642 () Bool)

(assert (=> b!864575 (= e!481646 e!481642)))

(declare-fun res!587475 () Bool)

(assert (=> b!864575 (=> (not res!587475) (not e!481642))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864575 (= res!587475 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27433 0))(
  ( (V!27434 (val!8442 Int)) )
))
(declare-datatypes ((ValueCell!7955 0))(
  ( (ValueCellFull!7955 (v!10867 V!27433)) (EmptyCell!7955) )
))
(declare-datatypes ((array!49738 0))(
  ( (array!49739 (arr!23900 (Array (_ BitVec 32) ValueCell!7955)) (size!24340 (_ BitVec 32))) )
))
(declare-fun lt!391335 () array!49738)

(declare-datatypes ((tuple2!11180 0))(
  ( (tuple2!11181 (_1!5601 (_ BitVec 64)) (_2!5601 V!27433)) )
))
(declare-datatypes ((List!16985 0))(
  ( (Nil!16982) (Cons!16981 (h!18112 tuple2!11180) (t!23904 List!16985)) )
))
(declare-datatypes ((ListLongMap!9949 0))(
  ( (ListLongMap!9950 (toList!4990 List!16985)) )
))
(declare-fun lt!391328 () ListLongMap!9949)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49740 0))(
  ( (array!49741 (arr!23901 (Array (_ BitVec 32) (_ BitVec 64))) (size!24341 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49740)

(declare-fun minValue!654 () V!27433)

(declare-fun zeroValue!654 () V!27433)

(declare-fun getCurrentListMapNoExtraKeys!2962 (array!49740 array!49738 (_ BitVec 32) (_ BitVec 32) V!27433 V!27433 (_ BitVec 32) Int) ListLongMap!9949)

(assert (=> b!864575 (= lt!391328 (getCurrentListMapNoExtraKeys!2962 _keys!868 lt!391335 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27433)

(declare-fun _values!688 () array!49738)

(assert (=> b!864575 (= lt!391335 (array!49739 (store (arr!23900 _values!688) i!612 (ValueCellFull!7955 v!557)) (size!24340 _values!688)))))

(declare-fun lt!391321 () ListLongMap!9949)

(assert (=> b!864575 (= lt!391321 (getCurrentListMapNoExtraKeys!2962 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26783 () Bool)

(declare-fun mapRes!26783 () Bool)

(declare-fun tp!51462 () Bool)

(declare-fun e!481648 () Bool)

(assert (=> mapNonEmpty!26783 (= mapRes!26783 (and tp!51462 e!481648))))

(declare-fun mapKey!26783 () (_ BitVec 32))

(declare-fun mapRest!26783 () (Array (_ BitVec 32) ValueCell!7955))

(declare-fun mapValue!26783 () ValueCell!7955)

(assert (=> mapNonEmpty!26783 (= (arr!23900 _values!688) (store mapRest!26783 mapKey!26783 mapValue!26783))))

(declare-fun b!864576 () Bool)

(declare-datatypes ((Unit!29583 0))(
  ( (Unit!29584) )
))
(declare-fun e!481640 () Unit!29583)

(declare-fun Unit!29585 () Unit!29583)

(assert (=> b!864576 (= e!481640 Unit!29585)))

(declare-fun b!864577 () Bool)

(declare-fun e!481645 () Bool)

(assert (=> b!864577 (= e!481642 (not e!481645))))

(declare-fun res!587478 () Bool)

(assert (=> b!864577 (=> res!587478 e!481645)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864577 (= res!587478 (not (validKeyInArray!0 (select (arr!23901 _keys!868) from!1053))))))

(declare-fun lt!391330 () ListLongMap!9949)

(declare-fun lt!391327 () ListLongMap!9949)

(assert (=> b!864577 (= lt!391330 lt!391327)))

(declare-fun lt!391336 () ListLongMap!9949)

(declare-fun lt!391334 () tuple2!11180)

(declare-fun +!2339 (ListLongMap!9949 tuple2!11180) ListLongMap!9949)

(assert (=> b!864577 (= lt!391327 (+!2339 lt!391336 lt!391334))))

(assert (=> b!864577 (= lt!391330 (getCurrentListMapNoExtraKeys!2962 _keys!868 lt!391335 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!864577 (= lt!391334 (tuple2!11181 k!854 v!557))))

(assert (=> b!864577 (= lt!391336 (getCurrentListMapNoExtraKeys!2962 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391333 () Unit!29583)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!542 (array!49740 array!49738 (_ BitVec 32) (_ BitVec 32) V!27433 V!27433 (_ BitVec 32) (_ BitVec 64) V!27433 (_ BitVec 32) Int) Unit!29583)

(assert (=> b!864577 (= lt!391333 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!542 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864578 () Bool)

(declare-fun e!481647 () Bool)

(declare-fun e!481644 () Bool)

(assert (=> b!864578 (= e!481647 (and e!481644 mapRes!26783))))

(declare-fun condMapEmpty!26783 () Bool)

(declare-fun mapDefault!26783 () ValueCell!7955)

