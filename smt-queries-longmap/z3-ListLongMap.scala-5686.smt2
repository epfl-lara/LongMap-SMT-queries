; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74068 () Bool)

(assert start!74068)

(declare-fun b_free!14815 () Bool)

(declare-fun b_next!14815 () Bool)

(assert (=> start!74068 (= b_free!14815 (not b_next!14815))))

(declare-fun tp!51949 () Bool)

(declare-fun b_and!24577 () Bool)

(assert (=> start!74068 (= tp!51949 b_and!24577)))

(declare-fun b!869226 () Bool)

(declare-fun res!590366 () Bool)

(declare-fun e!484217 () Bool)

(assert (=> b!869226 (=> (not res!590366) (not e!484217))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50111 0))(
  ( (array!50112 (arr!24082 (Array (_ BitVec 32) (_ BitVec 64))) (size!24523 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50111)

(assert (=> b!869226 (= res!590366 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24523 _keys!868))))))

(declare-fun mapIsEmpty!27026 () Bool)

(declare-fun mapRes!27026 () Bool)

(assert (=> mapIsEmpty!27026 mapRes!27026))

(declare-fun b!869227 () Bool)

(declare-fun e!484215 () Bool)

(assert (=> b!869227 (= e!484217 e!484215)))

(declare-fun res!590360 () Bool)

(assert (=> b!869227 (=> (not res!590360) (not e!484215))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869227 (= res!590360 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27649 0))(
  ( (V!27650 (val!8523 Int)) )
))
(declare-datatypes ((tuple2!11240 0))(
  ( (tuple2!11241 (_1!5631 (_ BitVec 64)) (_2!5631 V!27649)) )
))
(declare-datatypes ((List!17065 0))(
  ( (Nil!17062) (Cons!17061 (h!18198 tuple2!11240) (t!24094 List!17065)) )
))
(declare-datatypes ((ListLongMap!10011 0))(
  ( (ListLongMap!10012 (toList!5021 List!17065)) )
))
(declare-fun lt!394791 () ListLongMap!10011)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8036 0))(
  ( (ValueCellFull!8036 (v!10948 V!27649)) (EmptyCell!8036) )
))
(declare-datatypes ((array!50113 0))(
  ( (array!50114 (arr!24083 (Array (_ BitVec 32) ValueCell!8036)) (size!24524 (_ BitVec 32))) )
))
(declare-fun lt!394792 () array!50113)

(declare-fun minValue!654 () V!27649)

(declare-fun zeroValue!654 () V!27649)

(declare-fun getCurrentListMapNoExtraKeys!3065 (array!50111 array!50113 (_ BitVec 32) (_ BitVec 32) V!27649 V!27649 (_ BitVec 32) Int) ListLongMap!10011)

