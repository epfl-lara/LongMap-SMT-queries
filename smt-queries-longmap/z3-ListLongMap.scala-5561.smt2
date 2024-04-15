; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73132 () Bool)

(assert start!73132)

(declare-fun b_free!14065 () Bool)

(declare-fun b_next!14065 () Bool)

(assert (=> start!73132 (= b_free!14065 (not b_next!14065))))

(declare-fun tp!49700 () Bool)

(declare-fun b_and!23263 () Bool)

(assert (=> start!73132 (= tp!49700 b_and!23263)))

(declare-fun mapNonEmpty!25901 () Bool)

(declare-fun mapRes!25901 () Bool)

(declare-fun tp!49699 () Bool)

(declare-fun e!474896 () Bool)

(assert (=> mapNonEmpty!25901 (= mapRes!25901 (and tp!49699 e!474896))))

(declare-datatypes ((V!26649 0))(
  ( (V!26650 (val!8148 Int)) )
))
(declare-datatypes ((ValueCell!7661 0))(
  ( (ValueCellFull!7661 (v!10567 V!26649)) (EmptyCell!7661) )
))
(declare-fun mapRest!25901 () (Array (_ BitVec 32) ValueCell!7661))

(declare-fun mapValue!25901 () ValueCell!7661)

(declare-fun mapKey!25901 () (_ BitVec 32))

