; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73078 () Bool)

(assert start!73078)

(declare-fun b_free!14011 () Bool)

(declare-fun b_next!14011 () Bool)

(assert (=> start!73078 (= b_free!14011 (not b_next!14011))))

(declare-fun tp!49538 () Bool)

(declare-fun b_and!23155 () Bool)

(assert (=> start!73078 (= tp!49538 b_and!23155)))

(declare-fun b!850174 () Bool)

(declare-fun e!474252 () Bool)

(assert (=> b!850174 (= e!474252 true)))

(declare-datatypes ((V!26577 0))(
  ( (V!26578 (val!8121 Int)) )
))
(declare-datatypes ((tuple2!10664 0))(
  ( (tuple2!10665 (_1!5343 (_ BitVec 64)) (_2!5343 V!26577)) )
))
(declare-datatypes ((List!16504 0))(
  ( (Nil!16501) (Cons!16500 (h!17631 tuple2!10664) (t!22952 List!16504)) )
))
(declare-datatypes ((ListLongMap!9423 0))(
  ( (ListLongMap!9424 (toList!4727 List!16504)) )
))
(declare-fun lt!382572 () ListLongMap!9423)

(declare-fun lt!382568 () tuple2!10664)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!382577 () V!26577)

(declare-fun +!2150 (ListLongMap!9423 tuple2!10664) ListLongMap!9423)

(assert (=> b!850174 (= (+!2150 lt!382572 lt!382568) (+!2150 (+!2150 lt!382572 (tuple2!10665 k0!854 lt!382577)) lt!382568))))

(declare-fun lt!382576 () V!26577)

(assert (=> b!850174 (= lt!382568 (tuple2!10665 k0!854 lt!382576))))

(declare-datatypes ((Unit!28971 0))(
  ( (Unit!28972) )
))
(declare-fun lt!382570 () Unit!28971)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!264 (ListLongMap!9423 (_ BitVec 64) V!26577 V!26577) Unit!28971)

