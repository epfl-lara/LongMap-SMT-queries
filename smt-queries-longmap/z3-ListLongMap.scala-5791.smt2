; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74690 () Bool)

(assert start!74690)

(declare-fun b_free!15339 () Bool)

(declare-fun b_next!15339 () Bool)

(assert (=> start!74690 (= b_free!15339 (not b_next!15339))))

(declare-fun tp!53704 () Bool)

(declare-fun b_and!25297 () Bool)

(assert (=> start!74690 (= tp!53704 b_and!25297)))

(declare-fun b!880470 () Bool)

(declare-fun e!489977 () Bool)

(assert (=> b!880470 (= e!489977 true)))

(declare-datatypes ((array!51292 0))(
  ( (array!51293 (arr!24670 (Array (_ BitVec 32) (_ BitVec 64))) (size!25110 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51292)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((List!17511 0))(
  ( (Nil!17508) (Cons!17507 (h!18638 (_ BitVec 64)) (t!24652 List!17511)) )
))
(declare-fun arrayNoDuplicates!0 (array!51292 (_ BitVec 32) List!17511) Bool)

(assert (=> b!880470 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17508)))

(declare-datatypes ((Unit!30058 0))(
  ( (Unit!30059) )
))
(declare-fun lt!398140 () Unit!30058)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51292 (_ BitVec 32) (_ BitVec 32)) Unit!30058)

