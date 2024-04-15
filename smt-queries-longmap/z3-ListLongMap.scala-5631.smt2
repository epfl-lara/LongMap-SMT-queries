; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73552 () Bool)

(assert start!73552)

(declare-fun b_free!14485 () Bool)

(declare-fun b_next!14485 () Bool)

(assert (=> start!73552 (= b_free!14485 (not b_next!14485))))

(declare-fun tp!50960 () Bool)

(declare-fun b_and!23923 () Bool)

(assert (=> start!73552 (= tp!50960 b_and!23923)))

(declare-fun mapIsEmpty!26531 () Bool)

(declare-fun mapRes!26531 () Bool)

(assert (=> mapIsEmpty!26531 mapRes!26531))

(declare-fun b!860210 () Bool)

(declare-fun e!479319 () Bool)

(declare-fun e!479320 () Bool)

(assert (=> b!860210 (= e!479319 (and e!479320 mapRes!26531))))

(declare-fun condMapEmpty!26531 () Bool)

(declare-datatypes ((V!27209 0))(
  ( (V!27210 (val!8358 Int)) )
))
(declare-datatypes ((ValueCell!7871 0))(
  ( (ValueCellFull!7871 (v!10777 V!27209)) (EmptyCell!7871) )
))
(declare-datatypes ((array!49401 0))(
  ( (array!49402 (arr!23732 (Array (_ BitVec 32) ValueCell!7871)) (size!24174 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49401)

(declare-fun mapDefault!26531 () ValueCell!7871)

(assert (=> b!860210 (= condMapEmpty!26531 (= (arr!23732 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7871)) mapDefault!26531)))))

(declare-fun mapNonEmpty!26531 () Bool)

(declare-fun tp!50959 () Bool)

(declare-fun e!479314 () Bool)

(assert (=> mapNonEmpty!26531 (= mapRes!26531 (and tp!50959 e!479314))))

(declare-fun mapKey!26531 () (_ BitVec 32))

(declare-fun mapValue!26531 () ValueCell!7871)

(declare-fun mapRest!26531 () (Array (_ BitVec 32) ValueCell!7871))

(assert (=> mapNonEmpty!26531 (= (arr!23732 _values!688) (store mapRest!26531 mapKey!26531 mapValue!26531))))

(declare-fun b!860211 () Bool)

(declare-fun res!584646 () Bool)

(declare-fun e!479317 () Bool)

(assert (=> b!860211 (=> res!584646 e!479317)))

(declare-datatypes ((List!16849 0))(
  ( (Nil!16846) (Cons!16845 (h!17976 (_ BitVec 64)) (t!23591 List!16849)) )
))
(declare-fun contains!4211 (List!16849 (_ BitVec 64)) Bool)

(assert (=> b!860211 (= res!584646 (contains!4211 Nil!16846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860212 () Bool)

(declare-fun res!584644 () Bool)

(declare-fun e!479322 () Bool)

(assert (=> b!860212 (=> (not res!584644) (not e!479322))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49403 0))(
  ( (array!49404 (arr!23733 (Array (_ BitVec 32) (_ BitVec 64))) (size!24175 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49403)

(assert (=> b!860212 (= res!584644 (and (= (size!24174 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24175 _keys!868) (size!24174 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860213 () Bool)

(assert (=> b!860213 (= e!479317 true)))

(declare-fun lt!387604 () Bool)

(assert (=> b!860213 (= lt!387604 (contains!4211 Nil!16846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860214 () Bool)

(declare-fun tp_is_empty!16621 () Bool)

(assert (=> b!860214 (= e!479314 tp_is_empty!16621)))

(declare-fun b!860215 () Bool)

(assert (=> b!860215 (= e!479320 tp_is_empty!16621)))

(declare-fun b!860216 () Bool)

(declare-fun res!584633 () Bool)

(assert (=> b!860216 (=> (not res!584633) (not e!479322))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860216 (= res!584633 (validKeyInArray!0 k0!854))))

(declare-fun res!584639 () Bool)

(assert (=> start!73552 (=> (not res!584639) (not e!479322))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73552 (= res!584639 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24175 _keys!868))))))

(assert (=> start!73552 e!479322))

(assert (=> start!73552 tp_is_empty!16621))

(assert (=> start!73552 true))

(assert (=> start!73552 tp!50960))

(declare-fun array_inv!18850 (array!49403) Bool)

(assert (=> start!73552 (array_inv!18850 _keys!868)))

(declare-fun array_inv!18851 (array!49401) Bool)

(assert (=> start!73552 (and (array_inv!18851 _values!688) e!479319)))

(declare-fun b!860217 () Bool)

(declare-fun e!479321 () Bool)

(assert (=> b!860217 (= e!479321 e!479317)))

(declare-fun res!584642 () Bool)

(assert (=> b!860217 (=> res!584642 e!479317)))

(assert (=> b!860217 (= res!584642 (or (bvsge (size!24175 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24175 _keys!868)) (bvsge from!1053 (size!24175 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860217 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29255 0))(
  ( (Unit!29256) )
))
(declare-fun lt!387607 () Unit!29255)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29255)

(assert (=> b!860217 (= lt!387607 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!49403 (_ BitVec 32) List!16849) Bool)

(assert (=> b!860217 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16846)))

(declare-fun lt!387602 () Unit!29255)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49403 (_ BitVec 32) (_ BitVec 32)) Unit!29255)

(assert (=> b!860217 (= lt!387602 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860218 () Bool)

(declare-fun res!584643 () Bool)

(assert (=> b!860218 (=> (not res!584643) (not e!479322))))

(assert (=> b!860218 (= res!584643 (and (= (select (arr!23733 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860219 () Bool)

(declare-fun e!479318 () Bool)

(assert (=> b!860219 (= e!479322 e!479318)))

(declare-fun res!584637 () Bool)

(assert (=> b!860219 (=> (not res!584637) (not e!479318))))

(assert (=> b!860219 (= res!584637 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11048 0))(
  ( (tuple2!11049 (_1!5535 (_ BitVec 64)) (_2!5535 V!27209)) )
))
(declare-datatypes ((List!16850 0))(
  ( (Nil!16847) (Cons!16846 (h!17977 tuple2!11048) (t!23592 List!16850)) )
))
(declare-datatypes ((ListLongMap!9807 0))(
  ( (ListLongMap!9808 (toList!4919 List!16850)) )
))
(declare-fun lt!387605 () ListLongMap!9807)

(declare-fun minValue!654 () V!27209)

(declare-fun zeroValue!654 () V!27209)

(declare-fun lt!387606 () array!49401)

(declare-fun getCurrentListMapNoExtraKeys!2923 (array!49403 array!49401 (_ BitVec 32) (_ BitVec 32) V!27209 V!27209 (_ BitVec 32) Int) ListLongMap!9807)

(assert (=> b!860219 (= lt!387605 (getCurrentListMapNoExtraKeys!2923 _keys!868 lt!387606 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27209)

(assert (=> b!860219 (= lt!387606 (array!49402 (store (arr!23732 _values!688) i!612 (ValueCellFull!7871 v!557)) (size!24174 _values!688)))))

(declare-fun lt!387601 () ListLongMap!9807)

(assert (=> b!860219 (= lt!387601 (getCurrentListMapNoExtraKeys!2923 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860220 () Bool)

(declare-fun res!584635 () Bool)

(assert (=> b!860220 (=> (not res!584635) (not e!479322))))

(assert (=> b!860220 (= res!584635 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24175 _keys!868))))))

(declare-fun b!860221 () Bool)

(declare-fun res!584645 () Bool)

(assert (=> b!860221 (=> (not res!584645) (not e!479322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860221 (= res!584645 (validMask!0 mask!1196))))

(declare-fun b!860222 () Bool)

(declare-fun res!584640 () Bool)

(assert (=> b!860222 (=> res!584640 e!479317)))

(declare-fun noDuplicate!1319 (List!16849) Bool)

(assert (=> b!860222 (= res!584640 (not (noDuplicate!1319 Nil!16846)))))

(declare-fun b!860223 () Bool)

(declare-fun res!584634 () Bool)

(assert (=> b!860223 (=> (not res!584634) (not e!479322))))

(assert (=> b!860223 (= res!584634 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16846))))

(declare-fun b!860224 () Bool)

(declare-fun e!479316 () Bool)

(assert (=> b!860224 (= e!479318 (not e!479316))))

(declare-fun res!584636 () Bool)

(assert (=> b!860224 (=> res!584636 e!479316)))

(assert (=> b!860224 (= res!584636 (not (validKeyInArray!0 (select (arr!23733 _keys!868) from!1053))))))

(declare-fun lt!387600 () ListLongMap!9807)

(declare-fun lt!387599 () ListLongMap!9807)

(assert (=> b!860224 (= lt!387600 lt!387599)))

(declare-fun lt!387608 () ListLongMap!9807)

(declare-fun +!2293 (ListLongMap!9807 tuple2!11048) ListLongMap!9807)

(assert (=> b!860224 (= lt!387599 (+!2293 lt!387608 (tuple2!11049 k0!854 v!557)))))

(assert (=> b!860224 (= lt!387600 (getCurrentListMapNoExtraKeys!2923 _keys!868 lt!387606 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860224 (= lt!387608 (getCurrentListMapNoExtraKeys!2923 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387603 () Unit!29255)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!485 (array!49403 array!49401 (_ BitVec 32) (_ BitVec 32) V!27209 V!27209 (_ BitVec 32) (_ BitVec 64) V!27209 (_ BitVec 32) Int) Unit!29255)

(assert (=> b!860224 (= lt!387603 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!485 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860225 () Bool)

(declare-fun res!584641 () Bool)

(assert (=> b!860225 (=> (not res!584641) (not e!479322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49403 (_ BitVec 32)) Bool)

(assert (=> b!860225 (= res!584641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860226 () Bool)

(assert (=> b!860226 (= e!479316 e!479321)))

(declare-fun res!584638 () Bool)

(assert (=> b!860226 (=> res!584638 e!479321)))

(assert (=> b!860226 (= res!584638 (not (= (select (arr!23733 _keys!868) from!1053) k0!854)))))

(declare-fun get!12516 (ValueCell!7871 V!27209) V!27209)

(declare-fun dynLambda!1107 (Int (_ BitVec 64)) V!27209)

(assert (=> b!860226 (= lt!387605 (+!2293 lt!387599 (tuple2!11049 (select (arr!23733 _keys!868) from!1053) (get!12516 (select (arr!23732 _values!688) from!1053) (dynLambda!1107 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73552 res!584639) b!860221))

(assert (= (and b!860221 res!584645) b!860212))

(assert (= (and b!860212 res!584644) b!860225))

(assert (= (and b!860225 res!584641) b!860223))

(assert (= (and b!860223 res!584634) b!860220))

(assert (= (and b!860220 res!584635) b!860216))

(assert (= (and b!860216 res!584633) b!860218))

(assert (= (and b!860218 res!584643) b!860219))

(assert (= (and b!860219 res!584637) b!860224))

(assert (= (and b!860224 (not res!584636)) b!860226))

(assert (= (and b!860226 (not res!584638)) b!860217))

(assert (= (and b!860217 (not res!584642)) b!860222))

(assert (= (and b!860222 (not res!584640)) b!860211))

(assert (= (and b!860211 (not res!584646)) b!860213))

(assert (= (and b!860210 condMapEmpty!26531) mapIsEmpty!26531))

(assert (= (and b!860210 (not condMapEmpty!26531)) mapNonEmpty!26531))

(get-info :version)

(assert (= (and mapNonEmpty!26531 ((_ is ValueCellFull!7871) mapValue!26531)) b!860214))

(assert (= (and b!860210 ((_ is ValueCellFull!7871) mapDefault!26531)) b!860215))

(assert (= start!73552 b!860210))

(declare-fun b_lambda!11819 () Bool)

(assert (=> (not b_lambda!11819) (not b!860226)))

(declare-fun t!23590 () Bool)

(declare-fun tb!4599 () Bool)

(assert (=> (and start!73552 (= defaultEntry!696 defaultEntry!696) t!23590) tb!4599))

(declare-fun result!8817 () Bool)

(assert (=> tb!4599 (= result!8817 tp_is_empty!16621)))

(assert (=> b!860226 t!23590))

(declare-fun b_and!23925 () Bool)

(assert (= b_and!23923 (and (=> t!23590 result!8817) b_and!23925)))

(declare-fun m!800499 () Bool)

(assert (=> b!860217 m!800499))

(declare-fun m!800501 () Bool)

(assert (=> b!860217 m!800501))

(declare-fun m!800503 () Bool)

(assert (=> b!860217 m!800503))

(declare-fun m!800505 () Bool)

(assert (=> b!860217 m!800505))

(declare-fun m!800507 () Bool)

(assert (=> start!73552 m!800507))

(declare-fun m!800509 () Bool)

(assert (=> start!73552 m!800509))

(declare-fun m!800511 () Bool)

(assert (=> b!860222 m!800511))

(declare-fun m!800513 () Bool)

(assert (=> b!860211 m!800513))

(declare-fun m!800515 () Bool)

(assert (=> b!860218 m!800515))

(declare-fun m!800517 () Bool)

(assert (=> b!860224 m!800517))

(declare-fun m!800519 () Bool)

(assert (=> b!860224 m!800519))

(declare-fun m!800521 () Bool)

(assert (=> b!860224 m!800521))

(assert (=> b!860224 m!800519))

(declare-fun m!800523 () Bool)

(assert (=> b!860224 m!800523))

(declare-fun m!800525 () Bool)

(assert (=> b!860224 m!800525))

(declare-fun m!800527 () Bool)

(assert (=> b!860224 m!800527))

(declare-fun m!800529 () Bool)

(assert (=> mapNonEmpty!26531 m!800529))

(declare-fun m!800531 () Bool)

(assert (=> b!860213 m!800531))

(declare-fun m!800533 () Bool)

(assert (=> b!860221 m!800533))

(declare-fun m!800535 () Bool)

(assert (=> b!860225 m!800535))

(declare-fun m!800537 () Bool)

(assert (=> b!860219 m!800537))

(declare-fun m!800539 () Bool)

(assert (=> b!860219 m!800539))

(declare-fun m!800541 () Bool)

(assert (=> b!860219 m!800541))

(declare-fun m!800543 () Bool)

(assert (=> b!860223 m!800543))

(declare-fun m!800545 () Bool)

(assert (=> b!860226 m!800545))

(declare-fun m!800547 () Bool)

(assert (=> b!860226 m!800547))

(declare-fun m!800549 () Bool)

(assert (=> b!860226 m!800549))

(declare-fun m!800551 () Bool)

(assert (=> b!860226 m!800551))

(assert (=> b!860226 m!800547))

(assert (=> b!860226 m!800519))

(assert (=> b!860226 m!800549))

(declare-fun m!800553 () Bool)

(assert (=> b!860216 m!800553))

(check-sat (not b!860225) b_and!23925 (not b!860222) (not b!860221) (not b_lambda!11819) (not b!860216) (not mapNonEmpty!26531) (not b!860226) (not b!860223) (not b!860219) (not b!860213) (not start!73552) (not b!860217) tp_is_empty!16621 (not b_next!14485) (not b!860211) (not b!860224))
(check-sat b_and!23925 (not b_next!14485))
