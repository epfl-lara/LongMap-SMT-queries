; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73536 () Bool)

(assert start!73536)

(declare-fun b_free!14451 () Bool)

(declare-fun b_next!14451 () Bool)

(assert (=> start!73536 (= b_free!14451 (not b_next!14451))))

(declare-fun tp!50857 () Bool)

(declare-fun b_and!23881 () Bool)

(assert (=> start!73536 (= tp!50857 b_and!23881)))

(declare-fun b!859548 () Bool)

(declare-fun res!584033 () Bool)

(declare-fun e!479003 () Bool)

(assert (=> b!859548 (=> res!584033 e!479003)))

(declare-datatypes ((List!16823 0))(
  ( (Nil!16820) (Cons!16819 (h!17950 (_ BitVec 64)) (t!23540 List!16823)) )
))
(declare-fun noDuplicate!1302 (List!16823) Bool)

(assert (=> b!859548 (= res!584033 (not (noDuplicate!1302 Nil!16820)))))

(declare-fun b!859549 () Bool)

(declare-fun e!479006 () Bool)

(declare-fun e!479008 () Bool)

(assert (=> b!859549 (= e!479006 e!479008)))

(declare-fun res!584034 () Bool)

(assert (=> b!859549 (=> res!584034 e!479008)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49350 0))(
  ( (array!49351 (arr!23706 (Array (_ BitVec 32) (_ BitVec 64))) (size!24146 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49350)

(assert (=> b!859549 (= res!584034 (not (= (select (arr!23706 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((V!27163 0))(
  ( (V!27164 (val!8341 Int)) )
))
(declare-datatypes ((tuple2!11014 0))(
  ( (tuple2!11015 (_1!5518 (_ BitVec 64)) (_2!5518 V!27163)) )
))
(declare-datatypes ((List!16824 0))(
  ( (Nil!16821) (Cons!16820 (h!17951 tuple2!11014) (t!23541 List!16824)) )
))
(declare-datatypes ((ListLongMap!9783 0))(
  ( (ListLongMap!9784 (toList!4907 List!16824)) )
))
(declare-fun lt!387327 () ListLongMap!9783)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7854 0))(
  ( (ValueCellFull!7854 (v!10766 V!27163)) (EmptyCell!7854) )
))
(declare-datatypes ((array!49352 0))(
  ( (array!49353 (arr!23707 (Array (_ BitVec 32) ValueCell!7854)) (size!24147 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49352)

(declare-fun lt!387330 () ListLongMap!9783)

(declare-fun +!2260 (ListLongMap!9783 tuple2!11014) ListLongMap!9783)

(declare-fun get!12492 (ValueCell!7854 V!27163) V!27163)

(declare-fun dynLambda!1098 (Int (_ BitVec 64)) V!27163)

(assert (=> b!859549 (= lt!387330 (+!2260 lt!387327 (tuple2!11015 (select (arr!23706 _keys!868) from!1053) (get!12492 (select (arr!23707 _values!688) from!1053) (dynLambda!1098 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!584039 () Bool)

(declare-fun e!479011 () Bool)

(assert (=> start!73536 (=> (not res!584039) (not e!479011))))

(assert (=> start!73536 (= res!584039 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24146 _keys!868))))))

(assert (=> start!73536 e!479011))

(declare-fun tp_is_empty!16587 () Bool)

(assert (=> start!73536 tp_is_empty!16587))

(assert (=> start!73536 true))

(assert (=> start!73536 tp!50857))

(declare-fun array_inv!18768 (array!49350) Bool)

(assert (=> start!73536 (array_inv!18768 _keys!868)))

(declare-fun e!479004 () Bool)

(declare-fun array_inv!18769 (array!49352) Bool)

(assert (=> start!73536 (and (array_inv!18769 _values!688) e!479004)))

(declare-fun b!859550 () Bool)

(declare-fun e!479005 () Bool)

(assert (=> b!859550 (= e!479005 tp_is_empty!16587)))

(declare-fun b!859551 () Bool)

(declare-fun e!479007 () Bool)

(assert (=> b!859551 (= e!479007 tp_is_empty!16587)))

(declare-fun b!859552 () Bool)

(declare-fun res!584032 () Bool)

(assert (=> b!859552 (=> res!584032 e!479003)))

(declare-fun contains!4220 (List!16823 (_ BitVec 64)) Bool)

(assert (=> b!859552 (= res!584032 (contains!4220 Nil!16820 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859553 () Bool)

(declare-fun res!584041 () Bool)

(assert (=> b!859553 (=> (not res!584041) (not e!479011))))

(declare-fun arrayNoDuplicates!0 (array!49350 (_ BitVec 32) List!16823) Bool)

(assert (=> b!859553 (= res!584041 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16820))))

(declare-fun b!859554 () Bool)

(declare-fun res!584042 () Bool)

(assert (=> b!859554 (=> (not res!584042) (not e!479011))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859554 (= res!584042 (validMask!0 mask!1196))))

(declare-fun b!859555 () Bool)

(declare-fun e!479010 () Bool)

(assert (=> b!859555 (= e!479011 e!479010)))

(declare-fun res!584036 () Bool)

(assert (=> b!859555 (=> (not res!584036) (not e!479010))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859555 (= res!584036 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!27163)

(declare-fun zeroValue!654 () V!27163)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!387326 () array!49352)

(declare-fun getCurrentListMapNoExtraKeys!2886 (array!49350 array!49352 (_ BitVec 32) (_ BitVec 32) V!27163 V!27163 (_ BitVec 32) Int) ListLongMap!9783)

(assert (=> b!859555 (= lt!387330 (getCurrentListMapNoExtraKeys!2886 _keys!868 lt!387326 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27163)

(assert (=> b!859555 (= lt!387326 (array!49353 (store (arr!23707 _values!688) i!612 (ValueCellFull!7854 v!557)) (size!24147 _values!688)))))

(declare-fun lt!387334 () ListLongMap!9783)

(assert (=> b!859555 (= lt!387334 (getCurrentListMapNoExtraKeys!2886 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26480 () Bool)

(declare-fun mapRes!26480 () Bool)

(declare-fun tp!50856 () Bool)

(assert (=> mapNonEmpty!26480 (= mapRes!26480 (and tp!50856 e!479007))))

(declare-fun mapValue!26480 () ValueCell!7854)

(declare-fun mapRest!26480 () (Array (_ BitVec 32) ValueCell!7854))

(declare-fun mapKey!26480 () (_ BitVec 32))

(assert (=> mapNonEmpty!26480 (= (arr!23707 _values!688) (store mapRest!26480 mapKey!26480 mapValue!26480))))

(declare-fun b!859556 () Bool)

(assert (=> b!859556 (= e!479004 (and e!479005 mapRes!26480))))

(declare-fun condMapEmpty!26480 () Bool)

(declare-fun mapDefault!26480 () ValueCell!7854)

(assert (=> b!859556 (= condMapEmpty!26480 (= (arr!23707 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7854)) mapDefault!26480)))))

(declare-fun b!859557 () Bool)

(declare-fun res!584031 () Bool)

(assert (=> b!859557 (=> (not res!584031) (not e!479011))))

(assert (=> b!859557 (= res!584031 (and (= (size!24147 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24146 _keys!868) (size!24147 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859558 () Bool)

(assert (=> b!859558 (= e!479003 true)))

(declare-fun lt!387331 () Bool)

(assert (=> b!859558 (= lt!387331 (contains!4220 Nil!16820 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859559 () Bool)

(declare-fun res!584029 () Bool)

(assert (=> b!859559 (=> (not res!584029) (not e!479011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859559 (= res!584029 (validKeyInArray!0 k0!854))))

(declare-fun b!859560 () Bool)

(declare-fun res!584040 () Bool)

(assert (=> b!859560 (=> (not res!584040) (not e!479011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49350 (_ BitVec 32)) Bool)

(assert (=> b!859560 (= res!584040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859561 () Bool)

(assert (=> b!859561 (= e!479010 (not e!479006))))

(declare-fun res!584037 () Bool)

(assert (=> b!859561 (=> res!584037 e!479006)))

(assert (=> b!859561 (= res!584037 (not (validKeyInArray!0 (select (arr!23706 _keys!868) from!1053))))))

(declare-fun lt!387328 () ListLongMap!9783)

(assert (=> b!859561 (= lt!387328 lt!387327)))

(declare-fun lt!387332 () ListLongMap!9783)

(assert (=> b!859561 (= lt!387327 (+!2260 lt!387332 (tuple2!11015 k0!854 v!557)))))

(assert (=> b!859561 (= lt!387328 (getCurrentListMapNoExtraKeys!2886 _keys!868 lt!387326 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859561 (= lt!387332 (getCurrentListMapNoExtraKeys!2886 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29305 0))(
  ( (Unit!29306) )
))
(declare-fun lt!387325 () Unit!29305)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!476 (array!49350 array!49352 (_ BitVec 32) (_ BitVec 32) V!27163 V!27163 (_ BitVec 32) (_ BitVec 64) V!27163 (_ BitVec 32) Int) Unit!29305)

(assert (=> b!859561 (= lt!387325 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!476 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859562 () Bool)

(declare-fun res!584030 () Bool)

(assert (=> b!859562 (=> (not res!584030) (not e!479011))))

(assert (=> b!859562 (= res!584030 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24146 _keys!868))))))

(declare-fun b!859563 () Bool)

(declare-fun res!584038 () Bool)

(assert (=> b!859563 (=> (not res!584038) (not e!479011))))

(assert (=> b!859563 (= res!584038 (and (= (select (arr!23706 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26480 () Bool)

(assert (=> mapIsEmpty!26480 mapRes!26480))

(declare-fun b!859564 () Bool)

(assert (=> b!859564 (= e!479008 e!479003)))

(declare-fun res!584035 () Bool)

(assert (=> b!859564 (=> res!584035 e!479003)))

(assert (=> b!859564 (= res!584035 (or (bvsge (size!24146 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24146 _keys!868)) (bvsge from!1053 (size!24146 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859564 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387329 () Unit!29305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29305)

(assert (=> b!859564 (= lt!387329 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859564 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16820)))

(declare-fun lt!387333 () Unit!29305)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49350 (_ BitVec 32) (_ BitVec 32)) Unit!29305)

(assert (=> b!859564 (= lt!387333 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!73536 res!584039) b!859554))

(assert (= (and b!859554 res!584042) b!859557))

(assert (= (and b!859557 res!584031) b!859560))

(assert (= (and b!859560 res!584040) b!859553))

(assert (= (and b!859553 res!584041) b!859562))

(assert (= (and b!859562 res!584030) b!859559))

(assert (= (and b!859559 res!584029) b!859563))

(assert (= (and b!859563 res!584038) b!859555))

(assert (= (and b!859555 res!584036) b!859561))

(assert (= (and b!859561 (not res!584037)) b!859549))

(assert (= (and b!859549 (not res!584034)) b!859564))

(assert (= (and b!859564 (not res!584035)) b!859548))

(assert (= (and b!859548 (not res!584033)) b!859552))

(assert (= (and b!859552 (not res!584032)) b!859558))

(assert (= (and b!859556 condMapEmpty!26480) mapIsEmpty!26480))

(assert (= (and b!859556 (not condMapEmpty!26480)) mapNonEmpty!26480))

(get-info :version)

(assert (= (and mapNonEmpty!26480 ((_ is ValueCellFull!7854) mapValue!26480)) b!859551))

(assert (= (and b!859556 ((_ is ValueCellFull!7854) mapDefault!26480)) b!859550))

(assert (= start!73536 b!859556))

(declare-fun b_lambda!11803 () Bool)

(assert (=> (not b_lambda!11803) (not b!859549)))

(declare-fun t!23539 () Bool)

(declare-fun tb!4573 () Bool)

(assert (=> (and start!73536 (= defaultEntry!696 defaultEntry!696) t!23539) tb!4573))

(declare-fun result!8757 () Bool)

(assert (=> tb!4573 (= result!8757 tp_is_empty!16587)))

(assert (=> b!859549 t!23539))

(declare-fun b_and!23883 () Bool)

(assert (= b_and!23881 (and (=> t!23539 result!8757) b_and!23883)))

(declare-fun m!800305 () Bool)

(assert (=> b!859558 m!800305))

(declare-fun m!800307 () Bool)

(assert (=> b!859555 m!800307))

(declare-fun m!800309 () Bool)

(assert (=> b!859555 m!800309))

(declare-fun m!800311 () Bool)

(assert (=> b!859555 m!800311))

(declare-fun m!800313 () Bool)

(assert (=> mapNonEmpty!26480 m!800313))

(declare-fun m!800315 () Bool)

(assert (=> b!859552 m!800315))

(declare-fun m!800317 () Bool)

(assert (=> b!859549 m!800317))

(declare-fun m!800319 () Bool)

(assert (=> b!859549 m!800319))

(declare-fun m!800321 () Bool)

(assert (=> b!859549 m!800321))

(declare-fun m!800323 () Bool)

(assert (=> b!859549 m!800323))

(assert (=> b!859549 m!800319))

(declare-fun m!800325 () Bool)

(assert (=> b!859549 m!800325))

(assert (=> b!859549 m!800321))

(declare-fun m!800327 () Bool)

(assert (=> b!859554 m!800327))

(declare-fun m!800329 () Bool)

(assert (=> b!859564 m!800329))

(declare-fun m!800331 () Bool)

(assert (=> b!859564 m!800331))

(declare-fun m!800333 () Bool)

(assert (=> b!859564 m!800333))

(declare-fun m!800335 () Bool)

(assert (=> b!859564 m!800335))

(declare-fun m!800337 () Bool)

(assert (=> start!73536 m!800337))

(declare-fun m!800339 () Bool)

(assert (=> start!73536 m!800339))

(declare-fun m!800341 () Bool)

(assert (=> b!859563 m!800341))

(declare-fun m!800343 () Bool)

(assert (=> b!859548 m!800343))

(declare-fun m!800345 () Bool)

(assert (=> b!859560 m!800345))

(declare-fun m!800347 () Bool)

(assert (=> b!859559 m!800347))

(declare-fun m!800349 () Bool)

(assert (=> b!859553 m!800349))

(declare-fun m!800351 () Bool)

(assert (=> b!859561 m!800351))

(declare-fun m!800353 () Bool)

(assert (=> b!859561 m!800353))

(assert (=> b!859561 m!800325))

(declare-fun m!800355 () Bool)

(assert (=> b!859561 m!800355))

(assert (=> b!859561 m!800325))

(declare-fun m!800357 () Bool)

(assert (=> b!859561 m!800357))

(declare-fun m!800359 () Bool)

(assert (=> b!859561 m!800359))

(check-sat (not b!859552) (not b!859564) (not b!859549) (not b!859553) (not b!859548) (not start!73536) (not b_lambda!11803) (not mapNonEmpty!26480) (not b!859560) (not b!859561) b_and!23883 (not b!859555) (not b!859559) (not b!859554) (not b!859558) (not b_next!14451) tp_is_empty!16587)
(check-sat b_and!23883 (not b_next!14451))
