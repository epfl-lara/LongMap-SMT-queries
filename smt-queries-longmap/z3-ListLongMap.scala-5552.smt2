; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73098 () Bool)

(assert start!73098)

(declare-fun b_free!14013 () Bool)

(declare-fun b_next!14013 () Bool)

(assert (=> start!73098 (= b_free!14013 (not b_next!14013))))

(declare-fun tp!49542 () Bool)

(declare-fun b_and!23185 () Bool)

(assert (=> start!73098 (= tp!49542 b_and!23185)))

(declare-fun b!850460 () Bool)

(declare-fun res!577721 () Bool)

(declare-fun e!474422 () Bool)

(assert (=> b!850460 (=> (not res!577721) (not e!474422))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850460 (= res!577721 (validMask!0 mask!1196))))

(declare-fun b!850461 () Bool)

(declare-fun res!577726 () Bool)

(assert (=> b!850461 (=> (not res!577726) (not e!474422))))

(declare-datatypes ((array!48502 0))(
  ( (array!48503 (arr!23282 (Array (_ BitVec 32) (_ BitVec 64))) (size!23722 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48502)

(declare-datatypes ((List!16490 0))(
  ( (Nil!16487) (Cons!16486 (h!17617 (_ BitVec 64)) (t!22949 List!16490)) )
))
(declare-fun arrayNoDuplicates!0 (array!48502 (_ BitVec 32) List!16490) Bool)

(assert (=> b!850461 (= res!577726 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16487))))

(declare-fun b!850462 () Bool)

(declare-fun e!474423 () Bool)

(assert (=> b!850462 (= e!474422 e!474423)))

(declare-fun res!577720 () Bool)

(assert (=> b!850462 (=> (not res!577720) (not e!474423))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850462 (= res!577720 (= from!1053 i!612))))

(declare-datatypes ((V!26579 0))(
  ( (V!26580 (val!8122 Int)) )
))
(declare-datatypes ((ValueCell!7635 0))(
  ( (ValueCellFull!7635 (v!10547 V!26579)) (EmptyCell!7635) )
))
(declare-datatypes ((array!48504 0))(
  ( (array!48505 (arr!23283 (Array (_ BitVec 32) ValueCell!7635)) (size!23723 (_ BitVec 32))) )
))
(declare-fun lt!382842 () array!48504)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10646 0))(
  ( (tuple2!10647 (_1!5334 (_ BitVec 64)) (_2!5334 V!26579)) )
))
(declare-datatypes ((List!16491 0))(
  ( (Nil!16488) (Cons!16487 (h!17618 tuple2!10646) (t!22950 List!16491)) )
))
(declare-datatypes ((ListLongMap!9415 0))(
  ( (ListLongMap!9416 (toList!4723 List!16491)) )
))
(declare-fun lt!382836 () ListLongMap!9415)

(declare-fun minValue!654 () V!26579)

(declare-fun zeroValue!654 () V!26579)

(declare-fun getCurrentListMapNoExtraKeys!2705 (array!48502 array!48504 (_ BitVec 32) (_ BitVec 32) V!26579 V!26579 (_ BitVec 32) Int) ListLongMap!9415)

(assert (=> b!850462 (= lt!382836 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!382842 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26579)

(declare-fun _values!688 () array!48504)

(assert (=> b!850462 (= lt!382842 (array!48505 (store (arr!23283 _values!688) i!612 (ValueCellFull!7635 v!557)) (size!23723 _values!688)))))

(declare-fun lt!382840 () ListLongMap!9415)

(assert (=> b!850462 (= lt!382840 (getCurrentListMapNoExtraKeys!2705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850463 () Bool)

(declare-fun e!474419 () Bool)

(declare-fun tp_is_empty!16149 () Bool)

(assert (=> b!850463 (= e!474419 tp_is_empty!16149)))

(declare-fun bm!37891 () Bool)

(declare-fun call!37895 () ListLongMap!9415)

(assert (=> bm!37891 (= call!37895 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!382842 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850464 () Bool)

(declare-fun e!474424 () Bool)

(declare-fun mapRes!25823 () Bool)

(assert (=> b!850464 (= e!474424 (and e!474419 mapRes!25823))))

(declare-fun condMapEmpty!25823 () Bool)

(declare-fun mapDefault!25823 () ValueCell!7635)

(assert (=> b!850464 (= condMapEmpty!25823 (= (arr!23283 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7635)) mapDefault!25823)))))

(declare-fun mapNonEmpty!25823 () Bool)

(declare-fun tp!49543 () Bool)

(declare-fun e!474420 () Bool)

(assert (=> mapNonEmpty!25823 (= mapRes!25823 (and tp!49543 e!474420))))

(declare-fun mapKey!25823 () (_ BitVec 32))

(declare-fun mapRest!25823 () (Array (_ BitVec 32) ValueCell!7635))

(declare-fun mapValue!25823 () ValueCell!7635)

(assert (=> mapNonEmpty!25823 (= (arr!23283 _values!688) (store mapRest!25823 mapKey!25823 mapValue!25823))))

(declare-fun b!850465 () Bool)

(declare-fun res!577723 () Bool)

(assert (=> b!850465 (=> (not res!577723) (not e!474422))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850465 (= res!577723 (validKeyInArray!0 k0!854))))

(declare-fun res!577725 () Bool)

(assert (=> start!73098 (=> (not res!577725) (not e!474422))))

(assert (=> start!73098 (= res!577725 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23722 _keys!868))))))

(assert (=> start!73098 e!474422))

(assert (=> start!73098 tp_is_empty!16149))

(assert (=> start!73098 true))

(assert (=> start!73098 tp!49542))

(declare-fun array_inv!18478 (array!48502) Bool)

(assert (=> start!73098 (array_inv!18478 _keys!868)))

(declare-fun array_inv!18479 (array!48504) Bool)

(assert (=> start!73098 (and (array_inv!18479 _values!688) e!474424)))

(declare-fun b!850466 () Bool)

(assert (=> b!850466 (= e!474420 tp_is_empty!16149)))

(declare-fun b!850467 () Bool)

(declare-fun res!577724 () Bool)

(assert (=> b!850467 (=> (not res!577724) (not e!474422))))

(assert (=> b!850467 (= res!577724 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23722 _keys!868))))))

