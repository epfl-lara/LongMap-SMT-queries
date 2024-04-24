; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98404 () Bool)

(assert start!98404)

(declare-fun b_free!23869 () Bool)

(declare-fun b_next!23869 () Bool)

(assert (=> start!98404 (= b_free!23869 (not b_next!23869))))

(declare-fun tp!84310 () Bool)

(declare-fun b_and!38531 () Bool)

(assert (=> start!98404 (= tp!84310 b_and!38531)))

(declare-fun b!1130283 () Bool)

(declare-datatypes ((Unit!36967 0))(
  ( (Unit!36968) )
))
(declare-fun e!643365 () Unit!36967)

(declare-fun lt!501674 () Unit!36967)

(assert (=> b!1130283 (= e!643365 lt!501674)))

(declare-datatypes ((V!42993 0))(
  ( (V!42994 (val!14256 Int)) )
))
(declare-fun zeroValue!944 () V!42993)

(declare-fun lt!501668 () Unit!36967)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!17964 0))(
  ( (tuple2!17965 (_1!8993 (_ BitVec 64)) (_2!8993 V!42993)) )
))
(declare-datatypes ((List!24742 0))(
  ( (Nil!24739) (Cons!24738 (h!25956 tuple2!17964) (t!35595 List!24742)) )
))
(declare-datatypes ((ListLongMap!15941 0))(
  ( (ListLongMap!15942 (toList!7986 List!24742)) )
))
(declare-fun lt!501682 () ListLongMap!15941)

(declare-fun addStillContains!682 (ListLongMap!15941 (_ BitVec 64) V!42993 (_ BitVec 64)) Unit!36967)

