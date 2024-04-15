; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73192 () Bool)

(assert start!73192)

(declare-fun b_free!14125 () Bool)

(declare-fun b_next!14125 () Bool)

(assert (=> start!73192 (= b_free!14125 (not b_next!14125))))

(declare-fun tp!49879 () Bool)

(declare-fun b_and!23383 () Bool)

(assert (=> start!73192 (= tp!49879 b_and!23383)))

(declare-fun b!852853 () Bool)

(declare-fun e!475613 () Bool)

(declare-fun e!475614 () Bool)

(assert (=> b!852853 (= e!475613 e!475614)))

(declare-fun res!579292 () Bool)

(assert (=> b!852853 (=> (not res!579292) (not e!475614))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852853 (= res!579292 (= from!1053 i!612))))

(declare-datatypes ((V!26729 0))(
  ( (V!26730 (val!8178 Int)) )
))
(declare-datatypes ((tuple2!10764 0))(
  ( (tuple2!10765 (_1!5393 (_ BitVec 64)) (_2!5393 V!26729)) )
))
(declare-datatypes ((List!16589 0))(
  ( (Nil!16586) (Cons!16585 (h!17716 tuple2!10764) (t!23151 List!16589)) )
))
(declare-datatypes ((ListLongMap!9523 0))(
  ( (ListLongMap!9524 (toList!4777 List!16589)) )
))
(declare-fun lt!384286 () ListLongMap!9523)