(declare-fun mapIsEmpty!25823 () Bool)

(assert (=> mapIsEmpty!25823 mapRes!25823))

(declare-fun b!850468 () Bool)

(declare-fun res!577719 () Bool)

(assert (=> b!850468 (=> (not res!577719) (not e!474422))))

(assert (=> b!850468 (= res!577719 (and (= (size!23723 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23722 _keys!868) (size!23723 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun call!37894 () ListLongMap!9415)

(declare-fun b!850469 () Bool)

(declare-fun e!474421 () Bool)

(declare-fun +!2125 (ListLongMap!9415 tuple2!10646) ListLongMap!9415)

(assert (=> b!850469 (= e!474421 (= call!37895 (+!2125 call!37894 (tuple2!10647 k0!854 v!557))))))

(declare-fun b!850470 () Bool)

(declare-fun e!474417 () Bool)

(assert (=> b!850470 (= e!474417 true)))

(declare-fun lt!382838 () V!26579)

(declare-fun lt!382841 () ListLongMap!9415)

(declare-fun lt!382837 () tuple2!10646)

(assert (=> b!850470 (= (+!2125 lt!382841 lt!382837) (+!2125 (+!2125 lt!382841 (tuple2!10647 k0!854 lt!382838)) lt!382837))))

(declare-fun lt!382834 () V!26579)

(assert (=> b!850470 (= lt!382837 (tuple2!10647 k0!854 lt!382834))))

(declare-datatypes ((Unit!29041 0))(
  ( (Unit!29042) )
))
(declare-fun lt!382835 () Unit!29041)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!260 (ListLongMap!9415 (_ BitVec 64) V!26579 V!26579) Unit!29041)

(assert (=> b!850470 (= lt!382835 (addSameAsAddTwiceSameKeyDiffValues!260 lt!382841 k0!854 lt!382838 lt!382834))))

(declare-fun lt!382843 () V!26579)

(declare-fun get!12262 (ValueCell!7635 V!26579) V!26579)

(assert (=> b!850470 (= lt!382838 (get!12262 (select (arr!23283 _values!688) from!1053) lt!382843))))

(assert (=> b!850470 (= lt!382836 (+!2125 lt!382841 (tuple2!10647 (select (arr!23282 _keys!868) from!1053) lt!382834)))))

(assert (=> b!850470 (= lt!382834 (get!12262 (select (store (arr!23283 _values!688) i!612 (ValueCellFull!7635 v!557)) from!1053) lt!382843))))

(declare-fun dynLambda!1014 (Int (_ BitVec 64)) V!26579)

(assert (=> b!850470 (= lt!382843 (dynLambda!1014 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850470 (= lt!382841 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!382842 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850471 () Bool)

(declare-fun res!577718 () Bool)

(assert (=> b!850471 (=> (not res!577718) (not e!474422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48502 (_ BitVec 32)) Bool)

(assert (=> b!850471 (= res!577718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850472 () Bool)

(declare-fun res!577727 () Bool)

(assert (=> b!850472 (=> (not res!577727) (not e!474422))))

(assert (=> b!850472 (= res!577727 (and (= (select (arr!23282 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850473 () Bool)

(assert (=> b!850473 (= e!474423 (not e!474417))))

(declare-fun res!577722 () Bool)

(assert (=> b!850473 (=> res!577722 e!474417)))

(assert (=> b!850473 (= res!577722 (not (validKeyInArray!0 (select (arr!23282 _keys!868) from!1053))))))

(assert (=> b!850473 e!474421))

(declare-fun c!91690 () Bool)

(assert (=> b!850473 (= c!91690 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382839 () Unit!29041)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!364 (array!48502 array!48504 (_ BitVec 32) (_ BitVec 32) V!26579 V!26579 (_ BitVec 32) (_ BitVec 64) V!26579 (_ BitVec 32) Int) Unit!29041)

(assert (=> b!850473 (= lt!382839 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!364 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850474 () Bool)

(assert (=> b!850474 (= e!474421 (= call!37895 call!37894))))

(declare-fun bm!37892 () Bool)

(assert (=> bm!37892 (= call!37894 (getCurrentListMapNoExtraKeys!2705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73098 res!577725) b!850460))

(assert (= (and b!850460 res!577721) b!850468))

(assert (= (and b!850468 res!577719) b!850471))

(assert (= (and b!850471 res!577718) b!850461))

(assert (= (and b!850461 res!577726) b!850467))

(assert (= (and b!850467 res!577724) b!850465))

(assert (= (and b!850465 res!577723) b!850472))

(assert (= (and b!850472 res!577727) b!850462))

(assert (= (and b!850462 res!577720) b!850473))

(assert (= (and b!850473 c!91690) b!850469))

(assert (= (and b!850473 (not c!91690)) b!850474))

(assert (= (or b!850469 b!850474) bm!37891))

(assert (= (or b!850469 b!850474) bm!37892))

(assert (= (and b!850473 (not res!577722)) b!850470))

(assert (= (and b!850464 condMapEmpty!25823) mapIsEmpty!25823))

(assert (= (and b!850464 (not condMapEmpty!25823)) mapNonEmpty!25823))

(get-info :version)

(assert (= (and mapNonEmpty!25823 ((_ is ValueCellFull!7635) mapValue!25823)) b!850466))

(assert (= (and b!850464 ((_ is ValueCellFull!7635) mapDefault!25823)) b!850463))

(assert (= start!73098 b!850464))

(declare-fun b_lambda!11545 () Bool)

(assert (=> (not b_lambda!11545) (not b!850470)))

(declare-fun t!22948 () Bool)

(declare-fun tb!4315 () Bool)

(assert (=> (and start!73098 (= defaultEntry!696 defaultEntry!696) t!22948) tb!4315))

(declare-fun result!8241 () Bool)

(assert (=> tb!4315 (= result!8241 tp_is_empty!16149)))

(assert (=> b!850470 t!22948))

(declare-fun b_and!23187 () Bool)

(assert (= b_and!23185 (and (=> t!22948 result!8241) b_and!23187)))

(declare-fun m!791223 () Bool)

(assert (=> b!850465 m!791223))

(declare-fun m!791225 () Bool)

(assert (=> b!850469 m!791225))

(declare-fun m!791227 () Bool)

(assert (=> b!850462 m!791227))

(declare-fun m!791229 () Bool)

(assert (=> b!850462 m!791229))

(declare-fun m!791231 () Bool)

(assert (=> b!850462 m!791231))

(declare-fun m!791233 () Bool)

(assert (=> b!850471 m!791233))

(declare-fun m!791235 () Bool)

(assert (=> b!850473 m!791235))

(assert (=> b!850473 m!791235))

(declare-fun m!791237 () Bool)

(assert (=> b!850473 m!791237))

(declare-fun m!791239 () Bool)

(assert (=> b!850473 m!791239))

(declare-fun m!791241 () Bool)

(assert (=> start!73098 m!791241))

(declare-fun m!791243 () Bool)

(assert (=> start!73098 m!791243))

(declare-fun m!791245 () Bool)

(assert (=> b!850470 m!791245))

(declare-fun m!791247 () Bool)

(assert (=> b!850470 m!791247))

(declare-fun m!791249 () Bool)

(assert (=> b!850470 m!791249))

(declare-fun m!791251 () Bool)

(assert (=> b!850470 m!791251))

(declare-fun m!791253 () Bool)

(assert (=> b!850470 m!791253))

(declare-fun m!791255 () Bool)

(assert (=> b!850470 m!791255))

(declare-fun m!791257 () Bool)

(assert (=> b!850470 m!791257))

(declare-fun m!791259 () Bool)

(assert (=> b!850470 m!791259))

(declare-fun m!791261 () Bool)

(assert (=> b!850470 m!791261))

(declare-fun m!791263 () Bool)

(assert (=> b!850470 m!791263))

(assert (=> b!850470 m!791257))

(assert (=> b!850470 m!791229))

(assert (=> b!850470 m!791249))

(assert (=> b!850470 m!791253))

(assert (=> b!850470 m!791235))

(declare-fun m!791265 () Bool)

(assert (=> b!850470 m!791265))

(declare-fun m!791267 () Bool)

(assert (=> b!850460 m!791267))

(assert (=> bm!37891 m!791247))

(declare-fun m!791269 () Bool)

(assert (=> mapNonEmpty!25823 m!791269))

(declare-fun m!791271 () Bool)

(assert (=> b!850472 m!791271))

(declare-fun m!791273 () Bool)

(assert (=> bm!37892 m!791273))

(declare-fun m!791275 () Bool)

(assert (=> b!850461 m!791275))

(check-sat tp_is_empty!16149 (not b!850462) b_and!23187 (not bm!37892) (not b!850460) (not b!850461) (not mapNonEmpty!25823) (not b!850473) (not b!850470) (not b!850471) (not start!73098) (not b!850469) (not b_next!14013) (not bm!37891) (not b!850465) (not b_lambda!11545))
(check-sat b_and!23187 (not b_next!14013))
