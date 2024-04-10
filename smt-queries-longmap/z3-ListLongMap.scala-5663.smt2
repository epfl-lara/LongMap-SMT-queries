; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73764 () Bool)

(assert start!73764)

(declare-fun b_free!14679 () Bool)

(declare-fun b_next!14679 () Bool)

(assert (=> start!73764 (= b_free!14679 (not b_next!14679))))

(declare-fun tp!51540 () Bool)

(declare-fun b_and!24337 () Bool)

(assert (=> start!73764 (= tp!51540 b_and!24337)))

(declare-fun mapNonEmpty!26822 () Bool)

(declare-fun mapRes!26822 () Bool)

(declare-fun tp!51541 () Bool)

(declare-fun e!481998 () Bool)

(assert (=> mapNonEmpty!26822 (= mapRes!26822 (and tp!51541 e!481998))))

(declare-datatypes ((V!27467 0))(
  ( (V!27468 (val!8455 Int)) )
))
(declare-datatypes ((ValueCell!7968 0))(
  ( (ValueCellFull!7968 (v!10880 V!27467)) (EmptyCell!7968) )
))
(declare-fun mapValue!26822 () ValueCell!7968)

(declare-datatypes ((array!49790 0))(
  ( (array!49791 (arr!23926 (Array (_ BitVec 32) ValueCell!7968)) (size!24366 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49790)

(declare-fun mapRest!26822 () (Array (_ BitVec 32) ValueCell!7968))

(declare-fun mapKey!26822 () (_ BitVec 32))

(assert (=> mapNonEmpty!26822 (= (arr!23926 _values!688) (store mapRest!26822 mapKey!26822 mapValue!26822))))

(declare-fun b!865225 () Bool)

(declare-fun e!481992 () Bool)

(assert (=> b!865225 (= e!481992 true)))

(declare-datatypes ((tuple2!11206 0))(
  ( (tuple2!11207 (_1!5614 (_ BitVec 64)) (_2!5614 V!27467)) )
))
(declare-fun lt!391949 () tuple2!11206)

(declare-fun lt!391950 () tuple2!11206)

(declare-datatypes ((List!17008 0))(
  ( (Nil!17005) (Cons!17004 (h!18135 tuple2!11206) (t!23953 List!17008)) )
))
(declare-datatypes ((ListLongMap!9975 0))(
  ( (ListLongMap!9976 (toList!5003 List!17008)) )
))
(declare-fun lt!391957 () ListLongMap!9975)

(declare-fun lt!391951 () ListLongMap!9975)

(declare-fun +!2352 (ListLongMap!9975 tuple2!11206) ListLongMap!9975)

(assert (=> b!865225 (= lt!391951 (+!2352 (+!2352 lt!391957 lt!391950) lt!391949))))

(declare-fun v!557 () V!27467)

(declare-fun lt!391955 () V!27467)

(declare-datatypes ((array!49792 0))(
  ( (array!49793 (arr!23927 (Array (_ BitVec 32) (_ BitVec 64))) (size!24367 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49792)

(declare-datatypes ((Unit!29628 0))(
  ( (Unit!29629) )
))
(declare-fun lt!391953 () Unit!29628)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!521 (ListLongMap!9975 (_ BitVec 64) V!27467 (_ BitVec 64) V!27467) Unit!29628)

(assert (=> b!865225 (= lt!391953 (addCommutativeForDiffKeys!521 lt!391957 k0!854 v!557 (select (arr!23927 _keys!868) from!1053) lt!391955))))

(declare-fun b!865226 () Bool)

(declare-fun e!481994 () Unit!29628)

(declare-fun Unit!29630 () Unit!29628)

(assert (=> b!865226 (= e!481994 Unit!29630)))

(declare-fun lt!391958 () Unit!29628)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49792 (_ BitVec 32) (_ BitVec 32)) Unit!29628)

(assert (=> b!865226 (= lt!391958 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17009 0))(
  ( (Nil!17006) (Cons!17005 (h!18136 (_ BitVec 64)) (t!23954 List!17009)) )
))
(declare-fun arrayNoDuplicates!0 (array!49792 (_ BitVec 32) List!17009) Bool)

(assert (=> b!865226 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17006)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!391956 () Unit!29628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49792 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29628)

(assert (=> b!865226 (= lt!391956 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865226 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391952 () Unit!29628)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49792 (_ BitVec 64) (_ BitVec 32) List!17009) Unit!29628)

(assert (=> b!865226 (= lt!391952 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17006))))

(assert (=> b!865226 false))

(declare-fun b!865227 () Bool)

(declare-fun res!587910 () Bool)

(declare-fun e!481993 () Bool)

(assert (=> b!865227 (=> (not res!587910) (not e!481993))))

(assert (=> b!865227 (= res!587910 (and (= (select (arr!23927 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865228 () Bool)

(declare-fun e!481997 () Bool)

(declare-fun e!481999 () Bool)

(assert (=> b!865228 (= e!481997 (not e!481999))))

(declare-fun res!587906 () Bool)

(assert (=> b!865228 (=> res!587906 e!481999)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865228 (= res!587906 (not (validKeyInArray!0 (select (arr!23927 _keys!868) from!1053))))))

(declare-fun lt!391954 () ListLongMap!9975)

(declare-fun lt!391947 () ListLongMap!9975)

(assert (=> b!865228 (= lt!391954 lt!391947)))

(assert (=> b!865228 (= lt!391947 (+!2352 lt!391957 lt!391949))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!391948 () array!49790)

(declare-fun minValue!654 () V!27467)

(declare-fun zeroValue!654 () V!27467)

(declare-fun getCurrentListMapNoExtraKeys!2974 (array!49792 array!49790 (_ BitVec 32) (_ BitVec 32) V!27467 V!27467 (_ BitVec 32) Int) ListLongMap!9975)

(assert (=> b!865228 (= lt!391954 (getCurrentListMapNoExtraKeys!2974 _keys!868 lt!391948 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865228 (= lt!391949 (tuple2!11207 k0!854 v!557))))

(assert (=> b!865228 (= lt!391957 (getCurrentListMapNoExtraKeys!2974 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391946 () Unit!29628)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!553 (array!49792 array!49790 (_ BitVec 32) (_ BitVec 32) V!27467 V!27467 (_ BitVec 32) (_ BitVec 64) V!27467 (_ BitVec 32) Int) Unit!29628)

(assert (=> b!865228 (= lt!391946 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!553 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865229 () Bool)

(declare-fun res!587909 () Bool)

(assert (=> b!865229 (=> (not res!587909) (not e!481993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865229 (= res!587909 (validMask!0 mask!1196))))

(declare-fun b!865230 () Bool)

(declare-fun tp_is_empty!16815 () Bool)

(assert (=> b!865230 (= e!481998 tp_is_empty!16815)))

(declare-fun b!865231 () Bool)

(declare-fun res!587903 () Bool)

(assert (=> b!865231 (=> (not res!587903) (not e!481993))))

(assert (=> b!865231 (= res!587903 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24367 _keys!868))))))

(declare-fun b!865232 () Bool)

(assert (=> b!865232 (= e!481993 e!481997)))

(declare-fun res!587905 () Bool)

(assert (=> b!865232 (=> (not res!587905) (not e!481997))))

(assert (=> b!865232 (= res!587905 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!391945 () ListLongMap!9975)

(assert (=> b!865232 (= lt!391945 (getCurrentListMapNoExtraKeys!2974 _keys!868 lt!391948 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865232 (= lt!391948 (array!49791 (store (arr!23926 _values!688) i!612 (ValueCellFull!7968 v!557)) (size!24366 _values!688)))))

(declare-fun lt!391959 () ListLongMap!9975)

(assert (=> b!865232 (= lt!391959 (getCurrentListMapNoExtraKeys!2974 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865233 () Bool)

(declare-fun res!587907 () Bool)

(assert (=> b!865233 (=> (not res!587907) (not e!481993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49792 (_ BitVec 32)) Bool)

(assert (=> b!865233 (= res!587907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26822 () Bool)

(assert (=> mapIsEmpty!26822 mapRes!26822))

(declare-fun res!587911 () Bool)

(assert (=> start!73764 (=> (not res!587911) (not e!481993))))

(assert (=> start!73764 (= res!587911 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24367 _keys!868))))))

(assert (=> start!73764 e!481993))

(assert (=> start!73764 tp_is_empty!16815))

(assert (=> start!73764 true))

(assert (=> start!73764 tp!51540))

(declare-fun array_inv!18916 (array!49792) Bool)

(assert (=> start!73764 (array_inv!18916 _keys!868)))

(declare-fun e!481991 () Bool)

(declare-fun array_inv!18917 (array!49790) Bool)

(assert (=> start!73764 (and (array_inv!18917 _values!688) e!481991)))

(declare-fun b!865234 () Bool)

(declare-fun res!587908 () Bool)

(assert (=> b!865234 (=> (not res!587908) (not e!481993))))

(assert (=> b!865234 (= res!587908 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17006))))

(declare-fun b!865235 () Bool)

(assert (=> b!865235 (= e!481999 e!481992)))

(declare-fun res!587902 () Bool)

(assert (=> b!865235 (=> res!587902 e!481992)))

(assert (=> b!865235 (= res!587902 (= k0!854 (select (arr!23927 _keys!868) from!1053)))))

(assert (=> b!865235 (not (= (select (arr!23927 _keys!868) from!1053) k0!854))))

(declare-fun lt!391960 () Unit!29628)

(assert (=> b!865235 (= lt!391960 e!481994)))

(declare-fun c!92239 () Bool)

(assert (=> b!865235 (= c!92239 (= (select (arr!23927 _keys!868) from!1053) k0!854))))

(assert (=> b!865235 (= lt!391945 lt!391951)))

(assert (=> b!865235 (= lt!391951 (+!2352 lt!391947 lt!391950))))

(assert (=> b!865235 (= lt!391950 (tuple2!11207 (select (arr!23927 _keys!868) from!1053) lt!391955))))

(declare-fun get!12645 (ValueCell!7968 V!27467) V!27467)

(declare-fun dynLambda!1175 (Int (_ BitVec 64)) V!27467)

(assert (=> b!865235 (= lt!391955 (get!12645 (select (arr!23926 _values!688) from!1053) (dynLambda!1175 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865236 () Bool)

(declare-fun Unit!29631 () Unit!29628)

(assert (=> b!865236 (= e!481994 Unit!29631)))

(declare-fun b!865237 () Bool)

(declare-fun res!587904 () Bool)

(assert (=> b!865237 (=> (not res!587904) (not e!481993))))

(assert (=> b!865237 (= res!587904 (and (= (size!24366 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24367 _keys!868) (size!24366 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865238 () Bool)

(declare-fun res!587912 () Bool)

(assert (=> b!865238 (=> (not res!587912) (not e!481993))))

(assert (=> b!865238 (= res!587912 (validKeyInArray!0 k0!854))))

(declare-fun b!865239 () Bool)

(declare-fun e!481995 () Bool)

(assert (=> b!865239 (= e!481995 tp_is_empty!16815)))

(declare-fun b!865240 () Bool)

(assert (=> b!865240 (= e!481991 (and e!481995 mapRes!26822))))

(declare-fun condMapEmpty!26822 () Bool)

(declare-fun mapDefault!26822 () ValueCell!7968)

(assert (=> b!865240 (= condMapEmpty!26822 (= (arr!23926 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7968)) mapDefault!26822)))))

(assert (= (and start!73764 res!587911) b!865229))

(assert (= (and b!865229 res!587909) b!865237))

(assert (= (and b!865237 res!587904) b!865233))

(assert (= (and b!865233 res!587907) b!865234))

(assert (= (and b!865234 res!587908) b!865231))

(assert (= (and b!865231 res!587903) b!865238))

(assert (= (and b!865238 res!587912) b!865227))

(assert (= (and b!865227 res!587910) b!865232))

(assert (= (and b!865232 res!587905) b!865228))

(assert (= (and b!865228 (not res!587906)) b!865235))

(assert (= (and b!865235 c!92239) b!865226))

(assert (= (and b!865235 (not c!92239)) b!865236))

(assert (= (and b!865235 (not res!587902)) b!865225))

(assert (= (and b!865240 condMapEmpty!26822) mapIsEmpty!26822))

(assert (= (and b!865240 (not condMapEmpty!26822)) mapNonEmpty!26822))

(get-info :version)

(assert (= (and mapNonEmpty!26822 ((_ is ValueCellFull!7968) mapValue!26822)) b!865230))

(assert (= (and b!865240 ((_ is ValueCellFull!7968) mapDefault!26822)) b!865239))

(assert (= start!73764 b!865240))

(declare-fun b_lambda!12031 () Bool)

(assert (=> (not b_lambda!12031) (not b!865235)))

(declare-fun t!23952 () Bool)

(declare-fun tb!4801 () Bool)

(assert (=> (and start!73764 (= defaultEntry!696 defaultEntry!696) t!23952) tb!4801))

(declare-fun result!9213 () Bool)

(assert (=> tb!4801 (= result!9213 tp_is_empty!16815)))

(assert (=> b!865235 t!23952))

(declare-fun b_and!24339 () Bool)

(assert (= b_and!24337 (and (=> t!23952 result!9213) b_and!24339)))

(declare-fun m!806691 () Bool)

(assert (=> b!865232 m!806691))

(declare-fun m!806693 () Bool)

(assert (=> b!865232 m!806693))

(declare-fun m!806695 () Bool)

(assert (=> b!865232 m!806695))

(declare-fun m!806697 () Bool)

(assert (=> b!865227 m!806697))

(declare-fun m!806699 () Bool)

(assert (=> start!73764 m!806699))

(declare-fun m!806701 () Bool)

(assert (=> start!73764 m!806701))

(declare-fun m!806703 () Bool)

(assert (=> b!865226 m!806703))

(declare-fun m!806705 () Bool)

(assert (=> b!865226 m!806705))

(declare-fun m!806707 () Bool)

(assert (=> b!865226 m!806707))

(declare-fun m!806709 () Bool)

(assert (=> b!865226 m!806709))

(declare-fun m!806711 () Bool)

(assert (=> b!865226 m!806711))

(declare-fun m!806713 () Bool)

(assert (=> b!865238 m!806713))

(declare-fun m!806715 () Bool)

(assert (=> b!865228 m!806715))

(declare-fun m!806717 () Bool)

(assert (=> b!865228 m!806717))

(declare-fun m!806719 () Bool)

(assert (=> b!865228 m!806719))

(assert (=> b!865228 m!806717))

(declare-fun m!806721 () Bool)

(assert (=> b!865228 m!806721))

(declare-fun m!806723 () Bool)

(assert (=> b!865228 m!806723))

(declare-fun m!806725 () Bool)

(assert (=> b!865228 m!806725))

(declare-fun m!806727 () Bool)

(assert (=> b!865225 m!806727))

(assert (=> b!865225 m!806727))

(declare-fun m!806729 () Bool)

(assert (=> b!865225 m!806729))

(assert (=> b!865225 m!806717))

(assert (=> b!865225 m!806717))

(declare-fun m!806731 () Bool)

(assert (=> b!865225 m!806731))

(declare-fun m!806733 () Bool)

(assert (=> mapNonEmpty!26822 m!806733))

(declare-fun m!806735 () Bool)

(assert (=> b!865229 m!806735))

(declare-fun m!806737 () Bool)

(assert (=> b!865234 m!806737))

(declare-fun m!806739 () Bool)

(assert (=> b!865233 m!806739))

(declare-fun m!806741 () Bool)

(assert (=> b!865235 m!806741))

(declare-fun m!806743 () Bool)

(assert (=> b!865235 m!806743))

(declare-fun m!806745 () Bool)

(assert (=> b!865235 m!806745))

(declare-fun m!806747 () Bool)

(assert (=> b!865235 m!806747))

(assert (=> b!865235 m!806743))

(assert (=> b!865235 m!806717))

(assert (=> b!865235 m!806745))

(check-sat (not b!865233) (not b!865229) (not b!865234) tp_is_empty!16815 (not b!865228) (not b!865238) (not b_next!14679) b_and!24339 (not b_lambda!12031) (not mapNonEmpty!26822) (not start!73764) (not b!865226) (not b!865225) (not b!865232) (not b!865235))
(check-sat b_and!24339 (not b_next!14679))
