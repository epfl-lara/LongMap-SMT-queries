; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73198 () Bool)

(assert start!73198)

(declare-fun b_free!14131 () Bool)

(declare-fun b_next!14131 () Bool)

(assert (=> start!73198 (= b_free!14131 (not b_next!14131))))

(declare-fun tp!49897 () Bool)

(declare-fun b_and!23395 () Bool)

(assert (=> start!73198 (= tp!49897 b_and!23395)))

(declare-datatypes ((V!26737 0))(
  ( (V!26738 (val!8181 Int)) )
))
(declare-fun v!557 () V!26737)

(declare-fun e!475692 () Bool)

(declare-fun b!852994 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!10770 0))(
  ( (tuple2!10771 (_1!5396 (_ BitVec 64)) (_2!5396 V!26737)) )
))
(declare-datatypes ((List!16595 0))(
  ( (Nil!16592) (Cons!16591 (h!17722 tuple2!10770) (t!23163 List!16595)) )
))
(declare-datatypes ((ListLongMap!9529 0))(
  ( (ListLongMap!9530 (toList!4780 List!16595)) )
))
(declare-fun call!38222 () ListLongMap!9529)

(declare-fun call!38223 () ListLongMap!9529)

(declare-fun +!2194 (ListLongMap!9529 tuple2!10770) ListLongMap!9529)

(assert (=> b!852994 (= e!475692 (= call!38223 (+!2194 call!38222 (tuple2!10771 k0!854 v!557))))))

(declare-fun b!852995 () Bool)

(declare-fun res!579387 () Bool)

(declare-fun e!475686 () Bool)

