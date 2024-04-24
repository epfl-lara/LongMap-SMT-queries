; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74850 () Bool)

(assert start!74850)

(declare-fun b_free!15331 () Bool)

(declare-fun b_next!15331 () Bool)

(assert (=> start!74850 (= b_free!15331 (not b_next!15331))))

(declare-fun tp!53681 () Bool)

(declare-fun b_and!25291 () Bool)

(assert (=> start!74850 (= tp!53681 b_and!25291)))

(declare-fun res!598408 () Bool)

(declare-fun e!490457 () Bool)

(assert (=> start!74850 (=> (not res!598408) (not e!490457))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51311 0))(
  ( (array!51312 (arr!24675 (Array (_ BitVec 32) (_ BitVec 64))) (size!25116 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51311)

(assert (=> start!74850 (= res!598408 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25116 _keys!868))))))

(assert (=> start!74850 e!490457))

(declare-fun tp_is_empty!17575 () Bool)

(assert (=> start!74850 tp_is_empty!17575))

(assert (=> start!74850 true))

(assert (=> start!74850 tp!53681))

(declare-fun array_inv!19476 (array!51311) Bool)

(assert (=> start!74850 (array_inv!19476 _keys!868)))

(declare-datatypes ((V!28481 0))(
  ( (V!28482 (val!8835 Int)) )
))
(declare-datatypes ((ValueCell!8348 0))(
  ( (ValueCellFull!8348 (v!11283 V!28481)) (EmptyCell!8348) )
))
(declare-datatypes ((array!51313 0))(
  ( (array!51314 (arr!24676 (Array (_ BitVec 32) ValueCell!8348)) (size!25117 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51313)

(declare-fun e!490463 () Bool)

(declare-fun array_inv!19477 (array!51313) Bool)

(assert (=> start!74850 (and (array_inv!19477 _values!688) e!490463)))

(declare-fun b!881197 () Bool)

(declare-fun res!598409 () Bool)

(assert (=> b!881197 (=> (not res!598409) (not e!490457))))

(declare-datatypes ((List!17459 0))(
  ( (Nil!17456) (Cons!17455 (h!18592 (_ BitVec 64)) (t!24584 List!17459)) )
))
(declare-fun arrayNoDuplicates!0 (array!51311 (_ BitVec 32) List!17459) Bool)

(assert (=> b!881197 (= res!598409 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17456))))

(declare-fun mapIsEmpty!27984 () Bool)

(declare-fun mapRes!27984 () Bool)

(assert (=> mapIsEmpty!27984 mapRes!27984))

(declare-fun b!881198 () Bool)

(declare-fun e!490459 () Bool)

(assert (=> b!881198 (= e!490459 true)))

(assert (=> b!881198 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17456)))

(declare-datatypes ((Unit!30030 0))(
  ( (Unit!30031) )
))
(declare-fun lt!398403 () Unit!30030)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51311 (_ BitVec 32) (_ BitVec 32)) Unit!30030)