(assert (=> b!1130283 (= lt!501668 (addStillContains!682 lt!501682 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!501673 () ListLongMap!15941)

(declare-fun call!47969 () ListLongMap!15941)

(assert (=> b!1130283 (= lt!501673 call!47969)))

(declare-fun call!47972 () Bool)

(assert (=> b!1130283 call!47972))

(declare-fun call!47974 () Unit!36967)

(assert (=> b!1130283 (= lt!501674 call!47974)))

(declare-fun minValue!944 () V!42993)

(declare-fun contains!6522 (ListLongMap!15941 (_ BitVec 64)) Bool)

(declare-fun +!3456 (ListLongMap!15941 tuple2!17964) ListLongMap!15941)

(assert (=> b!1130283 (contains!6522 (+!3456 lt!501673 (tuple2!17965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1130284 () Bool)

(declare-fun e!643364 () Bool)

(declare-fun call!47971 () ListLongMap!15941)

(declare-fun call!47968 () ListLongMap!15941)

(assert (=> b!1130284 (= e!643364 (= call!47971 call!47968))))

(declare-fun b!1130285 () Bool)

(declare-fun e!643376 () Unit!36967)

(declare-fun lt!501680 () Unit!36967)

(assert (=> b!1130285 (= e!643376 lt!501680)))

(declare-fun call!47975 () Unit!36967)

(assert (=> b!1130285 (= lt!501680 call!47975)))

(declare-fun call!47973 () Bool)

(assert (=> b!1130285 call!47973))

(declare-fun bm!47965 () Bool)

(declare-fun call!47970 () ListLongMap!15941)

(assert (=> bm!47965 (= call!47970 call!47969)))

(declare-fun b!1130286 () Bool)

(declare-fun e!643375 () Bool)

(declare-fun e!643374 () Bool)

(assert (=> b!1130286 (= e!643375 e!643374)))

(declare-fun res!755000 () Bool)

(assert (=> b!1130286 (=> res!755000 e!643374)))

(assert (=> b!1130286 (= res!755000 (not (contains!6522 lt!501682 k0!934)))))

(declare-datatypes ((array!73701 0))(
  ( (array!73702 (arr!35497 (Array (_ BitVec 32) (_ BitVec 64))) (size!36034 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73701)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13490 0))(
  ( (ValueCellFull!13490 (v!16885 V!42993)) (EmptyCell!13490) )
))
(declare-datatypes ((array!73703 0))(
  ( (array!73704 (arr!35498 (Array (_ BitVec 32) ValueCell!13490)) (size!36035 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73703)

(declare-fun getCurrentListMapNoExtraKeys!4506 (array!73701 array!73703 (_ BitVec 32) (_ BitVec 32) V!42993 V!42993 (_ BitVec 32) Int) ListLongMap!15941)

(assert (=> b!1130286 (= lt!501682 (getCurrentListMapNoExtraKeys!4506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130287 () Bool)

(declare-fun e!643367 () Unit!36967)

(assert (=> b!1130287 (= e!643365 e!643367)))

(declare-fun c!110211 () Bool)

(declare-fun lt!501669 () Bool)

(assert (=> b!1130287 (= c!110211 (and (not lt!501669) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130288 () Bool)

(declare-fun res!754993 () Bool)

(declare-fun e!643366 () Bool)

(assert (=> b!1130288 (=> (not res!754993) (not e!643366))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130288 (= res!754993 (= (select (arr!35497 _keys!1208) i!673) k0!934))))

(declare-fun b!1130289 () Bool)

(declare-fun e!643370 () Bool)

(assert (=> b!1130289 (= e!643374 e!643370)))

(declare-fun res!755004 () Bool)

(assert (=> b!1130289 (=> res!755004 e!643370)))

(assert (=> b!1130289 (= res!755004 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36034 _keys!1208))))))

(declare-fun lt!501679 () Unit!36967)

(assert (=> b!1130289 (= lt!501679 e!643365)))

(declare-fun c!110213 () Bool)

(assert (=> b!1130289 (= c!110213 (and (not lt!501669) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130289 (= lt!501669 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130290 () Bool)

(assert (=> b!1130290 (= e!643370 true)))

(declare-fun lt!501681 () Bool)

(declare-fun getCurrentListMap!4420 (array!73701 array!73703 (_ BitVec 32) (_ BitVec 32) V!42993 V!42993 (_ BitVec 32) Int) ListLongMap!15941)

(assert (=> b!1130290 (= lt!501681 (contains!6522 (getCurrentListMap!4420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!47966 () Bool)

(assert (=> bm!47966 (= call!47975 call!47974)))

(declare-fun res!754994 () Bool)

(assert (=> start!98404 (=> (not res!754994) (not e!643366))))

(assert (=> start!98404 (= res!754994 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36034 _keys!1208))))))

(assert (=> start!98404 e!643366))

(declare-fun tp_is_empty!28399 () Bool)

(assert (=> start!98404 tp_is_empty!28399))

(declare-fun array_inv!27292 (array!73701) Bool)

(assert (=> start!98404 (array_inv!27292 _keys!1208)))

(assert (=> start!98404 true))

(assert (=> start!98404 tp!84310))

(declare-fun e!643363 () Bool)

(declare-fun array_inv!27293 (array!73703) Bool)

(assert (=> start!98404 (and (array_inv!27293 _values!996) e!643363)))

(declare-fun b!1130291 () Bool)

(declare-fun res!754999 () Bool)

(assert (=> b!1130291 (=> (not res!754999) (not e!643366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73701 (_ BitVec 32)) Bool)

(assert (=> b!1130291 (= res!754999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130292 () Bool)

(declare-fun res!755001 () Bool)

(assert (=> b!1130292 (=> (not res!755001) (not e!643366))))

(assert (=> b!1130292 (= res!755001 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36034 _keys!1208))))))

(declare-fun b!1130293 () Bool)

(declare-fun res!755005 () Bool)

(declare-fun e!643371 () Bool)

(assert (=> b!1130293 (=> (not res!755005) (not e!643371))))

(declare-fun lt!501670 () array!73701)

(declare-datatypes ((List!24743 0))(
  ( (Nil!24740) (Cons!24739 (h!25957 (_ BitVec 64)) (t!35596 List!24743)) )
))
(declare-fun arrayNoDuplicates!0 (array!73701 (_ BitVec 32) List!24743) Bool)

(assert (=> b!1130293 (= res!755005 (arrayNoDuplicates!0 lt!501670 #b00000000000000000000000000000000 Nil!24740))))

(declare-fun b!1130294 () Bool)

(declare-fun res!755003 () Bool)

(assert (=> b!1130294 (=> (not res!755003) (not e!643366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130294 (= res!755003 (validKeyInArray!0 k0!934))))

(declare-fun b!1130295 () Bool)

(declare-fun Unit!36969 () Unit!36967)

(assert (=> b!1130295 (= e!643376 Unit!36969)))

(declare-fun b!1130296 () Bool)

(assert (=> b!1130296 call!47973))

(declare-fun lt!501675 () Unit!36967)

(assert (=> b!1130296 (= lt!501675 call!47975)))

(assert (=> b!1130296 (= e!643367 lt!501675)))

(declare-fun b!1130297 () Bool)

(declare-fun e!643373 () Bool)

(declare-fun mapRes!44416 () Bool)

(assert (=> b!1130297 (= e!643363 (and e!643373 mapRes!44416))))

(declare-fun condMapEmpty!44416 () Bool)

(declare-fun mapDefault!44416 () ValueCell!13490)

(assert (=> b!1130297 (= condMapEmpty!44416 (= (arr!35498 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13490)) mapDefault!44416)))))

(declare-fun bm!47967 () Bool)

(assert (=> bm!47967 (= call!47973 call!47972)))

(declare-fun b!1130298 () Bool)

(declare-fun -!1152 (ListLongMap!15941 (_ BitVec 64)) ListLongMap!15941)

(assert (=> b!1130298 (= e!643364 (= call!47971 (-!1152 call!47968 k0!934)))))

(declare-fun b!1130299 () Bool)

(declare-fun e!643368 () Bool)

(assert (=> b!1130299 (= e!643368 e!643375)))

(declare-fun res!754997 () Bool)

(assert (=> b!1130299 (=> res!754997 e!643375)))

(assert (=> b!1130299 (= res!754997 (not (= (select (arr!35497 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130299 e!643364))

(declare-fun c!110210 () Bool)

(assert (=> b!1130299 (= c!110210 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501671 () Unit!36967)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!412 (array!73701 array!73703 (_ BitVec 32) (_ BitVec 32) V!42993 V!42993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36967)

(assert (=> b!1130299 (= lt!501671 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47968 () Bool)

(assert (=> bm!47968 (= call!47969 (+!3456 lt!501682 (ite (or c!110213 c!110211) (tuple2!17965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17965 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1130300 () Bool)

(declare-fun e!643372 () Bool)

(assert (=> b!1130300 (= e!643371 (not e!643372))))

(declare-fun res!754995 () Bool)

(assert (=> b!1130300 (=> res!754995 e!643372)))

(assert (=> b!1130300 (= res!754995 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130300 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501676 () Unit!36967)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73701 (_ BitVec 64) (_ BitVec 32)) Unit!36967)

(assert (=> b!1130300 (= lt!501676 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!47969 () Bool)

(assert (=> bm!47969 (= call!47968 (getCurrentListMapNoExtraKeys!4506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130301 () Bool)

(assert (=> b!1130301 (= e!643373 tp_is_empty!28399)))

(declare-fun bm!47970 () Bool)

(assert (=> bm!47970 (= call!47974 (addStillContains!682 (ite c!110213 lt!501673 lt!501682) (ite c!110213 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110211 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110213 minValue!944 (ite c!110211 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!44416 () Bool)

(declare-fun tp!84311 () Bool)

(declare-fun e!643369 () Bool)

(assert (=> mapNonEmpty!44416 (= mapRes!44416 (and tp!84311 e!643369))))

(declare-fun mapValue!44416 () ValueCell!13490)

(declare-fun mapRest!44416 () (Array (_ BitVec 32) ValueCell!13490))

(declare-fun mapKey!44416 () (_ BitVec 32))

(assert (=> mapNonEmpty!44416 (= (arr!35498 _values!996) (store mapRest!44416 mapKey!44416 mapValue!44416))))

(declare-fun mapIsEmpty!44416 () Bool)

(assert (=> mapIsEmpty!44416 mapRes!44416))

(declare-fun b!1130302 () Bool)

(assert (=> b!1130302 (= e!643369 tp_is_empty!28399)))

(declare-fun b!1130303 () Bool)

(declare-fun res!754996 () Bool)

(assert (=> b!1130303 (=> (not res!754996) (not e!643366))))

(assert (=> b!1130303 (= res!754996 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24740))))

(declare-fun bm!47971 () Bool)

(assert (=> bm!47971 (= call!47972 (contains!6522 (ite c!110213 lt!501673 call!47970) k0!934))))

(declare-fun b!1130304 () Bool)

(declare-fun res!755002 () Bool)

(assert (=> b!1130304 (=> (not res!755002) (not e!643366))))

(assert (=> b!1130304 (= res!755002 (and (= (size!36035 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36034 _keys!1208) (size!36035 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130305 () Bool)

(declare-fun c!110212 () Bool)

(assert (=> b!1130305 (= c!110212 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501669))))

(assert (=> b!1130305 (= e!643367 e!643376)))

(declare-fun b!1130306 () Bool)

(assert (=> b!1130306 (= e!643366 e!643371)))

(declare-fun res!754992 () Bool)

(assert (=> b!1130306 (=> (not res!754992) (not e!643371))))

(assert (=> b!1130306 (= res!754992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501670 mask!1564))))

(assert (=> b!1130306 (= lt!501670 (array!73702 (store (arr!35497 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36034 _keys!1208)))))

(declare-fun lt!501678 () array!73703)

(declare-fun bm!47972 () Bool)

(assert (=> bm!47972 (= call!47971 (getCurrentListMapNoExtraKeys!4506 lt!501670 lt!501678 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130307 () Bool)

(assert (=> b!1130307 (= e!643372 e!643368)))

(declare-fun res!754991 () Bool)

(assert (=> b!1130307 (=> res!754991 e!643368)))

(assert (=> b!1130307 (= res!754991 (not (= from!1455 i!673)))))

(declare-fun lt!501677 () ListLongMap!15941)

(assert (=> b!1130307 (= lt!501677 (getCurrentListMapNoExtraKeys!4506 lt!501670 lt!501678 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2570 (Int (_ BitVec 64)) V!42993)

(assert (=> b!1130307 (= lt!501678 (array!73704 (store (arr!35498 _values!996) i!673 (ValueCellFull!13490 (dynLambda!2570 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36035 _values!996)))))

(declare-fun lt!501672 () ListLongMap!15941)

(assert (=> b!1130307 (= lt!501672 (getCurrentListMapNoExtraKeys!4506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130308 () Bool)

(declare-fun res!754998 () Bool)

(assert (=> b!1130308 (=> (not res!754998) (not e!643366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130308 (= res!754998 (validMask!0 mask!1564))))

(assert (= (and start!98404 res!754994) b!1130308))

(assert (= (and b!1130308 res!754998) b!1130304))

(assert (= (and b!1130304 res!755002) b!1130291))

(assert (= (and b!1130291 res!754999) b!1130303))

(assert (= (and b!1130303 res!754996) b!1130292))

(assert (= (and b!1130292 res!755001) b!1130294))

(assert (= (and b!1130294 res!755003) b!1130288))

(assert (= (and b!1130288 res!754993) b!1130306))

(assert (= (and b!1130306 res!754992) b!1130293))

(assert (= (and b!1130293 res!755005) b!1130300))

(assert (= (and b!1130300 (not res!754995)) b!1130307))

(assert (= (and b!1130307 (not res!754991)) b!1130299))

(assert (= (and b!1130299 c!110210) b!1130298))

(assert (= (and b!1130299 (not c!110210)) b!1130284))

(assert (= (or b!1130298 b!1130284) bm!47972))

(assert (= (or b!1130298 b!1130284) bm!47969))

(assert (= (and b!1130299 (not res!754997)) b!1130286))

(assert (= (and b!1130286 (not res!755000)) b!1130289))

(assert (= (and b!1130289 c!110213) b!1130283))

(assert (= (and b!1130289 (not c!110213)) b!1130287))

(assert (= (and b!1130287 c!110211) b!1130296))

(assert (= (and b!1130287 (not c!110211)) b!1130305))

(assert (= (and b!1130305 c!110212) b!1130285))

(assert (= (and b!1130305 (not c!110212)) b!1130295))

(assert (= (or b!1130296 b!1130285) bm!47966))

(assert (= (or b!1130296 b!1130285) bm!47965))

(assert (= (or b!1130296 b!1130285) bm!47967))

(assert (= (or b!1130283 bm!47967) bm!47971))

(assert (= (or b!1130283 bm!47966) bm!47970))

(assert (= (or b!1130283 bm!47965) bm!47968))

(assert (= (and b!1130289 (not res!755004)) b!1130290))

(assert (= (and b!1130297 condMapEmpty!44416) mapIsEmpty!44416))

(assert (= (and b!1130297 (not condMapEmpty!44416)) mapNonEmpty!44416))

(get-info :version)

(assert (= (and mapNonEmpty!44416 ((_ is ValueCellFull!13490) mapValue!44416)) b!1130302))

(assert (= (and b!1130297 ((_ is ValueCellFull!13490) mapDefault!44416)) b!1130301))

(assert (= start!98404 b!1130297))

(declare-fun b_lambda!18849 () Bool)

(assert (=> (not b_lambda!18849) (not b!1130307)))

(declare-fun t!35594 () Bool)

(declare-fun tb!8673 () Bool)

(assert (=> (and start!98404 (= defaultEntry!1004 defaultEntry!1004) t!35594) tb!8673))

(declare-fun result!17915 () Bool)

(assert (=> tb!8673 (= result!17915 tp_is_empty!28399)))

(assert (=> b!1130307 t!35594))

(declare-fun b_and!38533 () Bool)

(assert (= b_and!38531 (and (=> t!35594 result!17915) b_and!38533)))

(declare-fun m!1044121 () Bool)

(assert (=> bm!47969 m!1044121))

(declare-fun m!1044123 () Bool)

(assert (=> b!1130294 m!1044123))

(declare-fun m!1044125 () Bool)

(assert (=> b!1130290 m!1044125))

(assert (=> b!1130290 m!1044125))

(declare-fun m!1044127 () Bool)

(assert (=> b!1130290 m!1044127))

(declare-fun m!1044129 () Bool)

(assert (=> b!1130300 m!1044129))

(declare-fun m!1044131 () Bool)

(assert (=> b!1130300 m!1044131))

(declare-fun m!1044133 () Bool)

(assert (=> bm!47971 m!1044133))

(declare-fun m!1044135 () Bool)

(assert (=> bm!47968 m!1044135))

(declare-fun m!1044137 () Bool)

(assert (=> b!1130306 m!1044137))

(declare-fun m!1044139 () Bool)

(assert (=> b!1130306 m!1044139))

(declare-fun m!1044141 () Bool)

(assert (=> b!1130291 m!1044141))

(declare-fun m!1044143 () Bool)

(assert (=> b!1130286 m!1044143))

(assert (=> b!1130286 m!1044121))

(declare-fun m!1044145 () Bool)

(assert (=> b!1130307 m!1044145))

(declare-fun m!1044147 () Bool)

(assert (=> b!1130307 m!1044147))

(declare-fun m!1044149 () Bool)

(assert (=> b!1130307 m!1044149))

(declare-fun m!1044151 () Bool)

(assert (=> b!1130307 m!1044151))

(declare-fun m!1044153 () Bool)

(assert (=> mapNonEmpty!44416 m!1044153))

(declare-fun m!1044155 () Bool)

(assert (=> b!1130283 m!1044155))

(declare-fun m!1044157 () Bool)

(assert (=> b!1130283 m!1044157))

(assert (=> b!1130283 m!1044157))

(declare-fun m!1044159 () Bool)

(assert (=> b!1130283 m!1044159))

(declare-fun m!1044161 () Bool)

(assert (=> b!1130293 m!1044161))

(declare-fun m!1044163 () Bool)

(assert (=> b!1130303 m!1044163))

(declare-fun m!1044165 () Bool)

(assert (=> b!1130288 m!1044165))

(declare-fun m!1044167 () Bool)

(assert (=> b!1130299 m!1044167))

(declare-fun m!1044169 () Bool)

(assert (=> b!1130299 m!1044169))

(declare-fun m!1044171 () Bool)

(assert (=> b!1130298 m!1044171))

(declare-fun m!1044173 () Bool)

(assert (=> bm!47970 m!1044173))

(declare-fun m!1044175 () Bool)

(assert (=> start!98404 m!1044175))

(declare-fun m!1044177 () Bool)

(assert (=> start!98404 m!1044177))

(declare-fun m!1044179 () Bool)

(assert (=> bm!47972 m!1044179))

(declare-fun m!1044181 () Bool)

(assert (=> b!1130308 m!1044181))

(check-sat (not mapNonEmpty!44416) (not b!1130306) (not b!1130290) (not bm!47971) (not bm!47968) (not bm!47970) (not b!1130299) (not b!1130283) (not start!98404) (not b!1130307) (not b_lambda!18849) (not b!1130300) (not b!1130291) (not b!1130293) (not b_next!23869) (not b!1130286) b_and!38533 (not b!1130308) (not bm!47972) (not bm!47969) (not b!1130298) tp_is_empty!28399 (not b!1130303) (not b!1130294))
(check-sat b_and!38533 (not b_next!23869))
