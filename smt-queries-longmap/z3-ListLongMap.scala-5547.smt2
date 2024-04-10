; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73068 () Bool)

(assert start!73068)

(declare-fun b_free!13983 () Bool)

(declare-fun b_next!13983 () Bool)

(assert (=> start!73068 (= b_free!13983 (not b_next!13983))))

(declare-fun tp!49452 () Bool)

(declare-fun b_and!23125 () Bool)

(assert (=> start!73068 (= tp!49452 b_and!23125)))

(declare-fun mapIsEmpty!25778 () Bool)

(declare-fun mapRes!25778 () Bool)

(assert (=> mapIsEmpty!25778 mapRes!25778))

(declare-fun mapNonEmpty!25778 () Bool)

(declare-fun tp!49453 () Bool)

(declare-fun e!474063 () Bool)

(assert (=> mapNonEmpty!25778 (= mapRes!25778 (and tp!49453 e!474063))))

(declare-fun mapKey!25778 () (_ BitVec 32))

(declare-datatypes ((V!26539 0))(
  ( (V!26540 (val!8107 Int)) )
))
(declare-datatypes ((ValueCell!7620 0))(
  ( (ValueCellFull!7620 (v!10532 V!26539)) (EmptyCell!7620) )
))
(declare-fun mapRest!25778 () (Array (_ BitVec 32) ValueCell!7620))

