; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73110 () Bool)

(assert start!73110)

(declare-fun b_free!14025 () Bool)

(declare-fun b_next!14025 () Bool)

(assert (=> start!73110 (= b_free!14025 (not b_next!14025))))

(declare-fun tp!49578 () Bool)

(declare-fun b_and!23209 () Bool)

(assert (=> start!73110 (= tp!49578 b_and!23209)))

(declare-fun bm!37927 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26595 0))(
  ( (V!26596 (val!8128 Int)) )
))
(declare-datatypes ((tuple2!10658 0))(
  ( (tuple2!10659 (_1!5340 (_ BitVec 64)) (_2!5340 V!26595)) )
))
(declare-datatypes ((List!16500 0))(
  ( (Nil!16497) (Cons!16496 (h!17627 tuple2!10658) (t!22971 List!16500)) )
))
(declare-datatypes ((ListLongMap!9427 0))(
  ( (ListLongMap!9428 (toList!4729 List!16500)) )
))
(declare-fun call!37931 () ListLongMap!9427)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48526 0))(
  ( (array!48527 (arr!23294 (Array (_ BitVec 32) (_ BitVec 64))) (size!23734 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48526)

(declare-datatypes ((ValueCell!7641 0))(
  ( (ValueCellFull!7641 (v!10553 V!26595)) (EmptyCell!7641) )
))
(declare-datatypes ((array!48528 0))(
  ( (array!48529 (arr!23295 (Array (_ BitVec 32) ValueCell!7641)) (size!23735 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48528)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26595)

(declare-fun zeroValue!654 () V!26595)

(declare-fun getCurrentListMapNoExtraKeys!2711 (array!48526 array!48528 (_ BitVec 32) (_ BitVec 32) V!26595 V!26595 (_ BitVec 32) Int) ListLongMap!9427)

(assert (=> bm!37927 (= call!37931 (getCurrentListMapNoExtraKeys!2711 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850742 () Bool)

(declare-fun res!577902 () Bool)

(declare-fun e!474562 () Bool)

(assert (=> b!850742 (=> (not res!577902) (not e!474562))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850742 (= res!577902 (validKeyInArray!0 k0!854))))

(declare-fun b!850743 () Bool)

(declare-fun res!577903 () Bool)

(assert (=> b!850743 (=> (not res!577903) (not e!474562))))

(assert (=> b!850743 (= res!577903 (and (= (size!23735 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23734 _keys!868) (size!23735 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850744 () Bool)

(declare-fun res!577905 () Bool)

(assert (=> b!850744 (=> (not res!577905) (not e!474562))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850744 (= res!577905 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23734 _keys!868))))))

(declare-fun mapIsEmpty!25841 () Bool)

(declare-fun mapRes!25841 () Bool)

(assert (=> mapIsEmpty!25841 mapRes!25841))

(declare-fun b!850745 () Bool)

(declare-fun e!474561 () Bool)

(declare-fun e!474564 () Bool)

(assert (=> b!850745 (= e!474561 (not e!474564))))

(declare-fun res!577900 () Bool)

(assert (=> b!850745 (=> res!577900 e!474564)))

(assert (=> b!850745 (= res!577900 (not (validKeyInArray!0 (select (arr!23294 _keys!868) from!1053))))))

(declare-fun e!474568 () Bool)

(assert (=> b!850745 e!474568))

(declare-fun c!91708 () Bool)

(assert (=> b!850745 (= c!91708 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29051 0))(
  ( (Unit!29052) )
))
(declare-fun lt!383016 () Unit!29051)

(declare-fun v!557 () V!26595)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!367 (array!48526 array!48528 (_ BitVec 32) (_ BitVec 32) V!26595 V!26595 (_ BitVec 32) (_ BitVec 64) V!26595 (_ BitVec 32) Int) Unit!29051)

(assert (=> b!850745 (= lt!383016 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!367 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850746 () Bool)

(declare-fun call!37930 () ListLongMap!9427)

(assert (=> b!850746 (= e!474568 (= call!37930 call!37931))))

(declare-fun b!850747 () Bool)

(assert (=> b!850747 (= e!474562 e!474561)))

(declare-fun res!577898 () Bool)

(assert (=> b!850747 (=> (not res!577898) (not e!474561))))

(assert (=> b!850747 (= res!577898 (= from!1053 i!612))))

(declare-fun lt!383021 () array!48528)

(declare-fun lt!383017 () ListLongMap!9427)

(assert (=> b!850747 (= lt!383017 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!383021 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850747 (= lt!383021 (array!48529 (store (arr!23295 _values!688) i!612 (ValueCellFull!7641 v!557)) (size!23735 _values!688)))))

(declare-fun lt!383023 () ListLongMap!9427)

(assert (=> b!850747 (= lt!383023 (getCurrentListMapNoExtraKeys!2711 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850748 () Bool)

(declare-fun e!474567 () Bool)

(declare-fun tp_is_empty!16161 () Bool)

(assert (=> b!850748 (= e!474567 tp_is_empty!16161)))

(declare-fun b!850749 () Bool)

(declare-fun res!577904 () Bool)

(assert (=> b!850749 (=> (not res!577904) (not e!474562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48526 (_ BitVec 32)) Bool)

(assert (=> b!850749 (= res!577904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850750 () Bool)

(assert (=> b!850750 (= e!474564 true)))

(declare-fun lt!383015 () V!26595)

(declare-fun lt!383014 () tuple2!10658)

(declare-fun lt!383022 () ListLongMap!9427)

(declare-fun +!2130 (ListLongMap!9427 tuple2!10658) ListLongMap!9427)

(assert (=> b!850750 (= (+!2130 lt!383022 lt!383014) (+!2130 (+!2130 lt!383022 (tuple2!10659 k0!854 lt!383015)) lt!383014))))

(declare-fun lt!383020 () V!26595)

(assert (=> b!850750 (= lt!383014 (tuple2!10659 k0!854 lt!383020))))

(declare-fun lt!383019 () Unit!29051)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!265 (ListLongMap!9427 (_ BitVec 64) V!26595 V!26595) Unit!29051)

(assert (=> b!850750 (= lt!383019 (addSameAsAddTwiceSameKeyDiffValues!265 lt!383022 k0!854 lt!383015 lt!383020))))

(declare-fun lt!383018 () V!26595)

(declare-fun get!12271 (ValueCell!7641 V!26595) V!26595)

(assert (=> b!850750 (= lt!383015 (get!12271 (select (arr!23295 _values!688) from!1053) lt!383018))))

(assert (=> b!850750 (= lt!383017 (+!2130 lt!383022 (tuple2!10659 (select (arr!23294 _keys!868) from!1053) lt!383020)))))

(assert (=> b!850750 (= lt!383020 (get!12271 (select (store (arr!23295 _values!688) i!612 (ValueCellFull!7641 v!557)) from!1053) lt!383018))))

(declare-fun dynLambda!1019 (Int (_ BitVec 64)) V!26595)

(assert (=> b!850750 (= lt!383018 (dynLambda!1019 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850750 (= lt!383022 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!383021 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577899 () Bool)

(assert (=> start!73110 (=> (not res!577899) (not e!474562))))

(assert (=> start!73110 (= res!577899 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23734 _keys!868))))))

(assert (=> start!73110 e!474562))

(assert (=> start!73110 tp_is_empty!16161))

(assert (=> start!73110 true))

(assert (=> start!73110 tp!49578))

(declare-fun array_inv!18486 (array!48526) Bool)

(assert (=> start!73110 (array_inv!18486 _keys!868)))

(declare-fun e!474565 () Bool)

(declare-fun array_inv!18487 (array!48528) Bool)

(assert (=> start!73110 (and (array_inv!18487 _values!688) e!474565)))

(declare-fun mapNonEmpty!25841 () Bool)

(declare-fun tp!49579 () Bool)

(assert (=> mapNonEmpty!25841 (= mapRes!25841 (and tp!49579 e!474567))))

(declare-fun mapKey!25841 () (_ BitVec 32))

(declare-fun mapRest!25841 () (Array (_ BitVec 32) ValueCell!7641))

(declare-fun mapValue!25841 () ValueCell!7641)

(assert (=> mapNonEmpty!25841 (= (arr!23295 _values!688) (store mapRest!25841 mapKey!25841 mapValue!25841))))

(declare-fun b!850751 () Bool)

(declare-fun res!577907 () Bool)

(assert (=> b!850751 (=> (not res!577907) (not e!474562))))

(assert (=> b!850751 (= res!577907 (and (= (select (arr!23294 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850752 () Bool)

(declare-fun e!474563 () Bool)

(assert (=> b!850752 (= e!474565 (and e!474563 mapRes!25841))))

(declare-fun condMapEmpty!25841 () Bool)

(declare-fun mapDefault!25841 () ValueCell!7641)

(assert (=> b!850752 (= condMapEmpty!25841 (= (arr!23295 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7641)) mapDefault!25841)))))

(declare-fun b!850753 () Bool)

(declare-fun res!577901 () Bool)

(assert (=> b!850753 (=> (not res!577901) (not e!474562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850753 (= res!577901 (validMask!0 mask!1196))))

(declare-fun b!850754 () Bool)

(declare-fun res!577906 () Bool)

(assert (=> b!850754 (=> (not res!577906) (not e!474562))))

(declare-datatypes ((List!16501 0))(
  ( (Nil!16498) (Cons!16497 (h!17628 (_ BitVec 64)) (t!22972 List!16501)) )
))
(declare-fun arrayNoDuplicates!0 (array!48526 (_ BitVec 32) List!16501) Bool)

(assert (=> b!850754 (= res!577906 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16498))))

(declare-fun b!850755 () Bool)

(assert (=> b!850755 (= e!474563 tp_is_empty!16161)))

(declare-fun bm!37928 () Bool)

(assert (=> bm!37928 (= call!37930 (getCurrentListMapNoExtraKeys!2711 _keys!868 lt!383021 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850756 () Bool)

(assert (=> b!850756 (= e!474568 (= call!37930 (+!2130 call!37931 (tuple2!10659 k0!854 v!557))))))

(assert (= (and start!73110 res!577899) b!850753))

(assert (= (and b!850753 res!577901) b!850743))

(assert (= (and b!850743 res!577903) b!850749))

(assert (= (and b!850749 res!577904) b!850754))

(assert (= (and b!850754 res!577906) b!850744))

(assert (= (and b!850744 res!577905) b!850742))

(assert (= (and b!850742 res!577902) b!850751))

(assert (= (and b!850751 res!577907) b!850747))

(assert (= (and b!850747 res!577898) b!850745))

(assert (= (and b!850745 c!91708) b!850756))

(assert (= (and b!850745 (not c!91708)) b!850746))

(assert (= (or b!850756 b!850746) bm!37928))

(assert (= (or b!850756 b!850746) bm!37927))

(assert (= (and b!850745 (not res!577900)) b!850750))

(assert (= (and b!850752 condMapEmpty!25841) mapIsEmpty!25841))

(assert (= (and b!850752 (not condMapEmpty!25841)) mapNonEmpty!25841))

(get-info :version)

(assert (= (and mapNonEmpty!25841 ((_ is ValueCellFull!7641) mapValue!25841)) b!850748))

(assert (= (and b!850752 ((_ is ValueCellFull!7641) mapDefault!25841)) b!850755))

(assert (= start!73110 b!850752))

(declare-fun b_lambda!11557 () Bool)

(assert (=> (not b_lambda!11557) (not b!850750)))

(declare-fun t!22970 () Bool)

(declare-fun tb!4327 () Bool)

(assert (=> (and start!73110 (= defaultEntry!696 defaultEntry!696) t!22970) tb!4327))

(declare-fun result!8265 () Bool)

(assert (=> tb!4327 (= result!8265 tp_is_empty!16161)))

(assert (=> b!850750 t!22970))

(declare-fun b_and!23211 () Bool)

(assert (= b_and!23209 (and (=> t!22970 result!8265) b_and!23211)))

(declare-fun m!791547 () Bool)

(assert (=> b!850749 m!791547))

(declare-fun m!791549 () Bool)

(assert (=> b!850756 m!791549))

(declare-fun m!791551 () Bool)

(assert (=> mapNonEmpty!25841 m!791551))

(declare-fun m!791553 () Bool)

(assert (=> b!850745 m!791553))

(assert (=> b!850745 m!791553))

(declare-fun m!791555 () Bool)

(assert (=> b!850745 m!791555))

(declare-fun m!791557 () Bool)

(assert (=> b!850745 m!791557))

(declare-fun m!791559 () Bool)

(assert (=> b!850753 m!791559))

(declare-fun m!791561 () Bool)

(assert (=> bm!37928 m!791561))

(declare-fun m!791563 () Bool)

(assert (=> b!850754 m!791563))

(declare-fun m!791565 () Bool)

(assert (=> b!850750 m!791565))

(declare-fun m!791567 () Bool)

(assert (=> b!850750 m!791567))

(declare-fun m!791569 () Bool)

(assert (=> b!850750 m!791569))

(declare-fun m!791571 () Bool)

(assert (=> b!850750 m!791571))

(declare-fun m!791573 () Bool)

(assert (=> b!850750 m!791573))

(declare-fun m!791575 () Bool)

(assert (=> b!850750 m!791575))

(declare-fun m!791577 () Bool)

(assert (=> b!850750 m!791577))

(assert (=> b!850750 m!791569))

(declare-fun m!791579 () Bool)

(assert (=> b!850750 m!791579))

(assert (=> b!850750 m!791571))

(declare-fun m!791581 () Bool)

(assert (=> b!850750 m!791581))

(declare-fun m!791583 () Bool)

(assert (=> b!850750 m!791583))

(assert (=> b!850750 m!791561))

(assert (=> b!850750 m!791575))

(assert (=> b!850750 m!791553))

(declare-fun m!791585 () Bool)

(assert (=> b!850750 m!791585))

(declare-fun m!791587 () Bool)

(assert (=> b!850747 m!791587))

(assert (=> b!850747 m!791583))

(declare-fun m!791589 () Bool)

(assert (=> b!850747 m!791589))

(declare-fun m!791591 () Bool)

(assert (=> b!850751 m!791591))

(declare-fun m!791593 () Bool)

(assert (=> b!850742 m!791593))

(declare-fun m!791595 () Bool)

(assert (=> start!73110 m!791595))

(declare-fun m!791597 () Bool)

(assert (=> start!73110 m!791597))

(declare-fun m!791599 () Bool)

(assert (=> bm!37927 m!791599))

(check-sat (not b!850753) (not bm!37927) (not b!850756) (not b!850754) (not mapNonEmpty!25841) (not bm!37928) (not b!850747) (not b!850745) (not b_lambda!11557) (not b!850750) (not start!73110) (not b_next!14025) (not b!850749) (not b!850742) b_and!23211 tp_is_empty!16161)
(check-sat b_and!23211 (not b_next!14025))
