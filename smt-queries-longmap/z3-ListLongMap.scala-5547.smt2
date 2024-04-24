; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73234 () Bool)

(assert start!73234)

(declare-fun b_free!13981 () Bool)

(declare-fun b_next!13981 () Bool)

(assert (=> start!73234 (= b_free!13981 (not b_next!13981))))

(declare-fun tp!49448 () Bool)

(declare-fun b_and!23131 () Bool)

(assert (=> start!73234 (= tp!49448 b_and!23131)))

(declare-fun b!850611 () Bool)

(declare-fun e!474620 () Bool)

(declare-fun tp_is_empty!16117 () Bool)

(assert (=> b!850611 (= e!474620 tp_is_empty!16117)))

(declare-fun b!850612 () Bool)

(declare-fun e!474618 () Bool)

(assert (=> b!850612 (= e!474618 tp_is_empty!16117)))

(declare-fun b!850613 () Bool)

(declare-fun res!577586 () Bool)

(declare-fun e!474616 () Bool)

(assert (=> b!850613 (=> (not res!577586) (not e!474616))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850613 (= res!577586 (validKeyInArray!0 k0!854))))

(declare-fun b!850614 () Bool)

(declare-fun res!577588 () Bool)

(assert (=> b!850614 (=> (not res!577588) (not e!474616))))

(declare-datatypes ((array!48491 0))(
  ( (array!48492 (arr!23272 (Array (_ BitVec 32) (_ BitVec 64))) (size!23713 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48491)

(declare-datatypes ((List!16410 0))(
  ( (Nil!16407) (Cons!16406 (h!17543 (_ BitVec 64)) (t!22829 List!16410)) )
))
(declare-fun arrayNoDuplicates!0 (array!48491 (_ BitVec 32) List!16410) Bool)

(assert (=> b!850614 (= res!577588 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16407))))

(declare-fun res!577589 () Bool)

(assert (=> start!73234 (=> (not res!577589) (not e!474616))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73234 (= res!577589 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23713 _keys!868))))))

(assert (=> start!73234 e!474616))

(assert (=> start!73234 tp_is_empty!16117))

(assert (=> start!73234 true))

(assert (=> start!73234 tp!49448))

(declare-fun array_inv!18524 (array!48491) Bool)

(assert (=> start!73234 (array_inv!18524 _keys!868)))

