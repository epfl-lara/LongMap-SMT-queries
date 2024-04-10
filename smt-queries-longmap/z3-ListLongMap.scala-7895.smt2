; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98116 () Bool)

(assert start!98116)

(declare-fun b_free!23817 () Bool)

(declare-fun b_next!23817 () Bool)

(assert (=> start!98116 (= b_free!23817 (not b_next!23817))))

(declare-fun tp!84154 () Bool)

(declare-fun b_and!38417 () Bool)

(assert (=> start!98116 (= tp!84154 b_and!38417)))

(declare-fun b!1127475 () Bool)

(declare-fun e!641725 () Bool)

(declare-fun e!641723 () Bool)

(assert (=> b!1127475 (= e!641725 (not e!641723))))

(declare-fun res!753445 () Bool)

(assert (=> b!1127475 (=> res!753445 e!641723)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127475 (= res!753445 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73555 0))(
  ( (array!73556 (arr!35430 (Array (_ BitVec 32) (_ BitVec 64))) (size!35966 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73555)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127475 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36944 0))(
  ( (Unit!36945) )
))
(declare-fun lt!500601 () Unit!36944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73555 (_ BitVec 64) (_ BitVec 32)) Unit!36944)

(assert (=> b!1127475 (= lt!500601 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127476 () Bool)

(declare-fun e!641727 () Bool)

(assert (=> b!1127476 (= e!641727 e!641725)))

(declare-fun res!753442 () Bool)

(assert (=> b!1127476 (=> (not res!753442) (not e!641725))))

(declare-fun lt!500602 () array!73555)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73555 (_ BitVec 32)) Bool)

(assert (=> b!1127476 (= res!753442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500602 mask!1564))))

(assert (=> b!1127476 (= lt!500602 (array!73556 (store (arr!35430 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35966 _keys!1208)))))

(declare-fun b!1127477 () Bool)

(declare-fun res!753443 () Bool)

(assert (=> b!1127477 (=> (not res!753443) (not e!641727))))

(assert (=> b!1127477 (= res!753443 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35966 _keys!1208))))))

(declare-fun b!1127478 () Bool)

(declare-fun res!753453 () Bool)

(assert (=> b!1127478 (=> (not res!753453) (not e!641725))))

(declare-datatypes ((List!24671 0))(
  ( (Nil!24668) (Cons!24667 (h!25876 (_ BitVec 64)) (t!35480 List!24671)) )
))
(declare-fun arrayNoDuplicates!0 (array!73555 (_ BitVec 32) List!24671) Bool)

