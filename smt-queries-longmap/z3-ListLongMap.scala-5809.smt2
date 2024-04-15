; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74908 () Bool)

(assert start!74908)

(declare-fun b_free!15445 () Bool)

(declare-fun b_next!15445 () Bool)

(assert (=> start!74908 (= b_free!15445 (not b_next!15445))))

(declare-fun tp!54039 () Bool)

(declare-fun b_and!25563 () Bool)

(assert (=> start!74908 (= tp!54039 b_and!25563)))

(declare-fun mapNonEmpty!28170 () Bool)

(declare-fun mapRes!28170 () Bool)

(declare-fun tp!54038 () Bool)

(declare-fun e!491630 () Bool)

(assert (=> mapNonEmpty!28170 (= mapRes!28170 (and tp!54038 e!491630))))

(declare-fun mapKey!28170 () (_ BitVec 32))

(declare-datatypes ((V!28633 0))(
  ( (V!28634 (val!8892 Int)) )
))
(declare-datatypes ((ValueCell!8405 0))(
  ( (ValueCellFull!8405 (v!11355 V!28633)) (EmptyCell!8405) )
))
(declare-fun mapValue!28170 () ValueCell!8405)

(declare-datatypes ((array!51485 0))(
  ( (array!51486 (arr!24762 (Array (_ BitVec 32) ValueCell!8405)) (size!25204 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51485)

(declare-fun mapRest!28170 () (Array (_ BitVec 32) ValueCell!8405))

(assert (=> mapNonEmpty!28170 (= (arr!24762 _values!688) (store mapRest!28170 mapKey!28170 mapValue!28170))))

(declare-fun b!883410 () Bool)

(declare-fun res!600220 () Bool)

(declare-fun e!491629 () Bool)

(assert (=> b!883410 (=> (not res!600220) (not e!491629))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883410 (= res!600220 (validKeyInArray!0 k0!854))))

(declare-fun b!883411 () Bool)

(declare-fun res!600222 () Bool)

(assert (=> b!883411 (=> (not res!600222) (not e!491629))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51487 0))(
  ( (array!51488 (arr!24763 (Array (_ BitVec 32) (_ BitVec 64))) (size!25205 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51487)

(assert (=> b!883411 (= res!600222 (and (= (size!25204 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25205 _keys!868) (size!25204 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883412 () Bool)

(declare-fun e!491626 () Bool)

(declare-fun e!491627 () Bool)

(assert (=> b!883412 (= e!491626 (and e!491627 mapRes!28170))))

(declare-fun condMapEmpty!28170 () Bool)

(declare-fun mapDefault!28170 () ValueCell!8405)

(assert (=> b!883412 (= condMapEmpty!28170 (= (arr!24762 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8405)) mapDefault!28170)))))

(declare-fun b!883413 () Bool)

(declare-fun e!491623 () Bool)

(assert (=> b!883413 (= e!491629 e!491623)))

(declare-fun res!600218 () Bool)

(assert (=> b!883413 (=> (not res!600218) (not e!491623))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883413 (= res!600218 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28633)

(declare-fun zeroValue!654 () V!28633)

(declare-fun lt!399765 () array!51485)

(declare-datatypes ((tuple2!11798 0))(
  ( (tuple2!11799 (_1!5910 (_ BitVec 64)) (_2!5910 V!28633)) )
))
(declare-datatypes ((List!17595 0))(
  ( (Nil!17592) (Cons!17591 (h!18722 tuple2!11798) (t!24833 List!17595)) )
))
(declare-datatypes ((ListLongMap!10557 0))(
  ( (ListLongMap!10558 (toList!5294 List!17595)) )
))
(declare-fun lt!399763 () ListLongMap!10557)

(declare-fun getCurrentListMapNoExtraKeys!3285 (array!51487 array!51485 (_ BitVec 32) (_ BitVec 32) V!28633 V!28633 (_ BitVec 32) Int) ListLongMap!10557)

(assert (=> b!883413 (= lt!399763 (getCurrentListMapNoExtraKeys!3285 _keys!868 lt!399765 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28633)

(assert (=> b!883413 (= lt!399765 (array!51486 (store (arr!24762 _values!688) i!612 (ValueCellFull!8405 v!557)) (size!25204 _values!688)))))

(declare-fun lt!399756 () ListLongMap!10557)

(assert (=> b!883413 (= lt!399756 (getCurrentListMapNoExtraKeys!3285 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883414 () Bool)

(declare-fun res!600215 () Bool)

(assert (=> b!883414 (=> (not res!600215) (not e!491629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883414 (= res!600215 (validMask!0 mask!1196))))

(declare-fun b!883415 () Bool)

(declare-fun e!491624 () Bool)

(assert (=> b!883415 (= e!491624 (bvslt from!1053 (size!25204 _values!688)))))

(assert (=> b!883415 (not (= (select (arr!24763 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!30096 0))(
  ( (Unit!30097) )
))
(declare-fun lt!399762 () Unit!30096)

(declare-fun e!491625 () Unit!30096)

(assert (=> b!883415 (= lt!399762 e!491625)))

(declare-fun c!93008 () Bool)

(assert (=> b!883415 (= c!93008 (= (select (arr!24763 _keys!868) from!1053) k0!854))))

(declare-fun lt!399764 () ListLongMap!10557)

(declare-fun +!2586 (ListLongMap!10557 tuple2!11798) ListLongMap!10557)

(declare-fun get!13056 (ValueCell!8405 V!28633) V!28633)

(declare-fun dynLambda!1272 (Int (_ BitVec 64)) V!28633)

(assert (=> b!883415 (= lt!399763 (+!2586 lt!399764 (tuple2!11799 (select (arr!24763 _keys!868) from!1053) (get!13056 (select (arr!24762 _values!688) from!1053) (dynLambda!1272 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!600216 () Bool)

(assert (=> start!74908 (=> (not res!600216) (not e!491629))))

(assert (=> start!74908 (= res!600216 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25205 _keys!868))))))

(assert (=> start!74908 e!491629))

(declare-fun tp_is_empty!17689 () Bool)

(assert (=> start!74908 tp_is_empty!17689))

(assert (=> start!74908 true))

(assert (=> start!74908 tp!54039))

(declare-fun array_inv!19546 (array!51487) Bool)

(assert (=> start!74908 (array_inv!19546 _keys!868)))

(declare-fun array_inv!19547 (array!51485) Bool)

(assert (=> start!74908 (and (array_inv!19547 _values!688) e!491626)))

(declare-fun b!883416 () Bool)

(declare-fun res!600214 () Bool)

(assert (=> b!883416 (=> (not res!600214) (not e!491629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51487 (_ BitVec 32)) Bool)

(assert (=> b!883416 (= res!600214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883417 () Bool)

(assert (=> b!883417 (= e!491623 (not e!491624))))

(declare-fun res!600223 () Bool)

(assert (=> b!883417 (=> res!600223 e!491624)))

(assert (=> b!883417 (= res!600223 (not (validKeyInArray!0 (select (arr!24763 _keys!868) from!1053))))))

(declare-fun lt!399760 () ListLongMap!10557)

(assert (=> b!883417 (= lt!399760 lt!399764)))

(declare-fun lt!399761 () ListLongMap!10557)

(assert (=> b!883417 (= lt!399764 (+!2586 lt!399761 (tuple2!11799 k0!854 v!557)))))

(assert (=> b!883417 (= lt!399760 (getCurrentListMapNoExtraKeys!3285 _keys!868 lt!399765 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883417 (= lt!399761 (getCurrentListMapNoExtraKeys!3285 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399758 () Unit!30096)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!750 (array!51487 array!51485 (_ BitVec 32) (_ BitVec 32) V!28633 V!28633 (_ BitVec 32) (_ BitVec 64) V!28633 (_ BitVec 32) Int) Unit!30096)

(assert (=> b!883417 (= lt!399758 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!750 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883418 () Bool)

(declare-fun Unit!30098 () Unit!30096)

(assert (=> b!883418 (= e!491625 Unit!30098)))

(declare-fun lt!399755 () Unit!30096)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51487 (_ BitVec 32) (_ BitVec 32)) Unit!30096)

(assert (=> b!883418 (= lt!399755 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17596 0))(
  ( (Nil!17593) (Cons!17592 (h!18723 (_ BitVec 64)) (t!24834 List!17596)) )
))
(declare-fun arrayNoDuplicates!0 (array!51487 (_ BitVec 32) List!17596) Bool)

(assert (=> b!883418 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17593)))

(declare-fun lt!399757 () Unit!30096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30096)

(assert (=> b!883418 (= lt!399757 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883418 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399759 () Unit!30096)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51487 (_ BitVec 64) (_ BitVec 32) List!17596) Unit!30096)

(assert (=> b!883418 (= lt!399759 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17593))))

(assert (=> b!883418 false))

(declare-fun b!883419 () Bool)

(declare-fun Unit!30099 () Unit!30096)

(assert (=> b!883419 (= e!491625 Unit!30099)))

(declare-fun b!883420 () Bool)

(declare-fun res!600217 () Bool)

(assert (=> b!883420 (=> (not res!600217) (not e!491629))))

(assert (=> b!883420 (= res!600217 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25205 _keys!868))))))

(declare-fun b!883421 () Bool)

(declare-fun res!600221 () Bool)

(assert (=> b!883421 (=> (not res!600221) (not e!491629))))

(assert (=> b!883421 (= res!600221 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17593))))

(declare-fun b!883422 () Bool)

(assert (=> b!883422 (= e!491630 tp_is_empty!17689)))

(declare-fun b!883423 () Bool)

(assert (=> b!883423 (= e!491627 tp_is_empty!17689)))

(declare-fun mapIsEmpty!28170 () Bool)

(assert (=> mapIsEmpty!28170 mapRes!28170))

(declare-fun b!883424 () Bool)

(declare-fun res!600219 () Bool)

(assert (=> b!883424 (=> (not res!600219) (not e!491629))))

(assert (=> b!883424 (= res!600219 (and (= (select (arr!24763 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74908 res!600216) b!883414))

(assert (= (and b!883414 res!600215) b!883411))

(assert (= (and b!883411 res!600222) b!883416))

(assert (= (and b!883416 res!600214) b!883421))

(assert (= (and b!883421 res!600221) b!883420))

(assert (= (and b!883420 res!600217) b!883410))

(assert (= (and b!883410 res!600220) b!883424))

(assert (= (and b!883424 res!600219) b!883413))

(assert (= (and b!883413 res!600218) b!883417))

(assert (= (and b!883417 (not res!600223)) b!883415))

(assert (= (and b!883415 c!93008) b!883418))

(assert (= (and b!883415 (not c!93008)) b!883419))

(assert (= (and b!883412 condMapEmpty!28170) mapIsEmpty!28170))

(assert (= (and b!883412 (not condMapEmpty!28170)) mapNonEmpty!28170))

(get-info :version)

(assert (= (and mapNonEmpty!28170 ((_ is ValueCellFull!8405) mapValue!28170)) b!883422))

(assert (= (and b!883412 ((_ is ValueCellFull!8405) mapDefault!28170)) b!883423))

(assert (= start!74908 b!883412))

(declare-fun b_lambda!12705 () Bool)

(assert (=> (not b_lambda!12705) (not b!883415)))

(declare-fun t!24832 () Bool)

(declare-fun tb!5095 () Bool)

(assert (=> (and start!74908 (= defaultEntry!696 defaultEntry!696) t!24832) tb!5095))

(declare-fun result!9833 () Bool)

(assert (=> tb!5095 (= result!9833 tp_is_empty!17689)))

(assert (=> b!883415 t!24832))

(declare-fun b_and!25565 () Bool)

(assert (= b_and!25563 (and (=> t!24832 result!9833) b_and!25565)))

(declare-fun m!822975 () Bool)

(assert (=> b!883417 m!822975))

(declare-fun m!822977 () Bool)

(assert (=> b!883417 m!822977))

(declare-fun m!822979 () Bool)

(assert (=> b!883417 m!822979))

(declare-fun m!822981 () Bool)

(assert (=> b!883417 m!822981))

(declare-fun m!822983 () Bool)

(assert (=> b!883417 m!822983))

(assert (=> b!883417 m!822981))

(declare-fun m!822985 () Bool)

(assert (=> b!883417 m!822985))

(declare-fun m!822987 () Bool)

(assert (=> b!883414 m!822987))

(declare-fun m!822989 () Bool)

(assert (=> mapNonEmpty!28170 m!822989))

(declare-fun m!822991 () Bool)

(assert (=> b!883410 m!822991))

(declare-fun m!822993 () Bool)

(assert (=> b!883421 m!822993))

(declare-fun m!822995 () Bool)

(assert (=> b!883424 m!822995))

(declare-fun m!822997 () Bool)

(assert (=> b!883418 m!822997))

(declare-fun m!822999 () Bool)

(assert (=> b!883418 m!822999))

(declare-fun m!823001 () Bool)

(assert (=> b!883418 m!823001))

(declare-fun m!823003 () Bool)

(assert (=> b!883418 m!823003))

(declare-fun m!823005 () Bool)

(assert (=> b!883418 m!823005))

(declare-fun m!823007 () Bool)

(assert (=> b!883416 m!823007))

(declare-fun m!823009 () Bool)

(assert (=> start!74908 m!823009))

(declare-fun m!823011 () Bool)

(assert (=> start!74908 m!823011))

(declare-fun m!823013 () Bool)

(assert (=> b!883415 m!823013))

(declare-fun m!823015 () Bool)

(assert (=> b!883415 m!823015))

(declare-fun m!823017 () Bool)

(assert (=> b!883415 m!823017))

(declare-fun m!823019 () Bool)

(assert (=> b!883415 m!823019))

(assert (=> b!883415 m!823015))

(assert (=> b!883415 m!822981))

(assert (=> b!883415 m!823017))

(declare-fun m!823021 () Bool)

(assert (=> b!883413 m!823021))

(declare-fun m!823023 () Bool)

(assert (=> b!883413 m!823023))

(declare-fun m!823025 () Bool)

(assert (=> b!883413 m!823025))

(check-sat (not b!883417) (not b!883418) (not b!883421) (not b_next!15445) tp_is_empty!17689 (not mapNonEmpty!28170) (not b_lambda!12705) (not b!883413) (not b!883416) (not b!883415) (not b!883414) (not start!74908) b_and!25565 (not b!883410))
(check-sat b_and!25565 (not b_next!15445))
