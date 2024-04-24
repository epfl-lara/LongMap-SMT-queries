; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73240 () Bool)

(assert start!73240)

(declare-fun b_free!13987 () Bool)

(declare-fun b_next!13987 () Bool)

(assert (=> start!73240 (= b_free!13987 (not b_next!13987))))

(declare-fun tp!49465 () Bool)

(declare-fun b_and!23143 () Bool)

(assert (=> start!73240 (= tp!49465 b_and!23143)))

(declare-fun b!850752 () Bool)

(declare-datatypes ((V!26545 0))(
  ( (V!26546 (val!8109 Int)) )
))
(declare-fun v!557 () V!26545)

(declare-datatypes ((tuple2!10548 0))(
  ( (tuple2!10549 (_1!5285 (_ BitVec 64)) (_2!5285 V!26545)) )
))
(declare-datatypes ((List!16413 0))(
  ( (Nil!16410) (Cons!16409 (h!17546 tuple2!10548) (t!22838 List!16413)) )
))
(declare-datatypes ((ListLongMap!9319 0))(
  ( (ListLongMap!9320 (toList!4675 List!16413)) )
))
(declare-fun call!37861 () ListLongMap!9319)

(declare-fun e!474689 () Bool)

(declare-fun call!37862 () ListLongMap!9319)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2126 (ListLongMap!9319 tuple2!10548) ListLongMap!9319)

(assert (=> b!850752 (= e!474689 (= call!37862 (+!2126 call!37861 (tuple2!10549 k0!854 v!557))))))

(declare-fun b!850753 () Bool)

(assert (=> b!850753 (= e!474689 (= call!37862 call!37861))))

(declare-fun b!850754 () Bool)

(declare-fun e!474690 () Bool)

(declare-fun e!474688 () Bool)

(assert (=> b!850754 (= e!474690 (not e!474688))))

(declare-fun res!577675 () Bool)

(assert (=> b!850754 (=> res!577675 e!474688)))