(declare-datatypes ((array!48591 0))(
  ( (array!48592 (arr!23327 (Array (_ BitVec 32) ValueCell!7661)) (size!23769 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48591)

(assert (=> mapNonEmpty!25901 (= (arr!23327 _values!688) (store mapRest!25901 mapKey!25901 mapValue!25901))))

(declare-fun b!851443 () Bool)

(declare-fun res!578392 () Bool)

(declare-fun e!474894 () Bool)

(assert (=> b!851443 (=> (not res!578392) (not e!474894))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851443 (= res!578392 (validKeyInArray!0 k0!854))))

(declare-datatypes ((tuple2!10710 0))(
  ( (tuple2!10711 (_1!5366 (_ BitVec 64)) (_2!5366 V!26649)) )
))
(declare-datatypes ((List!16544 0))(
  ( (Nil!16541) (Cons!16540 (h!17671 tuple2!10710) (t!23046 List!16544)) )
))
(declare-datatypes ((ListLongMap!9469 0))(
  ( (ListLongMap!9470 (toList!4750 List!16544)) )
))
(declare-fun call!38025 () ListLongMap!9469)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!383384 () array!48591)

(declare-datatypes ((array!48593 0))(
  ( (array!48594 (arr!23328 (Array (_ BitVec 32) (_ BitVec 64))) (size!23770 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48593)

(declare-fun bm!38021 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26649)

(declare-fun zeroValue!654 () V!26649)

(declare-fun getCurrentListMapNoExtraKeys!2758 (array!48593 array!48591 (_ BitVec 32) (_ BitVec 32) V!26649 V!26649 (_ BitVec 32) Int) ListLongMap!9469)

(assert (=> bm!38021 (= call!38025 (getCurrentListMapNoExtraKeys!2758 _keys!868 lt!383384 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38022 () Bool)

(declare-fun call!38024 () ListLongMap!9469)

(assert (=> bm!38022 (= call!38024 (getCurrentListMapNoExtraKeys!2758 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851444 () Bool)

(declare-fun v!557 () V!26649)

(declare-fun e!474900 () Bool)

(declare-fun +!2169 (ListLongMap!9469 tuple2!10710) ListLongMap!9469)

(assert (=> b!851444 (= e!474900 (= call!38025 (+!2169 call!38024 (tuple2!10711 k0!854 v!557))))))

(declare-fun b!851446 () Bool)

(declare-fun e!474895 () Bool)

(declare-fun e!474893 () Bool)

(assert (=> b!851446 (= e!474895 (and e!474893 mapRes!25901))))

(declare-fun condMapEmpty!25901 () Bool)

(declare-fun mapDefault!25901 () ValueCell!7661)

(assert (=> b!851446 (= condMapEmpty!25901 (= (arr!23327 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7661)) mapDefault!25901)))))

(declare-fun b!851447 () Bool)

(declare-fun e!474899 () Bool)

(assert (=> b!851447 (= e!474894 e!474899)))

(declare-fun res!578396 () Bool)

(assert (=> b!851447 (=> (not res!578396) (not e!474899))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851447 (= res!578396 (= from!1053 i!612))))

(declare-fun lt!383380 () ListLongMap!9469)

(assert (=> b!851447 (= lt!383380 (getCurrentListMapNoExtraKeys!2758 _keys!868 lt!383384 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851447 (= lt!383384 (array!48592 (store (arr!23327 _values!688) i!612 (ValueCellFull!7661 v!557)) (size!23769 _values!688)))))

(declare-fun lt!383378 () ListLongMap!9469)

(assert (=> b!851447 (= lt!383378 (getCurrentListMapNoExtraKeys!2758 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851448 () Bool)

(declare-fun res!578393 () Bool)

(assert (=> b!851448 (=> (not res!578393) (not e!474894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851448 (= res!578393 (validMask!0 mask!1196))))

(declare-fun b!851449 () Bool)

(declare-fun res!578390 () Bool)

(assert (=> b!851449 (=> (not res!578390) (not e!474894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48593 (_ BitVec 32)) Bool)

(assert (=> b!851449 (= res!578390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851450 () Bool)

(declare-fun res!578388 () Bool)

(assert (=> b!851450 (=> (not res!578388) (not e!474894))))

(declare-datatypes ((List!16545 0))(
  ( (Nil!16542) (Cons!16541 (h!17672 (_ BitVec 64)) (t!23047 List!16545)) )
))
(declare-fun arrayNoDuplicates!0 (array!48593 (_ BitVec 32) List!16545) Bool)

(assert (=> b!851450 (= res!578388 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16542))))

(declare-fun b!851451 () Bool)

(declare-fun tp_is_empty!16201 () Bool)

(assert (=> b!851451 (= e!474896 tp_is_empty!16201)))

(declare-fun b!851452 () Bool)

(declare-fun res!578395 () Bool)

(assert (=> b!851452 (=> (not res!578395) (not e!474894))))

(assert (=> b!851452 (= res!578395 (and (= (select (arr!23328 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851453 () Bool)

(assert (=> b!851453 (= e!474893 tp_is_empty!16201)))

(declare-fun b!851454 () Bool)

(declare-fun e!474897 () Bool)

(assert (=> b!851454 (= e!474897 true)))

(declare-fun lt!383386 () V!26649)

(declare-fun lt!383382 () ListLongMap!9469)

(declare-fun lt!383379 () tuple2!10710)

(assert (=> b!851454 (= (+!2169 lt!383382 lt!383379) (+!2169 (+!2169 lt!383382 (tuple2!10711 k0!854 lt!383386)) lt!383379))))

(declare-fun lt!383383 () V!26649)

(assert (=> b!851454 (= lt!383379 (tuple2!10711 k0!854 lt!383383))))

(declare-datatypes ((Unit!29011 0))(
  ( (Unit!29012) )
))
(declare-fun lt!383385 () Unit!29011)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!283 (ListLongMap!9469 (_ BitVec 64) V!26649 V!26649) Unit!29011)

(assert (=> b!851454 (= lt!383385 (addSameAsAddTwiceSameKeyDiffValues!283 lt!383382 k0!854 lt!383386 lt!383383))))

(declare-fun lt!383387 () V!26649)

(declare-fun get!12302 (ValueCell!7661 V!26649) V!26649)

(assert (=> b!851454 (= lt!383386 (get!12302 (select (arr!23327 _values!688) from!1053) lt!383387))))

(assert (=> b!851454 (= lt!383380 (+!2169 lt!383382 (tuple2!10711 (select (arr!23328 _keys!868) from!1053) lt!383383)))))

(assert (=> b!851454 (= lt!383383 (get!12302 (select (store (arr!23327 _values!688) i!612 (ValueCellFull!7661 v!557)) from!1053) lt!383387))))

(declare-fun dynLambda!1033 (Int (_ BitVec 64)) V!26649)

(assert (=> b!851454 (= lt!383387 (dynLambda!1033 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851454 (= lt!383382 (getCurrentListMapNoExtraKeys!2758 _keys!868 lt!383384 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851455 () Bool)

(declare-fun res!578394 () Bool)

(assert (=> b!851455 (=> (not res!578394) (not e!474894))))

(assert (=> b!851455 (= res!578394 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23770 _keys!868))))))

(declare-fun b!851456 () Bool)

(declare-fun res!578389 () Bool)

(assert (=> b!851456 (=> (not res!578389) (not e!474894))))

(assert (=> b!851456 (= res!578389 (and (= (size!23769 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23770 _keys!868) (size!23769 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!578397 () Bool)

(assert (=> start!73132 (=> (not res!578397) (not e!474894))))

(assert (=> start!73132 (= res!578397 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23770 _keys!868))))))

(assert (=> start!73132 e!474894))

(assert (=> start!73132 tp_is_empty!16201))

(assert (=> start!73132 true))

(assert (=> start!73132 tp!49700))

(declare-fun array_inv!18584 (array!48593) Bool)

(assert (=> start!73132 (array_inv!18584 _keys!868)))

(declare-fun array_inv!18585 (array!48591) Bool)

(assert (=> start!73132 (and (array_inv!18585 _values!688) e!474895)))

(declare-fun b!851445 () Bool)

(assert (=> b!851445 (= e!474899 (not e!474897))))

(declare-fun res!578391 () Bool)

(assert (=> b!851445 (=> res!578391 e!474897)))

(assert (=> b!851445 (= res!578391 (not (validKeyInArray!0 (select (arr!23328 _keys!868) from!1053))))))

(assert (=> b!851445 e!474900))

(declare-fun c!91703 () Bool)

(assert (=> b!851445 (= c!91703 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383381 () Unit!29011)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!374 (array!48593 array!48591 (_ BitVec 32) (_ BitVec 32) V!26649 V!26649 (_ BitVec 32) (_ BitVec 64) V!26649 (_ BitVec 32) Int) Unit!29011)

(assert (=> b!851445 (= lt!383381 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!374 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851457 () Bool)

(assert (=> b!851457 (= e!474900 (= call!38025 call!38024))))

(declare-fun mapIsEmpty!25901 () Bool)

(assert (=> mapIsEmpty!25901 mapRes!25901))

(assert (= (and start!73132 res!578397) b!851448))

(assert (= (and b!851448 res!578393) b!851456))

(assert (= (and b!851456 res!578389) b!851449))

(assert (= (and b!851449 res!578390) b!851450))

(assert (= (and b!851450 res!578388) b!851455))

(assert (= (and b!851455 res!578394) b!851443))

(assert (= (and b!851443 res!578392) b!851452))

(assert (= (and b!851452 res!578395) b!851447))

(assert (= (and b!851447 res!578396) b!851445))

(assert (= (and b!851445 c!91703) b!851444))

(assert (= (and b!851445 (not c!91703)) b!851457))

(assert (= (or b!851444 b!851457) bm!38022))

(assert (= (or b!851444 b!851457) bm!38021))

(assert (= (and b!851445 (not res!578391)) b!851454))

(assert (= (and b!851446 condMapEmpty!25901) mapIsEmpty!25901))

(assert (= (and b!851446 (not condMapEmpty!25901)) mapNonEmpty!25901))

(get-info :version)

(assert (= (and mapNonEmpty!25901 ((_ is ValueCellFull!7661) mapValue!25901)) b!851451))

(assert (= (and b!851446 ((_ is ValueCellFull!7661) mapDefault!25901)) b!851453))

(assert (= start!73132 b!851446))

(declare-fun b_lambda!11579 () Bool)

(assert (=> (not b_lambda!11579) (not b!851454)))

(declare-fun t!23045 () Bool)

(declare-fun tb!4359 () Bool)

(assert (=> (and start!73132 (= defaultEntry!696 defaultEntry!696) t!23045) tb!4359))

(declare-fun result!8337 () Bool)

(assert (=> tb!4359 (= result!8337 tp_is_empty!16201)))

(assert (=> b!851454 t!23045))

(declare-fun b_and!23265 () Bool)

(assert (= b_and!23263 (and (=> t!23045 result!8337) b_and!23265)))

(declare-fun m!791875 () Bool)

(assert (=> b!851454 m!791875))

(declare-fun m!791877 () Bool)

(assert (=> b!851454 m!791877))

(assert (=> b!851454 m!791877))

(declare-fun m!791879 () Bool)

(assert (=> b!851454 m!791879))

(declare-fun m!791881 () Bool)

(assert (=> b!851454 m!791881))

(declare-fun m!791883 () Bool)

(assert (=> b!851454 m!791883))

(declare-fun m!791885 () Bool)

(assert (=> b!851454 m!791885))

(declare-fun m!791887 () Bool)

(assert (=> b!851454 m!791887))

(assert (=> b!851454 m!791881))

(declare-fun m!791889 () Bool)

(assert (=> b!851454 m!791889))

(declare-fun m!791891 () Bool)

(assert (=> b!851454 m!791891))

(declare-fun m!791893 () Bool)

(assert (=> b!851454 m!791893))

(assert (=> b!851454 m!791891))

(declare-fun m!791895 () Bool)

(assert (=> b!851454 m!791895))

(declare-fun m!791897 () Bool)

(assert (=> b!851454 m!791897))

(declare-fun m!791899 () Bool)

(assert (=> b!851454 m!791899))

(declare-fun m!791901 () Bool)

(assert (=> b!851448 m!791901))

(assert (=> b!851445 m!791897))

(assert (=> b!851445 m!791897))

(declare-fun m!791903 () Bool)

(assert (=> b!851445 m!791903))

(declare-fun m!791905 () Bool)

(assert (=> b!851445 m!791905))

(declare-fun m!791907 () Bool)

(assert (=> bm!38022 m!791907))

(declare-fun m!791909 () Bool)

(assert (=> b!851443 m!791909))

(declare-fun m!791911 () Bool)

(assert (=> b!851449 m!791911))

(declare-fun m!791913 () Bool)

(assert (=> start!73132 m!791913))

(declare-fun m!791915 () Bool)

(assert (=> start!73132 m!791915))

(declare-fun m!791917 () Bool)

(assert (=> mapNonEmpty!25901 m!791917))

(assert (=> bm!38021 m!791875))

(declare-fun m!791919 () Bool)

(assert (=> b!851444 m!791919))

(declare-fun m!791921 () Bool)

(assert (=> b!851447 m!791921))

(assert (=> b!851447 m!791889))

(declare-fun m!791923 () Bool)

(assert (=> b!851447 m!791923))

(declare-fun m!791925 () Bool)

(assert (=> b!851452 m!791925))

(declare-fun m!791927 () Bool)

(assert (=> b!851450 m!791927))

(check-sat tp_is_empty!16201 (not b!851448) (not b!851449) (not b!851443) (not bm!38021) (not start!73132) b_and!23265 (not b!851454) (not mapNonEmpty!25901) (not bm!38022) (not b!851445) (not b!851447) (not b_lambda!11579) (not b!851450) (not b_next!14065) (not b!851444))
(check-sat b_and!23265 (not b_next!14065))
