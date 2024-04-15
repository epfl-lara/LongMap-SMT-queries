; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73882 () Bool)

(assert start!73882)

(declare-fun b_free!14815 () Bool)

(declare-fun b_next!14815 () Bool)

(assert (=> start!73882 (= b_free!14815 (not b_next!14815))))

(declare-fun tp!51950 () Bool)

(declare-fun b_and!24541 () Bool)

(assert (=> start!73882 (= tp!51950 b_and!24541)))

(declare-fun b!868084 () Bool)

(declare-fun e!483484 () Bool)

(declare-fun e!483489 () Bool)

(assert (=> b!868084 (= e!483484 e!483489)))

(declare-fun res!589912 () Bool)

(assert (=> b!868084 (=> (not res!589912) (not e!483489))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868084 (= res!589912 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27649 0))(
  ( (V!27650 (val!8523 Int)) )
))
(declare-datatypes ((ValueCell!8036 0))(
  ( (ValueCellFull!8036 (v!10942 V!27649)) (EmptyCell!8036) )
))
(declare-datatypes ((array!50051 0))(
  ( (array!50052 (arr!24057 (Array (_ BitVec 32) ValueCell!8036)) (size!24499 (_ BitVec 32))) )
))
(declare-fun lt!394196 () array!50051)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50053 0))(
  ( (array!50054 (arr!24058 (Array (_ BitVec 32) (_ BitVec 64))) (size!24500 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50053)

(declare-fun minValue!654 () V!27649)

(declare-fun zeroValue!654 () V!27649)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11338 0))(
  ( (tuple2!11339 (_1!5680 (_ BitVec 64)) (_2!5680 V!27649)) )
))
(declare-datatypes ((List!17124 0))(
  ( (Nil!17121) (Cons!17120 (h!18251 tuple2!11338) (t!24152 List!17124)) )
))
(declare-datatypes ((ListLongMap!10097 0))(
  ( (ListLongMap!10098 (toList!5064 List!17124)) )
))
(declare-fun lt!394193 () ListLongMap!10097)

(declare-fun getCurrentListMapNoExtraKeys!3057 (array!50053 array!50051 (_ BitVec 32) (_ BitVec 32) V!27649 V!27649 (_ BitVec 32) Int) ListLongMap!10097)

(assert (=> b!868084 (= lt!394193 (getCurrentListMapNoExtraKeys!3057 _keys!868 lt!394196 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27649)

(declare-fun _values!688 () array!50051)

(assert (=> b!868084 (= lt!394196 (array!50052 (store (arr!24057 _values!688) i!612 (ValueCellFull!8036 v!557)) (size!24499 _values!688)))))

(declare-fun lt!394195 () ListLongMap!10097)

(assert (=> b!868084 (= lt!394195 (getCurrentListMapNoExtraKeys!3057 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868085 () Bool)

(declare-fun e!483488 () Bool)

(declare-fun e!483485 () Bool)

(declare-fun mapRes!27026 () Bool)

(assert (=> b!868085 (= e!483488 (and e!483485 mapRes!27026))))

(declare-fun condMapEmpty!27026 () Bool)

(declare-fun mapDefault!27026 () ValueCell!8036)

(assert (=> b!868085 (= condMapEmpty!27026 (= (arr!24057 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8036)) mapDefault!27026)))))

(declare-fun b!868086 () Bool)

(declare-fun res!589906 () Bool)

(assert (=> b!868086 (=> (not res!589906) (not e!483484))))

(assert (=> b!868086 (= res!589906 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24500 _keys!868))))))

(declare-fun res!589913 () Bool)

(assert (=> start!73882 (=> (not res!589913) (not e!483484))))

(assert (=> start!73882 (= res!589913 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24500 _keys!868))))))

(assert (=> start!73882 e!483484))

(declare-fun tp_is_empty!16951 () Bool)

(assert (=> start!73882 tp_is_empty!16951))

(assert (=> start!73882 true))

(assert (=> start!73882 tp!51950))

(declare-fun array_inv!19080 (array!50053) Bool)

(assert (=> start!73882 (array_inv!19080 _keys!868)))

(declare-fun array_inv!19081 (array!50051) Bool)

(assert (=> start!73882 (and (array_inv!19081 _values!688) e!483488)))

(declare-fun b!868087 () Bool)

(declare-fun res!589908 () Bool)

(assert (=> b!868087 (=> (not res!589908) (not e!483484))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868087 (= res!589908 (validKeyInArray!0 k0!854))))

(declare-fun b!868088 () Bool)

(declare-fun res!589907 () Bool)

(assert (=> b!868088 (=> (not res!589907) (not e!483484))))