(assert (=> b!852995 (=> (not res!579387) (not e!475686))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48719 0))(
  ( (array!48720 (arr!23391 (Array (_ BitVec 32) (_ BitVec 64))) (size!23833 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48719)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!852995 (= res!579387 (and (= (select (arr!23391 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26000 () Bool)

(declare-fun mapRes!26000 () Bool)

(assert (=> mapIsEmpty!26000 mapRes!26000))

(declare-fun b!852996 () Bool)

(declare-fun e!475685 () Bool)

(declare-fun tp_is_empty!16267 () Bool)

(assert (=> b!852996 (= e!475685 tp_is_empty!16267)))

(declare-fun b!852997 () Bool)

(declare-fun e!475687 () Bool)

(assert (=> b!852997 (= e!475686 e!475687)))

(declare-fun res!579381 () Bool)

(assert (=> b!852997 (=> (not res!579381) (not e!475687))))

(assert (=> b!852997 (= res!579381 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!384369 () ListLongMap!9529)

(declare-fun minValue!654 () V!26737)

(declare-fun zeroValue!654 () V!26737)

(declare-datatypes ((ValueCell!7694 0))(
  ( (ValueCellFull!7694 (v!10600 V!26737)) (EmptyCell!7694) )
))
(declare-datatypes ((array!48721 0))(
  ( (array!48722 (arr!23392 (Array (_ BitVec 32) ValueCell!7694)) (size!23834 (_ BitVec 32))) )
))
(declare-fun lt!384373 () array!48721)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2788 (array!48719 array!48721 (_ BitVec 32) (_ BitVec 32) V!26737 V!26737 (_ BitVec 32) Int) ListLongMap!9529)

(assert (=> b!852997 (= lt!384369 (getCurrentListMapNoExtraKeys!2788 _keys!868 lt!384373 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!48721)

(assert (=> b!852997 (= lt!384373 (array!48722 (store (arr!23392 _values!688) i!612 (ValueCellFull!7694 v!557)) (size!23834 _values!688)))))

(declare-fun lt!384377 () ListLongMap!9529)

(assert (=> b!852997 (= lt!384377 (getCurrentListMapNoExtraKeys!2788 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852998 () Bool)

(declare-fun res!579382 () Bool)

(assert (=> b!852998 (=> (not res!579382) (not e!475686))))

(assert (=> b!852998 (= res!579382 (and (= (size!23834 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23833 _keys!868) (size!23834 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852999 () Bool)

(declare-fun res!579384 () Bool)

(assert (=> b!852999 (=> (not res!579384) (not e!475686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852999 (= res!579384 (validKeyInArray!0 k0!854))))

(declare-fun b!853000 () Bool)

(declare-fun res!579383 () Bool)

(assert (=> b!853000 (=> (not res!579383) (not e!475686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853000 (= res!579383 (validMask!0 mask!1196))))

(declare-fun res!579380 () Bool)

(assert (=> start!73198 (=> (not res!579380) (not e!475686))))

(assert (=> start!73198 (= res!579380 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23833 _keys!868))))))

(assert (=> start!73198 e!475686))

(assert (=> start!73198 tp_is_empty!16267))

(assert (=> start!73198 true))

(assert (=> start!73198 tp!49897))

(declare-fun array_inv!18630 (array!48719) Bool)

(assert (=> start!73198 (array_inv!18630 _keys!868)))

(declare-fun e!475689 () Bool)

(declare-fun array_inv!18631 (array!48721) Bool)

(assert (=> start!73198 (and (array_inv!18631 _values!688) e!475689)))

(declare-fun b!853001 () Bool)

(declare-fun e!475688 () Bool)

(assert (=> b!853001 (= e!475689 (and e!475688 mapRes!26000))))

(declare-fun condMapEmpty!26000 () Bool)

(declare-fun mapDefault!26000 () ValueCell!7694)

(assert (=> b!853001 (= condMapEmpty!26000 (= (arr!23392 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7694)) mapDefault!26000)))))

(declare-fun b!853002 () Bool)

(assert (=> b!853002 (= e!475692 (= call!38223 call!38222))))

(declare-fun b!853003 () Bool)

(declare-fun e!475690 () Bool)

(assert (=> b!853003 (= e!475690 true)))

(declare-fun lt!384368 () V!26737)

(declare-fun lt!384374 () ListLongMap!9529)

(declare-fun lt!384371 () tuple2!10770)

(assert (=> b!853003 (= (+!2194 lt!384374 lt!384371) (+!2194 (+!2194 lt!384374 (tuple2!10771 k0!854 lt!384368)) lt!384371))))

(declare-fun lt!384375 () V!26737)

(assert (=> b!853003 (= lt!384371 (tuple2!10771 k0!854 lt!384375))))

(declare-datatypes ((Unit!29059 0))(
  ( (Unit!29060) )
))
(declare-fun lt!384372 () Unit!29059)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!302 (ListLongMap!9529 (_ BitVec 64) V!26737 V!26737) Unit!29059)

(assert (=> b!853003 (= lt!384372 (addSameAsAddTwiceSameKeyDiffValues!302 lt!384374 k0!854 lt!384368 lt!384375))))

(declare-fun lt!384376 () V!26737)

(declare-fun get!12343 (ValueCell!7694 V!26737) V!26737)

(assert (=> b!853003 (= lt!384368 (get!12343 (select (arr!23392 _values!688) from!1053) lt!384376))))

(assert (=> b!853003 (= lt!384369 (+!2194 lt!384374 (tuple2!10771 (select (arr!23391 _keys!868) from!1053) lt!384375)))))

(assert (=> b!853003 (= lt!384375 (get!12343 (select (store (arr!23392 _values!688) i!612 (ValueCellFull!7694 v!557)) from!1053) lt!384376))))

(declare-fun dynLambda!1052 (Int (_ BitVec 64)) V!26737)

(assert (=> b!853003 (= lt!384376 (dynLambda!1052 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853003 (= lt!384374 (getCurrentListMapNoExtraKeys!2788 _keys!868 lt!384373 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853004 () Bool)

(declare-fun res!579385 () Bool)

(assert (=> b!853004 (=> (not res!579385) (not e!475686))))

(declare-datatypes ((List!16596 0))(
  ( (Nil!16593) (Cons!16592 (h!17723 (_ BitVec 64)) (t!23164 List!16596)) )
))
(declare-fun arrayNoDuplicates!0 (array!48719 (_ BitVec 32) List!16596) Bool)

(assert (=> b!853004 (= res!579385 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16593))))

(declare-fun bm!38219 () Bool)

(assert (=> bm!38219 (= call!38223 (getCurrentListMapNoExtraKeys!2788 _keys!868 lt!384373 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853005 () Bool)

(assert (=> b!853005 (= e!475688 tp_is_empty!16267)))

(declare-fun bm!38220 () Bool)

(assert (=> bm!38220 (= call!38222 (getCurrentListMapNoExtraKeys!2788 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853006 () Bool)

(declare-fun res!579379 () Bool)

(assert (=> b!853006 (=> (not res!579379) (not e!475686))))

(assert (=> b!853006 (= res!579379 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23833 _keys!868))))))

(declare-fun mapNonEmpty!26000 () Bool)

(declare-fun tp!49898 () Bool)

(assert (=> mapNonEmpty!26000 (= mapRes!26000 (and tp!49898 e!475685))))

(declare-fun mapRest!26000 () (Array (_ BitVec 32) ValueCell!7694))

(declare-fun mapValue!26000 () ValueCell!7694)

(declare-fun mapKey!26000 () (_ BitVec 32))

(assert (=> mapNonEmpty!26000 (= (arr!23392 _values!688) (store mapRest!26000 mapKey!26000 mapValue!26000))))

(declare-fun b!853007 () Bool)

(declare-fun res!579378 () Bool)

(assert (=> b!853007 (=> (not res!579378) (not e!475686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48719 (_ BitVec 32)) Bool)

(assert (=> b!853007 (= res!579378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853008 () Bool)

(assert (=> b!853008 (= e!475687 (not e!475690))))

(declare-fun res!579386 () Bool)

(assert (=> b!853008 (=> res!579386 e!475690)))

(assert (=> b!853008 (= res!579386 (not (validKeyInArray!0 (select (arr!23391 _keys!868) from!1053))))))

(assert (=> b!853008 e!475692))

(declare-fun c!91802 () Bool)

(assert (=> b!853008 (= c!91802 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384370 () Unit!29059)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!396 (array!48719 array!48721 (_ BitVec 32) (_ BitVec 32) V!26737 V!26737 (_ BitVec 32) (_ BitVec 64) V!26737 (_ BitVec 32) Int) Unit!29059)

(assert (=> b!853008 (= lt!384370 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!396 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73198 res!579380) b!853000))

(assert (= (and b!853000 res!579383) b!852998))

(assert (= (and b!852998 res!579382) b!853007))

(assert (= (and b!853007 res!579378) b!853004))

(assert (= (and b!853004 res!579385) b!853006))

(assert (= (and b!853006 res!579379) b!852999))

(assert (= (and b!852999 res!579384) b!852995))

(assert (= (and b!852995 res!579387) b!852997))

(assert (= (and b!852997 res!579381) b!853008))

(assert (= (and b!853008 c!91802) b!852994))

(assert (= (and b!853008 (not c!91802)) b!853002))

(assert (= (or b!852994 b!853002) bm!38219))

(assert (= (or b!852994 b!853002) bm!38220))

(assert (= (and b!853008 (not res!579386)) b!853003))

(assert (= (and b!853001 condMapEmpty!26000) mapIsEmpty!26000))

(assert (= (and b!853001 (not condMapEmpty!26000)) mapNonEmpty!26000))

(get-info :version)

(assert (= (and mapNonEmpty!26000 ((_ is ValueCellFull!7694) mapValue!26000)) b!852996))

(assert (= (and b!853001 ((_ is ValueCellFull!7694) mapDefault!26000)) b!853005))

(assert (= start!73198 b!853001))

(declare-fun b_lambda!11645 () Bool)

(assert (=> (not b_lambda!11645) (not b!853003)))

(declare-fun t!23162 () Bool)

(declare-fun tb!4425 () Bool)

(assert (=> (and start!73198 (= defaultEntry!696 defaultEntry!696) t!23162) tb!4425))

(declare-fun result!8469 () Bool)

(assert (=> tb!4425 (= result!8469 tp_is_empty!16267)))

(assert (=> b!853003 t!23162))

(declare-fun b_and!23397 () Bool)

(assert (= b_and!23395 (and (=> t!23162 result!8469) b_and!23397)))

(declare-fun m!793657 () Bool)

(assert (=> bm!38219 m!793657))

(declare-fun m!793659 () Bool)

(assert (=> b!852995 m!793659))

(declare-fun m!793661 () Bool)

(assert (=> b!853000 m!793661))

(declare-fun m!793663 () Bool)

(assert (=> b!853003 m!793663))

(declare-fun m!793665 () Bool)

(assert (=> b!853003 m!793665))

(declare-fun m!793667 () Bool)

(assert (=> b!853003 m!793667))

(declare-fun m!793669 () Bool)

(assert (=> b!853003 m!793669))

(declare-fun m!793671 () Bool)

(assert (=> b!853003 m!793671))

(declare-fun m!793673 () Bool)

(assert (=> b!853003 m!793673))

(declare-fun m!793675 () Bool)

(assert (=> b!853003 m!793675))

(assert (=> b!853003 m!793673))

(declare-fun m!793677 () Bool)

(assert (=> b!853003 m!793677))

(assert (=> b!853003 m!793657))

(assert (=> b!853003 m!793663))

(declare-fun m!793679 () Bool)

(assert (=> b!853003 m!793679))

(assert (=> b!853003 m!793669))

(declare-fun m!793681 () Bool)

(assert (=> b!853003 m!793681))

(declare-fun m!793683 () Bool)

(assert (=> b!853003 m!793683))

(declare-fun m!793685 () Bool)

(assert (=> b!853003 m!793685))

(declare-fun m!793687 () Bool)

(assert (=> b!852999 m!793687))

(assert (=> b!853008 m!793683))

(assert (=> b!853008 m!793683))

(declare-fun m!793689 () Bool)

(assert (=> b!853008 m!793689))

(declare-fun m!793691 () Bool)

(assert (=> b!853008 m!793691))

(declare-fun m!793693 () Bool)

(assert (=> bm!38220 m!793693))

(declare-fun m!793695 () Bool)

(assert (=> b!853004 m!793695))

(declare-fun m!793697 () Bool)

(assert (=> b!852994 m!793697))

(declare-fun m!793699 () Bool)

(assert (=> b!852997 m!793699))

(assert (=> b!852997 m!793675))

(declare-fun m!793701 () Bool)

(assert (=> b!852997 m!793701))

(declare-fun m!793703 () Bool)

(assert (=> b!853007 m!793703))

(declare-fun m!793705 () Bool)

(assert (=> mapNonEmpty!26000 m!793705))

(declare-fun m!793707 () Bool)

(assert (=> start!73198 m!793707))

(declare-fun m!793709 () Bool)

(assert (=> start!73198 m!793709))

(check-sat (not bm!38219) (not mapNonEmpty!26000) (not b!853000) (not b!853004) (not b_lambda!11645) (not b!853003) (not b!852999) b_and!23397 (not b!853007) (not bm!38220) (not b!852994) (not b_next!14131) (not start!73198) (not b!853008) tp_is_empty!16267 (not b!852997))
(check-sat b_and!23397 (not b_next!14131))
