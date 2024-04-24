; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74074 () Bool)

(assert start!74074)

(declare-fun b_free!14821 () Bool)

(declare-fun b_next!14821 () Bool)

(assert (=> start!74074 (= b_free!14821 (not b_next!14821))))

(declare-fun tp!51968 () Bool)

(declare-fun b_and!24583 () Bool)

(assert (=> start!74074 (= tp!51968 b_and!24583)))

(declare-fun b!869334 () Bool)

(declare-fun e!484270 () Bool)

(declare-fun tp_is_empty!16957 () Bool)

(assert (=> b!869334 (= e!484270 tp_is_empty!16957)))

(declare-fun b!869335 () Bool)

(declare-fun res!590447 () Bool)

(declare-fun e!484273 () Bool)

(assert (=> b!869335 (=> (not res!590447) (not e!484273))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50123 0))(
  ( (array!50124 (arr!24088 (Array (_ BitVec 32) (_ BitVec 64))) (size!24529 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50123)

(declare-datatypes ((V!27657 0))(
  ( (V!27658 (val!8526 Int)) )
))
(declare-datatypes ((ValueCell!8039 0))(
  ( (ValueCellFull!8039 (v!10951 V!27657)) (EmptyCell!8039) )
))
(declare-datatypes ((array!50125 0))(
  ( (array!50126 (arr!24089 (Array (_ BitVec 32) ValueCell!8039)) (size!24530 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50125)

(assert (=> b!869335 (= res!590447 (and (= (size!24530 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24529 _keys!868) (size!24530 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869336 () Bool)

(declare-fun res!590441 () Bool)

(assert (=> b!869336 (=> (not res!590441) (not e!484273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869336 (= res!590441 (validMask!0 mask!1196))))

(declare-fun res!590446 () Bool)

(assert (=> start!74074 (=> (not res!590446) (not e!484273))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74074 (= res!590446 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24529 _keys!868))))))

(assert (=> start!74074 e!484273))

(assert (=> start!74074 tp_is_empty!16957))

(assert (=> start!74074 true))

(assert (=> start!74074 tp!51968))

(declare-fun array_inv!19082 (array!50123) Bool)

(assert (=> start!74074 (array_inv!19082 _keys!868)))

(declare-fun e!484269 () Bool)

(declare-fun array_inv!19083 (array!50125) Bool)

(assert (=> start!74074 (and (array_inv!19083 _values!688) e!484269)))

(declare-fun b!869337 () Bool)

(declare-fun res!590443 () Bool)

(assert (=> b!869337 (=> (not res!590443) (not e!484273))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869337 (= res!590443 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24529 _keys!868))))))

(declare-fun b!869338 () Bool)

(declare-fun res!590448 () Bool)

(assert (=> b!869338 (=> (not res!590448) (not e!484273))))

(declare-datatypes ((List!17069 0))(
  ( (Nil!17066) (Cons!17065 (h!18202 (_ BitVec 64)) (t!24098 List!17069)) )
))
(declare-fun arrayNoDuplicates!0 (array!50123 (_ BitVec 32) List!17069) Bool)

(assert (=> b!869338 (= res!590448 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17066))))

(declare-fun mapNonEmpty!27035 () Bool)

(declare-fun mapRes!27035 () Bool)

(declare-fun tp!51967 () Bool)

(declare-fun e!484268 () Bool)

(assert (=> mapNonEmpty!27035 (= mapRes!27035 (and tp!51967 e!484268))))

(declare-fun mapKey!27035 () (_ BitVec 32))

(declare-fun mapValue!27035 () ValueCell!8039)

(declare-fun mapRest!27035 () (Array (_ BitVec 32) ValueCell!8039))

(assert (=> mapNonEmpty!27035 (= (arr!24089 _values!688) (store mapRest!27035 mapKey!27035 mapValue!27035))))

(declare-fun b!869339 () Bool)

(declare-fun e!484271 () Bool)

(assert (=> b!869339 (= e!484273 e!484271)))

(declare-fun res!590442 () Bool)

(assert (=> b!869339 (=> (not res!590442) (not e!484271))))

(assert (=> b!869339 (= res!590442 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11244 0))(
  ( (tuple2!11245 (_1!5633 (_ BitVec 64)) (_2!5633 V!27657)) )
))
(declare-datatypes ((List!17070 0))(
  ( (Nil!17067) (Cons!17066 (h!18203 tuple2!11244) (t!24099 List!17070)) )
))
(declare-datatypes ((ListLongMap!10015 0))(
  ( (ListLongMap!10016 (toList!5023 List!17070)) )
))
(declare-fun lt!394826 () ListLongMap!10015)

(declare-fun lt!394828 () array!50125)

(declare-fun minValue!654 () V!27657)

(declare-fun zeroValue!654 () V!27657)

(declare-fun getCurrentListMapNoExtraKeys!3067 (array!50123 array!50125 (_ BitVec 32) (_ BitVec 32) V!27657 V!27657 (_ BitVec 32) Int) ListLongMap!10015)

(assert (=> b!869339 (= lt!394826 (getCurrentListMapNoExtraKeys!3067 _keys!868 lt!394828 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27657)

(assert (=> b!869339 (= lt!394828 (array!50126 (store (arr!24089 _values!688) i!612 (ValueCellFull!8039 v!557)) (size!24530 _values!688)))))

(declare-fun lt!394827 () ListLongMap!10015)

(assert (=> b!869339 (= lt!394827 (getCurrentListMapNoExtraKeys!3067 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869340 () Bool)

(assert (=> b!869340 (= e!484268 tp_is_empty!16957)))

(declare-fun b!869341 () Bool)

(declare-fun res!590449 () Bool)

(assert (=> b!869341 (=> (not res!590449) (not e!484273))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!869341 (= res!590449 (and (= (select (arr!24088 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869342 () Bool)

(assert (=> b!869342 (= e!484271 (not true))))

(declare-fun +!2420 (ListLongMap!10015 tuple2!11244) ListLongMap!10015)

(assert (=> b!869342 (= (getCurrentListMapNoExtraKeys!3067 _keys!868 lt!394828 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2420 (getCurrentListMapNoExtraKeys!3067 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11245 k0!854 v!557)))))

(declare-datatypes ((Unit!29790 0))(
  ( (Unit!29791) )
))
(declare-fun lt!394829 () Unit!29790)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!591 (array!50123 array!50125 (_ BitVec 32) (_ BitVec 32) V!27657 V!27657 (_ BitVec 32) (_ BitVec 64) V!27657 (_ BitVec 32) Int) Unit!29790)

(assert (=> b!869342 (= lt!394829 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!591 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869343 () Bool)

(declare-fun res!590444 () Bool)

(assert (=> b!869343 (=> (not res!590444) (not e!484273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869343 (= res!590444 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27035 () Bool)

(assert (=> mapIsEmpty!27035 mapRes!27035))

(declare-fun b!869344 () Bool)

(assert (=> b!869344 (= e!484269 (and e!484270 mapRes!27035))))

(declare-fun condMapEmpty!27035 () Bool)

(declare-fun mapDefault!27035 () ValueCell!8039)

(assert (=> b!869344 (= condMapEmpty!27035 (= (arr!24089 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8039)) mapDefault!27035)))))

(declare-fun b!869345 () Bool)

(declare-fun res!590445 () Bool)

(assert (=> b!869345 (=> (not res!590445) (not e!484273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50123 (_ BitVec 32)) Bool)

(assert (=> b!869345 (= res!590445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74074 res!590446) b!869336))

(assert (= (and b!869336 res!590441) b!869335))

(assert (= (and b!869335 res!590447) b!869345))

(assert (= (and b!869345 res!590445) b!869338))

(assert (= (and b!869338 res!590448) b!869337))

(assert (= (and b!869337 res!590443) b!869343))

(assert (= (and b!869343 res!590444) b!869341))

(assert (= (and b!869341 res!590449) b!869339))

(assert (= (and b!869339 res!590442) b!869342))

(assert (= (and b!869344 condMapEmpty!27035) mapIsEmpty!27035))

(assert (= (and b!869344 (not condMapEmpty!27035)) mapNonEmpty!27035))

(get-info :version)

(assert (= (and mapNonEmpty!27035 ((_ is ValueCellFull!8039) mapValue!27035)) b!869340))

(assert (= (and b!869344 ((_ is ValueCellFull!8039) mapDefault!27035)) b!869334))

(assert (= start!74074 b!869344))

(declare-fun m!811427 () Bool)

(assert (=> b!869338 m!811427))

(declare-fun m!811429 () Bool)

(assert (=> start!74074 m!811429))

(declare-fun m!811431 () Bool)

(assert (=> start!74074 m!811431))

(declare-fun m!811433 () Bool)

(assert (=> mapNonEmpty!27035 m!811433))

(declare-fun m!811435 () Bool)

(assert (=> b!869336 m!811435))

(declare-fun m!811437 () Bool)

(assert (=> b!869343 m!811437))

(declare-fun m!811439 () Bool)

(assert (=> b!869341 m!811439))

(declare-fun m!811441 () Bool)

(assert (=> b!869342 m!811441))

(declare-fun m!811443 () Bool)

(assert (=> b!869342 m!811443))

(assert (=> b!869342 m!811443))

(declare-fun m!811445 () Bool)

(assert (=> b!869342 m!811445))

(declare-fun m!811447 () Bool)

(assert (=> b!869342 m!811447))

(declare-fun m!811449 () Bool)

(assert (=> b!869345 m!811449))

(declare-fun m!811451 () Bool)

(assert (=> b!869339 m!811451))

(declare-fun m!811453 () Bool)

(assert (=> b!869339 m!811453))

(declare-fun m!811455 () Bool)

(assert (=> b!869339 m!811455))

(check-sat (not start!74074) tp_is_empty!16957 (not b!869336) (not b!869338) (not b!869345) (not b!869339) b_and!24583 (not b!869342) (not b!869343) (not b_next!14821) (not mapNonEmpty!27035))
(check-sat b_and!24583 (not b_next!14821))
