; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74910 () Bool)

(assert start!74910)

(declare-fun b_free!15429 () Bool)

(declare-fun b_next!15429 () Bool)

(assert (=> start!74910 (= b_free!15429 (not b_next!15429))))

(declare-fun tp!53990 () Bool)

(declare-fun b_and!25557 () Bool)

(assert (=> start!74910 (= tp!53990 b_and!25557)))

(declare-fun b!883273 () Bool)

(declare-fun res!600090 () Bool)

(declare-fun e!491585 () Bool)

(assert (=> b!883273 (=> (not res!600090) (not e!491585))))

(declare-datatypes ((array!51472 0))(
  ( (array!51473 (arr!24755 (Array (_ BitVec 32) (_ BitVec 64))) (size!25195 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51472)

(declare-datatypes ((List!17579 0))(
  ( (Nil!17576) (Cons!17575 (h!18706 (_ BitVec 64)) (t!24810 List!17579)) )
))
(declare-fun arrayNoDuplicates!0 (array!51472 (_ BitVec 32) List!17579) Bool)

(assert (=> b!883273 (= res!600090 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17576))))

(declare-fun b!883274 () Bool)

(declare-fun res!600091 () Bool)

(assert (=> b!883274 (=> (not res!600091) (not e!491585))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28611 0))(
  ( (V!28612 (val!8884 Int)) )
))
(declare-datatypes ((ValueCell!8397 0))(
  ( (ValueCellFull!8397 (v!11353 V!28611)) (EmptyCell!8397) )
))
(declare-datatypes ((array!51474 0))(
  ( (array!51475 (arr!24756 (Array (_ BitVec 32) ValueCell!8397)) (size!25196 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51474)

(assert (=> b!883274 (= res!600091 (and (= (size!25196 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25195 _keys!868) (size!25196 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28146 () Bool)

(declare-fun mapRes!28146 () Bool)

(assert (=> mapIsEmpty!28146 mapRes!28146))

(declare-fun b!883275 () Bool)

(declare-datatypes ((Unit!30125 0))(
  ( (Unit!30126) )
))
(declare-fun e!491582 () Unit!30125)

(declare-fun Unit!30127 () Unit!30125)

(assert (=> b!883275 (= e!491582 Unit!30127)))

(declare-fun b!883276 () Bool)

(declare-fun res!600087 () Bool)

(assert (=> b!883276 (=> (not res!600087) (not e!491585))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883276 (= res!600087 (and (= (select (arr!24755 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883277 () Bool)

(declare-fun res!600092 () Bool)

(assert (=> b!883277 (=> (not res!600092) (not e!491585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883277 (= res!600092 (validMask!0 mask!1196))))

(declare-fun b!883278 () Bool)

(declare-fun e!491580 () Bool)

(declare-fun e!491579 () Bool)

(assert (=> b!883278 (= e!491580 (not e!491579))))

(declare-fun res!600088 () Bool)

(assert (=> b!883278 (=> res!600088 e!491579)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883278 (= res!600088 (not (validKeyInArray!0 (select (arr!24755 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11770 0))(
  ( (tuple2!11771 (_1!5896 (_ BitVec 64)) (_2!5896 V!28611)) )
))
(declare-datatypes ((List!17580 0))(
  ( (Nil!17577) (Cons!17576 (h!18707 tuple2!11770) (t!24811 List!17580)) )
))
(declare-datatypes ((ListLongMap!10539 0))(
  ( (ListLongMap!10540 (toList!5285 List!17580)) )
))
(declare-fun lt!399734 () ListLongMap!10539)

(declare-fun lt!399736 () ListLongMap!10539)

(assert (=> b!883278 (= lt!399734 lt!399736)))

(declare-fun v!557 () V!28611)

(declare-fun lt!399732 () ListLongMap!10539)

(declare-fun +!2554 (ListLongMap!10539 tuple2!11770) ListLongMap!10539)

(assert (=> b!883278 (= lt!399736 (+!2554 lt!399732 (tuple2!11771 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399729 () array!51474)

(declare-fun minValue!654 () V!28611)

(declare-fun zeroValue!654 () V!28611)

(declare-fun getCurrentListMapNoExtraKeys!3245 (array!51472 array!51474 (_ BitVec 32) (_ BitVec 32) V!28611 V!28611 (_ BitVec 32) Int) ListLongMap!10539)

(assert (=> b!883278 (= lt!399734 (getCurrentListMapNoExtraKeys!3245 _keys!868 lt!399729 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883278 (= lt!399732 (getCurrentListMapNoExtraKeys!3245 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399733 () Unit!30125)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!740 (array!51472 array!51474 (_ BitVec 32) (_ BitVec 32) V!28611 V!28611 (_ BitVec 32) (_ BitVec 64) V!28611 (_ BitVec 32) Int) Unit!30125)

(assert (=> b!883278 (= lt!399733 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!740 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883279 () Bool)

(declare-fun res!600084 () Bool)

(assert (=> b!883279 (=> (not res!600084) (not e!491585))))

(assert (=> b!883279 (= res!600084 (validKeyInArray!0 k0!854))))

(declare-fun b!883280 () Bool)

(declare-fun res!600093 () Bool)

(assert (=> b!883280 (=> (not res!600093) (not e!491585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51472 (_ BitVec 32)) Bool)

(assert (=> b!883280 (= res!600093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883281 () Bool)

(declare-fun e!491583 () Bool)

(declare-fun e!491584 () Bool)

(assert (=> b!883281 (= e!491583 (and e!491584 mapRes!28146))))

(declare-fun condMapEmpty!28146 () Bool)

(declare-fun mapDefault!28146 () ValueCell!8397)

(assert (=> b!883281 (= condMapEmpty!28146 (= (arr!24756 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8397)) mapDefault!28146)))))

(declare-fun b!883282 () Bool)

(declare-fun e!491586 () Bool)

(declare-fun tp_is_empty!17673 () Bool)

(assert (=> b!883282 (= e!491586 tp_is_empty!17673)))

(declare-fun b!883283 () Bool)

(assert (=> b!883283 (= e!491585 e!491580)))

(declare-fun res!600085 () Bool)

(assert (=> b!883283 (=> (not res!600085) (not e!491580))))

(assert (=> b!883283 (= res!600085 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399737 () ListLongMap!10539)

(assert (=> b!883283 (= lt!399737 (getCurrentListMapNoExtraKeys!3245 _keys!868 lt!399729 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883283 (= lt!399729 (array!51475 (store (arr!24756 _values!688) i!612 (ValueCellFull!8397 v!557)) (size!25196 _values!688)))))

(declare-fun lt!399727 () ListLongMap!10539)

(assert (=> b!883283 (= lt!399727 (getCurrentListMapNoExtraKeys!3245 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883285 () Bool)

(declare-fun res!600089 () Bool)

(assert (=> b!883285 (=> (not res!600089) (not e!491585))))

(assert (=> b!883285 (= res!600089 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25195 _keys!868))))))

(declare-fun b!883286 () Bool)

(assert (=> b!883286 (= e!491579 (bvslt from!1053 (size!25195 _keys!868)))))

(declare-fun lt!399728 () Unit!30125)

(assert (=> b!883286 (= lt!399728 e!491582)))

(declare-fun c!93049 () Bool)

(assert (=> b!883286 (= c!93049 (= (select (arr!24755 _keys!868) from!1053) k0!854))))

(declare-fun get!13042 (ValueCell!8397 V!28611) V!28611)

(declare-fun dynLambda!1267 (Int (_ BitVec 64)) V!28611)

(assert (=> b!883286 (= lt!399737 (+!2554 lt!399736 (tuple2!11771 (select (arr!24755 _keys!868) from!1053) (get!13042 (select (arr!24756 _values!688) from!1053) (dynLambda!1267 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!28146 () Bool)

(declare-fun tp!53989 () Bool)

(assert (=> mapNonEmpty!28146 (= mapRes!28146 (and tp!53989 e!491586))))

(declare-fun mapValue!28146 () ValueCell!8397)

(declare-fun mapKey!28146 () (_ BitVec 32))

(declare-fun mapRest!28146 () (Array (_ BitVec 32) ValueCell!8397))

(assert (=> mapNonEmpty!28146 (= (arr!24756 _values!688) (store mapRest!28146 mapKey!28146 mapValue!28146))))

(declare-fun b!883287 () Bool)

(assert (=> b!883287 (= e!491584 tp_is_empty!17673)))

(declare-fun res!600086 () Bool)

(assert (=> start!74910 (=> (not res!600086) (not e!491585))))

(assert (=> start!74910 (= res!600086 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25195 _keys!868))))))

(assert (=> start!74910 e!491585))

(assert (=> start!74910 tp_is_empty!17673))

(assert (=> start!74910 true))

(assert (=> start!74910 tp!53990))

(declare-fun array_inv!19492 (array!51472) Bool)

(assert (=> start!74910 (array_inv!19492 _keys!868)))

(declare-fun array_inv!19493 (array!51474) Bool)

(assert (=> start!74910 (and (array_inv!19493 _values!688) e!491583)))

(declare-fun b!883284 () Bool)

(declare-fun Unit!30128 () Unit!30125)

(assert (=> b!883284 (= e!491582 Unit!30128)))

(declare-fun lt!399730 () Unit!30125)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51472 (_ BitVec 32) (_ BitVec 32)) Unit!30125)

(assert (=> b!883284 (= lt!399730 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!883284 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17576)))

(declare-fun lt!399731 () Unit!30125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51472 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30125)

(assert (=> b!883284 (= lt!399731 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883284 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399735 () Unit!30125)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51472 (_ BitVec 64) (_ BitVec 32) List!17579) Unit!30125)

(assert (=> b!883284 (= lt!399735 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17576))))

(assert (=> b!883284 false))

(assert (= (and start!74910 res!600086) b!883277))

(assert (= (and b!883277 res!600092) b!883274))

(assert (= (and b!883274 res!600091) b!883280))

(assert (= (and b!883280 res!600093) b!883273))

(assert (= (and b!883273 res!600090) b!883285))

(assert (= (and b!883285 res!600089) b!883279))

(assert (= (and b!883279 res!600084) b!883276))

(assert (= (and b!883276 res!600087) b!883283))

(assert (= (and b!883283 res!600085) b!883278))

(assert (= (and b!883278 (not res!600088)) b!883286))

(assert (= (and b!883286 c!93049) b!883284))

(assert (= (and b!883286 (not c!93049)) b!883275))

(assert (= (and b!883281 condMapEmpty!28146) mapIsEmpty!28146))

(assert (= (and b!883281 (not condMapEmpty!28146)) mapNonEmpty!28146))

(get-info :version)

(assert (= (and mapNonEmpty!28146 ((_ is ValueCellFull!8397) mapValue!28146)) b!883282))

(assert (= (and b!883281 ((_ is ValueCellFull!8397) mapDefault!28146)) b!883287))

(assert (= start!74910 b!883281))

(declare-fun b_lambda!12707 () Bool)

(assert (=> (not b_lambda!12707) (not b!883286)))

(declare-fun t!24809 () Bool)

(declare-fun tb!5087 () Bool)

(assert (=> (and start!74910 (= defaultEntry!696 defaultEntry!696) t!24809) tb!5087))

(declare-fun result!9809 () Bool)

(assert (=> tb!5087 (= result!9809 tp_is_empty!17673)))

(assert (=> b!883286 t!24809))

(declare-fun b_and!25559 () Bool)

(assert (= b_and!25557 (and (=> t!24809 result!9809) b_and!25559)))

(declare-fun m!823317 () Bool)

(assert (=> mapNonEmpty!28146 m!823317))

(declare-fun m!823319 () Bool)

(assert (=> b!883279 m!823319))

(declare-fun m!823321 () Bool)

(assert (=> b!883277 m!823321))

(declare-fun m!823323 () Bool)

(assert (=> b!883276 m!823323))

(declare-fun m!823325 () Bool)

(assert (=> b!883283 m!823325))

(declare-fun m!823327 () Bool)

(assert (=> b!883283 m!823327))

(declare-fun m!823329 () Bool)

(assert (=> b!883283 m!823329))

(declare-fun m!823331 () Bool)

(assert (=> start!74910 m!823331))

(declare-fun m!823333 () Bool)

(assert (=> start!74910 m!823333))

(declare-fun m!823335 () Bool)

(assert (=> b!883278 m!823335))

(declare-fun m!823337 () Bool)

(assert (=> b!883278 m!823337))

(declare-fun m!823339 () Bool)

(assert (=> b!883278 m!823339))

(assert (=> b!883278 m!823337))

(declare-fun m!823341 () Bool)

(assert (=> b!883278 m!823341))

(declare-fun m!823343 () Bool)

(assert (=> b!883278 m!823343))

(declare-fun m!823345 () Bool)

(assert (=> b!883278 m!823345))

(declare-fun m!823347 () Bool)

(assert (=> b!883286 m!823347))

(declare-fun m!823349 () Bool)

(assert (=> b!883286 m!823349))

(declare-fun m!823351 () Bool)

(assert (=> b!883286 m!823351))

(assert (=> b!883286 m!823347))

(declare-fun m!823353 () Bool)

(assert (=> b!883286 m!823353))

(assert (=> b!883286 m!823337))

(assert (=> b!883286 m!823349))

(declare-fun m!823355 () Bool)

(assert (=> b!883273 m!823355))

(declare-fun m!823357 () Bool)

(assert (=> b!883284 m!823357))

(declare-fun m!823359 () Bool)

(assert (=> b!883284 m!823359))

(declare-fun m!823361 () Bool)

(assert (=> b!883284 m!823361))

(declare-fun m!823363 () Bool)

(assert (=> b!883284 m!823363))

(declare-fun m!823365 () Bool)

(assert (=> b!883284 m!823365))

(declare-fun m!823367 () Bool)

(assert (=> b!883280 m!823367))

(check-sat (not mapNonEmpty!28146) (not b!883280) (not start!74910) (not b!883278) (not b!883284) (not b!883286) (not b!883277) (not b!883279) (not b_lambda!12707) (not b!883273) (not b_next!15429) b_and!25559 tp_is_empty!17673 (not b!883283))
(check-sat b_and!25559 (not b_next!15429))