(assert (=> b!869227 (= lt!394791 (getCurrentListMapNoExtraKeys!3065 _keys!868 lt!394792 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27649)

(declare-fun _values!688 () array!50113)

(assert (=> b!869227 (= lt!394792 (array!50114 (store (arr!24083 _values!688) i!612 (ValueCellFull!8036 v!557)) (size!24524 _values!688)))))

(declare-fun lt!394790 () ListLongMap!10011)

(assert (=> b!869227 (= lt!394790 (getCurrentListMapNoExtraKeys!3065 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869228 () Bool)

(declare-fun e!484216 () Bool)

(declare-fun e!484218 () Bool)

(assert (=> b!869228 (= e!484216 (and e!484218 mapRes!27026))))

(declare-fun condMapEmpty!27026 () Bool)

(declare-fun mapDefault!27026 () ValueCell!8036)

(assert (=> b!869228 (= condMapEmpty!27026 (= (arr!24083 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8036)) mapDefault!27026)))))

(declare-fun b!869229 () Bool)

(declare-fun res!590361 () Bool)

(assert (=> b!869229 (=> (not res!590361) (not e!484217))))

(assert (=> b!869229 (= res!590361 (and (= (size!24524 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24523 _keys!868) (size!24524 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!590363 () Bool)

(assert (=> start!74068 (=> (not res!590363) (not e!484217))))

(assert (=> start!74068 (= res!590363 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24523 _keys!868))))))

(assert (=> start!74068 e!484217))

(declare-fun tp_is_empty!16951 () Bool)

(assert (=> start!74068 tp_is_empty!16951))

(assert (=> start!74068 true))

(assert (=> start!74068 tp!51949))

(declare-fun array_inv!19080 (array!50111) Bool)

(assert (=> start!74068 (array_inv!19080 _keys!868)))

(declare-fun array_inv!19081 (array!50113) Bool)

(assert (=> start!74068 (and (array_inv!19081 _values!688) e!484216)))

(declare-fun mapNonEmpty!27026 () Bool)

(declare-fun tp!51950 () Bool)

(declare-fun e!484214 () Bool)

(assert (=> mapNonEmpty!27026 (= mapRes!27026 (and tp!51950 e!484214))))

(declare-fun mapKey!27026 () (_ BitVec 32))

(declare-fun mapRest!27026 () (Array (_ BitVec 32) ValueCell!8036))

(declare-fun mapValue!27026 () ValueCell!8036)

(assert (=> mapNonEmpty!27026 (= (arr!24083 _values!688) (store mapRest!27026 mapKey!27026 mapValue!27026))))

(declare-fun b!869230 () Bool)

(declare-fun res!590362 () Bool)

(assert (=> b!869230 (=> (not res!590362) (not e!484217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869230 (= res!590362 (validMask!0 mask!1196))))

(declare-fun b!869231 () Bool)

(declare-fun res!590364 () Bool)

(assert (=> b!869231 (=> (not res!590364) (not e!484217))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869231 (= res!590364 (validKeyInArray!0 k0!854))))

(declare-fun b!869232 () Bool)

(assert (=> b!869232 (= e!484218 tp_is_empty!16951)))

(declare-fun b!869233 () Bool)

(assert (=> b!869233 (= e!484214 tp_is_empty!16951)))

(declare-fun b!869234 () Bool)

(declare-fun res!590368 () Bool)

(assert (=> b!869234 (=> (not res!590368) (not e!484217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50111 (_ BitVec 32)) Bool)

(assert (=> b!869234 (= res!590368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869235 () Bool)

(declare-fun res!590365 () Bool)

(assert (=> b!869235 (=> (not res!590365) (not e!484217))))

(assert (=> b!869235 (= res!590365 (and (= (select (arr!24082 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869236 () Bool)

(assert (=> b!869236 (= e!484215 (not true))))

(declare-fun +!2419 (ListLongMap!10011 tuple2!11240) ListLongMap!10011)

(assert (=> b!869236 (= (getCurrentListMapNoExtraKeys!3065 _keys!868 lt!394792 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2419 (getCurrentListMapNoExtraKeys!3065 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11241 k0!854 v!557)))))

(declare-datatypes ((Unit!29788 0))(
  ( (Unit!29789) )
))
(declare-fun lt!394793 () Unit!29788)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!590 (array!50111 array!50113 (_ BitVec 32) (_ BitVec 32) V!27649 V!27649 (_ BitVec 32) (_ BitVec 64) V!27649 (_ BitVec 32) Int) Unit!29788)

(assert (=> b!869236 (= lt!394793 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!590 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869237 () Bool)

(declare-fun res!590367 () Bool)

(assert (=> b!869237 (=> (not res!590367) (not e!484217))))

(declare-datatypes ((List!17066 0))(
  ( (Nil!17063) (Cons!17062 (h!18199 (_ BitVec 64)) (t!24095 List!17066)) )
))
(declare-fun arrayNoDuplicates!0 (array!50111 (_ BitVec 32) List!17066) Bool)

(assert (=> b!869237 (= res!590367 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17063))))

(assert (= (and start!74068 res!590363) b!869230))

(assert (= (and b!869230 res!590362) b!869229))

(assert (= (and b!869229 res!590361) b!869234))

(assert (= (and b!869234 res!590368) b!869237))

(assert (= (and b!869237 res!590367) b!869226))

(assert (= (and b!869226 res!590366) b!869231))

(assert (= (and b!869231 res!590364) b!869235))

(assert (= (and b!869235 res!590365) b!869227))

(assert (= (and b!869227 res!590360) b!869236))

(assert (= (and b!869228 condMapEmpty!27026) mapIsEmpty!27026))

(assert (= (and b!869228 (not condMapEmpty!27026)) mapNonEmpty!27026))

(get-info :version)

(assert (= (and mapNonEmpty!27026 ((_ is ValueCellFull!8036) mapValue!27026)) b!869233))

(assert (= (and b!869228 ((_ is ValueCellFull!8036) mapDefault!27026)) b!869232))

(assert (= start!74068 b!869228))

(declare-fun m!811337 () Bool)

(assert (=> b!869231 m!811337))

(declare-fun m!811339 () Bool)

(assert (=> b!869236 m!811339))

(declare-fun m!811341 () Bool)

(assert (=> b!869236 m!811341))

(assert (=> b!869236 m!811341))

(declare-fun m!811343 () Bool)

(assert (=> b!869236 m!811343))

(declare-fun m!811345 () Bool)

(assert (=> b!869236 m!811345))

(declare-fun m!811347 () Bool)

(assert (=> b!869237 m!811347))

(declare-fun m!811349 () Bool)

(assert (=> b!869227 m!811349))

(declare-fun m!811351 () Bool)

(assert (=> b!869227 m!811351))

(declare-fun m!811353 () Bool)

(assert (=> b!869227 m!811353))

(declare-fun m!811355 () Bool)

(assert (=> b!869235 m!811355))

(declare-fun m!811357 () Bool)

(assert (=> mapNonEmpty!27026 m!811357))

(declare-fun m!811359 () Bool)

(assert (=> start!74068 m!811359))

(declare-fun m!811361 () Bool)

(assert (=> start!74068 m!811361))

(declare-fun m!811363 () Bool)

(assert (=> b!869234 m!811363))

(declare-fun m!811365 () Bool)

(assert (=> b!869230 m!811365))

(check-sat (not b!869231) (not mapNonEmpty!27026) (not b!869230) (not b!869234) (not b!869227) b_and!24577 (not b!869236) (not b!869237) (not start!74068) tp_is_empty!16951 (not b_next!14815))
(check-sat b_and!24577 (not b_next!14815))
