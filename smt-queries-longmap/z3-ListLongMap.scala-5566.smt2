; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73348 () Bool)

(assert start!73348)

(declare-fun b_free!14095 () Bool)

(declare-fun b_next!14095 () Bool)

(assert (=> start!73348 (= b_free!14095 (not b_next!14095))))

(declare-fun tp!49789 () Bool)

(declare-fun b_and!23359 () Bool)

(assert (=> start!73348 (= tp!49789 b_and!23359)))

(declare-fun b!853290 () Bool)

(declare-fun res!579295 () Bool)

(declare-fun e!475983 () Bool)

(assert (=> b!853290 (=> (not res!579295) (not e!475983))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48711 0))(
  ( (array!48712 (arr!23382 (Array (_ BitVec 32) (_ BitVec 64))) (size!23823 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48711)

(declare-datatypes ((V!26689 0))(
  ( (V!26690 (val!8163 Int)) )
))
(declare-datatypes ((ValueCell!7676 0))(
  ( (ValueCellFull!7676 (v!10588 V!26689)) (EmptyCell!7676) )
))
(declare-datatypes ((array!48713 0))(
  ( (array!48714 (arr!23383 (Array (_ BitVec 32) ValueCell!7676)) (size!23824 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48713)

(assert (=> b!853290 (= res!579295 (and (= (size!23824 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23823 _keys!868) (size!23824 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38182 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384429 () array!48713)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!10644 0))(
  ( (tuple2!10645 (_1!5333 (_ BitVec 64)) (_2!5333 V!26689)) )
))
(declare-datatypes ((List!16498 0))(
  ( (Nil!16495) (Cons!16494 (h!17631 tuple2!10644) (t!23031 List!16498)) )
))
(declare-datatypes ((ListLongMap!9415 0))(
  ( (ListLongMap!9416 (toList!4723 List!16498)) )
))
(declare-fun call!38186 () ListLongMap!9415)

(declare-fun minValue!654 () V!26689)

(declare-fun zeroValue!654 () V!26689)

(declare-fun getCurrentListMapNoExtraKeys!2781 (array!48711 array!48713 (_ BitVec 32) (_ BitVec 32) V!26689 V!26689 (_ BitVec 32) Int) ListLongMap!9415)

(assert (=> bm!38182 (= call!38186 (getCurrentListMapNoExtraKeys!2781 _keys!868 lt!384429 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853291 () Bool)

(declare-fun e!475989 () Bool)

(declare-fun e!475990 () Bool)

(declare-fun mapRes!25946 () Bool)

(assert (=> b!853291 (= e!475989 (and e!475990 mapRes!25946))))

(declare-fun condMapEmpty!25946 () Bool)

(declare-fun mapDefault!25946 () ValueCell!7676)

(assert (=> b!853291 (= condMapEmpty!25946 (= (arr!23383 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7676)) mapDefault!25946)))))

(declare-fun b!853292 () Bool)

(declare-fun e!475988 () Bool)

(assert (=> b!853292 (= e!475983 e!475988)))

(declare-fun res!579292 () Bool)

(assert (=> b!853292 (=> (not res!579292) (not e!475988))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853292 (= res!579292 (= from!1053 i!612))))

(declare-fun lt!384427 () ListLongMap!9415)

(assert (=> b!853292 (= lt!384427 (getCurrentListMapNoExtraKeys!2781 _keys!868 lt!384429 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26689)

(assert (=> b!853292 (= lt!384429 (array!48714 (store (arr!23383 _values!688) i!612 (ValueCellFull!7676 v!557)) (size!23824 _values!688)))))

(declare-fun lt!384428 () ListLongMap!9415)

(assert (=> b!853292 (= lt!384428 (getCurrentListMapNoExtraKeys!2781 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853293 () Bool)

(declare-fun e!475986 () Bool)

(assert (=> b!853293 (= e!475986 true)))

(declare-fun lt!384432 () ListLongMap!9415)

(declare-fun lt!384431 () V!26689)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!384426 () tuple2!10644)

(declare-fun +!2170 (ListLongMap!9415 tuple2!10644) ListLongMap!9415)

(assert (=> b!853293 (= (+!2170 lt!384432 lt!384426) (+!2170 (+!2170 lt!384432 (tuple2!10645 k0!854 lt!384431)) lt!384426))))

(declare-fun lt!384430 () V!26689)

(assert (=> b!853293 (= lt!384426 (tuple2!10645 k0!854 lt!384430))))

(declare-datatypes ((Unit!29100 0))(
  ( (Unit!29101) )
))
(declare-fun lt!384433 () Unit!29100)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!298 (ListLongMap!9415 (_ BitVec 64) V!26689 V!26689) Unit!29100)

(assert (=> b!853293 (= lt!384433 (addSameAsAddTwiceSameKeyDiffValues!298 lt!384432 k0!854 lt!384431 lt!384430))))

(declare-fun lt!384434 () V!26689)

(declare-fun get!12327 (ValueCell!7676 V!26689) V!26689)

(assert (=> b!853293 (= lt!384431 (get!12327 (select (arr!23383 _values!688) from!1053) lt!384434))))

(assert (=> b!853293 (= lt!384427 (+!2170 lt!384432 (tuple2!10645 (select (arr!23382 _keys!868) from!1053) lt!384430)))))

(assert (=> b!853293 (= lt!384430 (get!12327 (select (store (arr!23383 _values!688) i!612 (ValueCellFull!7676 v!557)) from!1053) lt!384434))))

(declare-fun dynLambda!1045 (Int (_ BitVec 64)) V!26689)

(assert (=> b!853293 (= lt!384434 (dynLambda!1045 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853293 (= lt!384432 (getCurrentListMapNoExtraKeys!2781 _keys!868 lt!384429 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun e!475985 () Bool)

(declare-fun b!853294 () Bool)

(declare-fun call!38185 () ListLongMap!9415)

(assert (=> b!853294 (= e!475985 (= call!38186 (+!2170 call!38185 (tuple2!10645 k0!854 v!557))))))

(declare-fun mapIsEmpty!25946 () Bool)

(assert (=> mapIsEmpty!25946 mapRes!25946))

(declare-fun b!853295 () Bool)

(declare-fun e!475987 () Bool)

(declare-fun tp_is_empty!16231 () Bool)

(assert (=> b!853295 (= e!475987 tp_is_empty!16231)))

(declare-fun b!853296 () Bool)

(declare-fun res!579299 () Bool)

(assert (=> b!853296 (=> (not res!579299) (not e!475983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853296 (= res!579299 (validMask!0 mask!1196))))

(declare-fun res!579296 () Bool)

(assert (=> start!73348 (=> (not res!579296) (not e!475983))))

(assert (=> start!73348 (= res!579296 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23823 _keys!868))))))

(assert (=> start!73348 e!475983))

(assert (=> start!73348 tp_is_empty!16231))

(assert (=> start!73348 true))

(assert (=> start!73348 tp!49789))

(declare-fun array_inv!18596 (array!48711) Bool)

(assert (=> start!73348 (array_inv!18596 _keys!868)))

(declare-fun array_inv!18597 (array!48713) Bool)

(assert (=> start!73348 (and (array_inv!18597 _values!688) e!475989)))

(declare-fun b!853297 () Bool)

(declare-fun res!579300 () Bool)

(assert (=> b!853297 (=> (not res!579300) (not e!475983))))

(assert (=> b!853297 (= res!579300 (and (= (select (arr!23382 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853298 () Bool)

(declare-fun res!579297 () Bool)

(assert (=> b!853298 (=> (not res!579297) (not e!475983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853298 (= res!579297 (validKeyInArray!0 k0!854))))

(declare-fun bm!38183 () Bool)

(assert (=> bm!38183 (= call!38185 (getCurrentListMapNoExtraKeys!2781 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853299 () Bool)

(declare-fun res!579294 () Bool)

(assert (=> b!853299 (=> (not res!579294) (not e!475983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48711 (_ BitVec 32)) Bool)

(assert (=> b!853299 (= res!579294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853300 () Bool)

(assert (=> b!853300 (= e!475988 (not e!475986))))

(declare-fun res!579293 () Bool)

(assert (=> b!853300 (=> res!579293 e!475986)))

(assert (=> b!853300 (= res!579293 (not (validKeyInArray!0 (select (arr!23382 _keys!868) from!1053))))))

(assert (=> b!853300 e!475985))

(declare-fun c!92095 () Bool)

(assert (=> b!853300 (= c!92095 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384425 () Unit!29100)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!376 (array!48711 array!48713 (_ BitVec 32) (_ BitVec 32) V!26689 V!26689 (_ BitVec 32) (_ BitVec 64) V!26689 (_ BitVec 32) Int) Unit!29100)

(assert (=> b!853300 (= lt!384425 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!376 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853301 () Bool)

(assert (=> b!853301 (= e!475985 (= call!38186 call!38185))))

(declare-fun b!853302 () Bool)

(declare-fun res!579301 () Bool)

(assert (=> b!853302 (=> (not res!579301) (not e!475983))))

(declare-datatypes ((List!16499 0))(
  ( (Nil!16496) (Cons!16495 (h!17632 (_ BitVec 64)) (t!23032 List!16499)) )
))
(declare-fun arrayNoDuplicates!0 (array!48711 (_ BitVec 32) List!16499) Bool)

(assert (=> b!853302 (= res!579301 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16496))))

(declare-fun b!853303 () Bool)

(assert (=> b!853303 (= e!475990 tp_is_empty!16231)))

(declare-fun mapNonEmpty!25946 () Bool)

(declare-fun tp!49790 () Bool)

(assert (=> mapNonEmpty!25946 (= mapRes!25946 (and tp!49790 e!475987))))

(declare-fun mapRest!25946 () (Array (_ BitVec 32) ValueCell!7676))

(declare-fun mapValue!25946 () ValueCell!7676)

(declare-fun mapKey!25946 () (_ BitVec 32))

(assert (=> mapNonEmpty!25946 (= (arr!23383 _values!688) (store mapRest!25946 mapKey!25946 mapValue!25946))))

(declare-fun b!853304 () Bool)

(declare-fun res!579298 () Bool)

(assert (=> b!853304 (=> (not res!579298) (not e!475983))))

(assert (=> b!853304 (= res!579298 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23823 _keys!868))))))

(assert (= (and start!73348 res!579296) b!853296))

(assert (= (and b!853296 res!579299) b!853290))

(assert (= (and b!853290 res!579295) b!853299))

(assert (= (and b!853299 res!579294) b!853302))

(assert (= (and b!853302 res!579301) b!853304))

(assert (= (and b!853304 res!579298) b!853298))

(assert (= (and b!853298 res!579297) b!853297))

(assert (= (and b!853297 res!579300) b!853292))

(assert (= (and b!853292 res!579292) b!853300))

(assert (= (and b!853300 c!92095) b!853294))

(assert (= (and b!853300 (not c!92095)) b!853301))

(assert (= (or b!853294 b!853301) bm!38182))

(assert (= (or b!853294 b!853301) bm!38183))

(assert (= (and b!853300 (not res!579293)) b!853293))

(assert (= (and b!853291 condMapEmpty!25946) mapIsEmpty!25946))

(assert (= (and b!853291 (not condMapEmpty!25946)) mapNonEmpty!25946))

(get-info :version)

(assert (= (and mapNonEmpty!25946 ((_ is ValueCellFull!7676) mapValue!25946)) b!853295))

(assert (= (and b!853291 ((_ is ValueCellFull!7676) mapDefault!25946)) b!853303))

(assert (= start!73348 b!853291))

(declare-fun b_lambda!11641 () Bool)

(assert (=> (not b_lambda!11641) (not b!853293)))

(declare-fun t!23030 () Bool)

(declare-fun tb!4389 () Bool)

(assert (=> (and start!73348 (= defaultEntry!696 defaultEntry!696) t!23030) tb!4389))

(declare-fun result!8397 () Bool)

(assert (=> tb!4389 (= result!8397 tp_is_empty!16231)))

(assert (=> b!853293 t!23030))

(declare-fun b_and!23361 () Bool)

(assert (= b_and!23359 (and (=> t!23030 result!8397) b_and!23361)))

(declare-fun m!794731 () Bool)

(assert (=> b!853292 m!794731))

(declare-fun m!794733 () Bool)

(assert (=> b!853292 m!794733))

(declare-fun m!794735 () Bool)

(assert (=> b!853292 m!794735))

(declare-fun m!794737 () Bool)

(assert (=> b!853296 m!794737))

(declare-fun m!794739 () Bool)

(assert (=> b!853298 m!794739))

(declare-fun m!794741 () Bool)

(assert (=> b!853299 m!794741))

(declare-fun m!794743 () Bool)

(assert (=> b!853297 m!794743))

(declare-fun m!794745 () Bool)

(assert (=> start!73348 m!794745))

(declare-fun m!794747 () Bool)

(assert (=> start!73348 m!794747))

(declare-fun m!794749 () Bool)

(assert (=> mapNonEmpty!25946 m!794749))

(declare-fun m!794751 () Bool)

(assert (=> b!853293 m!794751))

(declare-fun m!794753 () Bool)

(assert (=> b!853293 m!794753))

(declare-fun m!794755 () Bool)

(assert (=> b!853293 m!794755))

(declare-fun m!794757 () Bool)

(assert (=> b!853293 m!794757))

(declare-fun m!794759 () Bool)

(assert (=> b!853293 m!794759))

(declare-fun m!794761 () Bool)

(assert (=> b!853293 m!794761))

(declare-fun m!794763 () Bool)

(assert (=> b!853293 m!794763))

(declare-fun m!794765 () Bool)

(assert (=> b!853293 m!794765))

(declare-fun m!794767 () Bool)

(assert (=> b!853293 m!794767))

(assert (=> b!853293 m!794733))

(assert (=> b!853293 m!794765))

(declare-fun m!794769 () Bool)

(assert (=> b!853293 m!794769))

(declare-fun m!794771 () Bool)

(assert (=> b!853293 m!794771))

(assert (=> b!853293 m!794751))

(declare-fun m!794773 () Bool)

(assert (=> b!853293 m!794773))

(assert (=> b!853293 m!794757))

(declare-fun m!794775 () Bool)

(assert (=> b!853302 m!794775))

(assert (=> bm!38182 m!794753))

(assert (=> b!853300 m!794769))

(assert (=> b!853300 m!794769))

(declare-fun m!794777 () Bool)

(assert (=> b!853300 m!794777))

(declare-fun m!794779 () Bool)

(assert (=> b!853300 m!794779))

(declare-fun m!794781 () Bool)

(assert (=> b!853294 m!794781))

(declare-fun m!794783 () Bool)

(assert (=> bm!38183 m!794783))

(check-sat b_and!23361 (not bm!38182) (not b!853294) (not b!853296) (not b_next!14095) (not b!853292) (not b!853300) (not mapNonEmpty!25946) (not b_lambda!11641) (not b!853299) (not bm!38183) (not b!853302) tp_is_empty!16231 (not start!73348) (not b!853293) (not b!853298))
(check-sat b_and!23361 (not b_next!14095))
