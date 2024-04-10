; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73116 () Bool)

(assert start!73116)

(declare-fun b_free!14031 () Bool)

(declare-fun b_next!14031 () Bool)

(assert (=> start!73116 (= b_free!14031 (not b_next!14031))))

(declare-fun tp!49596 () Bool)

(declare-fun b_and!23221 () Bool)

(assert (=> start!73116 (= tp!49596 b_and!23221)))

(declare-fun res!577997 () Bool)

(declare-fun e!474635 () Bool)

(assert (=> start!73116 (=> (not res!577997) (not e!474635))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48538 0))(
  ( (array!48539 (arr!23300 (Array (_ BitVec 32) (_ BitVec 64))) (size!23740 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48538)

(assert (=> start!73116 (= res!577997 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23740 _keys!868))))))

(assert (=> start!73116 e!474635))

(declare-fun tp_is_empty!16167 () Bool)

(assert (=> start!73116 tp_is_empty!16167))

(assert (=> start!73116 true))

(assert (=> start!73116 tp!49596))

(declare-fun array_inv!18490 (array!48538) Bool)

(assert (=> start!73116 (array_inv!18490 _keys!868)))

(declare-datatypes ((V!26603 0))(
  ( (V!26604 (val!8131 Int)) )
))
(declare-datatypes ((ValueCell!7644 0))(
  ( (ValueCellFull!7644 (v!10556 V!26603)) (EmptyCell!7644) )
))
(declare-datatypes ((array!48540 0))(
  ( (array!48541 (arr!23301 (Array (_ BitVec 32) ValueCell!7644)) (size!23741 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48540)

(declare-fun e!474639 () Bool)

(declare-fun array_inv!18491 (array!48540) Bool)

(assert (=> start!73116 (and (array_inv!18491 _values!688) e!474639)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10664 0))(
  ( (tuple2!10665 (_1!5343 (_ BitVec 64)) (_2!5343 V!26603)) )
))
(declare-datatypes ((List!16505 0))(
  ( (Nil!16502) (Cons!16501 (h!17632 tuple2!10664) (t!22982 List!16505)) )
))
(declare-datatypes ((ListLongMap!9433 0))(
  ( (ListLongMap!9434 (toList!4732 List!16505)) )
))
(declare-fun call!37949 () ListLongMap!9433)

(declare-fun bm!37945 () Bool)

(declare-fun minValue!654 () V!26603)

(declare-fun zeroValue!654 () V!26603)

(declare-fun getCurrentListMapNoExtraKeys!2714 (array!48538 array!48540 (_ BitVec 32) (_ BitVec 32) V!26603 V!26603 (_ BitVec 32) Int) ListLongMap!9433)

(assert (=> bm!37945 (= call!37949 (getCurrentListMapNoExtraKeys!2714 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25850 () Bool)

(declare-fun mapRes!25850 () Bool)

(assert (=> mapIsEmpty!25850 mapRes!25850))

(declare-fun b!850883 () Bool)

(declare-fun e!474640 () Bool)

(assert (=> b!850883 (= e!474640 tp_is_empty!16167)))

(declare-fun b!850884 () Bool)

(declare-fun res!577990 () Bool)

(assert (=> b!850884 (=> (not res!577990) (not e!474635))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850884 (= res!577990 (validKeyInArray!0 k0!854))))

(declare-fun b!850885 () Bool)

(declare-fun res!577993 () Bool)

(assert (=> b!850885 (=> (not res!577993) (not e!474635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850885 (= res!577993 (validMask!0 mask!1196))))

(declare-fun b!850886 () Bool)

(declare-fun res!577992 () Bool)

(assert (=> b!850886 (=> (not res!577992) (not e!474635))))

(declare-datatypes ((List!16506 0))(
  ( (Nil!16503) (Cons!16502 (h!17633 (_ BitVec 64)) (t!22983 List!16506)) )
))
(declare-fun arrayNoDuplicates!0 (array!48538 (_ BitVec 32) List!16506) Bool)

(assert (=> b!850886 (= res!577992 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16503))))

(declare-fun b!850887 () Bool)

(declare-fun res!577996 () Bool)

(assert (=> b!850887 (=> (not res!577996) (not e!474635))))

(assert (=> b!850887 (= res!577996 (and (= (size!23741 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23740 _keys!868) (size!23741 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun call!37948 () ListLongMap!9433)

(declare-fun lt!383111 () array!48540)

(declare-fun bm!37946 () Bool)

(assert (=> bm!37946 (= call!37948 (getCurrentListMapNoExtraKeys!2714 _keys!868 lt!383111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850888 () Bool)

(declare-fun e!474633 () Bool)

(assert (=> b!850888 (= e!474635 e!474633)))

(declare-fun res!577994 () Bool)

(assert (=> b!850888 (=> (not res!577994) (not e!474633))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850888 (= res!577994 (= from!1053 i!612))))

(declare-fun lt!383110 () ListLongMap!9433)

(assert (=> b!850888 (= lt!383110 (getCurrentListMapNoExtraKeys!2714 _keys!868 lt!383111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26603)

(assert (=> b!850888 (= lt!383111 (array!48541 (store (arr!23301 _values!688) i!612 (ValueCellFull!7644 v!557)) (size!23741 _values!688)))))

(declare-fun lt!383112 () ListLongMap!9433)

(assert (=> b!850888 (= lt!383112 (getCurrentListMapNoExtraKeys!2714 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850889 () Bool)

(declare-fun e!474636 () Bool)

(assert (=> b!850889 (= e!474636 (= call!37948 call!37949))))

(declare-fun b!850890 () Bool)

(declare-fun e!474637 () Bool)

(assert (=> b!850890 (= e!474633 (not e!474637))))

(declare-fun res!577988 () Bool)

(assert (=> b!850890 (=> res!577988 e!474637)))

(assert (=> b!850890 (= res!577988 (not (validKeyInArray!0 (select (arr!23300 _keys!868) from!1053))))))

(assert (=> b!850890 e!474636))

(declare-fun c!91717 () Bool)

(assert (=> b!850890 (= c!91717 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29055 0))(
  ( (Unit!29056) )
))
(declare-fun lt!383107 () Unit!29055)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!369 (array!48538 array!48540 (_ BitVec 32) (_ BitVec 32) V!26603 V!26603 (_ BitVec 32) (_ BitVec 64) V!26603 (_ BitVec 32) Int) Unit!29055)

(assert (=> b!850890 (= lt!383107 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!369 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850891 () Bool)

(declare-fun e!474634 () Bool)

(assert (=> b!850891 (= e!474634 tp_is_empty!16167)))

(declare-fun b!850892 () Bool)

(declare-fun +!2132 (ListLongMap!9433 tuple2!10664) ListLongMap!9433)

(assert (=> b!850892 (= e!474636 (= call!37948 (+!2132 call!37949 (tuple2!10665 k0!854 v!557))))))

(declare-fun mapNonEmpty!25850 () Bool)

(declare-fun tp!49597 () Bool)

(assert (=> mapNonEmpty!25850 (= mapRes!25850 (and tp!49597 e!474634))))

(declare-fun mapRest!25850 () (Array (_ BitVec 32) ValueCell!7644))

(declare-fun mapKey!25850 () (_ BitVec 32))

(declare-fun mapValue!25850 () ValueCell!7644)

(assert (=> mapNonEmpty!25850 (= (arr!23301 _values!688) (store mapRest!25850 mapKey!25850 mapValue!25850))))

(declare-fun b!850893 () Bool)

(declare-fun res!577989 () Bool)

(assert (=> b!850893 (=> (not res!577989) (not e!474635))))

(assert (=> b!850893 (= res!577989 (and (= (select (arr!23300 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850894 () Bool)

(declare-fun res!577991 () Bool)

(assert (=> b!850894 (=> (not res!577991) (not e!474635))))

(assert (=> b!850894 (= res!577991 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23740 _keys!868))))))

(declare-fun b!850895 () Bool)

(assert (=> b!850895 (= e!474639 (and e!474640 mapRes!25850))))

(declare-fun condMapEmpty!25850 () Bool)

(declare-fun mapDefault!25850 () ValueCell!7644)

(assert (=> b!850895 (= condMapEmpty!25850 (= (arr!23301 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7644)) mapDefault!25850)))))

(declare-fun b!850896 () Bool)

(declare-fun res!577995 () Bool)

(assert (=> b!850896 (=> (not res!577995) (not e!474635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48538 (_ BitVec 32)) Bool)

(assert (=> b!850896 (= res!577995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850897 () Bool)

(assert (=> b!850897 (= e!474637 true)))

(declare-fun lt!383108 () V!26603)

(declare-fun lt!383105 () ListLongMap!9433)

(declare-fun lt!383113 () tuple2!10664)

(assert (=> b!850897 (= (+!2132 lt!383105 lt!383113) (+!2132 (+!2132 lt!383105 (tuple2!10665 k0!854 lt!383108)) lt!383113))))

(declare-fun lt!383106 () V!26603)

(assert (=> b!850897 (= lt!383113 (tuple2!10665 k0!854 lt!383106))))

(declare-fun lt!383104 () Unit!29055)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!267 (ListLongMap!9433 (_ BitVec 64) V!26603 V!26603) Unit!29055)

(assert (=> b!850897 (= lt!383104 (addSameAsAddTwiceSameKeyDiffValues!267 lt!383105 k0!854 lt!383108 lt!383106))))

(declare-fun lt!383109 () V!26603)

(declare-fun get!12275 (ValueCell!7644 V!26603) V!26603)

(assert (=> b!850897 (= lt!383108 (get!12275 (select (arr!23301 _values!688) from!1053) lt!383109))))

(assert (=> b!850897 (= lt!383110 (+!2132 lt!383105 (tuple2!10665 (select (arr!23300 _keys!868) from!1053) lt!383106)))))

(assert (=> b!850897 (= lt!383106 (get!12275 (select (store (arr!23301 _values!688) i!612 (ValueCellFull!7644 v!557)) from!1053) lt!383109))))

(declare-fun dynLambda!1021 (Int (_ BitVec 64)) V!26603)

(assert (=> b!850897 (= lt!383109 (dynLambda!1021 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850897 (= lt!383105 (getCurrentListMapNoExtraKeys!2714 _keys!868 lt!383111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73116 res!577997) b!850885))

(assert (= (and b!850885 res!577993) b!850887))

(assert (= (and b!850887 res!577996) b!850896))

(assert (= (and b!850896 res!577995) b!850886))

(assert (= (and b!850886 res!577992) b!850894))

(assert (= (and b!850894 res!577991) b!850884))

(assert (= (and b!850884 res!577990) b!850893))

(assert (= (and b!850893 res!577989) b!850888))

(assert (= (and b!850888 res!577994) b!850890))

(assert (= (and b!850890 c!91717) b!850892))

(assert (= (and b!850890 (not c!91717)) b!850889))

(assert (= (or b!850892 b!850889) bm!37946))

(assert (= (or b!850892 b!850889) bm!37945))

(assert (= (and b!850890 (not res!577988)) b!850897))

(assert (= (and b!850895 condMapEmpty!25850) mapIsEmpty!25850))

(assert (= (and b!850895 (not condMapEmpty!25850)) mapNonEmpty!25850))

(get-info :version)

(assert (= (and mapNonEmpty!25850 ((_ is ValueCellFull!7644) mapValue!25850)) b!850891))

(assert (= (and b!850895 ((_ is ValueCellFull!7644) mapDefault!25850)) b!850883))

(assert (= start!73116 b!850895))

(declare-fun b_lambda!11563 () Bool)

(assert (=> (not b_lambda!11563) (not b!850897)))

(declare-fun t!22981 () Bool)

(declare-fun tb!4333 () Bool)

(assert (=> (and start!73116 (= defaultEntry!696 defaultEntry!696) t!22981) tb!4333))

(declare-fun result!8277 () Bool)

(assert (=> tb!4333 (= result!8277 tp_is_empty!16167)))

(assert (=> b!850897 t!22981))

(declare-fun b_and!23223 () Bool)

(assert (= b_and!23221 (and (=> t!22981 result!8277) b_and!23223)))

(declare-fun m!791709 () Bool)

(assert (=> bm!37946 m!791709))

(declare-fun m!791711 () Bool)

(assert (=> bm!37945 m!791711))

(declare-fun m!791713 () Bool)

(assert (=> b!850897 m!791713))

(declare-fun m!791715 () Bool)

(assert (=> b!850897 m!791715))

(declare-fun m!791717 () Bool)

(assert (=> b!850897 m!791717))

(assert (=> b!850897 m!791709))

(assert (=> b!850897 m!791713))

(declare-fun m!791719 () Bool)

(assert (=> b!850897 m!791719))

(declare-fun m!791721 () Bool)

(assert (=> b!850897 m!791721))

(declare-fun m!791723 () Bool)

(assert (=> b!850897 m!791723))

(declare-fun m!791725 () Bool)

(assert (=> b!850897 m!791725))

(declare-fun m!791727 () Bool)

(assert (=> b!850897 m!791727))

(assert (=> b!850897 m!791717))

(declare-fun m!791729 () Bool)

(assert (=> b!850897 m!791729))

(declare-fun m!791731 () Bool)

(assert (=> b!850897 m!791731))

(declare-fun m!791733 () Bool)

(assert (=> b!850897 m!791733))

(assert (=> b!850897 m!791725))

(declare-fun m!791735 () Bool)

(assert (=> b!850897 m!791735))

(declare-fun m!791737 () Bool)

(assert (=> b!850888 m!791737))

(assert (=> b!850888 m!791727))

(declare-fun m!791739 () Bool)

(assert (=> b!850888 m!791739))

(declare-fun m!791741 () Bool)

(assert (=> b!850893 m!791741))

(declare-fun m!791743 () Bool)

(assert (=> b!850892 m!791743))

(declare-fun m!791745 () Bool)

(assert (=> b!850886 m!791745))

(declare-fun m!791747 () Bool)

(assert (=> mapNonEmpty!25850 m!791747))

(declare-fun m!791749 () Bool)

(assert (=> b!850884 m!791749))

(declare-fun m!791751 () Bool)

(assert (=> start!73116 m!791751))

(declare-fun m!791753 () Bool)

(assert (=> start!73116 m!791753))

(declare-fun m!791755 () Bool)

(assert (=> b!850896 m!791755))

(assert (=> b!850890 m!791731))

(assert (=> b!850890 m!791731))

(declare-fun m!791757 () Bool)

(assert (=> b!850890 m!791757))

(declare-fun m!791759 () Bool)

(assert (=> b!850890 m!791759))

(declare-fun m!791761 () Bool)

(assert (=> b!850885 m!791761))

(check-sat (not b_next!14031) (not bm!37945) (not b!850897) (not b!850896) (not b!850890) (not b!850888) (not b!850886) (not bm!37946) (not mapNonEmpty!25850) (not b!850885) tp_is_empty!16167 b_and!23223 (not b_lambda!11563) (not b!850884) (not b!850892) (not start!73116))
(check-sat b_and!23223 (not b_next!14031))
