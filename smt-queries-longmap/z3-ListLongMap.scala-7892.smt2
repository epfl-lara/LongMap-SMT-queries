; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98332 () Bool)

(assert start!98332)

(declare-fun b_free!23797 () Bool)

(declare-fun b_next!23797 () Bool)

(assert (=> start!98332 (= b_free!23797 (not b_next!23797))))

(declare-fun tp!84094 () Bool)

(declare-fun b_and!38387 () Bool)

(assert (=> start!98332 (= tp!84094 b_and!38387)))

(declare-fun b!1128235 () Bool)

(declare-fun res!753578 () Bool)

(declare-fun e!642275 () Bool)

(assert (=> b!1128235 (=> (not res!753578) (not e!642275))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73561 0))(
  ( (array!73562 (arr!35427 (Array (_ BitVec 32) (_ BitVec 64))) (size!35964 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73561)

(assert (=> b!1128235 (= res!753578 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35964 _keys!1208))))))

(declare-fun b!1128236 () Bool)

(declare-fun e!642277 () Bool)

(declare-fun tp_is_empty!28327 () Bool)

(assert (=> b!1128236 (= e!642277 tp_is_empty!28327)))

(declare-fun b!1128238 () Bool)

(declare-fun e!642280 () Bool)

(declare-fun e!642274 () Bool)

(assert (=> b!1128238 (= e!642280 e!642274)))

(declare-fun res!753570 () Bool)

