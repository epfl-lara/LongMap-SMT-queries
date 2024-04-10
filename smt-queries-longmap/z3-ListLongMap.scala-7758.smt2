; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97294 () Bool)

(assert start!97294)

(declare-fun b_free!23265 () Bool)

(declare-fun b_next!23265 () Bool)

(assert (=> start!97294 (= b_free!23265 (not b_next!23265))))

(declare-fun tp!82093 () Bool)

(declare-fun b_and!37361 () Bool)

(assert (=> start!97294 (= tp!82093 b_and!37361)))

(declare-fun b!1107995 () Bool)

(declare-fun e!632119 () Bool)

(assert (=> b!1107995 (= e!632119 true)))

(declare-fun e!632117 () Bool)

(assert (=> b!1107995 e!632117))

(declare-fun c!109077 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107995 (= c!109077 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41827 0))(
  ( (V!41828 (val!13819 Int)) )
))
(declare-fun zeroValue!944 () V!41827)

(declare-datatypes ((array!71967 0))(
  ( (array!71968 (arr!34636 (Array (_ BitVec 32) (_ BitVec 64))) (size!35172 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71967)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36366 0))(
  ( (Unit!36367) )
))
(declare-fun lt!495731 () Unit!36366)

(declare-datatypes ((ValueCell!13053 0))(
  ( (ValueCellFull!13053 (v!16452 V!41827)) (EmptyCell!13053) )
))
(declare-datatypes ((array!71969 0))(
  ( (array!71970 (arr!34637 (Array (_ BitVec 32) ValueCell!13053)) (size!35173 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71969)

(declare-fun minValue!944 () V!41827)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!256 (array!71967 array!71969 (_ BitVec 32) (_ BitVec 32) V!41827 V!41827 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36366)

(assert (=> b!1107995 (= lt!495731 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!256 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107996 () Bool)

(declare-fun e!632120 () Bool)

(declare-fun tp_is_empty!27525 () Bool)

(assert (=> b!1107996 (= e!632120 tp_is_empty!27525)))

(declare-fun b!1107997 () Bool)

(declare-fun res!739441 () Bool)

(declare-fun e!632114 () Bool)

(assert (=> b!1107997 (=> (not res!739441) (not e!632114))))

(declare-fun lt!495730 () array!71967)

(declare-datatypes ((List!24146 0))(
  ( (Nil!24143) (Cons!24142 (h!25351 (_ BitVec 64)) (t!34457 List!24146)) )
))
(declare-fun arrayNoDuplicates!0 (array!71967 (_ BitVec 32) List!24146) Bool)

(assert (=> b!1107997 (= res!739441 (arrayNoDuplicates!0 lt!495730 #b00000000000000000000000000000000 Nil!24143))))

(declare-fun bm!46489 () Bool)

(declare-datatypes ((tuple2!17462 0))(
  ( (tuple2!17463 (_1!8742 (_ BitVec 64)) (_2!8742 V!41827)) )
))
(declare-datatypes ((List!24147 0))(
  ( (Nil!24144) (Cons!24143 (h!25352 tuple2!17462) (t!34458 List!24147)) )
))
(declare-datatypes ((ListLongMap!15431 0))(
  ( (ListLongMap!15432 (toList!7731 List!24147)) )
))
(declare-fun call!46491 () ListLongMap!15431)

(declare-fun getCurrentListMapNoExtraKeys!4227 (array!71967 array!71969 (_ BitVec 32) (_ BitVec 32) V!41827 V!41827 (_ BitVec 32) Int) ListLongMap!15431)

(declare-fun dynLambda!2359 (Int (_ BitVec 64)) V!41827)

(assert (=> bm!46489 (= call!46491 (getCurrentListMapNoExtraKeys!4227 lt!495730 (array!71970 (store (arr!34637 _values!996) i!673 (ValueCellFull!13053 (dynLambda!2359 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35173 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107998 () Bool)

(declare-fun res!739446 () Bool)

(declare-fun e!632121 () Bool)

(assert (=> b!1107998 (=> (not res!739446) (not e!632121))))

(assert (=> b!1107998 (= res!739446 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35172 _keys!1208))))))

(declare-fun b!1107999 () Bool)

(declare-fun e!632115 () Bool)

(assert (=> b!1107999 (= e!632115 tp_is_empty!27525)))

(declare-fun mapIsEmpty!43105 () Bool)

(declare-fun mapRes!43105 () Bool)

(assert (=> mapIsEmpty!43105 mapRes!43105))

(declare-fun b!1108000 () Bool)

(declare-fun res!739439 () Bool)

(assert (=> b!1108000 (=> (not res!739439) (not e!632121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108000 (= res!739439 (validKeyInArray!0 k0!934))))

(declare-fun b!1108001 () Bool)

(declare-fun call!46492 () ListLongMap!15431)

(assert (=> b!1108001 (= e!632117 (= call!46491 call!46492))))

(declare-fun b!1108002 () Bool)

(declare-fun res!739443 () Bool)

(assert (=> b!1108002 (=> (not res!739443) (not e!632121))))

(assert (=> b!1108002 (= res!739443 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24143))))

(declare-fun b!1108003 () Bool)

(declare-fun e!632118 () Bool)

(assert (=> b!1108003 (= e!632118 (and e!632120 mapRes!43105))))

(declare-fun condMapEmpty!43105 () Bool)

(declare-fun mapDefault!43105 () ValueCell!13053)

(assert (=> b!1108003 (= condMapEmpty!43105 (= (arr!34637 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13053)) mapDefault!43105)))))

(declare-fun b!1108004 () Bool)

(declare-fun res!739437 () Bool)

(assert (=> b!1108004 (=> (not res!739437) (not e!632121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71967 (_ BitVec 32)) Bool)

(assert (=> b!1108004 (= res!739437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108005 () Bool)

(declare-fun res!739447 () Bool)

(assert (=> b!1108005 (=> (not res!739447) (not e!632121))))

(assert (=> b!1108005 (= res!739447 (and (= (size!35173 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35172 _keys!1208) (size!35173 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108006 () Bool)

(declare-fun -!1011 (ListLongMap!15431 (_ BitVec 64)) ListLongMap!15431)

(assert (=> b!1108006 (= e!632117 (= call!46491 (-!1011 call!46492 k0!934)))))

(declare-fun b!1108007 () Bool)

(assert (=> b!1108007 (= e!632121 e!632114)))

(declare-fun res!739438 () Bool)

(assert (=> b!1108007 (=> (not res!739438) (not e!632114))))

(assert (=> b!1108007 (= res!739438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495730 mask!1564))))

(assert (=> b!1108007 (= lt!495730 (array!71968 (store (arr!34636 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35172 _keys!1208)))))

(declare-fun b!1108008 () Bool)

(declare-fun res!739445 () Bool)

(assert (=> b!1108008 (=> (not res!739445) (not e!632121))))

(assert (=> b!1108008 (= res!739445 (= (select (arr!34636 _keys!1208) i!673) k0!934))))

(declare-fun bm!46488 () Bool)

(assert (=> bm!46488 (= call!46492 (getCurrentListMapNoExtraKeys!4227 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!739442 () Bool)

(assert (=> start!97294 (=> (not res!739442) (not e!632121))))

(assert (=> start!97294 (= res!739442 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35172 _keys!1208))))))

(assert (=> start!97294 e!632121))

(assert (=> start!97294 tp_is_empty!27525))

(declare-fun array_inv!26656 (array!71967) Bool)

(assert (=> start!97294 (array_inv!26656 _keys!1208)))

(assert (=> start!97294 true))

(assert (=> start!97294 tp!82093))

(declare-fun array_inv!26657 (array!71969) Bool)

(assert (=> start!97294 (and (array_inv!26657 _values!996) e!632118)))

(declare-fun mapNonEmpty!43105 () Bool)

(declare-fun tp!82094 () Bool)

(assert (=> mapNonEmpty!43105 (= mapRes!43105 (and tp!82094 e!632115))))

(declare-fun mapValue!43105 () ValueCell!13053)

(declare-fun mapRest!43105 () (Array (_ BitVec 32) ValueCell!13053))

(declare-fun mapKey!43105 () (_ BitVec 32))

(assert (=> mapNonEmpty!43105 (= (arr!34637 _values!996) (store mapRest!43105 mapKey!43105 mapValue!43105))))

(declare-fun b!1108009 () Bool)

(declare-fun res!739440 () Bool)

(assert (=> b!1108009 (=> (not res!739440) (not e!632121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108009 (= res!739440 (validMask!0 mask!1564))))

(declare-fun b!1108010 () Bool)

(assert (=> b!1108010 (= e!632114 (not e!632119))))

(declare-fun res!739444 () Bool)

(assert (=> b!1108010 (=> res!739444 e!632119)))

(assert (=> b!1108010 (= res!739444 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35172 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108010 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495729 () Unit!36366)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71967 (_ BitVec 64) (_ BitVec 32)) Unit!36366)

(assert (=> b!1108010 (= lt!495729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97294 res!739442) b!1108009))

(assert (= (and b!1108009 res!739440) b!1108005))

(assert (= (and b!1108005 res!739447) b!1108004))

(assert (= (and b!1108004 res!739437) b!1108002))

(assert (= (and b!1108002 res!739443) b!1107998))

(assert (= (and b!1107998 res!739446) b!1108000))

(assert (= (and b!1108000 res!739439) b!1108008))

(assert (= (and b!1108008 res!739445) b!1108007))

(assert (= (and b!1108007 res!739438) b!1107997))

(assert (= (and b!1107997 res!739441) b!1108010))

(assert (= (and b!1108010 (not res!739444)) b!1107995))

(assert (= (and b!1107995 c!109077) b!1108006))

(assert (= (and b!1107995 (not c!109077)) b!1108001))

(assert (= (or b!1108006 b!1108001) bm!46489))

(assert (= (or b!1108006 b!1108001) bm!46488))

(assert (= (and b!1108003 condMapEmpty!43105) mapIsEmpty!43105))

(assert (= (and b!1108003 (not condMapEmpty!43105)) mapNonEmpty!43105))

(get-info :version)

(assert (= (and mapNonEmpty!43105 ((_ is ValueCellFull!13053) mapValue!43105)) b!1107999))

(assert (= (and b!1108003 ((_ is ValueCellFull!13053) mapDefault!43105)) b!1107996))

(assert (= start!97294 b!1108003))

(declare-fun b_lambda!18283 () Bool)

(assert (=> (not b_lambda!18283) (not bm!46489)))

(declare-fun t!34456 () Bool)

(declare-fun tb!8131 () Bool)

(assert (=> (and start!97294 (= defaultEntry!1004 defaultEntry!1004) t!34456) tb!8131))

(declare-fun result!16823 () Bool)

(assert (=> tb!8131 (= result!16823 tp_is_empty!27525)))

(assert (=> bm!46489 t!34456))

(declare-fun b_and!37363 () Bool)

(assert (= b_and!37361 (and (=> t!34456 result!16823) b_and!37363)))

(declare-fun m!1026637 () Bool)

(assert (=> b!1107997 m!1026637))

(declare-fun m!1026639 () Bool)

(assert (=> b!1108002 m!1026639))

(declare-fun m!1026641 () Bool)

(assert (=> b!1108007 m!1026641))

(declare-fun m!1026643 () Bool)

(assert (=> b!1108007 m!1026643))

(declare-fun m!1026645 () Bool)

(assert (=> b!1108004 m!1026645))

(declare-fun m!1026647 () Bool)

(assert (=> b!1108008 m!1026647))

(declare-fun m!1026649 () Bool)

(assert (=> b!1108010 m!1026649))

(declare-fun m!1026651 () Bool)

(assert (=> b!1108010 m!1026651))

(declare-fun m!1026653 () Bool)

(assert (=> b!1108006 m!1026653))

(declare-fun m!1026655 () Bool)

(assert (=> mapNonEmpty!43105 m!1026655))

(declare-fun m!1026657 () Bool)

(assert (=> bm!46488 m!1026657))

(declare-fun m!1026659 () Bool)

(assert (=> start!97294 m!1026659))

(declare-fun m!1026661 () Bool)

(assert (=> start!97294 m!1026661))

(declare-fun m!1026663 () Bool)

(assert (=> b!1107995 m!1026663))

(declare-fun m!1026665 () Bool)

(assert (=> b!1108009 m!1026665))

(declare-fun m!1026667 () Bool)

(assert (=> bm!46489 m!1026667))

(declare-fun m!1026669 () Bool)

(assert (=> bm!46489 m!1026669))

(declare-fun m!1026671 () Bool)

(assert (=> bm!46489 m!1026671))

(declare-fun m!1026673 () Bool)

(assert (=> b!1108000 m!1026673))

(check-sat (not mapNonEmpty!43105) (not b!1108004) (not bm!46488) (not b!1108009) (not b!1107995) (not b!1107997) tp_is_empty!27525 (not b_lambda!18283) (not bm!46489) (not b!1108006) (not b_next!23265) (not start!97294) (not b!1108002) b_and!37363 (not b!1108000) (not b!1108007) (not b!1108010))
(check-sat b_and!37363 (not b_next!23265))