(assert (=> b!881198 (= lt!398403 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881199 () Bool)

(declare-fun e!490462 () Bool)

(declare-fun e!490458 () Bool)

(assert (=> b!881199 (= e!490462 (not e!490458))))

(declare-fun res!598412 () Bool)

(assert (=> b!881199 (=> res!598412 e!490458)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881199 (= res!598412 (not (validKeyInArray!0 (select (arr!24675 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11630 0))(
  ( (tuple2!11631 (_1!5826 (_ BitVec 64)) (_2!5826 V!28481)) )
))
(declare-datatypes ((List!17460 0))(
  ( (Nil!17457) (Cons!17456 (h!18593 tuple2!11630) (t!24585 List!17460)) )
))
(declare-datatypes ((ListLongMap!10401 0))(
  ( (ListLongMap!10402 (toList!5216 List!17460)) )
))
(declare-fun lt!398404 () ListLongMap!10401)

(declare-fun lt!398405 () ListLongMap!10401)

(assert (=> b!881199 (= lt!398404 lt!398405)))

(declare-fun lt!398406 () ListLongMap!10401)

(declare-fun v!557 () V!28481)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2531 (ListLongMap!10401 tuple2!11630) ListLongMap!10401)

(assert (=> b!881199 (= lt!398405 (+!2531 lt!398406 (tuple2!11631 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28481)

(declare-fun zeroValue!654 () V!28481)

(declare-fun lt!398408 () array!51313)

(declare-fun getCurrentListMapNoExtraKeys!3257 (array!51311 array!51313 (_ BitVec 32) (_ BitVec 32) V!28481 V!28481 (_ BitVec 32) Int) ListLongMap!10401)

(assert (=> b!881199 (= lt!398404 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881199 (= lt!398406 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!398402 () Unit!30030)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!697 (array!51311 array!51313 (_ BitVec 32) (_ BitVec 32) V!28481 V!28481 (_ BitVec 32) (_ BitVec 64) V!28481 (_ BitVec 32) Int) Unit!30030)

(assert (=> b!881199 (= lt!398402 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!697 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27984 () Bool)

(declare-fun tp!53682 () Bool)

(declare-fun e!490461 () Bool)

(assert (=> mapNonEmpty!27984 (= mapRes!27984 (and tp!53682 e!490461))))

(declare-fun mapKey!27984 () (_ BitVec 32))

(declare-fun mapValue!27984 () ValueCell!8348)

(declare-fun mapRest!27984 () (Array (_ BitVec 32) ValueCell!8348))

(assert (=> mapNonEmpty!27984 (= (arr!24676 _values!688) (store mapRest!27984 mapKey!27984 mapValue!27984))))

(declare-fun b!881200 () Bool)

(assert (=> b!881200 (= e!490461 tp_is_empty!17575)))

(declare-fun b!881201 () Bool)

(declare-fun e!490460 () Bool)

(assert (=> b!881201 (= e!490460 tp_is_empty!17575)))

(declare-fun b!881202 () Bool)

(declare-fun res!598414 () Bool)

(assert (=> b!881202 (=> (not res!598414) (not e!490457))))

(assert (=> b!881202 (= res!598414 (and (= (select (arr!24675 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881203 () Bool)

(declare-fun res!598418 () Bool)

(assert (=> b!881203 (=> (not res!598418) (not e!490457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881203 (= res!598418 (validMask!0 mask!1196))))

(declare-fun b!881204 () Bool)

(declare-fun res!598410 () Bool)

(assert (=> b!881204 (=> (not res!598410) (not e!490457))))

(assert (=> b!881204 (= res!598410 (validKeyInArray!0 k0!854))))

(declare-fun b!881205 () Bool)

(assert (=> b!881205 (= e!490463 (and e!490460 mapRes!27984))))

(declare-fun condMapEmpty!27984 () Bool)

(declare-fun mapDefault!27984 () ValueCell!8348)

(assert (=> b!881205 (= condMapEmpty!27984 (= (arr!24676 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8348)) mapDefault!27984)))))

(declare-fun b!881206 () Bool)

(declare-fun res!598413 () Bool)

(assert (=> b!881206 (=> (not res!598413) (not e!490457))))

(assert (=> b!881206 (= res!598413 (and (= (size!25117 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25116 _keys!868) (size!25117 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881207 () Bool)

(declare-fun res!598415 () Bool)

(assert (=> b!881207 (=> (not res!598415) (not e!490457))))

(assert (=> b!881207 (= res!598415 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25116 _keys!868))))))

(declare-fun b!881208 () Bool)

(assert (=> b!881208 (= e!490457 e!490462)))

(declare-fun res!598411 () Bool)

(assert (=> b!881208 (=> (not res!598411) (not e!490462))))

(assert (=> b!881208 (= res!598411 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398407 () ListLongMap!10401)

(assert (=> b!881208 (= lt!398407 (getCurrentListMapNoExtraKeys!3257 _keys!868 lt!398408 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!881208 (= lt!398408 (array!51314 (store (arr!24676 _values!688) i!612 (ValueCellFull!8348 v!557)) (size!25117 _values!688)))))

(declare-fun lt!398409 () ListLongMap!10401)

(assert (=> b!881208 (= lt!398409 (getCurrentListMapNoExtraKeys!3257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881209 () Bool)

(declare-fun res!598417 () Bool)

(assert (=> b!881209 (=> (not res!598417) (not e!490457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51311 (_ BitVec 32)) Bool)

(assert (=> b!881209 (= res!598417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881210 () Bool)

(assert (=> b!881210 (= e!490458 e!490459)))

(declare-fun res!598416 () Bool)

(assert (=> b!881210 (=> res!598416 e!490459)))

(assert (=> b!881210 (= res!598416 (not (= (select (arr!24675 _keys!868) from!1053) k0!854)))))

(declare-fun get!12995 (ValueCell!8348 V!28481) V!28481)

(declare-fun dynLambda!1256 (Int (_ BitVec 64)) V!28481)

(assert (=> b!881210 (= lt!398407 (+!2531 lt!398405 (tuple2!11631 (select (arr!24675 _keys!868) from!1053) (get!12995 (select (arr!24676 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!74850 res!598408) b!881203))

(assert (= (and b!881203 res!598418) b!881206))

(assert (= (and b!881206 res!598413) b!881209))

(assert (= (and b!881209 res!598417) b!881197))

(assert (= (and b!881197 res!598409) b!881207))

(assert (= (and b!881207 res!598415) b!881204))

(assert (= (and b!881204 res!598410) b!881202))

(assert (= (and b!881202 res!598414) b!881208))

(assert (= (and b!881208 res!598411) b!881199))

(assert (= (and b!881199 (not res!598412)) b!881210))

(assert (= (and b!881210 (not res!598416)) b!881198))

(assert (= (and b!881205 condMapEmpty!27984) mapIsEmpty!27984))

(assert (= (and b!881205 (not condMapEmpty!27984)) mapNonEmpty!27984))

(get-info :version)

(assert (= (and mapNonEmpty!27984 ((_ is ValueCellFull!8348) mapValue!27984)) b!881200))

(assert (= (and b!881205 ((_ is ValueCellFull!8348) mapDefault!27984)) b!881201))

(assert (= start!74850 b!881205))

(declare-fun b_lambda!12453 () Bool)

(assert (=> (not b_lambda!12453) (not b!881210)))

(declare-fun t!24583 () Bool)

(declare-fun tb!4981 () Bool)

(assert (=> (and start!74850 (= defaultEntry!696 defaultEntry!696) t!24583) tb!4981))

(declare-fun result!9595 () Bool)

(assert (=> tb!4981 (= result!9595 tp_is_empty!17575)))

(assert (=> b!881210 t!24583))

(declare-fun b_and!25293 () Bool)

(assert (= b_and!25291 (and (=> t!24583 result!9595) b_and!25293)))

(declare-fun m!821357 () Bool)

(assert (=> b!881203 m!821357))

(declare-fun m!821359 () Bool)

(assert (=> start!74850 m!821359))

(declare-fun m!821361 () Bool)

(assert (=> start!74850 m!821361))

(declare-fun m!821363 () Bool)

(assert (=> mapNonEmpty!27984 m!821363))

(declare-fun m!821365 () Bool)

(assert (=> b!881198 m!821365))

(declare-fun m!821367 () Bool)

(assert (=> b!881198 m!821367))

(declare-fun m!821369 () Bool)

(assert (=> b!881210 m!821369))

(declare-fun m!821371 () Bool)

(assert (=> b!881210 m!821371))

(declare-fun m!821373 () Bool)

(assert (=> b!881210 m!821373))

(declare-fun m!821375 () Bool)

(assert (=> b!881210 m!821375))

(assert (=> b!881210 m!821371))

(declare-fun m!821377 () Bool)

(assert (=> b!881210 m!821377))

(assert (=> b!881210 m!821373))

(declare-fun m!821379 () Bool)

(assert (=> b!881209 m!821379))

(declare-fun m!821381 () Bool)

(assert (=> b!881197 m!821381))

(declare-fun m!821383 () Bool)

(assert (=> b!881199 m!821383))

(assert (=> b!881199 m!821377))

(declare-fun m!821385 () Bool)

(assert (=> b!881199 m!821385))

(assert (=> b!881199 m!821377))

(declare-fun m!821387 () Bool)

(assert (=> b!881199 m!821387))

(declare-fun m!821389 () Bool)

(assert (=> b!881199 m!821389))

(declare-fun m!821391 () Bool)

(assert (=> b!881199 m!821391))

(declare-fun m!821393 () Bool)

(assert (=> b!881208 m!821393))

(declare-fun m!821395 () Bool)

(assert (=> b!881208 m!821395))

(declare-fun m!821397 () Bool)

(assert (=> b!881208 m!821397))

(declare-fun m!821399 () Bool)

(assert (=> b!881202 m!821399))

(declare-fun m!821401 () Bool)

(assert (=> b!881204 m!821401))

(check-sat (not b!881208) (not b!881209) (not b!881203) (not b_lambda!12453) (not b!881199) (not b!881204) tp_is_empty!17575 (not b!881198) (not mapNonEmpty!27984) (not b_next!15331) (not b!881210) (not start!74850) (not b!881197) b_and!25293)
(check-sat b_and!25293 (not b_next!15331))
