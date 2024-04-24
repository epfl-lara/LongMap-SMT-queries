; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73390 () Bool)

(assert start!73390)

(declare-fun b_free!14137 () Bool)

(declare-fun b_next!14137 () Bool)

(assert (=> start!73390 (= b_free!14137 (not b_next!14137))))

(declare-fun tp!49916 () Bool)

(declare-fun b_and!23443 () Bool)

(assert (=> start!73390 (= tp!49916 b_and!23443)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48793 0))(
  ( (array!48794 (arr!23423 (Array (_ BitVec 32) (_ BitVec 64))) (size!23864 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48793)

(declare-datatypes ((V!26745 0))(
  ( (V!26746 (val!8184 Int)) )
))
(declare-datatypes ((tuple2!10684 0))(
  ( (tuple2!10685 (_1!5353 (_ BitVec 64)) (_2!5353 V!26745)) )
))
(declare-datatypes ((List!16535 0))(
  ( (Nil!16532) (Cons!16531 (h!17668 tuple2!10684) (t!23110 List!16535)) )
))
(declare-datatypes ((ListLongMap!9455 0))(
  ( (ListLongMap!9456 (toList!4743 List!16535)) )
))
(declare-fun call!38312 () ListLongMap!9455)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26745)

(declare-fun zeroValue!654 () V!26745)

(declare-fun bm!38308 () Bool)

(declare-datatypes ((ValueCell!7697 0))(
  ( (ValueCellFull!7697 (v!10609 V!26745)) (EmptyCell!7697) )
))
(declare-datatypes ((array!48795 0))(
  ( (array!48796 (arr!23424 (Array (_ BitVec 32) ValueCell!7697)) (size!23865 (_ BitVec 32))) )
))
(declare-fun lt!385064 () array!48795)

(declare-fun getCurrentListMapNoExtraKeys!2800 (array!48793 array!48795 (_ BitVec 32) (_ BitVec 32) V!26745 V!26745 (_ BitVec 32) Int) ListLongMap!9455)

(assert (=> bm!38308 (= call!38312 (getCurrentListMapNoExtraKeys!2800 _keys!868 lt!385064 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854277 () Bool)

(declare-fun res!579931 () Bool)

(declare-fun e!476487 () Bool)

(assert (=> b!854277 (=> (not res!579931) (not e!476487))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854277 (= res!579931 (validKeyInArray!0 k0!854))))

(declare-fun b!854278 () Bool)

(declare-fun e!476491 () Bool)

(declare-fun tp_is_empty!16273 () Bool)

(assert (=> b!854278 (= e!476491 tp_is_empty!16273)))

(declare-fun b!854279 () Bool)

(declare-fun e!476489 () Bool)

(declare-fun call!38311 () ListLongMap!9455)

(assert (=> b!854279 (= e!476489 (= call!38312 call!38311))))

(declare-fun b!854280 () Bool)

(declare-fun e!476490 () Bool)

(declare-fun e!476492 () Bool)

(declare-fun mapRes!26009 () Bool)

(assert (=> b!854280 (= e!476490 (and e!476492 mapRes!26009))))

(declare-fun condMapEmpty!26009 () Bool)

(declare-fun _values!688 () array!48795)

(declare-fun mapDefault!26009 () ValueCell!7697)

(assert (=> b!854280 (= condMapEmpty!26009 (= (arr!23424 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7697)) mapDefault!26009)))))

(declare-fun b!854281 () Bool)

(declare-fun res!579922 () Bool)

(assert (=> b!854281 (=> (not res!579922) (not e!476487))))

(assert (=> b!854281 (= res!579922 (and (= (size!23865 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23864 _keys!868) (size!23865 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26009 () Bool)

(assert (=> mapIsEmpty!26009 mapRes!26009))

(declare-fun b!854282 () Bool)

(declare-fun e!476488 () Bool)

(declare-fun e!476494 () Bool)

(assert (=> b!854282 (= e!476488 (not e!476494))))

(declare-fun res!579926 () Bool)

(assert (=> b!854282 (=> res!579926 e!476494)))

(assert (=> b!854282 (= res!579926 (not (validKeyInArray!0 (select (arr!23423 _keys!868) from!1053))))))

(assert (=> b!854282 e!476489))

(declare-fun c!92158 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854282 (= c!92158 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29132 0))(
  ( (Unit!29133) )
))
(declare-fun lt!385058 () Unit!29132)

(declare-fun v!557 () V!26745)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!391 (array!48793 array!48795 (_ BitVec 32) (_ BitVec 32) V!26745 V!26745 (_ BitVec 32) (_ BitVec 64) V!26745 (_ BitVec 32) Int) Unit!29132)

(assert (=> b!854282 (= lt!385058 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!391 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854283 () Bool)

(declare-fun res!579928 () Bool)

(assert (=> b!854283 (=> (not res!579928) (not e!476487))))

(assert (=> b!854283 (= res!579928 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23864 _keys!868))))))

(declare-fun b!854284 () Bool)

(assert (=> b!854284 (= e!476494 true)))

(declare-fun lt!385063 () ListLongMap!9455)

(declare-fun lt!385062 () tuple2!10684)

(declare-fun lt!385059 () V!26745)

(declare-fun +!2187 (ListLongMap!9455 tuple2!10684) ListLongMap!9455)

(assert (=> b!854284 (= (+!2187 lt!385063 lt!385062) (+!2187 (+!2187 lt!385063 (tuple2!10685 k0!854 lt!385059)) lt!385062))))

(declare-fun lt!385061 () V!26745)

(assert (=> b!854284 (= lt!385062 (tuple2!10685 k0!854 lt!385061))))

(declare-fun lt!385060 () Unit!29132)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!311 (ListLongMap!9455 (_ BitVec 64) V!26745 V!26745) Unit!29132)

(assert (=> b!854284 (= lt!385060 (addSameAsAddTwiceSameKeyDiffValues!311 lt!385063 k0!854 lt!385059 lt!385061))))

(declare-fun lt!385055 () V!26745)

(declare-fun get!12354 (ValueCell!7697 V!26745) V!26745)

(assert (=> b!854284 (= lt!385059 (get!12354 (select (arr!23424 _values!688) from!1053) lt!385055))))

(declare-fun lt!385057 () ListLongMap!9455)

(assert (=> b!854284 (= lt!385057 (+!2187 lt!385063 (tuple2!10685 (select (arr!23423 _keys!868) from!1053) lt!385061)))))

(assert (=> b!854284 (= lt!385061 (get!12354 (select (store (arr!23424 _values!688) i!612 (ValueCellFull!7697 v!557)) from!1053) lt!385055))))

(declare-fun dynLambda!1058 (Int (_ BitVec 64)) V!26745)

(assert (=> b!854284 (= lt!385055 (dynLambda!1058 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854284 (= lt!385063 (getCurrentListMapNoExtraKeys!2800 _keys!868 lt!385064 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854285 () Bool)

(declare-fun res!579927 () Bool)

(assert (=> b!854285 (=> (not res!579927) (not e!476487))))

(declare-datatypes ((List!16536 0))(
  ( (Nil!16533) (Cons!16532 (h!17669 (_ BitVec 64)) (t!23111 List!16536)) )
))
(declare-fun arrayNoDuplicates!0 (array!48793 (_ BitVec 32) List!16536) Bool)

(assert (=> b!854285 (= res!579927 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16533))))

(declare-fun b!854286 () Bool)

(declare-fun res!579923 () Bool)

(assert (=> b!854286 (=> (not res!579923) (not e!476487))))

(assert (=> b!854286 (= res!579923 (and (= (select (arr!23423 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854287 () Bool)

(assert (=> b!854287 (= e!476492 tp_is_empty!16273)))

(declare-fun b!854288 () Bool)

(declare-fun res!579924 () Bool)

(assert (=> b!854288 (=> (not res!579924) (not e!476487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854288 (= res!579924 (validMask!0 mask!1196))))

(declare-fun res!579925 () Bool)

(assert (=> start!73390 (=> (not res!579925) (not e!476487))))

(assert (=> start!73390 (= res!579925 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23864 _keys!868))))))

(assert (=> start!73390 e!476487))

(assert (=> start!73390 tp_is_empty!16273))

(assert (=> start!73390 true))

(assert (=> start!73390 tp!49916))

(declare-fun array_inv!18620 (array!48793) Bool)

(assert (=> start!73390 (array_inv!18620 _keys!868)))

(declare-fun array_inv!18621 (array!48795) Bool)

(assert (=> start!73390 (and (array_inv!18621 _values!688) e!476490)))

(declare-fun b!854289 () Bool)

(declare-fun res!579929 () Bool)

(assert (=> b!854289 (=> (not res!579929) (not e!476487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48793 (_ BitVec 32)) Bool)

(assert (=> b!854289 (= res!579929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!26009 () Bool)

(declare-fun tp!49915 () Bool)

(assert (=> mapNonEmpty!26009 (= mapRes!26009 (and tp!49915 e!476491))))

(declare-fun mapRest!26009 () (Array (_ BitVec 32) ValueCell!7697))

(declare-fun mapKey!26009 () (_ BitVec 32))

(declare-fun mapValue!26009 () ValueCell!7697)

(assert (=> mapNonEmpty!26009 (= (arr!23424 _values!688) (store mapRest!26009 mapKey!26009 mapValue!26009))))

(declare-fun b!854290 () Bool)

(assert (=> b!854290 (= e!476489 (= call!38312 (+!2187 call!38311 (tuple2!10685 k0!854 v!557))))))

(declare-fun bm!38309 () Bool)

(assert (=> bm!38309 (= call!38311 (getCurrentListMapNoExtraKeys!2800 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854291 () Bool)

(assert (=> b!854291 (= e!476487 e!476488)))

(declare-fun res!579930 () Bool)

(assert (=> b!854291 (=> (not res!579930) (not e!476488))))

(assert (=> b!854291 (= res!579930 (= from!1053 i!612))))

(assert (=> b!854291 (= lt!385057 (getCurrentListMapNoExtraKeys!2800 _keys!868 lt!385064 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854291 (= lt!385064 (array!48796 (store (arr!23424 _values!688) i!612 (ValueCellFull!7697 v!557)) (size!23865 _values!688)))))

(declare-fun lt!385056 () ListLongMap!9455)

(assert (=> b!854291 (= lt!385056 (getCurrentListMapNoExtraKeys!2800 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73390 res!579925) b!854288))

(assert (= (and b!854288 res!579924) b!854281))

(assert (= (and b!854281 res!579922) b!854289))

(assert (= (and b!854289 res!579929) b!854285))

(assert (= (and b!854285 res!579927) b!854283))

(assert (= (and b!854283 res!579928) b!854277))

(assert (= (and b!854277 res!579931) b!854286))

(assert (= (and b!854286 res!579923) b!854291))

(assert (= (and b!854291 res!579930) b!854282))

(assert (= (and b!854282 c!92158) b!854290))

(assert (= (and b!854282 (not c!92158)) b!854279))

(assert (= (or b!854290 b!854279) bm!38308))

(assert (= (or b!854290 b!854279) bm!38309))

(assert (= (and b!854282 (not res!579926)) b!854284))

(assert (= (and b!854280 condMapEmpty!26009) mapIsEmpty!26009))

(assert (= (and b!854280 (not condMapEmpty!26009)) mapNonEmpty!26009))

(get-info :version)

(assert (= (and mapNonEmpty!26009 ((_ is ValueCellFull!7697) mapValue!26009)) b!854278))

(assert (= (and b!854280 ((_ is ValueCellFull!7697) mapDefault!26009)) b!854287))

(assert (= start!73390 b!854280))

(declare-fun b_lambda!11683 () Bool)

(assert (=> (not b_lambda!11683) (not b!854284)))

(declare-fun t!23109 () Bool)

(declare-fun tb!4431 () Bool)

(assert (=> (and start!73390 (= defaultEntry!696 defaultEntry!696) t!23109) tb!4431))

(declare-fun result!8481 () Bool)

(assert (=> tb!4431 (= result!8481 tp_is_empty!16273)))

(assert (=> b!854284 t!23109))

(declare-fun b_and!23445 () Bool)

(assert (= b_and!23443 (and (=> t!23109 result!8481) b_and!23445)))

(declare-fun m!795865 () Bool)

(assert (=> b!854284 m!795865))

(declare-fun m!795867 () Bool)

(assert (=> b!854284 m!795867))

(declare-fun m!795869 () Bool)

(assert (=> b!854284 m!795869))

(declare-fun m!795871 () Bool)

(assert (=> b!854284 m!795871))

(declare-fun m!795873 () Bool)

(assert (=> b!854284 m!795873))

(declare-fun m!795875 () Bool)

(assert (=> b!854284 m!795875))

(declare-fun m!795877 () Bool)

(assert (=> b!854284 m!795877))

(declare-fun m!795879 () Bool)

(assert (=> b!854284 m!795879))

(assert (=> b!854284 m!795875))

(assert (=> b!854284 m!795867))

(declare-fun m!795881 () Bool)

(assert (=> b!854284 m!795881))

(declare-fun m!795883 () Bool)

(assert (=> b!854284 m!795883))

(declare-fun m!795885 () Bool)

(assert (=> b!854284 m!795885))

(assert (=> b!854284 m!795871))

(declare-fun m!795887 () Bool)

(assert (=> b!854284 m!795887))

(declare-fun m!795889 () Bool)

(assert (=> b!854284 m!795889))

(declare-fun m!795891 () Bool)

(assert (=> b!854277 m!795891))

(declare-fun m!795893 () Bool)

(assert (=> start!73390 m!795893))

(declare-fun m!795895 () Bool)

(assert (=> start!73390 m!795895))

(declare-fun m!795897 () Bool)

(assert (=> mapNonEmpty!26009 m!795897))

(declare-fun m!795899 () Bool)

(assert (=> b!854291 m!795899))

(assert (=> b!854291 m!795881))

(declare-fun m!795901 () Bool)

(assert (=> b!854291 m!795901))

(assert (=> b!854282 m!795887))

(assert (=> b!854282 m!795887))

(declare-fun m!795903 () Bool)

(assert (=> b!854282 m!795903))

(declare-fun m!795905 () Bool)

(assert (=> b!854282 m!795905))

(declare-fun m!795907 () Bool)

(assert (=> b!854285 m!795907))

(assert (=> bm!38308 m!795865))

(declare-fun m!795909 () Bool)

(assert (=> b!854286 m!795909))

(declare-fun m!795911 () Bool)

(assert (=> bm!38309 m!795911))

(declare-fun m!795913 () Bool)

(assert (=> b!854288 m!795913))

(declare-fun m!795915 () Bool)

(assert (=> b!854290 m!795915))

(declare-fun m!795917 () Bool)

(assert (=> b!854289 m!795917))

(check-sat (not start!73390) (not bm!38308) (not b!854282) (not b!854284) (not b!854289) (not b!854288) (not mapNonEmpty!26009) (not bm!38309) (not b_next!14137) (not b!854290) (not b!854277) (not b!854285) (not b_lambda!11683) tp_is_empty!16273 b_and!23445 (not b!854291))
(check-sat b_and!23445 (not b_next!14137))