(assert (=> b!1127478 (= res!753453 (arrayNoDuplicates!0 lt!500602 #b00000000000000000000000000000000 Nil!24668))))

(declare-fun b!1127479 () Bool)

(declare-fun res!753454 () Bool)

(assert (=> b!1127479 (=> (not res!753454) (not e!641727))))

(assert (=> b!1127479 (= res!753454 (= (select (arr!35430 _keys!1208) i!673) k0!934))))

(declare-fun b!1127480 () Bool)

(declare-fun e!641720 () Bool)

(declare-fun e!641719 () Bool)

(declare-fun mapRes!44338 () Bool)

(assert (=> b!1127480 (= e!641720 (and e!641719 mapRes!44338))))

(declare-fun condMapEmpty!44338 () Bool)

(declare-datatypes ((V!42923 0))(
  ( (V!42924 (val!14230 Int)) )
))
(declare-datatypes ((ValueCell!13464 0))(
  ( (ValueCellFull!13464 (v!16863 V!42923)) (EmptyCell!13464) )
))
(declare-datatypes ((array!73557 0))(
  ( (array!73558 (arr!35431 (Array (_ BitVec 32) ValueCell!13464)) (size!35967 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73557)

(declare-fun mapDefault!44338 () ValueCell!13464)

(assert (=> b!1127480 (= condMapEmpty!44338 (= (arr!35431 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13464)) mapDefault!44338)))))

(declare-fun b!1127481 () Bool)

(declare-fun e!641722 () Bool)

(assert (=> b!1127481 (= e!641723 e!641722)))

(declare-fun res!753452 () Bool)

(assert (=> b!1127481 (=> res!753452 e!641722)))

(assert (=> b!1127481 (= res!753452 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17900 0))(
  ( (tuple2!17901 (_1!8961 (_ BitVec 64)) (_2!8961 V!42923)) )
))
(declare-datatypes ((List!24672 0))(
  ( (Nil!24669) (Cons!24668 (h!25877 tuple2!17900) (t!35481 List!24672)) )
))
(declare-datatypes ((ListLongMap!15869 0))(
  ( (ListLongMap!15870 (toList!7950 List!24672)) )
))
(declare-fun lt!500605 () ListLongMap!15869)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42923)

(declare-fun zeroValue!944 () V!42923)

(declare-fun lt!500600 () array!73557)

(declare-fun getCurrentListMapNoExtraKeys!4438 (array!73555 array!73557 (_ BitVec 32) (_ BitVec 32) V!42923 V!42923 (_ BitVec 32) Int) ListLongMap!15869)

(assert (=> b!1127481 (= lt!500605 (getCurrentListMapNoExtraKeys!4438 lt!500602 lt!500600 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2524 (Int (_ BitVec 64)) V!42923)

(assert (=> b!1127481 (= lt!500600 (array!73558 (store (arr!35431 _values!996) i!673 (ValueCellFull!13464 (dynLambda!2524 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35967 _values!996)))))

(declare-fun lt!500604 () ListLongMap!15869)

(assert (=> b!1127481 (= lt!500604 (getCurrentListMapNoExtraKeys!4438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127482 () Bool)

(declare-fun e!641718 () Bool)

(declare-fun call!47733 () ListLongMap!15869)

(declare-fun call!47734 () ListLongMap!15869)

(assert (=> b!1127482 (= e!641718 (= call!47733 call!47734))))

(declare-fun bm!47730 () Bool)

(assert (=> bm!47730 (= call!47733 (getCurrentListMapNoExtraKeys!4438 lt!500602 lt!500600 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!753449 () Bool)

(assert (=> start!98116 (=> (not res!753449) (not e!641727))))

(assert (=> start!98116 (= res!753449 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35966 _keys!1208))))))

(assert (=> start!98116 e!641727))

(declare-fun tp_is_empty!28347 () Bool)

(assert (=> start!98116 tp_is_empty!28347))

(declare-fun array_inv!27188 (array!73555) Bool)

(assert (=> start!98116 (array_inv!27188 _keys!1208)))

(assert (=> start!98116 true))

(assert (=> start!98116 tp!84154))

(declare-fun array_inv!27189 (array!73557) Bool)

(assert (=> start!98116 (and (array_inv!27189 _values!996) e!641720)))

(declare-fun b!1127483 () Bool)

(declare-fun res!753448 () Bool)

(assert (=> b!1127483 (=> (not res!753448) (not e!641727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127483 (= res!753448 (validKeyInArray!0 k0!934))))

(declare-fun b!1127484 () Bool)

(declare-fun res!753450 () Bool)

(assert (=> b!1127484 (=> (not res!753450) (not e!641727))))

(assert (=> b!1127484 (= res!753450 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24668))))

(declare-fun b!1127485 () Bool)

(declare-fun e!641726 () Bool)

(assert (=> b!1127485 (= e!641726 true)))

(declare-fun lt!500606 () Bool)

(declare-fun contains!6480 (ListLongMap!15869 (_ BitVec 64)) Bool)

(assert (=> b!1127485 (= lt!500606 (contains!6480 (getCurrentListMapNoExtraKeys!4438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127486 () Bool)

(declare-fun res!753444 () Bool)

(assert (=> b!1127486 (=> (not res!753444) (not e!641727))))

(assert (=> b!1127486 (= res!753444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127487 () Bool)

(declare-fun res!753446 () Bool)

(assert (=> b!1127487 (=> (not res!753446) (not e!641727))))

(assert (=> b!1127487 (= res!753446 (and (= (size!35967 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35966 _keys!1208) (size!35967 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127488 () Bool)

(assert (=> b!1127488 (= e!641722 e!641726)))

(declare-fun res!753447 () Bool)

(assert (=> b!1127488 (=> res!753447 e!641726)))

(assert (=> b!1127488 (= res!753447 (not (= (select (arr!35430 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127488 e!641718))

(declare-fun c!109716 () Bool)

(assert (=> b!1127488 (= c!109716 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500603 () Unit!36944)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!392 (array!73555 array!73557 (_ BitVec 32) (_ BitVec 32) V!42923 V!42923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36944)

(assert (=> b!1127488 (= lt!500603 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!392 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127489 () Bool)

(declare-fun e!641721 () Bool)

(assert (=> b!1127489 (= e!641721 tp_is_empty!28347)))

(declare-fun mapIsEmpty!44338 () Bool)

(assert (=> mapIsEmpty!44338 mapRes!44338))

(declare-fun bm!47731 () Bool)

(assert (=> bm!47731 (= call!47734 (getCurrentListMapNoExtraKeys!4438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127490 () Bool)

(declare-fun -!1139 (ListLongMap!15869 (_ BitVec 64)) ListLongMap!15869)

(assert (=> b!1127490 (= e!641718 (= call!47733 (-!1139 call!47734 k0!934)))))

(declare-fun mapNonEmpty!44338 () Bool)

(declare-fun tp!84155 () Bool)

(assert (=> mapNonEmpty!44338 (= mapRes!44338 (and tp!84155 e!641721))))

(declare-fun mapKey!44338 () (_ BitVec 32))

(declare-fun mapValue!44338 () ValueCell!13464)

(declare-fun mapRest!44338 () (Array (_ BitVec 32) ValueCell!13464))

(assert (=> mapNonEmpty!44338 (= (arr!35431 _values!996) (store mapRest!44338 mapKey!44338 mapValue!44338))))

(declare-fun b!1127491 () Bool)

(assert (=> b!1127491 (= e!641719 tp_is_empty!28347)))

(declare-fun b!1127492 () Bool)

(declare-fun res!753451 () Bool)

(assert (=> b!1127492 (=> (not res!753451) (not e!641727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127492 (= res!753451 (validMask!0 mask!1564))))

(assert (= (and start!98116 res!753449) b!1127492))

(assert (= (and b!1127492 res!753451) b!1127487))

(assert (= (and b!1127487 res!753446) b!1127486))

(assert (= (and b!1127486 res!753444) b!1127484))

(assert (= (and b!1127484 res!753450) b!1127477))

(assert (= (and b!1127477 res!753443) b!1127483))

(assert (= (and b!1127483 res!753448) b!1127479))

(assert (= (and b!1127479 res!753454) b!1127476))

(assert (= (and b!1127476 res!753442) b!1127478))

(assert (= (and b!1127478 res!753453) b!1127475))

(assert (= (and b!1127475 (not res!753445)) b!1127481))

(assert (= (and b!1127481 (not res!753452)) b!1127488))

(assert (= (and b!1127488 c!109716) b!1127490))

(assert (= (and b!1127488 (not c!109716)) b!1127482))

(assert (= (or b!1127490 b!1127482) bm!47730))

(assert (= (or b!1127490 b!1127482) bm!47731))

(assert (= (and b!1127488 (not res!753447)) b!1127485))

(assert (= (and b!1127480 condMapEmpty!44338) mapIsEmpty!44338))

(assert (= (and b!1127480 (not condMapEmpty!44338)) mapNonEmpty!44338))

(get-info :version)

(assert (= (and mapNonEmpty!44338 ((_ is ValueCellFull!13464) mapValue!44338)) b!1127489))

(assert (= (and b!1127480 ((_ is ValueCellFull!13464) mapDefault!44338)) b!1127491))

(assert (= start!98116 b!1127480))

(declare-fun b_lambda!18787 () Bool)

(assert (=> (not b_lambda!18787) (not b!1127481)))

(declare-fun t!35479 () Bool)

(declare-fun tb!8629 () Bool)

(assert (=> (and start!98116 (= defaultEntry!1004 defaultEntry!1004) t!35479) tb!8629))

(declare-fun result!17819 () Bool)

(assert (=> tb!8629 (= result!17819 tp_is_empty!28347)))

(assert (=> b!1127481 t!35479))

(declare-fun b_and!38419 () Bool)

(assert (= b_and!38417 (and (=> t!35479 result!17819) b_and!38419)))

(declare-fun m!1041247 () Bool)

(assert (=> b!1127488 m!1041247))

(declare-fun m!1041249 () Bool)

(assert (=> b!1127488 m!1041249))

(declare-fun m!1041251 () Bool)

(assert (=> b!1127478 m!1041251))

(declare-fun m!1041253 () Bool)

(assert (=> b!1127481 m!1041253))

(declare-fun m!1041255 () Bool)

(assert (=> b!1127481 m!1041255))

(declare-fun m!1041257 () Bool)

(assert (=> b!1127481 m!1041257))

(declare-fun m!1041259 () Bool)

(assert (=> b!1127481 m!1041259))

(declare-fun m!1041261 () Bool)

(assert (=> b!1127490 m!1041261))

(declare-fun m!1041263 () Bool)

(assert (=> bm!47731 m!1041263))

(assert (=> b!1127485 m!1041263))

(assert (=> b!1127485 m!1041263))

(declare-fun m!1041265 () Bool)

(assert (=> b!1127485 m!1041265))

(declare-fun m!1041267 () Bool)

(assert (=> mapNonEmpty!44338 m!1041267))

(declare-fun m!1041269 () Bool)

(assert (=> b!1127492 m!1041269))

(declare-fun m!1041271 () Bool)

(assert (=> b!1127479 m!1041271))

(declare-fun m!1041273 () Bool)

(assert (=> b!1127475 m!1041273))

(declare-fun m!1041275 () Bool)

(assert (=> b!1127475 m!1041275))

(declare-fun m!1041277 () Bool)

(assert (=> bm!47730 m!1041277))

(declare-fun m!1041279 () Bool)

(assert (=> b!1127483 m!1041279))

(declare-fun m!1041281 () Bool)

(assert (=> b!1127476 m!1041281))

(declare-fun m!1041283 () Bool)

(assert (=> b!1127476 m!1041283))

(declare-fun m!1041285 () Bool)

(assert (=> b!1127486 m!1041285))

(declare-fun m!1041287 () Bool)

(assert (=> start!98116 m!1041287))

(declare-fun m!1041289 () Bool)

(assert (=> start!98116 m!1041289))

(declare-fun m!1041291 () Bool)

(assert (=> b!1127484 m!1041291))

(check-sat (not b!1127485) (not b!1127478) (not b!1127476) (not b!1127486) (not bm!47731) (not start!98116) (not b!1127492) (not b_lambda!18787) (not b!1127483) (not mapNonEmpty!44338) (not bm!47730) (not b!1127475) (not b!1127484) tp_is_empty!28347 b_and!38419 (not b_next!23817) (not b!1127490) (not b!1127488) (not b!1127481))
(check-sat b_and!38419 (not b_next!23817))
