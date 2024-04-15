; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73126 () Bool)

(assert start!73126)

(declare-fun b_free!14059 () Bool)

(declare-fun b_next!14059 () Bool)

(assert (=> start!73126 (= b_free!14059 (not b_next!14059))))

(declare-fun tp!49681 () Bool)

(declare-fun b_and!23251 () Bool)

(assert (=> start!73126 (= tp!49681 b_and!23251)))

(declare-fun b!851302 () Bool)

(declare-fun e!474828 () Bool)

(declare-datatypes ((V!26641 0))(
  ( (V!26642 (val!8145 Int)) )
))
(declare-datatypes ((tuple2!10704 0))(
  ( (tuple2!10705 (_1!5363 (_ BitVec 64)) (_2!5363 V!26641)) )
))
(declare-datatypes ((List!16538 0))(
  ( (Nil!16535) (Cons!16534 (h!17665 tuple2!10704) (t!23034 List!16538)) )
))
(declare-datatypes ((ListLongMap!9463 0))(
  ( (ListLongMap!9464 (toList!4747 List!16538)) )
))
(declare-fun call!38007 () ListLongMap!9463)

(declare-fun call!38006 () ListLongMap!9463)

(assert (=> b!851302 (= e!474828 (= call!38007 call!38006))))

(declare-fun b!851303 () Bool)

(declare-fun res!578304 () Bool)

(declare-fun e!474822 () Bool)

(assert (=> b!851303 (=> (not res!578304) (not e!474822))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48579 0))(
  ( (array!48580 (arr!23321 (Array (_ BitVec 32) (_ BitVec 64))) (size!23763 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48579)

(assert (=> b!851303 (= res!578304 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23763 _keys!868))))))

(declare-fun res!578305 () Bool)

(assert (=> start!73126 (=> (not res!578305) (not e!474822))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73126 (= res!578305 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23763 _keys!868))))))

(assert (=> start!73126 e!474822))

(declare-fun tp_is_empty!16195 () Bool)

(assert (=> start!73126 tp_is_empty!16195))

(assert (=> start!73126 true))

(assert (=> start!73126 tp!49681))

(declare-fun array_inv!18578 (array!48579) Bool)

(assert (=> start!73126 (array_inv!18578 _keys!868)))

