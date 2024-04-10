; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73122 () Bool)

(assert start!73122)

(declare-fun b_free!14037 () Bool)

(declare-fun b_next!14037 () Bool)

(assert (=> start!73122 (= b_free!14037 (not b_next!14037))))

(declare-fun tp!49615 () Bool)

(declare-fun b_and!23233 () Bool)

(assert (=> start!73122 (= tp!49615 b_and!23233)))

(declare-fun b!851024 () Bool)

(declare-fun e!474709 () Bool)

(declare-fun tp_is_empty!16173 () Bool)

(assert (=> b!851024 (= e!474709 tp_is_empty!16173)))

(declare-fun b!851026 () Bool)

(declare-fun res!578082 () Bool)

(declare-fun e!474710 () Bool)

(assert (=> b!851026 (=> (not res!578082) (not e!474710))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851026 (= res!578082 (validKeyInArray!0 k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26611 0))(
  ( (V!26612 (val!8134 Int)) )
))
(declare-datatypes ((tuple2!10670 0))(
  ( (tuple2!10671 (_1!5346 (_ BitVec 64)) (_2!5346 V!26611)) )
))
(declare-datatypes ((List!16510 0))(
  ( (Nil!16507) (Cons!16506 (h!17637 tuple2!10670) (t!22993 List!16510)) )
))
(declare-datatypes ((ListLongMap!9439 0))(
  ( (ListLongMap!9440 (toList!4735 List!16510)) )
))
(declare-fun call!37966 () ListLongMap!9439)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26611)

(declare-fun zeroValue!654 () V!26611)