(assert (=> b!850174 (= lt!382570 (addSameAsAddTwiceSameKeyDiffValues!264 lt!382572 k0!854 lt!382577 lt!382576))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!382574 () V!26577)

(declare-datatypes ((ValueCell!7634 0))(
  ( (ValueCellFull!7634 (v!10540 V!26577)) (EmptyCell!7634) )
))
(declare-datatypes ((array!48489 0))(
  ( (array!48490 (arr!23276 (Array (_ BitVec 32) ValueCell!7634)) (size!23718 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48489)

(declare-fun get!12265 (ValueCell!7634 V!26577) V!26577)

(assert (=> b!850174 (= lt!382577 (get!12265 (select (arr!23276 _values!688) from!1053) lt!382574))))

(declare-datatypes ((array!48491 0))(
  ( (array!48492 (arr!23277 (Array (_ BitVec 32) (_ BitVec 64))) (size!23719 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48491)

(declare-fun lt!382573 () ListLongMap!9423)

(assert (=> b!850174 (= lt!382573 (+!2150 lt!382572 (tuple2!10665 (select (arr!23277 _keys!868) from!1053) lt!382576)))))

(declare-fun v!557 () V!26577)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850174 (= lt!382576 (get!12265 (select (store (arr!23276 _values!688) i!612 (ValueCellFull!7634 v!557)) from!1053) lt!382574))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1014 (Int (_ BitVec 64)) V!26577)

(assert (=> b!850174 (= lt!382574 (dynLambda!1014 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382569 () array!48489)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26577)

(declare-fun zeroValue!654 () V!26577)

(declare-fun getCurrentListMapNoExtraKeys!2735 (array!48491 array!48489 (_ BitVec 32) (_ BitVec 32) V!26577 V!26577 (_ BitVec 32) Int) ListLongMap!9423)

(assert (=> b!850174 (= lt!382572 (getCurrentListMapNoExtraKeys!2735 _keys!868 lt!382569 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37859 () Bool)

(declare-fun call!37863 () ListLongMap!9423)

(assert (=> bm!37859 (= call!37863 (getCurrentListMapNoExtraKeys!2735 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577584 () Bool)

(declare-fun e!474248 () Bool)

(assert (=> start!73078 (=> (not res!577584) (not e!474248))))

(assert (=> start!73078 (= res!577584 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23719 _keys!868))))))

(assert (=> start!73078 e!474248))

(declare-fun tp_is_empty!16147 () Bool)

(assert (=> start!73078 tp_is_empty!16147))

(assert (=> start!73078 true))

(assert (=> start!73078 tp!49538))

(declare-fun array_inv!18552 (array!48491) Bool)

(assert (=> start!73078 (array_inv!18552 _keys!868)))

(declare-fun e!474247 () Bool)

(declare-fun array_inv!18553 (array!48489) Bool)

(assert (=> start!73078 (and (array_inv!18553 _values!688) e!474247)))

(declare-fun b!850175 () Bool)

(declare-fun res!577587 () Bool)

(assert (=> b!850175 (=> (not res!577587) (not e!474248))))

(assert (=> b!850175 (= res!577587 (and (= (select (arr!23277 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850176 () Bool)

(declare-fun res!577585 () Bool)

(assert (=> b!850176 (=> (not res!577585) (not e!474248))))

(assert (=> b!850176 (= res!577585 (and (= (size!23718 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23719 _keys!868) (size!23718 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850177 () Bool)

(declare-fun res!577586 () Bool)

(assert (=> b!850177 (=> (not res!577586) (not e!474248))))

(assert (=> b!850177 (= res!577586 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23719 _keys!868))))))

(declare-fun b!850178 () Bool)

(declare-fun e!474246 () Bool)

(declare-fun mapRes!25820 () Bool)

(assert (=> b!850178 (= e!474247 (and e!474246 mapRes!25820))))

(declare-fun condMapEmpty!25820 () Bool)

(declare-fun mapDefault!25820 () ValueCell!7634)

(assert (=> b!850178 (= condMapEmpty!25820 (= (arr!23276 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7634)) mapDefault!25820)))))

(declare-fun call!37862 () ListLongMap!9423)

(declare-fun bm!37860 () Bool)

(assert (=> bm!37860 (= call!37862 (getCurrentListMapNoExtraKeys!2735 _keys!868 lt!382569 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850179 () Bool)

(declare-fun e!474245 () Bool)

(assert (=> b!850179 (= e!474245 (not e!474252))))

(declare-fun res!577582 () Bool)

(assert (=> b!850179 (=> res!577582 e!474252)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850179 (= res!577582 (not (validKeyInArray!0 (select (arr!23277 _keys!868) from!1053))))))

(declare-fun e!474250 () Bool)

(assert (=> b!850179 e!474250))

(declare-fun c!91622 () Bool)

(assert (=> b!850179 (= c!91622 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382571 () Unit!28971)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!360 (array!48491 array!48489 (_ BitVec 32) (_ BitVec 32) V!26577 V!26577 (_ BitVec 32) (_ BitVec 64) V!26577 (_ BitVec 32) Int) Unit!28971)

(assert (=> b!850179 (= lt!382571 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!360 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850180 () Bool)

(declare-fun res!577580 () Bool)

(assert (=> b!850180 (=> (not res!577580) (not e!474248))))

(declare-datatypes ((List!16505 0))(
  ( (Nil!16502) (Cons!16501 (h!17632 (_ BitVec 64)) (t!22953 List!16505)) )
))
(declare-fun arrayNoDuplicates!0 (array!48491 (_ BitVec 32) List!16505) Bool)

(assert (=> b!850180 (= res!577580 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16502))))

(declare-fun mapIsEmpty!25820 () Bool)

(assert (=> mapIsEmpty!25820 mapRes!25820))

(declare-fun b!850181 () Bool)

(declare-fun res!577579 () Bool)

(assert (=> b!850181 (=> (not res!577579) (not e!474248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48491 (_ BitVec 32)) Bool)

(assert (=> b!850181 (= res!577579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850182 () Bool)

(assert (=> b!850182 (= e!474250 (= call!37862 (+!2150 call!37863 (tuple2!10665 k0!854 v!557))))))

(declare-fun b!850183 () Bool)

(assert (=> b!850183 (= e!474246 tp_is_empty!16147)))

(declare-fun b!850184 () Bool)

(assert (=> b!850184 (= e!474250 (= call!37862 call!37863))))

(declare-fun b!850185 () Bool)

(declare-fun res!577583 () Bool)

(assert (=> b!850185 (=> (not res!577583) (not e!474248))))

(assert (=> b!850185 (= res!577583 (validKeyInArray!0 k0!854))))

(declare-fun b!850186 () Bool)

(assert (=> b!850186 (= e!474248 e!474245)))

(declare-fun res!577578 () Bool)

(assert (=> b!850186 (=> (not res!577578) (not e!474245))))

(assert (=> b!850186 (= res!577578 (= from!1053 i!612))))

(assert (=> b!850186 (= lt!382573 (getCurrentListMapNoExtraKeys!2735 _keys!868 lt!382569 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850186 (= lt!382569 (array!48490 (store (arr!23276 _values!688) i!612 (ValueCellFull!7634 v!557)) (size!23718 _values!688)))))

(declare-fun lt!382575 () ListLongMap!9423)

(assert (=> b!850186 (= lt!382575 (getCurrentListMapNoExtraKeys!2735 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25820 () Bool)

(declare-fun tp!49537 () Bool)

(declare-fun e!474251 () Bool)

(assert (=> mapNonEmpty!25820 (= mapRes!25820 (and tp!49537 e!474251))))

(declare-fun mapValue!25820 () ValueCell!7634)

(declare-fun mapKey!25820 () (_ BitVec 32))

(declare-fun mapRest!25820 () (Array (_ BitVec 32) ValueCell!7634))

(assert (=> mapNonEmpty!25820 (= (arr!23276 _values!688) (store mapRest!25820 mapKey!25820 mapValue!25820))))

(declare-fun b!850187 () Bool)

(declare-fun res!577581 () Bool)

(assert (=> b!850187 (=> (not res!577581) (not e!474248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850187 (= res!577581 (validMask!0 mask!1196))))

(declare-fun b!850188 () Bool)

(assert (=> b!850188 (= e!474251 tp_is_empty!16147)))

(assert (= (and start!73078 res!577584) b!850187))

(assert (= (and b!850187 res!577581) b!850176))

(assert (= (and b!850176 res!577585) b!850181))

(assert (= (and b!850181 res!577579) b!850180))

(assert (= (and b!850180 res!577580) b!850177))

(assert (= (and b!850177 res!577586) b!850185))

(assert (= (and b!850185 res!577583) b!850175))

(assert (= (and b!850175 res!577587) b!850186))

(assert (= (and b!850186 res!577578) b!850179))

(assert (= (and b!850179 c!91622) b!850182))

(assert (= (and b!850179 (not c!91622)) b!850184))

(assert (= (or b!850182 b!850184) bm!37860))

(assert (= (or b!850182 b!850184) bm!37859))

(assert (= (and b!850179 (not res!577582)) b!850174))

(assert (= (and b!850178 condMapEmpty!25820) mapIsEmpty!25820))

(assert (= (and b!850178 (not condMapEmpty!25820)) mapNonEmpty!25820))

(get-info :version)

(assert (= (and mapNonEmpty!25820 ((_ is ValueCellFull!7634) mapValue!25820)) b!850188))

(assert (= (and b!850178 ((_ is ValueCellFull!7634) mapDefault!25820)) b!850183))

(assert (= start!73078 b!850178))

(declare-fun b_lambda!11525 () Bool)

(assert (=> (not b_lambda!11525) (not b!850174)))

(declare-fun t!22951 () Bool)

(declare-fun tb!4305 () Bool)

(assert (=> (and start!73078 (= defaultEntry!696 defaultEntry!696) t!22951) tb!4305))

(declare-fun result!8229 () Bool)

(assert (=> tb!4305 (= result!8229 tp_is_empty!16147)))

(assert (=> b!850174 t!22951))

(declare-fun b_and!23157 () Bool)

(assert (= b_and!23155 (and (=> t!22951 result!8229) b_and!23157)))

(declare-fun m!790417 () Bool)

(assert (=> b!850174 m!790417))

(declare-fun m!790419 () Bool)

(assert (=> b!850174 m!790419))

(declare-fun m!790421 () Bool)

(assert (=> b!850174 m!790421))

(assert (=> b!850174 m!790417))

(declare-fun m!790423 () Bool)

(assert (=> b!850174 m!790423))

(declare-fun m!790425 () Bool)

(assert (=> b!850174 m!790425))

(declare-fun m!790427 () Bool)

(assert (=> b!850174 m!790427))

(assert (=> b!850174 m!790419))

(declare-fun m!790429 () Bool)

(assert (=> b!850174 m!790429))

(declare-fun m!790431 () Bool)

(assert (=> b!850174 m!790431))

(declare-fun m!790433 () Bool)

(assert (=> b!850174 m!790433))

(assert (=> b!850174 m!790431))

(declare-fun m!790435 () Bool)

(assert (=> b!850174 m!790435))

(declare-fun m!790437 () Bool)

(assert (=> b!850174 m!790437))

(declare-fun m!790439 () Bool)

(assert (=> b!850174 m!790439))

(declare-fun m!790441 () Bool)

(assert (=> b!850174 m!790441))

(declare-fun m!790443 () Bool)

(assert (=> start!73078 m!790443))

(declare-fun m!790445 () Bool)

(assert (=> start!73078 m!790445))

(assert (=> bm!37860 m!790425))

(declare-fun m!790447 () Bool)

(assert (=> mapNonEmpty!25820 m!790447))

(declare-fun m!790449 () Bool)

(assert (=> b!850186 m!790449))

(assert (=> b!850186 m!790433))

(declare-fun m!790451 () Bool)

(assert (=> b!850186 m!790451))

(declare-fun m!790453 () Bool)

(assert (=> b!850185 m!790453))

(declare-fun m!790455 () Bool)

(assert (=> b!850181 m!790455))

(assert (=> b!850179 m!790439))

(assert (=> b!850179 m!790439))

(declare-fun m!790457 () Bool)

(assert (=> b!850179 m!790457))

(declare-fun m!790459 () Bool)

(assert (=> b!850179 m!790459))

(declare-fun m!790461 () Bool)

(assert (=> b!850175 m!790461))

(declare-fun m!790463 () Bool)

(assert (=> b!850180 m!790463))

(declare-fun m!790465 () Bool)

(assert (=> bm!37859 m!790465))

(declare-fun m!790467 () Bool)

(assert (=> b!850182 m!790467))

(declare-fun m!790469 () Bool)

(assert (=> b!850187 m!790469))

(check-sat tp_is_empty!16147 (not b_next!14011) (not bm!37860) (not mapNonEmpty!25820) (not start!73078) b_and!23157 (not b_lambda!11525) (not b!850185) (not b!850174) (not b!850182) (not bm!37859) (not b!850179) (not b!850181) (not b!850180) (not b!850187) (not b!850186))
(check-sat b_and!23157 (not b_next!14011))
