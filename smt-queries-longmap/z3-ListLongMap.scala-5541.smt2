; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73032 () Bool)

(assert start!73032)

(declare-fun b_free!13947 () Bool)

(declare-fun b_next!13947 () Bool)

(assert (=> start!73032 (= b_free!13947 (not b_next!13947))))

(declare-fun tp!49345 () Bool)

(declare-fun b_and!23053 () Bool)

(assert (=> start!73032 (= tp!49345 b_and!23053)))

(declare-fun mapNonEmpty!25724 () Bool)

(declare-fun mapRes!25724 () Bool)

(declare-fun tp!49344 () Bool)

(declare-fun e!473631 () Bool)

(assert (=> mapNonEmpty!25724 (= mapRes!25724 (and tp!49344 e!473631))))

(declare-datatypes ((V!26491 0))(
  ( (V!26492 (val!8089 Int)) )
))
(declare-datatypes ((ValueCell!7602 0))(
  ( (ValueCellFull!7602 (v!10514 V!26491)) (EmptyCell!7602) )
))
(declare-fun mapValue!25724 () ValueCell!7602)

(declare-datatypes ((array!48372 0))(
  ( (array!48373 (arr!23217 (Array (_ BitVec 32) ValueCell!7602)) (size!23657 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48372)

(declare-fun mapRest!25724 () (Array (_ BitVec 32) ValueCell!7602))

(declare-fun mapKey!25724 () (_ BitVec 32))

(assert (=> mapNonEmpty!25724 (= (arr!23217 _values!688) (store mapRest!25724 mapKey!25724 mapValue!25724))))

(declare-fun b!848909 () Bool)

(declare-fun res!576735 () Bool)

(declare-fun e!473625 () Bool)

(assert (=> b!848909 (=> (not res!576735) (not e!473625))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48374 0))(
  ( (array!48375 (arr!23218 (Array (_ BitVec 32) (_ BitVec 64))) (size!23658 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48374)

(assert (=> b!848909 (= res!576735 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23658 _keys!868))))))

(declare-fun b!848910 () Bool)

(declare-fun res!576731 () Bool)

(assert (=> b!848910 (=> (not res!576731) (not e!473625))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!848910 (= res!576731 (and (= (size!23657 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23658 _keys!868) (size!23657 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848911 () Bool)

(declare-fun res!576736 () Bool)

(assert (=> b!848911 (=> (not res!576736) (not e!473625))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848911 (= res!576736 (validKeyInArray!0 k0!854))))

(declare-fun bm!37693 () Bool)

(declare-datatypes ((tuple2!10584 0))(
  ( (tuple2!10585 (_1!5303 (_ BitVec 64)) (_2!5303 V!26491)) )
))
(declare-datatypes ((List!16437 0))(
  ( (Nil!16434) (Cons!16433 (h!17564 tuple2!10584) (t!22830 List!16437)) )
))
(declare-datatypes ((ListLongMap!9353 0))(
  ( (ListLongMap!9354 (toList!4692 List!16437)) )
))
(declare-fun call!37697 () ListLongMap!9353)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26491)

(declare-fun zeroValue!654 () V!26491)

(declare-fun getCurrentListMapNoExtraKeys!2674 (array!48374 array!48372 (_ BitVec 32) (_ BitVec 32) V!26491 V!26491 (_ BitVec 32) Int) ListLongMap!9353)

(assert (=> bm!37693 (= call!37697 (getCurrentListMapNoExtraKeys!2674 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848912 () Bool)

(declare-fun e!473627 () Bool)

(assert (=> b!848912 (= e!473627 true)))

(declare-fun lt!382139 () ListLongMap!9353)

(declare-fun lt!382141 () array!48372)

(declare-fun +!2100 (ListLongMap!9353 tuple2!10584) ListLongMap!9353)

(declare-fun get!12217 (ValueCell!7602 V!26491) V!26491)

(declare-fun dynLambda!991 (Int (_ BitVec 64)) V!26491)

(assert (=> b!848912 (= lt!382139 (+!2100 (getCurrentListMapNoExtraKeys!2674 _keys!868 lt!382141 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10585 (select (arr!23218 _keys!868) from!1053) (get!12217 (select (arr!23217 lt!382141) from!1053) (dynLambda!991 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!848913 () Bool)

(declare-fun tp_is_empty!16083 () Bool)

(assert (=> b!848913 (= e!473631 tp_is_empty!16083)))

(declare-fun b!848914 () Bool)

(declare-fun e!473626 () Bool)

(declare-fun e!473629 () Bool)

(assert (=> b!848914 (= e!473626 (and e!473629 mapRes!25724))))

(declare-fun condMapEmpty!25724 () Bool)

(declare-fun mapDefault!25724 () ValueCell!7602)

(assert (=> b!848914 (= condMapEmpty!25724 (= (arr!23217 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7602)) mapDefault!25724)))))

(declare-fun call!37696 () ListLongMap!9353)

(declare-fun bm!37694 () Bool)

(assert (=> bm!37694 (= call!37696 (getCurrentListMapNoExtraKeys!2674 _keys!868 lt!382141 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848915 () Bool)

(declare-fun e!473628 () Bool)

(assert (=> b!848915 (= e!473628 (not e!473627))))

(declare-fun res!576734 () Bool)

(assert (=> b!848915 (=> res!576734 e!473627)))

(assert (=> b!848915 (= res!576734 (not (validKeyInArray!0 (select (arr!23218 _keys!868) from!1053))))))

(declare-fun e!473630 () Bool)

(assert (=> b!848915 e!473630))

(declare-fun c!91591 () Bool)

(assert (=> b!848915 (= c!91591 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26491)

(declare-datatypes ((Unit!28991 0))(
  ( (Unit!28992) )
))
(declare-fun lt!382138 () Unit!28991)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!341 (array!48374 array!48372 (_ BitVec 32) (_ BitVec 32) V!26491 V!26491 (_ BitVec 32) (_ BitVec 64) V!26491 (_ BitVec 32) Int) Unit!28991)

(assert (=> b!848915 (= lt!382138 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!341 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848916 () Bool)

(assert (=> b!848916 (= e!473630 (= call!37696 call!37697))))

(declare-fun b!848917 () Bool)

(assert (=> b!848917 (= e!473625 e!473628)))

(declare-fun res!576730 () Bool)

(assert (=> b!848917 (=> (not res!576730) (not e!473628))))

(assert (=> b!848917 (= res!576730 (= from!1053 i!612))))

(assert (=> b!848917 (= lt!382139 (getCurrentListMapNoExtraKeys!2674 _keys!868 lt!382141 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848917 (= lt!382141 (array!48373 (store (arr!23217 _values!688) i!612 (ValueCellFull!7602 v!557)) (size!23657 _values!688)))))

(declare-fun lt!382140 () ListLongMap!9353)

(assert (=> b!848917 (= lt!382140 (getCurrentListMapNoExtraKeys!2674 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848918 () Bool)

(assert (=> b!848918 (= e!473629 tp_is_empty!16083)))

(declare-fun b!848919 () Bool)

(declare-fun res!576729 () Bool)

(assert (=> b!848919 (=> (not res!576729) (not e!473625))))

(declare-datatypes ((List!16438 0))(
  ( (Nil!16435) (Cons!16434 (h!17565 (_ BitVec 64)) (t!22831 List!16438)) )
))
(declare-fun arrayNoDuplicates!0 (array!48374 (_ BitVec 32) List!16438) Bool)

(assert (=> b!848919 (= res!576729 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16435))))

(declare-fun b!848920 () Bool)

(declare-fun res!576728 () Bool)

(assert (=> b!848920 (=> (not res!576728) (not e!473625))))

(assert (=> b!848920 (= res!576728 (and (= (select (arr!23218 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848921 () Bool)

(declare-fun res!576733 () Bool)

(assert (=> b!848921 (=> (not res!576733) (not e!473625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48374 (_ BitVec 32)) Bool)

(assert (=> b!848921 (= res!576733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!576732 () Bool)

(assert (=> start!73032 (=> (not res!576732) (not e!473625))))

(assert (=> start!73032 (= res!576732 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23658 _keys!868))))))

(assert (=> start!73032 e!473625))

(assert (=> start!73032 tp_is_empty!16083))

(assert (=> start!73032 true))

(assert (=> start!73032 tp!49345))

(declare-fun array_inv!18428 (array!48374) Bool)

(assert (=> start!73032 (array_inv!18428 _keys!868)))

(declare-fun array_inv!18429 (array!48372) Bool)

(assert (=> start!73032 (and (array_inv!18429 _values!688) e!473626)))

(declare-fun mapIsEmpty!25724 () Bool)

(assert (=> mapIsEmpty!25724 mapRes!25724))

(declare-fun b!848922 () Bool)

(assert (=> b!848922 (= e!473630 (= call!37696 (+!2100 call!37697 (tuple2!10585 k0!854 v!557))))))

(declare-fun b!848923 () Bool)

(declare-fun res!576737 () Bool)

(assert (=> b!848923 (=> (not res!576737) (not e!473625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848923 (= res!576737 (validMask!0 mask!1196))))

(assert (= (and start!73032 res!576732) b!848923))

(assert (= (and b!848923 res!576737) b!848910))

(assert (= (and b!848910 res!576731) b!848921))

(assert (= (and b!848921 res!576733) b!848919))

(assert (= (and b!848919 res!576729) b!848909))

(assert (= (and b!848909 res!576735) b!848911))

(assert (= (and b!848911 res!576736) b!848920))

(assert (= (and b!848920 res!576728) b!848917))

(assert (= (and b!848917 res!576730) b!848915))

(assert (= (and b!848915 c!91591) b!848922))

(assert (= (and b!848915 (not c!91591)) b!848916))

(assert (= (or b!848922 b!848916) bm!37694))

(assert (= (or b!848922 b!848916) bm!37693))

(assert (= (and b!848915 (not res!576734)) b!848912))

(assert (= (and b!848914 condMapEmpty!25724) mapIsEmpty!25724))

(assert (= (and b!848914 (not condMapEmpty!25724)) mapNonEmpty!25724))

(get-info :version)

(assert (= (and mapNonEmpty!25724 ((_ is ValueCellFull!7602) mapValue!25724)) b!848913))

(assert (= (and b!848914 ((_ is ValueCellFull!7602) mapDefault!25724)) b!848918))

(assert (= start!73032 b!848914))

(declare-fun b_lambda!11479 () Bool)

(assert (=> (not b_lambda!11479) (not b!848912)))

(declare-fun t!22829 () Bool)

(declare-fun tb!4249 () Bool)

(assert (=> (and start!73032 (= defaultEntry!696 defaultEntry!696) t!22829) tb!4249))

(declare-fun result!8109 () Bool)

(assert (=> tb!4249 (= result!8109 tp_is_empty!16083)))

(assert (=> b!848912 t!22829))

(declare-fun b_and!23055 () Bool)

(assert (= b_and!23053 (and (=> t!22829 result!8109) b_and!23055)))

(declare-fun m!789645 () Bool)

(assert (=> b!848919 m!789645))

(declare-fun m!789647 () Bool)

(assert (=> bm!37694 m!789647))

(declare-fun m!789649 () Bool)

(assert (=> b!848917 m!789649))

(declare-fun m!789651 () Bool)

(assert (=> b!848917 m!789651))

(declare-fun m!789653 () Bool)

(assert (=> b!848917 m!789653))

(declare-fun m!789655 () Bool)

(assert (=> b!848920 m!789655))

(declare-fun m!789657 () Bool)

(assert (=> b!848923 m!789657))

(declare-fun m!789659 () Bool)

(assert (=> b!848915 m!789659))

(assert (=> b!848915 m!789659))

(declare-fun m!789661 () Bool)

(assert (=> b!848915 m!789661))

(declare-fun m!789663 () Bool)

(assert (=> b!848915 m!789663))

(declare-fun m!789665 () Bool)

(assert (=> mapNonEmpty!25724 m!789665))

(assert (=> b!848912 m!789647))

(declare-fun m!789667 () Bool)

(assert (=> b!848912 m!789667))

(declare-fun m!789669 () Bool)

(assert (=> b!848912 m!789669))

(assert (=> b!848912 m!789669))

(declare-fun m!789671 () Bool)

(assert (=> b!848912 m!789671))

(declare-fun m!789673 () Bool)

(assert (=> b!848912 m!789673))

(assert (=> b!848912 m!789659))

(assert (=> b!848912 m!789671))

(assert (=> b!848912 m!789647))

(declare-fun m!789675 () Bool)

(assert (=> bm!37693 m!789675))

(declare-fun m!789677 () Bool)

(assert (=> b!848922 m!789677))

(declare-fun m!789679 () Bool)

(assert (=> b!848921 m!789679))

(declare-fun m!789681 () Bool)

(assert (=> start!73032 m!789681))

(declare-fun m!789683 () Bool)

(assert (=> start!73032 m!789683))

(declare-fun m!789685 () Bool)

(assert (=> b!848911 m!789685))

(check-sat tp_is_empty!16083 (not b!848915) b_and!23055 (not b!848911) (not b!848912) (not b!848923) (not b_lambda!11479) (not bm!37694) (not b!848917) (not start!73032) (not mapNonEmpty!25724) (not b!848922) (not b!848919) (not bm!37693) (not b!848921) (not b_next!13947))
(check-sat b_and!23055 (not b_next!13947))
