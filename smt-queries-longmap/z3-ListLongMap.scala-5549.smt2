; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73246 () Bool)

(assert start!73246)

(declare-fun b_free!13993 () Bool)

(declare-fun b_next!13993 () Bool)

(assert (=> start!73246 (= b_free!13993 (not b_next!13993))))

(declare-fun tp!49483 () Bool)

(declare-fun b_and!23155 () Bool)

(assert (=> start!73246 (= tp!49483 b_and!23155)))

(declare-fun b!850893 () Bool)

(declare-fun res!577765 () Bool)

(declare-fun e!474766 () Bool)

(assert (=> b!850893 (=> (not res!577765) (not e!474766))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48513 0))(
  ( (array!48514 (arr!23283 (Array (_ BitVec 32) (_ BitVec 64))) (size!23724 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48513)

(declare-datatypes ((V!26553 0))(
  ( (V!26554 (val!8112 Int)) )
))
(declare-datatypes ((ValueCell!7625 0))(
  ( (ValueCellFull!7625 (v!10537 V!26553)) (EmptyCell!7625) )
))
(declare-datatypes ((array!48515 0))(
  ( (array!48516 (arr!23284 (Array (_ BitVec 32) ValueCell!7625)) (size!23725 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48515)

(assert (=> b!850893 (= res!577765 (and (= (size!23725 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23724 _keys!868) (size!23725 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25793 () Bool)

(declare-fun mapRes!25793 () Bool)

(assert (=> mapIsEmpty!25793 mapRes!25793))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10554 0))(
  ( (tuple2!10555 (_1!5288 (_ BitVec 64)) (_2!5288 V!26553)) )
))
(declare-datatypes ((List!16418 0))(
  ( (Nil!16415) (Cons!16414 (h!17551 tuple2!10554) (t!22849 List!16418)) )
))
(declare-datatypes ((ListLongMap!9325 0))(
  ( (ListLongMap!9326 (toList!4678 List!16418)) )
))
(declare-fun call!37880 () ListLongMap!9325)

(declare-fun bm!37876 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26553)

(declare-fun zeroValue!654 () V!26553)

(declare-fun getCurrentListMapNoExtraKeys!2736 (array!48513 array!48515 (_ BitVec 32) (_ BitVec 32) V!26553 V!26553 (_ BitVec 32) Int) ListLongMap!9325)

(assert (=> bm!37876 (= call!37880 (getCurrentListMapNoExtraKeys!2736 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850894 () Bool)

(declare-fun res!577762 () Bool)

(assert (=> b!850894 (=> (not res!577762) (not e!474766))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850894 (= res!577762 (validKeyInArray!0 k0!854))))

(declare-fun res!577769 () Bool)

(assert (=> start!73246 (=> (not res!577769) (not e!474766))))

(assert (=> start!73246 (= res!577769 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23724 _keys!868))))))

(assert (=> start!73246 e!474766))

(declare-fun tp_is_empty!16129 () Bool)

(assert (=> start!73246 tp_is_empty!16129))

(assert (=> start!73246 true))

(assert (=> start!73246 tp!49483))

(declare-fun array_inv!18528 (array!48513) Bool)

(assert (=> start!73246 (array_inv!18528 _keys!868)))

(declare-fun e!474761 () Bool)

(declare-fun array_inv!18529 (array!48515) Bool)

(assert (=> start!73246 (and (array_inv!18529 _values!688) e!474761)))

(declare-fun b!850895 () Bool)

(declare-fun e!474765 () Bool)

(assert (=> b!850895 (= e!474766 e!474765)))

(declare-fun res!577767 () Bool)

(assert (=> b!850895 (=> (not res!577767) (not e!474765))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850895 (= res!577767 (= from!1053 i!612))))

(declare-fun lt!382896 () array!48515)

(declare-fun lt!382897 () ListLongMap!9325)

(assert (=> b!850895 (= lt!382897 (getCurrentListMapNoExtraKeys!2736 _keys!868 lt!382896 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26553)

(assert (=> b!850895 (= lt!382896 (array!48516 (store (arr!23284 _values!688) i!612 (ValueCellFull!7625 v!557)) (size!23725 _values!688)))))

(declare-fun lt!382904 () ListLongMap!9325)

(assert (=> b!850895 (= lt!382904 (getCurrentListMapNoExtraKeys!2736 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25793 () Bool)

(declare-fun tp!49484 () Bool)

(declare-fun e!474759 () Bool)

(assert (=> mapNonEmpty!25793 (= mapRes!25793 (and tp!49484 e!474759))))

(declare-fun mapValue!25793 () ValueCell!7625)

(declare-fun mapRest!25793 () (Array (_ BitVec 32) ValueCell!7625))

(declare-fun mapKey!25793 () (_ BitVec 32))

(assert (=> mapNonEmpty!25793 (= (arr!23284 _values!688) (store mapRest!25793 mapKey!25793 mapValue!25793))))

(declare-fun b!850896 () Bool)

(declare-fun res!577768 () Bool)

(assert (=> b!850896 (=> (not res!577768) (not e!474766))))

(declare-datatypes ((List!16419 0))(
  ( (Nil!16416) (Cons!16415 (h!17552 (_ BitVec 64)) (t!22850 List!16419)) )
))
(declare-fun arrayNoDuplicates!0 (array!48513 (_ BitVec 32) List!16419) Bool)

(assert (=> b!850896 (= res!577768 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16416))))

(declare-fun e!474764 () Bool)

(declare-fun b!850897 () Bool)

(declare-fun call!37879 () ListLongMap!9325)

(declare-fun +!2128 (ListLongMap!9325 tuple2!10554) ListLongMap!9325)

(assert (=> b!850897 (= e!474764 (= call!37879 (+!2128 call!37880 (tuple2!10555 k0!854 v!557))))))

(declare-fun b!850898 () Bool)

(declare-fun res!577771 () Bool)

(assert (=> b!850898 (=> (not res!577771) (not e!474766))))

(assert (=> b!850898 (= res!577771 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23724 _keys!868))))))

(declare-fun b!850899 () Bool)

(assert (=> b!850899 (= e!474759 tp_is_empty!16129)))

(declare-fun b!850900 () Bool)

(declare-fun e!474762 () Bool)

(assert (=> b!850900 (= e!474762 tp_is_empty!16129)))

(declare-fun b!850901 () Bool)

(assert (=> b!850901 (= e!474764 (= call!37879 call!37880))))

(declare-fun b!850902 () Bool)

(declare-fun res!577770 () Bool)

(assert (=> b!850902 (=> (not res!577770) (not e!474766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850902 (= res!577770 (validMask!0 mask!1196))))

(declare-fun b!850903 () Bool)

(declare-fun e!474760 () Bool)

(assert (=> b!850903 (= e!474760 true)))

(declare-fun lt!382898 () tuple2!10554)

(declare-fun lt!382900 () V!26553)

(declare-fun lt!382895 () ListLongMap!9325)

(assert (=> b!850903 (= (+!2128 lt!382895 lt!382898) (+!2128 (+!2128 lt!382895 (tuple2!10555 k0!854 lt!382900)) lt!382898))))

(declare-fun lt!382901 () V!26553)

(assert (=> b!850903 (= lt!382898 (tuple2!10555 k0!854 lt!382901))))

(declare-datatypes ((Unit!29022 0))(
  ( (Unit!29023) )
))
(declare-fun lt!382902 () Unit!29022)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!259 (ListLongMap!9325 (_ BitVec 64) V!26553 V!26553) Unit!29022)

(assert (=> b!850903 (= lt!382902 (addSameAsAddTwiceSameKeyDiffValues!259 lt!382895 k0!854 lt!382900 lt!382901))))

(declare-fun lt!382899 () V!26553)

(declare-fun get!12254 (ValueCell!7625 V!26553) V!26553)

(assert (=> b!850903 (= lt!382900 (get!12254 (select (arr!23284 _values!688) from!1053) lt!382899))))

(assert (=> b!850903 (= lt!382897 (+!2128 lt!382895 (tuple2!10555 (select (arr!23283 _keys!868) from!1053) lt!382901)))))

(assert (=> b!850903 (= lt!382901 (get!12254 (select (store (arr!23284 _values!688) i!612 (ValueCellFull!7625 v!557)) from!1053) lt!382899))))

(declare-fun dynLambda!1006 (Int (_ BitVec 64)) V!26553)

(assert (=> b!850903 (= lt!382899 (dynLambda!1006 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850903 (= lt!382895 (getCurrentListMapNoExtraKeys!2736 _keys!868 lt!382896 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850904 () Bool)

(assert (=> b!850904 (= e!474761 (and e!474762 mapRes!25793))))

(declare-fun condMapEmpty!25793 () Bool)

(declare-fun mapDefault!25793 () ValueCell!7625)

(assert (=> b!850904 (= condMapEmpty!25793 (= (arr!23284 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7625)) mapDefault!25793)))))

(declare-fun b!850905 () Bool)

(declare-fun res!577763 () Bool)

(assert (=> b!850905 (=> (not res!577763) (not e!474766))))

(assert (=> b!850905 (= res!577763 (and (= (select (arr!23283 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37877 () Bool)

(assert (=> bm!37877 (= call!37879 (getCurrentListMapNoExtraKeys!2736 _keys!868 lt!382896 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850906 () Bool)

(assert (=> b!850906 (= e!474765 (not e!474760))))

(declare-fun res!577766 () Bool)

(assert (=> b!850906 (=> res!577766 e!474760)))

(assert (=> b!850906 (= res!577766 (not (validKeyInArray!0 (select (arr!23283 _keys!868) from!1053))))))

(assert (=> b!850906 e!474764))

(declare-fun c!91942 () Bool)

(assert (=> b!850906 (= c!91942 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382903 () Unit!29022)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!346 (array!48513 array!48515 (_ BitVec 32) (_ BitVec 32) V!26553 V!26553 (_ BitVec 32) (_ BitVec 64) V!26553 (_ BitVec 32) Int) Unit!29022)

(assert (=> b!850906 (= lt!382903 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!346 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850907 () Bool)

(declare-fun res!577764 () Bool)

(assert (=> b!850907 (=> (not res!577764) (not e!474766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48513 (_ BitVec 32)) Bool)

(assert (=> b!850907 (= res!577764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73246 res!577769) b!850902))

(assert (= (and b!850902 res!577770) b!850893))

(assert (= (and b!850893 res!577765) b!850907))

(assert (= (and b!850907 res!577764) b!850896))

(assert (= (and b!850896 res!577768) b!850898))

(assert (= (and b!850898 res!577771) b!850894))

(assert (= (and b!850894 res!577762) b!850905))

(assert (= (and b!850905 res!577763) b!850895))

(assert (= (and b!850895 res!577767) b!850906))

(assert (= (and b!850906 c!91942) b!850897))

(assert (= (and b!850906 (not c!91942)) b!850901))

(assert (= (or b!850897 b!850901) bm!37877))

(assert (= (or b!850897 b!850901) bm!37876))

(assert (= (and b!850906 (not res!577766)) b!850903))

(assert (= (and b!850904 condMapEmpty!25793) mapIsEmpty!25793))

(assert (= (and b!850904 (not condMapEmpty!25793)) mapNonEmpty!25793))

(get-info :version)

(assert (= (and mapNonEmpty!25793 ((_ is ValueCellFull!7625) mapValue!25793)) b!850899))

(assert (= (and b!850904 ((_ is ValueCellFull!7625) mapDefault!25793)) b!850900))

(assert (= start!73246 b!850904))

(declare-fun b_lambda!11539 () Bool)

(assert (=> (not b_lambda!11539) (not b!850903)))

(declare-fun t!22848 () Bool)

(declare-fun tb!4287 () Bool)

(assert (=> (and start!73246 (= defaultEntry!696 defaultEntry!696) t!22848) tb!4287))

(declare-fun result!8193 () Bool)

(assert (=> tb!4287 (= result!8193 tp_is_empty!16129)))

(assert (=> b!850903 t!22848))

(declare-fun b_and!23157 () Bool)

(assert (= b_and!23155 (and (=> t!22848 result!8193) b_and!23157)))

(declare-fun m!791977 () Bool)

(assert (=> b!850907 m!791977))

(declare-fun m!791979 () Bool)

(assert (=> bm!37876 m!791979))

(declare-fun m!791981 () Bool)

(assert (=> mapNonEmpty!25793 m!791981))

(declare-fun m!791983 () Bool)

(assert (=> b!850894 m!791983))

(declare-fun m!791985 () Bool)

(assert (=> b!850895 m!791985))

(declare-fun m!791987 () Bool)

(assert (=> b!850895 m!791987))

(declare-fun m!791989 () Bool)

(assert (=> b!850895 m!791989))

(declare-fun m!791991 () Bool)

(assert (=> b!850896 m!791991))

(declare-fun m!791993 () Bool)

(assert (=> bm!37877 m!791993))

(assert (=> b!850903 m!791993))

(declare-fun m!791995 () Bool)

(assert (=> b!850903 m!791995))

(declare-fun m!791997 () Bool)

(assert (=> b!850903 m!791997))

(assert (=> b!850903 m!791995))

(declare-fun m!791999 () Bool)

(assert (=> b!850903 m!791999))

(declare-fun m!792001 () Bool)

(assert (=> b!850903 m!792001))

(declare-fun m!792003 () Bool)

(assert (=> b!850903 m!792003))

(assert (=> b!850903 m!791987))

(assert (=> b!850903 m!791999))

(declare-fun m!792005 () Bool)

(assert (=> b!850903 m!792005))

(declare-fun m!792007 () Bool)

(assert (=> b!850903 m!792007))

(declare-fun m!792009 () Bool)

(assert (=> b!850903 m!792009))

(declare-fun m!792011 () Bool)

(assert (=> b!850903 m!792011))

(declare-fun m!792013 () Bool)

(assert (=> b!850903 m!792013))

(declare-fun m!792015 () Bool)

(assert (=> b!850903 m!792015))

(assert (=> b!850903 m!792001))

(declare-fun m!792017 () Bool)

(assert (=> start!73246 m!792017))

(declare-fun m!792019 () Bool)

(assert (=> start!73246 m!792019))

(assert (=> b!850906 m!792011))

(assert (=> b!850906 m!792011))

(declare-fun m!792021 () Bool)

(assert (=> b!850906 m!792021))

(declare-fun m!792023 () Bool)

(assert (=> b!850906 m!792023))

(declare-fun m!792025 () Bool)

(assert (=> b!850897 m!792025))

(declare-fun m!792027 () Bool)

(assert (=> b!850902 m!792027))

(declare-fun m!792029 () Bool)

(assert (=> b!850905 m!792029))

(check-sat (not start!73246) (not bm!37877) tp_is_empty!16129 (not b!850894) (not b_lambda!11539) (not b!850903) (not mapNonEmpty!25793) (not b!850897) (not b_next!13993) (not b!850907) (not b!850902) (not b!850906) (not b!850895) (not bm!37876) b_and!23157 (not b!850896))
(check-sat b_and!23157 (not b_next!13993))