(declare-datatypes ((V!26537 0))(
  ( (V!26538 (val!8106 Int)) )
))
(declare-datatypes ((ValueCell!7619 0))(
  ( (ValueCellFull!7619 (v!10531 V!26537)) (EmptyCell!7619) )
))
(declare-datatypes ((array!48493 0))(
  ( (array!48494 (arr!23273 (Array (_ BitVec 32) ValueCell!7619)) (size!23714 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48493)

(declare-fun e!474617 () Bool)

(declare-fun array_inv!18525 (array!48493) Bool)

(assert (=> start!73234 (and (array_inv!18525 _values!688) e!474617)))

(declare-fun b!850615 () Bool)

(declare-fun res!577587 () Bool)

(assert (=> b!850615 (=> (not res!577587) (not e!474616))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48491 (_ BitVec 32)) Bool)

(assert (=> b!850615 (= res!577587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850616 () Bool)

(declare-fun res!577583 () Bool)

(assert (=> b!850616 (=> (not res!577583) (not e!474616))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850616 (= res!577583 (and (= (select (arr!23272 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850617 () Bool)

(declare-fun res!577590 () Bool)

(assert (=> b!850617 (=> (not res!577590) (not e!474616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850617 (= res!577590 (validMask!0 mask!1196))))

(declare-fun b!850618 () Bool)

(declare-fun e!474619 () Bool)

(declare-datatypes ((tuple2!10544 0))(
  ( (tuple2!10545 (_1!5283 (_ BitVec 64)) (_2!5283 V!26537)) )
))
(declare-datatypes ((List!16411 0))(
  ( (Nil!16408) (Cons!16407 (h!17544 tuple2!10544) (t!22830 List!16411)) )
))
(declare-datatypes ((ListLongMap!9315 0))(
  ( (ListLongMap!9316 (toList!4673 List!16411)) )
))
(declare-fun call!37844 () ListLongMap!9315)

(declare-fun call!37843 () ListLongMap!9315)

(assert (=> b!850618 (= e!474619 (= call!37844 call!37843))))

(declare-fun v!557 () V!26537)

(declare-fun b!850619 () Bool)

(declare-fun +!2124 (ListLongMap!9315 tuple2!10544) ListLongMap!9315)

(assert (=> b!850619 (= e!474619 (= call!37844 (+!2124 call!37843 (tuple2!10545 k0!854 v!557))))))

(declare-fun b!850620 () Bool)

(declare-fun mapRes!25775 () Bool)

(assert (=> b!850620 (= e!474617 (and e!474618 mapRes!25775))))

(declare-fun condMapEmpty!25775 () Bool)

(declare-fun mapDefault!25775 () ValueCell!7619)

(assert (=> b!850620 (= condMapEmpty!25775 (= (arr!23273 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7619)) mapDefault!25775)))))

(declare-fun b!850621 () Bool)

(declare-fun e!474615 () Bool)

(assert (=> b!850621 (= e!474616 e!474615)))

(declare-fun res!577584 () Bool)

(assert (=> b!850621 (=> (not res!577584) (not e!474615))))

(assert (=> b!850621 (= res!577584 (= from!1053 i!612))))

(declare-fun lt!382722 () ListLongMap!9315)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!382719 () array!48493)

(declare-fun minValue!654 () V!26537)

(declare-fun zeroValue!654 () V!26537)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2731 (array!48491 array!48493 (_ BitVec 32) (_ BitVec 32) V!26537 V!26537 (_ BitVec 32) Int) ListLongMap!9315)

(assert (=> b!850621 (= lt!382722 (getCurrentListMapNoExtraKeys!2731 _keys!868 lt!382719 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850621 (= lt!382719 (array!48494 (store (arr!23273 _values!688) i!612 (ValueCellFull!7619 v!557)) (size!23714 _values!688)))))

(declare-fun lt!382718 () ListLongMap!9315)

(assert (=> b!850621 (= lt!382718 (getCurrentListMapNoExtraKeys!2731 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37840 () Bool)

(assert (=> bm!37840 (= call!37844 (getCurrentListMapNoExtraKeys!2731 _keys!868 lt!382719 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850622 () Bool)

(declare-fun e!474622 () Bool)

(assert (=> b!850622 (= e!474615 (not e!474622))))

(declare-fun res!577591 () Bool)

(assert (=> b!850622 (=> res!577591 e!474622)))

(assert (=> b!850622 (= res!577591 (not (validKeyInArray!0 (select (arr!23272 _keys!868) from!1053))))))

(assert (=> b!850622 e!474619))

(declare-fun c!91924 () Bool)

(assert (=> b!850622 (= c!91924 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29014 0))(
  ( (Unit!29015) )
))
(declare-fun lt!382717 () Unit!29014)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!343 (array!48491 array!48493 (_ BitVec 32) (_ BitVec 32) V!26537 V!26537 (_ BitVec 32) (_ BitVec 64) V!26537 (_ BitVec 32) Int) Unit!29014)

(assert (=> b!850622 (= lt!382717 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!343 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25775 () Bool)

(assert (=> mapIsEmpty!25775 mapRes!25775))

(declare-fun bm!37841 () Bool)

(assert (=> bm!37841 (= call!37843 (getCurrentListMapNoExtraKeys!2731 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850623 () Bool)

(declare-fun res!577582 () Bool)

(assert (=> b!850623 (=> (not res!577582) (not e!474616))))

(assert (=> b!850623 (= res!577582 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23713 _keys!868))))))

(declare-fun b!850624 () Bool)

(assert (=> b!850624 (= e!474622 true)))

(declare-fun lt!382723 () V!26537)

(declare-fun lt!382720 () tuple2!10544)

(declare-fun lt!382724 () ListLongMap!9315)

(assert (=> b!850624 (= (+!2124 lt!382724 lt!382720) (+!2124 (+!2124 lt!382724 (tuple2!10545 k0!854 lt!382723)) lt!382720))))

(declare-fun lt!382716 () V!26537)

(assert (=> b!850624 (= lt!382720 (tuple2!10545 k0!854 lt!382716))))

(declare-fun lt!382715 () Unit!29014)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!255 (ListLongMap!9315 (_ BitVec 64) V!26537 V!26537) Unit!29014)

(assert (=> b!850624 (= lt!382715 (addSameAsAddTwiceSameKeyDiffValues!255 lt!382724 k0!854 lt!382723 lt!382716))))

(declare-fun lt!382721 () V!26537)

(declare-fun get!12246 (ValueCell!7619 V!26537) V!26537)

(assert (=> b!850624 (= lt!382723 (get!12246 (select (arr!23273 _values!688) from!1053) lt!382721))))

(assert (=> b!850624 (= lt!382722 (+!2124 lt!382724 (tuple2!10545 (select (arr!23272 _keys!868) from!1053) lt!382716)))))

(assert (=> b!850624 (= lt!382716 (get!12246 (select (store (arr!23273 _values!688) i!612 (ValueCellFull!7619 v!557)) from!1053) lt!382721))))

(declare-fun dynLambda!1002 (Int (_ BitVec 64)) V!26537)

(assert (=> b!850624 (= lt!382721 (dynLambda!1002 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850624 (= lt!382724 (getCurrentListMapNoExtraKeys!2731 _keys!868 lt!382719 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850625 () Bool)

(declare-fun res!577585 () Bool)

(assert (=> b!850625 (=> (not res!577585) (not e!474616))))

(assert (=> b!850625 (= res!577585 (and (= (size!23714 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23713 _keys!868) (size!23714 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25775 () Bool)

(declare-fun tp!49447 () Bool)

(assert (=> mapNonEmpty!25775 (= mapRes!25775 (and tp!49447 e!474620))))

(declare-fun mapKey!25775 () (_ BitVec 32))

(declare-fun mapValue!25775 () ValueCell!7619)

(declare-fun mapRest!25775 () (Array (_ BitVec 32) ValueCell!7619))

(assert (=> mapNonEmpty!25775 (= (arr!23273 _values!688) (store mapRest!25775 mapKey!25775 mapValue!25775))))

(assert (= (and start!73234 res!577589) b!850617))

(assert (= (and b!850617 res!577590) b!850625))

(assert (= (and b!850625 res!577585) b!850615))

(assert (= (and b!850615 res!577587) b!850614))

(assert (= (and b!850614 res!577588) b!850623))

(assert (= (and b!850623 res!577582) b!850613))

(assert (= (and b!850613 res!577586) b!850616))

(assert (= (and b!850616 res!577583) b!850621))

(assert (= (and b!850621 res!577584) b!850622))

(assert (= (and b!850622 c!91924) b!850619))

(assert (= (and b!850622 (not c!91924)) b!850618))

(assert (= (or b!850619 b!850618) bm!37840))

(assert (= (or b!850619 b!850618) bm!37841))

(assert (= (and b!850622 (not res!577591)) b!850624))

(assert (= (and b!850620 condMapEmpty!25775) mapIsEmpty!25775))

(assert (= (and b!850620 (not condMapEmpty!25775)) mapNonEmpty!25775))

(get-info :version)

(assert (= (and mapNonEmpty!25775 ((_ is ValueCellFull!7619) mapValue!25775)) b!850611))

(assert (= (and b!850620 ((_ is ValueCellFull!7619) mapDefault!25775)) b!850612))

(assert (= start!73234 b!850620))

(declare-fun b_lambda!11527 () Bool)

(assert (=> (not b_lambda!11527) (not b!850624)))

(declare-fun t!22828 () Bool)

(declare-fun tb!4275 () Bool)

(assert (=> (and start!73234 (= defaultEntry!696 defaultEntry!696) t!22828) tb!4275))

(declare-fun result!8169 () Bool)

(assert (=> tb!4275 (= result!8169 tp_is_empty!16117)))

(assert (=> b!850624 t!22828))

(declare-fun b_and!23133 () Bool)

(assert (= b_and!23131 (and (=> t!22828 result!8169) b_and!23133)))

(declare-fun m!791653 () Bool)

(assert (=> b!850615 m!791653))

(declare-fun m!791655 () Bool)

(assert (=> b!850616 m!791655))

(declare-fun m!791657 () Bool)

(assert (=> bm!37840 m!791657))

(declare-fun m!791659 () Bool)

(assert (=> b!850621 m!791659))

(declare-fun m!791661 () Bool)

(assert (=> b!850621 m!791661))

(declare-fun m!791663 () Bool)

(assert (=> b!850621 m!791663))

(declare-fun m!791665 () Bool)

(assert (=> mapNonEmpty!25775 m!791665))

(declare-fun m!791667 () Bool)

(assert (=> start!73234 m!791667))

(declare-fun m!791669 () Bool)

(assert (=> start!73234 m!791669))

(declare-fun m!791671 () Bool)

(assert (=> b!850613 m!791671))

(declare-fun m!791673 () Bool)

(assert (=> b!850619 m!791673))

(declare-fun m!791675 () Bool)

(assert (=> b!850622 m!791675))

(assert (=> b!850622 m!791675))

(declare-fun m!791677 () Bool)

(assert (=> b!850622 m!791677))

(declare-fun m!791679 () Bool)

(assert (=> b!850622 m!791679))

(declare-fun m!791681 () Bool)

(assert (=> b!850614 m!791681))

(declare-fun m!791683 () Bool)

(assert (=> bm!37841 m!791683))

(declare-fun m!791685 () Bool)

(assert (=> b!850617 m!791685))

(declare-fun m!791687 () Bool)

(assert (=> b!850624 m!791687))

(declare-fun m!791689 () Bool)

(assert (=> b!850624 m!791689))

(declare-fun m!791691 () Bool)

(assert (=> b!850624 m!791691))

(assert (=> b!850624 m!791657))

(assert (=> b!850624 m!791689))

(declare-fun m!791693 () Bool)

(assert (=> b!850624 m!791693))

(declare-fun m!791695 () Bool)

(assert (=> b!850624 m!791695))

(declare-fun m!791697 () Bool)

(assert (=> b!850624 m!791697))

(declare-fun m!791699 () Bool)

(assert (=> b!850624 m!791699))

(declare-fun m!791701 () Bool)

(assert (=> b!850624 m!791701))

(assert (=> b!850624 m!791675))

(declare-fun m!791703 () Bool)

(assert (=> b!850624 m!791703))

(assert (=> b!850624 m!791701))

(declare-fun m!791705 () Bool)

(assert (=> b!850624 m!791705))

(assert (=> b!850624 m!791693))

(assert (=> b!850624 m!791661))

(check-sat (not b_lambda!11527) (not bm!37841) (not b!850621) (not mapNonEmpty!25775) (not b!850614) (not b!850624) (not b!850615) tp_is_empty!16117 (not b!850619) (not b_next!13981) (not start!73234) (not b!850622) (not b!850617) (not b!850613) (not bm!37840) b_and!23133)
(check-sat b_and!23133 (not b_next!13981))
