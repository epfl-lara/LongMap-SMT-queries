; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73852 () Bool)

(assert start!73852)

(declare-fun b_free!14767 () Bool)

(declare-fun b_next!14767 () Bool)

(assert (=> start!73852 (= b_free!14767 (not b_next!14767))))

(declare-fun tp!51805 () Bool)

(declare-fun b_and!24513 () Bool)

(assert (=> start!73852 (= tp!51805 b_and!24513)))

(declare-fun b!867425 () Bool)

(declare-datatypes ((Unit!29758 0))(
  ( (Unit!29759) )
))
(declare-fun e!483184 () Unit!29758)

(declare-fun Unit!29760 () Unit!29758)

(assert (=> b!867425 (= e!483184 Unit!29760)))

(declare-fun lt!394057 () Unit!29758)

(declare-datatypes ((array!49966 0))(
  ( (array!49967 (arr!24014 (Array (_ BitVec 32) (_ BitVec 64))) (size!24454 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49966)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49966 (_ BitVec 32) (_ BitVec 32)) Unit!29758)

(assert (=> b!867425 (= lt!394057 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17074 0))(
  ( (Nil!17071) (Cons!17070 (h!18201 (_ BitVec 64)) (t!24107 List!17074)) )
))
(declare-fun arrayNoDuplicates!0 (array!49966 (_ BitVec 32) List!17074) Bool)

(assert (=> b!867425 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17071)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!394066 () Unit!29758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49966 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29758)

(assert (=> b!867425 (= lt!394066 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867425 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!394063 () Unit!29758)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49966 (_ BitVec 64) (_ BitVec 32) List!17074) Unit!29758)

(assert (=> b!867425 (= lt!394063 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17071))))

(assert (=> b!867425 false))

(declare-fun b!867426 () Bool)

(declare-fun res!589358 () Bool)

(declare-fun e!483179 () Bool)

(assert (=> b!867426 (=> (not res!589358) (not e!483179))))

(assert (=> b!867426 (= res!589358 (and (= (select (arr!24014 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26954 () Bool)

(declare-fun mapRes!26954 () Bool)

(assert (=> mapIsEmpty!26954 mapRes!26954))

(declare-fun b!867427 () Bool)

(declare-fun e!483182 () Bool)

(assert (=> b!867427 (= e!483179 e!483182)))

(declare-fun res!589362 () Bool)

(assert (=> b!867427 (=> (not res!589362) (not e!483182))))

(assert (=> b!867427 (= res!589362 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27585 0))(
  ( (V!27586 (val!8499 Int)) )
))
(declare-fun minValue!654 () V!27585)

(declare-fun zeroValue!654 () V!27585)

(declare-datatypes ((tuple2!11274 0))(
  ( (tuple2!11275 (_1!5648 (_ BitVec 64)) (_2!5648 V!27585)) )
))
(declare-datatypes ((List!17075 0))(
  ( (Nil!17072) (Cons!17071 (h!18202 tuple2!11274) (t!24108 List!17075)) )
))
(declare-datatypes ((ListLongMap!10043 0))(
  ( (ListLongMap!10044 (toList!5037 List!17075)) )
))
(declare-fun lt!394059 () ListLongMap!10043)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8012 0))(
  ( (ValueCellFull!8012 (v!10924 V!27585)) (EmptyCell!8012) )
))
(declare-datatypes ((array!49968 0))(
  ( (array!49969 (arr!24015 (Array (_ BitVec 32) ValueCell!8012)) (size!24455 (_ BitVec 32))) )
))
(declare-fun lt!394065 () array!49968)

(declare-fun getCurrentListMapNoExtraKeys!3006 (array!49966 array!49968 (_ BitVec 32) (_ BitVec 32) V!27585 V!27585 (_ BitVec 32) Int) ListLongMap!10043)

(assert (=> b!867427 (= lt!394059 (getCurrentListMapNoExtraKeys!3006 _keys!868 lt!394065 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27585)

(declare-fun _values!688 () array!49968)

(assert (=> b!867427 (= lt!394065 (array!49969 (store (arr!24015 _values!688) i!612 (ValueCellFull!8012 v!557)) (size!24455 _values!688)))))

(declare-fun lt!394064 () ListLongMap!10043)

(assert (=> b!867427 (= lt!394064 (getCurrentListMapNoExtraKeys!3006 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867429 () Bool)

(declare-fun e!483185 () Bool)

(assert (=> b!867429 (= e!483185 true)))

(declare-fun lt!394061 () ListLongMap!10043)

(declare-fun lt!394058 () ListLongMap!10043)

(declare-fun lt!394068 () tuple2!11274)

(declare-fun lt!394071 () tuple2!11274)

(declare-fun +!2383 (ListLongMap!10043 tuple2!11274) ListLongMap!10043)

(assert (=> b!867429 (= lt!394061 (+!2383 (+!2383 lt!394058 lt!394068) lt!394071))))

(declare-fun lt!394060 () V!27585)

(declare-fun lt!394070 () Unit!29758)

(declare-fun addCommutativeForDiffKeys!548 (ListLongMap!10043 (_ BitVec 64) V!27585 (_ BitVec 64) V!27585) Unit!29758)

(assert (=> b!867429 (= lt!394070 (addCommutativeForDiffKeys!548 lt!394058 k!854 v!557 (select (arr!24014 _keys!868) from!1053) lt!394060))))

(declare-fun mapNonEmpty!26954 () Bool)

(declare-fun tp!51804 () Bool)

(declare-fun e!483183 () Bool)

(assert (=> mapNonEmpty!26954 (= mapRes!26954 (and tp!51804 e!483183))))

(declare-fun mapKey!26954 () (_ BitVec 32))

(declare-fun mapValue!26954 () ValueCell!8012)

(declare-fun mapRest!26954 () (Array (_ BitVec 32) ValueCell!8012))

(assert (=> mapNonEmpty!26954 (= (arr!24015 _values!688) (store mapRest!26954 mapKey!26954 mapValue!26954))))

(declare-fun b!867430 () Bool)

(declare-fun res!589354 () Bool)

(assert (=> b!867430 (=> (not res!589354) (not e!483179))))

(assert (=> b!867430 (= res!589354 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17071))))

(declare-fun b!867431 () Bool)

(declare-fun res!589360 () Bool)

(assert (=> b!867431 (=> (not res!589360) (not e!483179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867431 (= res!589360 (validKeyInArray!0 k!854))))

(declare-fun b!867432 () Bool)

(declare-fun res!589356 () Bool)

(assert (=> b!867432 (=> (not res!589356) (not e!483179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49966 (_ BitVec 32)) Bool)

(assert (=> b!867432 (= res!589356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867433 () Bool)

(declare-fun e!483180 () Bool)

(declare-fun e!483186 () Bool)

(assert (=> b!867433 (= e!483180 (and e!483186 mapRes!26954))))

(declare-fun condMapEmpty!26954 () Bool)

(declare-fun mapDefault!26954 () ValueCell!8012)

