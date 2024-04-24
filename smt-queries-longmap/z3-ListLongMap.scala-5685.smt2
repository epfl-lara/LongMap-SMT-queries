; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74062 () Bool)

(assert start!74062)

(declare-fun b_free!14809 () Bool)

(declare-fun b_next!14809 () Bool)

(assert (=> start!74062 (= b_free!14809 (not b_next!14809))))

(declare-fun tp!51932 () Bool)

(declare-fun b_and!24571 () Bool)

(assert (=> start!74062 (= tp!51932 b_and!24571)))

(declare-fun b!869118 () Bool)

(declare-fun res!590286 () Bool)

(declare-fun e!484161 () Bool)

(assert (=> b!869118 (=> (not res!590286) (not e!484161))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869118 (= res!590286 (validKeyInArray!0 k0!854))))

(declare-fun b!869119 () Bool)

(declare-fun res!590284 () Bool)

(assert (=> b!869119 (=> (not res!590284) (not e!484161))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50099 0))(
  ( (array!50100 (arr!24076 (Array (_ BitVec 32) (_ BitVec 64))) (size!24517 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50099)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869119 (= res!590284 (and (= (select (arr!24076 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869120 () Bool)

(declare-fun res!590279 () Bool)

(assert (=> b!869120 (=> (not res!590279) (not e!484161))))

(assert (=> b!869120 (= res!590279 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24517 _keys!868))))))

(declare-fun b!869121 () Bool)

(declare-fun res!590287 () Bool)

(assert (=> b!869121 (=> (not res!590287) (not e!484161))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869121 (= res!590287 (validMask!0 mask!1196))))

(declare-fun b!869122 () Bool)

(declare-fun res!590280 () Bool)

(assert (=> b!869122 (=> (not res!590280) (not e!484161))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27641 0))(
  ( (V!27642 (val!8520 Int)) )
))
(declare-datatypes ((ValueCell!8033 0))(
  ( (ValueCellFull!8033 (v!10945 V!27641)) (EmptyCell!8033) )
))
(declare-datatypes ((array!50101 0))(
  ( (array!50102 (arr!24077 (Array (_ BitVec 32) ValueCell!8033)) (size!24518 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50101)

(assert (=> b!869122 (= res!590280 (and (= (size!24518 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24517 _keys!868) (size!24518 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869123 () Bool)

(declare-fun e!484160 () Bool)

(assert (=> b!869123 (= e!484160 (not true))))

(declare-fun lt!394755 () array!50101)

(declare-fun v!557 () V!27641)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27641)

(declare-fun zeroValue!654 () V!27641)

(declare-datatypes ((tuple2!11234 0))(
  ( (tuple2!11235 (_1!5628 (_ BitVec 64)) (_2!5628 V!27641)) )
))
(declare-datatypes ((List!17060 0))(
  ( (Nil!17057) (Cons!17056 (h!18193 tuple2!11234) (t!24089 List!17060)) )
))
(declare-datatypes ((ListLongMap!10005 0))(
  ( (ListLongMap!10006 (toList!5018 List!17060)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3062 (array!50099 array!50101 (_ BitVec 32) (_ BitVec 32) V!27641 V!27641 (_ BitVec 32) Int) ListLongMap!10005)

(declare-fun +!2416 (ListLongMap!10005 tuple2!11234) ListLongMap!10005)

(assert (=> b!869123 (= (getCurrentListMapNoExtraKeys!3062 _keys!868 lt!394755 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2416 (getCurrentListMapNoExtraKeys!3062 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11235 k0!854 v!557)))))

(declare-datatypes ((Unit!29782 0))(
  ( (Unit!29783) )
))
(declare-fun lt!394754 () Unit!29782)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!587 (array!50099 array!50101 (_ BitVec 32) (_ BitVec 32) V!27641 V!27641 (_ BitVec 32) (_ BitVec 64) V!27641 (_ BitVec 32) Int) Unit!29782)

(assert (=> b!869123 (= lt!394754 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!587 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!590285 () Bool)

(assert (=> start!74062 (=> (not res!590285) (not e!484161))))

(assert (=> start!74062 (= res!590285 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24517 _keys!868))))))

(assert (=> start!74062 e!484161))

(declare-fun tp_is_empty!16945 () Bool)

(assert (=> start!74062 tp_is_empty!16945))

(assert (=> start!74062 true))

(assert (=> start!74062 tp!51932))

(declare-fun array_inv!19076 (array!50099) Bool)

(assert (=> start!74062 (array_inv!19076 _keys!868)))

(declare-fun e!484163 () Bool)

(declare-fun array_inv!19077 (array!50101) Bool)

(assert (=> start!74062 (and (array_inv!19077 _values!688) e!484163)))

(declare-fun b!869124 () Bool)

(declare-fun e!484165 () Bool)

(declare-fun mapRes!27017 () Bool)

(assert (=> b!869124 (= e!484163 (and e!484165 mapRes!27017))))

(declare-fun condMapEmpty!27017 () Bool)

(declare-fun mapDefault!27017 () ValueCell!8033)

(assert (=> b!869124 (= condMapEmpty!27017 (= (arr!24077 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8033)) mapDefault!27017)))))

(declare-fun b!869125 () Bool)

(assert (=> b!869125 (= e!484161 e!484160)))

(declare-fun res!590282 () Bool)

(assert (=> b!869125 (=> (not res!590282) (not e!484160))))

(assert (=> b!869125 (= res!590282 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394757 () ListLongMap!10005)

(assert (=> b!869125 (= lt!394757 (getCurrentListMapNoExtraKeys!3062 _keys!868 lt!394755 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869125 (= lt!394755 (array!50102 (store (arr!24077 _values!688) i!612 (ValueCellFull!8033 v!557)) (size!24518 _values!688)))))

(declare-fun lt!394756 () ListLongMap!10005)

(assert (=> b!869125 (= lt!394756 (getCurrentListMapNoExtraKeys!3062 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869126 () Bool)

(declare-fun res!590283 () Bool)

(assert (=> b!869126 (=> (not res!590283) (not e!484161))))

(declare-datatypes ((List!17061 0))(
  ( (Nil!17058) (Cons!17057 (h!18194 (_ BitVec 64)) (t!24090 List!17061)) )
))
(declare-fun arrayNoDuplicates!0 (array!50099 (_ BitVec 32) List!17061) Bool)

(assert (=> b!869126 (= res!590283 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17058))))

(declare-fun b!869127 () Bool)

(declare-fun e!484164 () Bool)

(assert (=> b!869127 (= e!484164 tp_is_empty!16945)))

(declare-fun mapIsEmpty!27017 () Bool)

(assert (=> mapIsEmpty!27017 mapRes!27017))

(declare-fun b!869128 () Bool)

(declare-fun res!590281 () Bool)

(assert (=> b!869128 (=> (not res!590281) (not e!484161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50099 (_ BitVec 32)) Bool)

(assert (=> b!869128 (= res!590281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27017 () Bool)

(declare-fun tp!51931 () Bool)

(assert (=> mapNonEmpty!27017 (= mapRes!27017 (and tp!51931 e!484164))))

(declare-fun mapRest!27017 () (Array (_ BitVec 32) ValueCell!8033))

(declare-fun mapKey!27017 () (_ BitVec 32))

(declare-fun mapValue!27017 () ValueCell!8033)

(assert (=> mapNonEmpty!27017 (= (arr!24077 _values!688) (store mapRest!27017 mapKey!27017 mapValue!27017))))

(declare-fun b!869129 () Bool)

(assert (=> b!869129 (= e!484165 tp_is_empty!16945)))

(assert (= (and start!74062 res!590285) b!869121))

(assert (= (and b!869121 res!590287) b!869122))

(assert (= (and b!869122 res!590280) b!869128))

(assert (= (and b!869128 res!590281) b!869126))

(assert (= (and b!869126 res!590283) b!869120))

(assert (= (and b!869120 res!590279) b!869118))

(assert (= (and b!869118 res!590286) b!869119))

(assert (= (and b!869119 res!590284) b!869125))

(assert (= (and b!869125 res!590282) b!869123))

(assert (= (and b!869124 condMapEmpty!27017) mapIsEmpty!27017))

(assert (= (and b!869124 (not condMapEmpty!27017)) mapNonEmpty!27017))

(get-info :version)

(assert (= (and mapNonEmpty!27017 ((_ is ValueCellFull!8033) mapValue!27017)) b!869127))

(assert (= (and b!869124 ((_ is ValueCellFull!8033) mapDefault!27017)) b!869129))

(assert (= start!74062 b!869124))

(declare-fun m!811247 () Bool)

(assert (=> start!74062 m!811247))

(declare-fun m!811249 () Bool)

(assert (=> start!74062 m!811249))

(declare-fun m!811251 () Bool)

(assert (=> mapNonEmpty!27017 m!811251))

(declare-fun m!811253 () Bool)

(assert (=> b!869118 m!811253))

(declare-fun m!811255 () Bool)

(assert (=> b!869119 m!811255))

(declare-fun m!811257 () Bool)

(assert (=> b!869126 m!811257))

(declare-fun m!811259 () Bool)

(assert (=> b!869125 m!811259))

(declare-fun m!811261 () Bool)

(assert (=> b!869125 m!811261))

(declare-fun m!811263 () Bool)

(assert (=> b!869125 m!811263))

(declare-fun m!811265 () Bool)

(assert (=> b!869123 m!811265))

(declare-fun m!811267 () Bool)

(assert (=> b!869123 m!811267))

(assert (=> b!869123 m!811267))

(declare-fun m!811269 () Bool)

(assert (=> b!869123 m!811269))

(declare-fun m!811271 () Bool)

(assert (=> b!869123 m!811271))

(declare-fun m!811273 () Bool)

(assert (=> b!869121 m!811273))

(declare-fun m!811275 () Bool)

(assert (=> b!869128 m!811275))

(check-sat b_and!24571 (not b!869126) (not b!869121) (not b!869118) (not b!869123) (not b!869128) (not mapNonEmpty!27017) (not start!74062) (not b!869125) tp_is_empty!16945 (not b_next!14809))
(check-sat b_and!24571 (not b_next!14809))