(declare-datatypes ((ValueCell!7658 0))(
  ( (ValueCellFull!7658 (v!10564 V!26641)) (EmptyCell!7658) )
))
(declare-datatypes ((array!48581 0))(
  ( (array!48582 (arr!23322 (Array (_ BitVec 32) ValueCell!7658)) (size!23764 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48581)

(declare-fun e!474827 () Bool)

(declare-fun array_inv!18579 (array!48581) Bool)

(assert (=> start!73126 (and (array_inv!18579 _values!688) e!474827)))

(declare-fun mapNonEmpty!25892 () Bool)

(declare-fun mapRes!25892 () Bool)

(declare-fun tp!49682 () Bool)

(declare-fun e!474825 () Bool)

(assert (=> mapNonEmpty!25892 (= mapRes!25892 (and tp!49682 e!474825))))

(declare-fun mapKey!25892 () (_ BitVec 32))

(declare-fun mapValue!25892 () ValueCell!7658)

(declare-fun mapRest!25892 () (Array (_ BitVec 32) ValueCell!7658))

(assert (=> mapNonEmpty!25892 (= (arr!23322 _values!688) (store mapRest!25892 mapKey!25892 mapValue!25892))))

(declare-fun b!851304 () Bool)

(declare-fun e!474826 () Bool)

(assert (=> b!851304 (= e!474826 true)))

(declare-fun lt!383296 () tuple2!10704)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!383293 () V!26641)

(declare-fun lt!383290 () ListLongMap!9463)

(declare-fun +!2166 (ListLongMap!9463 tuple2!10704) ListLongMap!9463)

(assert (=> b!851304 (= (+!2166 lt!383290 lt!383296) (+!2166 (+!2166 lt!383290 (tuple2!10705 k0!854 lt!383293)) lt!383296))))

(declare-fun lt!383289 () V!26641)

(assert (=> b!851304 (= lt!383296 (tuple2!10705 k0!854 lt!383289))))

(declare-datatypes ((Unit!29005 0))(
  ( (Unit!29006) )
))
(declare-fun lt!383294 () Unit!29005)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!280 (ListLongMap!9463 (_ BitVec 64) V!26641 V!26641) Unit!29005)

(assert (=> b!851304 (= lt!383294 (addSameAsAddTwiceSameKeyDiffValues!280 lt!383290 k0!854 lt!383293 lt!383289))))

(declare-fun lt!383288 () V!26641)

(declare-fun get!12297 (ValueCell!7658 V!26641) V!26641)

(assert (=> b!851304 (= lt!383293 (get!12297 (select (arr!23322 _values!688) from!1053) lt!383288))))

(declare-fun lt!383291 () ListLongMap!9463)

(assert (=> b!851304 (= lt!383291 (+!2166 lt!383290 (tuple2!10705 (select (arr!23321 _keys!868) from!1053) lt!383289)))))

(declare-fun v!557 () V!26641)

(assert (=> b!851304 (= lt!383289 (get!12297 (select (store (arr!23322 _values!688) i!612 (ValueCellFull!7658 v!557)) from!1053) lt!383288))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1030 (Int (_ BitVec 64)) V!26641)

(assert (=> b!851304 (= lt!383288 (dynLambda!1030 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26641)

(declare-fun zeroValue!654 () V!26641)

(declare-fun lt!383297 () array!48581)

(declare-fun getCurrentListMapNoExtraKeys!2755 (array!48579 array!48581 (_ BitVec 32) (_ BitVec 32) V!26641 V!26641 (_ BitVec 32) Int) ListLongMap!9463)

(assert (=> b!851304 (= lt!383290 (getCurrentListMapNoExtraKeys!2755 _keys!868 lt!383297 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851305 () Bool)

(declare-fun e!474824 () Bool)

(assert (=> b!851305 (= e!474827 (and e!474824 mapRes!25892))))

(declare-fun condMapEmpty!25892 () Bool)

(declare-fun mapDefault!25892 () ValueCell!7658)

(assert (=> b!851305 (= condMapEmpty!25892 (= (arr!23322 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7658)) mapDefault!25892)))))

(declare-fun mapIsEmpty!25892 () Bool)

(assert (=> mapIsEmpty!25892 mapRes!25892))

(declare-fun b!851306 () Bool)

(declare-fun res!578307 () Bool)

(assert (=> b!851306 (=> (not res!578307) (not e!474822))))

(assert (=> b!851306 (= res!578307 (and (= (size!23764 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23763 _keys!868) (size!23764 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851307 () Bool)

(assert (=> b!851307 (= e!474825 tp_is_empty!16195)))

(declare-fun b!851308 () Bool)

(declare-fun res!578300 () Bool)

(assert (=> b!851308 (=> (not res!578300) (not e!474822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48579 (_ BitVec 32)) Bool)

(assert (=> b!851308 (= res!578300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851309 () Bool)

(assert (=> b!851309 (= e!474824 tp_is_empty!16195)))

(declare-fun b!851310 () Bool)

(declare-fun e!474823 () Bool)

(assert (=> b!851310 (= e!474823 (not e!474826))))

(declare-fun res!578306 () Bool)

(assert (=> b!851310 (=> res!578306 e!474826)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851310 (= res!578306 (not (validKeyInArray!0 (select (arr!23321 _keys!868) from!1053))))))

(assert (=> b!851310 e!474828))

(declare-fun c!91694 () Bool)

(assert (=> b!851310 (= c!91694 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383295 () Unit!29005)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!372 (array!48579 array!48581 (_ BitVec 32) (_ BitVec 32) V!26641 V!26641 (_ BitVec 32) (_ BitVec 64) V!26641 (_ BitVec 32) Int) Unit!29005)

(assert (=> b!851310 (= lt!383295 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!372 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38003 () Bool)

(assert (=> bm!38003 (= call!38006 (getCurrentListMapNoExtraKeys!2755 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851311 () Bool)

(assert (=> b!851311 (= e!474822 e!474823)))

(declare-fun res!578298 () Bool)

(assert (=> b!851311 (=> (not res!578298) (not e!474823))))

(assert (=> b!851311 (= res!578298 (= from!1053 i!612))))

(assert (=> b!851311 (= lt!383291 (getCurrentListMapNoExtraKeys!2755 _keys!868 lt!383297 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851311 (= lt!383297 (array!48582 (store (arr!23322 _values!688) i!612 (ValueCellFull!7658 v!557)) (size!23764 _values!688)))))

(declare-fun lt!383292 () ListLongMap!9463)

(assert (=> b!851311 (= lt!383292 (getCurrentListMapNoExtraKeys!2755 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38004 () Bool)

(assert (=> bm!38004 (= call!38007 (getCurrentListMapNoExtraKeys!2755 _keys!868 lt!383297 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851312 () Bool)

(declare-fun res!578303 () Bool)

(assert (=> b!851312 (=> (not res!578303) (not e!474822))))

(assert (=> b!851312 (= res!578303 (and (= (select (arr!23321 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851313 () Bool)

(declare-fun res!578299 () Bool)

(assert (=> b!851313 (=> (not res!578299) (not e!474822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851313 (= res!578299 (validMask!0 mask!1196))))

(declare-fun b!851314 () Bool)

(assert (=> b!851314 (= e!474828 (= call!38007 (+!2166 call!38006 (tuple2!10705 k0!854 v!557))))))

(declare-fun b!851315 () Bool)

(declare-fun res!578301 () Bool)

(assert (=> b!851315 (=> (not res!578301) (not e!474822))))

(assert (=> b!851315 (= res!578301 (validKeyInArray!0 k0!854))))

(declare-fun b!851316 () Bool)

(declare-fun res!578302 () Bool)

(assert (=> b!851316 (=> (not res!578302) (not e!474822))))

(declare-datatypes ((List!16539 0))(
  ( (Nil!16536) (Cons!16535 (h!17666 (_ BitVec 64)) (t!23035 List!16539)) )
))
(declare-fun arrayNoDuplicates!0 (array!48579 (_ BitVec 32) List!16539) Bool)

(assert (=> b!851316 (= res!578302 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16536))))

(assert (= (and start!73126 res!578305) b!851313))

(assert (= (and b!851313 res!578299) b!851306))

(assert (= (and b!851306 res!578307) b!851308))

(assert (= (and b!851308 res!578300) b!851316))

(assert (= (and b!851316 res!578302) b!851303))

(assert (= (and b!851303 res!578304) b!851315))

(assert (= (and b!851315 res!578301) b!851312))

(assert (= (and b!851312 res!578303) b!851311))

(assert (= (and b!851311 res!578298) b!851310))

(assert (= (and b!851310 c!91694) b!851314))

(assert (= (and b!851310 (not c!91694)) b!851302))

(assert (= (or b!851314 b!851302) bm!38004))

(assert (= (or b!851314 b!851302) bm!38003))

(assert (= (and b!851310 (not res!578306)) b!851304))

(assert (= (and b!851305 condMapEmpty!25892) mapIsEmpty!25892))

(assert (= (and b!851305 (not condMapEmpty!25892)) mapNonEmpty!25892))

(get-info :version)

(assert (= (and mapNonEmpty!25892 ((_ is ValueCellFull!7658) mapValue!25892)) b!851307))

(assert (= (and b!851305 ((_ is ValueCellFull!7658) mapDefault!25892)) b!851309))

(assert (= start!73126 b!851305))

(declare-fun b_lambda!11573 () Bool)

(assert (=> (not b_lambda!11573) (not b!851304)))

(declare-fun t!23033 () Bool)

(declare-fun tb!4353 () Bool)

(assert (=> (and start!73126 (= defaultEntry!696 defaultEntry!696) t!23033) tb!4353))

(declare-fun result!8325 () Bool)

(assert (=> tb!4353 (= result!8325 tp_is_empty!16195)))

(assert (=> b!851304 t!23033))

(declare-fun b_and!23253 () Bool)

(assert (= b_and!23251 (and (=> t!23033 result!8325) b_and!23253)))

(declare-fun m!791713 () Bool)

(assert (=> b!851312 m!791713))

(declare-fun m!791715 () Bool)

(assert (=> start!73126 m!791715))

(declare-fun m!791717 () Bool)

(assert (=> start!73126 m!791717))

(declare-fun m!791719 () Bool)

(assert (=> b!851304 m!791719))

(declare-fun m!791721 () Bool)

(assert (=> b!851304 m!791721))

(declare-fun m!791723 () Bool)

(assert (=> b!851304 m!791723))

(declare-fun m!791725 () Bool)

(assert (=> b!851304 m!791725))

(declare-fun m!791727 () Bool)

(assert (=> b!851304 m!791727))

(declare-fun m!791729 () Bool)

(assert (=> b!851304 m!791729))

(assert (=> b!851304 m!791719))

(declare-fun m!791731 () Bool)

(assert (=> b!851304 m!791731))

(declare-fun m!791733 () Bool)

(assert (=> b!851304 m!791733))

(declare-fun m!791735 () Bool)

(assert (=> b!851304 m!791735))

(assert (=> b!851304 m!791731))

(declare-fun m!791737 () Bool)

(assert (=> b!851304 m!791737))

(declare-fun m!791739 () Bool)

(assert (=> b!851304 m!791739))

(declare-fun m!791741 () Bool)

(assert (=> b!851304 m!791741))

(declare-fun m!791743 () Bool)

(assert (=> b!851304 m!791743))

(assert (=> b!851304 m!791725))

(assert (=> bm!38004 m!791723))

(declare-fun m!791745 () Bool)

(assert (=> b!851308 m!791745))

(declare-fun m!791747 () Bool)

(assert (=> b!851316 m!791747))

(declare-fun m!791749 () Bool)

(assert (=> bm!38003 m!791749))

(assert (=> b!851310 m!791739))

(assert (=> b!851310 m!791739))

(declare-fun m!791751 () Bool)

(assert (=> b!851310 m!791751))

(declare-fun m!791753 () Bool)

(assert (=> b!851310 m!791753))

(declare-fun m!791755 () Bool)

(assert (=> b!851314 m!791755))

(declare-fun m!791757 () Bool)

(assert (=> b!851311 m!791757))

(assert (=> b!851311 m!791737))

(declare-fun m!791759 () Bool)

(assert (=> b!851311 m!791759))

(declare-fun m!791761 () Bool)

(assert (=> mapNonEmpty!25892 m!791761))

(declare-fun m!791763 () Bool)

(assert (=> b!851313 m!791763))

(declare-fun m!791765 () Bool)

(assert (=> b!851315 m!791765))

(check-sat (not b!851310) (not start!73126) (not b!851313) (not b!851304) tp_is_empty!16195 (not b!851316) (not b_next!14059) (not b_lambda!11573) (not b!851308) (not mapNonEmpty!25892) b_and!23253 (not bm!38004) (not b!851315) (not bm!38003) (not b!851314) (not b!851311))
(check-sat b_and!23253 (not b_next!14059))