(declare-datatypes ((ValueCell!7691 0))(
  ( (ValueCellFull!7691 (v!10597 V!26729)) (EmptyCell!7691) )
))
(declare-datatypes ((array!48707 0))(
  ( (array!48708 (arr!23385 (Array (_ BitVec 32) ValueCell!7691)) (size!23827 (_ BitVec 32))) )
))
(declare-fun lt!384282 () array!48707)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48709 0))(
  ( (array!48710 (arr!23386 (Array (_ BitVec 32) (_ BitVec 64))) (size!23828 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48709)

(declare-fun minValue!654 () V!26729)

(declare-fun zeroValue!654 () V!26729)

(declare-fun getCurrentListMapNoExtraKeys!2785 (array!48709 array!48707 (_ BitVec 32) (_ BitVec 32) V!26729 V!26729 (_ BitVec 32) Int) ListLongMap!9523)

(assert (=> b!852853 (= lt!384286 (getCurrentListMapNoExtraKeys!2785 _keys!868 lt!384282 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26729)

(declare-fun _values!688 () array!48707)

(assert (=> b!852853 (= lt!384282 (array!48708 (store (arr!23385 _values!688) i!612 (ValueCellFull!7691 v!557)) (size!23827 _values!688)))))

(declare-fun lt!384283 () ListLongMap!9523)

(assert (=> b!852853 (= lt!384283 (getCurrentListMapNoExtraKeys!2785 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25991 () Bool)

(declare-fun mapRes!25991 () Bool)

(declare-fun tp!49880 () Bool)

(declare-fun e!475616 () Bool)

(assert (=> mapNonEmpty!25991 (= mapRes!25991 (and tp!49880 e!475616))))

(declare-fun mapKey!25991 () (_ BitVec 32))

(declare-fun mapRest!25991 () (Array (_ BitVec 32) ValueCell!7691))

(declare-fun mapValue!25991 () ValueCell!7691)

(assert (=> mapNonEmpty!25991 (= (arr!23385 _values!688) (store mapRest!25991 mapKey!25991 mapValue!25991))))

(declare-fun b!852854 () Bool)

(declare-fun res!579296 () Bool)

(assert (=> b!852854 (=> (not res!579296) (not e!475613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852854 (= res!579296 (validMask!0 mask!1196))))

(declare-fun b!852855 () Bool)

(declare-fun res!579291 () Bool)

(assert (=> b!852855 (=> (not res!579291) (not e!475613))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!852855 (= res!579291 (and (= (select (arr!23386 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!579293 () Bool)

(assert (=> start!73192 (=> (not res!579293) (not e!475613))))

(assert (=> start!73192 (= res!579293 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23828 _keys!868))))))

(assert (=> start!73192 e!475613))

(declare-fun tp_is_empty!16261 () Bool)

(assert (=> start!73192 tp_is_empty!16261))

(assert (=> start!73192 true))

(assert (=> start!73192 tp!49879))

(declare-fun array_inv!18626 (array!48709) Bool)

(assert (=> start!73192 (array_inv!18626 _keys!868)))

(declare-fun e!475615 () Bool)

(declare-fun array_inv!18627 (array!48707) Bool)

(assert (=> start!73192 (and (array_inv!18627 _values!688) e!475615)))

(declare-fun b!852856 () Bool)

(declare-fun e!475617 () Bool)

(assert (=> b!852856 (= e!475614 (not e!475617))))

(declare-fun res!579289 () Bool)

(assert (=> b!852856 (=> res!579289 e!475617)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852856 (= res!579289 (not (validKeyInArray!0 (select (arr!23386 _keys!868) from!1053))))))

(declare-fun e!475620 () Bool)

(assert (=> b!852856 e!475620))

(declare-fun c!91793 () Bool)

(assert (=> b!852856 (= c!91793 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29055 0))(
  ( (Unit!29056) )
))
(declare-fun lt!384284 () Unit!29055)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!394 (array!48709 array!48707 (_ BitVec 32) (_ BitVec 32) V!26729 V!26729 (_ BitVec 32) (_ BitVec 64) V!26729 (_ BitVec 32) Int) Unit!29055)

(assert (=> b!852856 (= lt!384284 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!394 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852857 () Bool)

(declare-fun e!475618 () Bool)

(assert (=> b!852857 (= e!475615 (and e!475618 mapRes!25991))))

(declare-fun condMapEmpty!25991 () Bool)

(declare-fun mapDefault!25991 () ValueCell!7691)

(assert (=> b!852857 (= condMapEmpty!25991 (= (arr!23385 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7691)) mapDefault!25991)))))

(declare-fun b!852858 () Bool)

(declare-fun res!579288 () Bool)

(assert (=> b!852858 (=> (not res!579288) (not e!475613))))

(assert (=> b!852858 (= res!579288 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23828 _keys!868))))))

(declare-fun call!38205 () ListLongMap!9523)

(declare-fun call!38204 () ListLongMap!9523)

(declare-fun b!852859 () Bool)

(declare-fun +!2192 (ListLongMap!9523 tuple2!10764) ListLongMap!9523)

(assert (=> b!852859 (= e!475620 (= call!38205 (+!2192 call!38204 (tuple2!10765 k0!854 v!557))))))

(declare-fun bm!38201 () Bool)

(assert (=> bm!38201 (= call!38205 (getCurrentListMapNoExtraKeys!2785 _keys!868 lt!384282 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852860 () Bool)

(assert (=> b!852860 (= e!475617 true)))

(declare-fun lt!384287 () ListLongMap!9523)

(declare-fun lt!384280 () V!26729)

(declare-fun lt!384279 () tuple2!10764)

(assert (=> b!852860 (= (+!2192 lt!384287 lt!384279) (+!2192 (+!2192 lt!384287 (tuple2!10765 k0!854 lt!384280)) lt!384279))))

(declare-fun lt!384278 () V!26729)

(assert (=> b!852860 (= lt!384279 (tuple2!10765 k0!854 lt!384278))))

(declare-fun lt!384285 () Unit!29055)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!301 (ListLongMap!9523 (_ BitVec 64) V!26729 V!26729) Unit!29055)

(assert (=> b!852860 (= lt!384285 (addSameAsAddTwiceSameKeyDiffValues!301 lt!384287 k0!854 lt!384280 lt!384278))))

(declare-fun lt!384281 () V!26729)

(declare-fun get!12340 (ValueCell!7691 V!26729) V!26729)

(assert (=> b!852860 (= lt!384280 (get!12340 (select (arr!23385 _values!688) from!1053) lt!384281))))

(assert (=> b!852860 (= lt!384286 (+!2192 lt!384287 (tuple2!10765 (select (arr!23386 _keys!868) from!1053) lt!384278)))))

(assert (=> b!852860 (= lt!384278 (get!12340 (select (store (arr!23385 _values!688) i!612 (ValueCellFull!7691 v!557)) from!1053) lt!384281))))

(declare-fun dynLambda!1051 (Int (_ BitVec 64)) V!26729)

(assert (=> b!852860 (= lt!384281 (dynLambda!1051 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852860 (= lt!384287 (getCurrentListMapNoExtraKeys!2785 _keys!868 lt!384282 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852861 () Bool)

(declare-fun res!579295 () Bool)

(assert (=> b!852861 (=> (not res!579295) (not e!475613))))

(assert (=> b!852861 (= res!579295 (and (= (size!23827 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23828 _keys!868) (size!23827 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25991 () Bool)

(assert (=> mapIsEmpty!25991 mapRes!25991))

(declare-fun bm!38202 () Bool)

(assert (=> bm!38202 (= call!38204 (getCurrentListMapNoExtraKeys!2785 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852862 () Bool)

(declare-fun res!579294 () Bool)

(assert (=> b!852862 (=> (not res!579294) (not e!475613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48709 (_ BitVec 32)) Bool)

(assert (=> b!852862 (= res!579294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852863 () Bool)

(assert (=> b!852863 (= e!475618 tp_is_empty!16261)))

(declare-fun b!852864 () Bool)

(declare-fun res!579290 () Bool)

(assert (=> b!852864 (=> (not res!579290) (not e!475613))))

(assert (=> b!852864 (= res!579290 (validKeyInArray!0 k0!854))))

(declare-fun b!852865 () Bool)

(assert (=> b!852865 (= e!475616 tp_is_empty!16261)))

(declare-fun b!852866 () Bool)

(assert (=> b!852866 (= e!475620 (= call!38205 call!38204))))

(declare-fun b!852867 () Bool)

(declare-fun res!579297 () Bool)

(assert (=> b!852867 (=> (not res!579297) (not e!475613))))

(declare-datatypes ((List!16590 0))(
  ( (Nil!16587) (Cons!16586 (h!17717 (_ BitVec 64)) (t!23152 List!16590)) )
))
(declare-fun arrayNoDuplicates!0 (array!48709 (_ BitVec 32) List!16590) Bool)

(assert (=> b!852867 (= res!579297 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16587))))

(assert (= (and start!73192 res!579293) b!852854))

(assert (= (and b!852854 res!579296) b!852861))

(assert (= (and b!852861 res!579295) b!852862))

(assert (= (and b!852862 res!579294) b!852867))

(assert (= (and b!852867 res!579297) b!852858))

(assert (= (and b!852858 res!579288) b!852864))

(assert (= (and b!852864 res!579290) b!852855))

(assert (= (and b!852855 res!579291) b!852853))

(assert (= (and b!852853 res!579292) b!852856))

(assert (= (and b!852856 c!91793) b!852859))

(assert (= (and b!852856 (not c!91793)) b!852866))

(assert (= (or b!852859 b!852866) bm!38201))

(assert (= (or b!852859 b!852866) bm!38202))

(assert (= (and b!852856 (not res!579289)) b!852860))

(assert (= (and b!852857 condMapEmpty!25991) mapIsEmpty!25991))

(assert (= (and b!852857 (not condMapEmpty!25991)) mapNonEmpty!25991))

(get-info :version)

(assert (= (and mapNonEmpty!25991 ((_ is ValueCellFull!7691) mapValue!25991)) b!852865))

(assert (= (and b!852857 ((_ is ValueCellFull!7691) mapDefault!25991)) b!852863))

(assert (= start!73192 b!852857))

(declare-fun b_lambda!11639 () Bool)

(assert (=> (not b_lambda!11639) (not b!852860)))

(declare-fun t!23150 () Bool)

(declare-fun tb!4419 () Bool)

(assert (=> (and start!73192 (= defaultEntry!696 defaultEntry!696) t!23150) tb!4419))

(declare-fun result!8457 () Bool)

(assert (=> tb!4419 (= result!8457 tp_is_empty!16261)))

(assert (=> b!852860 t!23150))

(declare-fun b_and!23385 () Bool)

(assert (= b_and!23383 (and (=> t!23150 result!8457) b_and!23385)))

(declare-fun m!793495 () Bool)

(assert (=> bm!38202 m!793495))

(declare-fun m!793497 () Bool)

(assert (=> b!852854 m!793497))

(declare-fun m!793499 () Bool)

(assert (=> b!852853 m!793499))

(declare-fun m!793501 () Bool)

(assert (=> b!852853 m!793501))

(declare-fun m!793503 () Bool)

(assert (=> b!852853 m!793503))

(declare-fun m!793505 () Bool)

(assert (=> mapNonEmpty!25991 m!793505))

(declare-fun m!793507 () Bool)

(assert (=> bm!38201 m!793507))

(declare-fun m!793509 () Bool)

(assert (=> b!852862 m!793509))

(declare-fun m!793511 () Bool)

(assert (=> b!852856 m!793511))

(assert (=> b!852856 m!793511))

(declare-fun m!793513 () Bool)

(assert (=> b!852856 m!793513))

(declare-fun m!793515 () Bool)

(assert (=> b!852856 m!793515))

(declare-fun m!793517 () Bool)

(assert (=> b!852864 m!793517))

(declare-fun m!793519 () Bool)

(assert (=> b!852855 m!793519))

(declare-fun m!793521 () Bool)

(assert (=> b!852859 m!793521))

(declare-fun m!793523 () Bool)

(assert (=> b!852860 m!793523))

(declare-fun m!793525 () Bool)

(assert (=> b!852860 m!793525))

(assert (=> b!852860 m!793523))

(declare-fun m!793527 () Bool)

(assert (=> b!852860 m!793527))

(declare-fun m!793529 () Bool)

(assert (=> b!852860 m!793529))

(assert (=> b!852860 m!793527))

(assert (=> b!852860 m!793501))

(declare-fun m!793531 () Bool)

(assert (=> b!852860 m!793531))

(declare-fun m!793533 () Bool)

(assert (=> b!852860 m!793533))

(declare-fun m!793535 () Bool)

(assert (=> b!852860 m!793535))

(declare-fun m!793537 () Bool)

(assert (=> b!852860 m!793537))

(assert (=> b!852860 m!793511))

(declare-fun m!793539 () Bool)

(assert (=> b!852860 m!793539))

(declare-fun m!793541 () Bool)

(assert (=> b!852860 m!793541))

(assert (=> b!852860 m!793507))

(assert (=> b!852860 m!793535))

(declare-fun m!793543 () Bool)

(assert (=> b!852867 m!793543))

(declare-fun m!793545 () Bool)

(assert (=> start!73192 m!793545))

(declare-fun m!793547 () Bool)

(assert (=> start!73192 m!793547))

(check-sat (not b!852864) (not b!852867) (not mapNonEmpty!25991) (not b!852856) (not start!73192) (not b!852859) (not b!852862) (not bm!38201) (not bm!38202) b_and!23385 (not b_next!14125) (not b!852854) (not b!852853) (not b!852860) tp_is_empty!16261 (not b_lambda!11639))
(check-sat b_and!23385 (not b_next!14125))