(assert (=> b!880470 (= lt!398140 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880471 () Bool)

(declare-fun res!598198 () Bool)

(declare-fun e!489976 () Bool)

(assert (=> b!880471 (=> (not res!598198) (not e!489976))))

(assert (=> b!880471 (= res!598198 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17508))))

(declare-fun b!880472 () Bool)

(declare-fun res!598199 () Bool)

(assert (=> b!880472 (=> (not res!598199) (not e!489976))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!880472 (= res!598199 (and (= (select (arr!24670 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!598204 () Bool)

(assert (=> start!74690 (=> (not res!598204) (not e!489976))))

(assert (=> start!74690 (= res!598204 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25110 _keys!868))))))

(assert (=> start!74690 e!489976))

(declare-fun tp_is_empty!17583 () Bool)

(assert (=> start!74690 tp_is_empty!17583))

(assert (=> start!74690 true))

(assert (=> start!74690 tp!53704))

(declare-fun array_inv!19430 (array!51292) Bool)

(assert (=> start!74690 (array_inv!19430 _keys!868)))

(declare-datatypes ((V!28491 0))(
  ( (V!28492 (val!8839 Int)) )
))
(declare-datatypes ((ValueCell!8352 0))(
  ( (ValueCellFull!8352 (v!11287 V!28491)) (EmptyCell!8352) )
))
(declare-datatypes ((array!51294 0))(
  ( (array!51295 (arr!24671 (Array (_ BitVec 32) ValueCell!8352)) (size!25111 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51294)

(declare-fun e!489978 () Bool)

(declare-fun array_inv!19431 (array!51294) Bool)

(assert (=> start!74690 (and (array_inv!19431 _values!688) e!489978)))

(declare-fun b!880473 () Bool)

(declare-fun e!489974 () Bool)

(declare-fun mapRes!27996 () Bool)

(assert (=> b!880473 (= e!489978 (and e!489974 mapRes!27996))))

(declare-fun condMapEmpty!27996 () Bool)

(declare-fun mapDefault!27996 () ValueCell!8352)

(assert (=> b!880473 (= condMapEmpty!27996 (= (arr!24671 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8352)) mapDefault!27996)))))

(declare-fun b!880474 () Bool)

(assert (=> b!880474 (= e!489974 tp_is_empty!17583)))

(declare-fun b!880475 () Bool)

(declare-fun res!598197 () Bool)

(assert (=> b!880475 (=> (not res!598197) (not e!489976))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880475 (= res!598197 (validMask!0 mask!1196))))

(declare-fun b!880476 () Bool)

(declare-fun e!489973 () Bool)

(declare-fun e!489975 () Bool)

(assert (=> b!880476 (= e!489973 (not e!489975))))

(declare-fun res!598202 () Bool)

(assert (=> b!880476 (=> res!598202 e!489975)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880476 (= res!598202 (not (validKeyInArray!0 (select (arr!24670 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11698 0))(
  ( (tuple2!11699 (_1!5860 (_ BitVec 64)) (_2!5860 V!28491)) )
))
(declare-datatypes ((List!17512 0))(
  ( (Nil!17509) (Cons!17508 (h!18639 tuple2!11698) (t!24653 List!17512)) )
))
(declare-datatypes ((ListLongMap!10467 0))(
  ( (ListLongMap!10468 (toList!5249 List!17512)) )
))
(declare-fun lt!398141 () ListLongMap!10467)

(declare-fun lt!398139 () ListLongMap!10467)

(assert (=> b!880476 (= lt!398141 lt!398139)))

(declare-fun v!557 () V!28491)

(declare-fun lt!398144 () ListLongMap!10467)

(declare-fun +!2521 (ListLongMap!10467 tuple2!11698) ListLongMap!10467)

(assert (=> b!880476 (= lt!398139 (+!2521 lt!398144 (tuple2!11699 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!398143 () array!51294)

(declare-fun minValue!654 () V!28491)

(declare-fun zeroValue!654 () V!28491)

(declare-fun getCurrentListMapNoExtraKeys!3212 (array!51292 array!51294 (_ BitVec 32) (_ BitVec 32) V!28491 V!28491 (_ BitVec 32) Int) ListLongMap!10467)

(assert (=> b!880476 (= lt!398141 (getCurrentListMapNoExtraKeys!3212 _keys!868 lt!398143 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880476 (= lt!398144 (getCurrentListMapNoExtraKeys!3212 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398142 () Unit!30058)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!711 (array!51292 array!51294 (_ BitVec 32) (_ BitVec 32) V!28491 V!28491 (_ BitVec 32) (_ BitVec 64) V!28491 (_ BitVec 32) Int) Unit!30058)

(assert (=> b!880476 (= lt!398142 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!711 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880477 () Bool)

(declare-fun res!598203 () Bool)

(assert (=> b!880477 (=> (not res!598203) (not e!489976))))

(assert (=> b!880477 (= res!598203 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25110 _keys!868))))))

(declare-fun b!880478 () Bool)

(declare-fun res!598201 () Bool)

(assert (=> b!880478 (=> (not res!598201) (not e!489976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51292 (_ BitVec 32)) Bool)

(assert (=> b!880478 (= res!598201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880479 () Bool)

(declare-fun e!489972 () Bool)

(assert (=> b!880479 (= e!489972 tp_is_empty!17583)))

(declare-fun b!880480 () Bool)

(assert (=> b!880480 (= e!489976 e!489973)))

(declare-fun res!598196 () Bool)

(assert (=> b!880480 (=> (not res!598196) (not e!489973))))

(assert (=> b!880480 (= res!598196 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398137 () ListLongMap!10467)

(assert (=> b!880480 (= lt!398137 (getCurrentListMapNoExtraKeys!3212 _keys!868 lt!398143 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880480 (= lt!398143 (array!51295 (store (arr!24671 _values!688) i!612 (ValueCellFull!8352 v!557)) (size!25111 _values!688)))))

(declare-fun lt!398138 () ListLongMap!10467)

(assert (=> b!880480 (= lt!398138 (getCurrentListMapNoExtraKeys!3212 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27996 () Bool)

(assert (=> mapIsEmpty!27996 mapRes!27996))

(declare-fun mapNonEmpty!27996 () Bool)

(declare-fun tp!53705 () Bool)

(assert (=> mapNonEmpty!27996 (= mapRes!27996 (and tp!53705 e!489972))))

(declare-fun mapValue!27996 () ValueCell!8352)

(declare-fun mapRest!27996 () (Array (_ BitVec 32) ValueCell!8352))

(declare-fun mapKey!27996 () (_ BitVec 32))

(assert (=> mapNonEmpty!27996 (= (arr!24671 _values!688) (store mapRest!27996 mapKey!27996 mapValue!27996))))

(declare-fun b!880481 () Bool)

(declare-fun res!598200 () Bool)

(assert (=> b!880481 (=> (not res!598200) (not e!489976))))

(assert (=> b!880481 (= res!598200 (and (= (size!25111 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25110 _keys!868) (size!25111 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880482 () Bool)

(assert (=> b!880482 (= e!489975 e!489977)))

(declare-fun res!598205 () Bool)

(assert (=> b!880482 (=> res!598205 e!489977)))

(assert (=> b!880482 (= res!598205 (not (= (select (arr!24670 _keys!868) from!1053) k0!854)))))

(declare-fun get!12972 (ValueCell!8352 V!28491) V!28491)

(declare-fun dynLambda!1237 (Int (_ BitVec 64)) V!28491)

(assert (=> b!880482 (= lt!398137 (+!2521 lt!398139 (tuple2!11699 (select (arr!24670 _keys!868) from!1053) (get!12972 (select (arr!24671 _values!688) from!1053) (dynLambda!1237 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880483 () Bool)

(declare-fun res!598206 () Bool)

(assert (=> b!880483 (=> (not res!598206) (not e!489976))))

(assert (=> b!880483 (= res!598206 (validKeyInArray!0 k0!854))))

(assert (= (and start!74690 res!598204) b!880475))

(assert (= (and b!880475 res!598197) b!880481))

(assert (= (and b!880481 res!598200) b!880478))

(assert (= (and b!880478 res!598201) b!880471))

(assert (= (and b!880471 res!598198) b!880477))

(assert (= (and b!880477 res!598203) b!880483))

(assert (= (and b!880483 res!598206) b!880472))

(assert (= (and b!880472 res!598199) b!880480))

(assert (= (and b!880480 res!598196) b!880476))

(assert (= (and b!880476 (not res!598202)) b!880482))

(assert (= (and b!880482 (not res!598205)) b!880470))

(assert (= (and b!880473 condMapEmpty!27996) mapIsEmpty!27996))

(assert (= (and b!880473 (not condMapEmpty!27996)) mapNonEmpty!27996))

(get-info :version)

(assert (= (and mapNonEmpty!27996 ((_ is ValueCellFull!8352) mapValue!27996)) b!880479))

(assert (= (and b!880473 ((_ is ValueCellFull!8352) mapDefault!27996)) b!880474))

(assert (= start!74690 b!880473))

(declare-fun b_lambda!12447 () Bool)

(assert (=> (not b_lambda!12447) (not b!880482)))

(declare-fun t!24651 () Bool)

(declare-fun tb!4997 () Bool)

(assert (=> (and start!74690 (= defaultEntry!696 defaultEntry!696) t!24651) tb!4997))

(declare-fun result!9619 () Bool)

(assert (=> tb!4997 (= result!9619 tp_is_empty!17583)))

(assert (=> b!880482 t!24651))

(declare-fun b_and!25299 () Bool)

(assert (= b_and!25297 (and (=> t!24651 result!9619) b_and!25299)))

(declare-fun m!820247 () Bool)

(assert (=> b!880472 m!820247))

(declare-fun m!820249 () Bool)

(assert (=> mapNonEmpty!27996 m!820249))

(declare-fun m!820251 () Bool)

(assert (=> b!880478 m!820251))

(declare-fun m!820253 () Bool)

(assert (=> b!880476 m!820253))

(declare-fun m!820255 () Bool)

(assert (=> b!880476 m!820255))

(declare-fun m!820257 () Bool)

(assert (=> b!880476 m!820257))

(declare-fun m!820259 () Bool)

(assert (=> b!880476 m!820259))

(assert (=> b!880476 m!820257))

(declare-fun m!820261 () Bool)

(assert (=> b!880476 m!820261))

(declare-fun m!820263 () Bool)

(assert (=> b!880476 m!820263))

(declare-fun m!820265 () Bool)

(assert (=> b!880480 m!820265))

(declare-fun m!820267 () Bool)

(assert (=> b!880480 m!820267))

(declare-fun m!820269 () Bool)

(assert (=> b!880480 m!820269))

(declare-fun m!820271 () Bool)

(assert (=> b!880470 m!820271))

(declare-fun m!820273 () Bool)

(assert (=> b!880470 m!820273))

(declare-fun m!820275 () Bool)

(assert (=> b!880471 m!820275))

(declare-fun m!820277 () Bool)

(assert (=> b!880482 m!820277))

(declare-fun m!820279 () Bool)

(assert (=> b!880482 m!820279))

(declare-fun m!820281 () Bool)

(assert (=> b!880482 m!820281))

(declare-fun m!820283 () Bool)

(assert (=> b!880482 m!820283))

(assert (=> b!880482 m!820279))

(assert (=> b!880482 m!820257))

(assert (=> b!880482 m!820281))

(declare-fun m!820285 () Bool)

(assert (=> b!880483 m!820285))

(declare-fun m!820287 () Bool)

(assert (=> start!74690 m!820287))

(declare-fun m!820289 () Bool)

(assert (=> start!74690 m!820289))

(declare-fun m!820291 () Bool)

(assert (=> b!880475 m!820291))

(check-sat (not b!880475) (not b!880480) b_and!25299 (not mapNonEmpty!27996) (not b!880478) (not start!74690) (not b!880470) (not b!880482) tp_is_empty!17583 (not b_next!15339) (not b!880476) (not b_lambda!12447) (not b!880483) (not b!880471))
(check-sat b_and!25299 (not b_next!15339))