(declare-datatypes ((ValueCell!7647 0))(
  ( (ValueCellFull!7647 (v!10559 V!26611)) (EmptyCell!7647) )
))
(declare-datatypes ((array!48550 0))(
  ( (array!48551 (arr!23306 (Array (_ BitVec 32) ValueCell!7647)) (size!23746 (_ BitVec 32))) )
))
(declare-fun lt!383195 () array!48550)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48552 0))(
  ( (array!48553 (arr!23307 (Array (_ BitVec 32) (_ BitVec 64))) (size!23747 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48552)

(declare-fun bm!37963 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2717 (array!48552 array!48550 (_ BitVec 32) (_ BitVec 32) V!26611 V!26611 (_ BitVec 32) Int) ListLongMap!9439)

(assert (=> bm!37963 (= call!37966 (getCurrentListMapNoExtraKeys!2717 _keys!868 lt!383195 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851027 () Bool)

(declare-fun e!474711 () Bool)

(assert (=> b!851027 (= e!474710 e!474711)))

(declare-fun res!578079 () Bool)

(assert (=> b!851027 (=> (not res!578079) (not e!474711))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851027 (= res!578079 (= from!1053 i!612))))

(declare-fun lt!383201 () ListLongMap!9439)

(assert (=> b!851027 (= lt!383201 (getCurrentListMapNoExtraKeys!2717 _keys!868 lt!383195 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26611)

(declare-fun _values!688 () array!48550)

(assert (=> b!851027 (= lt!383195 (array!48551 (store (arr!23306 _values!688) i!612 (ValueCellFull!7647 v!557)) (size!23746 _values!688)))))

(declare-fun lt!383196 () ListLongMap!9439)

(assert (=> b!851027 (= lt!383196 (getCurrentListMapNoExtraKeys!2717 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851028 () Bool)

(declare-fun e!474712 () Bool)

(declare-fun e!474707 () Bool)

(declare-fun mapRes!25859 () Bool)

(assert (=> b!851028 (= e!474712 (and e!474707 mapRes!25859))))

(declare-fun condMapEmpty!25859 () Bool)

(declare-fun mapDefault!25859 () ValueCell!7647)

(assert (=> b!851028 (= condMapEmpty!25859 (= (arr!23306 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7647)) mapDefault!25859)))))

(declare-fun e!474706 () Bool)

(declare-fun b!851029 () Bool)

(declare-fun call!37967 () ListLongMap!9439)

(declare-fun +!2135 (ListLongMap!9439 tuple2!10670) ListLongMap!9439)

(assert (=> b!851029 (= e!474706 (= call!37966 (+!2135 call!37967 (tuple2!10671 k0!854 v!557))))))

(declare-fun b!851030 () Bool)

(declare-fun res!578081 () Bool)

(assert (=> b!851030 (=> (not res!578081) (not e!474710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851030 (= res!578081 (validMask!0 mask!1196))))

(declare-fun b!851031 () Bool)

(declare-fun e!474705 () Bool)

(assert (=> b!851031 (= e!474711 (not e!474705))))

(declare-fun res!578086 () Bool)

(assert (=> b!851031 (=> res!578086 e!474705)))

(assert (=> b!851031 (= res!578086 (not (validKeyInArray!0 (select (arr!23307 _keys!868) from!1053))))))

(assert (=> b!851031 e!474706))

(declare-fun c!91726 () Bool)

(assert (=> b!851031 (= c!91726 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29061 0))(
  ( (Unit!29062) )
))
(declare-fun lt!383198 () Unit!29061)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!372 (array!48552 array!48550 (_ BitVec 32) (_ BitVec 32) V!26611 V!26611 (_ BitVec 32) (_ BitVec 64) V!26611 (_ BitVec 32) Int) Unit!29061)

(assert (=> b!851031 (= lt!383198 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!372 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851032 () Bool)

(assert (=> b!851032 (= e!474707 tp_is_empty!16173)))

(declare-fun bm!37964 () Bool)

(assert (=> bm!37964 (= call!37967 (getCurrentListMapNoExtraKeys!2717 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578078 () Bool)

(assert (=> start!73122 (=> (not res!578078) (not e!474710))))

(assert (=> start!73122 (= res!578078 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23747 _keys!868))))))

(assert (=> start!73122 e!474710))

(assert (=> start!73122 tp_is_empty!16173))

(assert (=> start!73122 true))

(assert (=> start!73122 tp!49615))

(declare-fun array_inv!18494 (array!48552) Bool)

(assert (=> start!73122 (array_inv!18494 _keys!868)))

(declare-fun array_inv!18495 (array!48550) Bool)

(assert (=> start!73122 (and (array_inv!18495 _values!688) e!474712)))

(declare-fun b!851025 () Bool)

(declare-fun res!578085 () Bool)

(assert (=> b!851025 (=> (not res!578085) (not e!474710))))

(assert (=> b!851025 (= res!578085 (and (= (size!23746 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23747 _keys!868) (size!23746 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25859 () Bool)

(assert (=> mapIsEmpty!25859 mapRes!25859))

(declare-fun b!851033 () Bool)

(assert (=> b!851033 (= e!474705 true)))

(declare-fun lt!383197 () ListLongMap!9439)

(declare-fun lt!383203 () V!26611)

(declare-fun lt!383194 () tuple2!10670)

(assert (=> b!851033 (= (+!2135 lt!383197 lt!383194) (+!2135 (+!2135 lt!383197 (tuple2!10671 k0!854 lt!383203)) lt!383194))))

(declare-fun lt!383200 () V!26611)

(assert (=> b!851033 (= lt!383194 (tuple2!10671 k0!854 lt!383200))))

(declare-fun lt!383199 () Unit!29061)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!269 (ListLongMap!9439 (_ BitVec 64) V!26611 V!26611) Unit!29061)

(assert (=> b!851033 (= lt!383199 (addSameAsAddTwiceSameKeyDiffValues!269 lt!383197 k0!854 lt!383203 lt!383200))))

(declare-fun lt!383202 () V!26611)

(declare-fun get!12279 (ValueCell!7647 V!26611) V!26611)

(assert (=> b!851033 (= lt!383203 (get!12279 (select (arr!23306 _values!688) from!1053) lt!383202))))

(assert (=> b!851033 (= lt!383201 (+!2135 lt!383197 (tuple2!10671 (select (arr!23307 _keys!868) from!1053) lt!383200)))))

(assert (=> b!851033 (= lt!383200 (get!12279 (select (store (arr!23306 _values!688) i!612 (ValueCellFull!7647 v!557)) from!1053) lt!383202))))

(declare-fun dynLambda!1023 (Int (_ BitVec 64)) V!26611)

(assert (=> b!851033 (= lt!383202 (dynLambda!1023 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851033 (= lt!383197 (getCurrentListMapNoExtraKeys!2717 _keys!868 lt!383195 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851034 () Bool)

(declare-fun res!578080 () Bool)

(assert (=> b!851034 (=> (not res!578080) (not e!474710))))

(declare-datatypes ((List!16511 0))(
  ( (Nil!16508) (Cons!16507 (h!17638 (_ BitVec 64)) (t!22994 List!16511)) )
))
(declare-fun arrayNoDuplicates!0 (array!48552 (_ BitVec 32) List!16511) Bool)

(assert (=> b!851034 (= res!578080 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16508))))

(declare-fun b!851035 () Bool)

(declare-fun res!578083 () Bool)

(assert (=> b!851035 (=> (not res!578083) (not e!474710))))

(assert (=> b!851035 (= res!578083 (and (= (select (arr!23307 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851036 () Bool)

(assert (=> b!851036 (= e!474706 (= call!37966 call!37967))))

(declare-fun b!851037 () Bool)

(declare-fun res!578084 () Bool)

(assert (=> b!851037 (=> (not res!578084) (not e!474710))))

(assert (=> b!851037 (= res!578084 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23747 _keys!868))))))

(declare-fun b!851038 () Bool)

(declare-fun res!578087 () Bool)

(assert (=> b!851038 (=> (not res!578087) (not e!474710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48552 (_ BitVec 32)) Bool)

(assert (=> b!851038 (= res!578087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25859 () Bool)

(declare-fun tp!49614 () Bool)

(assert (=> mapNonEmpty!25859 (= mapRes!25859 (and tp!49614 e!474709))))

(declare-fun mapKey!25859 () (_ BitVec 32))

(declare-fun mapRest!25859 () (Array (_ BitVec 32) ValueCell!7647))

(declare-fun mapValue!25859 () ValueCell!7647)

(assert (=> mapNonEmpty!25859 (= (arr!23306 _values!688) (store mapRest!25859 mapKey!25859 mapValue!25859))))

(assert (= (and start!73122 res!578078) b!851030))

(assert (= (and b!851030 res!578081) b!851025))

(assert (= (and b!851025 res!578085) b!851038))

(assert (= (and b!851038 res!578087) b!851034))

(assert (= (and b!851034 res!578080) b!851037))

(assert (= (and b!851037 res!578084) b!851026))

(assert (= (and b!851026 res!578082) b!851035))

(assert (= (and b!851035 res!578083) b!851027))

(assert (= (and b!851027 res!578079) b!851031))

(assert (= (and b!851031 c!91726) b!851029))

(assert (= (and b!851031 (not c!91726)) b!851036))

(assert (= (or b!851029 b!851036) bm!37963))

(assert (= (or b!851029 b!851036) bm!37964))

(assert (= (and b!851031 (not res!578086)) b!851033))

(assert (= (and b!851028 condMapEmpty!25859) mapIsEmpty!25859))

(assert (= (and b!851028 (not condMapEmpty!25859)) mapNonEmpty!25859))

(get-info :version)

(assert (= (and mapNonEmpty!25859 ((_ is ValueCellFull!7647) mapValue!25859)) b!851024))

(assert (= (and b!851028 ((_ is ValueCellFull!7647) mapDefault!25859)) b!851032))

(assert (= start!73122 b!851028))

(declare-fun b_lambda!11569 () Bool)

(assert (=> (not b_lambda!11569) (not b!851033)))

(declare-fun t!22992 () Bool)

(declare-fun tb!4339 () Bool)

(assert (=> (and start!73122 (= defaultEntry!696 defaultEntry!696) t!22992) tb!4339))

(declare-fun result!8289 () Bool)

(assert (=> tb!4339 (= result!8289 tp_is_empty!16173)))

(assert (=> b!851033 t!22992))

(declare-fun b_and!23235 () Bool)

(assert (= b_and!23233 (and (=> t!22992 result!8289) b_and!23235)))

(declare-fun m!791871 () Bool)

(assert (=> start!73122 m!791871))

(declare-fun m!791873 () Bool)

(assert (=> start!73122 m!791873))

(declare-fun m!791875 () Bool)

(assert (=> b!851038 m!791875))

(declare-fun m!791877 () Bool)

(assert (=> b!851034 m!791877))

(declare-fun m!791879 () Bool)

(assert (=> b!851026 m!791879))

(declare-fun m!791881 () Bool)

(assert (=> b!851033 m!791881))

(declare-fun m!791883 () Bool)

(assert (=> b!851033 m!791883))

(declare-fun m!791885 () Bool)

(assert (=> b!851033 m!791885))

(declare-fun m!791887 () Bool)

(assert (=> b!851033 m!791887))

(declare-fun m!791889 () Bool)

(assert (=> b!851033 m!791889))

(declare-fun m!791891 () Bool)

(assert (=> b!851033 m!791891))

(declare-fun m!791893 () Bool)

(assert (=> b!851033 m!791893))

(assert (=> b!851033 m!791885))

(assert (=> b!851033 m!791889))

(declare-fun m!791895 () Bool)

(assert (=> b!851033 m!791895))

(declare-fun m!791897 () Bool)

(assert (=> b!851033 m!791897))

(declare-fun m!791899 () Bool)

(assert (=> b!851033 m!791899))

(declare-fun m!791901 () Bool)

(assert (=> b!851033 m!791901))

(assert (=> b!851033 m!791883))

(declare-fun m!791903 () Bool)

(assert (=> b!851033 m!791903))

(declare-fun m!791905 () Bool)

(assert (=> b!851033 m!791905))

(assert (=> bm!37963 m!791891))

(declare-fun m!791907 () Bool)

(assert (=> b!851035 m!791907))

(declare-fun m!791909 () Bool)

(assert (=> b!851027 m!791909))

(assert (=> b!851027 m!791905))

(declare-fun m!791911 () Bool)

(assert (=> b!851027 m!791911))

(declare-fun m!791913 () Bool)

(assert (=> b!851029 m!791913))

(declare-fun m!791915 () Bool)

(assert (=> b!851030 m!791915))

(declare-fun m!791917 () Bool)

(assert (=> bm!37964 m!791917))

(declare-fun m!791919 () Bool)

(assert (=> mapNonEmpty!25859 m!791919))

(assert (=> b!851031 m!791899))

(assert (=> b!851031 m!791899))

(declare-fun m!791921 () Bool)

(assert (=> b!851031 m!791921))

(declare-fun m!791923 () Bool)

(assert (=> b!851031 m!791923))

(check-sat (not mapNonEmpty!25859) (not b!851026) (not b_next!14037) (not b!851031) tp_is_empty!16173 (not b!851030) (not b_lambda!11569) (not b!851034) (not start!73122) (not b!851029) (not b!851038) (not b!851033) (not b!851027) (not bm!37963) b_and!23235 (not bm!37964))
(check-sat b_and!23235 (not b_next!14037))