(declare-datatypes ((array!48501 0))(
  ( (array!48502 (arr!23277 (Array (_ BitVec 32) (_ BitVec 64))) (size!23718 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48501)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850754 (= res!577675 (not (validKeyInArray!0 (select (arr!23277 _keys!868) from!1053))))))

(assert (=> b!850754 e!474689))

(declare-fun c!91933 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850754 (= c!91933 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7622 0))(
  ( (ValueCellFull!7622 (v!10534 V!26545)) (EmptyCell!7622) )
))
(declare-datatypes ((array!48503 0))(
  ( (array!48504 (arr!23278 (Array (_ BitVec 32) ValueCell!7622)) (size!23719 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48503)

(declare-fun minValue!654 () V!26545)

(declare-fun zeroValue!654 () V!26545)

(declare-datatypes ((Unit!29018 0))(
  ( (Unit!29019) )
))
(declare-fun lt!382805 () Unit!29018)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!345 (array!48501 array!48503 (_ BitVec 32) (_ BitVec 32) V!26545 V!26545 (_ BitVec 32) (_ BitVec 64) V!26545 (_ BitVec 32) Int) Unit!29018)

(assert (=> b!850754 (= lt!382805 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!345 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37858 () Bool)

(declare-fun lt!382811 () array!48503)

(declare-fun getCurrentListMapNoExtraKeys!2733 (array!48501 array!48503 (_ BitVec 32) (_ BitVec 32) V!26545 V!26545 (_ BitVec 32) Int) ListLongMap!9319)

(assert (=> bm!37858 (= call!37862 (getCurrentListMapNoExtraKeys!2733 _keys!868 lt!382811 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850755 () Bool)

(declare-fun e!474692 () Bool)

(declare-fun tp_is_empty!16123 () Bool)

(assert (=> b!850755 (= e!474692 tp_is_empty!16123)))

(declare-fun bm!37859 () Bool)

(assert (=> bm!37859 (= call!37861 (getCurrentListMapNoExtraKeys!2733 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25784 () Bool)

(declare-fun mapRes!25784 () Bool)

(declare-fun tp!49466 () Bool)

(declare-fun e!474691 () Bool)

(assert (=> mapNonEmpty!25784 (= mapRes!25784 (and tp!49466 e!474691))))

(declare-fun mapKey!25784 () (_ BitVec 32))

(declare-fun mapValue!25784 () ValueCell!7622)

(declare-fun mapRest!25784 () (Array (_ BitVec 32) ValueCell!7622))

(assert (=> mapNonEmpty!25784 (= (arr!23278 _values!688) (store mapRest!25784 mapKey!25784 mapValue!25784))))

(declare-fun res!577676 () Bool)

(declare-fun e!474694 () Bool)

(assert (=> start!73240 (=> (not res!577676) (not e!474694))))

(assert (=> start!73240 (= res!577676 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23718 _keys!868))))))

(assert (=> start!73240 e!474694))

(assert (=> start!73240 tp_is_empty!16123))

(assert (=> start!73240 true))

(assert (=> start!73240 tp!49465))

(declare-fun array_inv!18526 (array!48501) Bool)

(assert (=> start!73240 (array_inv!18526 _keys!868)))

(declare-fun e!474687 () Bool)

(declare-fun array_inv!18527 (array!48503) Bool)

(assert (=> start!73240 (and (array_inv!18527 _values!688) e!474687)))

(declare-fun b!850756 () Bool)

(declare-fun res!577678 () Bool)

(assert (=> b!850756 (=> (not res!577678) (not e!474694))))

(assert (=> b!850756 (= res!577678 (validKeyInArray!0 k0!854))))

(declare-fun b!850757 () Bool)

(declare-fun res!577674 () Bool)

(assert (=> b!850757 (=> (not res!577674) (not e!474694))))

(assert (=> b!850757 (= res!577674 (and (= (size!23719 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23718 _keys!868) (size!23719 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850758 () Bool)

(assert (=> b!850758 (= e!474694 e!474690)))

(declare-fun res!577673 () Bool)

(assert (=> b!850758 (=> (not res!577673) (not e!474690))))

(assert (=> b!850758 (= res!577673 (= from!1053 i!612))))

(declare-fun lt!382809 () ListLongMap!9319)

(assert (=> b!850758 (= lt!382809 (getCurrentListMapNoExtraKeys!2733 _keys!868 lt!382811 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850758 (= lt!382811 (array!48504 (store (arr!23278 _values!688) i!612 (ValueCellFull!7622 v!557)) (size!23719 _values!688)))))

(declare-fun lt!382813 () ListLongMap!9319)

(assert (=> b!850758 (= lt!382813 (getCurrentListMapNoExtraKeys!2733 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850759 () Bool)

(declare-fun res!577677 () Bool)

(assert (=> b!850759 (=> (not res!577677) (not e!474694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48501 (_ BitVec 32)) Bool)

(assert (=> b!850759 (= res!577677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850760 () Bool)

(assert (=> b!850760 (= e!474691 tp_is_empty!16123)))

(declare-fun mapIsEmpty!25784 () Bool)

(assert (=> mapIsEmpty!25784 mapRes!25784))

(declare-fun b!850761 () Bool)

(assert (=> b!850761 (= e!474687 (and e!474692 mapRes!25784))))

(declare-fun condMapEmpty!25784 () Bool)

(declare-fun mapDefault!25784 () ValueCell!7622)

(assert (=> b!850761 (= condMapEmpty!25784 (= (arr!23278 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7622)) mapDefault!25784)))))

(declare-fun b!850762 () Bool)

(declare-fun res!577680 () Bool)

(assert (=> b!850762 (=> (not res!577680) (not e!474694))))

(declare-datatypes ((List!16414 0))(
  ( (Nil!16411) (Cons!16410 (h!17547 (_ BitVec 64)) (t!22839 List!16414)) )
))
(declare-fun arrayNoDuplicates!0 (array!48501 (_ BitVec 32) List!16414) Bool)

(assert (=> b!850762 (= res!577680 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16411))))

(declare-fun b!850763 () Bool)

(declare-fun res!577672 () Bool)

(assert (=> b!850763 (=> (not res!577672) (not e!474694))))

(assert (=> b!850763 (= res!577672 (and (= (select (arr!23277 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850764 () Bool)

(declare-fun res!577681 () Bool)

(assert (=> b!850764 (=> (not res!577681) (not e!474694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850764 (= res!577681 (validMask!0 mask!1196))))

(declare-fun b!850765 () Bool)

(declare-fun res!577679 () Bool)

(assert (=> b!850765 (=> (not res!577679) (not e!474694))))

(assert (=> b!850765 (= res!577679 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23718 _keys!868))))))

(declare-fun b!850766 () Bool)

(assert (=> b!850766 (= e!474688 true)))

(declare-fun lt!382812 () tuple2!10548)

(declare-fun lt!382808 () V!26545)

(declare-fun lt!382807 () ListLongMap!9319)

(assert (=> b!850766 (= (+!2126 lt!382807 lt!382812) (+!2126 (+!2126 lt!382807 (tuple2!10549 k0!854 lt!382808)) lt!382812))))

(declare-fun lt!382810 () V!26545)

(assert (=> b!850766 (= lt!382812 (tuple2!10549 k0!854 lt!382810))))

(declare-fun lt!382806 () Unit!29018)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!257 (ListLongMap!9319 (_ BitVec 64) V!26545 V!26545) Unit!29018)

(assert (=> b!850766 (= lt!382806 (addSameAsAddTwiceSameKeyDiffValues!257 lt!382807 k0!854 lt!382808 lt!382810))))

(declare-fun lt!382814 () V!26545)

(declare-fun get!12250 (ValueCell!7622 V!26545) V!26545)

(assert (=> b!850766 (= lt!382808 (get!12250 (select (arr!23278 _values!688) from!1053) lt!382814))))

(assert (=> b!850766 (= lt!382809 (+!2126 lt!382807 (tuple2!10549 (select (arr!23277 _keys!868) from!1053) lt!382810)))))

(assert (=> b!850766 (= lt!382810 (get!12250 (select (store (arr!23278 _values!688) i!612 (ValueCellFull!7622 v!557)) from!1053) lt!382814))))

(declare-fun dynLambda!1004 (Int (_ BitVec 64)) V!26545)

(assert (=> b!850766 (= lt!382814 (dynLambda!1004 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850766 (= lt!382807 (getCurrentListMapNoExtraKeys!2733 _keys!868 lt!382811 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73240 res!577676) b!850764))

(assert (= (and b!850764 res!577681) b!850757))

(assert (= (and b!850757 res!577674) b!850759))

(assert (= (and b!850759 res!577677) b!850762))

(assert (= (and b!850762 res!577680) b!850765))

(assert (= (and b!850765 res!577679) b!850756))

(assert (= (and b!850756 res!577678) b!850763))

(assert (= (and b!850763 res!577672) b!850758))

(assert (= (and b!850758 res!577673) b!850754))

(assert (= (and b!850754 c!91933) b!850752))

(assert (= (and b!850754 (not c!91933)) b!850753))

(assert (= (or b!850752 b!850753) bm!37858))

(assert (= (or b!850752 b!850753) bm!37859))

(assert (= (and b!850754 (not res!577675)) b!850766))

(assert (= (and b!850761 condMapEmpty!25784) mapIsEmpty!25784))

(assert (= (and b!850761 (not condMapEmpty!25784)) mapNonEmpty!25784))

(get-info :version)

(assert (= (and mapNonEmpty!25784 ((_ is ValueCellFull!7622) mapValue!25784)) b!850760))

(assert (= (and b!850761 ((_ is ValueCellFull!7622) mapDefault!25784)) b!850755))

(assert (= start!73240 b!850761))

(declare-fun b_lambda!11533 () Bool)

(assert (=> (not b_lambda!11533) (not b!850766)))

(declare-fun t!22837 () Bool)

(declare-fun tb!4281 () Bool)

(assert (=> (and start!73240 (= defaultEntry!696 defaultEntry!696) t!22837) tb!4281))

(declare-fun result!8181 () Bool)

(assert (=> tb!4281 (= result!8181 tp_is_empty!16123)))

(assert (=> b!850766 t!22837))

(declare-fun b_and!23145 () Bool)

(assert (= b_and!23143 (and (=> t!22837 result!8181) b_and!23145)))

(declare-fun m!791815 () Bool)

(assert (=> b!850764 m!791815))

(declare-fun m!791817 () Bool)

(assert (=> b!850754 m!791817))

(assert (=> b!850754 m!791817))

(declare-fun m!791819 () Bool)

(assert (=> b!850754 m!791819))

(declare-fun m!791821 () Bool)

(assert (=> b!850754 m!791821))

(declare-fun m!791823 () Bool)

(assert (=> b!850758 m!791823))

(declare-fun m!791825 () Bool)

(assert (=> b!850758 m!791825))

(declare-fun m!791827 () Bool)

(assert (=> b!850758 m!791827))

(declare-fun m!791829 () Bool)

(assert (=> bm!37858 m!791829))

(declare-fun m!791831 () Bool)

(assert (=> b!850752 m!791831))

(declare-fun m!791833 () Bool)

(assert (=> b!850759 m!791833))

(declare-fun m!791835 () Bool)

(assert (=> bm!37859 m!791835))

(declare-fun m!791837 () Bool)

(assert (=> b!850762 m!791837))

(declare-fun m!791839 () Bool)

(assert (=> b!850756 m!791839))

(declare-fun m!791841 () Bool)

(assert (=> mapNonEmpty!25784 m!791841))

(declare-fun m!791843 () Bool)

(assert (=> start!73240 m!791843))

(declare-fun m!791845 () Bool)

(assert (=> start!73240 m!791845))

(declare-fun m!791847 () Bool)

(assert (=> b!850766 m!791847))

(declare-fun m!791849 () Bool)

(assert (=> b!850766 m!791849))

(assert (=> b!850766 m!791849))

(declare-fun m!791851 () Bool)

(assert (=> b!850766 m!791851))

(declare-fun m!791853 () Bool)

(assert (=> b!850766 m!791853))

(declare-fun m!791855 () Bool)

(assert (=> b!850766 m!791855))

(declare-fun m!791857 () Bool)

(assert (=> b!850766 m!791857))

(declare-fun m!791859 () Bool)

(assert (=> b!850766 m!791859))

(assert (=> b!850766 m!791829))

(declare-fun m!791861 () Bool)

(assert (=> b!850766 m!791861))

(assert (=> b!850766 m!791853))

(assert (=> b!850766 m!791857))

(declare-fun m!791863 () Bool)

(assert (=> b!850766 m!791863))

(assert (=> b!850766 m!791825))

(assert (=> b!850766 m!791817))

(declare-fun m!791865 () Bool)

(assert (=> b!850766 m!791865))

(declare-fun m!791867 () Bool)

(assert (=> b!850763 m!791867))

(check-sat b_and!23145 (not b_lambda!11533) (not bm!37858) (not b_next!13987) (not b!850762) (not b!850766) (not mapNonEmpty!25784) (not b!850758) tp_is_empty!16123 (not start!73240) (not b!850764) (not b!850754) (not b!850752) (not b!850759) (not bm!37859) (not b!850756))
(check-sat b_and!23145 (not b_next!13987))