(declare-datatypes ((array!48444 0))(
  ( (array!48445 (arr!23253 (Array (_ BitVec 32) ValueCell!7620)) (size!23693 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48444)

(declare-fun mapValue!25778 () ValueCell!7620)

(assert (=> mapNonEmpty!25778 (= (arr!23253 _values!688) (store mapRest!25778 mapKey!25778 mapValue!25778))))

(declare-fun b!849755 () Bool)

(declare-fun res!577269 () Bool)

(declare-fun e!474057 () Bool)

(assert (=> b!849755 (=> (not res!577269) (not e!474057))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48446 0))(
  ( (array!48447 (arr!23254 (Array (_ BitVec 32) (_ BitVec 64))) (size!23694 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48446)

(assert (=> b!849755 (= res!577269 (and (= (size!23693 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23694 _keys!868) (size!23693 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849756 () Bool)

(declare-fun e!474061 () Bool)

(declare-fun e!474062 () Bool)

(assert (=> b!849756 (= e!474061 (not e!474062))))

(declare-fun res!577271 () Bool)

(assert (=> b!849756 (=> res!577271 e!474062)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849756 (= res!577271 (not (validKeyInArray!0 (select (arr!23254 _keys!868) from!1053))))))

(declare-fun e!474064 () Bool)

(assert (=> b!849756 e!474064))

(declare-fun c!91645 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849756 (= c!91645 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26539)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!26539)

(declare-fun zeroValue!654 () V!26539)

(declare-datatypes ((Unit!29013 0))(
  ( (Unit!29014) )
))
(declare-fun lt!382387 () Unit!29013)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!352 (array!48446 array!48444 (_ BitVec 32) (_ BitVec 32) V!26539 V!26539 (_ BitVec 32) (_ BitVec 64) V!26539 (_ BitVec 32) Int) Unit!29013)

(assert (=> b!849756 (= lt!382387 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!352 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849757 () Bool)

(declare-datatypes ((tuple2!10618 0))(
  ( (tuple2!10619 (_1!5320 (_ BitVec 64)) (_2!5320 V!26539)) )
))
(declare-datatypes ((List!16465 0))(
  ( (Nil!16462) (Cons!16461 (h!17592 tuple2!10618) (t!22894 List!16465)) )
))
(declare-datatypes ((ListLongMap!9387 0))(
  ( (ListLongMap!9388 (toList!4709 List!16465)) )
))
(declare-fun call!37804 () ListLongMap!9387)

(declare-fun call!37805 () ListLongMap!9387)

(declare-fun +!2112 (ListLongMap!9387 tuple2!10618) ListLongMap!9387)

(assert (=> b!849757 (= e!474064 (= call!37805 (+!2112 call!37804 (tuple2!10619 k0!854 v!557))))))

(declare-fun b!849758 () Bool)

(assert (=> b!849758 (= e!474064 (= call!37805 call!37804))))

(declare-fun res!577277 () Bool)

(assert (=> start!73068 (=> (not res!577277) (not e!474057))))

(assert (=> start!73068 (= res!577277 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23694 _keys!868))))))

(assert (=> start!73068 e!474057))

(declare-fun tp_is_empty!16119 () Bool)

(assert (=> start!73068 tp_is_empty!16119))

(assert (=> start!73068 true))

(assert (=> start!73068 tp!49452))

(declare-fun array_inv!18452 (array!48446) Bool)

(assert (=> start!73068 (array_inv!18452 _keys!868)))

(declare-fun e!474058 () Bool)

(declare-fun array_inv!18453 (array!48444) Bool)

(assert (=> start!73068 (and (array_inv!18453 _values!688) e!474058)))

(declare-fun b!849759 () Bool)

(declare-fun res!577273 () Bool)

(assert (=> b!849759 (=> (not res!577273) (not e!474057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48446 (_ BitVec 32)) Bool)

(assert (=> b!849759 (= res!577273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849760 () Bool)

(declare-fun res!577270 () Bool)

(assert (=> b!849760 (=> (not res!577270) (not e!474057))))

(assert (=> b!849760 (= res!577270 (validKeyInArray!0 k0!854))))

(declare-fun bm!37801 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2691 (array!48446 array!48444 (_ BitVec 32) (_ BitVec 32) V!26539 V!26539 (_ BitVec 32) Int) ListLongMap!9387)

(assert (=> bm!37801 (= call!37804 (getCurrentListMapNoExtraKeys!2691 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849761 () Bool)

(declare-fun res!577268 () Bool)

(assert (=> b!849761 (=> (not res!577268) (not e!474057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849761 (= res!577268 (validMask!0 mask!1196))))

(declare-fun b!849762 () Bool)

(declare-fun e!474060 () Bool)

(assert (=> b!849762 (= e!474060 tp_is_empty!16119)))

(declare-fun b!849763 () Bool)

(declare-fun res!577275 () Bool)

(assert (=> b!849763 (=> (not res!577275) (not e!474057))))

(assert (=> b!849763 (= res!577275 (and (= (select (arr!23254 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849764 () Bool)

(assert (=> b!849764 (= e!474057 e!474061)))

(declare-fun res!577272 () Bool)

(assert (=> b!849764 (=> (not res!577272) (not e!474061))))

(assert (=> b!849764 (= res!577272 (= from!1053 i!612))))

(declare-fun lt!382391 () ListLongMap!9387)

(declare-fun lt!382393 () array!48444)

(assert (=> b!849764 (= lt!382391 (getCurrentListMapNoExtraKeys!2691 _keys!868 lt!382393 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849764 (= lt!382393 (array!48445 (store (arr!23253 _values!688) i!612 (ValueCellFull!7620 v!557)) (size!23693 _values!688)))))

(declare-fun lt!382390 () ListLongMap!9387)

(assert (=> b!849764 (= lt!382390 (getCurrentListMapNoExtraKeys!2691 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849765 () Bool)

(assert (=> b!849765 (= e!474062 true)))

(declare-fun lt!382386 () tuple2!10618)

(declare-fun lt!382388 () ListLongMap!9387)

(declare-fun lt!382384 () V!26539)

(assert (=> b!849765 (= (+!2112 lt!382388 lt!382386) (+!2112 (+!2112 lt!382388 (tuple2!10619 k0!854 lt!382384)) lt!382386))))

(declare-fun lt!382385 () V!26539)

(assert (=> b!849765 (= lt!382386 (tuple2!10619 k0!854 lt!382385))))

(declare-fun lt!382389 () Unit!29013)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!249 (ListLongMap!9387 (_ BitVec 64) V!26539 V!26539) Unit!29013)

(assert (=> b!849765 (= lt!382389 (addSameAsAddTwiceSameKeyDiffValues!249 lt!382388 k0!854 lt!382384 lt!382385))))

(declare-fun lt!382392 () V!26539)

(declare-fun get!12241 (ValueCell!7620 V!26539) V!26539)

(assert (=> b!849765 (= lt!382384 (get!12241 (select (arr!23253 _values!688) from!1053) lt!382392))))

(assert (=> b!849765 (= lt!382391 (+!2112 lt!382388 (tuple2!10619 (select (arr!23254 _keys!868) from!1053) lt!382385)))))

(assert (=> b!849765 (= lt!382385 (get!12241 (select (store (arr!23253 _values!688) i!612 (ValueCellFull!7620 v!557)) from!1053) lt!382392))))

(declare-fun dynLambda!1003 (Int (_ BitVec 64)) V!26539)

(assert (=> b!849765 (= lt!382392 (dynLambda!1003 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!849765 (= lt!382388 (getCurrentListMapNoExtraKeys!2691 _keys!868 lt!382393 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849766 () Bool)

(declare-fun res!577276 () Bool)

(assert (=> b!849766 (=> (not res!577276) (not e!474057))))

(declare-datatypes ((List!16466 0))(
  ( (Nil!16463) (Cons!16462 (h!17593 (_ BitVec 64)) (t!22895 List!16466)) )
))
(declare-fun arrayNoDuplicates!0 (array!48446 (_ BitVec 32) List!16466) Bool)

(assert (=> b!849766 (= res!577276 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16463))))

(declare-fun bm!37802 () Bool)

(assert (=> bm!37802 (= call!37805 (getCurrentListMapNoExtraKeys!2691 _keys!868 lt!382393 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849767 () Bool)

(declare-fun res!577274 () Bool)

(assert (=> b!849767 (=> (not res!577274) (not e!474057))))

(assert (=> b!849767 (= res!577274 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23694 _keys!868))))))

(declare-fun b!849768 () Bool)

(assert (=> b!849768 (= e!474058 (and e!474060 mapRes!25778))))

(declare-fun condMapEmpty!25778 () Bool)

(declare-fun mapDefault!25778 () ValueCell!7620)

(assert (=> b!849768 (= condMapEmpty!25778 (= (arr!23253 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7620)) mapDefault!25778)))))

(declare-fun b!849769 () Bool)

(assert (=> b!849769 (= e!474063 tp_is_empty!16119)))

(assert (= (and start!73068 res!577277) b!849761))

(assert (= (and b!849761 res!577268) b!849755))

(assert (= (and b!849755 res!577269) b!849759))

(assert (= (and b!849759 res!577273) b!849766))

(assert (= (and b!849766 res!577276) b!849767))

(assert (= (and b!849767 res!577274) b!849760))

(assert (= (and b!849760 res!577270) b!849763))

(assert (= (and b!849763 res!577275) b!849764))

(assert (= (and b!849764 res!577272) b!849756))

(assert (= (and b!849756 c!91645) b!849757))

(assert (= (and b!849756 (not c!91645)) b!849758))

(assert (= (or b!849757 b!849758) bm!37801))

(assert (= (or b!849757 b!849758) bm!37802))

(assert (= (and b!849756 (not res!577271)) b!849765))

(assert (= (and b!849768 condMapEmpty!25778) mapIsEmpty!25778))

(assert (= (and b!849768 (not condMapEmpty!25778)) mapNonEmpty!25778))

(get-info :version)

(assert (= (and mapNonEmpty!25778 ((_ is ValueCellFull!7620) mapValue!25778)) b!849769))

(assert (= (and b!849768 ((_ is ValueCellFull!7620) mapDefault!25778)) b!849762))

(assert (= start!73068 b!849768))

(declare-fun b_lambda!11515 () Bool)

(assert (=> (not b_lambda!11515) (not b!849765)))

(declare-fun t!22893 () Bool)

(declare-fun tb!4285 () Bool)

(assert (=> (and start!73068 (= defaultEntry!696 defaultEntry!696) t!22893) tb!4285))

(declare-fun result!8181 () Bool)

(assert (=> tb!4285 (= result!8181 tp_is_empty!16119)))

(assert (=> b!849765 t!22893))

(declare-fun b_and!23127 () Bool)

(assert (= b_and!23125 (and (=> t!22893 result!8181) b_and!23127)))

(declare-fun m!790413 () Bool)

(assert (=> bm!37802 m!790413))

(declare-fun m!790415 () Bool)

(assert (=> b!849765 m!790415))

(declare-fun m!790417 () Bool)

(assert (=> b!849765 m!790417))

(declare-fun m!790419 () Bool)

(assert (=> b!849765 m!790419))

(declare-fun m!790421 () Bool)

(assert (=> b!849765 m!790421))

(declare-fun m!790423 () Bool)

(assert (=> b!849765 m!790423))

(declare-fun m!790425 () Bool)

(assert (=> b!849765 m!790425))

(assert (=> b!849765 m!790421))

(declare-fun m!790427 () Bool)

(assert (=> b!849765 m!790427))

(assert (=> b!849765 m!790415))

(declare-fun m!790429 () Bool)

(assert (=> b!849765 m!790429))

(assert (=> b!849765 m!790423))

(declare-fun m!790431 () Bool)

(assert (=> b!849765 m!790431))

(declare-fun m!790433 () Bool)

(assert (=> b!849765 m!790433))

(assert (=> b!849765 m!790413))

(declare-fun m!790435 () Bool)

(assert (=> b!849765 m!790435))

(declare-fun m!790437 () Bool)

(assert (=> b!849765 m!790437))

(declare-fun m!790439 () Bool)

(assert (=> b!849766 m!790439))

(declare-fun m!790441 () Bool)

(assert (=> b!849761 m!790441))

(assert (=> b!849756 m!790435))

(assert (=> b!849756 m!790435))

(declare-fun m!790443 () Bool)

(assert (=> b!849756 m!790443))

(declare-fun m!790445 () Bool)

(assert (=> b!849756 m!790445))

(declare-fun m!790447 () Bool)

(assert (=> b!849757 m!790447))

(declare-fun m!790449 () Bool)

(assert (=> b!849764 m!790449))

(assert (=> b!849764 m!790431))

(declare-fun m!790451 () Bool)

(assert (=> b!849764 m!790451))

(declare-fun m!790453 () Bool)

(assert (=> b!849763 m!790453))

(declare-fun m!790455 () Bool)

(assert (=> b!849760 m!790455))

(declare-fun m!790457 () Bool)

(assert (=> bm!37801 m!790457))

(declare-fun m!790459 () Bool)

(assert (=> start!73068 m!790459))

(declare-fun m!790461 () Bool)

(assert (=> start!73068 m!790461))

(declare-fun m!790463 () Bool)

(assert (=> mapNonEmpty!25778 m!790463))

(declare-fun m!790465 () Bool)

(assert (=> b!849759 m!790465))

(check-sat b_and!23127 tp_is_empty!16119 (not b!849766) (not b!849761) (not b!849757) (not b!849765) (not start!73068) (not b_lambda!11515) (not b!849756) (not b!849760) (not b!849764) (not bm!37802) (not b_next!13983) (not bm!37801) (not b!849759) (not mapNonEmpty!25778))
(check-sat b_and!23127 (not b_next!13983))