(assert (=> b!868088 (= res!589907 (and (= (size!24499 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24500 _keys!868) (size!24499 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868089 () Bool)

(declare-fun res!589910 () Bool)

(assert (=> b!868089 (=> (not res!589910) (not e!483484))))

(declare-datatypes ((List!17125 0))(
  ( (Nil!17122) (Cons!17121 (h!18252 (_ BitVec 64)) (t!24153 List!17125)) )
))
(declare-fun arrayNoDuplicates!0 (array!50053 (_ BitVec 32) List!17125) Bool)

(assert (=> b!868089 (= res!589910 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17122))))

(declare-fun b!868090 () Bool)

(declare-fun res!589909 () Bool)

(assert (=> b!868090 (=> (not res!589909) (not e!483484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50053 (_ BitVec 32)) Bool)

(assert (=> b!868090 (= res!589909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868091 () Bool)

(declare-fun res!589914 () Bool)

(assert (=> b!868091 (=> (not res!589914) (not e!483484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868091 (= res!589914 (validMask!0 mask!1196))))

(declare-fun b!868092 () Bool)

(declare-fun res!589911 () Bool)

(assert (=> b!868092 (=> (not res!589911) (not e!483484))))

(assert (=> b!868092 (= res!589911 (and (= (select (arr!24058 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868093 () Bool)

(assert (=> b!868093 (= e!483489 (not true))))

(declare-fun +!2428 (ListLongMap!10097 tuple2!11338) ListLongMap!10097)

(assert (=> b!868093 (= (getCurrentListMapNoExtraKeys!3057 _keys!868 lt!394196 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2428 (getCurrentListMapNoExtraKeys!3057 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11339 k0!854 v!557)))))

(declare-datatypes ((Unit!29743 0))(
  ( (Unit!29744) )
))
(declare-fun lt!394194 () Unit!29743)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!596 (array!50053 array!50051 (_ BitVec 32) (_ BitVec 32) V!27649 V!27649 (_ BitVec 32) (_ BitVec 64) V!27649 (_ BitVec 32) Int) Unit!29743)

(assert (=> b!868093 (= lt!394194 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!596 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27026 () Bool)

(declare-fun tp!51949 () Bool)

(declare-fun e!483486 () Bool)

(assert (=> mapNonEmpty!27026 (= mapRes!27026 (and tp!51949 e!483486))))

(declare-fun mapRest!27026 () (Array (_ BitVec 32) ValueCell!8036))

(declare-fun mapValue!27026 () ValueCell!8036)

(declare-fun mapKey!27026 () (_ BitVec 32))

(assert (=> mapNonEmpty!27026 (= (arr!24057 _values!688) (store mapRest!27026 mapKey!27026 mapValue!27026))))

(declare-fun b!868094 () Bool)

(assert (=> b!868094 (= e!483485 tp_is_empty!16951)))

(declare-fun b!868095 () Bool)

(assert (=> b!868095 (= e!483486 tp_is_empty!16951)))

(declare-fun mapIsEmpty!27026 () Bool)

(assert (=> mapIsEmpty!27026 mapRes!27026))

(assert (= (and start!73882 res!589913) b!868091))

(assert (= (and b!868091 res!589914) b!868088))

(assert (= (and b!868088 res!589907) b!868090))

(assert (= (and b!868090 res!589909) b!868089))

(assert (= (and b!868089 res!589910) b!868086))

(assert (= (and b!868086 res!589906) b!868087))

(assert (= (and b!868087 res!589908) b!868092))

(assert (= (and b!868092 res!589911) b!868084))

(assert (= (and b!868084 res!589912) b!868093))

(assert (= (and b!868085 condMapEmpty!27026) mapIsEmpty!27026))

(assert (= (and b!868085 (not condMapEmpty!27026)) mapNonEmpty!27026))

(get-info :version)

(assert (= (and mapNonEmpty!27026 ((_ is ValueCellFull!8036) mapValue!27026)) b!868095))

(assert (= (and b!868085 ((_ is ValueCellFull!8036) mapDefault!27026)) b!868094))

(assert (= start!73882 b!868085))

(declare-fun m!809289 () Bool)

(assert (=> b!868087 m!809289))

(declare-fun m!809291 () Bool)

(assert (=> b!868092 m!809291))

(declare-fun m!809293 () Bool)

(assert (=> b!868093 m!809293))

(declare-fun m!809295 () Bool)

(assert (=> b!868093 m!809295))

(assert (=> b!868093 m!809295))

(declare-fun m!809297 () Bool)

(assert (=> b!868093 m!809297))

(declare-fun m!809299 () Bool)

(assert (=> b!868093 m!809299))

(declare-fun m!809301 () Bool)

(assert (=> b!868091 m!809301))

(declare-fun m!809303 () Bool)

(assert (=> start!73882 m!809303))

(declare-fun m!809305 () Bool)

(assert (=> start!73882 m!809305))

(declare-fun m!809307 () Bool)

(assert (=> b!868084 m!809307))

(declare-fun m!809309 () Bool)

(assert (=> b!868084 m!809309))

(declare-fun m!809311 () Bool)

(assert (=> b!868084 m!809311))

(declare-fun m!809313 () Bool)

(assert (=> mapNonEmpty!27026 m!809313))

(declare-fun m!809315 () Bool)

(assert (=> b!868089 m!809315))

(declare-fun m!809317 () Bool)

(assert (=> b!868090 m!809317))

(check-sat (not b_next!14815) b_and!24541 (not b!868093) (not b!868087) (not mapNonEmpty!27026) (not b!868091) tp_is_empty!16951 (not b!868084) (not b!868089) (not b!868090) (not start!73882))
(check-sat b_and!24541 (not b_next!14815))