(assert (=> b!1128238 (=> res!753570 e!642274)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128238 (= res!753570 (not (= (select (arr!35427 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642273 () Bool)

(assert (=> b!1128238 e!642273))

(declare-fun c!110096 () Bool)

(assert (=> b!1128238 (= c!110096 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42897 0))(
  ( (V!42898 (val!14220 Int)) )
))
(declare-fun zeroValue!944 () V!42897)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13454 0))(
  ( (ValueCellFull!13454 (v!16849 V!42897)) (EmptyCell!13454) )
))
(declare-datatypes ((array!73563 0))(
  ( (array!73564 (arr!35428 (Array (_ BitVec 32) ValueCell!13454)) (size!35965 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73563)

(declare-fun minValue!944 () V!42897)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36913 0))(
  ( (Unit!36914) )
))
(declare-fun lt!500917 () Unit!36913)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!388 (array!73561 array!73563 (_ BitVec 32) (_ BitVec 32) V!42897 V!42897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36913)

(assert (=> b!1128238 (= lt!500917 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128239 () Bool)

(declare-fun e!642278 () Bool)

(assert (=> b!1128239 (= e!642275 e!642278)))

(declare-fun res!753577 () Bool)

(assert (=> b!1128239 (=> (not res!753577) (not e!642278))))

(declare-fun lt!500915 () array!73561)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73561 (_ BitVec 32)) Bool)

(assert (=> b!1128239 (= res!753577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500915 mask!1564))))

(assert (=> b!1128239 (= lt!500915 (array!73562 (store (arr!35427 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35964 _keys!1208)))))

(declare-fun b!1128240 () Bool)

(declare-fun res!753569 () Bool)

(assert (=> b!1128240 (=> (not res!753569) (not e!642275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128240 (= res!753569 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44308 () Bool)

(declare-fun mapRes!44308 () Bool)

(assert (=> mapIsEmpty!44308 mapRes!44308))

(declare-fun b!1128241 () Bool)

(declare-fun res!753567 () Bool)

(assert (=> b!1128241 (=> (not res!753567) (not e!642275))))

(assert (=> b!1128241 (= res!753567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128242 () Bool)

(declare-fun res!753579 () Bool)

(assert (=> b!1128242 (=> (not res!753579) (not e!642275))))

(declare-datatypes ((List!24682 0))(
  ( (Nil!24679) (Cons!24678 (h!25896 (_ BitVec 64)) (t!35463 List!24682)) )
))
(declare-fun arrayNoDuplicates!0 (array!73561 (_ BitVec 32) List!24682) Bool)

(assert (=> b!1128242 (= res!753579 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24679))))

(declare-fun b!1128243 () Bool)

(assert (=> b!1128243 (= e!642274 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35964 _keys!1208)))))))

(declare-fun b!1128244 () Bool)

(declare-fun res!753580 () Bool)

(assert (=> b!1128244 (=> (not res!753580) (not e!642275))))

(assert (=> b!1128244 (= res!753580 (= (select (arr!35427 _keys!1208) i!673) k0!934))))

(declare-fun b!1128245 () Bool)

(declare-fun res!753576 () Bool)

(assert (=> b!1128245 (=> res!753576 e!642274)))

(declare-datatypes ((tuple2!17898 0))(
  ( (tuple2!17899 (_1!8960 (_ BitVec 64)) (_2!8960 V!42897)) )
))
(declare-datatypes ((List!24683 0))(
  ( (Nil!24680) (Cons!24679 (h!25897 tuple2!17898) (t!35464 List!24683)) )
))
(declare-datatypes ((ListLongMap!15875 0))(
  ( (ListLongMap!15876 (toList!7953 List!24683)) )
))
(declare-fun contains!6496 (ListLongMap!15875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4474 (array!73561 array!73563 (_ BitVec 32) (_ BitVec 32) V!42897 V!42897 (_ BitVec 32) Int) ListLongMap!15875)

(assert (=> b!1128245 (= res!753576 (not (contains!6496 (getCurrentListMapNoExtraKeys!4474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(declare-fun bm!47737 () Bool)

(declare-fun call!47741 () ListLongMap!15875)

(declare-fun lt!500914 () array!73563)

(assert (=> bm!47737 (= call!47741 (getCurrentListMapNoExtraKeys!4474 lt!500915 lt!500914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47740 () ListLongMap!15875)

(declare-fun bm!47738 () Bool)

(assert (=> bm!47738 (= call!47740 (getCurrentListMapNoExtraKeys!4474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128237 () Bool)

(declare-fun -!1127 (ListLongMap!15875 (_ BitVec 64)) ListLongMap!15875)

(assert (=> b!1128237 (= e!642273 (= call!47741 (-!1127 call!47740 k0!934)))))

(declare-fun res!753574 () Bool)

(assert (=> start!98332 (=> (not res!753574) (not e!642275))))

(assert (=> start!98332 (= res!753574 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35964 _keys!1208))))))

(assert (=> start!98332 e!642275))

(assert (=> start!98332 tp_is_empty!28327))

(declare-fun array_inv!27238 (array!73561) Bool)

(assert (=> start!98332 (array_inv!27238 _keys!1208)))

(assert (=> start!98332 true))

(assert (=> start!98332 tp!84094))

(declare-fun e!642276 () Bool)

(declare-fun array_inv!27239 (array!73563) Bool)

(assert (=> start!98332 (and (array_inv!27239 _values!996) e!642276)))

(declare-fun mapNonEmpty!44308 () Bool)

(declare-fun tp!84095 () Bool)

(declare-fun e!642281 () Bool)

(assert (=> mapNonEmpty!44308 (= mapRes!44308 (and tp!84095 e!642281))))

(declare-fun mapRest!44308 () (Array (_ BitVec 32) ValueCell!13454))

(declare-fun mapKey!44308 () (_ BitVec 32))

(declare-fun mapValue!44308 () ValueCell!13454)

(assert (=> mapNonEmpty!44308 (= (arr!35428 _values!996) (store mapRest!44308 mapKey!44308 mapValue!44308))))

(declare-fun b!1128246 () Bool)

(declare-fun res!753568 () Bool)

(assert (=> b!1128246 (=> (not res!753568) (not e!642278))))

(assert (=> b!1128246 (= res!753568 (arrayNoDuplicates!0 lt!500915 #b00000000000000000000000000000000 Nil!24679))))

(declare-fun b!1128247 () Bool)

(declare-fun e!642279 () Bool)

(assert (=> b!1128247 (= e!642278 (not e!642279))))

(declare-fun res!753572 () Bool)

(assert (=> b!1128247 (=> res!753572 e!642279)))

(assert (=> b!1128247 (= res!753572 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128247 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500916 () Unit!36913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73561 (_ BitVec 64) (_ BitVec 32)) Unit!36913)

(assert (=> b!1128247 (= lt!500916 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128248 () Bool)

(declare-fun res!753571 () Bool)

(assert (=> b!1128248 (=> (not res!753571) (not e!642275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128248 (= res!753571 (validKeyInArray!0 k0!934))))

(declare-fun b!1128249 () Bool)

(assert (=> b!1128249 (= e!642279 e!642280)))

(declare-fun res!753575 () Bool)

(assert (=> b!1128249 (=> res!753575 e!642280)))

(assert (=> b!1128249 (= res!753575 (not (= from!1455 i!673)))))

(declare-fun lt!500912 () ListLongMap!15875)

(assert (=> b!1128249 (= lt!500912 (getCurrentListMapNoExtraKeys!4474 lt!500915 lt!500914 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2543 (Int (_ BitVec 64)) V!42897)

(assert (=> b!1128249 (= lt!500914 (array!73564 (store (arr!35428 _values!996) i!673 (ValueCellFull!13454 (dynLambda!2543 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35965 _values!996)))))

(declare-fun lt!500913 () ListLongMap!15875)

(assert (=> b!1128249 (= lt!500913 (getCurrentListMapNoExtraKeys!4474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128250 () Bool)

(assert (=> b!1128250 (= e!642273 (= call!47741 call!47740))))

(declare-fun b!1128251 () Bool)

(assert (=> b!1128251 (= e!642276 (and e!642277 mapRes!44308))))

(declare-fun condMapEmpty!44308 () Bool)

(declare-fun mapDefault!44308 () ValueCell!13454)

(assert (=> b!1128251 (= condMapEmpty!44308 (= (arr!35428 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13454)) mapDefault!44308)))))

(declare-fun b!1128252 () Bool)

(assert (=> b!1128252 (= e!642281 tp_is_empty!28327)))

(declare-fun b!1128253 () Bool)

(declare-fun res!753573 () Bool)

(assert (=> b!1128253 (=> (not res!753573) (not e!642275))))

(assert (=> b!1128253 (= res!753573 (and (= (size!35965 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35964 _keys!1208) (size!35965 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98332 res!753574) b!1128240))

(assert (= (and b!1128240 res!753569) b!1128253))

(assert (= (and b!1128253 res!753573) b!1128241))

(assert (= (and b!1128241 res!753567) b!1128242))

(assert (= (and b!1128242 res!753579) b!1128235))

(assert (= (and b!1128235 res!753578) b!1128248))

(assert (= (and b!1128248 res!753571) b!1128244))

(assert (= (and b!1128244 res!753580) b!1128239))

(assert (= (and b!1128239 res!753577) b!1128246))

(assert (= (and b!1128246 res!753568) b!1128247))

(assert (= (and b!1128247 (not res!753572)) b!1128249))

(assert (= (and b!1128249 (not res!753575)) b!1128238))

(assert (= (and b!1128238 c!110096) b!1128237))

(assert (= (and b!1128238 (not c!110096)) b!1128250))

(assert (= (or b!1128237 b!1128250) bm!47737))

(assert (= (or b!1128237 b!1128250) bm!47738))

(assert (= (and b!1128238 (not res!753570)) b!1128245))

(assert (= (and b!1128245 (not res!753576)) b!1128243))

(assert (= (and b!1128251 condMapEmpty!44308) mapIsEmpty!44308))

(assert (= (and b!1128251 (not condMapEmpty!44308)) mapNonEmpty!44308))

(get-info :version)

(assert (= (and mapNonEmpty!44308 ((_ is ValueCellFull!13454) mapValue!44308)) b!1128252))

(assert (= (and b!1128251 ((_ is ValueCellFull!13454) mapDefault!44308)) b!1128236))

(assert (= start!98332 b!1128251))

(declare-fun b_lambda!18777 () Bool)

(assert (=> (not b_lambda!18777) (not b!1128249)))

(declare-fun t!35462 () Bool)

(declare-fun tb!8601 () Bool)

(assert (=> (and start!98332 (= defaultEntry!1004 defaultEntry!1004) t!35462) tb!8601))

(declare-fun result!17771 () Bool)

(assert (=> tb!8601 (= result!17771 tp_is_empty!28327)))

(assert (=> b!1128249 t!35462))

(declare-fun b_and!38389 () Bool)

(assert (= b_and!38387 (and (=> t!35462 result!17771) b_and!38389)))

(declare-fun m!1042461 () Bool)

(assert (=> b!1128248 m!1042461))

(declare-fun m!1042463 () Bool)

(assert (=> b!1128245 m!1042463))

(assert (=> b!1128245 m!1042463))

(declare-fun m!1042465 () Bool)

(assert (=> b!1128245 m!1042465))

(declare-fun m!1042467 () Bool)

(assert (=> b!1128238 m!1042467))

(declare-fun m!1042469 () Bool)

(assert (=> b!1128238 m!1042469))

(declare-fun m!1042471 () Bool)

(assert (=> b!1128239 m!1042471))

(declare-fun m!1042473 () Bool)

(assert (=> b!1128239 m!1042473))

(declare-fun m!1042475 () Bool)

(assert (=> b!1128244 m!1042475))

(declare-fun m!1042477 () Bool)

(assert (=> b!1128247 m!1042477))

(declare-fun m!1042479 () Bool)

(assert (=> b!1128247 m!1042479))

(declare-fun m!1042481 () Bool)

(assert (=> b!1128241 m!1042481))

(declare-fun m!1042483 () Bool)

(assert (=> b!1128237 m!1042483))

(declare-fun m!1042485 () Bool)

(assert (=> b!1128240 m!1042485))

(declare-fun m!1042487 () Bool)

(assert (=> b!1128242 m!1042487))

(declare-fun m!1042489 () Bool)

(assert (=> bm!47737 m!1042489))

(assert (=> bm!47738 m!1042463))

(declare-fun m!1042491 () Bool)

(assert (=> b!1128249 m!1042491))

(declare-fun m!1042493 () Bool)

(assert (=> b!1128249 m!1042493))

(declare-fun m!1042495 () Bool)

(assert (=> b!1128249 m!1042495))

(declare-fun m!1042497 () Bool)

(assert (=> b!1128249 m!1042497))

(declare-fun m!1042499 () Bool)

(assert (=> mapNonEmpty!44308 m!1042499))

(declare-fun m!1042501 () Bool)

(assert (=> start!98332 m!1042501))

(declare-fun m!1042503 () Bool)

(assert (=> start!98332 m!1042503))

(declare-fun m!1042505 () Bool)

(assert (=> b!1128246 m!1042505))

(check-sat (not b!1128249) (not b_lambda!18777) (not b!1128239) (not bm!47737) (not b!1128237) tp_is_empty!28327 (not b!1128245) (not b!1128241) (not b_next!23797) (not b!1128247) b_and!38389 (not b!1128248) (not b!1128242) (not mapNonEmpty!44308) (not b!1128238) (not b!1128246) (not b!1128240) (not start!98332) (not bm!47738))
(check-sat b_and!38389 (not b_next!23797))
